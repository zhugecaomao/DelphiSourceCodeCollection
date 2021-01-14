unit ufrmAllocSaleView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, dxExEdtr, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCore, DB, ADODB, CSADOQuery,
  ActnList, ImgList, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ToolWin,
  dxEdLib, dxEditor, StdCtrls, ExtCtrls, dxmdaset;

type
  TfrmAllocSaleView = class(TfrmViewDataBase)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    eFlag: TdxEdit;
    eDate: TdxDateEdit;
    eNo: TdxEdit;
    eShop: TdxPickEdit;
    eSale: TdxPickEdit;
    eUnit: TdxEdit;
    memAlloc: TdxMemData;
    Allocd: TDataSource;
    memAllocI_SHOP_CD: TStringField;
    Label8: TLabel;
    eQty: TdxEdit;
    ViewqI_SALE_CD: TStringField;
    ViewqI_SALE_NAME: TStringField;
    ViewqI_UNIT: TStringField;
    memAllocI_SALE_CD: TStringField;
    memAllocI_SALE_NAME: TStringField;
    memAllocI_UNIT: TStringField;
    memAllocI_QTY: TIntegerField;
    grdListRecId: TdxDBGridColumn;
    grdListI_SALE_CD: TdxDBGridMaskColumn;
    grdListI_SALE_NAME: TdxDBGridMaskColumn;
    grdListI_UNIT: TdxDBGridMaskColumn;
    grdListI_QTY: TdxDBGridMaskColumn;
    grdListI_SHOP_CD: TdxDBGridMaskColumn;
    procedure eShopKeyPress(Sender: TObject; var Key: Char);
    procedure eSaleChange(Sender: TObject);
    procedure eFlagKeyPress(Sender: TObject; var Key: Char);
    procedure eDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure atNewExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
    procedure atSaveExecute(Sender: TObject);
    procedure eQtyKeyPress(Sender: TObject; var Key: Char);
    procedure eQtyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure atCancelExecute(Sender: TObject);
    procedure eNoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Fi_Act: Integer;
    //========================================
    {
     Fi_Act说明
     1添加
     2修改
     3删除
    }
    //========================================
    function prif_GetNo: String;
    procedure prip_GetShopInfo;
    procedure prip_GetSaleInfo;
    function prif_GetAllocInfo: Boolean;
    procedure prip_SerachSale(As_SaleCD: String);
    procedure prip_Save;
  protected
    procedure prop_IniData; override;  
    procedure prop_IniInterFace; override;
  public
    { Public declarations }
  end;

var
  frmAllocSaleView: TfrmAllocSaleView;

implementation

uses udmData, StrUtils, ufrmBase, upubCommon;

{$R *.dfm}

{ TfrmAllocSaleView }

function TfrmAllocSaleView.prif_GetNo: String;
var
  li_No: Integer;
