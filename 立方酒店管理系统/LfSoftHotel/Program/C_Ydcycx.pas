unit C_Ydcycx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Browse, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, C_Define, ComCtrls;

type
  TYdcycxForm = class(TBrowseForm)
    qryMasterD_YDBH: TStringField;
    qryMasterD_CTBH: TStringField;
    qryMasterD_CTMC: TStringField;
    qryMasterD_KRBH: TStringField;
    qryMasterD_KRXM: TStringField;
    qryMasterD_YDRQ: TDateTimeField;
    qryMasterD_SYRQ: TDateTimeField;
    qryMasterD_SYSJ: TDateTimeField;
    qryMasterD_SJDM: TStringField;
    qryMasterD_YCBZ: TStringField;
    qryMasterD_YCLX: TIntegerField;
    qryMasterD_RS: TIntegerField;
    qryMasterD_DJ: TFloatField;
    qryMasterD_XFSL: TFloatField;
    qryMasterD_XFJE: TFloatField;
    qryMasterD_YDBZ: TStringField;
    qryMasterD_RZBZ: TStringField;
    qryMasterD_KTBZ: TStringField;
    qryMasterD_JSBZ: TStringField;
    qryMasterD_BZ: TBlobField;
    qryMasterD_CZYXM: TStringField;
    qryDetailD_YDBH: TStringField;
    qryDetailD_CTBH: TStringField;
    qryDetailD_CTMC: TStringField;
    qryDetailD_KRBH: TStringField;
    qryDetailD_KRXM: TStringField;
    qryDetailD_YDRQ: TDateTimeField;
    qryDetailD_SYRQ: TDateTimeField;
    qryDetailD_SYSJ: TDateTimeField;
    qryDetailD_SJDM: TStringField;
    qryDetailD_YCBZ: TStringField;
    qryDetailD_YCLX: TIntegerField;
    qryDetailD_RS: TIntegerField;
    qryDetailD_DJ: TFloatField;
    qryDetailD_XFSL: TFloatField;
    qryDetailD_XFJE: TFloatField;
    qryDetailD_YDBZ: TStringField;
    qryDetailD_RZBZ: TStringField;
    qryDetailD_KTBZ: TStringField;
    qryDetailD_JSBZ: TStringField;
    qryDetailD_BZ: TBlobField;
    qryDetailD_CZYXM: TStringField;
    btnPrint: TBitBtn;
    dtpDate: TDateTimePicker;
    btnQuery: TBitBtn;
    btnAll: TBitBtn;
    btnYdxg: TBitBtn;
    qryMasterD_CTMCS: TStringField;
    tblYdxx: TTable;
    qryMasterD_LXDH: TStringField;
    qryMasterD_LXR: TStringField;
    qryMasterD_DWMC: TStringField;
    btnQx: TBitBtn;
    qryMasterD_BZNR: TStringField;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    BitBtn1: TBitBtn;
    procedure qryMasterD_RZBZGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure dbgMasterDblClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure btnAllClick(Sender: TObject);
    procedure dbgMasterTitleClick(Column: TColumn);
    procedure dbgMasterDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure qryMasterCalcFields(DataSet: TDataSet);
    procedure btnQxClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    FSjdm : string;
    function SumXfje: Currency;
  public
    { Public declarations }
  end;

var
  YdcycxForm: TYdcycxForm;

procedure Ydcycx;

implementation

uses C_Ydcysk, C_Ydcytd, C_HotelData;

