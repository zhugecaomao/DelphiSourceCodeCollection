unit BbYskZlMx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComMx, ActnList, Menus, ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids,
  StdCtrls;

type
  TfrmBbYskZlMx = class(TfrmComMx)
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
    BT1: TLabel;
    TS1: TLabel;
    BT4: TLabel;
    TS4: TLabel;
    BT7: TLabel;
    TS7: TLabel;
    BT2: TLabel;
    TS2: TLabel;
    BT5: TLabel;
    TS5: TLabel;
    BT8: TLabel;
    TS8: TLabel;
    BT3: TLabel;
    TS3: TLabel;
    BT6: TLabel;
    TS6: TLabel;
    BT9: TLabel;
    TS9: TLabel;
    procedure IniRecord;override;
    procedure FormShow(Sender: TObject);override;
    procedure SetButton;override;
    procedure aDjExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    intKHID: integer;
    dteRQ: TDate;
    aTS: array[0..7] of integer;
  end;

var
  frmBbYskZlMx: TfrmBbYskZlMx;

implementation

uses DmBb, Common, ComFun, MyLib;

{$R *.DFM}

procedure TfrmBbYskZlMx.FormShow(Sender: TObject);
var
  i, b, e: integer;
begin
  labTj.Caption := FormatDateTime(LongDateFormat, dteRQ);
  with CurDs do
  begin
    CommandText := 'select BH, MC from KH where ID = ' + Float2Str(intKHID);
    Open;
    labKHBH.Caption := Fields[0].AsString;
    labKHMC.Caption := Fields[1].AsString;
    Close;
  end;
  //title
  b := 1;
  for i := 1 to 7 do
  begin
    e := aTS[I];
    TLabel(FindComponent('BT' + IntToStr(i))).Caption := Format('%d至%d天:', [b, e]);
    b := e + 1;
  end;
  BT8.Caption := Format('%d天以上:', [e]);
  inherited;
end;

procedure TfrmBbYskZlMx.IniRecord;
var
  strSum: string;
begin
  strSum := 'iif(M.TS >= %d and M.TS <= %d ,M.JE1 ,0)';
  with CurDs do
  begin
    CommandText := 
      'select ' +
      'sum(' + Format(StrSum, [aTS[0] + 1, aTS[1]]) + ') as TS1, ' +
      'sum(' + Format(StrSum, [aTS[1] + 1, aTS[2]]) + ') as TS2, ' +
      'sum(' + Format(StrSum, [aTS[2] + 1, aTS[3]]) + ') as TS3, ' +
      'sum(' + Format(StrSum, [aTS[3] + 1, aTS[4]]) + ') as TS4, ' +
      'sum(' + Format(StrSum, [aTS[4] + 1, aTS[5]]) + ') as TS5, ' +
      'sum(' + Format(StrSum, [aTS[5] + 1, aTS[6]]) + ') as TS6, ' +
      'sum(' + Format(StrSum, [aTS[6] + 1, aTS[7]]) + ') as TS7, ' +
      'sum(' + Format(StrSum, [aTS[7] + 1, 999999]) + ') as TS8, ' +
      'TS1 + TS2 + TS3 + TS4 + TS5 + TS6 + TS7 + TS8 as HJ ' +
      'from (' + GetSqlYsmx(dteRQ, intKHID) + ') M';
    Open;
    TS1.Caption := FormatFloat('#,0.00', FieldByName('TS1').AsFloat);
    TS2.Caption := FormatFloat('#,0.00', FieldByName('TS2').AsFloat);
    TS3.Caption := FormatFloat('#,0.00', FieldByName('TS3').AsFloat);
    TS4.Caption := FormatFloat('#,0.00', FieldByName('TS4').AsFloat);
    TS5.Caption := FormatFloat('#,0.00', FieldByName('TS5').AsFloat);
    TS6.Caption := FormatFloat('#,0.00', FieldByName('TS6').AsFloat);
    TS7.Caption := FormatFloat('#,0.00', FieldByName('TS7').AsFloat);
    TS8.Caption := FormatFloat('#,0.00', FieldByName('TS8').AsFloat);
    TS9.Caption := FormatFloat('#,0.00', FieldByName('HJ').AsFloat);
    Close;
  end;
  dsMx.CommandText :=
    'select M.ID as ZBID, M.RQ, M.TS, M.DJBH, ' +
    'M.JE as JEA, M.YSJE as JEB, M.JE1 as JEC ' +
    'from (' + GetSqlYsmx(dteRQ, intKHID) + ') as M ' +
    'order by M.RQ, M.DJBH';
  inherited;
end;

procedure TfrmBbYskZlMx.aDjExecute(Sender: TObject);
begin
  OpenDj('挂帐销售', dsMx['ZBID']);
end;

procedure TfrmBbYskZlMx.SetButton;
begin
  inherited;
  aDj.Enabled := (aDj.Tag = 0) and not (dsMx.IsEmpty);
end;

end.
