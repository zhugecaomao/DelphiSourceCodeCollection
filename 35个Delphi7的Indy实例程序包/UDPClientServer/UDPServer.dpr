program UDPServer;

uses
  {$IFDEF Linux}
  QForms,
  {$ELSe}
  Forms,
  {$ENDIF}
  UDPServerMain in 'UDPServerMain.pas' {UDPMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TUDPMainForm, UDPMainForm);
  Application.Run;
end.
