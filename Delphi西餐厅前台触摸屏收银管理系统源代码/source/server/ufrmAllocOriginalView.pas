unit ufrmAllocOriginalView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, dxExEdtr, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCore, DB, ADODB, CSADOQuery,
  ActnList, ImgList, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ToolWin,
  dxEdLib, dxEditor, StdCtrls, ExtCtrls, dxmdaset;

type
  TfrmAllocOriginalView = class(TfrmViewDataBase)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    eFlag: TdxEdit;
    eDate: TdxDateEdit;
    eNo: TdxEdit;
    eShop: TdxPickEdit;
    eOriginal: TdxPickEdit;
    eUnit: TdxEdit;
    eQty1: TdxEdit;
    eQty2: TdxEdit;
    eQty3: TdxEdit;
    eCount: TdxEdit;
    memAlloc: TdxMemData;
    memAllocI_ORIGINAL_CD: TStringField;
    memAllocI_ORIGINAL_NAME: TStringField;
    memAllocI_PROPERTY_CODE: TStringField;
    memAllocI_UNIT: TStringField;
    memAllocI_QTY1: TIntegerField;
    memAllocI_QTY2: TIntegerField;
    memAllocI_QTY3: TIntegerField;
    memAllocI_COUNT: TIntegerField;
    Allocd: TDataSource;
    grdListRecId: TdxDBGridColumn;
    grdListI_ORIGINAL_CD: TdxDBGridMaskColumn;
    grdListI_ORIGINAL_NAME: TdxDBGridMaskColumn;
    grdListI_PROPERTY_CODE: TdxDBGridMaskColumn;
    grdListI_UNIT: TdxDBGridMaskColumn;
    grdListI_QTY1: TdxDBGridMaskColumn;
    grdListI_QTY2: TdxDBGridMaskColumn;
    grdListI_QTY3: TdxDBGridMaskColumn;
    grdListI_COUNT: TdxDBGridMaskColumn;
    ViewqI_ORIGINAL_CD: TStringField;
    ViewqI_ORIGINAL_NAME: TStringField;
    ViewqI_PROPERTY_CODE: TStringField;
    ViewqI_UNIT: TStringField;
    ViewqI_QTY1: TIntegerField;
    ViewqI_QTY2: TIntegerField;
    ViewqI_QTY3: TIntegerField;
    memAllocI_SHOP_CD: TStringField;
    grdListI_SHOP_CD: TdxDBGridMaskColumn;
    procedure eShopKeyPress(Sender: TObject; var Key: Char);
    procedure eOriginalChange(Sender: TObject);
    procedure eFlagKeyPress(Sender: TObject; var Key: Char);
    procedure eDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure atNewExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
    procedure atSaveExecute(Sender: TObject);
    procedure eQty1KeyPress(Sender: TObject; var Key: Char);
    procedure eQty2KeyPress(Sender: TObject; var Key: Char);
    procedure eQty3KeyPress(Sender: TObject; var Key: Char);
    procedure eQty1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eQty2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eQty3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure atCancelExecute(Sender: TObject);
    procedure eNoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure prip_GetOriginalInfo;
    function prif_GetAllocInfo: Boolean;
    procedure prip_SerachOriginal(As_OriginalCD: String);
    procedure prip_Save;
  protected
    procedure prop_IniData; override;  
    procedure prop_IniInterFace; override;
  public
    { Public declarations }
  end;

var
  frmAllocOriginalView: TfrmAllocOriginalView;

implementation

uses udmData, StrUtils, ufrmBase, upubCommon;

{$R *.dfm}

{ TfrmAllocOriginalView }

function TfrmAllocOriginalView.prif_GetNo: String;
var
  li_No: Integer;
