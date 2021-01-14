unit C_Rsmx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdBrow, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, Mask, ComCtrls;

type
  TRsmxForm = class(TStdBrowForm)
    qryWorkD_XFXM: TStringField;
    qryWorkD_SHJE: TCurrencyField;
    dtpJzrq: TDateTimePicker;
    Label1: TLabel;
    qryWorkD_JZBH: TStringField;
    qryWorkD_HH: TIntegerField;
    qryWorkD_XMBH: TStringField;
    qryWorkD_XFDJ: TFloatField;
    qryWorkD_XFSL: TFloatField;
    qryWorkD_XFGG: TStringField;
    qryWorkD_XFJE: TFloatField;
    qryWorkD_YJJE: TFloatField;
    qryWorkD_YHJE: TFloatField;
    qryWorkD_JZFS: TStringField;
    qryWorkD_JZLX: TStringField;
    qryWorkD_KHBH: TStringField;
    qryWorkD_XYKBH: TStringField;
    qryWorkD_JZRQ: TDateTimeField;
    qryWorkD_JZSJ: TDateTimeField;
    qryWorkD_CZYXM: TStringField;
    qryWorkD_BZ: TStringField;
    qryWorkD_YSRQ: TStringField;
    btnDetail: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure qryWorkD_JZLXGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryWorkCalcFields(DataSet: TDataSet);
    procedure dtpJzrqChange(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnDetailClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RsmxForm: TRsmxForm;

procedure Rsmx;

implementation

uses C_HotelData, C_Define, C_Sysprint, C_Dqshmx;

{$R *.dfm}

procedure Rsmx;
begin
  RsmxForm := TRsmxForm.Create(Application);
  try
    with RsmxForm do
    begin
      qryWork.Params[0].Value := Date;
      qryWork.Open;
      dtpJzrq.Date := Date;
      ShowModal;
    end;
  finally
    RsmxForm.qryWork.Close;
    RsmxForm.Free;
  end;
end;

procedure TRsmxForm.qryWorkD_JZLXGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
  begin
    if Sender.AsString=JZLX_YK then Text := '寓客';
    if Sender.AsString=JZLX_FYK then Text := '非寓客';
    if Sender.AsString=JZLX_YSK then Text := '应收款';
    if Sender.AsString=JZLX_YJK then Text := '预交款';
    //if Sender.AsString=JZLX_CT then Text := '餐厅收回';
  end;
end;

procedure TRsmxForm.qryWorkCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryWork.FieldByName('D_SHJE').AsCurrency :=
    qryWork.FieldByName('D_XFJE').AsCurrency - qryWork.FieldByName('D_YHJE').AsCurrency;
end;

procedure TRsmxForm.dtpJzrqChange(Sender: TObject);
var
  ADate: TDateTime;
  s: string;
begin
  inherited;
  RadioButton1.Checked := True;
  ADate := dtpJzrq.Date;
  if FormatDateTime('yyyymmdd',ADate)=FormatDateTime('yyyymmdd',Date) then
    s := 'select * from KRJZ where (D_JZRQ=:JZRQ)and(D_HH=0) order by D_JZRQ,D_JZSJ'
  else
    s := 'select * from KRJZDA where (D_JZRQ=:JZRQ)and(D_HH=0) order by D_JZRQ,D_JZSJ';
  try
    qryWork.DisableControls;
    qryWork.Close;
    qryWork.SQL.Clear;
    qryWork.SQL.Add(s);
    qryWork.Params[0].DataType := ftDate;
    qryWork.Params[0].Value := ADate;
    qryWork.Open;
  finally
    qryWork.EnableControls;
  end;
end;

procedure TRsmxForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '日收明细（'+DateToStr(dtpJzrq.Date)+'）';
  APrintStru.ADataSet := qryWork;
  PrintLb(APrintStru,DBGrid1);  
end;

procedure TRsmxForm.btnDetailClick(Sender: TObject);
begin
  inherited;
  if FormatDateTime('yyyymmdd',dtpJzrq.Date)=FormatDateTime('yyyymmdd',Date) then
    Dqshmx('select * from KRJZ where (D_HH<>0)and(D_JZBH="'+qryWorkD_JZBH.Value+'")')
  else
    Dqshmx('select * from KRJZDA where (D_HH<>0)and(D_JZBH="'+qryWorkD_JZBH.Value+'")')
end;

procedure TRsmxForm.RadioButton1Click(Sender: TObject);
var
  ADate : TDateTime;
  s : string;
begin
  inherited;
  ADate := dtpJzrq.Date;
  if FormatDateTime('yyyymmdd',ADate)=FormatDateTime('yyyymmdd',Date) then
    s := 'select * from KRJZ where (D_JZRQ=:JZRQ)and(D_HH=0) order by D_JZRQ,D_JZSJ'
  else
    s := 'select * from KRJZDA where (D_JZRQ=:JZRQ)and(D_HH=0) order by D_JZRQ,D_JZSJ';
  try
    qryWork.DisableControls;
    qryWork.Close;
    qryWork.SQL.Clear;
    qryWork.SQL.Add(s);
    qryWork.Params[0].DataType := ftDate;
    qryWork.Params[0].Value := ADate;
    qryWork.Open;
  finally
    qryWork.EnableControls;
  end;
end;

procedure TRsmxForm.RadioButton2Click(Sender: TObject);
var
  ADate : TDateTime;
  s : string;
begin
  inherited;
  ADate := dtpJzrq.Date;
  if FormatDateTime('yyyymmdd',ADate)=FormatDateTime('yyyymmdd',Date) then
    s := 'select * from KRJZ where (D_JZRQ=:JZRQ)and(D_HH<>0) order by D_JZRQ,D_JZSJ'
  else
    s := 'select * from KRJZDA where (D_JZRQ=:JZRQ)and(D_HH<>0) order by D_JZRQ,D_JZSJ';
  try
    qryWork.DisableControls;
    qryWork.Close;
    qryWork.SQL.Clear;
    qryWork.SQL.Add(s);
    qryWork.Params[0].DataType := ftDate;
    qryWork.Params[0].Value := ADate;
    qryWork.Open;
  finally
    qryWork.EnableControls;
  end;
end;

end.
