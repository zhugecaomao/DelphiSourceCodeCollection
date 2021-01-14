unit BbCgddQk;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbCgddQk = class(TfrmComTjfx)
    Series1: TPieSeries;
    Shape1: TShape;
    Label2: TLabel;
    Shape2: TShape;
    Label3: TLabel;
    Shape3: TShape;
    Label4: TLabel;
    Label5: TLabel;
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
  frmBbCgddQk: TfrmBbCgddQk;

implementation

uses Dm, DmBb, Rqdsz, MyLib;

{$R *.DFM}

procedure TfrmBbCgddQk.FormShow(Sender: TObject);
begin
  dteRQA := frmRqdsz.dtpRqa.Date;
  dteRQB := frmRqdsz.dtpRqb.Date;
  labTj.Caption := '日期: ' +
    FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  inherited;
end;

procedure TfrmBbCgddQk.OpendataSet;
begin
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select Z.ID, Z.DJBH, Z.RQ, K.BH, K.MC, Z.JE, ' +
    'iif(Z.ZT, ''中止执行'', iif( ' +
    '( select count(*) from CGDD M ' +
    '  where M.ZBID = Z.ID and val(format((select sum(SL) from CGSH where DDID=M.ZBID and HPID=M.HPID), ''0.000'')) < SL ' +
    ')=0, ''执行完毕'', ''执行中'')) as DDZT ' +
    'from CGDDZB Z, GYS K ' +
    'where Z.GYSID = K.ID and ' +
    'Z.RQ between  #' + FormatDateTime('yyyy-mm-dd', dteRQA) + '# and #' + FormatDateTime('yyyy-mm-dd', dteRQB) + '# ' +
    'order by Z.RQ, Z.DJBH';
  inherited;
end;

procedure TfrmBbCgddQk.aMxExecute(Sender: TObject);
begin
  OpenCgdd(dsJbzl['ID']);
end;

procedure TfrmBbCgddQk.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dsJbzl.FieldByName('DDZT').AsString = '执行完毕') then
    SetDBGridColor(Sender, Rect, DataCol, Column, State, clBlue);
  if (dsJbzl.FieldByName('DDZT').AsString = '中止执行') then
    SetDBGridColor(Sender, Rect, DataCol, Column, State, clRed);
end;

end.
