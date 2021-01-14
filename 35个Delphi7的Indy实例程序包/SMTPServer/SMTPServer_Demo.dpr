program SMTPServer_Demo;

uses
  QForms,
  Forms,
  Main in 'Main.pas' {frmSmtpServer};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmSmtpServer, frmSmtpServer);
  Application.Run;
end.
