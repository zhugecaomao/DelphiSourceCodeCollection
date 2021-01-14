program UDPClient;

uses
  {$IFDEF Linux}
  QForms,
  {$ELSE}
  Forms,
  {$ENDIF}
  UDPClientMain in 'UDPClientMain.pas' {UDPMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TUDPMainForm, UDPMainForm);
  Application.Run;
end.
