unit BbYskZbMx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComMx, ActnList, Menus, ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids,
  StdCtrls;

type
  TfrmBbYskZbMx = class(TfrmComMx)
    Label4: TLabel;
    Label5: TLabel;
    labKHBH: TLabel;
    labKHMC: TLabel;
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
    intKHID: integer;
    dteRQA, dteRQB: TDate;
  end;

var
  frmBbYskZbMx: TfrmBbYskZbMx;

implementation

uses DmBb, Common, ComFun, MyLib;

{$R *.DFM}

procedure TfrmBbYskZbMx.FormShow(Sender: TObject);
begin
  labTj.Caption := FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  with CurDs do
  begin
    CommandText := 'select BH, MC from KH where ID = ' + Float2Str(intKHID);
    Open;
    labKHBH.Caption := Fields[0].AsString;
    labKHMC.Caption := Fields[1].AsString;
    Close;
  end;
  inherited;
end;

procedure TfrmBbYskZbMx.IniRecord;
begin
  dsMx.CommandText :=
    'select M.LX, M.ZBID, M.RQ, M.DJBH, H.BH, H.PM, H.DW, M.SL1 as SL, M.DJ, M.NSL, ' +
    'val(format(M.SL1 * M.DJ, ''0.00'')) as JEA, ' +
    'val(format(M.SL1 * M.DJ * M.NSL / 100, ''0.00'')) as JEB, ' +
    'JEA + JEB as JEC ' +
    'from (' + GetSqlXsmx(dteRQA, dteRQB, Format('KHID = %d', [intKHID])) + ') as M, HP H ' +
    'where H.ID = M.HPID ' +
    'order by M.RQ, M.DJBH';
  inherited;
end;

procedure TfrmBbYskZbMx.aDjExecute(Sender: TObject);
begin
  if (dsMx.FieldByName('LX').AsString = '销售退货') then
    OpenXsth(dsMx['ZBID'])
  else
    OpenXskd(dsMx['ZBID']);
end;

procedure TfrmBbYskZbMx.SetButton;
begin
  inherited;
  aDj.Enabled := (aDj.Tag = 0) and not (dsMx.IsEmpty);
end;

procedure TfrmBbYskZbMx.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dsMx.FieldByName('LX').AsString = '销售退货') then
    SetDBGridColor(Sender, Rect, DataCol, Column, State, clRed);
end;

end.
