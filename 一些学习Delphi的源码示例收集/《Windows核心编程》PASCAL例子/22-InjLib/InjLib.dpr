program InjLib;

{$R 'InjLib.res' 'InjLib.rc'}

uses
  Windows, Messages, TlHelp32, SysUtils;

const
  IDD_INJLIB    =   1;
  IDC_INJECT    = 100;
  IDC_PROCESSID = 101;
  IDI_INJLIB    = 101;

function PathFileExists(pszPath: PChar): BOOL; stdcall; external 'shlwapi.dll' Name 'PathFileExistsA';

  // DLL远程装载WideChar版
function InjectLibW(dwProcessId: DWORD; pszLibFile: LPCWSTR): BOOL; stdcall;
var
  hProcess, hThread: THandle;
  pszLibFileRemote: LPWSTR;
  cch, cb: Integer;
  pfnThreadRtn: TFNThreadStartRoutine;
begin
  Result := FALSE;
  hProcess := 0;
  hThread := 0;
  pszLibFileRemote := nil;

  try
    // 打开指定进程操作句柄
    hProcess := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_CREATE_THREAD or
      PROCESS_VM_OPERATION or PROCESS_VM_WRITE, FALSE, dwProcessId);
    if (hProcess = 0) then Abort();

    // 路径字符串(字节)长度
    cch := 1 + lstrlenW(pszLibFile);
    cb  := cch * SizeOf(WideChar);

    // 为路径字符串分配内存
    pszLibFileRemote := VirtualAllocEx(hProcess, nil, cb, MEM_COMMIT, PAGE_READWRITE);
    if (pszLibFileRemote = nil) then Abort();

    // 复制路径串至目标进程
    if (WriteProcessMemory(hProcess, pszLibFileRemote, pszLibFile, cb, PDWORD(nil)^) = FALSE) then Abort();

    // 定位LoadLibraryW函数
    pfnThreadRtn := GetProcAddress(GetModuleHandle(Kernel32), 'LoadLibraryW');
    if (pfnThreadRtn = nil) then Abort();

    // 建立LoadLibraryW线程
    hThread := CreateRemoteThread(hProcess, nil, 0, pfnThreadRtn, pszLibFileRemote, 0, PDWORD(nil)^);
    if (hThread = 0) then Abort();

    // 挂起等待远程线程结束
    Result := (WaitForSingleObject(hThread, INFINITE) = WAIT_OBJECT_0);
  except
  end;

  if (pszLibFileRemote <> nil) then VirtualFreeEx(hProcess, pszLibFileRemote, 0, MEM_RELEASE);
  if (hThread <> 0) then CloseHandle(hThread);
  if (hProcess <> 0) then CloseHandle(hProcess);
end;

  // DLL远程装载AnsiChar版
function InjectLibA(dwProcessId: DWORD; pszLibFile: LPCSTR): BOOL; stdcall;
var
  pszLibFileW: LPWSTR;
begin
  GetMem(pszLibFileW, (lstrlenA(pszLibFile) + 1) * SizeOf(WideChar));

  // ANSI串 -> Unicode
  wvsprintfW(pszLibFileW, '%S', @pszLibFile);

  // 调用WideChar版函数
  Result := InjectLibW(dwProcessId, pszLibFileW);

  FreeMem(pszLibFileW);
end;

  // DLL远程释放WideChar版
function EjectLibW(dwProcessId: DWORD; pszLibFile: LPCWSTR): BOOL; stdcall;
var
  hthSnapshot, hProcess, hThread: THandle;
  me: TModuleEntry32W;
  fMoreMods: BOOL;
  pfnThreadRtn: TFNThreadStartRoutine;
begin
  Result := FALSE;
  hthSnapshot := MAXDWORD;
  hProcess := 0;
  hThread := 0;

  try
    // 快照模块列表
    hthSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPMODULE, dwProcessId);
    if (hthSnapshot = MAXDWORD) then Abort();

    // 寻找指定模块
    me.dwSize := SizeOf(TModuleEntry32W);
    fMoreMods := Module32FirstW(hthSnapshot, me);
    while fMoreMods do
    begin
      if (lstrcmpiW(me.szModule, pszLibFile) = 0) or (lstrcmpiW(me.szExePath, pszLibFile) = 0) then Break;
      fMoreMods := Module32NextW(hthSnapshot, me);
    end;
    if (fMoreMods = FALSE) then Abort();

    // 进程操作句柄
    hProcess := OpenProcess(PROCESS_QUERY_INFORMATION or
      PROCESS_CREATE_THREAD or PROCESS_VM_OPERATION, FALSE, dwProcessId);
    if (hProcess = 0) then Abort();

    // 定位FreeLibrary
    pfnThreadRtn := GetProcAddress(GetModuleHandle(Kernel32), 'FreeLibrary');
    if (pfnThreadRtn = nil) then Abort();

    // 建立远程线程
    hThread := CreateRemoteThread(hProcess, nil, 0, pfnThreadRtn, me.modBaseAddr, 0, PDWORD(nil)^);
    if (hThread = 0) then Abort();

    // 等待线程结束
    Result := (WaitForSingleObject(hThread, INFINITE) = WAIT_OBJECT_0);
  except
  end;

  if (hthSnapshot <> MAXDWORD) then CloseHandle(hthSnapshot);
  if (hThread <> 0) then CloseHandle(hThread);
  if (hProcess <> 0) then CloseHandle(hProcess);
