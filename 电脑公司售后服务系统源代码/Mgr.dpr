program Mgr;

uses
  Forms,
  Main in 'Main.pas' {FrmMain},
  Login in 'Login.pas' {FrmLogin},
  About in 'About.pas' {FrmAbout},
  UserSetup in 'UserSetup.pas' {FrmUserSetup},
  SystemSetup in 'SystemSetup.pas' {FrmSystemSetup},
  InputInfo in 'InputInfo.pas' {FrmInputInfo},
  Reg in 'Reg.pas' {FrmRegistry},
  report in 'REPORT.PAS' {QuickReport1: TQuickRep};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '电脑公司客户管理系统';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmAbout, FrmAbout);
  Application.CreateForm(TFrmUserSetup, FrmUserSetup);
  Application.CreateForm(TFrmSystemSetup, FrmSystemSetup);
  Application.CreateForm(TFrmInputInfo, FrmInputInfo);
  Application.CreateForm(TFrmRegistry, FrmRegistry);
  Application.CreateForm(TQuickReport1, QuickReport1);
  Application.Run;
end.
