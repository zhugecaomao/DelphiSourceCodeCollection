unit BbYskZlfx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComTjfx, ActnList, Menus, TeeProcs, TeEngine, Chart, DBChart, ComCtrls,
  DBCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, DBGrids, Series;

type
  TfrmBbYskZlfx = class(TfrmComTjfx)
    Series1: TPieSeries;
    procedure FormShow(Sender: TObject);override;
    procedure OpendataSet;override;
    procedure aMxExecute(Sender: TObject);override;
    procedure aTotalExecute(Sender: TObject);override;
    procedure aFxtExecute(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
    dteRQ: TDate;
    aTS: array[0..7] of integer;
  end;

var
  frmBbYskZlfx: TfrmBbYskZlfx;

implementation

uses Dm, DmBb, ZlfxSz, ZlfxTj, BbYskZlMx, MyLib;

{$R *.DFM}

procedure TfrmBbYskZlfx.FormShow(Sender: TObject);
var
  i, b, e: integer;
begin
  dteRQ := frmZlfxSz.dtpRq.Date;
  aTS[0] := 0;
  aTS[1] := StrToInt(frmZlfxSz.TS1.Text);
  aTS[2] := StrToInt(frmZlfxSz.TS2.Text);
  aTS[3] := StrToInt(frmZlfxSz.TS3.Text);
  aTS[4] := StrToInt(frmZlfxSz.TS4.Text);
  aTS[5] := StrToInt(frmZlfxSz.TS5.Text);
  aTS[6] := StrToInt(frmZlfxSz.TS6.Text);
  aTS[7] := StrToInt(frmZlfxSz.TS7.Text);
  labTj.Caption := '截止日期: ' + FormatDateTime(LongDateFormat, dteRQ);
  //title
  b := 1;
  for i := 1 to 7 do
  begin
    e := aTS[I];
    DBGrid1.Columns[i + 1].Title.Caption := Format('%d至%d天', [b, e]);
    b := e + 1;
  end;
  DBGrid1.Columns[9].Title.Caption := Format('%d天以上', [e]);
  inherited;
end;

procedure TfrmBbYskZlfx.OpendataSet;
var
  strSum, strSqlTj: string;
begin
  strSum := 'iif(M.TS >= %d and M.TS <= %d ,M.JE1 ,0)';
  strSqlTj :=
    'select M.KHID, ' +
    'sum(' + Format(StrSum, [aTS[0] + 1, aTS[1]]) + ') as TS1, ' +
    'sum(' + Format(StrSum, [aTS[1] + 1, aTS[2]]) + ') as TS2, ' +
    'sum(' + Format(StrSum, [aTS[2] + 1, aTS[3]]) + ') as TS3, ' +
    'sum(' + Format(StrSum, [aTS[3] + 1, aTS[4]]) + ') as TS4, ' +
    'sum(' + Format(StrSum, [aTS[4] + 1, aTS[5]]) + ') as TS5, ' +
    'sum(' + Format(StrSum, [aTS[5] + 1, aTS[6]]) + ') as TS6, ' +
    'sum(' + Format(StrSum, [aTS[6] + 1, aTS[7]]) + ') as TS7, ' +
    'sum(' + Format(StrSum, [aTS[7] + 1, 999999]) + ') as TS8, ' +
    'TS1 + TS2 + TS3 + TS4 + TS5 + TS6 + TS7 + TS8 as HJ ' +
    'from (' + GetSqlYsmx(dteRQ, 0) + ') M ' +
    'group by M.KHID';
  dsJbzl.Close;
  dsJbzl.CommandText :=
    'select K.ID, K.BH, K.MC, ' +
    'B.TS1, B.TS2, B.TS3, B.TS4, B.TS5, B.TS6, B.TS7, B.TS8, B.HJ ' +
    'from KH K, (' + strSqlTj + ') as B ' +
    'where K.ID = B.KHID ' +
    'order by K.BH';
  inherited;
end;

procedure TfrmBbYskZlfx.aMxExecute(Sender: TObject);
var
  i: integer;
begin
  frmBbYskZlMx := TfrmBbYskZlMx.Create(Application);
  with frmBbYskZlMx do
  begin
    intKHID := dsJbzl.FieldByName('ID').AsInteger;
    dteRQ := self.dteRQ;
    for i := 0 to High(aTS) do
      aTS[i] := self.aTS[i];
    ShowModal;
    Free;
  end;
end;

procedure TfrmBbYskZlfx.aTotalExecute(Sender: TObject);
var
  r: integer;
  dblTS1, dblTS2, dblTS3, dblTS4, dblTS5, dblTS6, dblTS7, dblTS8, dblTS9: double;
begin
  with dsJbzl do
  begin
    DisableControls;
    r := RecNo;
    First;
    dblTS1 := 0;
    dblTS2 := 0;
    dblTS3 := 0;
    dblTS4 := 0;
    dblTS5 := 0;
    dblTS6 := 0;
    dblTS7 := 0;
    dblTS8 := 0;
    while not Eof do
    begin
      dblTS1 := dblTS1 + FieldByName('TS1').AsFloat;
      dblTS2 := dblTS2 + FieldByName('TS2').AsFloat;
      dblTS3 := dblTS3 + FieldByName('TS3').AsFloat;
      dblTS4 := dblTS4 + FieldByName('TS4').AsFloat;
      dblTS5 := dblTS5 + FieldByName('TS5').AsFloat;
      dblTS6 := dblTS6 + FieldByName('TS6').AsFloat;
      dblTS7 := dblTS7 + FieldByName('TS7').AsFloat;
      dblTS8 := dblTS8 + FieldByName('TS8').AsFloat;
      Next;
    end;
    dblTS9 := dblTS1 + dblTS2 + dblTS3 + dblTS4 + dblTS5 + dblTS6 + dblTS7 + dblTS8;
    RecNo := r;
    EnableControls;
  end;
  frmZlfxTj := TfrmZlfxTj.Create(Application);
  with frmZlfxTj do
  begin
    BT1.Caption := DBGrid1.Columns[2].Title.Caption;
    BT2.Caption := DBGrid1.Columns[3].Title.Caption;
    BT3.Caption := DBGrid1.Columns[4].Title.Caption;
    BT4.Caption := DBGrid1.Columns[5].Title.Caption;
    BT5.Caption := DBGrid1.Columns[6].Title.Caption;
    BT6.Caption := DBGrid1.Columns[7].Title.Caption;
    BT7.Caption := DBGrid1.Columns[8].Title.Caption;
    BT8.Caption := DBGrid1.Columns[9].Title.Caption;
    BT9.Caption := '总计';
    HJ1.Caption := FormatFloat('#,0.00', dblTS1);
    HJ2.Caption := FormatFloat('#,0.00', dblTS2);
    HJ3.Caption := FormatFloat('#,0.00', dblTS3);
    HJ4.Caption := FormatFloat('#,0.00', dblTS4);
    HJ5.Caption := FormatFloat('#,0.00', dblTS5);
    HJ6.Caption := FormatFloat('#,0.00', dblTS6);
    HJ7.Caption := FormatFloat('#,0.00', dblTS7);
    HJ8.Caption := FormatFloat('#,0.00', dblTS8);
    HJ9.Caption := FormatFloat('#,0.00', dblTS9);
    if dblTS9 <> 0 then
    begin
      BL1.Caption := FormatFloat('0.00', dblTS1 / dblTS9 * 100);
      BL2.Caption := FormatFloat('0.00', dblTS2 / dblTS9 * 100);
      BL3.Caption := FormatFloat('0.00', dblTS3 / dblTS9 * 100);
      BL4.Caption := FormatFloat('0.00', dblTS4 / dblTS9 * 100);
      BL5.Caption := FormatFloat('0.00', dblTS5 / dblTS9 * 100);
      BL6.Caption := FormatFloat('0.00', dblTS6 / dblTS9 * 100);
      BL7.Caption := FormatFloat('0.00', dblTS7 / dblTS9 * 100);
      BL8.Caption := FormatFloat('0.00', dblTS8 / dblTS9 * 100);
      BL9.Caption := FormatFloat('0.00', dblTS9 / dblTS9 * 100);
    end;
    ShowModal;
    Free;
  end;
end;

procedure TfrmBbYskZlfx.aFxtExecute(Sender: TObject);
var
  s: string;
  r: integer;
  dblTS1, dblTS2, dblTS3, dblTS4, dblTS5, dblTS6, dblTS7, dblTS8: double;
begin
  s := '''%s'' as MC, val(format(%f, ''0.00'')) as JE';
  ShowMessage(format(s, ['1234', 345.123]));
  with dsJbzl do
  begin
    DisableControls;
    r := RecNo;
    First;
    dblTS1 := 0;
    dblTS2 := 0;
    dblTS3 := 0;
    dblTS4 := 0;
    dblTS5 := 0;
    dblTS6 := 0;
    dblTS7 := 0;
    dblTS8 := 0;
    while not Eof do
    begin
      dblTS1 := dblTS1 + FieldByName('TS1').AsFloat;
      dblTS2 := dblTS2 + FieldByName('TS2').AsFloat;
      dblTS3 := dblTS3 + FieldByName('TS3').AsFloat;
      dblTS4 := dblTS4 + FieldByName('TS4').AsFloat;
      dblTS5 := dblTS5 + FieldByName('TS5').AsFloat;
      dblTS6 := dblTS6 + FieldByName('TS6').AsFloat;
      dblTS7 := dblTS7 + FieldByName('TS7').AsFloat;
      dblTS8 := dblTS8 + FieldByName('TS8').AsFloat;
      Next;
    end;
    RecNo := r;
    EnableControls;
  end;
  with DmBb.DataBb.ZlFxt do
  begin
    Close;
    CommandText :=
      'select ' + Format(s, [DBGrid1.Columns[2].Title.Caption, dblTS1]) + ' union all ' +
      'select ' + Format(s, [DBGrid1.Columns[3].Title.Caption, dblTS2]) + ' union all ' +
      'select ' + Format(s, [DBGrid1.Columns[4].Title.Caption, dblTS3]) + ' union all ' +
      'select ' + Format(s, [DBGrid1.Columns[5].Title.Caption, dblTS4]) + ' union all ' +
      'select ' + Format(s, [DBGrid1.Columns[6].Title.Caption, dblTS5]) + ' union all ' +
      'select ' + Format(s, [DBGrid1.Columns[7].Title.Caption, dblTS6]) + ' union all ' +
      'select ' + Format(s, [DBGrid1.Columns[8].Title.Caption, dblTS7]) + ' union all ' +
      'select ' + Format(s, [DBGrid1.Columns[9].Title.Caption, dblTS8]);
    Open;
  end;

  inherited;

end;

end.
