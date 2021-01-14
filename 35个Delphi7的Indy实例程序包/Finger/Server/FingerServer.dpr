program fingerserver;

uses
  {$IFDEF Linux}
  QForms,
  {$ELSE}
  Forms,
  {$ENDIF}
  mainform in 'mainform.pas' {frmFingerServer};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmFingerServer, frmFingerServer);
  Application.Run;
end.
