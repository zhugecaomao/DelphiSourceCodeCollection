// NOTE: This demo ONLY runs under Windows.

program Server;

uses
  Forms,
  fServer in 'fServer.pas' {frmServer};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Image Server';
  Application.CreateForm(TfrmServer, frmServer);
  Application.Run;
end.
