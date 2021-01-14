unit BbCqYsk1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbCqYsk = class(TfrmComTjfx)
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
  frmBbCqYsk: TfrmBbCqYsk;

implementation

uses Dm, DmBb, Rqdsz, MyLib;

{$R *.DFM}

procedure TfrmBbCqYsk.FormShow(Sender: TObject);
begin
  dteRQA := frmRqdsz.dtpRqa.Date;
  dteRQB := frmRqdsz.dtpRqb.Date;
  labTj.Caption := '日期: ' +
    FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  inherited;
end;

procedure TfrmBbCqYsk.OpendataSet;
begin
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select Z.ID, Z.DJBH, Z.RQ, K.BH, K.MC, Z.JE, ' +
    'iif(Z.ZT, ''中止执行'', iif( ' +
    '( select count(*) from XSDD M ' +
    '  where M.ZBID = Z.ID and val(format((select sum(SL) from XSKD where DDID=M.ZBID and HPID=M.HPID), ''0.000'')) < SL ' +
    ')=0, ''执行完毕'', ''执行中'')) as DDZT ' +
    'from XSDDZB Z, KH K ' +
    'where Z.KHID = K.ID and ' +
    'Z.RQ between  #' + FormatDateTime('yyyy-mm-dd', dteRQA) + '# and #' + FormatDateTime('yyyy-mm-dd', dteRQB) + '# ' +
    'order by Z.RQ, Z.DJBH';
  inherited;
end;

procedure TfrmBbCqYsk.aMxExecute(Sender: TObject);
begin
  OpenXsdd(dsJbzl['ID']);
end;

procedure TfrmBbCqYsk.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dsJbzl.FieldByName('DDZT').AsString = '执行完毕') then
    SetDBGridColor(Sender, Rect, DataCol, Column, State, clBlue);
  if (dsJbzl.FieldByName('DDZT').AsString = '中止执行') then
    SetDBGridColor(Sender, Rect, DataCol, Column, State, clRed);
end;

end.
