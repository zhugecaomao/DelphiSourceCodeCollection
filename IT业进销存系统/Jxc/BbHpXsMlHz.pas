unit BbHpXsMlHz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbHpXsMlHz = class(TfrmComTjfx)
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
  frmBbHpXsMlHz: TfrmBbHpXsMlHz;

implementation

uses Dm, DmBb, Rqdsz, BbHpXsMlMx, MyLib;

{$R *.DFM}

procedure TfrmBbHpXsMlHz.FormShow(Sender: TObject);
begin
  dteRQA := frmRqdsz.dtpRqa.Date;
  dteRQB := frmRqdsz.dtpRqb.Date;
  labTj.Caption := '统计日期: ' +
    FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  strAutoScale := 'DBGrid1';
  inherited;
end;

procedure TfrmBbHpXsMlHz.OpendataSet;
var
  strSqlTj: string;
begin
  strSqlTj :=
    'select M.HPID, ' +
    'sum(M.SL1 * M.DJ) as JEA, ' +
    'sum(M.SL1 * M.CBDJ) as CBJE, ' +
    'JEA - CBJE as LRJE ' +
    'from (' + GetSqlXsmx(dteRQA, dteRQB, '') + ') M ' +
    'group by M.HPID';
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select H.ID, H.BH, H.PM, H.DW, B.JEA, B.CBJE, B.LRJE ' +
    'from HP H, (' + strSqlTj + ') as B ' +
    'where H.ID = B.HPID ' +
    'order by H.BH';
  inherited;
end;

procedure TfrmBbHpXsMlHz.aMxExecute(Sender: TObject);
begin
  frmBbHpXsMlMx := TfrmBbHpXsMlMx.Create(Application);
  with frmBbHpXsMlMx do
  begin
    intHPID := dsJbzl.FieldByName('ID').AsInteger;
    dteRQA := self.dteRQA;
    dteRQB := self.dteRQB;
    ShowModal;
    Free;
  end;
end;

end.
