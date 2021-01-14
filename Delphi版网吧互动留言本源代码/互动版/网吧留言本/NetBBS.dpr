program NetBBS;

uses
  Forms,
  NetBBS_Unit in 'NetBBS_Unit.pas' {BBS},
  DataModule_Unit in 'DataModule_Unit.pas' {NetBBS_DataModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TBBS, BBS);
  Application.CreateForm(TNetBBS_DataModule, NetBBS_DataModule);
  Application.Run;
end.
