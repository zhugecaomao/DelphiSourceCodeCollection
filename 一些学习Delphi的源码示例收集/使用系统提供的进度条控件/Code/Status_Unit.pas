unit Status_Unit;

interface

procedure Create_Status;

implementation

uses
  Windows, Messages, Public_Unit, Menu_Unit;

var
  Old_StatusProc  : Pointer;    // 过程指针
  HandCursorHandle: Longword;   // 光标句柄

    // 自定义进度条窗口过程
function StatusProc(WinHanlde, MessageID, WParam, LParam: LongWord): Longint; stdcall;
begin
 //....调用默认窗体过程....
  Result := CallWindowProc(Old_StatusProc, WinHanlde , MessageID, wParam, lParam);
 //....模拟在主窗体标题栏按下....
  if (MessageID = WM_LBUTTONDOWN) then SendMessage(WindowHandle, WM_NCLBUTTONDOWN, HTCAPTION, LParam)
  else if (MessageID = WM_RBUTTONDOWN) then PopupTheMenu;
 //....重新设置鼠标光标....
  SetCursor(HandCursorHandle);
end;

   // 建立进度条控件
procedure Create_Status;
begin
  StatusHandle := CreateWindowEx(0, 'msctls_progress32', '',
                                WS_CHILD or WS_VISIBLE,
                                -1, -1, 230, 15, WindowHandle,
                                0, hInstance, nil);
  if (StatusHandle = 0) then
  begin
    MessageBox(WindowHandle, 'Create Status error !!', nil, 0);
    PostQuitMessage(0);
  end;
  HandCursorHandle := LoadCursor(0, IDC_HAND);                   // 手形光标
  SendMessage(StatusHandle, PBM_SETBKCOLOR, 0, RGB(0, 0, 0));    // 背景黑色
  SendMessage(StatusHandle, PBM_SETBARCOLOR, 0, RGB(0, 0, 255)); // 进度条蓝色
  SendMessage(StatusHandle, PBM_SETRANGE, 0, MakeLParam(0, 33)); // 设置范围
  SendMessage(StatusHandle, PBM_SETSTEP, 1, 0);                  // 设置步长
  Old_StatusProc := Pointer( SetWindowLong(StatusHandle,         // 新处理过程
                            GWL_WNDPROC, LongWord(@StatusProc)) );
end;

end.
