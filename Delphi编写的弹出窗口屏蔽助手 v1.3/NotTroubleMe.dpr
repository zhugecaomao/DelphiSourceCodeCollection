program NotTroubleMe;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {Form1},
  cFrmunit in 'cFrmunit.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
