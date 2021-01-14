unit BbXjyhMx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComMx, ActnList, Menus, ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids,
  StdCtrls;

type
  TfrmBbXjyhMx = class(TfrmComMx)
    Label4: TLabel;
    Label5: TLabel;
    labMC: TLabel;
    labYHZH: TLabel;
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
  private
    { Private declarations }
    QCYE: double;
  public
    { Public declarations }
    intZHID: integer;
    dteRQA, dteRQB: TDate;
  end;

var
  frmBbXjyhMx: TfrmBbXjyhMx;

implementation

uses DmBb, Common, ComFun, MyLib;

{$R *.DFM}

procedure TfrmBbXjyhMx.FormShow(Sender: TObject);
begin
  labTj.Caption := FormatDateTime(LongDateFormat, dteRQA) + ' жа ' +
    FormatDateTime(LongDateFormat, dteRQB);
  with CurDs do
  begin
    CommandText := 'select MC, YHZH, QCJE from ZH where ID = ' + Float2Str(intZHID);
    Open;
    labMC.Caption := Fields[0].AsString;
    labYHZH.Caption := Fields[1].AsString;
    QCYE := Fields[2].AsFloat;
    Close;
  end;
  inherited;
end;

procedure TfrmBbXjyhMx.IniRecord;
var
  strSql: string;
  QMYE: double;
begin
  dsMx.CommandText :=
    'select M.ID, M.RQ, M.LX, M.DJBH, M.JEA, M.JEB, M.JYJE ' +
    'from (' + GetSqlZhmx(dteRQA, dteRQB, intZHID) + ') as M ' +
    'order by M.RQ, M.DJBH';
  inherited;
  strSql := 'select sum(JEA - JEB) as QCYE ' +
    'from (' + GetSqlZhmx(0, dteRQA - 1, intZHID) + ') M';
  QCYE := QCYE + VarToFloat(GetFieldValue(strSql));
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

procedure TfrmBbXjyhMx.aDjExecute(Sender: TObject);
begin
  OpenDj(dsMx['LX'], dsMx['ID']);
end;

procedure TfrmBbXjyhMx.SetButton;
begin
  inherited;
  aDj.Enabled := (aDj.Tag = 0) and not (dsMx.IsEmpty);
end;

procedure TfrmBbXjyhMx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsMx.CancelUpdates;
  inherited;
end;

end.
