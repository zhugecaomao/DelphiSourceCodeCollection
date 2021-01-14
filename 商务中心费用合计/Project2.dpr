program Project2;

uses
  Forms,
  Unitmain in 'Unitmain.pas' {f_main},
  UDM in 'UDM.pas' {DM: TDataModule},
  Unitaddinformation in 'Unitaddinformation.pas' {F_addinformation},
  UnitME in 'UnitME.pas' {F_ME},
  Unitsumdepartment in 'Unitsumdepartment.pas' {F_sumdepartment},
  Unitsumvalues in 'Unitsumvalues.pas' {F_sumvalues},
  Unittimetoserch in 'Unittimetoserch.pas' {F_changepereson},
  Unitsumpagereport in 'Unitsumpagereport.pas' {F_changeinformation},
  Unittimetoserchvalues in 'Unittimetoserchvalues.pas' {F_KERENREPORT},
  Unitsummoneyreport in 'Unitsummoneyreport.pas' {F_summoneyreport},
  Unitbussniscenter in 'Unitbussniscenter.pas' {F_bussniscenter},
  Unitpageforpreson in 'Unitpageforpreson.pas' {F_pageforpreson},
  Unitaddpreson in 'Unitaddpreson.pas' {F_addpreson},
  Unitmakecharter in 'Unitmakecharter.pas' {F_makecharter},
  Unithitchartadd in 'Unithitchartadd.pas' {F_hitchartadd},
  inportantform in 'inportantform.pas' {f_inportantform},
  timetoviewtherepot in 'timetoviewtherepot.pas' {f_timetoviewtherepot},
  menudele in 'menudele.pas' {Form1},
  serchls in 'serchls.pas' {frmserchls},
  Unitqbbb in 'Unitqbbb.pas' {Formqbbb},
  UnitSUMALL in 'UnitSUMALL.pas' {FormSUMALL},
  Unitxztjt in 'Unitxztjt.pas' {Formxztjt},
  Unitaddmx in 'Unitaddmx.pas' {Formaddmx},
  Unitaddpag in 'Unitaddpag.pas' {Formaddpage},
  Unitvalueadd in 'Unitvalueadd.pas' {Formvalueadd},
  Unithuz in 'Unithuz.pas' {Formhuz},
  Urbb in 'Urbb.pas' {F_rbb},
  Uxsrbb in 'Uxsrbb.pas' {F_xsrbb},
  Uwpsz in 'Uwpsz.pas' {F_wpsz},
  Uwpxs in 'Uwpxs.pas' {F_wuxs},
  Uwply in 'Uwply.pas' {F_wpxm},
  Upersonal in 'Upersonal.pas' {Fpersonal},
  Ugjt in 'Ugjt.pas' {FGJT},
  Uchangemx in 'Uchangemx.pas' {Fchangemx},
  Uczjl in 'Uczjl.pas' {Fczjl},
  Uczmx in 'Uczmx.pas' {Fczmx},
  Ujiage in 'Ujiage.pas' {Fjiage};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '商务中心汇总系统';
  Application.CreateForm(TF_bussniscenter, F_bussniscenter);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tf_main, f_main);
  Application.CreateForm(Tf_inportantform, f_inportantform);
  Application.CreateForm(TF_rbb, F_rbb);
  Application.CreateForm(TF_xsrbb, F_xsrbb);
  Application.CreateForm(TF_wpsz, F_wpsz);
  Application.CreateForm(TF_wuxs, F_wuxs);
  Application.CreateForm(TF_wpxm, F_wpxm);
  Application.CreateForm(TFpersonal, Fpersonal);
  Application.CreateForm(TFGJT, FGJT);
  Application.CreateForm(TFchangemx, Fchangemx);
  Application.CreateForm(TFczjl, Fczjl);
  Application.CreateForm(TFczmx, Fczmx);
  Application.CreateForm(TFjiage, Fjiage);
  Application.Run;
end.
