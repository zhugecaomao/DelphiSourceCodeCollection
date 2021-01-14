program Server;

uses
  Forms,
  fServer in 'fServer.pas' {frmServer};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmServer, frmServer);
  Application.Run;
end.
