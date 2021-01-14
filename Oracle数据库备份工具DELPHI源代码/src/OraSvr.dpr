program OraSvr;

uses
  Forms,
  UMain in 'UMain.pas' {FrmMain},
  UNTService in 'UNTService.pas';

{$R *.RES}

begin   
  if StartNTService('OracleBackupService', 'Oracle数据自动备份服务') then
  begin
    NTService.CreateForm(TFrmMain, FrmMain);
    NTService.Run;
    Exit;
  end;

{  Application.Initialize;
  Application.Title := 'Oracle数据自动备份服务';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;  }
end.
