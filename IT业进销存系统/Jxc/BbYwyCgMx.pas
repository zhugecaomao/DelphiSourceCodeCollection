unit BbYwyCgMx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComMx, ActnList, Menus, ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids,
  StdCtrls;

type
  TfrmBbYwyCgMx = class(TfrmComMx)
    Label5: TLabel;
    labYWY: TLabel;
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
    strYWY: string;
    dteRQA, dteRQB: TDate;
  end;

var
  frmBbYwyCgMx: TfrmBbYwyCgMx;

implementation

uses DmBb, Common, ComFun, MyLib;

{$R *.DFM}

procedure TfrmBbYwyCgMx.FormShow(Sender: TObject);
begin
  labTj.Caption := FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  if strYWY = '' then
    labYWY.Caption := '其他'
  else
    labYWY.Caption := strYWY;
  inherited;
end;

procedure TfrmBbYwyCgMx.IniRecord;
begin
  dsMx.CommandText :=
    'select M.LX, M.ZBID, M.RQ, M.DJBH, K.BH, K.MC, ' +
    'sum(val(format(M.SL1 * M.DJ, ''0.00''))) as JEA, ' +
    'sum(val(format(M.SL1 * M.DJ * M.NSL / 100, ''0.00''))) as JEB, ' +
    'JEA + JEB as JEC ' +
    'from (' + GetSqlCgmx(dteRQA, dteRQB, Format('YWY = ''%s''', [strYWY])) + ') M, GYS K ' +
    'where K.ID = M.GYSID ' +
    'group by M.LX, M.ZBID, M.RQ, M.DJBH, K.BH, K.MC ' +
    'order by M.RQ, M.DJBH';
  inherited;
end;

procedure TfrmBbYwyCgMx.aDjExecute(Sender: TObject);
begin
  OpenDj(dsMx['LX'], dsMx['ZBID']);
end;

procedure TfrmBbYwyCgMx.SetButton;
begin
  inherited;
  aDj.Enabled := (aDj.Tag = 0) and not (dsMx.IsEmpty);
end;

procedure TfrmBbYwyCgMx.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dsMx.FieldByName('LX').AsString = '采购退货') then
    SetDBGridColor(Sender, Rect, DataCol, Column, State, clRed);
end;

end.
