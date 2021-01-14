program YLZP;
//----------------------------------------------------------//
//   新型农村合作医疗慢性病医疗证管理

//   程序简单实用
//   方便的报表模板设计
//   打印机套打

//   数据库采用 Access,文件名称 : YLZ.mdb
//   使用控件 ReportBuilder 7.03 for Delphi 7.0

//   第一次往 盒子 2ccc.com 上传自己做的小东东,感谢大家支持.
//   以后多多交流!

//   Author : thplus
//   Email  : thplus@sina.com
//   QQ     : 419157190
//   2008.06.15

//   如有转载,请保留以上信息!谢谢!
//----------------------------------------------------------//

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '新型农村合作医疗慢性病医疗证';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