const
  LSZERO = '0000';
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT MAX(I_NO) AS I_NO FROM T_ALLOC_SALE_MS WHERE I_DATE = ''%s''',
      [FormatDateTime('YYYY-MM-DD', eDate.Date)]);
    Open;
    if IsEmpty then
    begin
      Result := FormatDateTime('YYMMDD', eDate.Date) + '0001'; 
    end
    else
    begin
      li_No := StrToIntDef(RightStr(FieldByName('I_NO').AsString, 4), 0) + 1;
      Result := FormatDateTime('YYMMDD', eDate.Date) + LeftStr(LSZERO, 4 - Length(IntToStr(li_NO)));
      Result := Result + IntToStr(li_NO);
    end;
    Close;
  end;
end;

procedure TfrmAllocSaleView.prip_GetShopInfo;
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT I_SHOP_CD, I_SHOP_NAME FROM T_SHOP_MS';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        eShop.Items.Add(FieldByName('I_SHOP_CD').AsString + '-' +
          FieldByName('I_SHOP_NAME').AsString);
        Next;
      end;
    end;
    Close;
  end;
end;

procedure TfrmAllocSaleView.prip_SerachSale(As_SaleCD: String);
begin
  if Viewq.Locate('I_SALE_CD', As_SaleCD, []) then
  begin
    eUnit.Text := Viewq.FieldByName('I_UNIT').AsString;
  end;
end;

procedure TfrmAllocSaleView.prop_IniData;
begin
  inherited;
  prip_GetShopInfo;
  prip_GetSaleInfo;
  eDate.Date := Date;
end;

procedure TfrmAllocSaleView.prop_IniInterFace;
begin
  inherited;
  WindowState := wsMaximized;
  eFlag.Enabled := False;
  eDate.Enabled := False;
  eNo.Enabled := False;
  eShop.Enabled := False;
  eSale.Enabled := False;
  eQty.Enabled := False;
end;

procedure TfrmAllocSaleView.eShopKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key <> #13 then Key := #0;
end;

procedure TfrmAllocSaleView.eSaleChange(Sender: TObject);
var
  ls_SaleCD: String;
  li_Index: Integer;
begin
  inherited;
  li_Index := Pos('-', eSale.Text);
  ls_SaleCD := LeftStr(eSale.Text, li_Index - 1);
  prip_SerachSale(ls_SaleCD);
end;

procedure TfrmAllocSaleView.eFlagKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key in ['1'..'2']) or (Key = #13) or (Key = #8) or (Key = #9) then 
  else Key := #0;
end;

procedure TfrmAllocSaleView.eDateKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    if not CheckDate(eDate.Text) then Exit;
    case Fi_Act of
      1: eNo.Text := prif_GetNo; 
    end;
  end;
end;

procedure TfrmAllocSaleView.atNewExecute(Sender: TObject);
begin
  inherited;
  Fi_Act := 1;
  eFlag.Enabled := True;
  eDate.Enabled := True;
  eShop.Enabled := True;
  eSale.Enabled := True;
  eQty.Enabled := True;
  eFlag.SetFocus;
end;

procedure TfrmAllocSaleView.atEditExecute(Sender: TObject);
begin
  inherited;
  Fi_Act := 2;
  eFlag.Enabled := True;
  eDate.Enabled := True;
  eNo.Enabled := True;
  eShop.Enabled := True;
  eSale.Enabled := True;
  eQty.Enabled := True;
  eFlag.SetFocus;
end;

procedure TfrmAllocSaleView.atDelExecute(Sender: TObject);
begin
  inherited;
  Fi_Act := 3;
  eFlag.Enabled := True;
  eDate.Enabled := True;
  eNo.Enabled := True;
  eFlag.SetFocus;
end;

procedure TfrmAllocSaleView.prip_Save; 
var
  ls_SQL: String;
  ls_ShopCD: String;
  li_Index: Integer;
begin
  if (not memAlloc.Active) or (memAlloc.IsEmpty) then Exit;
  if not CheckDate(eDate.Text) then Exit;     
  li_Index := Pos('-', eShop.Text);
  ls_ShopCD := LeftStr(eShop.Text, li_Index - 1);
  case Fi_Act of
    1..2:
    begin
      with memAlloc do
      begin
        First;
        dmData.adocon.BeginTrans;
        try
          dmData.adocon.Execute(Format('DELETE FROM T_ALLOC_SALE_MS WHERE I_DATE = ''%s'' AND ' +
            'I_NO = ''%s'' AND I_FLAG = %d',
            [FormatDateTime('YYYY-MM-DD', eDate.Date), eNo.Text, StrToIntDef(eFlag.Text, 1)]));
          while not Eof do
          begin
            ls_SQL := Format('INSERT INTO T_ALLOC_SALE_MS VALUES (''%s'', ''%s'', ''%s'', ' +
              '''%s'', %d, %d, ''%s'', ''%s'', ''%s'')', [eNo.Text,
              FieldByName('I_SALE_CD').AsString, FieldByName('I_SALE_NAME').AsString,
              FieldByName('I_UNIT').AsString, FieldByName('I_QTY').AsInteger,
              StrToIntDef(eFlag.Text, 1),
              FormatDateTime('YYYY-MM-DD', eDate.Date), LoginInfo.UserId,
              FieldByName('I_SHOP_CD').AsString]);
            dmData.adocon.Execute(ls_SQL);
            Next;
          end;
          dmData.adocon.CommitTrans;
          AppMsg('保存完成', '原料调拨处理', 1);
        except
          On E: Exception do
          begin
            AppMsg(E.Message, '原料调拨处理');
            dmData.adocon.RollbackTrans;
          end;
        end; 
      end;
    end; 
    3:
    begin
      dmData.adocon.BeginTrans;
      try
        dmData.adocon.Execute(Format('DELETE FROM T_ALLOC_SALE_MS WHERE I_DATE = ''%s'' AND ' +
          'I_NO = ''%s'' AND I_FLAG = %d',
          [FormatDateTime('YYYY-MM-DD', eDate.Date), eNo.Text, StrToIntDef(eFlag.Text, 1)]));
        AppMsg('删除完成', '原料调拨处理', 1);
        dmData.adocon.CommitTrans;
      except
        On E: Exception do
        begin
          AppMsg(E.Message, '原料调拨处理');
          dmData.adocon.RollbackTrans;
        end;
      end;
    end;
  end;
  eFlag.Enabled := False;
  eDate.Enabled := False;
  eNo.Enabled := False;
  eShop.Enabled := False;
  eSale.Enabled := False;
  eQty.Enabled := False;
  if memAlloc.Active then memAlloc.Close;
