unit BbYwyXsHz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbYwyXsHz = class(TfrmComTjfx)
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
  frmBbYwyXsHz: TfrmBbYwyXsHz;

implementation

uses Dm, DmBb, Rqdsz, BbYwyXsMx, MyLib;

{$R *.DFM}

procedure TfrmBbYwyXsHz.FormShow(Sender: TObject);
begin
  dteRQA := frmRqdsz.dtpRqa.Date;
  dteRQB := frmRqdsz.dtpRqb.Date;
  labTj.Caption := '统计日期: ' +
    FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  inherited;
end;

procedure TfrmBbYwyXsHz.OpendataSet;
var
  D1, D2: string;
begin
  D1 := FormatDateTime('yyyy-mm-dd', dteRQA);
  D2 := FormatDateTime('yyyy-mm-dd', dteRQB);
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select M.YWY, ' +
    'sum(M.SL1 * M.DJ) as JEA, ' +
    'sum(M.SL1 * M.DJ * M.NSL / 100) as JEB, ' +
    'JEA + JEB as JEC ' +
    'from (' + GetSqlXsmx(dteRQA, dteRQB, '') + ') M ' +
    'group by M.YWY ' +
    'order by M.YWY';
  inherited;
end;

procedure TfrmBbYwyXsHz.aMxExecute(Sender: TObject);
begin
  frmBbYwyXsMx := TfrmBbYwyXsMx.Create(Application);
  with frmBbYwyXsMx do
  begin
    strYWY := dsJbzl.FieldByName('YWY').AsString;
    dteRQA := self.dteRQA;
    dteRQB := self.dteRQB;
    ShowModal;
    Free;
  end;
end;

end.
