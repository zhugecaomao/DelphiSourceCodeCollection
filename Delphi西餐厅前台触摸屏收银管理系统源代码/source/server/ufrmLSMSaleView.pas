unit ufrmLSMSaleView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, dxExEdtr, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCore, DB, ADODB, CSADOQuery,
  ActnList, ImgList, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ToolWin,
  dxDBTLCl, dxGrClms, StdCtrls, dxEditor, dxEdLib, Mask, DBCtrls, ExtCtrls;

type
  TfrmLSMSaleView = class(TfrmViewDataBase)
    ViewqI_SALE_CD: TStringField;
    ViewqI_SALE_NAME: TStringField;
    ViewqI_PRICE: TCurrencyField;
    ViewqI_UNIT: TStringField;
    ViewqI_COST: TCurrencyField;
    grdListI_SALE_CD: TdxDBGridMaskColumn;
    grdListI_SALE_NAME: TdxDBGridMaskColumn;
    grdListI_UNIT: TdxDBGridMaskColumn;
    grdListI_PRICE: TdxDBGridCurrencyColumn;
    grdListI_COST: TdxDBGridCurrencyColumn;
    GroupBox1: TGroupBox;
    grdLSMList: TdxDBGrid;
    LSMq: TCSADOQuery;
    LSMd: TDataSource;
    Panel1: TPanel;
    LSMqI_LSM_REMARK: TStringField;
    LSMqI_LSM_PRICE: TCurrencyField;
    LSMqI_START_DATE: TStringField;
    LSMqI_END_DATE: TStringField;
    LSMqI_SALE_CD: TStringField;
    LSMqI_SALE_NAME: TStringField;
    LSMqI_ID: TIntegerField;
    grdLSMListI_ID: TdxDBGridMaskColumn;
    grdLSMListI_SALE_CD: TdxDBGridMaskColumn;
    grdLSMListI_SALE_NAME: TdxDBGridMaskColumn;
    grdLSMListI_LSM_REMARK: TdxDBGridMaskColumn;
    grdLSMListI_LSM_PRICE: TdxDBGridCurrencyColumn;
    grdLSMListI_START_DATE: TdxDBGridMaskColumn;
    grdLSMListI_END_DATE: TdxDBGridMaskColumn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    eLSMRemark: TdxEdit;
    ePrice: TdxCurrencyEdit;
    eStart: TdxDateEdit;
    eEnd: TdxDateEdit;
    procedure ViewqAfterScroll(DataSet: TDataSet);
    procedure LSMqAfterScroll(DataSet: TDataSet);
    procedure atNewExecute(Sender: TObject);
    procedure atSaveExecute(Sender: TObject);
    procedure LSMqBeforePost(DataSet: TDataSet);
    procedure atDelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure atCancelExecute(Sender: TObject);
  private
    procedure GetLSM(As_SaleCD: String);
  protected
    procedure prop_IniData; override;  
    procedure prop_IniInterFace; override;
  public
    { Public declarations }
  end;

var
  frmLSMSaleView: TfrmLSMSaleView;

implementation

uses udmData, upubCommon;

{$R *.dfm}

{ TfrmLSMSaleView }

procedure TfrmLSMSaleView.GetLSM(As_SaleCD: String);
begin
  with LSMq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT * FROM T_LSM_SALE_MS WHERE I_SALE_CD = ''%s''', [As_SaleCD]);
    Open;
  end;
end;

procedure TfrmLSMSaleView.prop_IniData;
begin
  inherited;
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT I_SALE_CD, I_SALE_NAME, I_UNIT, I_PRICE, I_COST FROM T_SALE_MS WHERE I_LSM = 1';
    Open;
  end;
end;

procedure TfrmLSMSaleView.prop_IniInterFace;
begin
  inherited;
  WindowState := wsMaximized;
  tbEdit.Visible := False; 
end;

procedure TfrmLSMSaleView.ViewqAfterScroll(DataSet: TDataSet);
begin
  inherited;
  GetLSM(Viewq.FieldByName('I_SALE_CD').AsString);
end;

procedure TfrmLSMSaleView.LSMqAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with LSMq do
  begin
    eLSMRemark.Text := FieldByName('I_LSM_REMARK').AsString;
    ePrice.Value := FieldByName('I_LSM_PRICE').AsCurrency;
    eStart.Text := FieldByName('I_START_DATE').AsString;
    eEnd.Text := FieldByName('I_END_DATE').AsString;
  end;
end;

procedure TfrmLSMSaleView.atNewExecute(Sender: TObject);
begin
  inherited;
  if LSMq.State <> dsBrowse then
  begin
    AppMsg('当前正在编辑数据，不能添加！', 'LSM促销管理');
    Exit;
  end;
  LSMq.Append;
  eLSMRemark.SetFocus;
  eLSMRemark.SelectAll;
end;

procedure TfrmLSMSaleView.atSaveExecute(Sender: TObject);
begin
  inherited;
  if LSMq.State in [dsEdit, dsInsert] then
  begin
    try
      LSMq.Post;
      AppMsg('数据保存完成!', 'LSM促销管理', 1);
    except
      On E: Exception do
      begin
        AppMsg(E.Message, 'LSM促销管理', 0);
        Abort;
      end;
    end;
  end;
end;

procedure TfrmLSMSaleView.LSMqBeforePost(DataSet: TDataSet);
begin
  inherited;
  with LSMq do
  begin
    FieldByName('I_SALE_CD').AsString := Viewq.FieldByName('I_SALE_CD').AsString;   
    FieldByName('I_SALE_NAME').AsString := Viewq.FieldByName('I_SALE_NAME').AsString;
    FieldByName('I_LSM_REMARK').AsString := eLSMRemark.Text;
    FieldByName('I_LSM_REMARK').AsString := eLSMRemark.Text;
    FieldByName('I_LSM_PRICE').AsCurrency := ePrice.Value;
    FieldByName('I_START_DATE').AsString := FormatDateTime('YYYY-MM-DD', eStart.Date);
    FieldByName('I_END_DATE').AsString := FormatDateTime('YYYY-MM-DD', eEnd.Date);
  end;
end;

procedure TfrmLSMSaleView.atDelExecute(Sender: TObject);
begin
  inherited;
  if LSMq.IsEmpty then Exit;
  if LSMq.State in [dsBrowse] then
  begin
    if AppMsg('您是否真的要删除当前数据?', 'LSM促销管理', 2) <> IDYES then Exit;
    try
      LSMq.Delete;
    except
      Abort;
    end;
    GetLSM(Viewq.FieldByName('I_SALE_CD').AsString);
  end;
end;

procedure TfrmLSMSaleView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmLSMSaleView := nil;
end;

procedure TfrmLSMSaleView.atCancelExecute(Sender: TObject);
begin
  inherited;
  LSMq.Cancel;
end;

end.
