unit C_Ygkf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Stand, DosMove, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB,
  DBTables, Grids, DBGrids, C_Define;

type
  TYgkfForm = class(TStandForm)
    Label1: TLabel;
    dtpBd: TDateTimePicker;
    Label2: TLabel;
    dtpEd: TDateTimePicker;
    qryYgkf: TQuery;
    qryTj: TQuery;
    dsYgkf: TDataSource;
    dsTj: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    btnQuery: TBitBtn;
    Query1: TQuery;
    qryTjD_KFBL: TStringField;
    qryTjD_JEBL: TStringField;
    btnPrintDetail: TBitBtn;
    btnPrintHz: TBitBtn;
    qryTjD_CZYXM: TStringField;
    qryTjCOUNT: TIntegerField;
    qryTjSUM: TFloatField;
    qryYgkfD_CZYXM: TStringField;
    qryYgkfD_KFRQ: TDateTimeField;
    qryYgkfD_KFSJ: TDateTimeField;
    qryYgkfD_KFBH: TStringField;
    qryYgkfD_KRXM: TStringField;
    qryYgkfD_SJFJ: TFloatField;
    procedure btnQueryClick(Sender: TObject);
    procedure qryTjCalcFields(DataSet: TDataSet);
    procedure btnPrintDetailClick(Sender: TObject);
    procedure btnPrintHzClick(Sender: TObject);
  private
    { Private declarations }
    FCount: Integer;
    FKfze: Currency;
  public
    { Public declarations }
  end;

var
  YgkfForm: TYgkfForm;

procedure Ygkf;

implementation

uses C_Sysprint;

{$R *.dfm}

procedure Ygkf;
begin
  YgkfForm := TYgkfForm.Create(Application);
  try
    with YgkfForm do
    begin
      dtpBD.Date := Date;
      dtpED.Date := Date;
      ShowModal;
    end;
  finally
    YgkfForm.Free;
  end;
end;

procedure TYgkfForm.btnQueryClick(Sender: TObject);
begin
  inherited;
  with Query1 do
  begin
    if Active then Active := False;
    Params[0].Value := dtpBD.Date;
    Params[1].Value := dtpED.Date;
    Open;
    FCount := Fields[0].AsInteger;
    FKfze  := Fields[1].AsCurrency;
  end;
  with qryYgkf do
  begin
    if Active then Active := False;
    Params[0].Value := dtpBD.Date;
    Params[1].Value := dtpED.Date;
    Open;
  end;
  with qryTj do
  begin
    if Active then Active := False;
    Params[0].Value := dtpBD.Date;
    Params[1].Value := dtpED.Date;
    Open;
  end;

end;

procedure TYgkfForm.qryTjCalcFields(DataSet: TDataSet);
begin
  inherited;
  //qryTjD_KFBL.Value := Format('%4.2f％',[qryTjCOUNT.Value/FCount*100]);
  qryTjD_KFBL.Value := FormatFloat('0.00',qryTjCOUNT.Value/FCount*100)+'%';
  //qryTjD_JEBL.Value := Format('%4.2f％',[qryTjSUM.Value/FKfze*100.0]);
  qryTjD_JEBL.Value := FormatFloat('0.00',qryTjSUM.Value/FKfze*100)+'%';
  //qryTjD_JEBL.Value := FloatToStr(qryTjSUM.Value/FKfze*100)+'％';
end;

procedure TYgkfForm.btnPrintDetailClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '员工开房明细（'+DateToStr(dtpBD.Date)+'至'+DateToStr(dtpED.Date)+'）';
  APrintStru.ADataSet := qryYgkf;
  PrintLb(APrintStru,DBGrid1);
end;

procedure TYgkfForm.btnPrintHzClick(Sender: TObject);
var
  I         : Integer;
  APrintStru: TPrintStru;
  AColumns  : TStringList;
  APosition : TStringList;
  AFields   : TStringList;
begin
  APrintStru.ATitle := '员工开房汇总（'+DateToStr(dtpBD.Date)+'至'+DateToStr(dtpED.Date)+'）';
  APrintStru.ADataSet := qryTj;
  AColumns := TStringList.Create;
  try
    APosition := TStringList.Create;
    try
      AFields := TStringList.Create;
      try
        for I:= 0 to 4 do
        begin
          AColumns.Add(DBGrid2.Columns[I].Title.Caption);
          AFields.Add(DBGrid2.Columns[I].FieldName);
        end;
        APosition.Add('10');
        APosition.Add('200');
        APosition.Add('300');
        APosition.Add('400');
        APosition.Add('550');
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
