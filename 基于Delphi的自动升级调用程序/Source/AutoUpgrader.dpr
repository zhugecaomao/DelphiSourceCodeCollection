program AutoUpgrader;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {MainForm},
  SysDM in 'SysDM.pas' {SysDataModule: TDataModule},
  ThreadMgr in 'ThreadMgr.pas',
  ScriptParser in 'ScriptParser.pas',
  ScriptExecutor in 'ScriptExecutor.pas',
  NetworkIndy in 'NetworkIndy.pas',
  NetworkLayer in 'NetworkLayer.pas',
  UpgradeThread in 'UpgradeThread.pas',
  Global in 'Global.pas',
  PrjMisc in 'PrjMisc.pas',
  PubUtils in 'PubUtils.pas';

{$R *.res}

begin
  CheckPrevInstance;
  Application.Initialize;
  Application.CreateForm(TSysDataModule, SysDataModule);
  Application.Run;
end.
