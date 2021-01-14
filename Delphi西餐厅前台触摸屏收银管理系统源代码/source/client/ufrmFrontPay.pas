unit ufrmFrontPay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, StdCtrls, Buttons,
  ExtCtrls, dxDBTLCl, dxGrClms, DB, dxmdaset, dxfColorButton, ADODB,
  CSADOQuery, dxEditor, dxEdLib, OleCtrls, MSCommLib_TLB;

type
  TfrmFrontPay = class(TForm)
    Panel1: TPanel;
    pSaleName: TPanel;
    pItem: TPanel;
    memConsume: TdxMemData;
    memConsumeI_SALE_NAME: TStringField;
    memConsumeI_QTY: TIntegerField;
    memConsumeI_MONEY: TCurrencyField;
    Consumed: TDataSource;
    SaleItemq: TCSADOQuery;
    SaleItemqI_ORIGINAL_CD: TStringField;
    SaleItemqI_ORIGINAL_NAME: TStringField;
    Saleq: TCSADOQuery;
    SaleqI_SALE_CD: TStringField;
    SaleqI_SALE_NAME: TStringField;
    SaleqI_PRICE: TBCDField;
    SaleqI_UNIT: TStringField;
    SaleqI_SALE_ITEM_CD: TStringField;
    SaleqI_HELPER_CODE: TStringField;
    memConsumeI_SALE_CD: TStringField;
    memConsumeI_PRICE: TCurrencyField;
    Tradeq: TCSADOQuery;
    TradeqI_TRADE_CD: TStringField;
    TradeqI_TRADE_MONEY: TBCDField;
    TradeqI_TRADE_DATE: TStringField;
    TradeqI_TRADE_TIME: TStringField;
    TradeqI_EMP_CD: TStringField;
    TradeqI_WORK_CD: TStringField;
    TradeqI_TRADE_FLAG1: TIntegerField;
    TradeqI_TRADE_FLAG2: TIntegerField;
    TradeqI_TRADE_FLAG3: TIntegerField;
    TradeDetailq: TCSADOQuery;
    TradeDetailqI_TRADE_CD: TStringField;
    TradeDetailqI_SALE_CD: TStringField;
    TradeDetailqI_SALE_ITEM_CD: TStringField;
    TradeDetailqI_QTY: TIntegerField;
    TradeDetailqI_PRICE: TBCDField;
    TradeDetailqI_AMOUNT: TBCDField;
    memConsumeI_SALE_ITEM_CD: TStringField;
    TradeDetailqI_TRADE_FLAG1: TIntegerField;
    TradeDetailqI_TRADE_FLAG2: TIntegerField;
    TradeDetailqI_TRADE_FLAG3: TIntegerField;
    TradeqI_DISCOUNT: TIntegerField;
    SaleqI_FIX_SALE: TBooleanField;
    SaleqI_SALE_RECORD: TBooleanField;
    SaleqI_OTHER_RECORD: TBooleanField;
    SaleqI_LSM: TBooleanField;
    memConsumeI_FIX_SALE: TBooleanField;
    memConsumeI_SALE_RECORD: TBooleanField;
    memConsumeI_OTHER_RECORD: TBooleanField;
    memConsumeI_LSM: TBooleanField;
    memConsumeI_FIX_SALE_CD: TStringField;
    FixSaleq: TCSADOQuery;
    FixSaleqI_SALE_CD: TStringField;
    FixSaleqI_SALE_NAME: TStringField;
    FixSaleqI_PRICE: TBCDField;
    FixSaleqI_UNIT: TStringField;
    FixSaleqI_ITEM_CD: TStringField;
    FixSaleqI_FIX_SALE: TBooleanField;
    FixSaleqI_SALE_RECORD: TBooleanField;
    FixSaleqI_OTHER_RECORD: TBooleanField;
    FixSaleqI_LSM: TBooleanField;
    FixSaleqI_SALE_ITEM_CD: TStringField;
    FixSaleqI_HELPER_CODE: TStringField;
    TradeqI_MACHINES_CD: TStringField;
    TradeDetailqI_TRADE_FLAG4: TIntegerField;
    TradeDetailqI_TRADE_FLAG5: TIntegerField;
    TradeDetailqI_FIX_SALE_CD: TStringField;
    SaleItemqI_ITEM_COLOR: TStringField;
    memLock: TdxMemData;
    Panel2: TPanel;
    Panel5: TPanel;
    Label9: TLabel;
    eMoney: TdxCurrencyEdit;
    bbtnInner: TdxfColorButton;
    bbtnOutSelf: TdxfColorButton;
    bbtnOutSend: TdxfColorButton;
    btnCharge: TdxfColorButton;
    Panel6: TPanel;
    btnExit: TdxfColorButton;
    bbtnDelAll: TdxfColorButton;
    btnVip: TdxfColorButton;
    btnDiscount: TdxfColorButton;
    bbtnDelete: TdxfColorButton;
    bbtnChange: TdxfColorButton;
    bbtnSwitchDrink: TdxfColorButton;
    bbtnLSM: TdxfColorButton;
    bbtnWait: TdxfColorButton;
    bbtnTradeInfo: TdxfColorButton;
    Panel7: TPanel;
    grdList: TdxDBGrid;
    grdListRecId: TdxDBGridColumn;
    grdListI_SALE_CD: TdxDBGridMaskColumn;
    grdListI_SALE_ITEM_CD: TdxDBGridMaskColumn;
    grdListI_SALE_NAME: TdxDBGridMaskColumn;
    grdListI_QTY: TdxDBGridMaskColumn;
    grdListI_PRICE: TdxDBGridCurrencyColumn;
    grdListI_MONEY: TdxDBGridCurrencyColumn;
    memLockI_SALE_CD: TStringField;
    memLockI_SALE_ITEM_CD: TStringField;
    memLockI_SALE_NAME: TStringField;
    memLockI_FIX_SALE: TBooleanField;
    memLockI_SALE_RECORD: TBooleanField;
    memLockI_OTHER_PECORD: TBooleanField;
    memLockI_LSM: TBooleanField;
    memLockI_QTY: TIntegerField;
    memLockI_PRICE: TCurrencyField;
    memLockI_MONEY: TCurrencyField;
    memLockI_FIX_SALE_CD: TStringField;
    LSMq: TCSADOQuery;
    LSMqI_SALE_CD: TStringField;
    LSMqI_SALE_NAME: TStringField;
    LSMqI_PRICE: TBCDField;
    LSMqI_UNIT: TStringField;
    LSMqI_FIX_SALE: TBooleanField;
    LSMqI_SALE_RECORD: TBooleanField;
    LSMqI_OTHER_RECORD: TBooleanField;
    LSMqI_LSM: TBooleanField;
    LSMqI_SALE_ITEM_CD: TStringField;
    LSMqI_HELPER_CODE: TStringField;
    MSComm: TMSComm;
    btnNum4: TdxfColorButton;
    btnNum3: TdxfColorButton;
    btnNum2: TdxfColorButton;
    btnNum1: TdxfColorButton;
    btnNum0: TdxfColorButton;
    btnNumNext: TdxfColorButton;
    btnEditNum: TdxfColorButton;
    procedure btnExitClick(Sender: TObject);
    procedure bbtnInnerClick(Sender: TObject);
    procedure bbtnOutSendClick(Sender: TObject);
    procedure bbtnOutSelfClick(Sender: TObject);
    procedure bbtnTradeInfoClick(Sender: TObject);
    procedure bbtnChangeClick(Sender: TObject);
    procedure bbtnWaitClick(Sender: TObject);
    procedure bbtnDeleteClick(Sender: TObject);
    procedure btnDiscountClick(Sender: TObject);
    procedure btnChargeClick(Sender: TObject);
    procedure bbtnDelAllClick(Sender: TObject);
    procedure bbtnLSMClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnNumNextClick(Sender: TObject);
    procedure btnEditNumClick(Sender: TObject);
  private
    Fi_Flag, Fi_NewQTY: Integer;
    Fb_Change, Fb_IsNew: Boolean;
    //Fb_Change注解
    //=====================================
    //用于只能修改一次错误消费在一张账单中
    //Fb_Change := True; 表示当前可以使用一次 
    //Fb_Change := False; 表示当前已经使用过一次在一张账单中. 
    //=====================================
    //Fb_IsWait注解
    //先检查数据中是否有挂账数据
    //有Fb_IsWait := True; 没有Fb_IsWait := False;
    //在结账时判断是否是结账数据
    //===================================== 
    Fi_Color: TColor;
    Fc_WaitAmount: Currency;
    Fb_NumNext: Boolean;
    procedure prip_SendKX;
    procedure prip_SendCommand(As_Command: String);
    procedure prip_TradeCharge(Ab_Print: Boolean = False);
    procedure prip_CreateSaleItem;
    procedure prip_CreateSaleInfo(As_ItemCd: String);
    procedure prip_ShowSaleInfo(As_ItemCd: String);
    procedure prip_ShowLSMSaleInfo;
    procedure prip_CreateLSMSale;
    procedure prip_OnBtnNumClick(Sender: TObject);
    procedure prip_OnBtnSaleItemClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure prip_OnBtnSaleClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);   
    procedure prip_OnBtnLSMSaleClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure prip_ConsumeSale(As_SaleCd: String);
    procedure prip_AddFixSale(As_FixSaleCD: String);
    procedure prip_AddLSMSale(As_SaleCd: String);
    procedure prip_AddConsume(As_SaleCd: String);
    procedure prip_IniInterFace;
    procedure prip_IniData; 
  public
    procedure pubp_Ini;
  end;

