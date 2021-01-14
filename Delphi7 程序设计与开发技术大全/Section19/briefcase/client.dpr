program client;

uses
  Forms,
  clntfrm in 'clntfrm.pas' {Form1},
  recerror in '..\..\..\ObjRepos\recerror.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
