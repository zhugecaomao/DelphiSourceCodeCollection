unit ufrmInOutOriginalSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmStaticBase, StdCtrls, Buttons, ExtCtrls, dxExEdtr, dxCntner,
  dxTL, dxDBCtrl, dxDBGrid, dxEditor, dxEdLib, DB, ADODB, CSADOQuery;

type
  TfrmInOutOriginalSearch = class(TfrmStaticBase)
    Label1: TLabel;
    Label2: TLabel;
    eStartDate: TdxDateEdit;
    eEndDate: TdxDateEdit;
    bbtnStatic: TBitBtn;
    bbtnExport: TBitBtn;
    Panel3: TPanel;
    grdList: TdxDBGrid;
    Viewq: TCSADOQuery;
    Viewd: TDataSource;
    ViewqI_NO: TStringField;
    ViewqI_ORIGINAL_CD: TStringField;
    ViewqI_PROPERTY_CODE: TStringField;
    ViewqI_ORIGINAL_NAME: TStringField;
    ViewqI_UNIT: TStringField;
    ViewqI_QTY1: TIntegerField;
    ViewqI_QTY2: TIntegerField;
    ViewqI_QTY3: TIntegerField;
    ViewqI_COUNT: TIntegerField;
    ViewqI_DATE: TStringField;
    ViewqI_FLAG: TIntegerField;
    ViewqI_LOGINCD: TStringField;
    ViewqI_FACTORY_CD: TStringField;
    grdListI_NO: TdxDBGridMaskColumn;
    grdListI_ORIGINAL_CD: TdxDBGridMaskColumn;
    grdListI_PROPERTY_CODE: TdxDBGridMaskColumn;
    grdListI_ORIGINAL_NAME: TdxDBGridMaskColumn;
    grdListI_UNIT: TdxDBGridMaskColumn;
    grdListI_QTY1: TdxDBGridMaskColumn;
    grdListI_QTY2: TdxDBGridMaskColumn;
    grdListI_QTY3: TdxDBGridMaskColumn;
    grdListI_COUNT: TdxDBGridMaskColumn;
    grdListI_DATE: TdxDBGridMaskColumn;
    grdListI_FLAG: TdxDBGridMaskColumn;
    grdListI_LOGINCD: TdxDBGridMaskColumn;
    grdListI_FACTORY_CD: TdxDBGridMaskColumn;
    procedure bbtnExportClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnStaticClick(Sender: TObject);
  private
    procedure prip_Static;
  protected
    procedure prop_IniData; override;
  public
    { Public declarations }
  end;

var
  frmInOutOriginalSearch: TfrmInOutOriginalSearch;

implementation

uses udmData, ufrmBase;

{$R *.dfm}

{ TfrmInOutOriginalSearch }

procedure TfrmInOutOriginalSearch.prip_Static;
begin
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT * FROM T_INOUT_ORIGINAL_MS WHERE I_DATE >= ''%s'' AND I_DATE <= ''%s''',
      [FormatDateTime('YYYY-MM-DD', eStartDate.Date), FormatDateTime('YYYY-MM-DD', eEndDate.Date)]);
    Open;
    grdList.FullExpand;
  end;
end;

procedure TfrmInOutOriginalSearch.prop_IniData;
begin
  eStartDate.Date := Date;
  eEndDate.Date := Date;
  inherited;
end;

procedure TfrmInOutOriginalSearch.bbtnExportClick(Sender: TObject);
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

procedure TfrmInOutOriginalSearch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmInOutOriginalSearch := nil;
end;

procedure TfrmInOutOriginalSearch.bbtnStaticClick(Sender: TObject);
begin
  inherited;
  prip_Static;
end;

end.
