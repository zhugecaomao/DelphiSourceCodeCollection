unit BbCqYfk;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbCqYfk = class(TfrmComTjfx)
    Series1: TPieSeries;
    procedure OpendataSet;override;
    procedure aMxExecute(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBbCqYfk: TfrmBbCqYfk;

implementation

uses Dm, DmBb, Rqdsz, MyLib;

{$R *.DFM}

procedure TfrmBbCqYfk.OpendataSet;
begin
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select Z.ID, Z.DJBH, Z.RQ + Z.FKQX as XDRQ, K.BH, K.MC, ' +
    'Z.JE, Z.YFJE, Z.JE - Z.YFJE as MFJE ' +
    'from CGSHZB Z, GYS K ' +
    'where Z.GYSID = K.ID and Z.ID > 0 and Z.CGLX <> 1 and Z.JE > Z.YFJE and ' +
    'Z.RQ + Z.FKQX < #' + FormatDateTime('yyyy-mm-dd', Date) + '# ' +
    'order by Z.RQ + Z.FKQX, Z.DJBH';
  inherited;
end;

procedure TfrmBbCqYfk.aMxExecute(Sender: TObject);
begin
  OpenXsdd(dsJbzl['ID']);
end;

end.
