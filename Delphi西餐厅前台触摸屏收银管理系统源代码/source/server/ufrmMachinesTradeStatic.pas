unit ufrmMachinesTradeStatic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmStaticBase, StdCtrls, Buttons, ExtCtrls, dxExEdtr, dxCntner,
  dxEditor, dxEdLib, dxTL, dxDBCtrl, dxDBGrid, DB, ADODB, CSADOQuery,
  dxDBTLCl, dxGrClms;

type
  TfrmMachinesTradeStatic = class(TfrmStaticBase)
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
    ViewqI_AMOUNT1: TBCDField;
    ViewqI_AMOUNT2: TBCDField;
    ViewqI_AMOUNT3: TBCDField;
    ViewqI_AMOUNT4: TBCDField;
    ViewqI_AMOUNT5: TBCDField;
    ViewqI_COUNT: TIntegerField;
    ViewqI_AVG: TBCDField;
    grdListI_TRADE_DATE: TdxDBGridMaskColumn;
    grdListI_MACHINES_CD: TdxDBGridMaskColumn;
    grdListI_AMOUNT1: TdxDBGridCurrencyColumn;
    grdListI_AMOUNT2: TdxDBGridCurrencyColumn;
    grdListI_AMOUNT3: TdxDBGridCurrencyColumn;
    grdListI_AMOUNT4: TdxDBGridCurrencyColumn;
    grdListI_AMOUNT5: TdxDBGridCurrencyColumn;
    grdListI_COUNT: TdxDBGridMaskColumn;
    grdListI_AVG: TdxDBGridCurrencyColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnExportClick(Sender: TObject);
    procedure bbtnStaticClick(Sender: TObject);
  private
    procedure prip_Static;
  protected
    procedure prop_IniData; override;
  public
  public
    { Public declarations }
  end;

var
  frmMachinesTradeStatic: TfrmMachinesTradeStatic;

implementation

uses udmData, upubCommon;

{$R *.dfm}

{ TfrmMachinesTradeStatic }

procedure TfrmMachinesTradeStatic.prip_Static;
begin
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('usp_getMachinesTradeStatic ''%s'', ''%s''',
      [FormatDateTime('YYYY-MM-DD', eStartDate.Date), FormatDateTime('YYYY-MM-DD', eEndDate.Date)]);
    Open;
    grdList.FullExpand;
  end;
end;

procedure TfrmMachinesTradeStatic.prop_IniData;
begin
  eStartDate.Date := Date;
  eEndDate.Date := Date;
  inherited;
end;

procedure TfrmMachinesTradeStatic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmMachinesTradeStatic := nil;
end;

procedure TfrmMachinesTradeStatic.bbtnExportClick(Sender: TObject);
var
  lc_SaveDlg: TSaveDialog;
begin
  inherited;
  if (not grdList.DataSource.DataSet.Active) or grdList.DataSource.DataSet.IsEmpty then
  begin
    AppMsg('当前无数据, 无法导出', '收银机销售日报表');
    Exit;
  end;
  if grdList.DataSource.DataSet.State <> dsBrowse then
  begin
    AppMsg('当前正在编辑数据,请保存后再导出', '收银机销售日报表');
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

procedure TfrmMachinesTradeStatic.bbtnStaticClick(Sender: TObject);
begin
  inherited;
  prip_Static;
end;

end.