const
  LSZERO = '0000';
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT MAX(I_NO) AS I_NO FROM T_ALLOC_ORIGINAL_MS WHERE I_DATE = ''%s''',
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

procedure TfrmAllocOriginalView.prip_GetOriginalInfo;
begin
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT I_ORIGINAL_CD, I_ORIGINAL_NAME, I_PROPERTY_CODE, ' +
      '(convert(varchar(10), i_qty1) + ''/'' + i_unit1 + '' '' ' +
      ' + convert(varchar(10), i_qty2) + ''/'' + i_unit2) as i_unit,  ' +
      'i_qty1, i_qty2, i_qty3 FROM T_ORIGINAL_MS';
    Open;
    if not IsEmpty then
    begin
      First;
      eOriginal.Items.Clear;
      while not Eof do
      begin
        eOriginal.Items.Add(FieldByName('I_ORIGINAL_CD').AsString + '-' +
          FieldByName('I_ORIGINAL_NAME').AsString);
        Next;
      end;
    end;
  end;
end;

procedure TfrmAllocOriginalView.prip_GetShopInfo;
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

procedure TfrmAllocOriginalView.prip_SerachOriginal(As_OriginalCD: String);
begin
  if Viewq.Locate('I_ORIGINAL_CD', As_OriginalCD, []) then
  begin
    eUnit.Text := Viewq.FieldByName('I_UNIT').AsString;
  end;
end;

procedure TfrmAllocOriginalView.prop_IniData;
begin
  inherited;
  prip_GetShopInfo;
  prip_GetOriginalInfo;  
  eDate.Date := Date;
end;

procedure TfrmAllocOriginalView.prop_IniInterFace;
begin
  inherited;
  WindowState := wsMaximized;
  eFlag.Enabled := False;
  eDate.Enabled := False;
  eNo.Enabled := False;
  eShop.Enabled := False;
  eOriginal.Enabled := False;
  eQty1.Enabled := False;
  eQty2.Enabled := False;
  eQty3.Enabled := False;
end;

procedure TfrmAllocOriginalView.eShopKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key <> #13 then Key := #0;
end;

procedure TfrmAllocOriginalView.eOriginalChange(Sender: TObject);
var
  ls_OriginalCD: String;
  li_Index: Integer;
begin
  inherited;
  li_Index := Pos('-', eOriginal.Text);
  ls_OriginalCD := LeftStr(eOriginal.Text, li_Index - 1);
  prip_SerachOriginal(ls_OriginalCD);
end;

procedure TfrmAllocOriginalView.eFlagKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key in ['1'..'2']) or (Key = #13) or (Key = #8) or (Key = #9) then 
  else Key := #0;
end;

procedure TfrmAllocOriginalView.eDateKeyDown(Sender: TObject;
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

procedure TfrmAllocOriginalView.atNewExecute(Sender: TObject);
begin
  inherited;
  Fi_Act := 1;
  eFlag.Enabled := True;
  eDate.Enabled := True;
  eShop.Enabled := True;
  eOriginal.Enabled := True;
  eQty1.Enabled := True;
  eQty2.Enabled := True;
  eQty3.Enabled := True;
  eFlag.SetFocus;
end;

procedure TfrmAllocOriginalView.atEditExecute(Sender: TObject);
begin
  inherited;
  Fi_Act := 2;
  eFlag.Enabled := True;
  eDate.Enabled := True;
  eNo.Enabled := True;
  eShop.Enabled := True;
  eOriginal.Enabled := True;
  eQty1.Enabled := True;
  eQty2.Enabled := True;
  eQty3.Enabled := True;
  eFlag.SetFocus;
end;

procedure TfrmAllocOriginalView.atDelExecute(Sender: TObject);
begin
  inherited;
  Fi_Act := 3;
  eFlag.Enabled := True;
  eDate.Enabled := True;
  eNo.Enabled := True;
  eFlag.SetFocus;
end;

procedure TfrmAllocOriginalView.prip_Save; 
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
        DisableControls;
        dmData.adocon.BeginTrans;
        try
          dmData.adocon.Execute(Format('DELETE FROM T_ALLOC_ORIGINAL_MS WHERE I_DATE = ''%s'' AND ' +
            'I_NO = ''%s'' AND I_FLAG = %d',
            [FormatDateTime('YYYY-MM-DD', eDate.Date), eNo.Text, StrToIntDef(eFlag.Text, 1)]));
          while not Eof do
          begin
            ls_SQL := Format('INSERT INTO T_ALLOC_ORIGINAL_MS VALUES (''%s'', ''%s'', ''%s'', ' +
              '''%s'', ''%s'', %d, %d, %d, %d, ''%s'', %d, ''%s'', ''%s'')', [eNo.Text,
              FieldByName('I_ORIGINAL_CD').AsString, FieldByName('I_ORIGINAL_NAME').AsString,
              FieldByName('I_PROPERTY_CODE').AsString, FieldByName('I_UNIT').AsString,
              FieldByName('I_QTY1').AsInteger, FieldByName('I_QTY2').AsInteger,
              FieldByName('I_QTY3').AsInteger, FieldByName('I_COUNT').AsInteger,
              FormatDateTime('YYYY-MM-DD', eDate.Date), StrToIntDef(eFlag.Text, 1), LoginInfo.UserId,
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
        EnableControls;
      end;
    end; 
    3:
    begin
      dmData.adocon.BeginTrans;
      try
        dmData.adocon.Execute(Format('DELETE FROM T_ALLOC_ORIGINAL_MS WHERE I_DATE = ''%s'' AND ' +
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
  eOriginal.Enabled := False;
  eQty1.Enabled := False;
  eQty2.Enabled := False;
  eQty3.Enabled := False;
  if memAlloc.Active then memAlloc.Close;
end;

procedure TfrmAllocOriginalView.atSaveExecute(Sender: TObject);
begin
  inherited;
  prip_Save;
end;

procedure TfrmAllocOriginalView.eQty1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key in ['0'..'9']) or (Key = #13) or (Key = #8) or (Key = #9) or (Key = '-') then
  else Key := #0;
end;

procedure TfrmAllocOriginalView.eQty2KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key in ['0'..'9']) or (Key = #13) or (Key = #8) or (Key = #9) or (Key = '-') then
  else Key := #0;
end;

procedure TfrmAllocOriginalView.eQty3KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key in ['0'..'9']) or (Key = #13) or (Key = #8) or (Key = #9) or (Key = '-') then
  else Key := #0;
end;

procedure TfrmAllocOriginalView.eQty1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
  begin
    eCount.Text := IntToStr(StrToInt(eQty1.Text) * Viewq.FieldByName('I_QTY1').AsInteger);
    if Viewq.FieldByName('I_QTY1').AsInteger = 0 then
    begin
      eQty1.Text := '0';
    end;
    //eQty1.Text := IntToStr(StrToIntDef(eQty1.Text, 0) * Viewq.FieldByName('I_QTY1').AsInteger);
  end;
end;

procedure TfrmAllocOriginalView.eQty2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
  begin
    eCount.Text := IntToStr(StrToIntDef(eCount.Text, 0) +
      (StrToIntDef(eQty2.Text, 0) * Viewq.FieldByName('I_QTY2').AsInteger));
    if Viewq.FieldByName('I_QTY2').AsInteger = 0 then
    begin
      eQty2.Text := '0';
    end;
    //eQty2.Text := IntToStr(StrToIntDef(eQty2.Text, 0) * Viewq.FieldByName('I_QTY2').AsInteger);
  end;
end;

procedure TfrmAllocOriginalView.eQty3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  ls_ShopCD: String;
  li_Index: Integer;
begin
  inherited;
  if Key = 13 then
  begin
    if not memAlloc.Active then memAlloc.Open;  
    eCount.Text := IntToStr(StrToIntDef(eCount.Text, 0) + StrToIntDef(eQty3.Text, 0)); 
    with memAlloc do
    begin
      li_Index := Pos('-', eShop.Text);
      ls_ShopCD := LeftStr(eShop.Text, li_Index - 1);
      DisableControls;
      if Locate('I_ORIGINAL_CD', Viewq.FieldValues['I_ORIGINAL_CD'], []) then
      begin
        Edit;
        FieldValues['I_ORIGINAL_CD'] := Viewq.FieldValues['I_ORIGINAL_CD'];
        FieldValues['I_ORIGINAL_NAME'] := Viewq.FieldValues['I_ORIGINAL_NAME'];
        FieldValues['I_PROPERTY_CODE'] := Viewq.FieldValues['I_PROPERTY_CODE'];
        FieldValues['I_UNIT'] := Viewq.FieldValues['I_UNIT'];
        FieldValues['I_QTY1'] := FieldValues['I_QTY1'] + StrToFloatDef(eQty1.Text, 0.0);
        FieldValues['I_QTY2'] := FieldValues['I_QTY2'] + StrToFloatDef(eQty2.Text, 0.0);
        FieldValues['I_QTY3'] := FieldValues['I_QTY3'] + StrToFloatDef(eQty3.Text, 0.0);
        FieldValues['I_COUNT'] := FieldValues['I_COUNT'] + StrToFloatDef(eCount.Text, 0.0);
        FieldValues['I_SHOP_CD'] := ls_ShopCD;
        Post;
      end else begin
        Append;
        FieldValues['I_ORIGINAL_CD'] := Viewq.FieldValues['I_ORIGINAL_CD'];
        FieldValues['I_ORIGINAL_NAME'] := Viewq.FieldValues['I_ORIGINAL_NAME'];
        FieldValues['I_PROPERTY_CODE'] := Viewq.FieldValues['I_PROPERTY_CODE'];
        FieldValues['I_UNIT'] := Viewq.FieldValues['I_UNIT'];
        FieldValues['I_QTY1'] := StrToFloatDef(eQty1.Text, 0.0);
        FieldValues['I_QTY2'] := StrToFloatDef(eQty2.Text, 0.0);
        FieldValues['I_QTY3'] := StrToFloatDef(eQty3.Text, 0.0);
        FieldValues['I_COUNT'] := StrToFloatDef(eCount.Text, 0.0);
        FieldValues['I_SHOP_CD'] := ls_ShopCD;
        Post;
      end;
      EnableControls;
      eQty1.Text := '0';
      eQty2.Text := '0';
      eQty3.Text := '0';
      eCount.Text := '0';
      eOriginal.SetFocus;
    end;
  end;
end;

procedure TfrmAllocOriginalView.atCancelExecute(Sender: TObject);
begin
  eFlag.Enabled := False;
  eDate.Enabled := False;
  eNo.Enabled := False;
  eShop.Enabled := False;
  eOriginal.Enabled := False;
  eQty1.Enabled := False;
  eQty2.Enabled := False;
  eQty3.Enabled := False;
  if memAlloc.Active then memAlloc.Close;
end;

function TfrmAllocOriginalView.prif_GetAllocInfo: Boolean;
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT I_ORIGINAL_CD, I_ORIGINAL_NAME, I_PROPERTY_CODE, I_UNIT, I_QTY1, ' +
      'I_QTY2, I_QTY3, I_COUNT, I_SHOP_CD FROM T_ALLOC_ORIGINAL_MS WHERE I_DATE = ''%s'' AND ' +
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
        memAlloc.FieldValues['I_ORIGINAL_CD'] := FieldValues['I_ORIGINAL_CD'];
        memAlloc.FieldValues['I_ORIGINAL_NAME'] := FieldValues['I_ORIGINAL_NAME'];
        memAlloc.FieldValues['I_PROPERTY_CODE'] := FieldValues['I_PROPERTY_CODE'];
        memAlloc.FieldValues['I_UNIT'] := FieldValues['I_UNIT'];
        memAlloc.FieldValues['I_QTY1'] := FieldValues['I_QTY1'];
        memAlloc.FieldValues['I_QTY2'] := FieldValues['I_QTY2'];
        memAlloc.FieldValues['I_QTY3'] := FieldValues['I_QTY3'];
        memAlloc.FieldValues['I_COUNT'] := FieldValues['I_COUNT'];
        memAlloc.FieldValues['I_SHOP_CD'] := FieldValues['I_SHOP_CD'];;;
        memAlloc.Post;
        Next;
      end;
      memAlloc.EnableControls;
    end;
    Close;
  end;
end;

procedure TfrmAllocOriginalView.eNoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
  begin
    case Fi_Act of
      2:
      begin
        if not prif_GetAllocInfo then AppMsg('当日原料调拨数据不存在,请使用添加', '原料调拨处理');
      end;
      3:
      begin
        if not prif_GetAllocInfo then AppMsg('当日原料调拨数据不存在,请使用添加', '原料调拨处理');
      end;
    end;
  end;
end;

end.
