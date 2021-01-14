unit ufrmSaleStructView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, dxExEdtr, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCore, DB, ADODB, CSADOQuery,
  ActnList, ImgList, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ToolWin,
  dxEdLib, StdCtrls, dxEditor, ExtCtrls, dxmdaset;

type
  TfrmSaleStructView = class(TfrmViewDataBase)
    Panel1: TPanel;
    eSale: TdxPickEdit;
    Label6: TLabel;
    Label3: TLabel;
    eUnit: TdxEdit;
    eOriginal: TdxPickEdit;
    eUnit3: TdxEdit;
    Label7: TLabel;
    Label1: TLabel;
    eQty: TdxEdit;
    Label11: TLabel;
    Label2: TLabel;
    eRange: TdxPickEdit;
    memStruct: TdxMemData;
    Structd: TDataSource;
    memStructI_SALE_CD: TStringField;
    memStructI_SALE_NAME: TStringField;
    memStructI_ORIGINAL_CD: TStringField;
    memStructI_ORIGINAL_NAME: TStringField;
    memStructI_UNIT: TStringField;
    memStructI_QTY: TFloatField;
    memStructI_RANGE: TIntegerField;
    Label4: TLabel;
    grdListRecId: TdxDBGridColumn;
    grdListI_SALE_CD: TdxDBGridMaskColumn;
    grdListI_SALE_NAME: TdxDBGridMaskColumn;
    grdListI_ORIGINAL_CD: TdxDBGridMaskColumn;
    grdListI_ORIGINAL_NAME: TdxDBGridMaskColumn;
    grdListI_UNIT: TdxDBGridMaskColumn;
    grdListI_QTY: TdxDBGridMaskColumn;
    grdListI_RANGE: TdxDBGridMaskColumn;
    Saleq: TCSADOQuery;
    SaleqI_SALE_CD: TStringField;
    SaleqI_SALE_NAME: TStringField;
    SaleqI_UNIT: TStringField;
    ViewqI_ORIGINAL_CD: TStringField;
    ViewqI_ORIGINAL_NAME: TStringField;
    Viewqi_unit3: TStringField;
    Viewqi_qty3: TIntegerField;
    procedure atNewExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
    procedure atCancelExecute(Sender: TObject);
    procedure eSaleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eOriginalChange(Sender: TObject);
    procedure eQtyKeyPress(Sender: TObject; var Key: Char);
    procedure eRangeKeyPress(Sender: TObject; var Key: Char);
    procedure eRangeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure atSaveExecute(Sender: TObject);
  private
    Fi_Act: Integer;
    procedure prip_GetSaleInfo;
    procedure prip_GetOriginalInfo;
    function prif_SerachSale(As_SaleCD: String): Boolean;
    procedure prip_SerachOriginal(As_OriginalCD: String);
    function prif_GetStructInfo(As_SaleCD: String): Boolean;
    procedure prip_Save;
  protected
    procedure prop_IniData; override;  
    procedure prop_IniInterFace; override;
  public
    { Public declarations }
  end;

var
  frmSaleStructView: TfrmSaleStructView;

implementation

uses udmData, upubCommon, StrUtils;

{$R *.dfm}

{ TfrmSaleStructView }

procedure TfrmSaleStructView.prip_GetOriginalInfo;
begin
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT I_ORIGINAL_CD, I_ORIGINAL_NAME, I_PROPERTY_CODE, i_unit3,  ' +
      ' i_qty3 FROM T_ORIGINAL_MS';
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

procedure TfrmSaleStructView.prip_GetSaleInfo;
begin
  with Saleq do
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

procedure TfrmSaleStructView.prop_IniData;
begin
  inherited;
  prip_GetSaleInfo;
  prip_GetOriginalInfo;
end;

procedure TfrmSaleStructView.prop_IniInterFace;
begin
  inherited; 
  WindowState := wsMaximized;
  eOriginal.Enabled := False;
  eSale.Enabled := False;
  eQty.Enabled := False;
  eRange.Enabled := False;
end;

procedure TfrmSaleStructView.atNewExecute(Sender: TObject);
begin
  inherited;
  Fi_Act := 1;
  eOriginal.Enabled := True;
  eSale.Enabled := True;
  eQty.Enabled := True;
  eRange.Enabled := True;
  eSale.SetFocus;
end;

