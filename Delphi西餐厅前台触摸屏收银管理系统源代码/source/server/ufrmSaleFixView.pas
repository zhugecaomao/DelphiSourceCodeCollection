unit ufrmSaleFixView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, dxExEdtr, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCore, DB, ADODB, CSADOQuery,
  ActnList, ImgList, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ToolWin,
  dxDBTLCl, dxGrClms, StdCtrls, dxmdaset;

type
  TfrmSaleFixView = class(TfrmViewDataBase)
    ViewqI_SALE_CD: TStringField;
    ViewqI_SALE_NAME: TStringField;
    ViewqI_PRICE: TCurrencyField;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ViewqI_COST: TCurrencyField;
    grdListI_SALE_CD: TdxDBGridMaskColumn;
    grdListI_SALE_NAME: TdxDBGridMaskColumn;
    grdListI_PRICE: TdxDBGridCurrencyColumn;
    grdListI_COST: TdxDBGridCurrencyColumn;
    grdFixSaleList: TdxDBGrid;
    grdSaleList: TdxDBGrid;
    memUnSelect: TdxMemData;
    unSelectd: TDataSource;
    Selectd: TDataSource;
    unSelectq: TCSADOQuery;
    unSelectqI_SALE_CD: TStringField;
    unSelectqI_SALE_NAME: TStringField;
    unSelectqI_PRICE: TCurrencyField;
    unSelectqI_COST: TCurrencyField;
    unSelectqI_LSM: TBooleanField;
    unSelectqI_SALE_RECORD: TBooleanField;
    unSelectqI_OTHER_RECORD: TBooleanField;
    unSelectqI_UNIT: TStringField;
    memUnSelectI_SALE_CD: TStringField;
    memUnSelectI_SALE_NAME: TStringField;
    memUnSelectI_UNIT: TStringField;
    memUnSelectI_PRICE: TCurrencyField;
    memUnSelectI_SALE_RECORD: TBooleanField;
    memUnSelectI_OTHER_RECORD: TBooleanField;
    memUnSelectI_LSM: TBooleanField;
    memUnSelectI_COST: TCurrencyField;
    Selectq: TCSADOQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    CurrencyField1: TCurrencyField;
    BooleanField1: TBooleanField;
    BooleanField2: TBooleanField;
    BooleanField3: TBooleanField;
    CurrencyField2: TCurrencyField;
    memSelect: TdxMemData;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    CurrencyField3: TCurrencyField;
    CurrencyField4: TCurrencyField;
    BooleanField4: TBooleanField;
    BooleanField5: TBooleanField;
    BooleanField6: TBooleanField;
    grdSaleListRecId: TdxDBGridColumn;
    grdSaleListI_SALE_CD: TdxDBGridMaskColumn;
    grdSaleListI_SALE_NAME: TdxDBGridMaskColumn;
    grdSaleListI_UNIT: TdxDBGridMaskColumn;
    grdSaleListI_PRICE: TdxDBGridCurrencyColumn;
    grdSaleListI_COST: TdxDBGridCurrencyColumn;
    grdSaleListI_SALE_RECORD: TdxDBGridCheckColumn;
    grdSaleListI_OTHER_RECORD: TdxDBGridCheckColumn;
    grdSaleListI_LSM: TdxDBGridCheckColumn;
    grdFixSaleListRecId: TdxDBGridColumn;
    grdFixSaleListI_SALE_CD: TdxDBGridMaskColumn;
    grdFixSaleListI_SALE_NAME: TdxDBGridMaskColumn;
    grdFixSaleListI_UNIT: TdxDBGridMaskColumn;
    grdFixSaleListI_PRICE: TdxDBGridCurrencyColumn;
    grdFixSaleListI_COST: TdxDBGridCurrencyColumn;
    grdFixSaleListI_SALE_RECORD: TdxDBGridCheckColumn;
    grdFixSaleListI_OTHER_RECORD: TdxDBGridCheckColumn;
    grdFixSaleListI_LSM: TdxDBGridCheckColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdSaleListDblClick(Sender: TObject);
    procedure grdFixSaleListDblClick(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure atSaveExecute(Sender: TObject);
  private
    procedure prip_GetSelect(As_SaleCD: String);
    procedure prip_GetUnSelect(As_SaleCD: String);
  protected
    procedure prop_IniData; override;  
    procedure prop_IniInterFace; override;
  public
    { Public declarations }
  end;

var
  frmSaleFixView: TfrmSaleFixView;

implementation

uses udmData, upubCommon;

{$R *.dfm}

{ TfrmSaleFixView }

procedure TfrmSaleFixView.prip_GetSelect(As_SaleCD: String);
begin
  with Selectq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT I_SALE_CD, I_SALE_NAME, I_UNIT, I_PRICE, I_SALE_RECORD, ' +
      ' I_OTHER_RECORD, I_LSM, I_COST FROM T_SALE_MS WHERE I_SALE_CD IN (SELECT I_SALE_CD FROM ' +
      ' T_SALE_FIX_MS WHERE I_ITEM_CD = ''%s'') AND I_FIX_SALE <> 1', [As_SaleCD]);
    Open; 
    if memSelect.Active then memSelect.Close;
    memSelect.LoadFromDataSet(Selectq);
  end;
end;

