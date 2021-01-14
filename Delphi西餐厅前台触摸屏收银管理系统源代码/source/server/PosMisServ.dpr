program PosMisServ;

uses
  Forms,
  Windows,
  udmData in 'udmData.pas' {dmData: TDataModule},
  ufrmBase in 'ufrmBase.pas' {frmBase},
  ufrmLogin in 'ufrmLogin.pas' {frmLogin},
  ufrmMain in 'ufrmMain.pas' {frmMain},
  upubCommon in '..\public\upubCommon.pas',
  ufrmViewDataBase in 'ufrmViewDataBase.pas' {frmViewDataBase},
  ufrmWorkView in 'ufrmWorkView.pas' {frmWorkView},
  ufrmEmpView in 'ufrmEmpView.pas' {frmEmpView},
  ufrmSaleView in 'ufrmSaleView.pas' {frmSaleView},
  ufrmOriginalView in 'ufrmOriginalView.pas' {frmOriginalView},
  ufrmOriginalItemView in 'ufrmOriginalItemView.pas' {frmOriginalItemView},
  ufrmSysUserView in 'ufrmSysUserView.pas' {frmSysUserView},
  ufrmSysUserPower in 'ufrmSysUserPower.pas' {frmSysUserPower},
  ufrmUnitView in 'ufrmUnitView.pas' {frmUnitView},
  ufrmRealTradeView in 'ufrmRealTradeView.pas' {frmRealTradeView},
  ufrmOutInvoceView in 'ufrmOutInvoceView.pas' {frmOutInvoceView},
  ufrmSaleItemView in 'ufrmSaleItemView.pas' {frmSaleItemView},
  ufrmShopView in 'ufrmShopView.pas' {frmShopView},
  ufrmFactoryView in 'ufrmFactoryView.pas' {frmFactoryView},
  ufrmInOutOriginal in 'ufrmInOutOriginal.pas' {frmInOutOriginal},
  ufrmLostOriginalView in 'ufrmLostOriginalView.pas' {frmLostOriginalView},
  ufrmPosParamView in 'ufrmPosParamView.pas' {frmPosParamView},
  ufrmSaleFixView in 'ufrmSaleFixView.pas' {frmSaleFixView},
  ufrmLSMSaleView in 'ufrmLSMSaleView.pas' {frmLSMSaleView},
  ufrmInOutView in 'ufrmInOutView.pas' {frmInOutView},
  ufrmAllocOriginalView in 'ufrmAllocOriginalView.pas' {frmAllocOriginalView},
  ufrmLostSaleView in 'ufrmLostSaleView.pas' {frmLostSaleView},
  ufrmTestSaleView in 'ufrmTestSaleView.pas' {frmTestSaleView},
  ufrmAllocSaleView in 'ufrmAllocSaleView.pas' {frmAllocSaleView},
  ufrmStaticBase in 'ufrmStaticBase.pas' {frmStaticBase},
  ufrmLostTestAllocSearch in 'ufrmLostTestAllocSearch.pas' {frmLostTestAllocSearch},
  ufrmSaleStructView in 'ufrmSaleStructView.pas' {frmSaleStructView},
  ufrmTradeSaleOrderStatic in 'ufrmTradeSaleOrderStatic.pas' {frmTradeSaleOrderStatic},
  ufrmTradeSaleDetailStatic in 'ufrmTradeSaleDetailStatic.pas' {frmTradeSaleDetailStatic},
  ufrmTradeDetailStatic in 'ufrmTradeDetailStatic.pas' {frmTradeDetailStatic},
  ufrmTradeGatherStatic in 'ufrmTradeGatherStatic.pas' {frmTradeGatherStatic},
  ufrmMachinesTradeStatic in 'ufrmMachinesTradeStatic.pas' {frmMachinesTradeStatic},
  ufrmSaleInnerOutStatic in 'ufrmSaleInnerOutStatic.pas' {frmSaleInnerOutStatic},
  ufrmSaleTradeUseStatic in 'ufrmSaleTradeUseStatic.pas' {frmSaleTradeUseStatic},
  ufrmWarerHouseView in 'ufrmWarerHouseView.pas' {frmWarerHouseView},
  ufrmTradeTimeGatherStatic in 'ufrmTradeTimeGatherStatic.pas' {frmTradeTimeGatherStatic},
  ufrmSaleTimeGatherStatic in 'ufrmSaleTimeGatherStatic.pas' {frmSaleTimeGatherStatic},
  ufrmModifyDataBase in 'ufrmModifyDataBase.pas' {frmModifyDataBase},
  ufrmCMView in 'ufrmCMView.pas' {frmCMView},
  ufrmCardInfoModify in 'ufrmCardInfoModify.pas' {frmCardInfoModify},
  ufrmCardInfoView in 'ufrmCardInfoView.pas' {frmCardInfoView},
  ufrmCardKindModify in 'ufrmCardKindModify.pas' {frmCardKindModify},
  ufrmCardKindView in 'ufrmCardKindView.pas' {frmCardKindView},
  ufrmCardLost in 'ufrmCardLost.pas' {frmCardLost},
  ufrmCardPassModify in 'ufrmCardPassModify.pas' {frmCardPassModify},
  ufrmCardSaving in 'ufrmCardSaving.pas' {frmCardSaving},
  ufrmCardServiceFix in 'ufrmCardServiceFix.pas' {frmCardServiceFix},
  ufrmCMBirthday in 'ufrmCMBirthday.pas' {frmCMBirthday},
  ufrmCMModify in 'ufrmCMModify.pas' {frmCMModify},
  ufrmSysUserModify in 'ufrmSysUserModify.pas' {frmSysUserModify},
  ufrmMachinesView in 'ufrmMachinesView.pas' {frmMachinesView},
  ufrmInOutOriginalSearch in 'ufrmInOutOriginalSearch.pas' {frmInOutOriginalSearch},
  ufrmSoftReg in 'ufrmSoftReg.pas' {frmSoftReg},
  ufrmActRecordSearch in 'ufrmActRecordSearch.pas' {frmActRecordSearch};

{$R *.res}
var
  lh_Handle: THandle;
begin 
  if Windows.OpenMutex(Windows.MUTANT_ALL_ACCESS, True, '800105Serv') <> 0 then
  begin
    Application.MessageBox('程序正在运行,不能重复运行!', '系统提示', MB_OK + MB_ICONWARNING);
    Exit;
  end; 
  lh_Handle := Windows.CreateMutex(nil, True, '800105Serv');
  Application.Initialize;
  Application.Title := '餐饮管理';
  Application.CreateForm(TfrmMain, frmMain); 
  if frmMain.pubf_Ini then Application.Run else frmMain.Free;
  Windows.ReleaseMutex(lh_Handle);
end.
