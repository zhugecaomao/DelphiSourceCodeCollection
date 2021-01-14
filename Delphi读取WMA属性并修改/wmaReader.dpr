program wmaReader;

uses
  Forms,
  UtilMain in 'UtilMain.pas' {Form1},
  Util2 in 'Util2.pas' {Form2},
  ClsWmaOpter in 'Cls\ClsWmaOpter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
