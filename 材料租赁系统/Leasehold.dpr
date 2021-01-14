program Leasehold;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  DBConnectFrm in 'DBConnectFrm.pas' {frmDBConnect},
  U_Public in 'U_Public.pas',
  common in 'Common.pas',
  U_DM in 'U_DM.pas' {DM: TDataModule},
  U_dwinfo in 'U_dwinfo.pas' {frmDwinfo},
  U_Spbm in 'U_Spbm.pas' {frmSpbm},
  U_bmbm in 'U_bmbm.pas' {frmBmda},
  U_print in 'U_print.pas' {frmPrint},
  U_User in 'U_User.pas' {frmUse},
  U_pwd in 'U_pwd.pas' {frmPwd},
  U_dlck in 'U_dlck.pas' {frmLogin},
  u_xgmm in 'U_XGMM.PAS' {frmXgmm},
  U_SpbmInput in 'U_SpbmInput.pas' {frmSpbmInput},
  U_clhsd in 'U_clhsd.pas' {frmclhsd},
  utLeasehold in 'utLeasehold.pas',
  U_ggxh in 'U_ggxh.pas' {frmGgxh},
  U_zlflr in 'U_zlflr.pas' {frmZlflr},
  U_zlflr_input in 'U_zlflr_input.pas' {frmZlflr_input},
  U_Spbm_brw in 'U_Spbm_brw.pas' {frmSpbm_brw},
  U_clffd in 'U_clffd.pas' {frmClffd},
  U_Clcx in 'U_Clcx.pas' {frmClcx},
  repClcx in 'repClcx.pas' {qRepclcx: TQuickRep},
  U_clffd_sort in 'U_clffd_sort.pas' {frmclffd_sort},
  U_jsmx in 'U_jsmx.pas' {frmJsmx},
  u_PrintSelect in 'u_PrintSelect.pas' {frmPrintSelect},
  repJsmx in 'repJsmx.pas' {qRepJsmx: TQuickRep},
  Ujetz in 'Ujetz.pas' {frmjetz},
  Usltz in 'Usltz.pas' {frmSltz},
  repClffd_sort in 'repClffd_sort.pas' {qRepclffd_sort: TQuickRep},
  repcl_t in 'repcl_t.pas' {qRepCl_T: TQuickRep},
  repcl in 'repcl.pas' {qRepCl: TQuickRep};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '²ÄÁÏ×âÁÞÏµÍ³';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