end;

  // DLL远程释放AnsiChar版
function EjectLibA(dwProcessId: DWORD; pszLibFile: LPCSTR): BOOL; stdcall;
var
  pszLibFileW: LPWSTR;
begin
  GetMem(pszLibFileW, (lstrlenA(pszLibFile) + 1) * SizeOf(WideChar));

  // ANSI串 -> Unicode
  wvsprintfW(pszLibFileW, '%S', @pszLibFile);

  // 调用WideChar版函数
  Result := EjectLibW(dwProcessId, pszLibFileW);

  FreeMem(pszLibFileW);
end;

  // WM_INITDIALOG处理
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  SendMessage(hWnd, WM_SETICON, ICON_BIG, LoadIcon(HInstance, MakeIntResource(IDI_INJLIB)));
  SendMessage(hWnd, WM_SETICON, ICON_SMALL, LoadIcon(HInstance, MakeIntResource(IDI_INJLIB)));
  Result := TRUE;
end;

  // WM_COMMAND处理
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
var
  dwProcessId: DWORD;
  szLibFile: array[0..MAX_PATH] of Char;
  pCharEnd: PChar;
begin
  case (id) of
    IDCANCEL:   // 关闭
      begin
        EndDialog(hWnd, id);
      end;

    IDC_INJECT: // 装载
      begin
        dwProcessId := GetDlgItemInt(hWnd, IDC_PROCESSID, PBOOL(nil)^, FALSE);
        if (dwProcessId = 0) then dwProcessId := GetCurrentProcessId();

        pCharEnd := @szLibFile[0];
        Inc(pCharEnd, GetModuleFileName(0, pCharEnd, MAX_PATH));
        if (pCharEnd = @szLibFile[0]) then
        begin
          MessageBox(hWnd, 'GetModuleFileName failure', 'InjLib', MB_OK);
          Exit;
        end;

        while (pCharEnd^ <> '\') and (pCharEnd > @szLibFile[0]) do Dec(pCharEnd);
        pCharEnd^ := #0;
        while (pCharEnd^ <> '\') and (pCharEnd > @szLibFile[0]) do Dec(pCharEnd);
        if (pCharEnd = @szLibFile[0]) then
        begin
          MessageBox(hWnd, 'Can not find the ..\22-ImgWalk\', 'InjLib', MB_OK);
          Exit;
        end;

        lstrcpy(pCharEnd, '\22-ImgWalk\ImgWalk.dll');
        if (PathFileExists(szLibFile) = FALSE) then
        begin
          lstrcat(szLibFile, ' is not Exist');
          MessageBox(hWnd, szLibFile, 'InjLib', MB_OK);
          Exit;
        end;

        if InjectLibA(dwProcessId, szLibFile) and EjectLibA(dwProcessId, szLibFile) then
          MessageBox(hWnd, 'DLL Injection/Ejection successful', 'InjLib', MB_OK)
        else
          MessageBox(hWnd, 'DLL Injection/Ejection failed', 'InjLib', MB_OK);
      end;
  end;
end;

  // 对话框回调
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  Result := FALSE;
  
  case (uMsg) of
    WM_INITDIALOG:
      Result := SetWindowLong(hWnd, DWL_MSGRESULT, Longint(Dlg_OnInitDialog(hWnd, wParam, lParam))) <> 0;

    WM_COMMAND:
      Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));
  end;
end;

  // 程序入口
var
  vi: TOSVersionInfo;
begin
  vi.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  GetVersionEx(vi);

  if (vi.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS) then
    MessageBox(0, 'This application requires features not present in Windows 9x.', 'InjLib', MB_OK)
  else
    DialogBox(HInstance, MakeIntResource(IDD_INJLIB), 0, @Dlg_Proc);
end.
