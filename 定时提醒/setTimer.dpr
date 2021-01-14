program setTimer;

uses
  Forms,
  timer in 'timer.pas' {Form1},
  printscreen in 'printscreen.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '∂® ±Ã·–—';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
