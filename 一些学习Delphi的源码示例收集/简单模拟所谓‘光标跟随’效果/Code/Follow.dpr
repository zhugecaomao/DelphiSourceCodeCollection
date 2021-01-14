program Follow;

{$R '..\Other\LiuMazi.res' '..\Other\LiuMazi.txt'}

uses
  Windows, Timer in 'Timer.pas',
  MainWindow in 'MainWindow.pas',
  HintWindow in 'HintWindow.pas';

var  
  Msg: TMsg;

begin
  while GetMessage(Msg, 0, 0, 0) do
  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end.
