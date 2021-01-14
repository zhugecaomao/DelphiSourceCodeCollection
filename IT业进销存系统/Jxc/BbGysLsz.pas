unit BbGysLsz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbGysLsz = class(TfrmComTjfx)
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
    intGYSID: integer;
    dteRQA, dteRQB: TDate;
  end;

var
  frmBbGysLsz: TfrmBbGysLsz;

implementation

uses Dm, DmBb, MyLib, Common, ComFun, GysRqd;

{$R *.DFM}

procedure TfrmBbGysLsz.FormShow(Sender: TObject);
begin
  intGYSID := frmGysRqd.intGYSID;
  dteRQA := frmGysRqd.dtpRqa.Date;
  dteRQB := frmGysRqd.dtpRqb.Date;
  labTj.Caption := '查看日期: ' +
    FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  with CurDs do
  begin
    CommandText := 'select BH, MC from GYS where ID = ' + Float2Str(intGYSID);
    Open;
    labKHBH.Caption := Fields[0].AsString;
    labKHMC.Caption := Fields[1].AsString;
    Close;
  end;
  strAutoScale := 'DBGrid1';
  inherited;
end;

procedure TfrmBbGysLsz.OpendataSet;
begin
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select M.LX, M.RQ, M.ID, M.DJBH, M.MC1, M.JE, M.BZ ' +
    'from (' + GetSqlGysLsz(dteRQA, dteRQB, intGYSID) + ') as M ' +
    'order by M.RQ';
  inherited;
end;

procedure TfrmBbGysLsz.aMxExecute(Sender: TObject);
begin
  OpenDj(dsJbzl['LX'], dsJbzl['ID']);
end;

end.
