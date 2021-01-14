program JxcS;

uses
  Forms,
  Mains in 'Mains.pas' {frmMains},
  JxcS_TLB in 'JxcS_TLB.pas',
  Dms in 'Dms.pas' {Datas: TRemoteDataModule} {datas: CoClass},
  ComFun in 'ComFun.pas',
  DmsBb in 'DmsBb.pas' {DatasBb: TRemoteDataModule} {DatasBb: CoClass};

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'IT业进销存管理系统-多层服务器';
  Application.CreateForm(TfrmMains, frmMains);
  Application.Run;
end.
