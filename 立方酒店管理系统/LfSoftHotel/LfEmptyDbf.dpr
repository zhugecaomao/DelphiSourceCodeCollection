program LfEmptyDbf;

uses
  Forms,
  C_EmptyDbf in 'C_EmptyDbf.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
