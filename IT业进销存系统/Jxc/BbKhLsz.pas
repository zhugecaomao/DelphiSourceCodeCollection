unit BbKhLsz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbKhLsz = class(TfrmComTjfx)
    Series1: TPieSeries;
    Label2: TLabel;
    labKHBH: TLabel;
    Label4: TLabel;
    labKHMC: TLabel;
    procedure FormShow(Sender: TObject);override;
    procedure OpendataSet;override;
    procedure aMxExecute(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
    intKHID: integer;
    dteRQA, dteRQB: TDate;
  end;

var
  frmBbKhLsz: TfrmBbKhLsz;

implementation

uses Dm, DmBb, MyLib, Common, ComFun, KhRqd;

{$R *.DFM}

procedure TfrmBbKhLsz.FormShow(Sender: TObject);
begin
  intKHID := frmKhRqd.intKHID;
  dteRQA := frmKhRqd.dtpRqa.Date;
  dteRQB := frmKhRqd.dtpRqb.Date;
  labTj.Caption := '查看日期: ' +
    FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  with CurDs do
  begin
    CommandText := 'select BH, MC from KH where ID = ' + Float2Str(intKHID);
    Open;
    labKHBH.Caption := Fields[0].AsString;
    labKHMC.Caption := Fields[1].AsString;
    Close;
  end;
  strAutoScale := 'DBGrid1';
  inherited;
end;

procedure TfrmBbKhLsz.OpendataSet;
begin
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select M.LX, M.RQ, M.ID, M.DJBH, M.MC1, M.JE, M.BZ ' +
    'from (' + GetSqlKhLsz(dteRQA, dteRQB, intKHID) + ') as M ' +
    'order by M.RQ';
  inherited;
end;

procedure TfrmBbKhLsz.aMxExecute(Sender: TObject);
begin
  OpenDj(dsJbzl['LX'], dsJbzl['ID']);
end;

end.
