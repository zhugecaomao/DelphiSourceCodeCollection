program Psrv;

uses
  Forms,
  UntSrv in 'UntSrv.pas' {FrmSrv};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmSrv, FrmSrv);
  Application.Run;
end.
