unit ufrmTradeDetailStatic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmStaticBase, dxExEdtr, StdCtrls, dxCntner, dxEditor, dxEdLib,
  dxTL, dxDBCtrl, dxDBGrid, DB, ADODB, CSADOQuery, Buttons, ExtCtrls,
  dxDBTLCl, dxGrClms;

type
  TfrmTradeDetailStatic = class(TfrmStaticBase)
    Viewq: TCSADOQuery;
    Viewd: TDataSource;
    Panel3: TPanel;
    grdList: TdxDBGrid;
    eTradeCD: TdxEdit;
    Label2: TLabel;
    Label1: TLabel;
    bbtnStatic: TBitBtn;
    bbtnExport: TBitBtn;
    ViewqI_MACHINES_CD: TStringField;
    ViewqI_TRADE_TIME: TStringField;
    ViewqI_EMP_CD: TStringField;
    ViewqI_EMP_NAME: TStringField;
    ViewqI_SALE_CD: TStringField;
    ViewqI_SALE_NAME: TStringField;
    ViewqI_PRICE: TBCDField;
    ViewqI_QTY: TIntegerField;
    ViewqI_AMOUNT: TBCDField;
    grdListI_MACHINES_CD: TdxDBGridMaskColumn;
    grdListI_TRADE_TIME: TdxDBGridMaskColumn;
    grdListI_EMP_CD: TdxDBGridMaskColumn;
    grdListI_EMP_NAME: TdxDBGridMaskColumn;
    grdListI_SALE_CD: TdxDBGridMaskColumn;
    grdListI_SALE_NAME: TdxDBGridMaskColumn;
    grdListI_PRICE: TdxDBGridCurrencyColumn;
    grdListI_QTY: TdxDBGridMaskColumn;
    grdListI_AMOUNT: TdxDBGridCurrencyColumn;
    procedure bbtnStaticClick(Sender: TObject);
    procedure bbtnExportClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure prip_Static;
  protected    
    procedure prop_IniData; override;
  public
    { Public declarations }
  end;

var
  frmTradeDetailStatic: TfrmTradeDetailStatic;

implementation

uses udmData, upubCommon;

{$R *.dfm}

{ TfrmTradeDetailStatic }

procedure TfrmTradeDetailStatic.prip_Static;
begin
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('usp_getTradeDetailStatic ''%s''',
      [eTradeCD.Text]);
    Open;
    grdList.FullExpand;
  end;
end;

procedure TfrmTradeDetailStatic.bbtnStaticClick(Sender: TObject);
begin
  inherited;
  if Length(Trim(eTradeCD.Text)) = 0 then
  begin
    AppMsg('账单号不能为空！', '单笔交易查询');
    Exit;
  end;
  prip_Static;
end;

procedure TfrmTradeDetailStatic.bbtnExportClick(Sender: TObject);
var
  lc_SaveDlg: TSaveDialog;
begin
  inherited;
  if (not grdList.DataSource.DataSet.Active) or grdList.DataSource.DataSet.IsEmpty then
  begin              
    AppMsg('当前无数据, 无法导出', '单笔交易查询');
    Exit;
  end;
  if grdList.DataSource.DataSet.State <> dsBrowse then
  begin
    AppMsg('当前正在编辑数据,请保存后再导出', '单笔交易查询');
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

procedure TfrmTradeDetailStatic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmTradeDetailStatic := nil;
end;

procedure TfrmTradeDetailStatic.prop_IniData;
begin
  inherited;

end;

end.
