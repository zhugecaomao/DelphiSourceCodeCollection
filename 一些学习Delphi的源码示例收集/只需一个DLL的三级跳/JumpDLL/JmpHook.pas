unit JmpHook;

interface

procedure GetMsgHookOn;
procedure GetMsgHookOff;

implementation

uses
  Windows, Publics;

var
  GetMsgHook: HHOOK;     // 钩子句柄
  LibraryH: DWORD;       // 链接库句柄
  ThreadPt: Pointer;     // 线程函数
  ThreadID: DWORD;       // 返回线程ID
  ModuleFileName: array [0..MAX_PATH] of Char;
  
   // GetMessage钩子回调函数
function GetMsgHookPro(nCode: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
begin
  if (PtNode <> nil) and (PtNode^.ExplorerID <> 0) and
     (GetCurrentProcessId() = PtNode^.ExplorerID) then // 处于Explorer进程
  begin
  // 装载自己增加计数
    GetModuleFileName(HInstance, @ModuleFileName[0], MAX_PATH);
    LibraryH := LoadLibrary(ModuleFileName);

  // 定位DLL中线程函数
    if (LibraryH <> 0) then ThreadPt := GetProcAddress(LibraryH, 'ThreadPro');

  // 创建Explorer线程
    if (ThreadPt <> nil) then CreateThread(nil, 0, ThreadPt, Pointer($66666666), 0, ThreadID);
  end;
  
  Result:= CallNextHookEx(GetMsgHook, nCode, wParam, lParam);  
end;

procedure GetMsgHookOn;
begin
  GetMsgHook := SetWindowsHookEx(WH_GETMESSAGE, @GetMsgHookPro, HInstance, 0);
end;

procedure GetMsgHookOff;
begin
  UnHookWindowsHookEx(GetMsgHook);
end;

end.
