unit ufrmShopView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, dxExEdtr, DB, ADODB, CSADOQuery, ActnList,
  ImgList, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ToolWin, ExtCtrls,
  dxDBTLCl, dxGrClms, dxEdLib, dxEditor, StdCtrls, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCore;

type
  TfrmShopView = class(TfrmViewDataBase)
    Panel1: TPanel;
    ViewqI_SHOP_CD: TStringField;
    ViewqI_SHOP_NAME: TStringField;
    ViewqI_COMPANY_NAME: TStringField;
    ViewqI_SHOP_FULL_NAME: TStringField;
    ViewqI_SHOP_ITEM_CD: TStringField;
    ViewqI_SHOP_ADDRESS: TStringField;
    ViewqI_SHOP_TEL: TStringField;
    ViewqI_SHOP_START_DATE: TStringField;
    ViewqI_SHOP_CONNECT_MAN: TStringField;
    ViewqI_SHOP_TYPE: TStringField;
    ViewqI_TRADE_TYPE: TStringField;
    ViewqI_CITY: TStringField;
    ViewqI_CITY_TYPE: TStringField;
    ViewqI_IS_QUCIK: TBooleanField;
    ViewqI_AREA_TRADE: TStringField;
    grdListI_SHOP_CD: TdxDBGridMaskColumn;
    grdListI_SHOP_NAME: TdxDBGridMaskColumn;
    grdListI_COMPANY_NAME: TdxDBGridMaskColumn;
    grdListI_SHOP_FULL_NAME: TdxDBGridMaskColumn;
    grdListI_SHOP_ITEM_CD: TdxDBGridMaskColumn;
    grdListI_SHOP_ADDRESS: TdxDBGridMaskColumn;
    grdListI_SHOP_TEL: TdxDBGridMaskColumn;
    grdListI_SHOP_START_DATE: TdxDBGridMaskColumn;
    grdListI_SHOP_CONNECT_MAN: TdxDBGridMaskColumn;
    grdListI_SHOP_TYPE: TdxDBGridMaskColumn;
    grdListI_TRADE_TYPE: TdxDBGridMaskColumn;
    grdListI_CITY: TdxDBGridMaskColumn;
    grdListI_CITY_TYPE: TdxDBGridMaskColumn;
    grdListI_IS_QUCIK: TdxDBGridCheckColumn;
    grdListI_AREA_TRADE: TdxDBGridMaskColumn;
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
    Label12: TLabel;
    Label13: TLabel;
    eShopCD: TdxEdit;
    eShopName: TdxEdit;
    eComName: TdxEdit;
    eShopFullName: TdxEdit;
    eShopType: TdxEdit;
    eTradeType: TdxEdit;
    eAreaTrade: TdxEdit;
    eCity: TdxEdit;
    eCityType: TdxEdit;
    eAddress: TdxEdit;
    eTel: TdxEdit;
    eConnectMan: TdxEdit;
    eStartDate: TdxDateEdit;
    chbIsQuick: TdxCheckEdit;
    procedure atNewExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure atSaveExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ViewqAfterScroll(DataSet: TDataSet);
    procedure ViewqBeforePost(DataSet: TDataSet);
  private
    function prif_CanSave: Boolean;
  protected
    procedure prop_IniData; override;
  public
    { Public declarations }
  end;

var
  frmShopView: TfrmShopView;

implementation

uses udmData, upubCommon;

{$R *.dfm}

{ TfrmShopView }

procedure TfrmShopView.prop_IniData;
begin
  inherited;
  Viewq.AfterScroll := nil;
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM T_SHOP_MS';
    Open;
  end;
  Viewq.AfterScroll := ViewqAfterScroll;
  Viewq.Last;
end;

procedure TfrmShopView.atNewExecute(Sender: TObject);
begin
  inherited;
  if Viewq.State <> dsBrowse then
  begin
    AppMsg('当前正在编辑数据，不能添加！', '原料分类管理');
    Exit;
  end;
  Viewq.Append;
  eShopCD.SetFocus;
  eShopCD.SelectAll;
end;

