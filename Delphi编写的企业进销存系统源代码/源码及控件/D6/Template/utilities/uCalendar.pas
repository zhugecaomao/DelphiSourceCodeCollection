unit uCalendar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, Grids, Calendar, Buttons, ExtCtrls;

type
  TCalendarDlg = class(TForm)
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Calendar1: TCalendar;
    ComboBox1: TComboBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Bevel1: TBevel;
    procedure SpinEdit1Change(Sender: TObject);
    procedure Calendar1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CalendarDlg: TCalendarDlg;

implementation

{$R *.DFM}

procedure TCalendarDlg.SpinEdit1Change(Sender: TObject);
begin
  If ((ComboBox1.ItemIndex + 1 = 2) And (Calendar1.Day > 28)) then Calendar1.Day := 28;
  if Pos('e',ShortDateFormat)>0 then
     Calendar1.Year := SpinEdit1.Value+1911
  else
     Calendar1.Year := SpinEdit1.Value;
end;

procedure TCalendarDlg.Calendar1DblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TCalendarDlg.FormCreate(Sender: TObject);
begin
  Calendar1.CalendarDate:=Now;
  if Pos('e',ShortDateFormat)>0 then
    SpinEdit1.Value := Calendar1.Year-1911
  else
    SpinEdit1.Value := Calendar1.Year;
  ComboBox1.ItemIndex := Calendar1.Month - 1;
end;

procedure TCalendarDlg.ComboBox1Change(Sender: TObject);
begin
  If ((ComboBox1.ItemIndex + 1 = 2) And (Calendar1.Day > 28)) then Calendar1.Day := 28;
  If ((ComboBox1.ItemIndex + 1 <> 2) and (Calendar1.Day = 31)) then Calendar1.Day := 30;
  Calendar1.Month := ComboBox1.ItemIndex + 1;
end;

procedure TCalendarDlg.SpeedButton1Click(Sender: TObject);
begin
  if (ComboBox1.ItemIndex+1) >1 then
    ComboBox1.ItemIndex := ComboBox1.ItemIndex -1
  else begin
    ComboBox1.ItemIndex := 11;
    SpinEdit1.Value := SpinEdit1.Value -1;
  end;
  ComboBox1Change(nil);
end;

procedure TCalendarDlg.SpeedButton2Click(Sender: TObject);
begin
  if (ComboBox1.ItemIndex+1) <12 then
    ComboBox1.ItemIndex := ComboBox1.ItemIndex +1
  else begin
    ComboBox1.ItemIndex := 0;
    SpinEdit1.Value := SpinEdit1.Value +1;
  end;
  ComboBox1Change(nil);
end;

procedure TCalendarDlg.SpeedButton3Click(Sender: TObject);
begin
  //往前一年
  SpinEdit1.Value := SpinEdit1.Value - 1;
  ComboBox1Change(nil);
end;

procedure TCalendarDlg.SpeedButton4Click(Sender: TObject);
begin
   //往後一年
  SpinEdit1.Value := SpinEdit1.Value + 1;
  ComboBox1Change(nil);
end;

procedure TCalendarDlg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case key of
      vk_Escape :         // [取消]
      ModalResult := mrCancel;
  end;
end;

end.






























