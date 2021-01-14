unit C_PickDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, Grids, Calendar;

type
  TPickDateForm = class(TStdJdForm)
    Calendar1: TCalendar;
    PrevMonthBtn: TSpeedButton;
    NextMonthBtn: TSpeedButton;
    TitleLabel: TLabel;
    procedure PrevMonthBtnClick(Sender: TObject);
    procedure NextMonthBtnClick(Sender: TObject);
    procedure Calendar1Change(Sender: TObject);
  private
    { Private declarations }
    procedure SetDate(Date: TDateTime);
    function GetDate: TDateTime;
  public
    { Public declarations }
    property Date: TDateTime read GetDate write SetDate;
  end;

var
  PickDateForm: TPickDateForm;

implementation

{$R *.dfm}

procedure TPickDateForm.SetDate(Date: TDateTime);
begin
 Calendar1.CalendarDate := Date;
end;

function TPickDateForm.GetDate: TDateTime;
begin
  Result := Calendar1.CalendarDate;
end;


procedure TPickDateForm.PrevMonthBtnClick(Sender: TObject);
begin
  inherited;
  Calendar1.PrevMonth;
end;

procedure TPickDateForm.NextMonthBtnClick(Sender: TObject);
begin
  inherited;
  Calendar1.NextMonth;
end;

procedure TPickDateForm.Calendar1Change(Sender: TObject);
begin
  inherited;
  TitleLabel.Caption := FormatDateTime('MMMM, YYYY', Calendar1.CalendarDate);
end;

end.
