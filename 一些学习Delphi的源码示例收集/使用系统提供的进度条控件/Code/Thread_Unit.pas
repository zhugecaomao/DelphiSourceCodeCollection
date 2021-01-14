unit Thread_Unit;

interface

procedure Create_SubThread;
procedure Quit_SubThread;

implementation

uses
  Windows, Messages, Public_Unit;

var
  SubThreadID: Longword;   // 子线程ID
  TimerHandle: Longword;   // 时钟句柄
  Leftway: Boolean=False;  // 方向标志

     // 时钟回调函数
procedure TimerProc(hwnd: HWND; uMsg: UINT; idEvent: UINT; dwTime: DWORD ); stdcall;
begin
   if ContinueAdd=False then Exit;
       // 增加一步长单位长度
  SendMessage(StatusHandle, PBM_STEPIT, 0, 0);
       // 进度条长度是否已满
  if SendMessage(StatusHandle, PBM_GETPOS, 0, 0)=33 then
  begin
    sleep(600);  Leftway := not Leftway;  // 进度条方向取反
    if Leftway then
      SetWindowLong(StatusHandle,GWL_EXSTYLE, GetWindowLong(StatusHandle, GWL_EXSTYLE) or WS_EX_LAYOUTRTL)
    else
      SetWindowLong(StatusHandle,GWL_EXSTYLE, GetWindowLong(StatusHandle, GWL_EXSTYLE) and not WS_EX_LAYOUTRTL);
  end;
end;

    // 线程体函数
procedure SubThreadPro; stdcall;
var
  SubMessage: TMSG;
begin
  TimerHandle := SetTimer(0, 0, 30, @TimerProc);
  while GetMessage(SubMessage, 0, 0, 0) do DispatchMessage(SubMessage);
  KillTimer(TimerHandle, 0);
end;

    // 建立新线程
procedure Create_SubThread;
begin
  CreateThread(nil, 0, @SubThreadPro, nil, 0, SubThreadID);
end;
    // 退出子线程
procedure Quit_SubThread;
begin
  PostThreadMessage(SubThreadID, WM_QUIT, 0, 0);
end;

{ 注. 在新线程中安装时钟,是为了给窗体线程减负,以免
 大量WM_TIMER导致其他消息响应缓慢(比如:拖拽标题栏) }

end.
