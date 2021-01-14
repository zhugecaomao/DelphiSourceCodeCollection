unit C_Dtbqj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdBrow, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, C_Define;

type
  TDtbqjForm = class(TStdBrowForm)
    qryWorkD_HJ: TCurrencyField;
    qryWorkD_KFBH: TStringField;
    qryWorkD_SJFJ: TFloatField;
    qryWorkD_BJS: TIntegerField;
    qryWorkD_QJS: TIntegerField;
    qryWorkD_BJ: TStringField;
    qryWorkD_QJ: TStringField;
    qryWorkD_JJFJ: TFloatField;
    lblFjze: TLabel;
    tblKfzt: TTable;
    lblDqze: TLabel;
    procedure qryWorkCalcFields(DataSet: TDataSet);
    procedure btnPrintClick(Sender: TObject);
    procedure qryWorkBeforeInsert(DataSet: TDataSet);
    procedure qryWorkBeforeEdit(DataSet: TDataSet);
    procedure qryWorkBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    FFjze : Currency;
    FDqze : Currency;
    function GetDqze: Currency;
  public
    { Public declarations }
  end;

var
  DtbqjForm: TDtbqjForm;

procedure Dtbqj;

implementation

uses C_Sysprint, C_HotelData, C_FjhbPrint;

{$R *.dfm}

procedure Dtbqj;
begin
  DtbqjForm := TDtbqjForm.Create(Application);
  try
    with DtbqjForm do
    begin
      HotelData.ExecSql('delete from BQJ where (D_SJFJ=0)and(D_JJFJ=0)');
      try
        qryWork.Open;
      except
        On E:Exception do
        begin
          ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                      +#13#10
                      +'错误信息:'
                      +E.Message);
          raise;
        end;
      end;
      FFjze := HotelData.SumJe('select sum(D_SJFJ+D_JJFJ) from BQJ');
      FDqze := HotelData.SumJe('select sum(D_JJFJ) from BQJ')+GetDqze;
      lblFjze.Caption := '今日房金总额：'+FormatFloat('#.##',FFjze);
      lblDqze.Caption := '当前房金总额：'+FormatFloat('#.##',FDqze);
      
      ShowModal;
    end;
  finally
    DtbqjForm.qryWork.Close;
    DtbqjForm.Free;
  end;
end;

function TDtbqjForm.GetDqze: Currency;
var
  aDqze : Currency;
begin
  aDqze := 0;
  tblKfzt.Open;
  tblKfzt.First;
  while not tblKfzt.Eof do
  begin
      if (tblKfzt.FieldByName('D_KFZT').AsString=KFZT_BF)or
         (tblKfzt.FieldByName('D_KFZT').AsString=KFZT_TD) then
      begin
        if tblKfzt.FieldByName('D_KFBZ').AsString <> KFBZ_DT then
        begin
          if (Time>EnCodeTime(12,0,0,0))
          and(Time<=EnCodeTime(18,0,0,0))
          and(TIme<EnCodeTime(23,0,0,0)) then
            begin
              aDqze := aDqze + tblKfzt.FieldByName('D_SJFJ').AsCurrency*0.5;
            end
          else if (Time>EnCodeTime(18,0,0,0))and(Time<EnCodeTime(23,0,0,0)) then
            begin
              aDqze := aDqze + tblKfzt.FieldByName('D_SJFJ').AsCurrency;
            end;
        end
        else
        begin
          aDqze := aDqze + tblKfzt.FieldByName('D_SJFJ').AsCurrency;
        end;
      end;

    tblKfzt.Next;
  end;
  tblKfzt.Close;
  Result := aDqze;
end;

procedure TDtbqjForm.qryWorkCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryWorkD_HJ.Value := qryWorkD_JJFJ.Value + qryWorkD_SJFJ.Value;
end;

procedure TDtbqjForm.btnPrintClick(Sender: TObject);
begin
  FjhbPrint;
end;

procedure TDtbqjForm.qryWorkBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if CZY.CzyBh <> SYSTEM_BH then Abort;
end;

procedure TDtbqjForm.qryWorkBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if CZY.CzyBh <> SYSTEM_BH then Abort;
end;

procedure TDtbqjForm.qryWorkBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if CZY.CzyBh <> SYSTEM_BH then Abort;
end;

end.
