
// Module name: ProcMem.C & ProcMem.H ->> ProcMem.pas
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

unit ProcMem;

interface

uses Windows;

function AllocProcessMemory(hProcess: THandle; dwNumBytes: DWORD): Pointer;
function FreeProcessMemory(hProcess: THandle; pvMem: Pointer): BOOL;

implementation

  // 分配远程内存
function AllocProcessMemory(hProcess: THandle; dwNumBytes: DWORD): Pointer;
label
  Finally_;
var
  Context: TContext;
  dwThreadId, dwNumBytesXferred, dwError: DWORD;
  hThread, hInstKrnl: THandle;
  mbi: TMemoryBasicInformation;
  fOk: BOOL;
begin
  hInstKrnl := GetModuleHandle(Kernel32);
  fOk := FALSE;
  Result := nil;

  // 建立一个挂起的线程 (在它结束之前, 其堆栈空间一直可用)
  hThread := CreateRemoteThread(hProcess, nil, dwNumBytes + SizeOf(THandle),
    GetProcAddress(hInstKrnl, 'ExitThread'), nil, CREATE_SUSPENDED, dwThreadId);
  if (hThread = 0) then
  begin
    dwError := GetLastError();
    goto Finally_;
  end;

  // 读取远程线程环境块
  Context.ContextFlags := CONTEXT_CONTROL or CONTEXT_INTEGER;
  if (GetThreadContext(hThread, Context) = FALSE) then goto Finally_;

  // 查询栈顶指针处页面
  fOk := VirtualQueryEx(hProcess, Pointer(Context.Esp - SizeOf(DWORD)), mbi, SizeOf(mbi)) = SizeOf(mbi);
  if (fOk = FALSE) then goto Finally_;

  // 已提交堆栈页面顶部
  Result := mbi.BaseAddress;

  // 第一个DWORD保存线程句柄
  fOk := WriteProcessMemory(hProcess, Result, @hThread, SizeOf(hThread), dwNumBytesXferred);
  if (fOk = FALSE) then goto Finally_;

  Inc(PHandle(Result));

Finally_:
  if (fOk = FALSE) then
  begin
    if (hThread <> 0) then
    begin
      ResumeThread(hThread);
      CloseHandle(hThread);
    end;
    Result := nil;
  end;  
end;

  // 释放远程内存
function FreeProcessMemory(hProcess: THandle; pvMem: Pointer): BOOL;
var
  hThread: THandle;
  dwNumBytesXferred: DWORD;
begin
  // 读取线程句柄
  Dec(PHandle(pvMem));
  Result := ReadProcessMemory(hProcess, pvMem, @hThread, SizeOf(hThread), dwNumBytesXferred);

  // 恢复线程执行 (使其得以结束, 并且堆栈空间被释放)
  if (Result) then
  begin
    if (ResumeThread(hThread) = $FFFFFFFF) then Result := FALSE;
    CloseHandle(hThread);
  end;
end;

end.

