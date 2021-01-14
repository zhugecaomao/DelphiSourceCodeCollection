unit C_Dtbcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdBrow, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, C_Define;

type
  TDtbCxForm = class(TStdBrowForm)
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    qryWorkD_JZBH: TStringField;
    qryWorkD_HH: TIntegerField;
    qryWorkD_XMBH: TStringField;
    qryWorkD_XFDJ: TCurrencyField;
    qryWorkD_XFSL: TFloatField;
    qryWorkD_XFJE: TCurrencyField;
    qryWorkD_YJJE: TCurrencyField;
    qryWorkD_YHJE: TCurrencyField;
    qryWorkD_JZFS: TStringField;
    qryWorkD_JZLX: TStringField;
    qryWorkD_XYKBH: TStringField;
    qryWorkD_KHBH: TStringField;
    qryWorkD_JZRQ: TDateField;
    qryWorkD_JZSJ: TTimeField;
    qryWorkD_CZYXM: TStringField;
    qryWorkD_BZ: TStringField;
    qryWorkD_YSRQ: TStringField;
    procedure DateTimePicker1Change(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    FXmbh: string;
  public
    { Public declarations }
  end;

var
  DtbCxForm: TDtbCxForm;

procedure DtbCx;

implementation

uses C_HotelData, C_Sysprint;

{$R *.dfm}

procedure DtbCx;
begin
  DtbcxForm := TDtbcxForm.Create(Application);
  try
    with DtbcxForm do
    begin
      FXmbh := HotelData.FindBh('XMDM.DB','D_XMBH','D_XMMC','大堂吧');
      DateTimePicker1.Date := Date;
      DateTimePicker1Change(nil);
      ShowModal;
    end;
  finally
    DtbcxForm.qryWork.Close;
    DtbcxForm.Free;
  end;

end;

procedure TDtbCxForm.DateTimePicker1Change(Sender: TObject);
var
  ADate: TDate;
  s: string;
begin
  inherited;
  try
  qryWork.DisableControls;
  ADate := DateTimePicker1.Date;
  if FormatDateTime('yyyymmdd',ADate)=FormatDateTime('yyyymmdd',Date) then
  begin
    s := 'select * from KRJZ where (D_XMBH="'+FXmbh+'")and(D_HH<>0)';
    qryWork.Close;
    qryWork.SQL.Clear;
    qryWork.SQL.Add(s);
    qryWork.Open;
  end
  else
  begin
    s := 'select * from KRJZDA where (D_XMBH="'
        +FXmbh+'")and(D_HH<>0)and(D_JZRQ=:JZRQ)';
    qryWork.Close;
    qryWork.SQL.Clear;
    qryWork.SQL.Add(s);
    qryWork.Params[0].DataType := ftDate;
    qryWork.Params[0].Value := ADate;
    qryWork.Open;
  end;

  finally
    qryWork.EnableControls;
  end;

end;

procedure TDtbCxForm.btnPrintClick(Sender: TObject);
var
  I         : Integer;
  APrintStru: TPrintStru;
  AColumns  : TStringList;
  APosition : TStringList;
  AFields   : TStringList;
begin
  APrintStru.ATitle := '大堂吧营业';
  APrintStru.ADataSet := qryWork;
  AColumns := TStringList.Create;
  try
    APosition := TStringList.Create;
    try
      AFields := TStringList.Create;
      try
        for I:= 0 to 3 do
        begin
          AColumns.Add(DBGrid1.Columns[I].Title.Caption);
          AFields.Add(DBGrid1.Columns[I].FieldName);
        end;
        APosition.Add('10');
        APosition.Add('200');
        APosition.Add('400');
        APosition.Add('600');
        APrintStru.AColumns := AColumns;
        APrintStru.AFields  := AFields;
        APrintStru.APosition:= APosition;
        APrintStru.AFs      := PRN_Portrait;
        SysPrint(APrintStru);
      finally
        AFields.Free;
      end;
    finally
      APosition.Free;
    end;
  finally
    AColumns.Free;
  end;
end;

end.
