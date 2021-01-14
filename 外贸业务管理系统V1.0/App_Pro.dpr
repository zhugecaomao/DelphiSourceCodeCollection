program App_Pro;

uses
  Forms,
  DataModule in 'Pub\DataModule.pas' {DataModule_frm: TDataModule},
  BasePage in 'Pub\BasePage.pas',
  CreateTabInfo in 'Pub\CreateTabInfo.pas',
  MyPanel in 'Pub\MyPanel.pas',
  MyLabel in 'Pub\MyLabel.pas',
  AppMain in 'MainFrom\AppMain.pas' {AppMain_frm},
  UserInfo in 'User\UserInfo.pas' {UserInfo_frm},
  UserRight in 'User\UserRight.pas' {frm_sysright},
  BaseForm in 'Pub\BaseForm.pas' {BaseFrm},
  DictInfo in 'Dict\DictInfo.pas' {DictInfo_frm},
  TableEdit in 'CreateTab\TableEdit.pas' {TableEdit_frm},
  InfoAdd in 'MainFrom\InfoAdd.pas' {InfoAdd_frm},
  ShipInfo in 'Dict\ShipInfo.pas' {ShipInfo_frm},
  ShipInfoSel in 'Dict\ShipInfoSel.pas' {ShipInfoSel_frm},
  CompanyInfo in 'Dict\CompanyInfo.pas' {CompanyInfo_frm},
  ClientInfo in 'Dict\ClientInfo.pas' {ClientInfo_frm},
  ClientInfoSel in 'Dict\ClientInfoSel.pas' {ClientInfoSel_frm},
  FactoryInfo in 'Dict\FactoryInfo.pas' {FactoryInfo_frm},
  FactoryInfoSel in 'Dict\FactoryInfoSel.pas' {FactoryInfoSel_frm},
  ProductInfo in 'MainFrom\ProductInfo.pas' {ProductInfo_frm},
  ProductInfoSel in 'MainFrom\ProductInfoSel.pas' {ProductInfoSel_frm},
  ImageBrower in 'MainFrom\ImageBrower.pas' {ImageBrower_frm},
  DocumentsFacture in 'MainFrom\DocumentsFacture.pas' {DocumentsFacture_frm},
  QuotedPrice in 'MainFrom\QuotedPrice.pas' {QuotedPrice_frm},
  QuotedPriceChildAdd in 'MainFrom\QuotedPriceChildAdd.pas' {QuotedPriceChildAdd_frm},
  QuotedPriceSel in 'MainFrom\QuotedPriceSel.pas' {QuotedPriceSel_frm},
  ShipInfoAdd in 'Dict\ShipInfoAdd.pas' {ShipInfoAdd_frm},
  EditPerson in 'User\EditPerson.pas' {frmEditPerson},
  PersonMgr in 'User\PersonMgr.pas' {frmPersonMgr},
  SecurityGroup in 'User\SecurityGroup.pas' {frmSecurityGroup},
  EditUserLogin in 'User\EditUserLogin.pas' {frmEditUserLogin},
  UserLoginSecurityPermission in 'User\UserLoginSecurityPermission.pas' {frmUserLoginSecurityPermission},
  myClass in 'Pub\myClass.pas',
  DocumentsClause in 'MainFrom\DocumentsClause.pas' {DocumentsClause_frm},
  DocumentsClauseAdd in 'MainFrom\DocumentsClauseAdd.pas' {DocumentsClauseAdd_frm},
  SelectRecord in 'MainFrom\SelectRecord.pas' {SelectRecord_frm},
  ClientContract1 in 'MainFrom\ClientContract1.pas' {ClientContract_frm1},
  ClientContract in 'MainFrom\ClientContract.pas' {ClientContract_frm},
  PubSelModule in 'Dict\PubSelModule.pas' {PubSelModule_frm},
  ClientContractAdd in 'MainFrom\ClientContractAdd.pas' {ClientContractAdd_frm},
  StockContract in 'MainFrom\StockContract.pas' {StockContract_frm},
  StockContractAdd in 'MainFrom\StockContractAdd.pas' {StockContractAdd_frm},
  ReportStyleSet in 'Dict\ReportStyleSet.pas' {ReportStyleSet_frm},
  DocumentsReporter in 'MainFrom\DocumentsReporter.pas' {DocumentsReporter_Frm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule_frm, DataModule_frm);
  Application.CreateForm(TAppMain_frm, AppMain_frm);
  Application.CreateForm(TDocumentsReporter_Frm, DocumentsReporter_Frm);
  Application.Run;
end.
