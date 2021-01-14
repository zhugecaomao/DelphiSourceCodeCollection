program GameLogin;

uses
  Windows,
  Forms,
  Main in 'Main.pas' {MainForm},
  grobal2 in 'Grobal2.pas',
  HUtil32 in 'HUtil32.pas',
  Share in 'Share.pas',
  CMain in 'CMain.pas' {frmCMain},
  ObjectBase in 'ObjectBase.pas',
  SecrchInfoMain in 'SecrchInfoMain.pas' {SecrchFrm},
  LChgPassword in 'LChgPassword.pas' {frmChangePassword},
  LGetBackPassword in 'LGetBackPassword.pas' {frmGetBackPassword},
  LNewAccount in 'LNewAccount.pas' {frmNewAccount},
  CLogin in 'CLogin.pas' {frmLogin},
  LEditGame in 'LEditGame.pas' {frmEditGame};

{$R *.res}
begin
  Application.Initialize;
  Application.Title := '´«ÆæµÇÂ½Æ÷';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TfrmChangePassword, frmChangePassword);
  Application.CreateForm(TfrmGetBackPassword, frmGetBackPassword);
  Application.CreateForm(TfrmNewAccount, frmNewAccount);
  Application.Run;
end.