procedure TfrmSaleStructView.atEditExecute(Sender: TObject);
begin
  inherited;
  Fi_Act := 2;
  eOriginal.Enabled := True;
  eSale.Enabled := True;
  eQty.Enabled := True;
  eRange.Enabled := True;  
  eSale.SetFocus;
end;

procedure TfrmSaleStructView.atDelExecute(Sender: TObject);
begin
  inherited;
  Fi_Act := 3;
  eSale.Enabled := True; 
  eOriginal.Enabled := False; 
  eQty.Enabled := False;
  eRange.Enabled := False;   
  eSale.SetFocus;
end;

procedure TfrmSaleStructView.atCancelExecute(Sender: TObject);
begin
  inherited;
  eOriginal.Enabled := False;
  eSale.Enabled := False;
  eQty.Enabled := False;
  eRange.Enabled := False;
  if memStruct.Active then memStruct.Close;
end;

function TfrmSaleStructView.prif_SerachSale(As_SaleCD: String): Boolean;
begin
  Result := Saleq.Locate('I_SALE_CD', As_SaleCD, []);
  if not Result then AppMsg('成品选择错误', '成品配方管理');
end;

procedure TfrmSaleStructView.prip_SerachOriginal(As_OriginalCD: String);
begin
  if Viewq.Locate('I_ORIGINAL_CD', As_OriginalCD, []) then
  begin
    eUnit3.Text := Viewq.FieldByName('I_UNIT3').AsString;
  end;
end;

procedure TfrmSaleStructView.eSaleKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ls_SaleCD: String;
  li_Index: Integer;
begin
  if Key = 13 then
  begin
    li_Index := Pos('-', eSale.Text);
    ls_SaleCD := LeftStr(eSale.Text, li_Index - 1);
    if not prif_SerachSale(ls_SaleCD) then Exit;
    eUnit.Text := Saleq.FieldValues['I_UNIT'];
    prif_GetStructInfo(ls_SaleCD);
  end;
  inherited;
end;

procedure TfrmSaleStructView.eOriginalChange(Sender: TObject);
var
  ls_OriginalCD: String;
  li_Index: Integer;
begin
  inherited;
  li_Index := Pos('-', eOriginal.Text);
  ls_OriginalCD := LeftStr(eOriginal.Text, li_Index - 1);
  prip_SerachOriginal(ls_OriginalCD);
end;

procedure TfrmSaleStructView.eQtyKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key in ['0'..'9']) or (Key = #13) or (Key = #8) or (Key = #9) or (Key = '.') then
  else Key := #0;
end;

procedure TfrmSaleStructView.eRangeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key in ['0'..'2']) or (Key = #13) or (Key = #8) then
  else Key := #0;
end;

procedure TfrmSaleStructView.eRangeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
  begin
    if not memStruct.Active then memStruct.Open;
    with memStruct do
    begin
      DisableControls;
      if Locate('I_ORIGINAL_CD', Viewq.FieldValues['I_ORIGINAL_CD'], []) then
      begin
        Edit;
        FieldValues['I_SALE_CD'] := Saleq.FieldValues['I_SALE_CD'];
        FieldValues['I_SALE_NAME'] := Saleq.FieldValues['I_SALE_NAME'];
        FieldValues['I_ORIGINAL_CD'] := Viewq.FieldValues['I_ORIGINAL_CD'];
        FieldValues['I_ORIGINAL_NAME'] := Viewq.FieldValues['I_ORIGINAL_NAME'];
        FieldValues['I_UNIT'] := Viewq.FieldValues['I_UNIT3'];
        FieldValues['I_QTY'] := FieldValues['I_QTY'] + StrToFloatDef(eQty.Text, 0.0);
        FieldValues['I_RANGE'] := StrToIntDef(LeftStr(eRange.Text, 1), 0);
        Post;
      end else begin
        Append;
        FieldValues['I_SALE_CD'] := Saleq.FieldValues['I_SALE_CD'];
        FieldValues['I_SALE_NAME'] := Saleq.FieldValues['I_SALE_NAME'];
        FieldValues['I_ORIGINAL_CD'] := Viewq.FieldValues['I_ORIGINAL_CD'];
        FieldValues['I_ORIGINAL_NAME'] := Viewq.FieldValues['I_ORIGINAL_NAME'];
        FieldValues['I_UNIT'] := Viewq.FieldValues['I_UNIT3'];
        FieldValues['I_QTY'] := StrToFloatDef(eQty.Text, 0.0);
        FieldValues['I_RANGE'] := StrToIntDef(LeftStr(eRange.Text, 1), 0);
        Post;
      end;
      EnableControls;
      eQty.Text := '0';
      eOriginal.SetFocus;
      EnableControls; 
    end;
  end;
end;

function TfrmSaleStructView.prif_GetStructInfo(As_SaleCD: String): Boolean;
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT I_SALE_CD, I_SALE_NAME, I_ORIGINAL_CD, I_ORIGINAL_NAME, I_UNIT, ' +
      'I_QTY, I_RANGE FROM T_SALE_STRUCT_MS WHERE I_SALE_CD = ''%s''', [As_SaleCD]);
    Open;
    Result := not IsEmpty;
    if not IsEmpty then
    begin
      if memStruct.Active then memStruct.Close;
      memStruct.Open;
      First;
      while not Eof do
      begin
        memStruct.DisableControls;
        memStruct.Append;
        memStruct.FieldValues['I_SALE_CD'] := FieldValues['I_SALE_CD'];
        memStruct.FieldValues['I_SALE_NAME'] := FieldValues['I_SALE_NAME'];
        memStruct.FieldValues['I_ORIGINAL_CD'] := FieldValues['I_ORIGINAL_CD'];
        memStruct.FieldValues['I_ORIGINAL_NAME'] := FieldValues['I_ORIGINAL_NAME'];
        memStruct.FieldValues['I_UNIT'] := FieldValues['I_UNIT'];
        memStruct.FieldValues['I_QTY'] := FieldValues['I_QTY'];
        memStruct.FieldValues['I_RANGE'] := FieldValues['I_RANGE'];
        memStruct.Post;
        memStruct.EnableControls;
        Next;
      end;
    end;
  end;