var
  frmFrontPay: TfrmFrontPay;

implementation
uses udmData, StrUtils, upubCommon, ufrmTradeInfo, ufrmCheckPower, Math,
  ufrmDiscount;
  //, Printers;
{$R *.dfm}
//{$DEFINE DEBUG}

procedure TfrmFrontPay.prip_ConsumeSale(As_SaleCd: String);
var
  ls_Command: String;
begin
  if (not Saleq.Active) or (Saleq.IsEmpty) then Exit;
  if not memConsume.Active then memConsume.Open;
  if Saleq.Locate('I_SALE_CD', As_SaleCd, []) then
  begin
    ls_Command := Chr($1B) + Chr($73) + Chr($31);
    prip_SendCommand(ls_Command);
    ls_Command := Chr($1B) + Chr($51) + Chr($41) + CurrToStr(Saleq.FieldByName('I_PRICE').AsCurrency) +
      Chr($0D);
    prip_SendCommand(ls_Command);
    if memConsume.Locate('I_SALE_CD', As_SaleCd, []) then
    begin
      with memConsume do
      begin
        DisableControls;
        Edit;
        FieldValues['I_QTY'] := FieldValues['I_QTY'] + 1;
        FieldValues['I_MONEY'] := FieldValues['I_MONEY'] + Saleq.FieldValues['I_PRICE'];
        eMoney.Value := eMoney.Value + Saleq.FieldByName('I_PRICE').AsCurrency;
        Post; 
        EnableControls;
      end;
    end else
    begin
      with memConsume do
      begin
        DisableControls;
        Append;
        FieldValues['I_SALE_CD'] := Saleq.FieldValues['I_SALE_CD'];
        FieldValues['I_SALE_ITEM_CD'] := Saleq.FieldValues['I_SALE_ITEM_CD'];
        FieldValues['I_SALE_NAME'] := Saleq.FieldValues['I_SALE_NAME']; 
        FieldValues['I_FIX_SALE'] := Saleq.FieldValues['I_FIX_SALE'];
        FieldValues['I_SALE_RECORD'] := Saleq.FieldValues['I_SALE_RECORD'];
        FieldValues['I_OTHER_RECORD'] := Saleq.FieldValues['I_OTHER_RECORD'];
        FieldValues['I_LSM'] := Saleq.FieldValues['I_LSM'];
        FieldValues['I_QTY'] := 1;
        FieldValues['I_PRICE'] := Saleq.FieldValues['I_PRICE'];
        FieldValues['I_MONEY'] := Saleq.FieldValues['I_PRICE'];
        eMoney.Value := eMoney.Value + Saleq.FieldByName('I_PRICE').AsCurrency;
        Post;
        EnableControls;
      end;
    end;
    Sleep(300);  
    ls_Command := Chr($1B) + Chr($73) + Chr($32);
    prip_SendCommand(ls_Command);
    ls_Command := Chr($1B) + Chr($51) + Chr($41) + CurrToStr(eMoney.Value) +
      Chr($0D);
    prip_SendCommand(ls_Command);
    Exit;
    if Saleq.FieldByName('I_FIX_SALE').AsBoolean then
    begin 
      prip_AddFixSale(As_SaleCd);
      Exit;
    end;
    if Saleq.FieldByName('I_LSM').AsBoolean then
    begin
      prip_AddLSMSale(As_SaleCd);
      Exit;
    end;
    prip_AddConsume(As_SaleCd);
  end;
