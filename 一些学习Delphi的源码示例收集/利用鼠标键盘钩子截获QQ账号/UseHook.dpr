program UseHook;

uses Windows;
               
var Msg: TMsg;

procedure HookOn();  external 'HookDLL.dll'; // 安装钩子
procedure HookOff(); external 'HookDLL.dll'; // 删除钩子

begin
 // 安装钩子
  HookOn();

 // 防止退出
  while GetMessage(Msg, 0, 0, 0) do ;

 // 此句无用
  HookOff();
end.

