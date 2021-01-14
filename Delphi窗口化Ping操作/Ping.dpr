program Ping;

uses
  Forms,
  frm_Ping in 'frm_Ping.pas' {FrmPing};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPing, FrmPing);
  Application.Run;
end.
