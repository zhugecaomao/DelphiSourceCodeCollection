program Welcome;               //指出可执行文件名

uses                           //显示包括在工程中的文件
  Forms,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}                     //$R语句是编译器指令

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
