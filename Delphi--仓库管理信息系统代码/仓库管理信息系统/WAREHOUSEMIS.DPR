program WAREHOUSEMIS;

uses
  Forms,
  Sysutils,
  Main in 'MAIN.PAS' {MainForm},
  uLogin in 'uLogin.pas' {frmLogin},
  uRightsSetting in 'uRightsSetting.pas' {frmRightSetting},
  uSLD in 'uSLD.pas' {frmSLD},
  uWarehouseSetting in 'uWarehouseSetting.pas' {frmWarehouseSetting},
  uDB in 'uDB.pas' {dmWarehouse: TDataModule},
  uPublic in 'uPublic.pas',
  U_fzlr_zgxm in 'U_fzlr_zgxm.pas' {frmZgda_fzlr},
  U_bmda_fzlr in 'U_bmda_fzlr.pas' {frmBmda_fzlr},
  U_Bmda in 'U_Bmda.pas' {frmBmda},
  U_fzlr_clbm in 'U_fzlr_clbm.pas' {frmCLBM_FZLR},
  U_Sldjshkp in 'U_Sldjshkp.pas' {frmClsldDjsh},
  U_zgda in 'U_zgda.pas' {frmZgda},
  U_zgdakp in 'U_zgdakp.pas' {frmZgda_Kp},
  U_szcx in 'U_szcx.pas' {frmSzcx},
  U_bmlldgl in 'U_bmlldgl.pas' {frmBmlld},
  U_bmlldjshkp in 'U_bmlldjshkp.pas' {frmBmlldDjsh};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmWarehouse, dmWarehouse);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TdmWarehouse, dmWarehouse);
  Application.CreateForm(TfrmWarehouseSetting, frmWarehouseSetting);
  Application.CreateForm(TfrmZgda_fzlr, frmZgda_fzlr);
  Application.CreateForm(TfrmBmda_fzlr, frmBmda_fzlr);
  Application.CreateForm(TfrmCLBM_FZLR, frmCLBM_FZLR);
  Application.CreateForm(TfrmClsldDjsh, frmClsldDjsh);
  Application.CreateForm(TfrmBmlldDjsh, frmBmlldDjsh);
  Application.Run;
end.
