program FingerClient;

uses
  {$IFDEF Linux}
  QForms,
  {$ELSE}
  Forms,
  {$ENDIF}
  main in 'main.pas' {frmFingerDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmFingerDemo, frmFingerDemo);
  Application.Run;
end.