procedure TfrmShopView.atEditExecute(Sender: TObject);
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
    AppMsg('当前正在编辑数据，不能再编辑！', '餐厅信息管理');
end;

procedure TfrmShopView.atSaveExecute(Sender: TObject);
begin
  inherited;
  if Viewq.State in [dsEdit, dsInsert] then
  begin
    try
      Viewq.Post;
      AppMsg('数据保存完成!', '餐厅信息管理', 1);
    except
      On E: Exception do
      begin
        AppMsg(E.Message, '餐厅信息管理', 0);
        Abort;
      end;
    end;
  end;
end;

procedure TfrmShopView.atDelExecute(Sender: TObject);
begin
  inherited;
  if Viewq.IsEmpty then Exit; 
  if Viewq.State in [dsBrowse] then
  begin
    if AppMsg('您是否真的要删除当前数据?', '餐厅信息管理', 2) <> IDYES then Exit;
    try
      Viewq.Delete; 
    except
      Abort;
    end;
    prop_IniData;
  end;
end;

procedure TfrmShopView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmShopView := nil;
end;

procedure TfrmShopView.ViewqAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with Viewq do
  begin    
    eShopCD.Text := FieldByName('I_SHOP_CD').AsString;
    eShopName.Text := FieldByName('I_SHOP_NAME').AsString;
    eComName.Text := FieldByName('I_COMPANY_NAME').AsString; 
    eShopFullName.Text := FieldByName('I_SHOP_FULL_NAME').AsString;
    eComName.Text := FieldByName('I_COMPANY_NAME').AsString;
    eAddress.Text := FieldByName('I_SHOP_ADDRESS').AsString;
    eTel.Text := FieldByName('I_SHOP_TEL').AsString;   
    eConnectMan.Text := FieldByName('I_SHOP_CONNECT_MAN').AsString;
    eTradeType.Text := FieldByName('I_TRADE_TYPE').AsString;
    eCity.Text := FieldByName('I_CITY').AsString;
    eCityType.Text := FieldByName('I_CITY_TYPE').AsString;
    eAreaTrade.Text := FieldByName('I_AREA_TRADE').AsString;
    chbIsQuick.Checked := FieldByName('I_IS_QUCIK').AsBoolean;
    eStartDate.Text := FieldByName('I_SHOP_START_DATE').AsString;
  end;
end;

function TfrmShopView.prif_CanSave: Boolean;
begin
  if Length(Trim(eShopCD.Text)) = 0 then
  begin
    AppMsg('编号不能为空!', '餐厅信息管理', 0);
    Result := False;
    Exit;
  end;
  if Length(Trim(eShopName.Text)) = 0 then
  begin
    AppMsg('名称不能为空!', '餐厅信息管理', 0);
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TfrmShopView.ViewqBeforePost(DataSet: TDataSet);
begin
  inherited;
  if not prif_CanSave then Exit;
  with Viewq do
  begin
    FieldByName('I_SHOP_CD').AsString := eShopCD.Text;
    FieldByName('I_SHOP_NAME').AsString := eShopName.Text;
    FieldByName('I_COMPANY_NAME').AsString := eComName.Text;
    FieldByName('I_SHOP_FULL_NAME').AsString := eShopFullName.Text;
    FieldByName('I_COMPANY_NAME').AsString := eComName.Text;
    FieldByName('I_SHOP_ADDRESS').AsString := eAddress.Text;
    FieldByName('I_SHOP_TEL').AsString := eTel.Text;
    FieldByName('I_SHOP_CONNECT_MAN').AsString := eConnectMan.Text;
    FieldByName('I_TRADE_TYPE').AsString := eTradeType.Text;
    FieldByName('I_CITY').AsString := eCity.Text;
    FieldByName('I_CITY_TYPE').AsString := eCityType.Text;
    FieldByName('I_AREA_TRADE').AsString := eAreaTrade.Text;
    FieldByName('I_IS_QUCIK').AsBoolean := chbIsQuick.Checked;
    FieldByName('I_SHOP_START_DATE').AsString := eStartDate.Text;
  end;
end;

end.
