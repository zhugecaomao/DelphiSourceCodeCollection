unit BbCkLsz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbCkLsz = class(TfrmComTjfx)
    Series1: TPieSeries;
    Label2: TLabel;
    labCK: TLabel;
    procedure FormShow(Sender: TObject);override;
    procedure OpendataSet;override;
    procedure aMxExecute(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
    intCKID: integer;
    dteRQA, dteRQB: TDate;
  end;

var
  frmBbCkLsz: TfrmBbCkLsz;

implementation

uses Dm, DmBb, MyLib, Common, ComFun, CkRqd;

{$R *.DFM}

procedure TfrmBbCkLsz.FormShow(Sender: TObject);
begin
  intCKID := frmCkRqd.intCKID;
  dteRQA := frmCkRqd.dtpRqa.Date;
  dteRQB := frmCkRqd.dtpRqb.Date;
  labTj.Caption := '查看日期: ' +
    FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  if intCKID <> 0 then
    labCK.Caption := GetFieldValue('select MC from CK where ID = ' + IntToStr(intCKID))
  else
    labCK.Caption := '全部仓库';
  inherited;
end;

procedure TfrmBbCkLsz.OpendataSet;
begin
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select M.LX, M.RQ, M.ZBID, M.DJBH, H.BH, H.PM, H.DW, M.DJ1, M.SL1, M.JE1 ' +
    'from (' + GetSqlJcmx(dteRQA, dteRQB, intCKID, 0) + ') as M, HP H ' +
    'where M.HPID = H.ID ' +
    'order by M.RQ';
  inherited;
end;

procedure TfrmBbCkLsz.aMxExecute(Sender: TObject);
begin
  OpenDj(dsJbzl['LX'], dsJbzl['ZBID']);
end;

end.
