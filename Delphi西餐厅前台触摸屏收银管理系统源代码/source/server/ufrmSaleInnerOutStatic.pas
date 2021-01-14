unit ufrmSaleInnerOutStatic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmStaticBase, StdCtrls, Buttons, ExtCtrls, dxExEdtr, dxCntner,
  dxTL, dxDBCtrl, dxDBGrid, DB, ADODB, CSADOQuery, dxEditor, dxEdLib,
  dxDBTLCl, dxGrClms;

type
  TfrmSaleInnerOutStatic = class(TfrmStaticBase)
    Viewq: TCSADOQuery;
    Viewd: TDataSource;
    Panel3: TPanel;
    grdList: TdxDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    eStartDate: TdxDateEdit;
    eEndDate: TdxDateEdit;
    bbtnStatic: TBitBtn;
    bbtnExport: TBitBtn;
    ViewqI_TRADE_DATE: TStringField;
    ViewqI_SALE_CD: TStringField;
    ViewqI_SALE_NAME: TStringField;
    ViewqI_PRICE: TBCDField;
    ViewqI_COUNT: TIntegerField;
    ViewqI_INNER_COUNT: TIntegerField;
    ViewqI_INNER_AMOUNT: TBCDField;
    ViewqI_INNER_DISCOUNT: TFloatField;
    ViewqI_OUTSELF_COUNT: TIntegerField;
    ViewqI_OUTSELF_AMOUNT: TBCDField;
    ViewqI_OUTSELF_DISCOUNT: TFloatField;
    ViewqI_OUTSEND_COUNT: TIntegerField;
    ViewqI_OUTSEND_AMOUNT: TBCDField;
    ViewqI_OUTSEND_DISCOUNT: TFloatField;
    grdListI_TRADE_DATE: TdxDBGridMaskColumn;
    grdListI_SALE_CD: TdxDBGridMaskColumn;
    grdListI_SALE_NAME: TdxDBGridMaskColumn;
    grdListI_PRICE: TdxDBGridCurrencyColumn;
    grdListI_COUNT: TdxDBGridMaskColumn;
    grdListI_INNER_COUNT: TdxDBGridMaskColumn;
    grdListI_INNER_AMOUNT: TdxDBGridCurrencyColumn;
    grdListI_INNER_DISCOUNT: TdxDBGridMaskColumn;
    grdListI_OUTSELF_COUNT: TdxDBGridMaskColumn;
    grdListI_OUTSELF_AMOUNT: TdxDBGridCurrencyColumn;
    grdListI_OUTSELF_DISCOUNT: TdxDBGridMaskColumn;
    grdListI_OUTSEND_COUNT: TdxDBGridMaskColumn;
    grdListI_OUTSEND_AMOUNT: TdxDBGridCurrencyColumn;
    grdListI_OUTSEND_DISCOUNT: TdxDBGridMaskColumn;
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
  frmSaleInnerOutStatic: TfrmSaleInnerOutStatic;

implementation

uses udmData, upubCommon;

{$R *.dfm}

{ TfrmSaleInnerOutStatic }

procedure TfrmSaleInnerOutStatic.prip_Static;
begin
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('usp_getSaleInnerOutStatic ''%s'', ''%s''',
      [FormatDateTime('YYYY-MM-DD', eStartDate.Date), FormatDateTime('YYYY-MM-DD', eEndDate.Date)]);
    Open;
    grdList.FullExpand;
  end;
end;

procedure TfrmSaleInnerOutStatic.prop_IniData;
begin
  eStartDate.Date := Date;
  eEndDate.Date := Date;
  inherited;
end;

procedure TfrmSaleInnerOutStatic.bbtnExportClick(Sender: TObject);
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

procedure TfrmSaleInnerOutStatic.bbtnStaticClick(Sender: TObject);
begin
  inherited;
  prip_Static;
end;

procedure TfrmSaleInnerOutStatic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmSaleInnerOutStatic := nil;
end;

end.
