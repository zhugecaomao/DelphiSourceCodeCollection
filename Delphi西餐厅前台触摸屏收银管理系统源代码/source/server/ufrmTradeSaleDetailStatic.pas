unit ufrmTradeSaleDetailStatic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmStaticBase, StdCtrls, Buttons, ExtCtrls, dxExEdtr, dxCntner,
  dxTL, dxDBCtrl, dxDBGrid, DB, ADODB, CSADOQuery, dxEditor, dxEdLib,
  dxDBTLCl, dxGrClms;

type
  TfrmTradeSaleDetailStatic = class(TfrmStaticBase)
    Panel3: TPanel;
    Viewq: TCSADOQuery;
    Viewd: TDataSource;
    grdList: TdxDBGrid;
    eDate: TdxDateEdit;
    Label1: TLabel;
    bbtnStatic: TBitBtn;
    bbtnExport: TBitBtn;
    Label6: TLabel;
    eSale: TdxPickEdit;
    ViewqI_MACHINES_CD: TStringField;
    ViewqI_EMP_CD: TStringField;
    ViewqI_EMP_NAME: TStringField;
    ViewqI_SALE_CD: TStringField;
    ViewqI_SALE_NAME: TStringField;
    ViewqI_PRICE: TBCDField;
    ViewqI_QTY: TIntegerField;
    ViewqI_AMOUNT: TBCDField;
    grdListI_MACHINES_CD: TdxDBGridMaskColumn;
    grdListI_EMP_CD: TdxDBGridMaskColumn;
    grdListI_EMP_NAME: TdxDBGridMaskColumn;
    grdListI_SALE_CD: TdxDBGridMaskColumn;
    grdListI_SALE_NAME: TdxDBGridMaskColumn;
    grdListI_PRICE: TdxDBGridCurrencyColumn;
    grdListI_QTY: TdxDBGridMaskColumn;
    grdListI_AMOUNT: TdxDBGridCurrencyColumn;
    procedure bbtnStaticClick(Sender: TObject);
    procedure eSaleKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnExportClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private               
    procedure prip_GetSaleInfo;
    procedure prip_Static;
  protected
    procedure prop_IniData; override;
  public
    { Public declarations }
  end;

var
  frmTradeSaleDetailStatic: TfrmTradeSaleDetailStatic;

implementation

uses udmData, StrUtils, upubCommon;

{$R *.dfm}

{ TfrmTradeSaleDetailStatic }

procedure TfrmTradeSaleDetailStatic.prip_GetSaleInfo;
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT I_SALE_CD, I_SALE_NAME, I_UNIT FROM T_SALE_MS';
    Open;
    if not IsEmpty then
    begin
      First;
      eSale.Items.Clear;
      while not Eof do
      begin
        eSale.Items.Add(FieldByName('I_SALE_CD').AsString + '-' +
          FieldByName('I_SALE_NAME').AsString);
        Next;
      end;
      eSale.Text := eSale.Items.Strings[0];
    end;
  end;
end;

procedure TfrmTradeSaleDetailStatic.prip_Static;
var
  ls_SaleCD: String;
  li_Index: Integer;
begin 
  li_Index := Pos('-', eSale.Text);
  ls_SaleCD := LeftStr(eSale.Text, li_Index - 1);
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('usp_getTradeSaleDetailStatic ''%s'', ''%s''',
      [FormatDateTime('YYYY-MM-DD', eDate.Date), ls_SaleCD]);
    Open;
    grdList.FullExpand;
  end;

end;

procedure TfrmTradeSaleDetailStatic.prop_IniData;
begin
  inherited;
  prip_GetSaleInfo; 
  eDate.Date := Date;
end;

procedure TfrmTradeSaleDetailStatic.bbtnStaticClick(Sender: TObject);
begin
  inherited;
  prip_Static;
end;

procedure TfrmTradeSaleDetailStatic.eSaleKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := #0;
end;

procedure TfrmTradeSaleDetailStatic.bbtnExportClick(Sender: TObject);
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

procedure TfrmTradeSaleDetailStatic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmTradeSaleDetailStatic := nil;
end;

end.
