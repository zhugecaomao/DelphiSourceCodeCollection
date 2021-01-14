program SQGZGL;

uses
  Forms,
  GZGL_Main in 'GZGL_Main.pas' {FrmGZGL_Main},
  GZGL_YHDJ in 'GZGL_YHDJ.pas' {FrmGZGL_YHDJ},
  GZGL_DModule in 'GZGL_DModule.pas' {dmd: TDataModule},
  Umyfunction in 'Umyfunction.pas',
  GZGL_XGGZ_CP in 'GZGL_XGGZ_CP.pas' {FrmGZGL_XGGZ_cp},
  GZGL_CXGZ in 'GZGL_CXGZ.pas' {FrmGZGL_CXGZ},
  GZGL_DHDJ in 'GZGL_DHDJ.pas' {FrmGZGL_DHDJ},
  GZGL_WGDJ in 'GZGL_WGDJ.pas' {FrmGZGL_WGDJ},
  GZGL_NewGzxx in 'GZGL_NewGzxx.pas' {FrmGZGL_NewGzxx},
  GZGL_ZLCP in 'GZGL_ZLCP.pas' {FrmGZGL_ZLCP},
  GZGL_XGCXZC in 'GZGL_XGCXZC.pas' {FrmGZGL_XGCXZC},
  GZGL_XGGZ in 'GZGL_XGGZ.pas' {FrmGZGL_XGGZ},
  GZGL_YBTJ in 'GZGL_YBTJ.pas' {FrmGZGL_YBTJ},
  GZGL_ZZTJ in 'GZGL_ZZTJ.pas' {FrmGZGL_ZZTJ},
  GZGL_BHTJ in 'GZGL_BHTJ.pas' {FrmGZGL_BHTJ},
  GZGL_YZTJ in 'GZGL_YZTJ.pas' {FrmGZGL_YZTJ},
  GZGL_LBTJ in 'GZGL_LBTJ.pas' {FrmGZGL_LBTJ},
  GZGL_ZLYZJH in 'GZGL_ZLYZJH.pas' {FrmGZGL_ZLYZJH},
  GZGL_about in 'GZGL_about.pas' {FrmGZGL_about},
  GZGL_ZLZZJH in 'GZGL_ZLZZJH.pas' {FrmGZGL_ZLZZJH},
  GZGL_XGDW in 'GZGL_XGDW.pas' {FrmGZGL_XGDW},
  GZGL_WGTJ in 'GZGL_WGTJ.pas' {FrmGZGL_WGTJ},
  GZGL_ZLCXZC in 'GZGL_ZLCXZC.pas' {FrmGZGL_ZLCXZC},
  GZGL_CXDW in 'GZGL_CXDW.pas' {FrmGZGL_CXDW},
  GZGL_ZLGZ in 'GZGL_ZLGZ.pas' {FrmGZGL_ZLGZ},
  GZGL_ZHTJ in 'GZGL_ZHTJ.pas' {FrmGZGL_ZHTJ},
  GZGL_print_NBB in 'GZGL_print_NBB.pas' {FrmGZGL_Print_NBB},
  GZGL_print_YBB in 'GZGL_print_YBB.pas' {FrmGZGL_Print_YBB},
  GZGL_reports in 'GZGL_reports.pas' {frmGZGL_Reports};

{$R *.RES}

begin

  FrmGZGL_ABOUT := TFrmGZGL_ABOUT.Create(Application);
  FrmGZGL_ABOUT.Show;
  FrmGZGL_ABOUT.timer1.enabled:=true;
  FrmGZGL_ABOUT.Lab_loading.Visible:=true;
  FrmGZGL_ABOUT.Enabled:=false;
  FrmGZGL_ABOUT.Update; { Handle any Pending Paint Messages }
   
  Application.Initialize;
  Application.Title := '工装信息管理';
  Application.CreateForm(Tdmd, dmd);
  Application.CreateForm(TFrmGZGL_Main, FrmGZGL_Main);
  Application.CreateForm(TfrmGZGL_Reports, frmGZGL_Reports);
  Application.Run;
end.
