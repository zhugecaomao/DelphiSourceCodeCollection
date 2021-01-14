program main;

uses
  Forms,
  mainunit in 'mainunit.pas' {mainform},
  logUnit in 'logUnit.pas' {logform},
  passUnit in 'passUnit.pas' {passform},
  aboutUnit in 'aboutUnit.pas' {aboutform},
  dataUnit in 'dataUnit.pas' {DataModule1: TDataModule},
  jianyaoUnit in 'jianyaoUnit.pas' {jianyaoform},
  chengjiunit in 'chengjiunit.pas' {chengjiform},
  biaozhunUnit in 'biaozhunUnit.pas' {biaozhunform},
  helpUnit in 'helpUnit.pas' {helpinfo},
  anquanUnit in 'anquanUnit.pas' {anquanform},
  backUnit in 'backUnit.pas' {backform},
  chaxunUnit in 'chaxunUnit.pas' {chaxunform},
  printUnit in 'printUnit.pas' {printform},
  reportUnit in 'reportUnit.pas' {reportform},
  zhuangkuangUnit in 'zhuangkuangUnit.pas' {zhuangkuangfenxi},
  zkreportUnit in 'zkreportUnit.pas' {zkreport},
  xiangxiUnit in 'xiangxiUnit.pas' {xiangxiform},
  xxreportUnit in 'xxreportUnit.pas' {xxreport},
  toexcelUnit in 'toexcelUnit.pas' {toexcel},
  lujingUnit in 'lujingUnit.pas' {lujingform},
  chushiUnit in 'chushiUnit.pas' {chushiform};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '大学体质健康管理系统';
  Application.CreateForm(Tmainform, mainform);
  Application.CreateForm(Tlogform, logform);
  Application.CreateForm(Tpassform, passform);
  Application.CreateForm(Taboutform, aboutform);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(Tjianyaoform, jianyaoform);
  Application.CreateForm(Tchengjiform, chengjiform);
  Application.CreateForm(Tbiaozhunform, biaozhunform);
  Application.CreateForm(Thelpinfo, helpinfo);
  Application.CreateForm(Tanquanform, anquanform);
  Application.CreateForm(Tbackform, backform);
  Application.CreateForm(Tchaxunform, chaxunform);
  Application.CreateForm(Tprintform, printform);
  Application.CreateForm(Treportform, reportform);
  Application.CreateForm(Tzhuangkuangfenxi, zhuangkuangfenxi);
  Application.CreateForm(Tzkreport, zkreport);
  Application.CreateForm(Txiangxiform, xiangxiform);
  Application.CreateForm(Txxreport, xxreport);
  Application.CreateForm(Ttoexcel, toexcel);
  Application.CreateForm(Tlujingform, lujingform);
  Application.CreateForm(Tchushiform, chushiform);
  logform.ShowModal;
  Application.Run;
end.
