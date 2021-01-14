program store;

uses
  Forms,
  windows,
  Wellcome in 'Wellcome.pas' {frmWellcome},
  data in 'data.pas' {DM: TDataModule},
  login in 'login.pas' {frmLogin},
  main in 'main.pas' {frmMain},
  common in 'common.pas',
  about in 'ABOUT.PAS' {frmabout},
  supp in 'supp.pas' {frmSupp},
  goods in 'goods.pas' {frmGoods},
  cust in 'cust.pas' {frmCust},
  gdstype in 'gdstype.pas' {frmType},
  firstStore in 'firstStore.pas' {frmFirstStoreAdd},
  gds in 'gds.pas' {frmGDS},
  sale in 'sale.pas' {frmSale},
  gdsSelect in 'gdsSelect.pas' {frmGdsSelect},
  gdsUnit in 'gdsUnit.pas' {frmGdsUnit},
  sellPriceHist in 'SellPriceHist.pas' {frmSellPriceHist},
  inPriceHist in 'InPriceHist.pas' {frmInPriceHist},
  buy in 'buy.pas' {frmBuy},
  SheetBrow in 'SheetBrow.pas' {frmQrySheet},
  salebrow in 'salebrow.pas' {frmSaleBrow};

{$R *.res}


var PrevWindow: HWND;
begin
  //  mmPopupMsgDlg := True;//（标示如果有内存泄漏就弹出对话框）
  //  mmShowObjectInfo := True;
    //（标示如果有内存泄漏就记录内存泄漏对象Memory.chk）
  Application.Initialize;
  Application.Title := '进销存系统';
  PrevWindow := FindWindow('TfrmMain', '进销存系统');
  if PrevWindow <> 0 then
    begin
      Application.MessageBox('程序已经运行中，请耐心等待!', '警告', MB_OK + MB_DEFBUTTON1);
      SetForeGroundWindow(prevWindow);
      Application.Terminate;
    end
  else
    begin
      frmWellcome := TfrmWellcome.Create(application);
      frmWellcome.Show;
      frmWellcome.Update;

      Application.CreateForm(Tdm, dm);
  frmwellcome.hide;
      frmWellcome.Free;
      frmWellcome := nil;

      frmlogin := Tfrmlogin.Create(application);
      frmlogin.Showmodal;
      frmlogin.Update;

      while not frmLogin.GetIsLogined do //是否显示完，
        begin
          frmlogin.Showmodal;
          frmlogin.Update;
        end;

      if frmlogin.isquit then
        begin
          frmlogin.Hide;
          frmlogin.free;
          frmlogin := nil;
          application.Terminate;
        end
      else
        begin
          Application.CreateForm(TfrmMain, frmMain);
          frmlogin.Hide;
          frmlogin.free;
          frmlogin := nil;
          Application.Run;
        end;
    end;
end.

