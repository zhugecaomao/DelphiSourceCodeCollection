
// Module name: SomeLib.C & SomeLib.H ->> SomeLib.dpr
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

library SomeLib;

{$R 'SomeLib.res' 'SomeLib.rc'}

uses
  Windows, Messages;

const
  IDS_STRINGFIRST = 1000;
  IDS_STRINGLAST = IDS_STRINGFIRST + 9;
  IDS_STRINGNUM = IDS_STRINGLAST - IDS_STRINGFIRST + 1;

const
  RESSTR_SIZE = 1000 * SizeOf(Char);

var
  g_hMutex: THandle = 0; // 互斥对象
  g_dwTlsIndex: DWORD = TLS_OUT_OF_INDEXES; // TLS索引

  // 读取资源字符串
function LoadResString(): PChar;
const {$J+}
  nStringId: Integer = 0; {$J-}
var
  lpszStr: PChar;
begin
  lpszStr := TlsGetValue(g_dwTlsIndex);
  if (lpszStr = nil) then
  begin
    lpszStr := HeapAlloc(GetProcessHeap(), 0, RESSTR_SIZE);
    TlsSetValue(g_dwTlsIndex, lpszStr);
  end;

  WaitForSingleObject(g_hMutex, INFINITE);
  LoadString(HInstance, IDS_STRINGFIRST + nStringId, lpszStr, RESSTR_SIZE);
  nStringId := (nStringId + 1) mod IDS_STRINGNUM;
  ReleaseMutex(g_hMutex);

  Result := lpszStr;
end;

  // DLL回调
procedure Dll_Proc(dwReason: DWORD);
var
  lpszStr: PChar;
begin
  case (dwReason) of
    DLL_PROCESS_ATTACH: // 进入进程 (由调用LoadLibrary的线程调用)
      begin
        g_dwTlsIndex := TlsAlloc();
        if (g_dwTlsIndex = TLS_OUT_OF_INDEXES) then
        begin
          ExitCode := 1; // DLLMain返回FALSE
          Exit;
        end;

        g_hMutex := CreateMutex(nil, FALSE, nil);
        if (g_hMutex = 0) then
        begin
          ExitCode := 1; // 从而阻止成功装载
          Exit;
        end;
      end;

    DLL_THREAD_DETACH: // 线程结束 (由调用ExitThread的线程调用)
      begin
        if (g_dwTlsIndex <> TLS_OUT_OF_INDEXES) then
        begin
          lpszStr := TlsGetValue(g_dwTlsIndex);
          if (lpszStr <> nil) then HeapFree(GetProcessHeap(), 0, lpszStr);
        end;
      end;

    DLL_PROCESS_DETACH: // 离开进程 (由调用FreeLibrary的线程调用)
      begin
        if (g_dwTlsIndex <> TLS_OUT_OF_INDEXES) then
        begin
          lpszStr := TlsGetValue(g_dwTlsIndex);
          if (lpszStr <> nil) then HeapFree(GetProcessHeap(), 0, lpszStr);

          TlsFree(g_dwTlsIndex);
        end;

        if (g_hMutex <> 0) then CloseHandle(g_hMutex);
      end;
  end;
end;

  // 导出函数
exports
  LoadResString;

  // DLLMain
begin
  DllProc := @Dll_Proc;
  Dll_Proc(DLL_PROCESS_ATTACH);
end.
