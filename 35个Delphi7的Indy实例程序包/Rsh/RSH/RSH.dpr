program RSH;

uses
  Forms,
  rshmain in 'rshmain.pas' {frmMainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMainForm, frmMainForm);
  Application.Run;
end.