end;

procedure TfrmAllocSaleView.atSaveExecute(Sender: TObject);
begin
  inherited;
  prip_Save;
end;

procedure TfrmAllocSaleView.eQtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key in ['0'..'9']) or (Key = #13) or (Key = #8) or (Key = #9) then
  else Key := #0;
end;

procedure TfrmAllocSaleView.eQtyKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  ls_ShopCD: String;
  li_Index: Integer;
begin
  inherited;
  if Key = 13 then
  begin
    if not memAlloc.Active then memAlloc.Open;
    with memAlloc do
    begin
      li_Index := Pos('-', eShop.Text);
      ls_ShopCD := LeftStr(eShop.Text, li_Index - 1);
      DisableControls;
      if Locate('I_SALE_CD', Viewq.FieldValues['I_SALE_CD'], []) then
      begin
        Edit;
        FieldValues['I_SALE_CD'] := Viewq.FieldValues['I_SALE_CD'];
        FieldValues['I_SALE_NAME'] := Viewq.FieldValues['I_SALE_NAME'];
        FieldValues['I_UNIT'] := Viewq.FieldValues['I_UNIT'];
        FieldValues['I_QTY'] := FieldValues['I_QTY'] + StrToIntDef(eQty.Text, 0);
        FieldValues['I_SHOP_CD'] := ls_ShopCD;
        Post;
      end else begin
        Append;
        FieldValues['I_SALE_CD'] := Viewq.FieldValues['I_SALE_CD'];
        FieldValues['I_SALE_NAME'] := Viewq.FieldValues['I_SALE_NAME'];
        FieldValues['I_UNIT'] := Viewq.FieldValues['I_UNIT'];
        FieldValues['I_QTY'] := StrToIntDef(eQty.Text, 0);
        FieldValues['I_SHOP_CD'] := ls_ShopCD;
        Post;
      end;
      EnableControls;
      eQty.Text := '0';
      eSale.SetFocus;
    end;
  end;
end;

procedure TfrmAllocSaleView.atCancelExecute(Sender: TObject);
begin
  eFlag.Enabled := False;
  eDate.Enabled := False;
  eNo.Enabled := False;
  eShop.Enabled := False;
  eSale.Enabled := False;
  eQty.Enabled := False;
  if memAlloc.Active then memAlloc.Close;
end;

function TfrmAllocSaleView.prif_GetAllocInfo: Boolean;
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT I_SALE_CD, I_SALE_NAME, I_UNIT, I_QTY, I_SHOP_CD FROM T_ALLOC_SALE_MS WHERE I_DATE = ''%s'' AND ' +
      'I_FLAG = %d AND I_NO = ''%s''', [FormatDateTime('YYYY-MM-DD', eDate.Date),
      StrToIntDef(eFlag.Text, 1), eNo.Text]);
    Open;
    Result := not IsEmpty;
    if not IsEmpty then
    begin
      First;           
      if memAlloc.Active then memAlloc.Close;
      memAlloc.DisableControls;
      while not Eof do
      begin
        if not memAlloc.Active then memAlloc.Open;
        memAlloc.Append;
        memAlloc.FieldValues['I_SALE_CD'] := FieldValues['I_SALE_CD'];
        memAlloc.FieldValues['I_SALE_NAME'] := FieldValues['I_SALE_NAME'];
        memAlloc.FieldValues['I_UNIT'] := FieldValues['I_UNIT'];
        memAlloc.FieldValues['I_QTY'] := FieldValues['I_QTY'];
        memAlloc.FieldValues['I_SHOP_CD'] := FieldValues['I_SHOP_CD'];;;
        memAlloc.Post;
        Next;
      end;
      memAlloc.EnableControls;
    end;
    Close;
  end;
end;

procedure TfrmAllocSaleView.eNoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
  begin
    case Fi_Act of
      2:
      begin
        if not prif_GetAllocInfo then AppMsg('当日原料调拨数据不存在,请使用添加', '原料调拨处理');;
      end;
      3:
      begin
        if not prif_GetAllocInfo then Exit;
      end;
    end;
  end;
end;

procedure TfrmAllocSaleView.prip_GetSaleInfo;
begin 
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT I_SALE_CD, I_SALE_NAME, I_UNIT FROM T_SALE_MS';
    Open;
    if not IsEmpty then
    begin
      First;
      eSale.Items.Clear;
      while not Eof do
      begin
        eSale.Items.Add(FieldByName('I_SALE_CD').AsString + '-' +
          FieldByName('I_SALE_NAME').AsString);
        Next;
      end;
    end;
  end;
end;

procedure TfrmAllocSaleView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmAllocSaleView := nil;
end;

end.
