unit BbHplbXsHz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbHplbXsHz = class(TfrmComTjfx)
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
  frmBbHplbXsHz: TfrmBbHplbXsHz;

implementation

uses Dm, DmBb, Rqdsz, BbHplbXsMx, MyLib;

{$R *.DFM}

procedure TfrmBbHplbXsHz.FormShow(Sender: TObject);
begin
  dteRQA := frmRqdsz.dtpRqa.Date;
  dteRQB := frmRqdsz.dtpRqb.Date;
  labTj.Caption := '统计日期: ' +
    FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  inherited;
end;

procedure TfrmBbHplbXsHz.OpendataSet;
var
  D1, D2: string;
begin
  D1 := FormatDateTime('yyyy-mm-dd', dteRQA);
  D2 := FormatDateTime('yyyy-mm-dd', dteRQB);
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select M.HPLBMC as MC, ' +
    'sum(M.SL1 * M.DJ) as JEA, ' +
    'sum(M.SL1 * M.DJ * M.NSL / 100) as JEB, ' +
    'JEA + JEB as JEC ' +
    'from (' + GetSqlXsmx(dteRQA, dteRQB, '') + ') M ' +
    'group by M.HPLBMC';
  inherited;
end;

procedure TfrmBbHplbXsHz.aMxExecute(Sender: TObject);
begin
  frmBbHplbXsMx := TfrmBbHplbXsMx.Create(Application);
  with frmBbHplbXsMx do
  begin
    strMC := dsJbzl.FieldByName('MC').AsString;
    dteRQA := self.dteRQA;
    dteRQB := self.dteRQB;
    ShowModal;
    Free;
  end;
end;

end.
