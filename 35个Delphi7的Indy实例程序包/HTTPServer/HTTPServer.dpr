// NOTE: This demo ONLY runs under Windows.

program HTTPServer;

uses
  Forms,
  Main in 'Main.pas' {fmHTTPServerMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmHTTPServerMain, fmHTTPServerMain);
  Application.Run;
end.
