unit ufrmActRecordSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmStaticBase, dxExEdtr, dxCntner, dxEditor, dxEdLib, StdCtrls,
  DB, ADODB, CSADOQuery, dxTL, dxDBCtrl, dxDBGrid, Buttons, ExtCtrls;

type
  TfrmActRecordSearch = class(TfrmStaticBase)
    Panel3: TPanel;
    grdList: TdxDBGrid;
    Viewq: TCSADOQuery;
    Viewd: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    eStartDate: TdxDateEdit;
    eEndDate: TdxDateEdit;
    bbtnStatic: TBitBtn;
    bbtnExport: TBitBtn;
    Viewqmenu_caption: TStringField;
    Viewqi_emp_cd: TStringField;
    Viewqi_date: TStringField;
    Viewqi_time: TStringField;
    grdListmenu_caption: TdxDBGridMaskColumn;
    grdListi_emp_cd: TdxDBGridMaskColumn;
    grdListi_date: TdxDBGridMaskColumn;
    grdListi_time: TdxDBGridMaskColumn;
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
  frmActRecordSearch: TfrmActRecordSearch;

implementation

uses udmData, ufrmBase;

{$R *.dfm}

{ TfrmActRecordSearch }

procedure TfrmActRecordSearch.prip_Static;
begin
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT * FROM T_ACT_RECORD_MS WHERE I_DATE >= ''%s'' AND I_DATE <= ''%s''',
      [FormatDateTime('YYYY-MM-DD', eStartDate.Date), FormatDateTime('YYYY-MM-DD', eEndDate.Date)]);
    Open;
    grdList.FullExpand;
  end;
end;

procedure TfrmActRecordSearch.prop_IniData;
begin    
  eStartDate.Date := Date;
  eEndDate.Date := Date;
  inherited;
end;

procedure TfrmActRecordSearch.bbtnExportClick(Sender: TObject);
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

procedure TfrmActRecordSearch.bbtnStaticClick(Sender: TObject);
begin
  inherited;
  prip_Static;
end;

procedure TfrmActRecordSearch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmActRecordSearch := nil;
end;

end.
