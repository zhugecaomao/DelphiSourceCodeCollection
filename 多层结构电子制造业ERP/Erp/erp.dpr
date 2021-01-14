program erp;

uses
  Forms,
  fMain in 'fMain.pas' {frmMain},
  fLogin in 'fLogin.pas' {frmLogin},
  fSplash in 'fSplash.pas' {frmSplash},
  fDM in 'fDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'erp管理系统 ver1.0';
  frmSplash:=TfrmSplash.Create(Application);
  frmSplash.Show;
  frmSplash.Update;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
