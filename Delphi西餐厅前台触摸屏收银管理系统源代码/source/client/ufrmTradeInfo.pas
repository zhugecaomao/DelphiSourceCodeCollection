unit ufrmTradeInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, CSADOQuery, dxExEdtr, dxDBTLCl, dxGrClms,
  dxTL, dxDBCtrl, dxDBGrid, dxCntner, dxfColorButton, StdCtrls;

type
  TfrmTradeInfo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    TradeDetailq: TCSADOQuery;
    Traded: TDataSource;
    TradeDetaild: TDataSource;
    TradeList: TdxDBGrid;
    TradeDetailList: TdxDBGrid;
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
    TradeListI_TRADE_CD: TdxDBGridMaskColumn;
    TradeListI_TRADE_MONEY: TdxDBGridCurrencyColumn;
    TradeListI_TRADE_DATE: TdxDBGridMaskColumn;
    TradeListI_TRADE_TIME: TdxDBGridMaskColumn;
    TradeListI_EMP_CD: TdxDBGridMaskColumn;
    TradeListI_WORK_CD: TdxDBGridMaskColumn;
    TradeListI_TRADE_FLAG1: TdxDBGridMaskColumn;
    TradeListI_TRADE_FLAG2: TdxDBGridMaskColumn;
    TradeListI_TRADE_FLAG3: TdxDBGridMaskColumn;
    TradeDetailqI_QTY: TIntegerField;
    TradeDetailqI_PRICE: TBCDField;
    TradeDetailqI_AMOUNT: TBCDField;
    TradeDetailqI_SALE_NAME: TStringField;
    TradeDetailListI_SALE_NAME: TdxDBGridMaskColumn;
    TradeDetailListI_QTY: TdxDBGridMaskColumn;
    TradeDetailListI_PRICE: TdxDBGridCurrencyColumn;
    TradeDetailListI_AMOUNT: TdxDBGridCurrencyColumn;
    bbtnUp: TdxfColorButton;
    bbtnDown: TdxfColorButton;
    bbtnExit: TdxfColorButton;
    bbtnPrint: TdxfColorButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    labTradeCD: TLabel;
    labTime: TLabel;
    labAmount: TLabel;
    procedure bbtnExitClick(Sender: TObject);
    procedure bbtnDownMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure bbtnUpMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure bbtnPrintClick(Sender: TObject);
  private
    procedure prip_GetDetail(As_Trade_CD: String);
    procedure prip_IniInterFace;
    procedure prip_IniData;
    procedure prip_Print;
  public
    procedure pubp_Ini;
  end;

var
  frmTradeInfo: TfrmTradeInfo;

implementation

uses udmData, Printers, upubCommon;

{$R *.dfm}

{ TfrmTradeInfo }

procedure TfrmTradeInfo.prip_IniData;
var
  ls_Date: String;
begin      
  ls_Date := FormatDateTime('YYYY-MM-DD', Date);
  with Tradeq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT * FROM T_TRADE_MS WHERE ' +
      'I_TRADE_DATE = ''%s'' ORDER BY I_TRADE_CD ASC', [ls_Date]);
    Open;
    if not IsEmpty then
    begin
      First;
      labTradeCD.Caption := FieldByName('I_TRADE_CD').AsString;
      labTime.Caption := FieldByName('I_TRADE_Time').AsString;
      labAmount.Caption := CurrToStr(FieldByName('I_TRADE_MONEY').AsCurrency);
      prip_GetDetail(FieldByName('I_TRADE_CD').AsString);
      bbtnUp.Enabled := True;
      bbtnDown.Enabled := True;
    end;
  end;
end;

procedure TfrmTradeInfo.prip_IniInterFace;
begin
  WindowState := wsMaximized;
end;

procedure TfrmTradeInfo.pubp_Ini;
begin
  prip_IniData;
  prip_IniInterFace;
end;

