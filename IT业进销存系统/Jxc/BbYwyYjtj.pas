unit BbYwyYjtj;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbYwyYjtj = class(TfrmComTjfx)
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
  frmBbYwyYjtj: TfrmBbYwyYjtj;

implementation

uses Dm, DmBb, Rqdsz, BbYwyXsMx, MyLib;

{$R *.DFM}

procedure TfrmBbYwyYjtj.FormShow(Sender: TObject);
begin
  dteRQA := frmRqdsz.dtpRqa.Date;
  dteRQB := frmRqdsz.dtpRqb.Date;
  labTj.Caption := '统计日期: ' +
    FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  inherited;
end;

procedure TfrmBbYwyYjtj.OpendataSet;
var
  strSqlXs, strSqlTh, strSqlYWY, strSqlTj: string;
  D1, D2: string;
begin
  D1 := FormatDateTime('yyyy-mm-dd', dteRQA);
  D2 := FormatDateTime('yyyy-mm-dd', dteRQB);
  strSqlXs :=
    'select YWY, sum(JE) as XSJE, sum(iif(XSLX = 1, JE, 0) + YSJE) as YSJE1 ' +
    'from XSKDZB ' +
    'where RQ between #' + D1 + '# and #' + D2 + '# ' +
    'group by YWY';
  strSqlTh :=
    'select YWY, sum(JE) as THJE ' +
    'from XSTHZB ' +
    'where RQ between #' + D1 + '# and #' + D2 + '# ' +
    'group by YWY';
  strSqlYwy :=
    'select YWY from ' +
    '(select YWY from XSKDZB where RQ between #' + D1 + '# and #' + D2 + '# ' +
    'union all ' +
    'select YWY from XSTHZB where RQ between #' + D1 + '# and #' + D2 + '# ) ' +
    'group by YWY';
  strSqlTj :=
    'select Y.YWY, X.XSJE, T.THJE, X.YSJE1 as YSJE, X.XSJE - T.THJE - X.YSJE1 as MSJE ' +
    'from (' + strSqlYwy + ') Y, (' + strSqlXs + ') X, (' + strSqlTh + ') T, ' +
    'Y left join X on Y.YWY = X.YWY, Y left join T on Y.YWY = T.YWY';
  dsJbzl.Close;
  dsJbzl.CommandText := strSqlTj;
  inherited;
end;

procedure TfrmBbYwyYjtj.aMxExecute(Sender: TObject);
begin
  frmBbYwyXsMx := TfrmBbYwyXsMx.Create(Application);
  with frmBbYwyXsMx do
  begin
    strYWY := dsJbzl.FieldByName('YWY').AsString;
    dteRQA := self.dteRQA;
    dteRQB := self.dteRQB;
    ShowModal;
    Free;
  end;
end;

end.
