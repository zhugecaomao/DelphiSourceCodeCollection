unit ufrmTradeGatherStatic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmStaticBase, dxExEdtr, dxCntner, dxEditor, dxEdLib, StdCtrls,
  dxTL, dxDBCtrl, dxDBGrid, DB, ADODB, CSADOQuery, Buttons, ExtCtrls,
  dxDBTLCl, dxGrClms;

type
  TfrmTradeGatherStatic = class(TfrmStaticBase)
    Panel3: TPanel;
    Viewq: TCSADOQuery;
    Viewd: TDataSource;
    grdList: TdxDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    eStartDate: TdxDateEdit;
    eEndDate: TdxDateEdit;
    bbtnStatic: TBitBtn;
    bbtnExport: TBitBtn;
    ViewqI_TRADE_DATE: TStringField;
    ViewqI_MACHINES_CD: TStringField;
    ViewqI_WORK_CD: TStringField;
    ViewqI_EMP_CD: TStringField;
    ViewqI_EMP_NAME: TStringField;
    ViewqI_REAL_AMOUNT: TBCDField;
    ViewqI_CASH_AMOUNT: TBCDField;
    ViewqI_TC: TIntegerField;
    ViewqI_AC: TFloatField;
    ViewqI_DISCOUNT: TFloatField;
    grdListI_TRADE_DATE: TdxDBGridMaskColumn;
    grdListI_MACHINES_CD: TdxDBGridMaskColumn;
    grdListI_WORK_CD: TdxDBGridMaskColumn;
    grdListI_EMP_CD: TdxDBGridMaskColumn;
    grdListI_EMP_NAME: TdxDBGridMaskColumn;
    grdListI_REAL_AMOUNT: TdxDBGridCurrencyColumn;
    grdListI_CASH_AMOUNT: TdxDBGridCurrencyColumn;
    grdListI_TC: TdxDBGridMaskColumn;
    grdListI_AC: TdxDBGridMaskColumn;
    grdListI_DISCOUNT: TdxDBGridMaskColumn;
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
  frmTradeGatherStatic: TfrmTradeGatherStatic;

implementation

uses udmData, upubCommon;

{$R *.dfm}

{ TfrmTradeGatherStatic }

procedure TfrmTradeGatherStatic.prip_Static;
begin
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('usp_getTradeGatherStatic ''%s'', ''%s''',
      [FormatDateTime('YYYY-MM-DD', eStartDate.Date), FormatDateTime('YYYY-MM-DD', eEndDate.Date)]);
    Open;
    grdList.FullExpand;
  end;
end;

procedure TfrmTradeGatherStatic.prop_IniData;
begin
  eStartDate.Date := Date;
  eEndDate.Date := Date;
  inherited;
end;

procedure TfrmTradeGatherStatic.bbtnExportClick(Sender: TObject);
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

procedure TfrmTradeGatherStatic.bbtnStaticClick(Sender: TObject);
begin
  inherited;
  prip_Static;
end;

procedure TfrmTradeGatherStatic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmTradeGatherStatic := nil;
end;

end.
