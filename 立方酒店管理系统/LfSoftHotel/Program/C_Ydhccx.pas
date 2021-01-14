unit C_Ydhccx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdBrow, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, C_Define, ComCtrls;

type
  TYdhccxForm = class(TStdBrowForm)
    qryWorkD_YDBH: TStringField;
    qryWorkD_KRBH: TStringField;
    qryWorkD_KRXM: TStringField;
    qryWorkD_YDRQ: TDateTimeField;
    qryWorkD_SYRQ: TDateTimeField;
    qryWorkD_SYSJ: TDateTimeField;
    qryWorkD_SJDM: TStringField;
    qryWorkD_HCBH: TStringField;
    qryWorkD_HCMC: TStringField;
    qryWorkD_HCZJ: TFloatField;
    qryWorkD_HCRS: TIntegerField;
    qryWorkD_HCRS1: TIntegerField;
    qryWorkD_HFSL: TFloatField;
    qryWorkD_HFJE: TFloatField;
    qryWorkD_HFBZ: TStringField;
    qryWorkD_XHSL: TFloatField;
    qryWorkD_XHJE: TFloatField;
    qryWorkD_XHBZ: TStringField;
    qryWorkD_SGSL: TFloatField;
    qryWorkD_SGJE: TFloatField;
    qryWorkD_SGBZ: TStringField;
    qryWorkD_QTJE: TFloatField;
    qryWorkD_QTBZ: TStringField;
    qryWorkD_HTSL: TFloatField;
    qryWorkD_HTBZ: TStringField;
    qryWorkD_RZBZ: TStringField;
    qryWorkD_JSBZ: TStringField;
    qryWorkD_CZYXM: TStringField;
    qryWorkD_BZ: TBlobField;
    dtpDate: TDateTimePicker;
    btnQuery: TBitBtn;
    btnAll: TBitBtn;
    btnYdxg: TBitBtn;
    btnHcjs: TBitBtn;
    tblYdxx: TTable;
    qryWorkD_LXDH: TStringField;
    qryWorkD_DWMC: TStringField;
    qryWorkD_LXR: TStringField;
    btnQx: TBitBtn;
    qryWorkD_BZNR: TStringField;
    procedure qryWorkD_RZBZGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnAllClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure btnHcjsClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure qryWorkD_JSBZGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnQxClick(Sender: TObject);
    procedure qryWorkCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YdhccxForm: TYdhccxForm;

procedure Ydhccx;
procedure YdhcjsEnter;

implementation

uses C_Ydhc, C_Hcjs, C_Main, C_HotelData;

{$R *.dfm}

procedure Ydhccx;
begin
  YdhccxForm := TYdhccxForm.Create(Application);
  try
    with YdhccxForm do
    begin
      dtpDate.Date := Date;
      qryWork.Open;
      qryWork.Filter := 'D_SYRQ>='''+FormatDateTime('yyyy-mm-dd',Date)+'''';
      qryWork.Filtered := True;
      ShowModal;
    end;
  finally
    YdhccxForm.qryWork.Close;
    YdhccxForm.Free;
  end;
end;

procedure YdhcjsEnter;
begin
  YdhccxForm := TYdhccxForm.Create(Application);
  try
    with YdhccxForm do
    begin
      dtpDate.Date := Date;
      qryWork.Open;
      btnQueryClick(nil);
      ShowModal;
    end;
  finally
    YdhccxForm.qryWork.Close;
    YdhccxForm.Free;
  end;
end;

procedure TYdhccxForm.qryWorkD_RZBZGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
  begin
    if Sender.AsBoolean then Text := '已确认'
    else Text := '';
  end;
end;

procedure TYdhccxForm.DBGrid1DblClick(Sender: TObject);
var
  aYdbh : string;
begin
  inherited;
  if qryWork.IsEmpty then Exit;
  aYdbh := qryWorkD_YDBH.Value;
  if qryWorkD_RZBZ.AsBoolean then
    Ydhcjs(qryWorkD_KRBH.Value,qryWorkD_YDBH.Value)
  else
    YdhcEdit(qryWorkD_KRBH.Value,qryWorkD_YDBH.Value);
  qryWork.Close;
  qryWork.Open;
  qryWork.Locate('D_YDBH',aYdbh,[]);
  MainForm.ShowYdhc;
  //qryWork.Refresh;
end;

procedure TYdhccxForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '预定会场情况一览表';
  APrintStru.ADataSet := qryWork;
  PrintLb(APrintStru,DBGrid1);
end;

procedure TYdhccxForm.btnAllClick(Sender: TObject);
begin
  inherited;
  qryWork.Filter := 'D_SYRQ>='''+FormatDateTime('yyyy-mm-dd',Date)+'''';
  qryWork.Filtered := True;
end;

procedure TYdhccxForm.btnQueryClick(Sender: TObject);
begin
  inherited;
  qryWork.Filter := 'D_SYRQ='''+FormatDateTime('yyyy-mm-dd',dtpDate.Date)+'''';
  qryWork.Filtered := True;
end;

procedure TYdhccxForm.btnHcjsClick(Sender: TObject);
begin
  inherited;
  if (qryWorkD_RZBZ.Value = 'T')and(qryWorkD_JSBZ.Value=JS_NO) then
  begin
    YdhcJs(qryWorkD_KRBH.Value,qryWorkD_YDBH.Value);
    MainForm.ShowYdhc;
  end
  else
  begin
    ShowWarning('该会场不能结算！');
  end;
  qryWork.Close;
  qryWork.Open;
end;

procedure TYdhccxForm.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'D_SYRQ' then
  begin
    with qryWork do
    begin
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('select * from YDHC where D_JSBZ="1" order by D_SYRQ,D_SYSJ');
      Open;
      EnableControls;
    end;
  end;
  if Column.FieldName = 'D_HCMC' then
  begin
    with qryWork do
    begin
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('select * from YDHC where D_JSBZ="1" order by D_HCMC,D_SYRQ,D_SYSJ');
      Open;
      EnableControls;
    end;
  end;
  if Column.FieldName = 'D_KRXM' then
  begin
    with qryWork do
    begin
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('select * from YDHC D_JSBZ="1" order by D_KRXM,D_SYRQ,D_SYSJ');
      Open;
      EnableControls;
    end;
  end;

end;


procedure TYdhccxForm.qryWorkD_JSBZGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
  begin
    if Sender.AsString=JS_YES then Text := '已结算'
    else Text := '未结算';
  end;
end;

procedure TYdhccxForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if qryWorkD_RZBZ.Value  = 'T' then
    DBGrid1.Canvas.Font.Color := clRed;
  DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TYdhccxForm.btnQxClick(Sender: TObject);
var
  s : string;
begin
  inherited;
  if qryWorkD_RZBZ.Value = 'T' then
  begin
    ShowMessage('该预定已经确任，你不能取消！');
    Exit;
  end;
  if not Confirm('你确认取消该预定吗？') then Exit;
  s := 'delete from YDHC where D_YDBH="'+qryWorkD_YDBH.Value +'"';
  HotelData.ExecSql(s);
  qryWork.Close;
  qryWork.Open;
end;

procedure TYdhccxForm.qryWorkCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryWorkD_BZNR.Value := qryWorkD_BZ.Value;
end;

end.
