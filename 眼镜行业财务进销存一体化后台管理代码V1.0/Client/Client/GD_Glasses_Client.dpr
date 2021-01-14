program GD_Glasses_Client;

uses
  Forms,
  Windows,
  inifiles,
  SysUtils,
  Data in 'Data.pas' {frm_Data: TDataModule},
  Login in 'Login.pas' {frm_Login},
  Main in 'Main.pas' {frm_Main},
  func in 'func.pas',
  IMCode in 'IMCode.pas',
  Stock_Report in 'Stock_Report.pas' {frm_Stock_Report},
  Stock_Contract in 'Stock_Contract.pas' {frm_Stock_Contract},
  Storage_Select in 'Storage_Select.pas' {frm_Storage_Select},
  Umanage_Fad in 'Umanage_Fad.pas' {frm_Umanage_Fad},
  limit in 'limit.pas' {frm_limit},
  Sale_Contract in 'Sale_Contract.pas' {frm_Sale_Contract},
  Login_Man in 'Login_Man.pas' {frm_Login_Man},
  Goods_Requirement in 'Goods_Requirement.pas' {frm_Goods_Requirement},
  Supply_Monad in 'Supply_Monad.pas' {frm_Supply_Monad},
  Examine_Verify in 'Examine_Verify.pas' {frm_Examine_Verify},
  Man_Check in 'Man_Check.pas' {frm_Man_Check},
  Public_Don in 'Public_Don.pas' {frm_Public_Don},
  Business_Draft in 'Business_Draft.pas' {frm_Business_Draft},
  Goods_Write in 'Goods_Write.pas' {frm_Goods_Write},
  Quality_Check in 'Quality_Check.pas' {frm_Quality_Check},
  Stock_Write_Check in 'Stock_Write_Check.pas' {frm_Stock_Write_Check},
  Quality_Check_Select in 'Quality_Check_Select.pas' {frm_Quality_Check_Select},
  Contract_Check in 'Contract_Check.pas' {frm_Contract_Check},
  ChildShop_Select in 'ChildShop_Select.pas' {frm_ChildShop_Select},
  Stock_Enter_Report in 'Stock_Enter_Report.pas' {frm_Stock_Enter_Report},
  Goods_Requipment_Search in 'Goods_Requipment_Search.pas' {frm_Goods_Requipment_Search},
  Stock_Enter in 'Stock_Enter.pas' {frm_Stock_Enter},
  Stock_Pay in 'Stock_Pay.pas' {frm_Stock_Pay},
  Stock_Fad in 'Stock_Fad.pas' {frm_Stock_Fad},
  Storage_Guide in 'Storage_Guide.pas' {frm_Storage_Guide},
  Company in 'Company.pas' {frm_Company},
  untdatadm in 'untdatadm.pas' {dmmain: TDataModule},
  Unitdwzy in '..\基础模块\Unitdwzy.pas' {frmzyll},
  Unitygda in '..\基础模块\Unitygda.pas' {frmygda},
  Unitnewbm in '..\基础模块\Unitnewbm.pas',
  ubase in 'ubase.pas' {frmbase},
  Umoneystock in 'Umoneystock.pas' {frmmoneystock},
  Uinputselect in 'Uinputselect.pas' {frmselect},
  Ufmgird in 'Ufmgird.pas' {frmgrid},
  fm_icon in 'fm_icon.pas' {Frame1: TFrame},
  Usysteminit in 'Usysteminit.pas' {frmsysteminit},
  Ustockinit in '..\基础模块\Ustockinit.pas' {frmstockinit},
  fm_Base in '..\基础模块\基FORM\fm_Base.pas' {fmBase},
  UntStockCheck in '..\基础模块\库存管理\UntStockCheck.pas',
  fm_Overflow in '..\基础模块\库存管理\fm_Overflow.pas' {fmOverflow},
  fm_Check in '..\基础模块\库存管理\fm_Check.pas' {fmCheck},
  fm_Scrap in '..\基础模块\库存管理\fm_Scrap.pas' {fmScrap},
  fm_SetColumn in '..\基础模块\基FORM\fm_SetColumn.pas' {fmSetColumn},
  fm_BaseQueryStr in '..\基础模块\库存管理\fm_BaseQueryStr.pas' {fmBaseQueryStr},
  UntgoodCodeSelStr in '..\基础模块\库存管理\UntgoodCodeSelStr.pas' {fmgoodCodeSelStr},
  dlg_bsselect in '..\基础模块\库存管理\dlg_bsselect.pas' {fmbsselect},
  Uinstock in '..\基础模块\库存管理\Uinstock.pas' {frmin_stock},
  Ustockstates in '..\基础模块\库存管理\Ustockstates.pas' {frmstockstates},
  Udlgstock in 'Udlgstock.pas' {dlgstock},
  fm_Splash in '..\基础模块\基FORM\fm_Splash.pas' {FmSplash},
  usystem in 'usystem.pas' {fm_system},
  Uflat in '..\基础模块\库存管理\Uflat.pas' {fmflat},
  fm_BatchGuest in '..\基础模块\库存管理\fm_BatchGuest.pas' {fmBatchGuest},
  Unitzcser in '..\基础模块\基FORM\Unitzcser.pas' {frmzcser},
  Unitthzh in '..\基础模块\基FORM\Unitthzh.pas',
  UntgoodCodeSelPei in '..\基础模块\配送管理\UntgoodCodeSelPei.pas' {fmgoodCodeSelPei},
  Unt_PubStrGrid in '..\基础模块\配送管理\Unt_PubStrGrid.pas',
  UntPosSendBill in '..\基础模块\配送管理\UntPosSendBill.pas' {FmPosSendBill},
  UntAskGoodsPlan in '..\基础模块\配送管理\UntAskGoodsPlan.pas' {FmAskGoodsPlan},
  UntPosAskBackBill in '..\基础模块\配送管理\UntPosAskBackBill.pas' {FmPosAskBackBill},
  UntPosQuestBillStr in '..\基础模块\配送管理\UntPosQuestBillStr.pas' {FmPosQuestBillStr},
  Untpart in '..\基础模块\配送管理\Untpart.pas' {fmps_part},
  Untgoodcodedetail in '..\基础模块\配送管理\Untgoodcodedetail.pas' {fmgoodCodedetail},
  Check_Query in 'Check_Query.pas' {FrmCheck_Query},
  untPubQueryDB in '..\基础模块\基FORM\untPubQueryDB.pas',
  Untps_query in '..\基础模块\配送管理\Untps_query.pas' {fmps_query},
  Untdlgselect in '..\基础模块\配送管理\Untdlgselect.pas' {dlgps_select},
  Untwldw in '..\基础模块\Untwldw.pas' {fmwldw},
  Untwarn_limit in '..\基础模块\库存管理\Untwarn_limit.pas' {fmstockwarnlimit},
  Untsalemoney in '..\基础模块\库存管理\Untsalemoney.pas' {fmsalemoney},
  Untprice in '..\基础模块\库存管理\Untprice.pas' {fmbaseprice},
  dlg_priceselect in '..\基础模块\库存管理\dlg_priceselect.pas' {dlgpriceselect},
  dlg_warning_limit in '..\基础模块\库存管理\dlg_warning_limit.pas' {fm_limit_warning},
  Untcompanyinit in '..\基础模块\Untcompanyinit.pas' {fm_company},
  Untlimitgoods in '..\基础模块\库存管理\Untlimitgoods.pas' {fmlimitgoods},
  UntSystemset in '..\基础模块\UntSystemset.pas' {fmSystemset},
  UntGuestset in '..\基础模块\UntGuestset.pas' {fmguestset},
  UntgoodscodeRe in '..\基础模块\库存管理\UntgoodscodeRe.pas' {fmgoodCodeRE},
  UntQuerycontract in '..\基础模块\库存管理\UntQuerycontract.pas' {fmQuerycontract},
  Unitreportxf in '..\基础模块\Unitreportxf.pas' {fastrepxf},
  Unitaddreport in '..\基础模块\Unitaddreport.pas' {Frmaddreport},
  UntEIprices in '..\基础模块\库存管理\UntEIprices.pas' {fmEIprices},
  Stock_Fad_Query in 'Stock_Fad_Query.pas' {frmStock_Fad_Query},
  untOut_strip in '..\基础模块\库存管理\untOut_strip.pas' {frm_Out_strip_Query},
  untScrap in 'untScrap.pas' {fm_Scrap_Query},
  untoverflow_query in 'untoverflow_query.pas' {fm_OverFlow_Query},
  untwldwgoodsquery in 'untwldwgoodsquery.pas' {fmwldwgoodsquery},
  Untbatchiput in '..\基础模块\配送管理\Untbatchiput.pas' {fmBatchinput},
  GD_Chain_Server_TLB in '..\基础模块\GD_Chain_Server_TLB.pas',
  Untbatchmanager in '..\基础模块\配送管理\Untbatchmanager.pas' {fmBatchmanager},
  Untselectps in '..\基础模块\配送管理\Untselectps.pas' {dlgselectps},
  UntSQpspart in '..\基础模块\配送管理\UntSQpspart.pas' {dlgSQpspart},
  Untbasegrid in '..\基础模块\Untbasegrid.pas' {fmBasegrid},
  UntWldwStaff in '..\基础模块\决策分析\UntWldwStaff.pas' {fmWldwStaff},
  UntGoodsStaff in '..\基础模块\决策分析\UntGoodsStaff.pas' {fmStockAmountStaff},
  dlgGoodsStaff in '..\基础模块\决策分析\dlgGoodsStaff.pas' {dlgGoodsStaffS},
  UntMsgGoods in '..\基础模块\配送管理\UntMsgGoods.pas' {dlgmsggoods},
  UntMoneyStaff in '..\基础模块\决策分析\UntMoneyStaff.pas' {fmMoneyStaff},
  UntGoodsSale in '..\基础模块\决策分析\UntGoodsSale.pas' {fmGoodsSale},
  UntContactwarn in '..\基础模块\决策分析\UntContactwarn.pas' {fmContactWarn},
  Unitkqsj in '..\基础模块\员工考勤\Unitkqsj.pas' {frmkqsj},
  Untbcjg in '..\基础模块\员工考勤\Untbcjg.pas' {fmBcJg},
  Unitbcjglr in '..\基础模块\员工考勤\Unitbcjglr.pas' {frmbcjglr},
  Untbcap in '..\基础模块\员工考勤\Untbcap.pas' {fmBcap},
  Untbcaplr in '..\基础模块\员工考勤\Untbcaplr.pas' {fmbcaplr},
  dlgkqdate in '..\基础模块\员工考勤\dlgkqdate.pas' {dlgkqdata},
  Untnewshopgoods in '..\基础模块\员工考勤\Untnewshopgoods.pas' {fmshopgoods},
  Udlgtotalselect in '..\基础模块\决策分析\Udlgtotalselect.pas' {dlgtotalselect},
  UntTotalStaff in '..\基础模块\决策分析\UntTotalStaff.pas' {fmTotalStaff},
  Udlgselectdate in '..\基础模块\库存管理\Udlgselectdate.pas' {dlgselectdate},
  UKqdatamanager in '..\基础模块\员工考勤\UKqdatamanager.pas' {fmKqManager},
  UdlgGoodsSale in '..\基础模块\决策分析\UdlgGoodsSale.pas' {dlgGoodsSale},
  Ustocking in '..\基础模块\决策分析\Ustocking.pas' {fmstocking},
  UPosGoods in '..\基础模块\配送管理\UPosGoods.pas' {fmPosGoods},
  UdlgPosGoods in '..\基础模块\配送管理\UdlgPosGoods.pas' {dlgPosGoods},
  onlygoods in '..\基础模块\决策分析\onlygoods.pas' {fmonlygoods},
  UGlassStaff in '..\基础模块\库存管理\UGlassStaff.pas' {fmGlassStaff},
  UStockType in '..\基础模块\决策分析\UStockType.pas' {FmStockType},
  UDlgonlygoods in '..\基础模块\决策分析\UDlgonlygoods.pas' {DlgOnlyGoods},
  UTotalbreed in '..\基础模块\决策分析\UTotalbreed.pas' {fmTotalBreed},
  UBaseprices in '..\基础模块\库存管理\UBaseprices.pas' {fmBaseprices},
  UUnPos in '..\基础模块\配送管理\UUnPos.pas' {fmUnPosSendBill},
  USelgoodCode in '..\基础模块\配送管理\USelgoodCode.pas' {fmSelgoodCode},
  Unitlmxx in '..\基础模块\Unitlmxx.pas' {frmlmxx},
  UMsgmanager in '..\基础模块\UMsgmanager.pas' {fmMsgmanager},
  Unitlmmxlr in '..\基础模块\Unitlmmxlr.pas' {frmlmmxlr},
  UntZsManager in '..\基础模块\库存管理\UntZsManager.pas' {fmZSmanager},
  Unitbbs in '..\基础模块\Unitbbs.pas' {frmbbs},
  Unitbbsmx in '..\基础模块\Unitbbsmx.pas' {frmbbsmx},
  USetAgion in '..\基础模块\USetAgion.pas' {fmSetAgion},
  ExitInfo in '..\基础模块\财务模块\ExitInfo.pas' {ExitInfoFm},
  ModifyAccount in '..\基础模块\财务模块\ModifyAccount.pas' {ModifyAccountFm},
  SysDate in '..\基础模块\财务模块\Sysdate.pas' {datewindow},
  Y_DealIn in '..\基础模块\财务模块\Y_DealIn.pas' {Y_DealInFm},
  AccountSelect in '..\基础模块\财务模块\AccountSelect.pas' {AccountSelectFm},
  w_more in '..\基础模块\财务模块\w_more.pas' {w_morefm},
  UYdPosBill in '..\基础模块\配送管理\UYdPosBill.pas' {FmYdPosBill},
  UDLGYDPOS in '..\基础模块\配送管理\UDLGYDPOS.pas' {DlgYdPos},
  UOrderGoods in '..\基础模块\UOrderGoods.pas' {fmOrderQuery},
  UFlatQuery in '..\基础模块\库存管理\UFlatQuery.pas' {fmFlatQuery},
  Ufinance in '..\基础模块\财务模块\Ufinance.pas' {fmMoneyGain},
  UPresent in '..\基础模块\库存管理\UPresent.pas' {FmPresentQuery},
  UNewShopQuery in '..\基础模块\库存管理\UNewShopQuery.pas' {fmNewShopQuery},
  UStock_cancel in '..\基础模块\库存管理\UStock_cancel.pas' {FmCancel},
  UUnfinance in '..\基础模块\库存管理\UUnfinance.pas' {fmfinanceUnpos},
  UBacthDataQuery in '..\基础模块\配送管理\UBacthDataQuery.pas' {fmBacthQuery},
  UBacthstaff in '..\基础模块\配送管理\UBacthstaff.pas' {fmBacthStaff};

