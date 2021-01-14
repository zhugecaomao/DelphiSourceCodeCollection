unit BbHpCwb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series, db;

type
  TfrmBbHpCwb = class(TfrmComTjfx)
    Series1: TPieSeries;
    procedure OpendataSet;override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBbHpCwb: TfrmBbHpCwb;

implementation

uses Dm, DmBb, MyLib, Common;

{$R *.DFM}

procedure TfrmBbHpCwb.OpendataSet;
var
  i: integer;
begin
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'transform iif(isnull(sum(K.JCS)),0,sum(K.JCS)) ' +
    'select H.BH, L.MC as HPLBMC, H.PM, H.DW, Z.ZKCL ' +
    'from HPKC K, HP H, HPLB L, ' +
    '(select HPID, sum(JCS) as ZKCL from HPKC where JCS <> 0 group by HPID) Z ' +
    'where K.HPID = H.ID and H.HPLBID = L.ID and Z.HPID = H.ID and K.JCS <> 0 ' +
    'group by K.HPID, H.BH, L.MC, H.PM, H.DW, Z.ZKCL ' +
    'order by H.BH ' +
    'pivot K.CKID';
  inherited;
  with DBGrid1 do
    for i := 0 to Columns.Count - 1 do
    begin
      Columns[i].Title.Alignment := taCenter;
      //Title.Caption
      if Columns[i].FieldName = 'BH' then
        Columns[i].Title.Caption := '编号'
      else if Columns[i].FieldName = 'HPLBMC' then
        Columns[i].Title.Caption := '类别'
      else if Columns[i].FieldName = 'PM' then
        Columns[i].Title.Caption := '品名规格'
      else if Columns[i].FieldName = 'DW' then
        Columns[i].Title.Caption := '单位'
      else if Columns[i].FieldName = 'ZKCL' then
        Columns[i].Title.Caption := '总库存量'
      else
      begin
        Columns[i].Title.Caption := GetFieldValue('select MC from CK where ID = ' + Columns[i].Title.Caption);
        dsJbzl.FieldByName(Columns[i].FieldName).Tag := 1;
        TNumericField(dsJbzl.FieldByName(Columns[i].FieldName)).DisplayFormat :=
          '#,0.###';
      end;
      //Width
      if Columns[i].FieldName = 'BH' then
        Columns[i].Width := 102;
      if Columns[i].FieldName = 'HPLBMC' then
        Columns[i].Width := 102;
      if Columns[i].FieldName = 'PM' then
        Columns[i].Width := 268;
    end;
    DBGrid1.Columns[4].Index := DBGrid1.Columns.Count - 1;
    dsJbzl.FieldByName('ZKCL').Tag := 1;
end;

end.
