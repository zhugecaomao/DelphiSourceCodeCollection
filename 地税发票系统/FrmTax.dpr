program FrmTax;

uses
  Forms,
  SysUtils,
  FrmMain in 'Source\FrmMain.pas' {Main},
  FrmLogin in 'Source\FrmLogin.pas' {Login},
  FrmCustom in 'Source\FrmCustom.pas',
  FrmData in 'Source\FrmData.pas' {DataModule1: TDataModule},
  FrmPitPw in 'Source\FrmPitPw.pas' {PitPw},
  FrmPrintSet in 'Source\FrmPrintSet.pas' {PrintSet},
  FrmAbout in 'Source\FrmAbout.pas' {About},
  FrmManage in 'Source\FrmManage.pas' {AdminMan},
  FrmLibrary in 'Source\FrmLibrary.pas' {GenLibrary},
  FrmBackup in 'Source\FrmBackup.pas' {Backup};

{$R *.res}

begin
  Application.Initialize;
  Anti_DeDe; //防止DEDE高度
  CheckParentProc;
  Application.Title := '地税发票打印系统';
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TPrintSet, PrintSet);
  Application.CreateForm(TAbout, About);
  Application.CreateForm(TPitPw, PitPw);
  Application.CreateForm(TAdminMan, AdminMan);
  Application.CreateForm(TGenLibrary, GenLibrary);
  Application.CreateForm(TBackup, Backup);
  TLogin.ReadConfig;
  if not TLogin.CreateLogin then
    Application.Terminate
  else
  begin
    CheckParentProc;
    Main.Show;
    Application.Run;
  end;
end.
