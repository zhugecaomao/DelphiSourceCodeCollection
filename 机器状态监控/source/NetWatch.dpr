program NetWatch;

uses
  Forms,
  frmMain in 'form\frmMain.pas' {frmNetWatch},
  unitPing in 'unit\unitPing.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmNetWatch, frmNetWatch);
  Application.Run;
end.