end;

procedure TfrmFrontPay.prip_CreateSaleInfo(As_ItemCd: String);
var
  lc_BtnSale: TdxfColorButton;
  li_I, li_J: Integer;
  lc_Control: TControl;
  procedure ClearBtn;
  var
    li_K: Integer;
    li_BtnCount: Integer;
  begin
    li_K := pSaleName.ControlCount - 1;
    for li_BtnCount := li_K  downto 0 do
    begin
      lc_Control := pSaleName.Controls[li_BtnCount];
      if lc_Control is TdxfColorButton then
        lc_Control.Free;
    end;
  end;
begin
  //ClearBtn;
  li_I := 1;
  li_J := 0;
  with Saleq do
  begin
    {
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT * FROM T_SALE_MS WHERE I_SALE_ITEM_CD = ''%s''',
      [As_ItemCd]);
    Open; }
    Filter := Format('I_SALE_ITEM_CD = ''%s'' AND I_HELPER_CODE <> ''0'' AND I_LSM = 0',
      [As_ItemCd]);
    Filtered := True;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        lc_BtnSale := TdxfColorButton.Create(nil);
        lc_BtnSale.Parent := pSaleName;
        lc_BtnSale.Caption.Text := CurrToStr(FieldByName('I_PRICE').AsCurrency) +
          FieldByName('I_SALE_NAME').AsString;
        lc_BtnSale.Name := 'BtnSale' + FieldByName('I_SALE_CD').AsString;
        lc_BtnSale.Width := 100;
        lc_BtnSale.Height := 50;
        lc_BtnSale.Font.Height := -24;
        lc_BtnSale.Font.Size := 10;
        //lc_BtnSale.Color := Fi_Color;
        //lc_BtnSale.Color := ClGreen;
        //TColor(FieldByName('I_ITEM_COLOR').AsInteger);
        lc_BtnSale.OnMouseDown := prip_OnBtnSaleClick;
        if li_I = 1 then
        begin
          lc_BtnSale.Left := 5;
        end else begin
          lc_BtnSale.Left := (li_I - 1) * 100 + (li_I - 1) * 10;
        end;
        if li_J = 0 then
        begin 
          lc_BtnSale.Top := 5;
        end else begin
          lc_BtnSale.Top := li_J * 50 + li_J * 10;
        end;
        inc(li_I);
        if li_I = 5 then
        begin
          li_I := 1;
          inc(li_J);
        end;
        lc_BtnSale.Visible := False; 
        Next;
      end;
    end;
  end;
end;

procedure TfrmFrontPay.prip_CreateSaleItem;
var
  lc_BtnSaleItem: TdxfColorButton;
  li_I, li_J: Integer;
begin
  li_I := 1;
  li_J := 0;
  with SaleItemq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM T_SALE_ITME_MS ORDER BY I_ITEM_CD ASC';
    Open;
    {$IF DEFINED(DEBUG)}
      SQL.SaveToFile('Debug.Text');
    {$IFEND}
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        lc_BtnSaleItem := TdxfColorButton.Create(nil);
        lc_BtnSaleItem.Parent := pItem;
        lc_BtnSaleItem.Caption.Text := FieldByName('I_ITEM_NAME').AsString;
        lc_BtnSaleItem.Name := 'BtnSaleItem' + FieldByName('I_ITEM_CD').AsString;
        lc_BtnSaleItem.Width := 100;
        lc_BtnSaleItem.Height := 50;
        lc_BtnSaleItem.Font.Height := -24;
        lc_BtnSaleItem.Font.Size := 18;
        lc_BtnSaleItem.Color := TColor(StrToInt64(FieldByName('I_ITEM_COLOR').AsString));
        lc_BtnSaleItem.OnMouseDown := prip_OnBtnSaleItemClick;
        if li_I = 1 then
        begin
          lc_BtnSaleItem.Left := 5;
        end else begin
          lc_BtnSaleItem.Left := (li_I - 1) * 100 + (li_I - 1) * 10;
        end;
        if li_J = 0 then
        begin 
          lc_BtnSaleItem.Top := 5;
        end else begin
          lc_BtnSaleItem.Top := li_J * 50 + li_J * 10;
        end;
        inc(li_I);
        if li_I = 5 then
        begin
          li_I := 1;
          inc(li_J);
        end;
        prip_CreateSaleInfo(FieldByName('I_ITEM_CD').AsString);
        Next;
      end;
      Close;
    end;
  end;
end;

procedure TfrmFrontPay.prip_IniData;
begin
  Fb_IsNew := True;
  Fb_Change := True;
  with Tradeq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM T_TRADE_MS WHERE 1 = 2';
    Open;
  end;
  with Saleq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM T_SALE_MS WHERE I_HELPER_CODE <> ''0'' AND I_LSM = 0';
    Open;
  end;
{  with FixSaleq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT A.I_SALE_CD, B.I_SALE_NAME, B.I_PRICE, B.I_UNIT FROM ' +
      'T_SALE_FIX_MS A, T_SALE_MS B WHRER A.I_SALE_CD =  B.I_SALE_CD';
    Open;
  end;  }
  prip_CreateSaleItem;
  prip_CreateLSMSale;
  //ShowMessage('1');
end;

procedure TfrmFrontPay.prip_IniInterFace;
begin
  WindowState := wsMaximized;
end;

procedure TfrmFrontPay.prip_OnBtnSaleClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
var 
  ls_SaleCd: String;
begin
  if Sender is TdxfColorButton then
  begin
    ls_SaleCd := MidStr((Sender as TdxfColorButton).Name, 8, 4);
    {$IF DEFINED(DEBUG)}
      ShowMessage(ls_SaleCd);
    {$IFEND}
    prip_ConsumeSale(ls_SaleCd);
  end;
end;

procedure TfrmFrontPay.prip_OnBtnSaleItemClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
var
  ls_ItemCd: String;
begin
  if Sender is TdxfColorButton then
  begin
    ls_ItemCd := MidStr((Sender as TdxfColorButton).Name, 12, 2);
    Fi_Color := (Sender as TdxfColorButton).Color;
    {$IF DEFINED(DEBUG)}
      ShowMessage(ls_ItemCd);
    {$IFEND}
    prip_ShowSaleInfo(ls_ItemCd);
    //prip_CreateSaleInfo(ls_ItemCd);
  end;
end;

procedure TfrmFrontPay.pubp_Ini;
begin
  prip_IniData;
  prip_IniInterFace;
  prip_SendKX;
  btnNum0.OnClick := prip_OnBtnNumClick;  
  btnNum1.OnClick := prip_OnBtnNumClick;
  btnNum2.OnClick := prip_OnBtnNumClick;
  btnNum3.OnClick := prip_OnBtnNumClick;
  btnNum4.OnClick := prip_OnBtnNumClick;
  Fb_NumNext := False;
end;

procedure TfrmFrontPay.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFrontPay.bbtnInnerClick(Sender: TObject);
begin   
  bbtnInner.Color := ClRed;
  bbtnOutSend.Color := ClLime;
  bbtnOutSelf.Color := ClLime;
  Fi_Flag := AI_INNER;
end;

procedure TfrmFrontPay.bbtnOutSendClick(Sender: TObject);
begin     
  bbtnInner.Color := ClLime;
  bbtnOutSend.Color := ClRed;
  bbtnOutSelf.Color := ClLime;
  Fi_Flag := AI_OUTSEND;
end;

procedure TfrmFrontPay.bbtnOutSelfClick(Sender: TObject);
begin
  bbtnInner.Color := ClLime;
  bbtnOutSend.Color := ClLime;
  bbtnOutSelf.Color := ClRed;
  Fi_Flag := AI_OUTSELF;
end;

procedure TfrmFrontPay.bbtnTradeInfoClick(Sender: TObject);
begin
  frmTradeInfo := TfrmTradeInfo.Create(Self);
  frmTradeInfo.pubp_Ini;
  frmTradeInfo.Show;
end;

procedure TfrmFrontPay.bbtnChangeClick(Sender: TObject);
begin
  if not Fb_Change then Exit;
  if (not memConsume.Active) or (memConsume.IsEmpty) then Exit;
  eMoney.Value := eMoney.Value - memConsume.FieldByName('I_MONEY').AsCurrency;
  memConsume.Delete;
  bbtnChange.Color := ClRed;
  Fb_Change := False;
end;

procedure TfrmFrontPay.bbtnWaitClick(Sender: TObject);  
begin
  if not pubCommon.IsWait then
  begin
    if (not memConsume.Active) or (memConsume.IsEmpty) then Exit;
    memLock.LoadFromDataSet(memConsume);
    memConsume.Close;
    Fc_WaitAmount := eMoney.Value;
    eMoney.Value := 0.00;
    pubCommon.IsWait := True;
    bbtnWait.Color := ClRed;
    bbtnWait.Caption.Text := '解挂';
  end else begin
    if not PowerInfo.UnLock then Exit;
    if memLock.IsEmpty then Exit;
    memConsume.LoadFromDataSet(memLock);
    eMoney.Value := Fc_WaitAmount;
    memLock.Close;
    pubCommon.IsWait := False;
    bbtnChange.Color := ClBlue;
    bbtnWait.Color := ClBlue;
    bbtnWait.Caption.Text := '挂账';
  end;
end;

procedure TfrmFrontPay.bbtnDeleteClick(Sender: TObject);
begin
  if (not memConsume.Active) or (memConsume.IsEmpty) then Exit;
  if not PowerInfo.Delete then Exit;
  Fi_Flag := AI_DELETE;
  eMoney.Value := 0.00;
  prip_TradeCharge(False);
end;

procedure TfrmFrontPay.btnDiscountClick(Sender: TObject);
begin
  if (not memConsume.Active) or (memConsume.IsEmpty) then Exit;
  if not PowerInfo.OutDiscount then Exit;
  frmDiscount := TfrmDiscount.Create(nil);
  try
    frmDiscount.pubp_Ini;
    if frmDiscount.ShowModal = mrOk then
    begin
      Fi_Flag := AI_DISCOUNT;
      eMoney.Value := RoundTo((eMoney.Value/100) * LoginInfo.DisCount, -1);
    end;
  finally
    frmDiscount.Free;
  end; 
end;

procedure TfrmFrontPay.prip_TradeCharge(Ab_Print: Boolean);
var
  ls_Trade_CD: String;  
  lc_Rect: TRect;
  li_I: Integer;
  ls_SaleName, ls_Qty, ls_Amount, ls_Quantity, ls_Name, ls_Money, ls_PrintValue: String;
begin
  if (not memConsume.Active) or (memConsume.IsEmpty) then Exit;
  ls_Name := '                            ';
  ls_Quantity := '               ';
  ls_Money :=  '    ';
  lc_Rect := Rect(50, 50, 100, 300);
  li_I := 0;
  ls_Trade_CD := dmData.pubf_GetTradeCD;
  with Tradeq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM T_TRADE_MS WHERE 1 = 2';
    Open;
    Append;
    FieldValues['I_TRADE_CD'] := ls_Trade_CD; 
    FieldValues['I_MACHINES_CD'] := MachinesInfo.MachinesCD;
    FieldValues['I_TRADE_MONEY'] := eMoney.Value;
    FieldValues['I_TRADE_DATE'] := FormatDateTime('YYYY-MM-DD', Date);;
    FieldValues['I_TRADE_TIME'] := FormatDateTime('HH:MM:SS', Time);;
    FieldValues['I_EMP_CD'] := LoginInfo.UserId;
    FieldValues['I_WORK_CD'] := LoginInfo.WorkCD;  
    FieldValues['I_TRADE_FLAG1'] := Fi_Flag;
    if Fi_Flag = AI_DISCOUNT then
    begin
      FieldValues['I_DISCOUNT'] := LoginInfo.DisCount;
      Fi_Flag := AI_INNER;
      bbtnInner.Color := clRed;
    end;
    Post;
    Close;
  end;
  with TradeDetailq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM T_TRADE_DETAIL_MS WHERE 1 = 2';
    Open;
    memConsume.First;
    //开始打印
    {if Ab_Print then
    begin
      Printer.BeginDoc;
      Printer.Canvas.Font.Size := dmData.Ai_Size;
      Printer.Canvas.TextOut(1, 4 + (li_I * Canvas.TextHeight('')), ShopInfo.ShopName);
      Inc(li_I);
      Printer.Canvas.TextOut(1, 4 + (li_I * Canvas.TextHeight(Application.Title)), '收费账单:' +
        ls_Trade_CD + '    ' + '收银员:' + LoginInfo.UserId);
      Inc(li_I);
      Canvas.TextOut(2, 2 + (li_I * Canvas.TextHeight(Application.Title)), '日期时间:' +
        FormatDateTime('YYYY-MM-DD HH:MM:SS', NOW));
      Inc(li_I);
      Canvas.TextOut(2, 2 + (li_I * Canvas.TextHeight(Application.Title)), '名称                       ' +
          ' 数量         ' + ' 金额(元)');
      Inc(li_I);
      Canvas.TextOut(2, 2 + (li_I * Canvas.TextHeight(Application.Title)), '---------------------');
      Inc(li_I);
    end;   }
    while not memConsume.Eof do
    begin
      Append;
      FieldValues['I_TRADE_CD'] := ls_Trade_CD;
      FieldValues['I_SALE_CD'] := memConsume.FieldValues['I_SALE_CD'];
      FieldValues['I_SALE_ITEM_CD'] := memConsume.FieldValues['I_SALE_ITEM_CD'];
      FieldValues['I_QTY'] := memConsume.FieldValues['I_QTY'];
      FieldValues['I_PRICE'] := memConsume.FieldValues['I_PRICE'];
      FieldValues['I_AMOUNT'] := memConsume.FieldValues['I_MONEY'];
      FieldValues['I_TRADE_FLAG1'] := Fi_Flag;
      if memConsume.FieldByName('I_FIX_SALE').AsBoolean then
      begin
        FieldValues['I_TRADE_FLAG2'] := 1;
        FieldValues['I_FIX_SALE_CD'] := memConsume.FieldValues['I_FIX_SALE_CD'];
      end else FieldValues['I_TRADE_FLAG2'] := 0;
      if memConsume.FieldByName('I_SALE_RECORD').AsBoolean then
      FieldValues['I_TRADE_FLAG3'] := 1 else FieldValues['I_TRADE_FLAG3'] := 0;
      if memConsume.FieldByName('I_OTHER_RECORD').AsBoolean then
      FieldValues['I_TRADE_FLAG4'] := 1 else FieldValues['I_TRADE_FLAG4'] := 0;
      if memConsume.FieldByName('I_LSM').AsBoolean then FieldValues['I_TRADE_FLAG5'] := 1
      else FieldValues['I_TRADE_FLAG5'] := 0;
      {if Ab_Print then
      begin
        ls_SaleName := memConsume.FieldByName('I_SALE_NAME').AsString;
        ls_SaleName := ls_SaleName + Copy(ls_Name, 1, 28 - Length(ls_SaleName));
        ls_Qty := IntToStr(memConsume.FieldByName('I_QTY').AsInteger);
        ls_Qty := ls_Qty + Copy(ls_Quantity, 1, 15 - Length(ls_Qty));
        ls_Amount := CurrToStr(memConsume.FieldByName('I_MONEY').AsCurrency);
        ls_PrintValue := ls_SaleName + ls_Qty + ls_Amount;
        Canvas.TextOut(2, 2 + (li_I * Canvas.TextHeight(ls_PrintValue)), ls_PrintValue);
        Inc(li_I);
      end; }
      Post;
      memConsume.Next;
    end;
    //结束打印
    {if Ab_Print then
    begin
      Canvas.TextOut(2, 2 + (li_I * Canvas.TextHeight(Application.Title)), '---------------------');
      Inc(li_I);
      Canvas.TextOut(2, 2 + (li_I * Canvas.TextHeight(Application.Title)),
        '消费合计金额:' + eMoney.Text);
      Inc(li_I);
      Printer.Canvas.TextOut(2, 2 + (li_I * Canvas.TextHeight(Application.Title)), '客户签名:');
      Printer.EndDoc;
    end;  }
    Close;
  end;
  memConsume.Close;
  eMoney.Value := 0.00;
  LoginInfo.DisCount := 100;
  Fb_Change := True;
  bbtnChange.Color := ClBlue;
end;

procedure TfrmFrontPay.btnChargeClick(Sender: TObject);
var
  ls_Command: String;
begin
  ls_Command := Chr($1B) + Chr($73) + Chr($32);
  prip_SendCommand(ls_Command);
  ls_Command := Chr($1B) + Chr($51) + Chr($41) + CurrToStr(eMoney.Value) +
    Chr($0D);
  WIndows.WinExec(PChar(ExtractFilePath(Application.ExeName) + 'Open.exe'), SW_HIDE);
  prip_SendCommand(ls_Command);
  prip_TradeCharge(True); 
end;

{$UNDEF DEBUG}

procedure TfrmFrontPay.prip_ShowSaleInfo(As_ItemCd: String);
var
  ls_BtnName: String;
  //lc_BtnSale: TComponent;
  lc_Control: TControl;
  procedure ClearBtn;
  var
    li_K: Integer;
    li_BtnCount: Integer;
  begin
    li_K := pSaleName.ControlCount - 1;
    for li_BtnCount := li_K  downto 0 do
    begin
      lc_Control := pSaleName.Controls[li_BtnCount];
      if lc_Control is TdxfColorButton then
        lc_Control.Visible := False;
    end;
  end;
begin
  ClearBtn;
  with Saleq do
  begin
    {
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT * FROM T_SALE_MS WHERE I_SALE_ITEM_CD = ''%s''',
      [As_ItemCd]);
    Open; }
    Filter := Format('I_SALE_ITEM_CD = ''%s'' AND I_HELPER_CODE <> ''0''', [As_ItemCd]);
    Filtered := True;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        ls_BtnName := 'BtnSale' + FieldByName('I_SALE_CD').AsString;
        //lc_BtnSale := pSaleName.FindComponent(ls_BtnName);
        lc_Control := pSaleName.FindChildControl(ls_BtnName);
        if lc_Control <> nil then
        begin
          TdxfColorButton(lc_Control).Color := Fi_Color;
          //lc_Control as TdxfColorButton
          lc_Control.Visible := True;
          //ShowMessage(lc_BtnSale.Name);
          //(lc_Control as TdxfColorButton).Visible := True;
        end;
        Next;
      end;
    end;
  end;
