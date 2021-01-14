program PClient;

uses
  Forms,
  UntClient in 'UntClient.pas' {FrmClient};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmClient, FrmClient);
  Application.Run;
end.
