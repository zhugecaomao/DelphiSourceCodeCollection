unit SysDate;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Mask,ExtCtrls;

type
  Tdatewindow = class(TForm)
    GroupBox1: TGroupBox;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    nRet: Integer;
  public
    { Public declarations }
  end;

var
  datewindow: Tdatewindow;

function GetStartEndDate (lpszTitle: string; var startdate, enddate: TDate): Boolean;
function DateCheckString (lpszDate: string): Boolean;

implementation

{$R *.DFM}

function DateCheckString (lpszDate: string): Boolean;
var
     i, nLimite, nYear: Integer;
begin
     i := StrToInt (Copy (lpszDate, 1, 4));
     nYear := i;
     if (i > 9999) or (i < 1) then
     begin
          DateCheckString := True;
          Exit;
     end;
     i := StrToInt (Copy (lpszDate, 6, 2));
     if (i > 12) or (i < 1) then
     begin
          DateCheckString := True;
          Exit;
     end;

     case i of
          1: nLimite := 31;
          3: nLimite := 31;
          4: nLimite := 30;
          5: nLimite := 31;
          6: nLimite := 30;
          7: nLimite := 31;
          8: nLimite := 31;
          9: nLimite := 30;
          10: nLimite := 31;
          11: nLimite := 30;
          12: nLimite := 31;
          2: begin
                  if ((nYear mod 4) = 0) and ((nYear mod 100) <> 0) or
                  ((nYear mod 100) = 0) and ((nYear mod 400) = 0) then
                       nLimite := 29
                  else nLimite := 28;
             end;
     end;
     i := StrToInt (Copy (lpszDate, 9, 2));
     if (i < 1) or (i > nLimite) then
     begin
          DateCheckString := True;
          Exit;
     end;
     DateCheckString := False;
end;


function GetStartEndDate (lpszTitle: string; var startdate, enddate: TDate): Boolean;
begin
     datewindow := Tdatewindow.Create (nil);

     startdate := StrToDate (FormatDateTime ('yyyy/mm/dd', Date));
     enddate   := StrToDate (FormatDateTime ('yyyy/mm/dd', Date));
     datewindow.MaskEdit1.Text := FormatDateTime ('yyyy/mm/dd', startdate);
     datewindow.MaskEdit2.Text := FormatDateTime ('yyyy/mm/dd', enddate);
     datewindow.nRet := 1;
     datewindow.Caption := lpszTitle;
     datewindow.ShowModal;
     startdate := StrToDate (datewindow.MaskEdit1.Text);
     enddate   := StrToDate (datewindow.MaskEdit2.Text);
     if datewindow.nRet = 0 then GetStartEndDate := True
     else GetStartEndDate := False;
     datewindow.Free;
end;

procedure Tdatewindow.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if nRet = 1 then
     begin
          MaskEdit1.Text := FormatDateTime ('yyyy/mm/dd', Date);
          MaskEdit2.Text := FormatDateTime ('yyyy/mm/dd', Date);
          CanClose := True;
          Exit;
     end;
     if DateCheckString (MaskEdit1.Text) or DateCheckString (MaskEdit2.Text) then
     begin
          ShowMessage(' ‰»Î»’∆⁄¥ÌŒÛ!');
          CanClose := False;
     end
     else CanClose := True;
end;

procedure Tdatewindow.BitBtn1Click(Sender: TObject);
begin
     nRet := 0;
     Close;
end;

procedure Tdatewindow.BitBtn2Click(Sender: TObject);
begin
     nRet := 1;
     Close;
end;

procedure Tdatewindow.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key = VK_RETURN) or (Key = VK_DOWN) then MaskEdit2.SetFocus; 
end;

procedure Tdatewindow.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then
     begin
          nRet := 0;
          Close;
     end
     else if Key = VK_UP then
          MaskEdit1.SetFocus;
end;

procedure Tdatewindow.FormShow(Sender: TObject);
begin
     Left := (Screen.Width - Width) div 2;
     Top  := (Screen.Height - Height) div 2;
     MaskEdit1.SetFocus;
end;

procedure Tdatewindow.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_ESCAPE then
     begin
          nRet := 1;
          Close;
     end;
end;

end.