end;

procedure TfrmFrontPay.prip_AddConsume(As_SaleCd: String);
begin
{  memConsume.Filter := Format('I_SALE_CD = ''%s'' AND I_FIX_SALE = 0, I_LSM = 0',
    [As_SaleCd]);
  memConsume.Filtered := True;
  
  memConsume.Filtered := False;  }
end;

procedure TfrmFrontPay.prip_AddFixSale(As_FixSaleCD: String);
begin
{  FixSaleq.Filter := Format('I_ITEM_CD = ''%s''', [As_FixSaleCD]);
  FixSaleq.Filtered := True;
  if not FixSaleq.IsEmpty then
  begin
    FixSaleq.First;
    while not Eof do
    begin

    end;
  end; }
end;

procedure TfrmFrontPay.prip_AddLSMSale(As_SaleCd: String);
begin

end;
procedure TfrmFrontPay.bbtnDelAllClick(Sender: TObject);
begin
  if not PowerInfo.Change then
  begin

  end else begin
    memConsume.Close; 
    eMoney.Value := 0.00;
  end;
end;

procedure TfrmFrontPay.bbtnLSMClick(Sender: TObject);
begin
  prip_ShowLSMSaleInfo
end;

procedure TfrmFrontPay.prip_CreateLSMSale;
var
  ls_Date: String;   
  lc_BtnSale: TdxfColorButton;
  li_I, li_J: Integer;
