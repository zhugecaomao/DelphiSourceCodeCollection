program timedemo;

uses
  {$IFDEF Linux}
  QForms,
  {$ELSE}
  Forms,
  {$ENDIF}
  Main in 'Main.pas' {frmTimeDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmTimeDemo, frmTimeDemo);
  Application.Run;
end.