{$R *.dfm}
procedure Ydcycx;
begin
  YdcycxForm := TYdcycxForm.Create(Application);
  try
    with YdcycxForm do
    begin
      FSjdm := '全部';
      dtpDate.Date := Date;
      //qryMaster.ParamByName('D').AsDate := Date;
      qryMaster.Filter := 'D_SYRQ>='''+FormatDateTime('yyyy-mm-dd',Date)+'''';
      qryMaster.Filtered := True;
      qryMaster.Open;
      qryDetail.Open;
      ShowModal;
    end;
  finally
    YdcycxForm.qryMaster.Close;
    YdcycxForm.qryDetail.Close;
    YdcycxForm.Free;
  end;
end;

procedure TYdcycxForm.qryMasterD_RZBZGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
  begin
    if Sender.AsBoolean then Text := '已确认'
    else Text := '';
  end;
end;

function TYdcycxForm.SumXfje: Currency;
var
  aXfje : Currency;
begin
  aXfje := 0;
  qryMaster.DisableControls;
  try
    qryMaster.First;
    while not qryMaster.Eof do
    begin
      aXfje := aXfje + qryMasterD_XFJE.Value;
      qryMaster.Next;
    end;
    qryMaster.First;
  finally
    qryMaster.EnableControls;
  end;
  Result := aXfje;
end;

procedure TYdcycxForm.dbgMasterDblClick(Sender: TObject);
var
  aYdbh : string;
begin
  inherited;
  if qryMaster.IsEmpty then Exit;
  aYdbh := qryMasterD_YDBH.Value;
  if qryMasterD_YDBZ.Value = YDCY_SK then
    YdcyskEdit(qryMasterD_KRBH.Value,qryMasterD_YDBH.Value)
  else
    YdcytdEdit(qryMasterD_KRBH.Value,qryMasterD_YDBH.Value);
  qryMaster.Close;
  qryMaster.Open;
  qryMaster.Locate('D_YDBH',aYdbh,[]);
  //qryMaster.Refresh;
end;

procedure TYdcycxForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '预定餐饮情况一览表';
  APrintStru.ADataSet := qryMaster;
  PrintLb(APrintStru,dbgMaster);
end;

procedure TYdcycxForm.btnQueryClick(Sender: TObject);
begin
  inherited;
  if FSjdm = '全部' then
    qryMaster.Filter := 'D_SYRQ='''+FormatDateTime('yyyy-mm-dd',dtpDate.Date)+''''
  else
    qryMaster.Filter := 'D_SYRQ='''+FormatDateTime('yyyy-mm-dd',dtpDate.Date)+''' and D_SJDM='''+FSjdm+'''';
  qryMaster.Filtered := True;
end;

procedure TYdcycxForm.btnAllClick(Sender: TObject);
begin
  inherited;
  if FSjdm = '全部' then
  begin
      qryMaster.Filter := 'D_SYRQ>='''+FormatDateTime('yyyy-mm-dd',Date)+'''';
      qryMaster.Filtered := True;
  end
  else
  begin
    qryMaster.Filter := 'D_SYRQ>='''+FormatDateTime('yyyy-mm-dd',Date)+''' and D_SJDM='''+FSjdm+'''';
    qryMaster.Filtered := True;
  end;
end;

procedure TYdcycxForm.dbgMasterTitleClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'D_SYRQ' then
  begin
    with qryMaster do
    begin
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('select * from YDCY where ((D_CTBH="0")and(D_YDBZ="P"))or((D_CTBH<>"0")and(D_YDBZ="T")) order by D_SYRQ,D_SYSJ');
      Open;
      EnableControls;
    end;
  end;
  if Column.FieldName = 'D_KRXM' then
  begin
    with qryMaster do
    begin
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('select * from YDCY where ((D_CTBH="0")and(D_YDBZ="P"))or((D_CTBH<>"0")and(D_YDBZ="T")) order by D_KRXM,D_SYRQ');
      Open;
      EnableControls;
    end;
  end;
  if Column.FieldName = 'D_SJDM' then
  begin
    with qryMaster do
    begin
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('select * from YDCY where ((D_CTBH="0")and(D_YDBZ="P"))or((D_CTBH<>"0")and(D_YDBZ="T")) order by D_SYRQ,D_SJDM');
      Open;
      EnableControls;
    end;
  end;

end;


procedure TYdcycxForm.dbgMasterDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if qryMasterD_RZBZ.Value  = 'T' then
    dbgMaster.Canvas.Font.Color := clRed;
  dbgMaster.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TYdcycxForm.qryMasterCalcFields(DataSet: TDataSet);
var
  s : string;
begin
  inherited;
  qryMasterD_CTMCS.Value := '';
  //if qryMasterD_YDBZ.Value = YDCY_TD then Exit;
  with HotelData.qryUserData do
  begin
    Close;
    SQL.Clear;
    s := 'select * from YDCY where (D_YDBH="'+qryMasterD_YDBH.Value+'")and(D_CTBH<>"0")';
    SQL.Add(s);
    Open;
    First;
    s := '';
    while not Eof do
    begin
      s := s+FieldByName('D_CTMC').AsString+' ';
      Next;
    end;
    if qryMasterD_YDBZ.Value <> YDCY_TD then
      qryMasterD_CTMCS.Value := s;
  end;
  qryMasterD_BZNR.Value := qryMasterD_BZ.Value;
end;

procedure TYdcycxForm.btnQxClick(Sender: TObject);
var
  s : string;
begin
  inherited;
  if qryMasterD_RZBZ.Value = 'T' then
  begin
    ShowMessage('该预定已经确任，你不能取消！');
    Exit;
  end;
  if not Confirm('你确认取消该预定吗？') then Exit;
  if qryMasterD_YDBZ.Value = 'P' then
    s := 'delete from YDCY where (D_YDBH="'+qryMasterD_YDBH.Value +'")and(D_KRBH="'+qryMasterD_KRBH.Value+'")'
  else
    s := 'delete from YDCY where (D_YDBH="'+qryMasterD_YDBH.Value +'")and(D_KRBH="'+qryMasterD_KRBH.Value+'")and(D_CTBH="'+qryMasterD_CTBH.Value+'")';
  HotelData.ExecSql(s);
  qryMaster.Close;
  qryMaster.Open;
end;

procedure TYdcycxForm.RadioButton1Click(Sender: TObject);
begin
  inherited;
  FSjdm := '全部';
end;

procedure TYdcycxForm.RadioButton2Click(Sender: TObject);
begin
  inherited;
  FSjdm := '中午';
end;

procedure TYdcycxForm.RadioButton3Click(Sender: TObject);
begin
  inherited;
  FSjdm := '晚上';
end;

procedure TYdcycxForm.BitBtn1Click(Sender: TObject);
begin
  inherited;
  ShowMessage('预定营业金额统计：'+FormatFloat('#.##',SumXfje)+'元');
end;

end.
