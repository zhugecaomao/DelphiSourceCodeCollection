unit ufrmSaleTradeUseStatic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmStaticBase, StdCtrls, Buttons, ExtCtrls, dxCntner, dxEditor,
  dxExEdtr, dxEdLib, dxTL, dxDBCtrl, dxDBGrid, DB, ADODB, CSADOQuery,
  dxDBTLCl, dxGrClms;

type
  TfrmSaleTradeUseStatic = class(TfrmStaticBase)
    Panel3: TPanel;
    eStartDate: TdxDateEdit;
    Label1: TLabel;
    bbtnStatic: TBitBtn;
    bbtnExport: TBitBtn;
    grdList: TdxDBGrid;
    Viewq: TCSADOQuery;
    Viewd: TDataSource;
    ViewqI_SALE_CD: TStringField;
    ViewqI_SALE_NAME: TStringField;
    ViewqI_PRICE: TBCDField;
    ViewqI_TRADE_QTY: TIntegerField;
    ViewqI_TRADE_AMOUNT: TBCDField;
    ViewqI_LOST_QTY: TIntegerField;
    ViewqI_ALLOC_QTY: TIntegerField;
    ViewqI_TEST_QTY: TIntegerField;
    ViewqI_LSM_QTY: TIntegerField;
    ViewqI_SALE_QTY: TIntegerField;
    ViewqI_TRADE_DISCOUNT: TFloatField;
    grdListI_SALE_CD: TdxDBGridMaskColumn;
    grdListI_SALE_NAME: TdxDBGridMaskColumn;
    grdListI_PRICE: TdxDBGridCurrencyColumn;
    grdListI_TRADE_QTY: TdxDBGridMaskColumn;
    grdListI_TRADE_AMOUNT: TdxDBGridCurrencyColumn;
    grdListI_LOST_QTY: TdxDBGridMaskColumn;
    grdListI_ALLOC_QTY: TdxDBGridMaskColumn;
    grdListI_TEST_QTY: TdxDBGridMaskColumn;
    grdListI_LSM_QTY: TdxDBGridMaskColumn;
    grdListI_SALE_QTY: TdxDBGridMaskColumn;
    grdListI_TRADE_DISCOUNT: TdxDBGridMaskColumn;
    eEndDate: TdxDateEdit;
    Label2: TLabel;
    procedure bbtnExportClick(Sender: TObject);
    procedure bbtnStaticClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure prip_Static;
  protected
    procedure prop_IniData; override;
  public
    { Public declarations }
  end;

var
  frmSaleTradeUseStatic: TfrmSaleTradeUseStatic;

implementation

uses upubCommon, udmData;

{$R *.dfm}

{ TfrmSaleTradeUseStatic }

procedure TfrmSaleTradeUseStatic.prip_Static;
begin
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('usp_getSaleTradeUseStatic ''%s'', ''%s''',
      [FormatDateTime('YYYY-MM-DD', eStartDate.Date), FormatDateTime('YYYY-MM-DD', eEndDate.Date)]);
    Open;
    grdList.FullExpand;
  end;
end;

procedure TfrmSaleTradeUseStatic.prop_IniData;
begin
  eStartDate.Date := Date;    
  eEndDate.Date := Date;
  inherited;
end;

procedure TfrmSaleTradeUseStatic.bbtnExportClick(Sender: TObject);
var
  lc_SaveDlg: TSaveDialog;
begin
  inherited;
  if (not grdList.DataSource.DataSet.Active) or grdList.DataSource.DataSet.IsEmpty then
  begin              
    AppMsg('当前无数据, 无法导出', '销售汇总查询');
    Exit;
  end;
  if grdList.DataSource.DataSet.State <> dsBrowse then
  begin
    AppMsg('当前正在编辑数据,请保存后再导出', '销售汇总查询');
  end;
  lc_SaveDlg := TSaveDialog.Create(nil);
  try
    lc_SaveDlg.Filter := 'Excel表格文件 (*.xls)|*.XLS';
    if lc_SaveDlg.Execute then
    begin
      grdList.SaveToXLS(lc_SaveDlg.FileName, True);
    end;
  finally
    lc_SaveDlg.Free;
  end;
end;

procedure TfrmSaleTradeUseStatic.bbtnStaticClick(Sender: TObject);
begin
  inherited;
  prip_Static;
end;

procedure TfrmSaleTradeUseStatic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmSaleTradeUseStatic := nil;
end;

end.
