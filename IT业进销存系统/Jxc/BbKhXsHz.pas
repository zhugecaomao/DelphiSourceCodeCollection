unit BbKhXsHz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbKhXsHz = class(TfrmComTjfx)
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
  frmBbKhXsHz: TfrmBbKhXsHz;

implementation

uses Dm, DmBb, Rqdsz, BbKhXsMx, MyLib;

{$R *.DFM}

procedure TfrmBbKhXsHz.FormShow(Sender: TObject);
begin
  dteRQA := frmRqdsz.dtpRqa.Date;
  dteRQB := frmRqdsz.dtpRqb.Date;
  labTj.Caption := '统计日期: ' +
    FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  inherited;
end;

procedure TfrmBbKhXsHz.OpendataSet;
var
  strSqlTj: string;
begin
  strSqlTj :=
    'select M.KHID, ' +
    'sum(M.SL1 * M.DJ) as JEA, ' +
    'sum(M.SL1 * M.DJ * M.NSL / 100) as JEB, ' +
    'JEA + JEB as JEC ' +
    'from (' + GetSqlXsmx(dteRQA, dteRQB, '') + ') M ' +
    'group by M.KHID';
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select K.ID, K.BH, K.MC, B.JEA, B.JEB, B.JEC ' +
    'from KH K, (' + strSqlTj + ') as B ' +
    'where K.ID = B.KHID ' +
    'order by K.BH';
  inherited;
end;

procedure TfrmBbKhXsHz.aMxExecute(Sender: TObject);
begin
  frmBbKhXsMx := TfrmBbKhXsMx.Create(Application);
  with frmBbKhXsMx do
  begin
    intKHID := dsJbzl.FieldByName('ID').AsInteger;
    dteRQA := self.dteRQA;
    dteRQB := self.dteRQB;
    ShowModal;
    Free;
  end;
end;

end.
