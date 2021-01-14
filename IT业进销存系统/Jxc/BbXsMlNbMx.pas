unit BbXsMlNbMx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComMx, ActnList, Menus, ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids,
  StdCtrls;

type
  TfrmBbXsMlNbMx = class(TfrmComMx)
    labTj: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    aDj: TAction;
    N1: TMenuItem;
    E1: TMenuItem;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    procedure IniRecord;override;
    procedure FormShow(Sender: TObject);override;
    procedure SetButton;override;
    procedure aDjExecute(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    dteRQ: TDate;
  end;

var
  frmBbXsMlNbMx: TfrmBbXsMlNbMx;

implementation

uses DmBb, Common, ComFun, MyLib;

{$R *.DFM}

procedure TfrmBbXsMlNbMx.FormShow(Sender: TObject);
begin
  labTj.Caption := FormatDateTime('yyyy', dteRQ) + '年' +
    FormatDateTime('mm', dteRQ) + '月';
  inherited;
end;

procedure TfrmBbXsMlNbMx.IniRecord;
var
  dteRQA, dteRQB: TDate;
begin
  dteRQA := BOFM(dteRQ);
  dteRQB := EOFM(dteRQ);
  dsMx.CommandText :=
    'select M.LX, M.ZBID, M.RQ, M.DJBH, H.BH, H.PM, H.DW, M.SL1 as SL, M.DJ, M.CBDJ, ' +
    'val(format(M.SL1 * M.DJ, ''0.00'')) as JEA, ' +
    'val(format(M.SL1 * M.CBDJ, ''0.00'')) as CBJE, ' +
    'JEA - CBJE as LRJE ' +
    'from (' + GetSqlXsmx(dteRQA, dteRQB, '') + ') M, HP H ' +
    'where M.HPID = H.ID ' +
    'order by M.RQ, M.DJBH';
  inherited;
end;

procedure TfrmBbXsMlNbMx.aDjExecute(Sender: TObject);
begin
  OpenDj(dsMx['LX'], dsMx['ZBID']);
end;

procedure TfrmBbXsMlNbMx.SetButton;
begin
  inherited;
  aDj.Enabled := (aDj.Tag = 0) and not (dsMx.IsEmpty);
end;

procedure TfrmBbXsMlNbMx.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dsMx.FieldByName('LX').AsString = '销售退货') then
    SetDBGridColor(Sender, Rect, DataCol, Column, State, clRed);
end;

end.
