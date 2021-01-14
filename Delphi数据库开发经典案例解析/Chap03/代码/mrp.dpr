program mrp;

uses
  Forms,
  MainForm in 'MainForm.pas' {main},
  MaterialsForm in 'MaterialsForm.pas' {materials},
  BomForm in 'BomForm.pas' {bom},
  CalendarForm in 'CalendarForm.pas' {Calendar},
  ChooseForm in 'ChooseForm.pas' {choose},
  MainProduceForm in 'MainProduceForm.pas' {MainProduce},
  MainRequireForm in 'MainRequireForm.pas' {MainRequire},
  MRPCalForm in 'MRPCalForm.pas' {MRPCal},
  mrphistoryForm in 'mrphistoryForm.pas' {mrphistory};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '生产管理系统';
  Application.CreateForm(Tmain, main);
  Application.Run;
end.
