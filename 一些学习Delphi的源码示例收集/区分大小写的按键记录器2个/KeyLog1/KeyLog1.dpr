program KeyLog1;

uses Windows;

procedure  HookOn(); external 'KeyHook.dll';
procedure HookOff(); external 'KeyHook.dll';

var Msg: TMsg;

begin
  HookOn();  // 挂钩
  while GetMessage(Msg, 0, 0, 0) do; // 阻止程序退出
  HookOff(); // 脱钩

  (* GetMessage()的真实目的只是为了阻塞线程, 而后面的HookOff()并无机会执行到 *)
end.