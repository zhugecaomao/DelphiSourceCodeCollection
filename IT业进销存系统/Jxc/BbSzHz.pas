unit BbSzHz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbSzHz = class(TfrmComTjfx)
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
  frmBbSzHz: TfrmBbSzHz;

implementation

uses Dm, DmBb, Rqdsz, BbSzMx, MyLib;

{$R *.DFM}

procedure TfrmBbSzHz.FormShow(Sender: TObject);
begin
  dteRQA := frmRqdsz.dtpRqa.Date;
  dteRQB := frmRqdsz.dtpRqb.Date;
  labTj.Caption := '统计日期: ' +
    FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  strAutoScale := 'DBGrid1';
  inherited;
end;

procedure TfrmBbSzHz.OpendataSet;
var
  strSqlTj: string;
begin
  strSqlTj :=
    'select M.SRZCLBID, ' +
    'sum(M.JEA) as JEA1, ' +
    'sum(M.JEB) as JEB1 ' +
    'from (' + GetSqlSzmx(dteRQA, dteRQB, 0) + ') M ' +
    'group by M.SRZCLBID';
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select L.ID, L.BH, L.MC, B.JEA1 as JEA, B.JEB1 as JEB ' +
    'from SRZCLB L, (' + strSqlTj + ') as B ' +
    'where L.ID = B.SRZCLBID ' +
    'order by L.BH';
  inherited;
end;

procedure TfrmBbSzHz.aMxExecute(Sender: TObject);
begin
  frmBbSzMx := TfrmBbSzMx.Create(Application);
  with frmBbSzMx do
  begin
    intSRZCLBID := dsJbzl.FieldByName('ID').AsInteger;
    dteRQA := self.dteRQA;
    dteRQB := self.dteRQB;
    ShowModal;
    Free;
  end;
end;

end.
