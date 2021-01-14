unit BbDqXsHz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbDqXsHz = class(TfrmComTjfx)
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
  frmBbDqXsHz: TfrmBbDqXsHz;

implementation

uses Dm, DmBb, Rqdsz, BbDqXsMx, MyLib;

{$R *.DFM}

procedure TfrmBbDqXsHz.FormShow(Sender: TObject);
begin
  dteRQA := frmRqdsz.dtpRqa.Date;
  dteRQB := frmRqdsz.dtpRqb.Date;
  labTj.Caption := '统计日期: ' +
    FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  inherited;
end;

procedure TfrmBbDqXsHz.OpendataSet;
begin
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select M.DQMC as MC, ' +
    'sum(M.SL1 * M.DJ) as JEA, ' +
    'sum(M.SL1 * M.DJ * M.NSL / 100) as JEB, ' +
    'JEA + JEB as JEC ' +
    'from (' + GetSqlXsmx(dteRQA, dteRQB, '') + ') M ' +
    'group by M.DQMC';
  inherited;
end;

procedure TfrmBbDqXsHz.aMxExecute(Sender: TObject);
begin
  frmBbDqXsMx := TfrmBbDqXsMx.Create(Application);
  with frmBbDqXsMx do
  begin
    strMC := dsJbzl.FieldByName('MC').AsString;
    dteRQA := self.dteRQA;
    dteRQB := self.dteRQB;
    ShowModal;
    Free;
  end;
end;

end.
