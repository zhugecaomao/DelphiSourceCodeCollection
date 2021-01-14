program ProjectZYGL;

uses
  Forms,
  zygl_ in 'zygl_.pas' {zygl},
  DM_zygl_ in 'DM_zygl_.pas' {DMzygl: TDataModule},
  xmmx_ in 'xmmx_.pas' {xmmx},
  rygl_bb_ in 'rygl_bb_.pas' {rygl_bb},
  yrqd_bbgl in 'yrqd_bbgl.pas' {yiqd_bb},
  yrqd_bb_f_ in 'yrqd_bb_f_.pas' {yrqd_bb_f},
  zysf_bb_ in 'zysf_bb_.pas' {zysf_bb},
  denglu_ in 'denglu_.pas' {denglu},
  zycsf_ in 'zycsf_.pas' {zycsf};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tdenglu, denglu);
  Application.CreateForm(Tzygl, zygl);
  Application.CreateForm(Txmmx, xmmx);
  Application.CreateForm(TDMzygl, DMzygl);
  Application.CreateForm(Trygl_bb, rygl_bb);
  Application.CreateForm(Tyiqd_bb, yiqd_bb);
  Application.CreateForm(Tyrqd_bb_f, yrqd_bb_f);
  Application.CreateForm(Tzysf_bb, zysf_bb);
  Application.CreateForm(Tzycsf, zycsf);
  Application.Run;
end.
