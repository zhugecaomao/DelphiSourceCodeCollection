unit BbXsMlAdjs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbXsMlAdjs = class(TfrmComTjfx)
    Series1: TPieSeries;
    procedure FormShow(Sender: TObject);override;
    procedure OpendataSet;override;
    procedure aMxExecute(Sender: TObject);override;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    dteRQA, dteRQB: TDate;
  end;

var
  frmBbXsMlAdjs: TfrmBbXsMlAdjs;

implementation

uses Dm, DmBb, Rqdsz, BbKhXsMx, MyLib;

{$R *.DFM}

procedure TfrmBbXsMlAdjs.FormShow(Sender: TObject);
begin
  dteRQA := frmRqdsz.dtpRqa.Date;
  dteRQB := frmRqdsz.dtpRqb.Date;
  labTj.Caption := '查看日期: ' +
    FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  inherited;
end;

procedure TfrmBbXsMlAdjs.OpendataSet;
var
  strSqlTj: string;
begin
  strSqlTj :=
    'select M.LX, M.ZBID, M.RQ, M.DJBH, M.KHID, ' +
    'sum(M.SL1 * M.DJ) as JEA, ' +
    'sum(M.SL1 * M.CBDJ) as CBJE, ' +
    'JEA - CBJE as LRJE ' +
    'from (' + GetSqlXsmx(dteRQA, dteRQB, '') + ') M ' +
    'group by M.LX, M.ZBID, M.RQ, M.DJBH, M.KHID ';
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select M.LX, M.ZBID, M.RQ, M.DJBH, K.BH, K.MC, M.JEA, M.CBJE, M.LRJE ' +
    'from (' + strSqlTj + ') as M, KH K ' +
    'where K.ID = M.KHID ' +
    'order by M.RQ, M.DJBH';
  inherited;
end;

procedure TfrmBbXsMlAdjs.aMxExecute(Sender: TObject);
begin
  OpenDj(dsJbzl['LX'], dsJbzl['ZBID']);
end;

procedure TfrmBbXsMlAdjs.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dsJbzl.FieldByName('LX').AsString = '销售退货') then
    SetDBGridColor(Sender, Rect, DataCol, Column, State, clRed);
end;

end.
