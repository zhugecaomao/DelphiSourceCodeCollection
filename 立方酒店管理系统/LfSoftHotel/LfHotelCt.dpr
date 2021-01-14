program LfHotelCt;

uses
  Forms,
  C_ctmain in 'Programct\C_ctmain.pas' {CtmainForm},
  C_CtData in 'Programct\C_CtData.pas' {CtData: TDataModule},
  C_ctxfxm in 'Programct\C_ctxfxm.pas' {CtxfxmForm},
  C_ctth in 'Programct\C_ctth.pas' {CtthForm},
  C_CtDefine in 'Programct\C_CtDefine.pas',
  C_cddm in 'Programct\C_cddm.pas' {CddmForm},
  C_Ctkt in 'Programct\C_Ctkt.pas' {CtktForm},
  C_ctdc in 'Programct\C_ctdc.pas' {CtdcForm},
  C_dcmx in 'Programct\C_dcmx.pas' {DcmxForm},
  C_cttc in 'Programct\C_cttc.pas' {CttcForm},
  C_Ctxt in 'Programct\C_Ctxt.pas' {CtxtForm},
  C_ctjz in 'Programct\C_ctjz.pas' {CtjzForm},
  C_Fcfjz in 'Programct\C_Fcfjz.pas' {FcfJzForm},
  C_Yycx in 'Programct\C_Yycx.pas' {YycxForm},
  C_Dcbd in 'Programct\C_Dcbd.pas' {DcbdForm},
  C_Xhtj in 'Programct\C_Xhtj.pas' {XhtjForm},
  C_Ctxtm in 'Programct\C_Ctxtm.pas' {CtxtmForm},
  C_Sysprint in 'Programct\C_Sysprint.pas' {SysPrintForm},
  IcCardDefine in 'Programct\IcCardDefine.pas',
  drv_unit in 'Programct\drv_unit.pas',
  C_CardXf in 'Programct\C_CardXf.pas' {CardXfForm},
  C_Klsz in 'Programct\C_Klsz.pas' {KlszForm},
  C_Password in 'Programct\C_Password.pas' {PasswordForm},
  C_About in 'Programct\C_About.pas' {AboutForm},
  C_Xtsz in 'Programct\C_Xtsz.pas' {XtszForm},
  C_Yytj in 'Programct\C_Yytj.pas' {YytjForm},
  C_Ctyd in 'Programct\C_Ctyd.pas' {CtydForm},
  C_Ctjt in 'Programct\C_Ctjt.pas' {CtjtForm},
  C_KhdaSel in 'Programct\C_KhdaSel.pas' {KhdaSelForm},
  hzpy in 'Programct\hzpy.pas',
  C_Wjzcx in 'Programct\C_Wjzcx.pas' {WjzCxForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '立方餐饮管理系统';
  Application.CreateForm(TCtData, CtData);
  Application.CreateForm(TCtmainForm, CtmainForm);
  Application.CreateForm(TCtdcForm, CtdcForm);
  Application.CreateForm(TDcmxForm, DcmxForm);
  Application.Run;
end.
