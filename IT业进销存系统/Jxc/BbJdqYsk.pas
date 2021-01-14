unit BbJdqYsk;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbJdqYsk = class(TfrmComTjfx)
    Series1: TPieSeries;
    procedure OpendataSet;override;
    procedure aMxExecute(Sender: TObject);override;
    procedure FormShow(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
    intTS: integer;
  end;

var
  frmBbJdqYsk: TfrmBbJdqYsk;

implementation

uses Dm, DmBb, JdqSz, MyLib;

{$R *.DFM}

procedure TfrmBbJdqYsk.FormShow(Sender: TObject);
begin
  intTS := frmJdqSz.TS1.Value;
  labTj.Caption := IntToStr(intTs) + '天内到期的欠款资料';
  inherited;
end;

procedure TfrmBbJdqYsk.OpendataSet;
begin
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select Z.ID, Z.DJBH, Z.RQ + Z.SKQX as XDRQ, K.BH, K.MC, ' +
    'Z.JE, Z.YSJE, Z.JE - Z.YSJE as MSJE ' +
    'from XSKDZB Z, KH K ' +
    'where Z.KHID = K.ID and Z.ID > 0 and Z.XSLX <> 1 and Z.JE > Z.YSJE and ' +
    'Z.RQ + Z.SKQX >= #' + FormatDateTime('yyyy-mm-dd', Date) + '# and ' +
    '(Z.RQ - #' + FormatDateTime('yyyy-mm-dd', Date) + '# + Z.SKQX + 1) <= ' + IntToStr(intTS) + ' ' +
    'order by Z.RQ + Z.SKQX, Z.DJBH';
  inherited;
end;

procedure TfrmBbJdqYsk.aMxExecute(Sender: TObject);
begin
  OpenXsdd(dsJbzl['ID']);
end;

end.
