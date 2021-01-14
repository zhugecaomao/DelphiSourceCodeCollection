unit BbCgMfdj;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbCgMfdj = class(TfrmComTjfx)
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
  frmBbCgMfdj: TfrmBbCgMfdj;

implementation

uses Dm, DmBb, Rqdsz, MyLib;

{$R *.DFM}

procedure TfrmBbCgMfdj.FormShow(Sender: TObject);
begin
  dteRQA := frmRqdsz.dtpRqa.Date;
  dteRQB := frmRqdsz.dtpRqb.Date;
  labTj.Caption := 'ÈÕÆÚ: ' +
    FormatDateTime(LongDateFormat, dteRQA) + ' ÖÁ ' +
    FormatDateTime(LongDateFormat, dteRQB);
  inherited;
end;

procedure TfrmBbCgMfdj.OpendataSet;
begin
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select Z.ID, Z.DJBH, Z.RQ, K.BH, K.MC, ' +
    'Z.JE as JEA, Z.YFJE as JEB, JEA - JEB as JEC ' +
    'from CGSHZB Z, GYS K ' +
    'where Z.CGLX = 2 and Z.GYSID = K.ID and Z.YFJE < Z.JE and ' +
    'Z.RQ between  #' + FormatDateTime('yyyy-mm-dd', dteRQA) + '# and #' + FormatDateTime('yyyy-mm-dd', dteRQB) + '# ' +
    'order by Z.RQ, Z.DJBH';
  inherited;
end;

procedure TfrmBbCgMfdj.aMxExecute(Sender: TObject);
begin
  OpenCgsh(dsJbzl['ID']);
end;

end.
