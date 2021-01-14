unit BbCqYsk;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbCqYsk = class(TfrmComTjfx)
    Series1: TPieSeries;
    procedure OpendataSet;override;
    procedure aMxExecute(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBbCqYsk: TfrmBbCqYsk;

implementation

uses Dm, DmBb, Rqdsz, MyLib;

{$R *.DFM}

procedure TfrmBbCqYsk.OpendataSet;
begin
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select Z.ID, Z.DJBH, Z.RQ + Z.SKQX as XDRQ, K.BH, K.MC, ' +
    'Z.JE, Z.YSJE, Z.JE - Z.YSJE as MSJE ' +
    'from XSKDZB Z, KH K ' +
    'where Z.KHID = K.ID and Z.ID > 0 and Z.XSLX <> 1 and Z.JE > Z.YSJE and ' +
    'Z.RQ + Z.SKQX < #' + FormatDateTime('yyyy-mm-dd', Date) + '# ' +
    'order by Z.RQ + Z.SKQX, Z.DJBH';
  inherited;
end;

procedure TfrmBbCqYsk.aMxExecute(Sender: TObject);
begin
  OpenXsdd(dsJbzl['ID']);
end;

end.
