program DLLMemServer;

uses
  Forms,
  ShareMemServer in 'ShareMemServer.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
