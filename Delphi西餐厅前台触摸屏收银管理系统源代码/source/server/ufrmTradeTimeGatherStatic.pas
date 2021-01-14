unit ufrmTradeTimeGatherStatic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmStaticBase, StdCtrls, Buttons, ExtCtrls, dxExEdtr, dxCntner,
  dxTL, dxDBCtrl, dxDBGrid, dxmdaset, DB, ADODB, CSADOQuery, dxEditor,
  dxEdLib, dxDBTLCl, dxGrClms;

type
  TfrmTradeTimeGatherStatic = class(TfrmStaticBase)
    Panel3: TPanel;
    Viewq: TCSADOQuery;
    Viewd: TDataSource;
    memView: TdxMemData;
    grdList: TdxDBGrid;
    eStartTime: TdxTimeEdit;
    Label1: TLabel;
    Label2: TLabel;
    eEndTime: TdxTimeEdit;
    bbtnStatic: TBitBtn;
    bbtnExport: TBitBtn;
    memViewI_TIME: TStringField;
    memViewI_AMOUNT: TCurrencyField;
    memViewI_TC: TIntegerField;
    memViewI_AC: TFloatField;
    memViewI_COUNT_AMOUNT: TCurrencyField;
    grdListRecId: TdxDBGridColumn;
    grdListI_TIME: TdxDBGridMaskColumn;
    grdListI_AMOUNT: TdxDBGridCurrencyColumn;
    grdListI_TC: TdxDBGridMaskColumn;
    grdListI_AC: TdxDBGridMaskColumn;
    grdListI_COUNT_AMOUNT: TdxDBGridCurrencyColumn;
    ViewqI_AMOUNT: TCurrencyField;
    ViewqI_TC: TIntegerField;
    ViewqI_AC: TFloatField;
    eDate: TdxDateEdit;
    Label3: TLabel;
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
  frmTradeTimeGatherStatic: TfrmTradeTimeGatherStatic;

implementation
uses udmData, DateUtils, upubCommon, StrUtils;
{$R *.dfm}

{ TfrmTradeTimeGatherStatic }

procedure TfrmTradeTimeGatherStatic.prip_Static;
var
  ls_Time, ls_EndTime, ls_Date: String;
  lf_CountAmount: Currency;
begin
  if memView.Active then memView.Close;
  lf_CountAmount := 0.0;
  ls_Date := FormatDateTime('YYYY-MM-DD', eDate.Date);
  with Viewq do
  begin 
    ls_Time := FormatDateTime('HH:00:00', eStartTime.Time);
    repeat
      if Active then Close;
      Connection := dmData.adocon;
      ls_EndTime := FormatDateTime('HH:00:00', IncHour(StrToTime(ls_Time), 1));
      SQL.Text := Format('SELECT SUM(I_TRADE_MONEY) AS I_AMOUNT, COUNT(I_TRADE_CD) AS I_TC, ' +
        'ROUND(SUM(I_TRADE_MONEY)/COUNT(I_TRADE_CD), 0) AS I_AC FROM T_TRADE_MS WHERE I_TRADE_TIME ' +
        ' >= ''%s'' AND I_TRADE_TIME <= ''%s'' AND I_TRADE_DATE = ''%s''', [ls_Time, ls_EndTime,
        ls_Date]);
      //SQL.SaveToFile('SQL.sql');
      Open;
      if not memView.Active then memView.Open;
      if not IsEmpty then
      begin
        First;
        memView.DisableControls;
        while not Eof do
        begin
          lf_CountAmount := lf_CountAmount + FieldByName('I_AMOUNT').AsCurrency;
          memView.Append;
          memView.FieldValues['I_TIME'] := LeftStr(ls_Time, 5) + '-' + LeftStr(ls_EndTime, 5);
          memView.FieldValues['I_AMOUNT'] := FieldValues['I_AMOUNT'];   
          memView.FieldValues['I_TC'] := FieldValues['I_TC'];
          memView.FieldValues['I_AC'] := FieldValues['I_AC'];   
          memView.FieldValues['I_COUNT_AMOUNT'] := lf_CountAmount;
          memView.Post;
          Next;
        end;
        memView.EnableControls;
      end;
      //Break;
      ls_Time := ls_EndTime;
    until ls_EndTime = FormatDateTime('HH:00:00', eEndTime.Time);
  end;
end;

procedure TfrmTradeTimeGatherStatic.prop_IniData;
begin
  inherited;
  eDate.Date := Date;
  eStartTime.Time := IncHour(Time, -8);
  eEndTime.Time := Time;
end;

procedure TfrmTradeTimeGatherStatic.bbtnStaticClick(Sender: TObject);
begin
  inherited;
  prip_Static;
end;

procedure TfrmTradeTimeGatherStatic.bbtnExportClick(Sender: TObject);
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

procedure TfrmTradeTimeGatherStatic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmTradeTimeGatherStatic := nil;
end;

end.
