program EnumDemo;

{$R '..\Other\LiuMazi.res' '..\Other\LiuMazi.txt'}

uses
  Windows, Enum_Unit in 'Enum_Unit.pas',
  Public_Unit in 'Public_Unit.pas',
  Window_Unit in 'Window_Unit.pas',
  Button_Unit in 'Button_Unit.pas',
  ListView_Unit in 'ListView_Unit.pas';

var
  ThreadMessage: TMsg;  
  
//----------主程序-------
begin
  Create_Window;  //------建立窗体------
  Create_Button;  //------建立按钮------
  Create_ListView;//------建立LIST------
 //--------消息循环---------
  while GetMessage(ThreadMessage, 0, 0, 0) do
  begin
    TranslateMessage(ThreadMessage);// 翻译键消息为字符消息
    DispatchMessage(ThreadMessage); // 分发消息至窗体处理过程
  end;
end.
