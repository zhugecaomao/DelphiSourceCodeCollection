unit BbYwXsHz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbYwXsHz = class(TfrmComTjfx)
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
  frmBbYwXsHz: TfrmBbYwXsHz;

implementation

uses Dm, DmTjb, Rqdsz, BbHpXsMx;

{$R *.DFM}

{ TfrmBbHpXsHz }

procedure TfrmBbYwXsHz.FormShow(Sender: TObject);
begin
  dteRQA := frmRqdsz.dtpRqa.Date;
  dteRQB := frmRqdsz.dtpRqb.Date;
  labTj.Caption := '统计日期: ' +
    FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  strAutoScale := 'DBGrid1';
  inherited;
end;

procedure TfrmBbYwXsHz.OpendataSet;
var
  strSqlTj: string;
  D1, D2: string;
begin
  D1 := FormatDateTime('yyyy-mm-dd', dteRQA);
  D2 := FormatDateTime('yyyy-mm-dd', dteRQB);
  strSqlTj :=
    'select M.HPID, ' +
    'sum(M.SL) as SL, ' +
    'sum(M.SL * M.DJ) as JEA, ' +
    'sum(M.SL * M.DJ * M.NSL / 100) as JEB, ' +
    'JEA + JEB as JEC ' +
    'from XSKDZB Z, XSKD M ' +
    'where Z.ID = M.ZBID and Z.RQ between  #' + D1 + '# and #' + D2 + '# ' +
    'group by M.HPID';
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select H.ID, H.BH, H.PM, H.DW, B.SL, B.JEA, B.JEB, B.JEC ' +
    'from HP H, (' + strSqlTj + ') as B ' +
    'where H.ID = B.HPID ' +
    'order by H.BH';
  inherited;
end;

procedure TfrmBbYwXsHz.aMxExecute(Sender: TObject);
begin
  frmBbHpXsMx := TfrmBbHpXsMx.Create(Application);
  with frmBbHpXsMx do
  begin
    intHPID := dsJbzl.FieldByName('ID').AsInteger;
    dteRQA := self.dteRQA;
    dteRQB := self.dteRQB;
    ShowModal;
    Free;
  end;
end;

end.
