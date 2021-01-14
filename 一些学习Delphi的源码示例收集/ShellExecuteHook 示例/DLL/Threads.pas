unit Threads;

interface

procedure ThreadPro(X: Integer); stdcall; // 线程函数

implementation

uses Windows, Messages, WinUnit;

  // 线程函数
procedure ThreadPro(X: Integer); stdcall;
var
  ModuleFileName: array [0..MAX_PATH] of Char;
  Msg: TMsg;
  ContinueLoop: Boolean;
begin
 // 防止重复
  if (FindWindow('Liu_mazi', 'ShellExecuteHook') <> 0) then Exit;

 // 注册窗口类
  RegWinClass();
  
 // 建立窗口
  CreateMyWin();

 // 增加计数
  ModuleFileName[GetModuleFileName(HInstance, @ModuleFileName[0], MAX_PATH)] := #0;
  LoadLibrary(@ModuleFileName[0]);

 // 消息循环
  ContinueLoop := TRUE;
  while ContinueLoop do
  begin
    if not PeekMessage(Msg, 0, 0, 0, PM_REMOVE) then // 未取到消息
      WaitMessage() // 挂起, 直至有消息进入队列
    else begin
      if (Msg.message = WM_QUIT) then
        ContinueLoop := FALSE // 停止循环
      else begin
        TranslateMessage(Msg); // 转换
        DispatchMessage(Msg);  // 分发
      end;
    end;
  end;

 // 注销窗口类  
  DesWinClass();

 // 减少计数
  FreeLibraryAndExitThread(HInstance, 66);
end;

end.