procedure TfrmTradeInfo.bbtnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTradeInfo.prip_GetDetail(As_Trade_CD: String);
begin
  with TradeDetailq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT A.I_SALE_NAME, B.I_QTY, B.I_PRICE, B.I_AMOUNT FROM ' +
      ' T_SALE_MS A, T_TRADE_DETAIL_MS B WHERE B.I_TRADE_CD = ''%s'' AND ' +
      ' (A.I_SALE_CD = B.I_SALE_CD AND A.I_SALE_ITEM_CD = B.I_SALE_ITEM_CD)',
      [As_Trade_CD]);
    Open;
  end;
end;

procedure TfrmTradeInfo.bbtnDownMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if not Tradeq.Eof then
  begin
    Tradeq.Next;
  end else begin
    Tradeq.First;
  end;
  labTradeCD.Caption := Tradeq.FieldByName('I_TRADE_CD').AsString;
  labTime.Caption := Tradeq.FieldByName('I_TRADE_Time').AsString;
  labAmount.Caption := CurrToStr(Tradeq.FieldByName('I_TRADE_MONEY').AsCurrency);
  prip_GetDetail(Tradeq.FieldByName('I_TRADE_CD').AsString);
end;

procedure TfrmTradeInfo.bbtnUpMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if not Tradeq.Bof then
  begin
    Tradeq.Prior;
  end else begin
    Tradeq.Last;
  end;
  labTradeCD.Caption := Tradeq.FieldByName('I_TRADE_CD').AsString;
  labTime.Caption := Tradeq.FieldByName('I_TRADE_Time').AsString;
  labAmount.Caption := CurrToStr(Tradeq.FieldByName('I_TRADE_MONEY').AsCurrency);
  prip_GetDetail(Tradeq.FieldByName('I_TRADE_CD').AsString);
end;

procedure TfrmTradeInfo.prip_Print; 
var
  ls_Trade_CD: String;  
  lc_Rect: TRect;
  li_I: Integer;
  ls_SaleName, ls_Qty, ls_Amount, ls_Quantity, ls_Name, ls_Money, ls_PrintValue,
  ls_DateTime: String;
begin
  if (not Tradeq.Active) or (Tradeq.IsEmpty) or (not TradeDetailq.Active) or
    (TradeDetailq.IsEmpty) then Exit;
  ls_Name := '                            ';
  ls_Quantity := '               ';
  ls_Money :=  '    ';
  lc_Rect := Rect(50, 50, 100, 300);
  li_I := 0;
  ls_Trade_CD := Tradeq.FieldByName('I_TRADE_CD').AsString;
  ls_DateTime := Tradeq.FieldByName('I_TRADE_DATE').AsString + ' ' +
    Tradeq.FieldByName('I_TRADE_TIME').AsString;
  with TradeDetailq do
  begin
    First;
    //开始打印
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
    while not Eof do
    begin
      ls_SaleName := FieldByName('I_SALE_NAME').AsString;
      ls_SaleName := ls_SaleName + Copy(ls_Name, 1, 28 - Length(ls_SaleName));
      ls_Qty := IntToStr(FieldByName('I_QTY').AsInteger);
      ls_Qty := ls_Qty + Copy(ls_Quantity, 1, 15 - Length(ls_Qty));
      ls_Amount := CurrToStr(FieldByName('I_AMOUNT').AsCurrency);
      ls_PrintValue := ls_SaleName + ls_Qty + ls_Amount;
      Canvas.TextOut(2, 2 + (li_I * Canvas.TextHeight(ls_PrintValue)), ls_PrintValue);
      Inc(li_I);
      Next;
    end;     
    Canvas.TextOut(2, 2 + (li_I * Canvas.TextHeight(Application.Title)), '---------------------');
    Inc(li_I); 
    Canvas.TextOut(2, 2 + (li_I * Canvas.TextHeight(Application.Title)),
      '消费合计金额:' + labAmount.Caption);
    Inc(li_I);
    Printer.Canvas.TextOut(2, 2 + (li_I * Canvas.TextHeight(Application.Title)), '客户签名:');
    Printer.EndDoc;
    Close;
  end;
end;

procedure TfrmTradeInfo.bbtnPrintClick(Sender: TObject);
begin
  prip_Print;
end;

end.
