unit BbGysGhHz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbGysGhHz = class(TfrmComTjfx)
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
  frmBbGysGhHz: TfrmBbGysGhHz;

implementation

uses Dm, DmBb, Rqdsz, BbGysGhMx, MyLib;

{$R *.DFM}

procedure TfrmBbGysGhHz.FormShow(Sender: TObject);
begin
  dteRQA := frmRqdsz.dtpRqa.Date;
  dteRQB := frmRqdsz.dtpRqb.Date;
  labTj.Caption := '统计日期: ' +
    FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  inherited;
end;

procedure TfrmBbGysGhHz.OpendataSet;
var
  strSqlTj: string;
begin
  strSqlTj :=
    'select M.GYSID, ' +
    'sum(M.SL1 * M.DJ) as JEA, ' +
    'sum(M.SL1 * M.DJ * M.NSL / 100) as JEB, ' +
    'JEA + JEB as JEC ' +
    'from (' + GetSqlCgmx(dteRQA, dteRQB, '') + ') M ' +
    'group by M.GYSID';
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select K.ID, K.BH, K.MC, B.JEA, B.JEB, B.JEC ' +
    'from GYS K, (' + strSqlTj + ') as B ' +
    'where K.ID = B.GYSID ' +
    'order by K.BH';
  inherited;
end;

procedure TfrmBbGysGhHz.aMxExecute(Sender: TObject);
begin
  frmBbGysGhMx := TfrmBbGysGhMx.Create(Application);
  with frmBbGysGhMx do
  begin
    intGYSID := dsJbzl.FieldByName('ID').AsInteger;
    dteRQA := self.dteRQA;
    dteRQB := self.dteRQB;
    ShowModal;
    Free;
  end;
end;

end.