begin
  ls_Date := FormatDateTime('YYYY-MM-DD', Date);
  li_I := 1;
  li_J := 0;
  with LSMq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT A.I_SALE_CD, A.I_SALE_NAME, B.I_LSM_PRICE AS I_PRICE, ' +
      'A.I_UNIT, A.I_FIX_SALE, A.I_SALE_RECORD, A.I_OTHER_RECORD, A.I_LSM, A.I_SALE_ITEM_CD, ' +
      'A.I_HELPER_CODE FROM T_SALE_MS A, T_LSM_SALE_MS B WHERE B.I_START_DATE <= ''%s'' AND  ' +
      'B.I_END_DATE >= ''%s'' AND A.I_LSM <> 0 AND A.I_SALE_CD = B.I_SALE_CD AND ' +
      'A.I_HELPER_CODE <> ''0''', [ls_Date, ls_Date]);
    Open;
    if not IsEmpty then
    begin
  //ClearBtn;
      First;
      while not Eof do
      begin
        lc_BtnSale := TdxfColorButton.Create(nil);
        lc_BtnSale.Parent := pSaleName;
        lc_BtnSale.Caption.Text := CurrToStr(FieldByName('I_PRICE').AsCurrency) +
          FieldByName('I_SALE_NAME').AsString;
        lc_BtnSale.Name := 'BtnSale' + FieldByName('I_SALE_CD').AsString;
        lc_BtnSale.Width := 100;
        lc_BtnSale.Height := 50;
        lc_BtnSale.Font.Height := -24;
        lc_BtnSale.Font.Size := 10;
        //lc_BtnSale.Color := Fi_Color;
        //lc_BtnSale.Color := ClGreen;
        //TColor(FieldByName('I_ITEM_COLOR').AsInteger);
        lc_BtnSale.OnMouseDown := prip_OnBtnLSMSaleClick;
        if li_I = 1 then
        begin
          lc_BtnSale.Left := 5;
        end else begin
          lc_BtnSale.Left := (li_I - 1) * 100 + (li_I - 1) * 10;
        end;
        if li_J = 0 then
        begin 
          lc_BtnSale.Top := 5;
        end else begin
          lc_BtnSale.Top := li_J * 50 + li_J * 10;
        end;
        inc(li_I);
        if li_I = 5 then
        begin
          li_I := 1;
          inc(li_J);
        end;
        lc_BtnSale.Visible := False; 
        Next;
      end;
    end;
  end;
