unit BbCkkcHz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbCkkcHz = class(TfrmComTjfx)
    Series1: TPieSeries;
    labCk: TLabel;
    procedure FormShow(Sender: TObject);override;
    procedure OpendataSet;override;
    procedure aMxExecute(Sender: TObject);override;
    procedure aFxtExecute(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
    intCKID: integer;
    dteRQA, dteRQB: TDate;
  end;

var
  frmBbCkkcHz: TfrmBbCkkcHz;

implementation

uses Dm, DmBb, CkRqd, BbCkkcMx, MyLib, Common;

{$R *.DFM}

procedure TfrmBbCkkcHz.FormShow(Sender: TObject);
begin
  labCK.Caption := '仓库: ' + frmCkRqd.ComboBox1.Text;
  intCKID := GetFieldValue('select ID from CK where MC = ''' + frmCkRqd.ComboBox1.Text + '''');
  dteRQA := frmCkRqd.dtpRqa.Date;
  dteRQB := frmCkRqd.dtpRqb.Date;
  labTj.Caption := '统计日期: ' +
    FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  inherited;
end;

procedure TfrmBbCkkcHz.OpendataSet;
var
  strSqlHP, strSqlJC, strSqlTJ: string;
  strSumQC, strSumBQ: string;
  D1: string;
begin
  //货品期初 ID, BH, PM, DW, QCS1, QCJE1
  strSqlHP := GetSqlHpqc(intCKID, 0);
  //进出数
  D1 := FormatDateTime('yyyy-mm-dd', dteRQA);
  strSumQc := 'iif(RQ < #%s#, %s, 0)';
  strSumBq := 'iif(M.JCLX = %d and RQ >= #%s#, %s, 0)';
  strSqlJC :=
    'select HPID, ' +
    'sum(' + Format(strSumQC, [D1, 'SL1']) + ') as QCJCSL, ' +
    'sum(' + Format(strSumQC, [D1, 'SL1 * DJ1']) + ') as QCJCJE, ' +
    'sum(' + Format(strSumBQ, [1, D1, 'SL1']) + ') as BQSRSL, ' +
    'sum(' + Format(strSumBQ, [1, D1, 'SL1 * DJ1']) + ') as BQSRJE, ' +
    'sum(' + Format(strSumBQ, [2, D1, 'SL1']) + ') as BQFCSL, ' +
    'sum(' + Format(strSumBQ, [2, D1, 'SL1 * DJ1']) + ') as BQFCJE ' +
    'from (' + GetSqlJcmx(0, dteRQB, intCKID, 0) + ') M ' +
    'group by HPID';
  strSqlTJ :=
    'select H.ID, H.BH, H.PM, H.DW, ' +
    'H.QCS1 + iif(isnull(J.QCJCSL), 0, J.QCJCSL) as SLA, ' +
    'H.QCJE1 + iif(isnull(J.QCJCJE), 0, J.QCJCJE) as JEA, ' +
    'iif(isnull(J.BQSRSL), 0, J.BQSRSL) as SLB, ' +
    'iif(isnull(J.BQSRJE), 0, J.BQSRJE) as JEB, ' +
    'iif(isnull(J.BQFCSL), 0, -J.BQFCSL) as SLC, ' +
    'iif(isnull(J.BQFCJE), 0, -J.BQFCJE) as JEC, ' +
    'SLA + SLB - SLC AS SLD, ' +
    'JEA + JEB - JEC AS JED ' +
    'from (' + strSqlHP + ') as H, (' + strSqlJC + ') J, H left join J on H.ID = J.HPID';
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select * ' +
    'from (' + strSqlTJ + ') H ' +
    'where SLA <> 0 or SLB <> 0 or SLC <> 0 or SLD <> 0 ' +
    'order by BH';
  inherited;
end;

procedure TfrmBbCkkcHz.aMxExecute(Sender: TObject);
begin
  frmBbCkkcMx := TfrmBbCkkcMx.Create(Application);
  with frmBbCkkcMx do
  begin
    intCKID := self.intCKID;
    intHPID := dsJbzl.FieldByName('ID').AsInteger;
    dteRQA := self.dteRQA;
    dteRQB := self.dteRQB;
    ShowModal;
    Free;
  end;
end;

procedure TfrmBbCkkcHz.aFxtExecute(Sender: TObject);
begin
  { TODO : pdddy }
  ShowMessage('todo 盘点表打印');
end;

end.
