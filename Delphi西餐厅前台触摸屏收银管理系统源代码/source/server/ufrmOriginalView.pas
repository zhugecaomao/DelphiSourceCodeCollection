unit ufrmOriginalView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, dxExEdtr, DB, ADODB, CSADOQuery, ActnList,
  ImgList, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ToolWin, ExtCtrls,
  dxEdLib, dxEditor, StdCtrls, dxDBTLCl, dxGrClms, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCore;

type
  TfrmOriginalView = class(TfrmViewDataBase)
    ViewqI_ORIGINAL_CD: TStringField;
    ViewqI_ORIGINAL_NAME: TStringField;
    ViewqI_ORIGINAL_ITEM_CD: TStringField;
    ViewqI_UNIT1: TStringField;
    ViewqI_UNIT2: TStringField;
    ViewqI_UNIT3: TStringField;
    ViewqI_UNIT4: TStringField;
    ViewqI_QTY1: TIntegerField;
    ViewqI_QTY2: TIntegerField;
    ViewqI_UNIT5: TStringField;
    ViewqI_MODEL: TStringField;
    ViewqI_DAY: TBooleanField;
    ViewqI_WEEK: TBooleanField;
    ViewqI_MONTH: TBooleanField;
    ViewqI_COST_CHECK: TBooleanField;
    ViewqI_PURCHASE: TStringField;
    ViewqI_PROPERTY_CODE: TStringField;
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
    rbgPurchase: TRadioGroup;
    eOriginalCD: TdxEdit;
    ePropertyCD: TdxEdit;
    eOriginalName: TdxEdit;
    eItemCD: TdxPickEdit;
    eModel: TdxEdit;
    eUnit5: TdxEdit;
    eQty1: TdxEdit;
    eUnit1: TdxEdit;
    eQty2: TdxEdit;
    eUnit2: TdxEdit;
    eQty3: TdxEdit;
    eUnit3: TdxEdit;
    eQty4: TdxEdit;
    eUnit4: TdxEdit;
    chbDay: TdxCheckEdit;
    chbWeek: TdxCheckEdit;
    chbMonth: TdxCheckEdit;
    chbCostCheck: TdxCheckEdit;
    grdListI_ORIGINAL_CD: TdxDBGridMaskColumn;
    grdListI_PROPERTY_CODE: TdxDBGridMaskColumn;
    grdListI_ORIGINAL_NAME: TdxDBGridMaskColumn;
    grdListI_ORIGINAL_ITEM_CD: TdxDBGridMaskColumn;
    grdListI_UNIT1: TdxDBGridMaskColumn;
    grdListI_UNIT2: TdxDBGridMaskColumn;
    grdListI_UNIT3: TdxDBGridMaskColumn;
    grdListI_UNIT4: TdxDBGridMaskColumn;
    grdListI_QTY1: TdxDBGridMaskColumn;
    grdListI_QTY2: TdxDBGridMaskColumn;
    grdListI_QTY3: TdxDBGridMaskColumn;
    grdListI_QTY4: TdxDBGridMaskColumn;
    grdListI_UNIT5: TdxDBGridMaskColumn;
    grdListI_MODEL: TdxDBGridMaskColumn;
    grdListI_DAY: TdxDBGridCheckColumn;
    grdListI_WEEK: TdxDBGridCheckColumn;
    grdListI_MONTH: TdxDBGridCheckColumn;
    grdListI_COST_CHECK: TdxDBGridCheckColumn;
    grdListI_PURCHASE: TdxDBGridMaskColumn;
    labUnit1: TLabel;
    labUnit2: TLabel;
    labUnit3: TLabel;
    labUnit4: TLabel;
    ViewqI_QTY4: TFloatField;
    ViewqI_QTY3: TIntegerField;
    procedure atSaveExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
    procedure atNewExecute(Sender: TObject);
    procedure ViewqAfterScroll(DataSet: TDataSet);
    procedure ViewqBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure eUnit5Change(Sender: TObject);
  private
    procedure prip_GetOriginalItem;
    function prif_CanSave: Boolean;
  protected
    procedure prop_IniData; override;
    procedure prop_IniInterFace; override;
  public
    { Public declarations }
  end;

var
  frmOriginalView: TfrmOriginalView;

implementation

uses udmData, upubCommon, StrUtils;

{$R *.dfm}

{ TfrmOriginalView }

procedure TfrmOriginalView.prop_IniData;
begin
  inherited;
  Viewq.AfterScroll := nil;
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM T_ORIGINAL_MS ORDER BY I_ORIGINAL_CD';
    Open;
  end;
  Viewq.AfterScroll := ViewqAfterScroll;
  Viewq.Last;
  prip_GetOriginalItem;
end;

procedure TfrmOriginalView.prop_IniInterFace;
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfrmOriginalView.atSaveExecute(Sender: TObject);
begin
  inherited;
  if Viewq.State in [dsEdit, dsInsert] then
  begin
    try
      Viewq.Post;
      AppMsg('数据保存完成!', '原料管理', 1);
    except
      On E: Exception do
      begin  
        AppMsg(E.Message, '原料管理', 0);
        Abort;
      end;
    end;
  end;
end;

procedure TfrmOriginalView.atEditExecute(Sender: TObject);
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
    AppMsg('当前正在编辑数据，不能再编辑！', '原料管理');
end;

procedure TfrmOriginalView.atDelExecute(Sender: TObject);
begin
  inherited;
  if Viewq.IsEmpty then Exit; 
  if Viewq.State in [dsBrowse] then
  begin
    if AppMsg('您是否真的要删除当前数据?', '原料管理', 2) <> IDYES then Exit;
    try
      Viewq.Delete; 
    except
      Abort;
    end;
    prop_IniData;
  end;
end;

