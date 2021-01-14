program Client;

uses
  Forms,
  ClientFrmMainUnit in 'ClientFrmMainUnit.pas' {ClientFrmMain},
  GlobalUnit in 'GlobalUnit.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TClientFrmMain, ClientFrmMain);
  Application.Run;
end.
