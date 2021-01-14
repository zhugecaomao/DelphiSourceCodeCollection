// NOTE: This demo ONLY runs under Windows.

program Client;

uses
  Forms,
  fClient in 'fClient.pas' {frmClient};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Indy Image Client';
  Application.CreateForm(TfrmClient, frmClient);
  Application.Run;
end.
