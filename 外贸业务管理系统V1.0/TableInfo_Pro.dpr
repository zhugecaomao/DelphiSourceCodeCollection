program TableInfo_Pro;

uses
  Forms,
  TabInfo in 'CreateTab\TabInfo.pas' {TabInfo_frm},
  TabInfoEdit in 'CreateTab\TabInfoEdit.pas' {TabInfoEdit_frm},
  TabInfoField in 'CreateTab\TabInfoField.pas' {TabInfoField_frm},
  TabInfoStyle in 'CreateTab\TabInfoStyle.pas' {TabInfoStyle_frm},
  BasePage in 'Pub\BasePage.pas',
  CreateTabInfo in 'Pub\CreateTabInfo.pas',
  DataModule in 'Pub\DataModule.pas' {DataModule_frm: TDataModule},
  MyLabel in 'Pub\MyLabel.pas',
  MyPanel in 'Pub\MyPanel.pas',
  BuildSQL in 'CreateTab\BuildSQL.pas' {BuildSQL_frm},
  ExportRecord in 'CreateTab\ExportRecord.pas' {ExportRecord_frm},
  BaseForm in 'Pub\BaseForm.pas' {BaseFrm},
  TableEdit in 'CreateTab\TableEdit.pas' {TableEdit_frm},
  BasePageForm in 'Pub\BasePageForm.pas',
  myClass in 'Pub\myClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '数据库生成器';
  Application.CreateForm(TDataModule_frm, DataModule_frm);
  Application.CreateForm(TTabInfo_frm, TabInfo_frm);
  Application.Run;
end.
