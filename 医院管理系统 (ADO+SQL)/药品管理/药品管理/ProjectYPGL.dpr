program ProjectYPGL;

uses
  Forms,
  ypgl_ in 'YPGL_.PAS' {ypgl},
  DMypgl_ in 'DMypgl_.pas' {DMypgl: TDataModule},
  ypgl_xg_tj_ in 'ypgl_xg_tj_.pas' {ypgl_xg_tj},
  ypgl_tj_ in 'YPGL_TJ_.PAS' {Faddyp},
  ypgl_gys_mc_ in 'ypgl_gys_mc_.pas' {Fgysmc},
  gys_modify_ in 'gys_modify_.pas' {Fgys_modify},
  gys_add_ in 'gys_add_.pas' {Faddgys},
  ypbb_ in 'YPBB_.PAS' {Formypbb},
  gysbb_ in 'GYSBB_.PAS' {Formgysbb},
  GQYPBB_ in 'GQYPBB_.pas' {Formgqypbb},
  QHGYSBB_ in 'QHGYSBB_.pas' {Formqhgysbb},
  gqypForm_ in 'gqypForm_.pas' {Formgqyp},
  ypcx_2_ in 'ypcx_2_.pas' {Formypcx_2},
  ypcx_3_ in 'ypcx_3_.pas' {Formypcx_3},
  ypgl_2_BB_ in 'ypgl_2_BB_.pas' {Formypcx_3BB},
  ypcx_3_BB_ in 'ypcx_3_BB_.pas' {Formypcx2BB},
  qhgysForm_ in 'qhgysForm_.pas' {Formqhgys},
  qhgys_ckBB in 'qhgys_ckBB.pas' {Formqhgys_ckbb},
  gysjtcxForm_ in 'gysjtcxForm_.pas' {Formgysjtcx};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Typgl, ypgl);
  Application.CreateForm(TFormgqyp, Formgqyp);
  Application.CreateForm(TFormypbb, Formypbb);
  Application.CreateForm(TFaddyp, Faddyp);
  Application.CreateForm(TFgysmc, Fgysmc);
  Application.CreateForm(TDMypgl, DMypgl);
  Application.CreateForm(Typgl_xg_tj, ypgl_xg_tj);
  Application.CreateForm(TFgys_modify, Fgys_modify);
  Application.CreateForm(TFaddgys, Faddgys);
  Application.CreateForm(TFormgysbb, Formgysbb);
  Application.CreateForm(TFormgqypbb, Formgqypbb);
  Application.CreateForm(TFormqhgysbb, Formqhgysbb);
  Application.CreateForm(TFormypcx_2, Formypcx_2);
  Application.CreateForm(TFormypcx_3, Formypcx_3);
  Application.CreateForm(TFormypcx_3BB, Formypcx_3BB);
  Application.CreateForm(TFormypcx2BB, Formypcx2BB);
  Application.CreateForm(TFormqhgys, Formqhgys);
  Application.CreateForm(TFormqhgys_ckbb, Formqhgys_ckbb);
  Application.CreateForm(TFormgysjtcx, Formgysjtcx);
  Application.Run;
end.