end;

procedure TfrmSaleStructView.prip_Save;
var
  ls_SaleCD, ls_SQL: String;
begin
  if (not memStruct.Active) or (memStruct.IsEmpty) then Exit;
  case Fi_Act of
    1..2:
    begin
      with memStruct do
      begin
        First;
        ls_SaleCD := FieldValues['I_SALE_CD'];
        DisableControls;
        dmData.adocon.BeginTrans;
        try
          dmData.adocon.Execute(Format('DELETE FROM T_SALE_STRUCT_MS WHERE I_SALE_CD = ''%s''',
            [ls_SaleCD]));
          while not Eof do
          begin
            ls_SQL := Format('INSERT INTO T_SALE_STRUCT_MS VALUES (''%s'', ''%s'', ''%s'', ''%s'', ' +
              '''%s'', %f, %d)', [FieldByName('I_SALE_CD').AsString,
              FieldByName('I_SALE_NAME').AsString, FieldByName('I_ORIGINAL_CD').AsString,
              FieldByName('I_ORIGINAL_NAME').AsString, FieldByName('I_UNIT').AsString,
              FieldByName('I_QTY').AsFloat, FieldByName('I_RANGE').AsInteger]);
            dmData.adocon.Execute(ls_SQL);
            Next;
          end;
          dmData.adocon.CommitTrans;
          AppMsg('保存完成', '成品配方管理', 1);
          eOriginal.Enabled := False;
          eSale.Enabled := False;
          eQty.Enabled := False;
          eRange.Enabled := False;
        except
          On E: Exception do
          begin
            AppMsg(E.Message, '成品配方管理');
            dmData.adocon.RollbackTrans;
          end;
        end;
        EnableControls;  
        Close;
      end;
    end;
    3:
    begin
      ls_SaleCD := memStruct.FieldValues['I_SALE_CD'];
      dmData.adocon.BeginTrans;
      try
        dmData.adocon.Execute(Format('DELETE FROM T_SALE_STRUCT_MS WHERE I_SALE_CD = ''%s''',
          [ls_SaleCD])); 
        dmData.adocon.CommitTrans;
        AppMsg('删除完成', '成品配方管理', 1);
      except
        On E: Exception do
        begin
          AppMsg(E.Message, '成品配方管理');
          dmData.adocon.RollbackTrans;
        end;
      end;
      eOriginal.Enabled := False;
      eSale.Enabled := False;
      eQty.Enabled := False;
      eRange.Enabled := False;
      memStruct.Close;
    end;
  end;
end;

procedure TfrmSaleStructView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmSaleStructView := nil;
end;

procedure TfrmSaleStructView.atSaveExecute(Sender: TObject);
begin
  inherited;
  prip_Save;
end;

end.
