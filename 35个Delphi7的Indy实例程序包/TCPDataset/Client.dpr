program Client;

uses
  Forms,
  fClient in 'fClient.pas' {frmClient};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmClient, frmClient);
  Application.Run;
end.
