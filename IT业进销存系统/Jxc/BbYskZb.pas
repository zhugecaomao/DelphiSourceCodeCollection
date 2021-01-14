unit BbYskZb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbYskZb = class(TfrmComTjfx)
    Series1: TPieSeries;
    procedure FormShow(Sender: TObject);override;
    procedure OpendataSet;override;
    procedure aMxExecute(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
    dteRQA, dteRQB: TDate;
  end;

var
  frmBbYskZb: TfrmBbYskZb;

implementation

uses Dm, DmBb, Rqdsz, BbYskMx, MyLib;

{$R *.DFM}

procedure TfrmBbYskZb.FormShow(Sender: TObject);
begin
  dteRQA := frmRqdsz.dtpRqa.Date;
  dteRQB := frmRqdsz.dtpRqb.Date;
  labTj.Caption := '统计日期: ' +
    FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  strAutoScale := 'DBGrid1';
  inherited;
end;

procedure TfrmBbYskZb.OpendataSet;
var
  strSqlJC: string;
  strSumQC, strSumBQ: string;
  D1: string;
begin
  //进出数
  D1 := FormatDateTime('yyyy-mm-dd', dteRQA);
  strSumQc := 'iif(RQ is null or RQ < #%s#, %s, 0)';
  strSumBq := 'iif(RQ >= #%s#, %s, 0)';
  strSqlJC :=
    'select KHID, ' +
    'sum(' + Format(strSumQC, [D1, 'JEA - JEB']) + ') as QCJE, ' +
    'sum(' + Format(strSumBQ, [D1, 'JEA']) + ') as JEB, ' +
    'sum(' + Format(strSumBQ, [D1, 'JEB']) + ') as JEC ' +
    'from (' + GetSqlKhwl(0, dteRQB, 0) + ') M ' +
    'group by KHID';
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select K.ID, K.BH, K.MC, ' +
    'J.QCJE as JEA, J.JEB, J.JEC, JEA + JEB - JEC as JED ' +
    'from KH K, (' + strSqlJC + ') J, K inner join J on K.ID = J.KHID ' +
    'order by K.BH';
  inherited;
end;

procedure TfrmBbYskZb.aMxExecute(Sender: TObject);
begin
  frmBbYskMx := TfrmBbYskMx.Create(Application);
  with frmBbYskMx do
  begin
    intKHID := dsJbzl.FieldByName('ID').AsInteger;
    dteRQA := self.dteRQA;
    dteRQB := self.dteRQB;
    ShowModal;
    Free;
  end;
end;

end.
