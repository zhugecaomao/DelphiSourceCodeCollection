unit BbYskMx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComMx, ActnList, Menus, ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids,
  StdCtrls;

type
  TfrmBbYskMx = class(TfrmComMx)
    Label4: TLabel;
    Label5: TLabel;
    labKHBH: TLabel;
    labKHMC: TLabel;
    labTj: TLabel;
    aDj: TAction;
    N1: TMenuItem;
    E1: TMenuItem;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    labJEA: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    labJEB: TLabel;
    Label6: TLabel;
    labQCYE: TLabel;
    Label8: TLabel;
    labQMYE: TLabel;
    procedure IniRecord;override;
    procedure FormShow(Sender: TObject);override;
    procedure SetButton;override;
    procedure aDjExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);override;
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
  frmBbYskMx: TfrmBbYskMx;

implementation

uses DmBb, Common, ComFun, MyLib;

{$R *.DFM}

procedure TfrmBbYskMx.FormShow(Sender: TObject);
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

procedure TfrmBbYskMx.IniRecord;
var
  strSql: string;
  QCYE, QMYE: double;
begin
  dsMx.CommandText :=
    'select M.ZBID, M.RQ, M.LX, M.DJBH, M.JEA, M.JEB, M.JYJE ' +
    'from (' + GetSqlKhwl(dteRQA, dteRQB, intKHID) + ') as M ' +
    'where M.ZBID > 0 ' +
    'order by M.RQ, M.DJBH';
  inherited;
  strSql := 'select sum(JEA - JEB) as QCYE ' +
    'from (' + GetSqlKhwl(0, dteRQA - 1, intKHID) + ') M';
  QCYE := VarToFloat(GetFieldValue(strSql));
  labQCYE.Caption := FormatFloat('#,0.00', QCYE);
  labQMYE.Caption := FormatFloat('#,0.00', QCYE + Str2Float(labJEA.Caption) - Str2Float(labJEB.Caption));
  //JYJE
  QMYE := QCYE;
  with dsMx do
  begin
    while not Eof do
    begin
      QMYE := QMYE + FieldByName('JEA').AsFloat - FieldByName('JEB').AsFloat;
      dsMx.Edit;
      dsMx['JYJE'] := QMYE;
      Next;
    end;
    First;
  end;
end;

procedure TfrmBbYskMx.aDjExecute(Sender: TObject);
begin
  OpenDj(dsMx['LX'], dsMx['ZBID']);
end;

procedure TfrmBbYskMx.SetButton;
begin
  inherited;
  aDj.Enabled := (aDj.Tag = 0) and not (dsMx.IsEmpty);
end;

procedure TfrmBbYskMx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsMx.CancelUpdates;
  inherited;
end;

procedure TfrmBbYskMx.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dsMx.FieldByName('LX').AsString = '销售退货') then
    SetDBGridColor(Sender, Rect, DataCol, Column, State, clRed);
end;

end.
