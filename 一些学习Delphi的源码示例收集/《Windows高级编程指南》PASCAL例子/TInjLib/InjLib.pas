
// Module name: InjLib.C & InjLib.H ->> InjLib.pas
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

unit InjLib;

interface

uses Windows;

function InjectLibA(hProcess: THandle; const lpszLibFile: PAnsiChar): BOOL; stdcall;
function InjectLibW(hProcess: THandle; const lpszLibFile: PWideChar): BOOL; stdcall;

implementation

uses ProcMem, Other;

  // 调用约定
type
  PfnLoadLibrary = function (lpLibFileName: PByte): HMODULE; stdcall;
  PfnFreeLibrary = function (hLibModule: HMODULE): BOOL; stdcall;

  // 线程参数
type
  PInjLibInfo = ^TInjLibInfo;
  TInjLibInfo = record
    fnLoadLibrary: PfnLoadLibrary;
    fnFreeLibrary: PfnFreeLibrary;
    pbLibFile: array[0 .. MAX_PATH * SizeOf(WideChar)] of Byte;
  end;

  // 待复制的线程代码
function ThreadFunc(var pInjLibInfo: TInjLibInfo): DWORD; stdcall;
begin
  // 装载指定链接库
  Result := pInjLibInfo.fnLoadLibrary(@pInjLibInfo.pbLibFile);

  // 装载成功后释放
  if (Result <> 0) then pInjLibInfo.fnFreeLibrary(Result);
end;

  // 帮助计算代码长度
procedure AfterThreadFunc();
begin
end;

  // 创建远程线程 (由该线程载入指定DLL)
function InjectLibWorA(hProcess: THandle; pbLibFile: PByte; fUnicode: BOOL): BOOL;
label
  _Finally;
var
  hInstKrnl, hInstDllRemote: HMODULE;
  InjLibInfo: TInjLibInfo;
  pdwCodeRemote: PDWORD;
  pInjLibInfoRemote: PInjLibInfo;
  cbCodeSize, dwNumBytesXferred, dwThreadId, cbMemSize, dwOldProtect: DWORD;
  hThread: THandle;
  fOk: BOOL;
begin
  hThread := 0;
  hInstDllRemote := 0;
  
  // 代码与数据长度
  cbCodeSize := DWORD(@AfterThreadFunc) - DWORD(@ThreadFunc);
  cbMemSize := cbCodeSize + SizeOf(InjLibInfo) + 3;

  // 填写InjLibInfo
  hInstKrnl := GetModuleHandle('Kernel32');
  InjLibInfo.fnLoadLibrary := GetProcAddress(hInstKrnl, IfThen(fUnicode, 'LoadLibraryW', 'LoadLibraryA'));
  InjLibInfo.fnFreeLibrary := GetProcAddress(hInstKrnl, 'FreeLibrary');
  InjLibInfo.pbLibFile[0] := 0;
  if (fUnicode) then
    lstrcpyW(PWideChar(@InjLibInfo.pbLibFile), PWideChar(pbLibFile))
  else
    lstrcpyA(PAnsiChar(@InjLibInfo.pbLibFile), PAnsiChar(pbLibFile));

  // 分配足够的内存 (在指定进程空间)
  pdwCodeRemote := AllocProcessMemory(hProcess, cbMemSize);
  if (pdwCodeRemote = nil) then goto _Finally;

  // 页面保护属性
  fOk := VirtualProtectEx(hProcess, pdwCodeRemote, cbMemSize, PAGE_EXECUTE_READWRITE, dwOldProtect);
  if (fOk = FALSE) then goto _Finally;

  // 写入线程代码
  fOk := WriteProcessMemory(hProcess, pdwCodeRemote, @ThreadFunc, cbCodeSize, dwNumBytesXferred);
  if (fOk = FALSE) then goto _Finally;

  // 对齐结构地址 **                                    
  pInjLibInfoRemote := Pointer(DWORD(pdwCodeRemote) + (cbCodeSize + 3) and (not 3));

  // 写入结构变量
  fOk := WriteProcessMemory(hProcess, pInjLibInfoRemote, @InjLibInfo, SizeOf(InjLibInfo), dwNumBytesXferred);
  if (fOk = FALSE) then goto _Finally;

  // 启动远程线程
  hThread := CreateRemoteThread(hProcess, nil, 0, pdwCodeRemote, pInjLibInfoRemote, 0, dwThreadId);
  if (hThread = 0) then goto _Finally;

  // 等待线程结束
  WaitForSingleObject(hThread, INFINITE);

_Finally:
  if (hThread <> 0) then
  begin
    GetExitCodeThread(hThread, hInstDllRemote); // 线程退出代码 = 线程函数返回值 = DLL装载地址
    CloseHandle(hThread);
  end;

  // 释放远程内存
  if (pdwCodeRemote <> nil) then FreeProcessMemory(hProcess, pdwCodeRemote);

  // 是否载入成功
  Result := (hInstDllRemote <> 0);
end;

  // 远程装载DLL(Anis版)
function InjectLibA(hProcess: THandle; const lpszLibFile: LPCSTR): BOOL; stdcall;
begin
  Result := InjectLibWorA(hProcess, PByte(lpszLibFile), FALSE);
end;

  // 远程装载DLL(Wide版)
function InjectLibW(hProcess: THandle; const lpszLibFile: LPCWSTR): BOOL; stdcall;
begin
  Result := InjectLibWorA(hProcess, PByte(lpszLibFile), TRUE);
end;

end.