end;

procedure TfrmFrontPay.prip_OnBtnLSMSaleClick(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var 
  ls_SaleCd: String;
begin
  if Sender is TdxfColorButton then
  begin
    ls_SaleCd := MidStr((Sender as TdxfColorButton).Name, 8, 4);
    {$IF DEFINED(DEBUG)}
      ShowMessage(ls_SaleCd);
    {$IFEND}
    //prip_ConsumeSale(ls_SaleCd);
    if (not LSMq.Active) or (LSMq.IsEmpty) then Exit;
    if not memConsume.Active then memConsume.Open;
    if LSMq.Locate('I_SALE_CD', ls_SaleCd, []) then
    begin
      if memConsume.Locate('I_SALE_CD', ls_SaleCd, []) then
      begin
        with memConsume do
        begin
          DisableControls;
          Edit;
          FieldValues['I_QTY'] := FieldValues['I_QTY'] + 1;
          FieldValues['I_MONEY'] := FieldValues['I_MONEY'] + LSMq.FieldValues['I_PRICE'];
          eMoney.Value := eMoney.Value + LSMq.FieldByName('I_PRICE').AsCurrency;
          Post; 
          EnableControls;
        end;
      end else
      begin
        with memConsume do
        begin
          DisableControls;
          Append;
          FieldValues['I_SALE_CD'] := LSMq.FieldValues['I_SALE_CD'];
          FieldValues['I_SALE_ITEM_CD'] := LSMq.FieldValues['I_SALE_ITEM_CD'];
          FieldValues['I_SALE_NAME'] := LSMq.FieldValues['I_SALE_NAME'];
          FieldValues['I_FIX_SALE'] := LSMq.FieldValues['I_FIX_SALE'];
          FieldValues['I_SALE_RECORD'] := LSMq.FieldValues['I_SALE_RECORD'];
          FieldValues['I_OTHER_RECORD'] := LSMq.FieldValues['I_OTHER_RECORD'];
          FieldValues['I_LSM'] := LSMq.FieldValues['I_LSM'];
          FieldValues['I_QTY'] := 1;
          FieldValues['I_PRICE'] := LSMq.FieldValues['I_PRICE'];
          FieldValues['I_MONEY'] := LSMq.FieldValues['I_PRICE'];
          eMoney.Value := eMoney.Value + LSMq.FieldByName('I_PRICE').AsCurrency;
          Post;
          EnableControls;
        end;
      end;
      Exit;
      if LSMq.FieldByName('I_FIX_SALE').AsBoolean then
      begin 
        prip_AddFixSale(ls_SaleCd);
        Exit;
      end;
      if LSMq.FieldByName('I_LSM').AsBoolean then
      begin
        prip_AddLSMSale(ls_SaleCd);
        Exit;
      end;
      prip_AddConsume(ls_SaleCd);
    end;
  end;
end;

procedure TfrmFrontPay.prip_ShowLSMSaleInfo;
var
  ls_BtnName: String;
  //lc_BtnSale: TComponent;
  lc_Control: TControl;
  procedure ClearBtn;
  var
    li_K: Integer;
    li_BtnCount: Integer;
  begin
    li_K := pSaleName.ControlCount - 1;
    for li_BtnCount := li_K  downto 0 do
    begin
      lc_Control := pSaleName.Controls[li_BtnCount];
      if lc_Control is TdxfColorButton then
        lc_Control.Visible := False;
    end;
  end;
begin
  ClearBtn;
  with LSMq do
  begin
    {
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT * FROM T_SALE_MS WHERE I_SALE_ITEM_CD = ''%s''',
      [As_ItemCd]);
    Open; } 
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        ls_BtnName := 'BtnSale' + FieldByName('I_SALE_CD').AsString;
        //lc_BtnSale := pSaleName.FindComponent(ls_BtnName);
        lc_Control := pSaleName.FindChildControl(ls_BtnName);
        if lc_Control <> nil then
        begin
          TdxfColorButton(lc_Control).Color := ClGreen;
          //lc_Control as TdxfColorButton
          lc_Control.Visible := True;
          //ShowMessage(lc_BtnSale.Name);
          //(lc_Control as TdxfColorButton).Visible := True;
        end;
        Next;
      end;
    end;
  end;
end;

procedure TfrmFrontPay.prip_SendKX;
var
  ls_Command: String;
begin
  if MSComm.PortOpen then MSComm.PortOpen := False;
  try  
    MSComm.CommPort := dmData.Ai_ComPort;
    MSComm.Settings := '2400,n,8,1';
    MSComm.PortOpen := True;
    ls_Command := Chr($1B) + Chr($40);
    if MsComm.InBufferCount <> 0 then MsComm.InBufferCount := 0;
    if MsComm.OutBufferCount <> 0 then MsComm.OutBufferCount := 0;
    MSComm.Output := ls_Command;
    ls_Command := Chr($0C);
    if MsComm.InBufferCount <> 0 then MsComm.InBufferCount := 0;
    if MsComm.OutBufferCount <> 0 then MsComm.OutBufferCount := 0;
    MSComm.Output := ls_Command;
  except
    AppMsg('打开通讯口失败', '系统错误');
  end;
end;

procedure TfrmFrontPay.prip_SendCommand(As_Command: String);
begin
  if MSComm.PortOpen = False then Exit; 
    if MsComm.InBufferCount <> 0 then MsComm.InBufferCount := 0;
    if MsComm.OutBufferCount <> 0 then MsComm.OutBufferCount := 0;
    MSComm.Output := As_Command;
end;

procedure TfrmFrontPay.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if MSComm.PortOpen then MSComm.PortOpen := False;
end;

procedure TfrmFrontPay.btnNumNextClick(Sender: TObject);
begin
  if Fb_NumNext then
  begin
    btnNum0.Caption.Text := '0';  
    btnNum1.Caption.Text := '1';
    btnNum2.Caption.Text := '2';
    btnNum3.Caption.Text := '3';
    btnNum4.Caption.Text := '4';
    btnNum0.Tag := 0;
    btnNum1.Tag := 1;
    btnNum2.Tag := 2;
    btnNum3.Tag := 3;
    btnNum4.Tag := 4;
    btnNumNext.Caption.Text := '>>';
    Fb_NumNext := False;
  end else begin
    btnNum0.Caption.Text := '5';
    btnNum1.Caption.Text := '6';
    btnNum2.Caption.Text := '7';
    btnNum3.Caption.Text := '8';
    btnNum4.Caption.Text := '9'; 
    btnNum0.Tag := 5;
    btnNum1.Tag := 6;
    btnNum2.Tag := 7;
    btnNum3.Tag := 8;
    btnNum4.Tag := 9; 
    btnNumNext.Caption.Text := '<<';
    Fb_NumNext := True;
  end;
end;

procedure TfrmFrontPay.btnEditNumClick(Sender: TObject);
var
  li_OldQty: Integer;
begin
  if (memConsume.IsEmpty) or (not memConsume.Active) then Exit;
  if Fi_NewQTY = 0 then Exit;
  with memConsume do
  begin
    DisableControls;
    li_OldQty := FieldByName('I_QTY').AsInteger;
    Edit;
    FieldValues['I_QTY'] := Fi_NewQTY;
    FieldValues['I_MONEY'] := FieldValues['I_MONEY'] + (FieldValues['I_PRICE'] * Fi_NewQTY -
      FieldValues['I_PRICE'] * li_OldQty);
    eMoney.Value := eMoney.Value +(FieldValues['I_PRICE'] * Fi_NewQTY -
      FieldValues['I_PRICE'] * li_OldQty);
    Post;
    EnableControls;
  end;
end;

procedure TfrmFrontPay.prip_OnBtnNumClick(Sender: TObject);
begin
  Fi_NewQTY := TdxfColorButton(Sender).Tag;
end;

end.
