unit ufrmSaleView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl,
  dxDBGrid, DB, ADODB, CSADOQuery, ActnList, ImgList, dxCntner, ComCtrls,
  ToolWin, StdCtrls, ExtCtrls, dxEdLib, dxEditor, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCore;

type
  TfrmSaleView = class(TfrmViewDataBase)
    ViewqI_SALE_CD: TStringField;
    ViewqI_SALE_NAME: TStringField;
    ViewqI_PRICE: TBCDField;
    ViewqI_UNIT: TStringField;
    ViewqI_SALE_ITEM_CD: TStringField;
    ViewqI_FIX_SALE: TBooleanField;
    ViewqI_SALE_RECORD: TBooleanField;
    ViewqI_OTHER_RECORD: TBooleanField;
    ViewqI_HELPER_CODE: TStringField;
    ViewqI_LSM: TBooleanField;
    ViewqI_COST: TBCDField;
    grdListI_SALE_CD: TdxDBGridMaskColumn;
    grdListI_SALE_NAME: TdxDBGridMaskColumn;
    grdListI_PRICE: TdxDBGridCurrencyColumn;
    grdListI_UNIT: TdxDBGridMaskColumn;
    grdListI_SALE_ITEM_CD: TdxDBGridMaskColumn;
    grdListI_FIX_SALE: TdxDBGridCheckColumn;
    grdListI_SALE_RECORD: TdxDBGridCheckColumn;
    grdListI_OTHER_RECORD: TdxDBGridCheckColumn;
    grdListI_HELPER_CODE: TdxDBGridMaskColumn;
    grdListI_LSM: TdxDBGridCheckColumn;
    grdListI_COST: TdxDBGridCurrencyColumn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    chbFixSale: TdxCheckEdit;
    chbSaleRecord: TdxCheckEdit;
    chbOtherRecord: TdxCheckEdit;
    chbLsm: TdxCheckEdit;
    eSaleCD: TdxEdit;
    eSaleName: TdxEdit;
    ePrice: TdxCurrencyEdit;
    eUnit: TdxEdit;
    eSaleItem: TdxPickEdit;
    eHelperCode: TdxEdit;
    eCost: TdxCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure atSaveExecute(Sender: TObject);
    procedure atNewExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
    procedure ViewqAfterScroll(DataSet: TDataSet);
    procedure ViewqBeforePost(DataSet: TDataSet);
  private
    function prif_CanSave: Boolean;
    procedure prip_GetSaleItem;
  protected
    procedure prop_IniData; override;
    procedure prop_IniInterFace; override;
  public
    { Public declarations }
  end;

var
  frmSaleView: TfrmSaleView;

implementation

uses udmData, upubCommon;

{$R *.dfm}

{ TfrmSaleView }

procedure TfrmSaleView.prop_IniData;
begin
  inherited; 
  Viewq.AfterScroll := nil;
  with Viewq  do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM T_SALE_MS';
    Open;
  end;
  prip_GetSaleItem;
  Viewq.AfterScroll := ViewqAfterScroll;
  Viewq.Last;
end;

procedure TfrmSaleView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmSaleView := nil;
end;

function TfrmSaleView.prif_CanSave: Boolean;
begin
  if Length(Trim(eSaleCD.Text)) = 0 then
  begin
    AppMsg('成品编号不能为空!', '成品管理', 0);
    Result := False;
    Exit;
  end; 
  if Length(Trim(eSaleName.Text)) = 0 then
  begin
    AppMsg('成品名称不能为空!', '成品管理', 0);
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TfrmSaleView.atSaveExecute(Sender: TObject);
begin
  inherited;
  if Viewq.State in [dsEdit, dsInsert] then
  begin 
    if not prif_CanSave then Exit;
    try
      Viewq.Post;
      AppMsg('数据保存完成!', '成品管理', 1);
    except
      On E: Exception do
      begin
        AppMsg(E.Message, '成品管理', 0);
        Abort;
      end;
    end;
  end;
end;

procedure TfrmSaleView.atNewExecute(Sender: TObject);
begin
  inherited;
  if Viewq.State <> dsBrowse then
  begin
    AppMsg('当前正在编辑数据，不能添加！', '成品管理');
    Exit;
  end;
  Viewq.Append;
  eSaleCD.SetFocus;
  eSaleCD.SelectAll;
end;

procedure TfrmSaleView.atEditExecute(Sender: TObject);
begin
  inherited;
  if Viewq.IsEmpty then Exit;
  if Viewq.State in [dsBrowse] then
  begin
    try
      Viewq.Edit;
    except
      Abort;
    end;
  end else
    AppMsg('当前正在编辑数据，不能再编辑！', '成品管理');
end;

procedure TfrmSaleView.atDelExecute(Sender: TObject);
begin
  inherited;
  if Viewq.IsEmpty then Exit; 
  if Viewq.State in [dsBrowse] then
  begin
    if AppMsg('您是否真的要删除当前数据?', '成品管理', 2) <> IDYES then Exit;
    try
      Viewq.Delete; 
    except
      Abort;
    end;
    prop_IniData;
  end;
end;

procedure TfrmSaleView.ViewqAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with Viewq do
  begin
    eSaleCD.Text := FieldByName('I_SALE_CD').AsString;
    eSaleName.Text := FieldByName('I_SALE_NAME').AsString;
    ePrice.Value := FieldByName('I_PRICE').AsCurrency;
    eUnit.Text := FieldByName('I_UNIT').AsString;
    eSaleItem.Text := FieldByName('I_SALE_ITEM_CD').AsString;
    eHelperCode.Text := FieldByName('I_HELPER_CODE').AsString;
    chbFixSale.Checked := FieldByName('I_FIX_SALE').AsBoolean;
    chbSaleRecord.Checked := FieldByName('I_SALE_RECORD').AsBoolean;
    chbOtherRecord.Checked := FieldByName('I_OTHER_RECORD').AsBoolean;
    chbLSM.Checked := FieldByName('I_LSM').AsBoolean;
    eCost.Value := FieldByName('I_COST').AsCurrency
  end;
end;

procedure TfrmSaleView.prip_GetSaleItem;
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM T_SALE_ITME_MS';
    Open;
    eSaleItem.Items.Clear;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        eSaleItem.Items.add(FieldByName('I_ITEM_CD').AsString + '-' +
          FieldByName('I_ITEM_NAME').AsString);
        Next;
      end;
    end;
  end;
end;

procedure TfrmSaleView.prop_IniInterFace;
begin
  inherited; 
  WindowState := wsMaximized;
end;

procedure TfrmSaleView.ViewqBeforePost(DataSet: TDataSet);
begin
  inherited;
  with Viewq do
  begin
    FieldByName('I_SALE_CD').AsString := eSaleCD.Text;
    FieldByName('I_SALE_NAME').AsString := eSaleName.Text;
    FieldByName('I_PRICE').AsCurrency := ePrice.Value;
    FieldByName('I_UNIT').AsString := eUnit.Text;
    FieldByName('I_SALE_ITEM_CD').AsString := eSaleItem.Text;
    FieldByName('I_HELPER_CODE').AsString := eHelperCode.Text;
    FieldByName('I_FIX_SALE').AsBoolean := chbFixSale.Checked;
    FieldByName('I_SALE_RECORD').AsBoolean := chbSaleRecord.Checked;
    FieldByName('I_OTHER_RECORD').AsBoolean := chbOtherRecord.Checked;
    FieldByName('I_LSM').AsBoolean := chbLSM.Checked;
    FieldByName('I_COST').AsCurrency := eCost.Value;
  end;
end;

end.
