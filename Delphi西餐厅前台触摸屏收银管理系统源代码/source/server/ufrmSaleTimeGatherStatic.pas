unit ufrmSaleTimeGatherStatic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmStaticBase, StdCtrls, Buttons, ExtCtrls, dxCntner, dxEditor,
  dxExEdtr, dxEdLib, dxTL, dxDBCtrl, dxDBGrid, DB, ADODB, CSADOQuery;

type
  TfrmSaleTimeGatherStatic = class(TfrmStaticBase)
    Label3: TLabel;
    eDate: TdxDateEdit;
    bbtnStatic: TBitBtn;
    bbtnExport: TBitBtn;
    Panel3: TPanel;
    Viewq: TCSADOQuery;
    Viewd: TDataSource;
    grdList: TdxDBGrid;
    ViewqI_SALE_CD: TStringField;
    ViewqI_SALE_NAME: TStringField;
    ViewqI_HOUR1: TIntegerField;
    ViewqI_HOUR2: TIntegerField;
    ViewqI_HOUR3: TIntegerField;
    ViewqI_HOUR4: TIntegerField;
    ViewqI_HOUR5: TIntegerField;
    ViewqI_HOUR6: TIntegerField;
    ViewqI_HOUR7: TIntegerField;
    ViewqI_HOUR8: TIntegerField;
    ViewqI_HOUR9: TIntegerField;
    ViewqI_HOUR10: TIntegerField;
    ViewqI_HOUR11: TIntegerField;
    ViewqI_HOUR12: TIntegerField;
    ViewqI_HOUR13: TIntegerField;
    ViewqI_HOUR14: TIntegerField;
    ViewqI_HOUR15: TIntegerField;
    ViewqI_HOUR16: TIntegerField;
    ViewqI_HOUR17: TIntegerField;
    ViewqI_HOUR18: TIntegerField;
    ViewqI_HOUR19: TIntegerField;
    ViewqI_HOUR20: TIntegerField;
    ViewqI_HOUR21: TIntegerField;
    ViewqI_HOUR22: TIntegerField;
    ViewqI_HOUR23: TIntegerField;
    ViewqI_HOUR24: TIntegerField;
    grdListI_SALE_CD: TdxDBGridMaskColumn;
    grdListI_SALE_NAME: TdxDBGridMaskColumn;
    grdListI_HOUR1: TdxDBGridMaskColumn;
    grdListI_HOUR2: TdxDBGridMaskColumn;
    grdListI_HOUR3: TdxDBGridMaskColumn;
    grdListI_HOUR4: TdxDBGridMaskColumn;
    grdListI_HOUR5: TdxDBGridMaskColumn;
    grdListI_HOUR6: TdxDBGridMaskColumn;
    grdListI_HOUR7: TdxDBGridMaskColumn;
    grdListI_HOUR8: TdxDBGridMaskColumn;
    grdListI_HOUR9: TdxDBGridMaskColumn;
    grdListI_HOUR10: TdxDBGridMaskColumn;
    grdListI_HOUR11: TdxDBGridMaskColumn;
    grdListI_HOUR12: TdxDBGridMaskColumn;
    grdListI_HOUR13: TdxDBGridMaskColumn;
    grdListI_HOUR14: TdxDBGridMaskColumn;
    grdListI_HOUR15: TdxDBGridMaskColumn;
    grdListI_HOUR16: TdxDBGridMaskColumn;
    grdListI_HOUR17: TdxDBGridMaskColumn;
    grdListI_HOUR18: TdxDBGridMaskColumn;
    grdListI_HOUR19: TdxDBGridMaskColumn;
    grdListI_HOUR20: TdxDBGridMaskColumn;
    grdListI_HOUR21: TdxDBGridMaskColumn;
    grdListI_HOUR22: TdxDBGridMaskColumn;
    grdListI_HOUR23: TdxDBGridMaskColumn;
    grdListI_HOUR24: TdxDBGridMaskColumn;
    procedure bbtnStaticClick(Sender: TObject);
    procedure bbtnExportClick(Sender: TObject);
  private
    procedure prip_Static;
  protected
    procedure prop_IniData; override;
  public
    { Public declarations }
  end;

var
  frmSaleTimeGatherStatic: TfrmSaleTimeGatherStatic;

implementation
uses udmData, upubCommon;
{$R *.dfm}

{ TfrmSaleTimeGatherStatic }

procedure TfrmSaleTimeGatherStatic.prip_Static;
begin
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('usp_getSaleTimeGatherStatic ''%s''',
      [FormatDateTime('YYYY-MM-DD', eDate.Date)]);
    Open;
    grdList.FullExpand;
  end;
end;

procedure TfrmSaleTimeGatherStatic.prop_IniData;
begin
  inherited;
  eDate.Date := Date;
end;

procedure TfrmSaleTimeGatherStatic.bbtnStaticClick(Sender: TObject);
begin
  inherited;
  prip_Static;
end;

procedure TfrmSaleTimeGatherStatic.bbtnExportClick(Sender: TObject);
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

end.
