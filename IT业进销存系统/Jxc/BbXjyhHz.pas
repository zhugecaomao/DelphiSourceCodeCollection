unit BbXjyhHz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbXjyhHz = class(TfrmComTjfx)
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
  frmBbXjyhHz: TfrmBbXjyhHz;

implementation

uses Dm, DmBb, Rqdsz, BbXjyhMx, MyLib;

{$R *.DFM}

procedure TfrmBbXjyhHz.FormShow(Sender: TObject);
begin
  dteRQA := frmRqdsz.dtpRqa.Date;
  dteRQB := frmRqdsz.dtpRqb.Date;
  labTj.Caption := '统计日期: ' +
    FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  strAutoScale := 'DBGrid1';
  inherited;
end;

procedure TfrmBbXjyhHz.OpendataSet;
var
  strSqlJC, strSqlBB: string;
  strSumQC, strSumBQ: string;
  D1: string;
begin
  //进出数
  D1 := FormatDateTime('yyyy-mm-dd', dteRQA);
  strSumQc := 'iif(RQ < #%s#, %s, 0)';
  strSumBq := 'iif(RQ >= #%s#, %s, 0)';
  strSqlJC :=
    'select ZHID, ' +
    'sum(' + Format(strSumQC, [D1, 'JEA - JEB']) + ') as QCJE_1, iif(isnull(QCJE_1), 0, QCJE_1) as QCJE, ' +
    'sum(' + Format(strSumBQ, [D1, 'JEA']) + ') as JEB_1, iif(isnull(JEB_1), 0, JEB_1) as JEB, ' +
    'sum(' + Format(strSumBQ, [D1, 'JEB']) + ') as JEC_1, iif(isnull(JEC_1), 0, JEC_1) as JEC ' +
    'from (' + GetSqlZhmx(0, dteRQB, 0) + ') M ' +
    'group by ZHID';
  strSqlBB :=
    'select Z.ID, Z.MC, Z.YHZH, ' +
    'Z.QCJE + J.QCJE as JEA, J.JEB, J.JEC, JEA + JEB - JEC as JED ' +
    'from ZH Z, (' + strSqlJC + ') J, Z left join J on Z.ID = J.ZHID';
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select * ' +
    'from (' + strSqlBB + ') B ' +
    'where JEA <> 0 or JEB <> 0 or JEC <> 0 or JED <> 0 ' +
    'order by ID';
  inherited;
end;

procedure TfrmBbXjyhHz.aMxExecute(Sender: TObject);
begin
  frmBbXjyhMx := TfrmBbXjyhMx.Create(Application);
  with frmBbXjyhMx do
  begin
    intZHID := dsJbzl.FieldByName('ID').AsInteger;
    dteRQA := self.dteRQA;
    dteRQB := self.dteRQB;
    ShowModal;
    Free;
  end;
end;

end.
