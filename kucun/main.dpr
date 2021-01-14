program main;

uses
  Forms,
  mainut in 'mainut.pas' {mainfm},
  logout in 'logout.pas' {logofm},
  loginut in 'loginut.pas' {loginfm},
  dataut in 'dataut.pas' {dataconfm: TDataModule},
  inut in 'inut.pas' {infm},
  cpckut in 'cpckut.pas' {cpckfm},
  cpck in 'cpck.pas' {cpckcxfm},
  cprkcx in 'cprkcx.pas' {cprkcxfm},
  cpkccxut in 'cpkccxut.pas' {cpkccxfm},
  perut in 'perut.pas' {ryglfm},
  czyglut in 'czyglut.pas' {czyglfm},
  clbhut in 'clbhut.pas' {clbhfm},
  ghsut in 'ghsut.pas' {ghsglfm},
  bfhyut in 'bfhyut.pas' {sjbffm},
  xgmmut in 'xgmmut.pas' {xgmmfm},
  gyut in 'gyut.pas' {gyfm},
  yjcut in 'yjcut.pas' {jcfm},
  ckybbut in 'ckybbut.pas' {ckybbfm},
  ckylrbbut in 'ckylrbbut.pas' {lrbbfm},
  kcmxut in 'kcmxut.pas' {kcmxfm},
  rudut in 'rudut.pas' {rkdyfm},
  bqjcut in 'bqjcut.pas' {bqjcfm},
  kcglut in 'kcglut.pas' {kcglfm},
  xtcshut in 'xtcshut.pas' {xtcshfm},
  xyriut in 'xyriut.pas' {xtczrzfm},
  rjzcut in 'rjzcut.pas' {rjzcfm},
  ckdjut in 'ckdjut.pas' {chbbfm},
  fhdaut in 'fhdaut.pas' {fhdyfm},
  khthut in 'khthut.pas' {khthfm},
  kcyjut in 'kcyjut.pas' {kcyjfm},
  clthut in 'clthut.pas' {clthfm},
  cprkut in 'cprkut.pas' {cprkfm},
  tldyut in 'tldyut.pas' {tldyfm},
  cllydut in 'cllydut.pas' {cllydfm},
  cpchdyut in 'cpchdyut.pas' {cpchdyfm},
  khcxut in 'khcxut.pas' {khcxfm},
  lrdy in 'lrdy.pas' {lrdyfm},
  lrbbdy in 'lrbbdy.pas' {ylrbbfm},
  lrdyut in 'lrdyut.pas' {lrd2yfm},
  ftput in 'ftput.pas' {ftpfm};

{$R *.res}

begin
  Application.Initialize;
  logofm:=Tlogofm.create(application);
  logofm.showmodal;
  logofm.update;
  Application.Title := '小型玩具生产厂库存管理系统';
  Application.CreateForm(Tmainfm, mainfm);
  Application.CreateForm(Tdataconfm, dataconfm);
  Application.CreateForm(Tloginfm, loginfm);
  Application.CreateForm(Trjzcfm, rjzcfm);
  Application.CreateForm(Txtczrzfm, xtczrzfm);
  Application.CreateForm(Tcllydfm, cllydfm);
  Application.CreateForm(Tylrbbfm, ylrbbfm);
  Application.CreateForm(Tlrd2yfm, lrd2yfm);
  //Application.CreateForm(Tkcyjfm, kcyjfm);
  logofm.free;
  Application.Run;
end.
