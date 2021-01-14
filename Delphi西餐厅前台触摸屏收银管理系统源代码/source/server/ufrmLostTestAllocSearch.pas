unit ufrmLostTestAllocSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmStaticBase, StdCtrls, Buttons, ExtCtrls, dxExEdtr, DB,
  ADODB, CSADOQuery, dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxEditor, dxEdLib;

type
  TfrmLostTestAllocSearch = class(TfrmStaticBase)
    Panel3: TPanel;
    grdList: TdxDBGrid;
    Viewq: TCSADOQuery;
    Viewd: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    eStartDate: TdxDateEdit;
    eEndDate: TdxDateEdit;
    bbtnStatic: TBitBtn;
    ViewqI_DATE: TStringField;
    ViewqI_SALE_CD: TStringField;
    ViewqI_SALE_NAME: TStringField;
    ViewqI_UNIT: TStringField;
    ViewqI_LOST_COUNT: TIntegerField;
    ViewqI_TEST_COUNT: TIntegerField;
    ViewqI_ALLOC_COUNT: TIntegerField;
    grdListI_DATE: TdxDBGridMaskColumn;
    grdListI_SALE_CD: TdxDBGridMaskColumn;
    grdListI_SALE_NAME: TdxDBGridMaskColumn;
    grdListI_UNIT: TdxDBGridMaskColumn;
    grdListI_LOST_COUNT: TdxDBGridMaskColumn;
    grdListI_TEST_COUNT: TdxDBGridMaskColumn;
    grdListI_ALLOC_COUNT: TdxDBGridMaskColumn;
    bbtnExport: TBitBtn;
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
  frmLostTestAllocSearch: TfrmLostTestAllocSearch;

implementation

uses udmData, ufrmBase;

{$R *.dfm}

{ TfrmLostTestAllocSearch }
 

procedure TfrmLostTestAllocSearch.prip_Static;
begin
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('usp_getLostTestAlloc ''%s'', ''%s''',
      [FormatDateTime('YYYY-MM-DD', eStartDate.Date), FormatDateTime('YYYY-MM-DD', eEndDate.Date)]);
    Open;
    grdList.FullExpand;
  end;
end;

procedure TfrmLostTestAllocSearch.prop_IniData;
begin
  eStartDate.Date := Date;
  eEndDate.Date := Date;
  inherited;
end;

procedure TfrmLostTestAllocSearch.bbtnStaticClick(Sender: TObject);
begin
  inherited;
  prip_Static;
end;

procedure TfrmLostTestAllocSearch.bbtnExportClick(Sender: TObject);
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

procedure TfrmLostTestAllocSearch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmLostTestAllocSearch := nil;
end;

end.
