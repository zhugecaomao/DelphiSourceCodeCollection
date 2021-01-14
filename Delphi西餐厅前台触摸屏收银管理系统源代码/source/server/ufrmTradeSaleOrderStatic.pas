unit ufrmTradeSaleOrderStatic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmStaticBase, StdCtrls, Buttons, ExtCtrls, dxExEdtr, dxCntner,
  dxEditor, dxEdLib, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, DB,
  ADODB, CSADOQuery;

type
  TfrmTradeSaleOrderStatic = class(TfrmStaticBase)
    Panel3: TPanel;
    grdList: TdxDBGrid;
    Viewq: TCSADOQuery;
    Viewd: TDataSource;
    ViewqI_TRADE_DATE: TStringField;
    ViewqI_SALE_CD: TStringField;
    ViewqI_SALE_NAME: TStringField;
    ViewqI_PRICE: TBCDField;
    ViewqI_QTY: TIntegerField;
    ViewqI_AMOUNT: TBCDField;
    ViewqI_TOTAL_AMOUNT: TBCDField;
    ViewqI_DISCOUNT: TFloatField;
    grdListI_TRADE_DATE: TdxDBGridMaskColumn;
    grdListI_SALE_CD: TdxDBGridMaskColumn;
    grdListI_SALE_NAME: TdxDBGridMaskColumn;
    grdListI_PRICE: TdxDBGridCurrencyColumn;
    grdListI_QTY: TdxDBGridMaskColumn;
    grdListI_AMOUNT: TdxDBGridCurrencyColumn;
    grdListI_TOTAL_AMOUNT: TdxDBGridCurrencyColumn;
    grdListI_DISCOUNT: TdxDBGridMaskColumn;
    Label1: TLabel;
    Label2: TLabel;
    eStartDate: TdxDateEdit;
    eEndDate: TdxDateEdit;
    bbtnStatic: TBitBtn;
    bbtnExport: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnExportClick(Sender: TObject);
    procedure bbtnStaticClick(Sender: TObject);
  private
    procedure prip_Static;
  protected
    procedure prop_IniData; override;
  public
    { Public declarations }
  end;

var
  frmTradeSaleOrderStatic: TfrmTradeSaleOrderStatic;

implementation

uses udmData, ufrmBase;

{$R *.dfm}

{ TfrmTradeSaleOrderStatic }

procedure TfrmTradeSaleOrderStatic.prip_Static;
begin
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('usp_getTradeSaleOrderStatic ''%s'', ''%s''',
      [FormatDateTime('YYYY-MM-DD', eStartDate.Date), FormatDateTime('YYYY-MM-DD', eEndDate.Date)]);
    Open;
    grdList.FullExpand;
  end;
end;

procedure TfrmTradeSaleOrderStatic.prop_IniData;
begin      
  eStartDate.Date := Date;
  eEndDate.Date := Date;
  inherited;
end;

procedure TfrmTradeSaleOrderStatic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmTradeSaleOrderStatic := nil;
end;

procedure TfrmTradeSaleOrderStatic.bbtnExportClick(Sender: TObject);
var
  lc_SaveDlg: TSaveDialog;
begin
  inherited;
  if (not grdList.DataSource.DataSet.Active) or grdList.DataSource.DataSet.IsEmpty then
  begin
    DispInfo('当前无数据, 无法导出');
    Exit;
  end;
  if grdList.DataSource.DataSet.State <> dsBrowse then
  begin
    DispInfo('当前正在编辑数据,请保存后再导出');
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

procedure TfrmTradeSaleOrderStatic.bbtnStaticClick(Sender: TObject);
begin
  inherited;
  prip_Static;
end;

end.
