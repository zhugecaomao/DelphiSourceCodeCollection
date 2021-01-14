program PingGUI;

uses
  {$IFDEF Linux}
  QForms,
  {$ELSE}
  Forms,
  {$ENDIF}
  Main in 'Main.pas' {frmPing};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPing, frmPing);
  Application.Run;
end.
