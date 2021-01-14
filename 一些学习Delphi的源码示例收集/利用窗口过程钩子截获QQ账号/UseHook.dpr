program UseHook;

uses Windows;

var Msg: TMsg;

procedure HookOn(); external 'HookDLL.dll';
procedure HookOff(); external 'HookDLL.dll';

begin
  HookOn();
  while GetMessage(Msg, 0, 0, 0) do ;
  HookOff();
end.

