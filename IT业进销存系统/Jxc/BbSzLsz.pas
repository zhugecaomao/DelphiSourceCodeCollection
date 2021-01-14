unit BbSzLsz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbSzLsz = class(TfrmComTjfx)
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
  frmBbSzLsz: TfrmBbSzLsz;

implementation

uses Dm, DmBb, Rqdsz, MyLib;

{$R *.DFM}

procedure TfrmBbSzLsz.FormShow(Sender: TObject);
begin
  dteRQA := frmRqdsz.dtpRqa.Date;
  dteRQB := frmRqdsz.dtpRqb.Date;
  labTj.Caption := '查看日期: ' +
    FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  inherited;
end;

procedure TfrmBbSzLsz.OpendataSet;
begin
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select * ' +
    'from (' + GetSqlSzLsz(dteRQA, dteRQB) + ') as M ' +
    'order by M.RQ, M.DJBH';
  inherited;
end;

procedure TfrmBbSzLsz.aMxExecute(Sender: TObject);
begin
  OpenDj(dsJbzl['LX'], dsJbzl['ID']);
end;

end.
