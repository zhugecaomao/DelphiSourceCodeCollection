unit BbXsMlNb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbXsMlNb = class(TfrmComTjfx)
    Series1: TBarSeries;
    Series2: TBarSeries;
    procedure FormShow(Sender: TObject);override;
    procedure OpendataSet;override;
    procedure aMxExecute(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
    dteRQ: TDate;
  end;

var
  frmBbXsMlNb: TfrmBbXsMlNb;

implementation

uses Dm, DmBb, Ndsz, BbXsMlNbMx, MyLib;

{$R *.DFM}

procedure TfrmBbXsMlNb.FormShow(Sender: TObject);
begin
  dteRQ := frmNdsz.dtpRq.Date;
  labTj.Caption := '统计年份: ' + FormatDateTime('yyyy', dteRQ) + '年';
  inherited;
end;

procedure TfrmBbXsMlNb.OpendataSet;
var
  strSqlYf, strSqlTj: string;
  dteRQA, dteRQB: TDate;
begin
  dteRQA := StrToDate(FormatDateTime('yyyy', dteRQ) + '-01-01');
  dteRQB := StrToDate(FormatDateTime('yyyy', dteRQ) + '-12-31');
  strSqlYf :=
    'select top 1 1 as YF from AppUser union all ' +
    'select top 1 2 as YF from AppUser union all ' +
    'select top 1 3 as YF from AppUser union all ' +
    'select top 1 4 as YF from AppUser union all ' +
    'select top 1 5 as YF from AppUser union all ' +
    'select top 1 6 as YF from AppUser union all ' +
    'select top 1 7 as YF from AppUser union all ' +
    'select top 1 8 as YF from AppUser union all ' +
    'select top 1 9 as YF from AppUser union all ' +
    'select top 1 10 as YF from AppUser union all ' +
    'select top 1 11 as YF from AppUser union all ' +
    'select top 1 12 as YF from AppUser';
  strSqlTj :=
    'select month(M.RQ) as YF, ' +
    'sum(M.SL1 * M.DJ) as JEA, ' +
    'sum(M.SL1 * M.CBDJ) as CBJE, ' +
    'JEA - CBJE as LRJE ' +
    'from (' + GetSqlXsmx(dteRQA, dteRQB, '') + ') M ' +
    'group by month(M.RQ)';
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select Y.YF, B.JEA, B.CBJE, B.LRJE ' +
    'from (' + strSqlYf + ') as Y, (' + strSqlTj + ') as B, ' +
    'Y left join B on Y.YF = B.YF';
  inherited;
end;

procedure TfrmBbXsMlNb.aMxExecute(Sender: TObject);
begin
  frmBbXsMlNbMx := TfrmBbXsMlNbMx.Create(Application);
  with frmBbXsMlNbMx do
  begin
    dteRQ := StrToDate(FormatDateTime('yyyy', self.dteRQ) + '-' +
      dsJbzl.FieldByName('YF').AsString + '-01');
    ShowModal;
    Free;
  end;
end;

end.
