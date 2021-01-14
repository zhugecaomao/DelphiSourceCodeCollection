program erpServer;

uses
  Forms,
  fMain in 'fMain.pas' {frmMain},
  erpServer_TLB in 'erpServer_TLB.pas',
  fServer in 'fServer.pas' {EServer: TRemoteDataModule} {EServer: CoClass};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