procedure TfrmSaleFixView.prip_GetUnSelect(As_SaleCD: String);
begin
  with unSelectq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT I_SALE_CD, I_SALE_NAME, I_UNIT, I_PRICE, I_SALE_RECORD, ' +
      ' I_OTHER_RECORD, I_LSM, I_COST FROM T_SALE_MS WHERE I_SALE_CD NOT IN (SELECT I_SALE_CD FROM ' +
      ' T_SALE_FIX_MS WHERE I_ITEM_CD = ''%s'') AND I_FIX_SALE <> 1', [As_SaleCD]);
    Open;
    if memUnSelect.Active then memUnSelect.Close;
    memUnSelect.LoadFromDataSet(unSelectq);
  end;
end;

procedure TfrmSaleFixView.prop_IniData;
begin
  inherited;
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT I_SALE_CD, I_SALE_NAME, I_PRICE, I_COST FROM T_SALE_MS WHERE I_FIX_SALE = 1';
    Open;
  end;
end;

procedure TfrmSaleFixView.prop_IniInterFace;
begin
  inherited;
  WindowState := wsMaximized;
  tbNew.Visible := False;
  tbDel.Visible := False;
end;

procedure TfrmSaleFixView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmSaleFixView := nil;
end;

procedure TfrmSaleFixView.grdSaleListDblClick(Sender: TObject);
begin
  inherited;
  if not memSelect.Active then memSelect.Open;
  memUnSelect.DisableControls;
  memSelect.DisableControls;
  memSelect.Append;
  memSelect.FieldValues['I_SALE_CD'] := memUnSelect.FieldValues['I_SALE_CD']; 
  memSelect.FieldValues['I_SALE_NAME'] := memUnSelect.FieldValues['I_SALE_NAME'];
  memSelect.FieldValues['I_UNIT'] := memUnSelect.FieldValues['I_UNIT'];
  memSelect.FieldValues['I_PRICE'] := memUnSelect.FieldValues['I_PRICE'];
  memSelect.FieldValues['I_SALE_RECORD'] := memUnSelect.FieldValues['I_SALE_RECORD'];
  memSelect.FieldValues['I_OTHER_RECORD'] := memUnSelect.FieldValues['I_OTHER_RECORD']; 
  memSelect.FieldValues['I_LSM'] := memUnSelect.FieldValues['I_LSM'];
  memSelect.FieldValues['I_COST'] := memUnSelect.FieldValues['I_COST'];
  memSelect.Post;
  memUnSelect.Delete;
  memUnselect.EnableControls;
  memSelect.EnableControls;
end;

procedure TfrmSaleFixView.grdFixSaleListDblClick(Sender: TObject);
begin
  inherited;
  if not memUnSelect.Active then memSelect.Open;
  memUnSelect.DisableControls;
  memSelect.DisableControls;
  memUnSelect.Append;
  memUnSelect.FieldValues['I_SALE_CD'] := memSelect.FieldValues['I_SALE_CD'];
  memUnSelect.FieldValues['I_SALE_NAME'] := memSelect.FieldValues['I_SALE_NAME'];
  memUnSelect.FieldValues['I_UNIT'] := memSelect.FieldValues['I_UNIT'];
  memUnSelect.FieldValues['I_PRICE'] := memSelect.FieldValues['I_PRICE'];
  memUnSelect.FieldValues['I_SALE_RECORD'] := memSelect.FieldValues['I_SALE_RECORD'];
  memUnSelect.FieldValues['I_OTHER_RECORD'] := memSelect.FieldValues['I_OTHER_RECORD'];
  memUnSelect.FieldValues['I_LSM'] := memSelect.FieldValues['I_LSM'];
  memUnSelect.FieldValues['I_COST'] := memSelect.FieldValues['I_COST'];
  memUnSelect.Post;
  memSelect.Delete;
  memUnselect.EnableControls;
  memSelect.EnableControls;
end;

procedure TfrmSaleFixView.atEditExecute(Sender: TObject);
begin
  inherited;
  if (not Viewq.IsEmpty) and (Viewq.Active) then
  begin
    prip_GetUnSelect(Viewq.FieldByName('I_SALE_CD').AsString);
    prip_GetSelect(Viewq.FieldByName('I_SALE_CD').AsString);
  end;
end;

procedure TfrmSaleFixView.atSaveExecute(Sender: TObject);
var
  ls_SQL, ls_SQL1, ls_ItemCD: String;
begin
  inherited; 
  if (not Viewq.IsEmpty) and (Viewq.Active) then
  begin
    ls_ItemCD := Viewq.FieldByName('I_SALE_CD').AsString;
    ls_SQL := Format('DELETE FROM T_SALE_FIX_MS WHERE I_ITEM_CD = ''%s''', [ls_ItemCD]);
    dmData.adocon.BeginTrans;
    try
      dmData.adocon.Execute(ls_SQL);
      if (memSelect.Active) and (not memSelect.IsEmpty) then
      begin
        memSelect.DisableControls;
        memSelect.First;
        while not memSelect.Eof do
        begin
          ls_SQL1 := Format('INSERT INTO T_SALE_FIX_MS VALUES (''%s'', ''%s'')',
            [ls_ItemCD, memSelect.FieldByName('I_SALE_CD').AsString]);
          dmData.adocon.Execute(ls_SQL1);
          memSelect.Next;
        end;
        memSelect.EnableControls;
      end;
      dmData.adocon.CommitTrans; 
      AppMsg('套餐内容保存完成', '套餐管理', 1);
    except
      On E: Exception do
      begin
        AppMsg(E.Message, '套餐管理');
        dmData.adocon.RollbackTrans;
      end;
    end;
  end;
end;

end.