procedure TfrmOriginalView.atNewExecute(Sender: TObject);
begin
  inherited;
  if Viewq.State <> dsBrowse then
  begin
    AppMsg('当前正在编辑数据，不能添加！', '原料管理');
    Exit;
  end;
  Viewq.Append;
  eOriginalCD.SetFocus;
  eOriginalCD.SelectAll;
end;

procedure TfrmOriginalView.ViewqAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with Viewq do
  begin
    eOriginalCD.Text := FieldByName('I_ORIGINAL_CD').AsString;
    eOriginalName.Text := FieldByName('I_ORIGINAL_NAME').AsString;
    ePropertyCD.Text := FieldByName('I_PROPERTY_CODE').AsString;
    eItemCD.Text := FieldByName('I_ORIGINAL_ITEM_CD').AsString;
      {eItemCD.Items.Strings[eItemCD.Items.IndexOf(];}
    eModel.Text := FieldByName('I_MODEL').AsString;
    eUnit5.Text := FieldByName('I_UNIT5').AsString;
    eQty1.Text := IntToStr(FieldByName('I_QTY1').AsInteger);
    eUnit1.Text := FieldByName('I_UNIT1').AsString;
    eQty2.Text := IntToStr(FieldByName('I_QTY2').AsInteger);
    eUnit2.Text := FieldByName('I_UNIT2').AsString;
    eQty3.Text := IntToStr(FieldByName('I_QTY3').AsInteger);
    eUnit3.Text := FieldByName('I_UNIT3').AsString;
    eQty4.Text := FloatToStr(FieldByName('I_QTY4').AsFloat);
    eUnit4.Text := FieldByName('I_UNIT4').AsString;
    chbDay.Checked := FieldByName('I_DAY').AsBoolean;
    chbWeek.Checked := FieldByName('I_WEEK').AsBoolean;
    chbMonth.Checked := FieldByName('I_MONTH').AsBoolean;
    chbCostCheck.Checked := FieldByName('I_COST_CHECK').AsBoolean;
    rbgPurchase.ItemIndex := rbgPurchase.Items.IndexOf(FieldByName('I_PURCHASE').AsString);
  end;
end;

procedure TfrmOriginalView.ViewqBeforePost(DataSet: TDataSet);
begin
  inherited;
  if not prif_CanSave then Exit;
  with Viewq do
  begin
    FieldByName('I_ORIGINAL_CD').AsString := eOriginalCD.Text;
    FieldByName('I_ORIGINAL_NAME').AsString := eOriginalName.Text;
    FieldByName('I_ORIGINAL_ITEM_CD').AsString := LeftStr(eItemCD.Text, 2);
    FieldByName('I_PROPERTY_CODE').AsString := ePropertyCD.Text;
    FieldByName('I_MODEL').AsString := eModel.Text;
    FieldByName('I_UNIT5').AsString := eUnit5.Text;
    FieldByName('I_QTY1').AsInteger := StrToIntDef(eQty1.Text, 0);
    FieldByName('I_UNIT1').AsString := eUnit1.Text;
    FieldByName('I_QTY2').AsInteger := StrToIntDef(eQty2.Text, 0);
    FieldByName('I_UNIT2').AsString := eUnit2.Text;
    FieldByName('I_QTY3').AsInteger := StrToIntDef(eQty3.Text, 0);
    FieldByName('I_UNIT3').AsString := eUnit3.Text;
    FieldByName('I_QTY4').AsFloat := StrToFloatDef(eQty4.Text, 0.0);
    FieldByName('I_UNIT4').AsString := eUnit4.Text;
    FieldByName('I_DAY').AsBoolean := chbDay.Checked;
    FieldByName('I_WEEK').AsBoolean := chbWeek.Checked;
    FieldByName('I_MONTH').AsBoolean := chbMonth.Checked;
    FieldByName('I_COST_CHECK').AsBoolean := chbCostCheck.Checked;
    FieldByName('I_PURCHASE').AsString := rbgPurchase.Items.Strings[rbgPurchase.ItemIndex];
  end;
end;

procedure TfrmOriginalView.prip_GetOriginalItem;
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM T_ORIGINAL_ITEM_MS ORDER BY I_ORIGINAL_CD';
    Open;
    if not IsEmpty then
    begin
      eItemCD.Items.Clear;
      First;
      while not Eof do
      begin
        eItemCD.Items.Add(FieldByName('I_ORIGINAL_CD').AsString + '-' +
          FieldByName('I_ORIGINAL_NAME').AsString);
        Next;
      end;
    end;
    Close;
  end;
end;

function TfrmOriginalView.prif_CanSave: Boolean;
begin
  if Length(Trim(eOriginalCD.Text)) = 0 then
  begin
    AppMsg('品号不能为空!', '原料管理', 0);
    Result := False;
    Exit;
  end;
  if Length(Trim(eOriginalName.Text)) = 0 then
  begin
    AppMsg('名称不能为空!', '原料管理', 0);
    Result := False;
    Exit;
  end;
  if Length(Trim(ePropertyCD.Text)) = 0 then
  begin
    AppMsg('属性码不能为空!', '原料管理', 0);
    Result := False;
    Exit;
  end;
  if Length(Trim(eUnit5.Text)) = 0 then
  begin
    AppMsg('盘点单位不能为空!', '原料管理', 0);
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TfrmOriginalView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmOriginalView := nil;
end;

procedure TfrmOriginalView.eUnit5Change(Sender: TObject);
begin
  inherited;
  labUnit1.Caption := eUnit5.Text + labUnit1.Caption;
  labUnit2.Caption := eUnit5.Text + labUnit2.Caption;
  labUnit3.Caption := eUnit5.Text + labUnit3.Caption;
  labUnit4.Caption := eUnit5.Text + labUnit4.Caption;
end;

end.
