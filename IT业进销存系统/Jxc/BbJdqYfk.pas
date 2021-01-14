unit BbJdqYfk;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbJdqYfk = class(TfrmComTjfx)
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
  frmBbJdqYfk: TfrmBbJdqYfk;

implementation

uses Dm, DmBb, JdqSz, MyLib;

{$R *.DFM}

procedure TfrmBbJdqYfk.FormShow(Sender: TObject);
begin
  intTS := frmJdqSz.TS1.Value;
  labTj.Caption := IntToStr(intTs) + '天内到期的欠款资料';
  inherited;
end;

procedure TfrmBbJdqYfk.OpendataSet;
begin
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select Z.ID, Z.DJBH, Z.RQ + Z.FKQX as XDRQ, K.BH, K.MC, ' +
    'Z.JE, Z.YFJE, Z.JE - Z.YFJE as MFJE ' +
    'from CGSHZB Z, GYS K ' +
    'where Z.GYSID = K.ID and Z.ID > 0 and Z.CGLX <> 1 and Z.JE > Z.YFJE and ' +
    'Z.RQ + Z.FKQX >= #' + FormatDateTime('yyyy-mm-dd', Date) + '# and ' +
    '(Z.RQ - #' + FormatDateTime('yyyy-mm-dd', Date) + '# + Z.FKQX + 1) <= ' + IntToStr(intTS) + ' ' +
    'order by Z.RQ + Z.FKQX, Z.DJBH';
  inherited;
end;

procedure TfrmBbJdqYfk.aMxExecute(Sender: TObject);
begin
  OpenXsdd(dsJbzl['ID']);
end;

end.
