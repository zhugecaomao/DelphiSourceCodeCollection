unit BbHpCgHz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbHpCgHz = class(TfrmComTjfx)
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
  frmBbHpCgHz: TfrmBbHpCgHz;

implementation

uses Dm, DmBb, Rqdsz, BbHpCgMx, MyLib;

{$R *.DFM}

procedure TfrmBbHpCgHz.FormShow(Sender: TObject);
begin
  dteRQA := frmRqdsz.dtpRqa.Date;
  dteRQB := frmRqdsz.dtpRqb.Date;
  labTj.Caption := '统计日期: ' +
    FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  strAutoScale := 'DBGrid1';
  inherited;
end;

procedure TfrmBbHpCgHz.OpendataSet;
var
  strSqlTj: string;
begin
  strSqlTj :=
    'select M.HPID, ' +
    'sum(M.SL1) as SL, ' +
    'sum(M.SL1 * M.DJ) as JEA, ' +
    'sum(M.SL1 * M.DJ * M.NSL / 100) as JEB, ' +
    'JEA + JEB as JEC ' +
    'from (' + GetSqlCgmx(dteRQA, dteRQB, '') + ') M ' +
    'group by M.HPID';
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select H.ID, H.BH, H.PM, H.DW, B.SL, B.JEA, B.JEB, B.JEC ' +
    'from HP H, (' + strSqlTj + ') as B ' +
    'where H.ID = B.HPID ' +
    'order by H.BH';
  inherited;
end;

procedure TfrmBbHpCgHz.aMxExecute(Sender: TObject);
begin
  frmBbHpCgMx := TfrmBbHpCgMx.Create(Application);
  with frmBbHpCgMx do
  begin
    intHPID := dsJbzl.FieldByName('ID').AsInteger;
    dteRQA := self.dteRQA;
    dteRQB := self.dteRQB;
    ShowModal;
    Free;
  end;
end;

end.
