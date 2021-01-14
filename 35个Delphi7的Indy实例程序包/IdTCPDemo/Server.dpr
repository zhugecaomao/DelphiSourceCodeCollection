program Server;

uses
  Forms,
  ServerFrmMainUnit in 'ServerFrmMainUnit.pas' {ServerFrmMain},
  GlobalUnit in 'GlobalUnit.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TServerFrmMain, ServerFrmMain);
  Application.Run;
end.
