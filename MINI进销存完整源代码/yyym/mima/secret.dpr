program secret;

uses
  Forms,
  login in 'login.pas' {loginform},
  md5 in 'md5.pas',
  setsec in 'setsec.pas' {SetsecForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tloginform, loginform);
  Application.CreateForm(TSetsecForm, SetsecForm);
  Application.Run;
end.
