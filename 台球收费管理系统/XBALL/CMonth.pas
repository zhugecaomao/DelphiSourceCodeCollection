unit CMonth;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, Grids, DBGrids, Db, DBTables, StdCtrls, ComCtrls;

type
  TMMonth = class(TForm)
    Turns: TDataSource;
    Turn: TQuery;
    DBGrid1: TDBGrid;
    Button1: TButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    Pick1: TDateTimePicker;
    SumMon: TRadioButton;
    SumDay: TRadioButton;
    Bevel1: TBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SumClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MMonth: TMMonth;

implementation

uses XedUser, Data, Printers;

var
  St1, St2: Word;
  PDate: TDateTime;

{$R *.DFM}

procedure TMMonth.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMMonth.FormCreate(Sender: TObject);
begin
  PDate := Date;
  if Frac(Time) < 9 / 24 then PDate := PDate - 1;
  Pick1.DateTime := PDate;
  Label5.Caption := '';
  Label6.Caption := '';
  SumClick(Self);
end;

procedure TMMonth.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TMMonth.Button1Click(Sender: TObject);
var
  Prnt: TextFile;
begin
  AssignPRN(Prnt);
  Rewrite(Prnt);
  Printer.Canvas.Font.Name := '宋体';
  Printer.Canvas.Font.Style := [];
  Printer.Canvas.Font.PixelsPerInch :=
    GetDeviceCaps(Printer.Canvas.Handle, LOGPIXELSY);
  Printer.Canvas.Font.Size := 16;
  Writeln(Prnt, DateToStr(PDate) + '日结单');
  Writeln(Prnt);
  Writeln(Prnt, '流水号:', Label5.Caption, ' 至 ', Label6.Caption);
  Writeln(Prnt);
  Writeln(Prnt, Label1.Caption, Label2.Caption);
  CloseFile(Prnt);
end;

procedure TMMonth.SumClick(Sender: TObject);
var
  PYear, PMonth, PDay: Word;
  Summ: Real;

begin
  Turn.DisableControls;
  PDate := Pick1.Date;
  DecodeDate(PDate, PYear, PMonth, PDay);

  if SumMon.Checked then begin
    Turn.SQL.Text :=
      'SELECT 日期,流水号,娱乐类别,名称,实收金额 ' +
      'From Ball00 A, Ball01 B Where ' +
      'A.娱乐类别 = B.娱乐类别 ' +
      'And EXTRACT(YEAR  FROM B.日期) = :PPYear ' +
      'And EXTRACT(MONTH FROM B.日期) = :PPmonth ' +
      'And B.结帐标志=True Order By 日期,娱乐类别,流水号';
    Turn.ParamByName('PPYear').AsInteger := PYear;
    Turn.ParamByName('PPMonth').AsInteger := PMonth;
  end;

  if SumDay.Checked then begin
    Turn.SQL.Text :=
      'Select A.名称 as 项目,B.* From Ball00 A, Ball01 B ' +
      'Where A.娱乐类别=B.娱乐类别 and 日期=:PPDate ' +
      'and B.结帐标志=True Order By 流水号, 娱乐类别';
    Turn.ParamByName('PPDate').asDate := PDate;
    Button1.Enabled := True;
  end;
  Turn.Open;
  Turn.First;
  Summ := 0.00;
  try
    St1 := Turn['流水号'];
    Label5.Caption := inttostr(St1);
    while not Turn.Eof do begin
      Summ := Summ + Turn.FieldByName('实收金额').asFloat;
      Turn.Next;
    end;
    St2 := Turn['流水号'];
    Label6.Caption := inttostr(St2);
  except
  end;
  Turn.First;
  Turn.EnableControls;
  Label2.Caption := Format('￥%0.2f 元', [Summ]);
end;

end.

