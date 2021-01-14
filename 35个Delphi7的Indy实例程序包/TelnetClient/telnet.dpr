// NOTE: This demo ONLY runs under Windows.

program telnet;

uses
  Forms,
  mainform in 'mainform.pas' {frmTelnetDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmTelnetDemo, frmTelnetDemo);
  Application.Run;
end.
