unit BbHpXsMx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComMx, ActnList, Menus, ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids,
  StdCtrls;

type
  TfrmBbHpXsMx = class(TfrmComMx)
    Label4: TLabel;
    Label5: TLabel;
    labHPBH: TLabel;
    labHPPM: TLabel;
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
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    labHPDW: TLabel;
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
    intHPID: integer;
    dteRQA, dteRQB: TDate;
  end;

var
  frmBbHpXsMx: TfrmBbHpXsMx;

implementation

uses DmBb, Common, ComFun, MyLib;

{$R *.DFM}

procedure TfrmBbHpXsMx.FormShow(Sender: TObject);
begin
  labTj.Caption := FormatDateTime(LongDateFormat, dteRQA) + ' 至 ' +
    FormatDateTime(LongDateFormat, dteRQB);
  with CurDs do
  begin
    CommandText := 'select BH, PM, DW from HP where ID = ' + Float2Str(intHPID);
    Open;
    labHPBH.Caption := Fields[0].AsString;
    labHPPM.Caption := Fields[1].AsString;
    labHPDW.Caption := Fields[2].AsString;
    Close;
  end;
  inherited;
end;

procedure TfrmBbHpXsMx.IniRecord;
begin
  dsMx.CommandText :=
    'select M.LX, M.ZBID, M.RQ, M.DJBH, K.BH, K.MC, M.SL1 as SL, M.DJ, M.NSL, ' +
    'val(format(M.SL1 * M.DJ, ''0.00'')) as JEA, ' +
    'val(format(M.SL1 * M.DJ * M.NSL / 100, ''0.00'')) as JEB, ' +
    'JEA + JEB as JEC ' +
    'from (' + GetSqlXsmx(dteRQA, dteRQB, Format('HPID = %d', [intHPID])) + ') M, KH K ' +
    'where K.ID = M.KHID ' +
    'order by M.RQ, M.DJBH';
  inherited;
end;

procedure TfrmBbHpXsMx.aDjExecute(Sender: TObject);
begin
  OpenDj(dsMx['LX'], dsMx['ZBID']);
end;

procedure TfrmBbHpXsMx.SetButton;
begin
  inherited;
  aDj.Enabled := (aDj.Tag = 0) and not (dsMx.IsEmpty);
end;

procedure TfrmBbHpXsMx.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dsMx.FieldByName('LX').AsString = '销售退货') then
    SetDBGridColor(Sender, Rect, DataCol, Column, State, clRed);
end;

end.