{$R *.res}


var
  hMutex:HWND;
  Ret: Integer;
begin
  hMutex:=CreateMutex(nil,False,'WenDingSoftManagerErice');
  Ret:=GetLastError;
  //If Ret<>ERROR_ALREADY_EXISTS Then
  //begin
      Application.Initialize;
      Application.Title := '【连锁销售管理系统】后台版 Beta 2.8.2';
      FmSplash:=TFmSplash.Create(application);
      FmSplash.Show;
      FmSplash.update ;
      try
       Application.CreateForm(Tfrm_Data, frm_Data);
       Application.CreateForm(Tdmmain, dmmain);
      except
      end;
      FmSplash.close;
      FmSplash.free;
      frm_Login := Tfrm_Login.Create(Application);
      frm_Login.ShowModal;
      frm_login.Close;
      frm_Login.Free;
      ////////////////////////////////  显示预警窗口
      if ShowLimit=0 then
      begin
        fm_limit_warning:=tfm_limit_warning.Create(application);
        fm_limit_warning.ShowModal;
        fm_limit_warning.Close;
        fm_limit_warning.Free;
      end;
      ///////////////////////////////////////
      try
        Application.CreateForm(Tfrm_Main, frm_Main);
        Application.Run;
      except
          Application.MessageBox('系统错误。请确认！','错误',MB_iconwarning);
      end;
  //end
  //else
 // begin
      //Application.MessageBox('程序正在运行中！','提示',MB_iconInformation);
      //ReleaseMutex(hMutex);
  //end;
end.
