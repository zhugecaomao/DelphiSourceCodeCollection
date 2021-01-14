unit BbXsMsdj;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbXsMsdj = class(TfrmComTjfx)
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
  frmBbXsMsdj: TfrmBbXsMsdj;

implementation

uses Dm, DmBb, Rqdsz, MyLib;

{$R *.DFM}

procedure TfrmBbXsMsdj.FormShow(Sender: TObject);
begin
  dteRQA := frmRqdsz.dtpRqa.Date;
  dteRQB := frmRqdsz.dtpRqb.Date;
  labTj.Caption := 'ÈÕÆÚ: ' +
    FormatDateTime(LongDateFormat, dteRQA) + ' ÖÁ ' +
    FormatDateTime(LongDateFormat, dteRQB);
  inherited;
end;

procedure TfrmBbXsMsdj.OpendataSet;
begin
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select Z.ID, Z.DJBH, Z.RQ, K.BH, K.MC, ' +
    'Z.JE as JEA, Z.YSJE as JEB, JEA - JEB as JEC ' +
    'from XSKDZB Z, KH K ' +
    'where Z.XSLX = 2 and Z.KHID = K.ID and Z.YSJE < Z.JE and ' +
    'Z.RQ between  #' + FormatDateTime('yyyy-mm-dd', dteRQA) + '# and #' + FormatDateTime('yyyy-mm-dd', dteRQB) + '# ' +
    'order by Z.RQ, Z.DJBH';
  inherited;
end;

procedure TfrmBbXsMsdj.aMxExecute(Sender: TObject);
begin
  OpenXskd(dsJbzl['ID']);
end;

end.
