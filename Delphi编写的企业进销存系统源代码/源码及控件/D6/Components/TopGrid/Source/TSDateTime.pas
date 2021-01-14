{*******************************************************}
{                                                       }
{       ObjectSight Visual Components                   }
{       TopGrid TtsDateTime component                   }
{                                                       }
{       Copyright (c) 2001, ObjectSight                 }
{                                                       }
{*******************************************************}

unit TSDateTime;

{$INCLUDE TSCmpVer}

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, ExtCtrls, Buttons, Grids_ts, TSGrid, TSDateTimeDef
    {$IFDEF TSVER_V6}, Variants {$ENDIF};

const
    tsMaxCalendarRows = 30;

type
    TtsDateTime = class;
    TtsDateTimeDef = class;

    TtsDateTimeSpinType = (dtsIncrYear, dtsDecrYear, dtsIncrTime, dtsDecrTime);
    TtsCalendarRowType = (crtMonthHeader, crtDayNames, crtDays);
    TtsCalendarRowData = record
                             WeekNumber: Integer;
                             RowInMonth: Integer;
                             MonthYear: Integer;
                             Days: array[1..7] of Integer;
                             RowType: TtsCalendarRowType;
                         end;

    {$IFNDEF TSVER_V3}
    TtsDate = TDateTime;
    TtsTime = TDateTime;
    {$ENDIF}

    TtsDateTime = class(TCustomPanel)
    protected
        FDisplayMonth: Integer;
        FDisplayYear: Integer;
        FDisplayRowInMonth: Integer;
        FSelectedDate: TDate;
        FMaxYear: Word;
        FMinYear: Word;
        FMaxRowMonthYear: Integer;
        FRowData: array[1..tsMaxCalendarRows] of TtsCalendarRowData;
        FDayNames: array[1..7] of string;
        FOldScrollBarPosition: Integer;
        FValidDateSelected: Boolean;
        FFormat24Hour: Boolean;
        FSpinButton: TtsDateTimeSpinType;
        FTodayRMY: Integer;
        FSelectedRMY: Integer;
        FPrevHour: Integer;
        FPrevMinute: Integer;
        FPrevSeconds: Integer;
        FUpdateCount: Integer;
        FOldButHourIncrSize: Integer;
        FOldButHourDecrSize: Integer;
        FOldButYearIncrSize: Integer;
        FOldButYearDecrSize: Integer;
        FInDesignMode: Boolean;
        FInPositionControls: Boolean;

        FPnlDate: TPanel;
        FPnlTime: TPanel;
        FPnlEditTime: TPanel;
        FPnlEditYear: TPanel;
        FPnlCalendar: TPanel;
        FButYearIncr: TSpeedButton;
        FButYearDecr: TSpeedButton;

        FButHourIncr: TSpeedButton;
        FButHourDecr: TSpeedButton;
        FButMinIncr: TSpeedButton;
        FButMinDecr: TSpeedButton;
        FButSecIncr: TSpeedButton;
        FButSecDecr: TSpeedButton;
        FButAMPMIncr: TSpeedButton;
        FButAMPMDecr: TSpeedButton;

        FButOK: TSpeedButton;
        FButCancel: TSpeedButton;
        FTxtYear: TEdit;
        FTxtHour: TEdit;
        FTxtMinute: TEdit;
        FTxtSeconds: TEdit;
        FTxtAMPM: TEdit;
        FLblSep1: TLabel;
        FLblSep2: TLabel;
        FBevel: TBevel;
        FTimKeyDownDelay: TTimer;
        FDateGrid: TtsGrid;
        FComboMonth: TtsGrid;
        FComboBevel: TBevel;
        FDateScrollBar: TScrollBar;
        FActiveControl: TWinControl;

        //property fields
        FDateTime: Variant;
        FShowSeconds: Boolean;
        FMinDate: TDate;
        FMaxDate: TDate;
        FShowWeekNumbers: Boolean;
        FShowDayNames: TtsShowDayNames;
        FShowToday: Boolean;
        FDateTimeDisplay: TtsDateTimeDisplay;
        FFirstDayOfWeek: TtsFirstDayOfWeek;
        FCalendarRows: Integer;
        FShowSingleMonth: Boolean;
        FWeekFontColor: TColor;
        FDayNameFontColor: TColor;
        FLineColor: TColor;
        FMonthColor: TColor;
        FMonthFontColor: TColor;
        FDisabledFontColor: TColor;
        FSelectSaturday: Boolean;
        FSelectSunday: Boolean;
        FOkCaption: string;
        FCancelCaption: string;
        FCaption: string;
        FPopupForm: Boolean;

        //event fields
        FOnCancel: TNotifyEvent;
        FOnSelect: TNotifyEvent;

        procedure InvalidOp(Msg: string);
        procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
        procedure CreateWnd; override;
        procedure KeyDown(var Key: Word; Shift: TShiftState); override;

        procedure YearUpdated;
        procedure timKeyDownDelayTimer(Sender: TObject);
        procedure grdMonthComboGetValue(Sender: TObject; Combo: TtsComboGrid; GridDataCol, GridDataRow,
                                        ComboDataRow: Longint; var Value: Variant);
        procedure grdMonthKeyPress(Sender: TObject; var Key: Char);
        procedure ScrollLineUp;
        procedure ScrollLineDown;
        procedure ScrollPageUp;
        procedure ScrollPageDown;
        procedure DateScrollBarScroll(Sender: TObject; ScrollCode: TScrollCode; var ScrollPos: Integer);
        procedure DateScrollBarKeyPress(Sender: TObject; var Key: Char);
        procedure DateGridCellLoaded(Sender: TObject; DataCol, DataRow: Longint; var Value: Variant);
        procedure DateGridPaint(Sender: TObject);
        procedure DateGridMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        procedure DateGridMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        procedure DateGridKeyPress(Sender: TObject; var Key: Char);
        function  GetMinDateInView(var MinDate: TDateTime): Boolean;
        function  GetMaxDateInView(var MaxDate: TDateTime): Boolean;
        function  DateInView(Value: TDateTime): Boolean;
        procedure PutDateInView(Value: TDateTime);
        procedure KeyScrollUp(PageUp: Boolean);
        procedure KeyScrollDown(PageDown: Boolean);
        procedure KeyScrollLeft;
        procedure KeyScrollRight;
        procedure DateGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure butYearIncrMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        procedure butYearIncrMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        procedure butYearDecrMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        procedure butYearDecrMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        procedure butTimeIncrMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        procedure butTimeIncrMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        procedure butTimeDecrMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        procedure butTimeDecrMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        procedure txtYearExit(Sender: TObject);
        procedure txtYearKeyPress(Sender: TObject; var Key: Char);
        procedure txtYearKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure txtHourExit(Sender: TObject);
        procedure txtHourKeyPress(Sender: TObject; var Key: Char);
        procedure txtHourKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure txtHourChange(Sender: TObject);
        procedure txtMinuteExit(Sender: TObject);
        procedure txtMinuteKeyPress(Sender: TObject; var Key: Char);
        procedure txtMinuteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure txtMinuteChange(Sender: TObject);
        procedure txtSecondsExit(Sender: TObject);
        procedure txtSecondsKeyPress(Sender: TObject; var Key: Char);
        procedure txtSecondsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure txtSecondsChange(Sender: TObject);
        procedure txtAMPMKeyPress(Sender: TObject; var Key: Char);
        procedure txtAMPMKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure butOKClick(Sender: TObject);
        procedure butCancelClick(Sender: TObject);

        function  GetFirstDayInRow(Year, Month, RowInMonth: Integer): Integer;
        procedure BuildGridRows(RowInMonth: Integer; Month: Integer; Year: Integer);
        function  GetFullYear(YearStr: string): Integer;
        function  YearOk(YearStr: string): Boolean;
        procedure CheckEnableButton;
        procedure CheckMinMaxDate(var RowInMonth: Integer; var Month: Integer; var Year: Integer);
        procedure Close(Ok: Boolean);
        procedure CreateControls;
        procedure DecHour;
        procedure DecMinutes;
        procedure CheckValidDate(var Month, Year: Integer);
        procedure DecMonth(var Month: Integer; var Year: Integer);
        procedure DecSeconds;
        procedure DecodeRMYvalue(RMYvalue: Integer; var RowInMonth: Integer; var Month: Integer; var Year: Integer);
        procedure DecRow(var Row: Integer; var Month: Integer; var Year: Integer);
        function  GetRMYRow(RMY: Integer): Integer;
        procedure InvertSelectedDate;
        procedure HandleKeyDownHomeEnd(Key: Word);
        procedure InitControlProperties;
        procedure InitMonthCombo;
        procedure IncHour;
        procedure IncMinutes;
        procedure IncMonth(var Month: Integer; var Year: Integer);
        procedure IncRow(var Row: Integer; var Month: Integer; var Year: Integer);
        procedure IncSeconds;
        function  ButYearSizeChanged: Boolean;
        function  ButTimeSizeChanged: Boolean;
        procedure SaveButtonHeights;
        function  CalcGridRows: Integer;
        procedure SetComboValue;
        procedure BuildGridData;
        procedure RefreshControls;
        procedure RefreshDates;
        procedure RefreshData(CheckDates: Boolean);
        procedure CheckRefreshData(CheckDates: Boolean);
        function  GetPrevDay(CurDate: TDateTime): TDateTime;
        function  GetNextDay(CurDate: TDateTime): TDateTime;
        function  GetValidDate(Value: Variant): TDateTime;
        function  SetSelectedDate(Value: Variant): TDateTime;
        procedure SetDisplayDate(Value: TDateTime);
        procedure SetSelectedDateInView(Invert: Boolean);
        procedure SetCurDateTime(Init: Boolean);
        procedure CheckCurDateTime(Init: Boolean);
        procedure SetControlColors;
        procedure SetOkButtonPos;
        procedure SetCalendarHeight;
        procedure SetDayNames;
        procedure PositionDateGrid;
        procedure PositionMonthCombo(TextHeight: Integer);
        procedure PositionYearEdit(TextHeight: Integer);
        procedure PositionScrollBar;
        procedure PositionYearButtons;
        procedure PositionTimeButtons(TxtOffset, AMPMWidth, AMPMOffset, ButHeight, ButWidth,
                                      ButIncrTop, ButDecrTop: Integer);
        function  GetAMPMWidth: Integer;
        procedure PositionTimeControls(TextHeight: Integer);
        procedure SetButtonGlyphs(ButtonHeight: Integer);
        procedure PositionControls;
        procedure SelectDate(Col, Row: Integer);
        procedure ToggleAMPM;
        procedure SetButControlFocus(Button: TSpeedButton);
        procedure DoSelect;
        procedure DoCancel;

        procedure BeginUpdate;
        procedure EndUpdate;
        function  IsUpdating: Boolean;
        procedure CheckUpdate;
        procedure CheckUpdateCalendar;
        procedure CheckReAlign;
        procedure InvalidateControls(Control: TWinControl);

        procedure SetColor(Value: TColor);
        function  GetColor: TColor;
        procedure SetDateTime(Value: Variant);
        function  GetDateTime: Variant;
        procedure SetCalendarRows(Value: Integer);
        procedure SetDateTimeDisplay(Value: TtsDateTimeDisplay);
        procedure SetDayNameFontColor(Value: TColor);
        procedure SetDisabledFontColor(Value: TColor);
        procedure SetFirstDayOfWeek(Value: TtsFirstDayOfWeek);
        procedure SetLineColor(Value: TColor);
        procedure SetMaxDate(Value: TDate);
        procedure SetMinDate(Value: TDate);
        procedure SetMonthColor(Value: TColor);
        procedure SetMonthFontColor(Value: TColor);
        procedure SetOkCaption(Value: string);
        procedure SetCancelCaption(Value: string);
        procedure SetCaption(Value: string);
        procedure SetSelectSaturday(Value: Boolean);
        procedure SetSelectSunday(Value: Boolean);
        procedure SetShowDayNames(Value: TtsShowDayNames);
        procedure SetShowSeconds(Value: Boolean);
        procedure SetShowToday(Value: Boolean);
        procedure SetShowWeekNumbers(Value: Boolean);
        procedure SetShowSingleMonth(Value: Boolean);
        procedure SetWeekFontColor(Value: TColor);
        procedure SetPopupForm(Value: Boolean);
        function  GetInDesignMode: Boolean;

        function  Date2RMYValue(Value: TDate): Integer;
        function  DatePart(Code: String; Value: TDate): Word;
        function  DetermineMaxRowMonthYear: Integer;
        function  FirstDayOfRMY(RMYvalue: Integer): Integer;
        function  Min(i, j: Integer): Integer;
        function  Max(i, j: Integer): Integer;
        function  RowsInMonth(Month: Integer; Year:Integer): Integer;
        procedure GetHourFormat;
        function  TimePart(Code: String; Value: TTime): String;
        function  tsDayOfWeek(Value: TDate): Integer;
        function  ISODayOfWeek(Value: TDate): Integer;
        function  WeekNumber(Value: TDate): Word;
        function  CaptionStr(DateTimeDisplay: TtsDateTimeDisplay): string;
        function  IsDefaultCaption(Caption: string): Boolean;

    public
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;

        procedure Assign(Source: TPersistent); override;
        procedure InitializeDisplay;
        procedure InitializeFocus;
        procedure ReAlign;
        procedure SetFocus; override;

        property DateTime: Variant read GetDateTime write SetDateTime;
        property PopupForm: Boolean read FPopupForm write SetPopupForm default False;
        property OnSelect: TNotifyEvent read FOnSelect write FOnSelect;
        property OnCancel: TNotifyEvent read FOnCancel write FOnCancel;

    published
        property CalendarRows: Integer read FCalendarRows write SetCalendarRows default 8;
        property Color: TColor read GetColor write SetColor default clWindow;
        property DateTimeDisplay: TtsDateTimeDisplay read FDateTimeDisplay write SetDateTimeDisplay default dtDate;
        property DayNameFontColor: TColor read FDayNameFontColor write SetDayNameFontColor default clHighLight;
        property DisabledFontColor: TColor read FDisabledFontColor write SetDisabledFontColor default clInactiveBorder;
        property FirstDayOfWeek: TtsFirstDayOfWeek read FFirstDayOfWeek write SetFirstDayOfWeek default dowSunday;
        property Font;
        property LineColor: TColor read FLineColor write SetLineColor default clGrayText;
        property MaxDate: TDate read FMaxDate write SetMaxDate;
        property MinDate: TDate read FMinDate write SetMinDate;
        property MonthColor: TColor read FMonthColor write SetMonthColor default clHighLight;
        property MonthFontColor: TColor read FMonthFontColor write SetMonthFontColor default clHighLightText;
        property OkCaption: string read FOkCaption write SetOkCaption;
        property CancelCaption: string read FCancelCaption write SetCancelCaption;
        property Caption: string read FCaption write SetCaption;
        property SelectSaturday: Boolean read FSelectSaturday write SetSelectSaturday default True;
        property SelectSunday: Boolean read FSelectSunday write SetSelectSunday default True;
        property ShowDayNames: TtsShowDayNames read FShowDayNames write SetShowDayNames default sdnFirstLetter;
        property ShowSeconds: Boolean read FShowSeconds write SetShowSeconds default False;
        property ShowSingleMonth: Boolean read FShowSingleMonth write SetShowSingleMonth default True;
        property ShowToday: Boolean read FShowToday write SetShowToday default True;
        property ShowWeekNumbers: Boolean read FShowWeekNumbers write SetShowWeekNumbers default True;
        property WeekFontColor: TColor read FWeekFontColor write SetWeekFontColor default clHighLight;
    end;

    TtsDateTimeDefProps = class(TtsDateTimeProps)
    protected
        function  GetColor: TColor; override;
        procedure SetColor(Value: TColor); override;
        function  GetCalendarRows: Integer; override;
        procedure SetCalendarRows(Value: Integer); override;
        function  GetDateTimeDisplay: TtsDateTimeDisplay; override;
        procedure SetDateTimeDisplay(Value: TtsDateTimeDisplay); override;
        function  GetDayNameFontColor: TColor; override;
        procedure SetDayNameFontColor(Value: TColor); override;
        function  GetDisabledFontColor: TColor; override;
        procedure SetDisabledFontColor(Value: TColor); override;
        function  GetFirstDayOfWeek: TtsFirstDayOfWeek; override;
        procedure SetFirstDayOfWeek(Value: TtsFirstDayOfWeek); override;
        function  GetFont: TFont; override;
        procedure SetFont(Value: TFont); override;
        function  GetParentFont: Boolean; override;
        procedure SetParentFont(Value: Boolean); override;
        function  GetLineColor: TColor; override;
        procedure SetLineColor(Value: TColor); override;
        function  GetMaxDate: TtsDate; override;
        procedure SetMaxDate(Value: TtsDate); override;
        function  GetMinDate: TtsDate; override;
        procedure SetMinDate(Value: TtsDate); override;
        function  GetMonthColor: TColor; override;
        procedure SetMonthColor(Value: TColor); override;
        function  GetMonthFontColor: TColor; override;
        procedure SetMonthFontColor(Value: TColor); override;
        function  GetOkCaption: string; override;
        procedure SetOkCaption(Value: string); override;
        function  GetCancelCaption: string; override;
        procedure SetCancelCaption(Value: string); override;
        function  GetCaption: string; override;
        procedure SetCaption(Value: string); override;
        function  GetSelectSaturday: Boolean; override;
        procedure SetSelectSaturday(Value: Boolean); override;
        function  GetSelectSunday: Boolean; override;
        procedure SetSelectSunday(Value: Boolean); override;
        function  GetShowDayNames: TtsShowDayNames; override;
        procedure SetShowDayNames(Value: TtsShowDayNames); override;
        function  GetShowSeconds: Boolean; override;
        procedure SetShowSeconds(Value: Boolean); override;
        function  GetShowToday: Boolean; override;
        procedure SetShowToday(Value: Boolean); override;
        function  GetShowWeekNumbers: Boolean; override;
        procedure SetShowWeekNumbers(Value: Boolean); override;
        function  GetShowSingleMonth: Boolean; override;
        procedure SetShowSingleMonth(Value: Boolean); override;
        function  GetWeekFontColor: TColor; override;
        procedure SetWeekFontColor(Value: TColor); override;
        function  GetDateTime: Variant; override;
        procedure SetDateTime(Value: Variant); override;
        function  GetPopupForm: Boolean; override;
        procedure SetPopupForm(Value: Boolean); override;

        function  GetDateTimeControl: TtsDateTime;
        function  GetDateTimeDef: TtsDateTimeDef;

    public
        procedure Assign(Source: TPersistent); override;

        property DateTimeControl: TtsDateTime read GetDateTimeControl;
        property DateTimeDef: TtsDateTimeDef read GetDateTimeDef;
    end;

    TtsDateTimeDef = class(TtsDateTimeDefComponent)
    protected
        FDateTimeControl: TtsDateTime;
        FDateTimeControlProps: TtsDateTimeDefProps;

        function  GetControl: TWinControl; override;
        procedure SetSelect(Value: TNotifyEvent); override;
        function  GetSelect: TNotifyEvent; override;
        procedure SetCancel(Value: TNotifyEvent); override;
        function  GetCancel: TNotifyEvent; override;
        procedure SetDateTime(Value: Variant); override;
        function  GetDateTime: Variant; override;
        procedure SetDateTimeDisplay(Value: TtsDateTimeDisplay); override;
        function  GetDateTimeDisplay: TtsDateTimeDisplay; override;
        procedure SetPopupForm(Value: Boolean); override;
        function  GetPopupForm: Boolean; override;
        procedure SetDateTimeProps(Value: TtsDateTimeProps); override;
        function  GetDateTimeProps: TtsDateTimeProps; override;
        procedure SetDateTimeControl(Value: TtsDateTime);

    public
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;

        procedure Assign(Source: TPersistent); override;
        procedure InitializeDisplay; override;
        procedure InitializeFocus; override;

        property DateTimeControl: TtsDateTime read FDateTimeControl write SetDateTimeControl;

    published
        property DateTimeProps;
    end;

const
    StsInvalidMinDate = 'MinDate is larger than MaxDate';
    StsInvalidMaxDate = 'MaxDate is smaller than MinDate';

implementation

{$R *.RES}
{$R *.dcr}

uses
    TSCommon;

const
    SpinKeyDownDelay = 500;
    DisabledColor = cl3DLight;
    MinEditControlHeight = 18;
    DefaultButWidth = 75;
    DefaultButHeight = 27;
    MaxCalendarYear = 9999;
    MinCalendarYear = 1;

    DateCaption = 'Date';
    TimeCaption = 'Time';
    DateTimeCaption = DateCaption + '/' + TimeCaption;

{$IFNDEF TSVER_V3}
type
    TDayTable = array[1..12] of Word;

const
    MonthDays: array [Boolean] of TDayTable =
        ((31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31),
         (31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31));

function IsLeapYear(Year: Word): Boolean;
begin
  Result := (Year mod 4 = 0) and ((Year mod 100 <> 0) or (Year mod 400 = 0));
end;
{$ENDIF}


{TtsDateTime}

constructor TtsDateTime.Create(AOwner: TComponent);
begin
    //ShowMessage('TtsDateTime Create Start');
    inherited;

    FOldButHourIncrSize := 0;
    FOldButHourDecrSize := 0;
    FOldButYearIncrSize := 0;
    FOldButYearDecrSize := 0;
    FUpdateCount := 0;
    FInDesignMode := False;
    FInPositionControls := False;

    FDisplayRowInMonth := 1;
    FValidDateSelected := False;
    FDateTimeDisplay := dtDate;
    FCaption := CaptionStr(FDateTimeDisplay);
    FDateTime := Unassigned;
    FMinDate := EncodeDate(1900, 1, 1);
    FMaxDate := EncodeDate(2099, 12, 31);
    FShowWeekNumbers := True;
    FShowDayNames := sdnFirstLetter;
    FShowToday := True;
    FirstDayOfWeek := dowSunday;
    FCalendarRows := 8;
    FShowSingleMonth := True;
    FPopupForm := False;

    FWeekFontColor := clHighLight;
    FDayNameFontColor := clHighLight;
    FLineColor := clGrayText;
    FMonthFontColor := clHighLightText;
    FMonthColor := clHighLight;
    FDisabledFontColor := clInactiveBorder;
    FSelectSaturday := True;
    FSelectSunday := True;
    FOkCaption := '&OK';
    FCancelCaption := '&Cancel';

    CreateControls;
    //ShowMessage('TtsDateTime Create Step 5');
    InitControlProperties;
    //ShowMessage('TtsDateTime Create Step 6');
    SetCurDateTime(True);
    //ShowMessage('TtsDateTime Create Step 7');
end;

destructor TtsDateTime.Destroy;
begin
    inherited;
end;

procedure TtsDateTime.Assign(Source: TPersistent);
const
    NoAssignProps = 'Height;Left;Name;Top;Width;Visible';
begin
    if Source is TtsDateTime then
    begin
        BeginUpdate;
        try
            AssignObject(Self, Source, NoAssignProps);
        finally
            EndUpdate;
        end;
    end
    else
        inherited;
end;

procedure TtsDateTime.InvalidOp(Msg: string);
begin
    if Name <> ''
        then raise Exception.Create(Name + ': ' + Msg)
        else raise Exception.Create(Owner.Name + ': ' + Msg);
end;

procedure TtsDateTime.CMFontChanged(var Message: TMessage);
begin
    inherited;
    ReAlign;
end;

procedure TtsDateTime.CreateWnd;
begin
    inherited;
    InitMonthCombo;
    PositionControls;
end;

procedure TtsDateTime.KeyDown(var Key: Word; Shift: TShiftState);
begin
    inherited;
    if Key <> 0 then DateGridKeyDown(Self, Key, Shift);
    if Key <> 0 then
    begin
        case Key of
            VK_ESCAPE:
                begin
                    Close(False);
                    Key := 0;
                end;
            VK_RETURN:
                begin
                    Close(True);
                    Key := 0;
                end;
        end;
    end;
end;

procedure TtsDateTime.CreateControls;
begin
    FPnlTime := TPanel.Create(Self);
    FPnlEditTime := TPanel.Create(FPnlTime);
    FButOK := TSpeedButton.Create(Self);
    FButCancel := TSpeedButton.Create(Self);
    FBevel := TBevel.Create(Self);

    FButHourIncr := TSpeedButton.Create(FPnlTime);
    FButHourDecr := TSpeedButton.Create(FPnlTime);
    FButMinIncr := TSpeedButton.Create(FPnlTime);
    FButMinDecr := TSpeedButton.Create(FPnlTime);
    FButSecIncr := TSpeedButton.Create(FPnlTime);
    FButSecDecr := TSpeedButton.Create(FPnlTime);
    FButAMPMIncr := TSpeedButton.Create(FPnlTime);
    FButAMPMDecr := TSpeedButton.Create(FPnlTime);
    FTxtHour := TEdit.Create(FPnlEditTime);
    FTxtMinute := TEdit.Create(FPnlEditTime);
    FTxtSeconds := TEdit.Create(FPnlEditTime);
    FTxtAMPM := TEdit.Create(FPnlEditTime);
    FLblSep1 := TLabel.Create(FPnlEditTime);
    FLblSep2 := TLabel.Create(FPnlEditTime);

    FPnlTime.Parent := Self;
    FPnlEditTime.Parent := FPnlTime;
    FButOK.Parent := Self;
    FButCancel.Parent := Self;
    FBevel.Parent := Self;

    FButHourIncr.Parent := FPnlTime;
    FButHourDecr.Parent := FPnlTime;
    FButMinIncr.Parent := FPnlTime;
    FButMinDecr.Parent := FPnlTime;
    FButSecIncr.Parent := FPnlTime;
    FButSecDecr.Parent := FPnlTime;
    FButAMPMIncr.Parent := FPnlTime;
    FButAMPMDecr.Parent := FPnlTime;
    FTxtHour.Parent := FPnlEditTime;
    FTxtMinute.Parent := FPnlEditTime;
    FTxtSeconds.Parent := FPnlEditTime;
    FTxtAMPM.Parent := FPnlEditTime;
    FLblSep1.Parent := FPnlEditTime;
    FLblSep2.Parent := FPnlEditTime;

    FPnlDate := TPanel.Create(Self);
    FPnlCalendar := TPanel.Create(FPnlDate);
    FDateGrid := TtsGrid.Create(FPnlCalendar);
    FButYearIncr := TSpeedButton.Create(FPnlDate);
    FButYearDecr := TSpeedButton.Create(FPnlDate);
    FTxtYear := TEdit.Create(FPnlDate);
    FPnlEditYear := TPanel.Create(FPnlDate);
    FComboMonth := TtsGrid.Create(FPnlDate);
    FComboBevel := TBevel.Create(FPnlDate);
    FDateScrollBar := TScrollBar.Create(FPnlDate);

    FPnlDate.Parent := Self;
    FPnlCalendar.Parent := FPnlDate;
    FDateGrid.Parent := FPnlCalendar;
    FButYearIncr.Parent := FPnlDate;
    FButYearDecr.Parent := FPnlDate;
    FTxtYear.Parent := FPnlEditYear;
    FPnlEditYear.Parent := FPnlDate;
    FComboMonth.Parent := FPnlDate;
    FComboBevel.Parent := FPnlDate;
    FDateScrollBar.Parent := FPnlDate;

    FTimKeyDownDelay := TTimer.Create(Self);
end;

procedure TtsDateTime.InitControlProperties;
var
    I: Integer;
begin
    //ShowMessage('TtsDateTime Create Step 5-1');
    Left := 0;
    Top := 0;
    BevelOuter := bvNone;
    BorderStyle := bsSingle;
    Ctl3D := False;
    ParentCtl3D := False;

    //ShowMessage('TtsDateTime Create Step 5-2');
    FPnlDate.BevelOuter := bvNone;
    FPnlDate.Ctl3D := True;
    FPnlDate.ParentCtl3D := False;
    FPnlDate.TabOrder := 0;

    ////ShowMessage('TtsDateTime Create Step 5-3');
    FButYearIncr.Layout := blGlyphBottom;
    FButYearIncr.OnMouseDown := butYearIncrMouseDown;
    FButYearIncr.OnMouseUp := butYearIncrMouseUp;

    FButYearDecr.Layout := blGlyphBottom;
    FButYearDecr.OnMouseDown := butYearDecrMouseDown;
    FButYearDecr.OnMouseUp := butYearDecrMouseUp;

    //ShowMessage('TtsDateTime Create Step 5-4');
    FComboMonth.Top := 1;
    FComboMonth.Left := 1;
    FComboMonth.TabOrder := 0;
    //ShowMessage('TtsDateTime Create Step 5-4b');
    FComboMonth.Cols := 1;
    //ShowMessage('TtsDateTime Create Step 5-4c');
    FComboMonth.Rows := 1;
    //ShowMessage('TtsDateTime Create Step 5-4d');
    FComboMonth.Ctl3D := False;
    FComboMonth.ParentCtl3D := False;
    FComboMonth.DefaultRowHeight := 18;
    FComboMonth.BorderStyle := bsNone;
    FComboMonth.Height := FComboMonth.DefaultRowHeight;
    //ShowMessage('TtsDateTime Create Step 5-4e');
    FComboMonth.Width := FComboMonth.Col[1].Width;
    //ShowMessage('TtsDateTime Create Step 5-4f');
    FComboMonth.HeadingOn := False;
    FComboMonth.RowBarOn := False;
    FComboMonth.WantTabs := False;
    FComboMonth.FlatButtons := False;
    FComboMonth.ButtonEdgeWidth := 0;
    FComboMonth.DefaultButtonWidth := FComboMonth.VertScrollBarWidth - 1;
    FComboMonth.StoreData := True;
    FComboMonth.VertAlignment := vtaCenter;
    FComboMonth.CellSelectMode := cmNone;
    FComboMonth.FocusColor := clHighlight;
    FComboMonth.FocusFontColor := clHighlightText;
    FComboMonth.CheckMouseFocus := False;
    FComboMonth.ScrollBars := ssNone;
    FComboMonth.AutoScale := False;
    //ShowMessage('TtsDateTime Create Step 5-5');
    FComboMonth.Col[1].ButtonType := btCombo;
    //ShowMessage('TtsDateTime Create Step 5-5a');
    FComboMonth.Col[1].AssignCombo;
    //ShowMessage('TtsDateTime Create Step 5-5b');
    FComboMonth.Col[1].Combo.Grid.Rows := 12;
    //ShowMessage('TtsDateTime Create Step 5-5c');
    FComboMonth.Col[1].Combo.Grid.Cols := 1;
    //ShowMessage('TtsDateTime Create Step 5-5d');
    FComboMonth.Col[1].Combo.DropDownRows := 5;
    FComboMonth.Col[1].Combo.DropDownCols := 1;
    FComboMonth.Col[1].Combo.AutoSearch := asTop;
    ////ShowMessage('TtsDateTime Create Step 5-5e');
    FComboMonth.Col[1].Combo.ValueCol := 1;
    FComboMonth.Col[1].Combo.ValueColSorted := False;
    ////ShowMessage('TtsDateTime Create Step 5-5f');
    FComboMonth.Col[1].Combo.Grid.StoreData := True;
    ////ShowMessage('TtsDateTime Create Step 5-5g');
    FComboMonth.Col[1].DropDownStyle := ddDropDownList;
    ////ShowMessage('TtsDateTime Create Step 5-5h');
    FComboMonth.Col[1].Combo.Grid.Width := FComboMonth.Width;
    ////ShowMessage('TtsDateTime Create Step 5-5i');
    FComboMonth.Col[1].Combo.Grid.SelectionType := sltColor;
    ////ShowMessage('TtsDateTime Create Step 5-5j');
    FComboMonth.Col[1].Combo.Grid.GridLines := glNone;
    ////ShowMessage('TtsDateTime Create Step 5-5k');
    FComboMonth.Col[1].Combo.Grid.VertAlignment := vtaCenter;
    ////ShowMessage('TtsDateTime Create Step 5-6');
    FComboMonth.OnComboGetValue := grdMonthComboGetValue;
    FComboMonth.OnKeyPress := grdMonthKeyPress;

    ////ShowMessage('TtsDateTime Create Step 5-7');
    FComboBevel.Top := FComboMonth.Top - 1;
    FComboBevel.Left := FComboMonth.Left - 1;
    FComboBevel.Style := bsLowered;

    ////ShowMessage('TtsDateTime Create Step 5-8');
    FTxtYear.MaxLength := 4;
    FTxtYear.TabOrder := 1;
    FTxtYear.Top := 1;
    FTxtYear.Left := 4;
    FTxtYear.Ctl3D := False;
    FTxtYear.BorderStyle := bsNone;
    FTxtYear.OnExit := txtYearExit;
    FTxtYear.OnKeyDown := txtYearKeyDown;
    FTxtYear.OnKeyPress := txtYearKeyPress;

    ////ShowMessage('TtsDateTime Create Step 5-9');
    FPnlEditYear.BevelOuter := bvLowered;
    FPnlEditYear.BorderStyle := bsNone;
    FPnlEditYear.Color := clWindow;

    ////ShowMessage('TtsDateTime Create Step 5-10');
    FPnlCalendar.BevelOuter := bvNone;
    FPnlCalendar.BorderWidth := 1;
    FPnlCalendar.Caption := '';
    FPnlCalendar.Color := clBtnShadow;
    FPnlCalendar.TabOrder := 2;

    ////ShowMessage('TtsDateTime Create Step 5-11');
    FDateGrid.Align := alClient;
    FDateGrid.BorderStyle := bsNone;
    FDateGrid.CellSelectMode := cmNone;
    FDateGrid.CenterPicture := False;
    FDateGrid.CheckBoxStyle := stCheck;
    FDateGrid.ColMoving := False;
    FDateGrid.Cols := 8;
    FDateGrid.Rows := CalcGridRows;
    FDateGrid.ColSelectMode := csNone;
    FDateGrid.Ctl3D := True;
    FDateGrid.DefaultColWidth := 19;
    FDateGrid.DefaultRowHeight := 18;
    FDateGrid.FixedColCount := 1;
    FDateGrid.FixedRowCount := 1;
    FDateGrid.GridLines := glNone;
    FDateGrid.GridMode := gmListBox;
    FDateGrid.HeadingColor := clWindow;
    FDateGrid.HeadingOn := False;
    FDateGrid.ParentCtl3D := False;
    FDateGrid.ParentFont := True;
    FDateGrid.ParentShowHint := False;
    FDateGrid.ResizeCols := rcNone;
    FDateGrid.ResizeRows := rrNone;
    FDateGrid.RowBarOn := False;
    FDateGrid.RowMoving := False;
    FDateGrid.RowSelectMode := rsNone;
    FDateGrid.ScrollBars := ssNone;
    FDateGrid.TabOrder := 0;
    FDateGrid.AutoScale := False;

    ////ShowMessage('TtsDateTime Create Step 5-12');
    FDateGrid.OnCellLoaded := DateGridCellLoaded;
    FDateGrid.OnKeyPress := DateGridKeyPress;
    FDateGrid.OnKeyDown := DateGridKeyDown;
    FDateGrid.OnMouseDown := DateGridMouseDown;
    FDateGrid.OnMouseUp := DateGridMouseUp;
    FDateGrid.OnPaint := DateGridPaint;

    for I := 1 to FDateGrid.Cols do
    begin
        FDateGrid.Col[i].Align := True;
        FDateGrid.Col[i].Alignment := taCenter;
    end;

    ////ShowMessage('TtsDateTime Create Step 5-13');
    FDateScrollBar.Kind := sbVertical;
    FDateScrollBar.LargeChange := 4;
    FDateScrollBar.Max := 47;
    FDateScrollBar.Position := 23;
    FDateScrollBar.TabOrder := 3;
    FDateScrollBar.TabStop := False;
    FDateScrollBar.OnKeyPress := DateScrollBarKeyPress;
    FDateScrollBar.OnScroll := DateScrollBarScroll;

    ////ShowMessage('TtsDateTime Create Step 5-14');
    FTimKeyDownDelay.Enabled := False;
    FTimKeyDownDelay.OnTimer := timKeyDownDelayTimer;

    ////ShowMessage('TtsDateTime Create Step 5-15');
    FPnlTime.BevelOuter := bvNone;
    FPnlTime.Ctl3D := True;
    FPnlTime.ParentColor := True;
    FPnlTime.ParentCtl3D := False;
    FPnlTime.TabOrder := 1;

    ////ShowMessage('TtsDateTime Create Step 5-16');
    FButHourIncr.Layout := blGlyphBottom;
    FButHourIncr.OnMouseDown := butTimeIncrMouseDown;
    FButHourIncr.OnMouseUp := butTimeIncrMouseUp;

    FButHourDecr.Layout := blGlyphBottom;
    FButHourDecr.OnMouseDown := butTimeDecrMouseDown;
    FButHourDecr.OnMouseUp := butTimeDecrMouseUp;

    FButMinIncr.Layout := blGlyphBottom;
    FButMinIncr.OnMouseDown := butTimeIncrMouseDown;
    FButMinIncr.OnMouseUp := butTimeIncrMouseUp;

    FButMinDecr.Layout := blGlyphBottom;
    FButMinDecr.OnMouseDown := butTimeDecrMouseDown;
    FButMinDecr.OnMouseUp := butTimeDecrMouseUp;

    FButSecIncr.Layout := blGlyphBottom;
    FButSecIncr.OnMouseDown := butTimeIncrMouseDown;
    FButSecIncr.OnMouseUp := butTimeIncrMouseUp;

    FButSecDecr.Layout := blGlyphBottom;
    FButSecDecr.OnMouseDown := butTimeDecrMouseDown;
    FButSecDecr.OnMouseUp := butTimeDecrMouseUp;

    FButAMPMIncr.Layout := blGlyphBottom;
    FButAMPMIncr.OnMouseDown := butTimeIncrMouseDown;
    FButAMPMIncr.OnMouseUp := butTimeIncrMouseUp;

    FButAMPMDecr.Layout := blGlyphBottom;
    FButAMPMDecr.OnMouseDown := butTimeDecrMouseDown;
    FButAMPMDecr.OnMouseUp := butTimeDecrMouseUp;

    FPnlEditTime.BevelOuter := bvLowered;
    FPnlEditTime.BorderStyle := bsNone;
    FPnlEditTime.Color := clWindow;
    FPnlEditTime.TabOrder := 0;

    FButOK.Visible := False;
    FButOk.ParentFont := False;
    FButOK.OnClick := butOKClick;

    FButCancel.Visible := False;
    FButCancel.ParentFont := False;
    FButCancel.OnClick := butCancelClick;

    FBevel.Height := 2;
    FBevel.Style := bsRaised;

    ////ShowMessage('TtsDateTime Create Step 5-17');
    FTxtHour.Top := 1;
    FTxtHour.BorderStyle := bsNone;
    FTxtHour.Ctl3D := False;
    FTxtHour.MaxLength := 2;
    FTxtHour.ParentCtl3D := False;
    FTxtHour.TabOrder := 0;
    FTxtHour.OnExit := txtHourExit;
    FTxtHour.OnKeyDown := txtHourKeyDown;
    FTxtHour.OnKeyPress := txtHourKeyPress;
    FTxtHour.OnChange := txtHourChange;

    FTxtMinute.Top := 1;
    FTxtMinute.BorderStyle := bsNone;
    FTxtMinute.Ctl3D := False;
    FTxtMinute.MaxLength := 2;
    FTxtMinute.ParentCtl3D := False;
    FTxtMinute.TabOrder := 1;
    FTxtMinute.OnExit := txtMinuteExit;
    FTxtMinute.OnKeyDown := txtMinuteKeyDown;
    FTxtMinute.OnKeyPress := txtMinuteKeyPress;
    FTxtMinute.OnChange := txtMinuteChange;

    FTxtSeconds.Top := 1;
    FTxtSeconds.BorderStyle := bsNone;
    FTxtSeconds.Ctl3D := False;
    FTxtSeconds.MaxLength := 2;
    FTxtSeconds.ParentCtl3D := False;
    FTxtSeconds.TabOrder := 2;
    FTxtSeconds.OnExit := txtSecondsExit;
    FTxtSeconds.OnKeyDown := txtSecondsKeyDown;
    FTxtSeconds.OnKeyPress := txtSecondsKeyPress;
    FTxtSeconds.OnChange := txtSecondsChange;

    FTxtAMPM.Top := 1;
    FTxtAMPM.BorderStyle := bsNone;
    FTxtAMPM.Ctl3D := False;
    FTxtAMPM.ParentCtl3D := False;
    FTxtAMPM.ReadOnly := True;
    FTxtAMPM.TabOrder := 3;
    FTxtAMPM.OnKeyDown := txtAMPMKeyDown;
    FTxtAMPM.OnKeyPress := txtAMPMKeyPress;

    FLblSep1.Color := FTxtHour.Color;
    FLblSep1.AutoSize := False;
    FLblSep1.Top := FTxtHour.Top;
    FLblSep1.Width := 3;

    FLblSep2.Color := FTxtHour.Color;
    FLblSep2.AutoSize := False;
    FLblSep2.Top := FTxtHour.Top;
    FLblSep2.Width := 3;
end;

procedure TtsDateTime.InitMonthCombo;
var
    I: Integer;
begin
    FComboMonth.Col[1].Combo.Grid.StoreData := False;
    FComboMonth.Col[1].Combo.Grid.StoreData := True;
    for I := 1 to 12 do
        FComboMonth.Col[1].Combo.Grid.Cell[1, I] := LongMonthNames[I];
    SetComboValue;
end;

function TtsDateTime.ButYearSizeChanged: Boolean;
begin
    Result := (FButYearIncr.Height <> FOldButYearIncrSize) or
              (FButYearDecr.Height <> FOldButYearDecrSize);
end;

function TtsDateTime.ButTimeSizeChanged: Boolean;
begin
    Result := (FButHourIncr.Height <> FOldButHourIncrSize) or
              (FButHourDecr.Height <> FOldButHourDecrSize);
end;

procedure TtsDateTime.SaveButtonHeights;
begin
    FOldButYearIncrSize := FButYearIncr.Height;
    FOldButYearDecrSize := FButYearDecr.Height;
    FOldButHourIncrSize := FButHourIncr.Height;
    FOldButHourDecrSize := FButHourDecr.Height;
end;

function TtsDateTime.CalcGridRows: Integer;
begin
    if ShowSingleMonth then
    begin
        if ShowDayNames <> sdnNone then Result := 8
                                   else Result := 7;
    end
    else
        Result := Min(Max(CalendarRows, 1), tsMaxCalendarRows);
end;

procedure TtsDateTime.SetComboValue;
begin
    //ShowMessage('TtsDateTime Create Step 6d3b-1');
    FComboMonth.Cell[1, 1] := FComboMonth.Col[1].Combo.Grid.Cell[1, FDisplayMonth];
    //ShowMessage('TtsDateTime Create Step 6d3b-2');
    FComboMonth.RefreshData(roNone, rpNone);
end;

procedure TtsDateTime.BuildGridData;
begin
    CheckMinMaxDate(FDisplayRowInMonth, FDisplayMonth, FDisplayYear);
    BuildGridRows(FDisplayRowInMonth, FDisplayMonth, FDisplayYear);
end;

procedure TtsDateTime.RefreshControls;
begin
    ////ShowMessage('TtsDateTime Create Step 6d3a');
    FDateGrid.RefreshData(roBoth, rpNone);
    ////ShowMessage('TtsDateTime Create Step 6d3b');
    SetComboValue;
    ////ShowMessage('TtsDateTime Create Step 6d3c');
    if FTxtYear.Text <> IntToStr(FDisplayYear) then FTxtYear.Text := IntToStr(FDisplayYear);
end;

procedure TtsDateTime.RefreshDates;
begin
    if not VarIsEmpty(FSelectedDate) then SetSelectedDate(FSelectedDate);
    CheckCurDateTime(True);
end;

procedure TtsDateTime.RefreshData(CheckDates: Boolean);
begin
    //ShowMessage('TtsDateTime Create Step 6d1');
    BuildGridData;
    //ShowMessage('TtsDateTime Create Step 6d2');
    if CheckDates then RefreshDates;
    //ShowMessage('TtsDateTime Create Step 6d3');
    RefreshControls;
    //ShowMessage('TtsDateTime Create Step 6d4');
end;

procedure TtsDateTime.CheckRefreshData(CheckDates: Boolean);
begin
    if IsUpdating then Exit;
    RefreshData(CheckDates);
end;

function TtsDateTime.GetPrevDay(CurDate: TDateTime): TDateTime;
begin
    Result := CurDate - 1;
    if (DayOfWeek(Result) = 1) and not SelectSunday then Result := Result - 1;
    if (DayOfWeek(Result) = 7) and not SelectSaturday then Result := Result - 1;
end;

function TtsDateTime.GetNextDay(CurDate: TDateTime): TDateTime;
begin
    Result := CurDate + 1;
    if (DayOfWeek(Result) = 7) and not SelectSaturday then Result := Result + 1;
    if (DayOfWeek(Result) = 1) and not SelectSunday then Result := Result + 1;
end;

function TtsDateTime.GetValidDate(Value: Variant): TDateTime;
var
    Direction: Integer;
    NewDate: TDateTime;
begin
    if VarIsEmpty(Value) then
        Result := Date
    else if (Value < MinDate) or (Value > MaxDate) then
    begin
        if (Date >= MinDate) and (Date <= MaxDate)
            then Result := Date
            else Result := Value;
    end
    else
        Result := Value;

    Direction := 1;
    if (Result < MinDate) then
    begin
        Result := MinDate;
        Direction := 1;
    end
    else if Result > MaxDate then
    begin
        Result := MaxDate;
        Direction := -1;
    end;

    if Direction = 1 then
    begin
        NewDate := Result;
        if (DayOfWeek(NewDate) = 7) and not SelectSaturday then NewDate := NewDate + 1;
        if (DayOfWeek(NewDate) = 1) and not SelectSunday then NewDate := NewDate + 1;
        if NewDate <= MaxDate then
            Result := NewDate
        else
        begin
            if (DayOfWeek(Result) = 1) and not SelectSunday then Result := Result - 1;
            if (DayOfWeek(Result) = 7) and not SelectSaturday then Result := Result - 1;
        end;
    end;

    if Direction = -1 then
    begin
        NewDate := Result;
        if (DayOfWeek(NewDate) = 1) and not SelectSunday then NewDate := NewDate - 1;
        if (DayOfWeek(NewDate) = 7) and not SelectSaturday then NewDate := NewDate - 1;
        if NewDate >= MinDate then
            Result := NewDate
        else
        begin
            if (DayOfWeek(Result) = 7) and not SelectSaturday then Result := Result + 1;
            if (DayOfWeek(Result) = 1) and not SelectSunday then Result := Result + 1;
        end;
    end;
end;

function TtsDateTime.SetSelectedDate(Value: Variant): TDateTime;
var
    CurDate: TDate;
begin
    CurDate := GetValidDate(Value);
    FSelectedDate := Trunc(CurDate);
    FSelectedRMY := Date2RMYvalue(CurDate);
    FValidDateSelected := True;
    Result := CurDate;
end;

procedure TtsDateTime.SetDisplayDate(Value: TDateTime);
var
    D, M, Y: Word;
begin
    DecodeDate(Value, Y, M, D);
    FDisplayYear := Y;
    FDisplayMonth := M;
    FDisplayRowInMonth := 1;
end;

procedure TtsDateTime.SetSelectedDateInView(Invert: Boolean);
var
    StartDate: TdateTime;
begin
    if GetMinDateInView(StartDate) then
    begin
        if VarIsEmpty(FSelectedDate) then
        begin
            SetSelectedDate(StartDate);
            if Invert then InvertSelectedDate;
        end
        else if (DatePart('y', FSelectedDate) <> DatePart('y', StartDate)) or
                (DatePart('m', FSelectedDate) <> DatePart('m', StartDate)) then
        begin
            SetSelectedDate(StartDate);
            if Invert then InvertSelectedDate;
        end;
    end;
end;

procedure TtsDateTime.SetCurDateTime(Init: Boolean);
var
    CurDate: TDate;
    T: TTime;
begin
    //ShowMessage('TtsDateTime Create Step 6a');
    FMaxYear := DatePart('y', MaxDate);
    FMinYear := DatePart('y', MinDate);
    //ShowMessage('TtsDateTime Create Step 6b');
    FMaxRowMonthYear := DetermineMaxRowMonthYear();
    FTodayRMY := Date2RMYvalue(Date);

    //ShowMessage('TtsDateTime Create Step 6c');
    if Init then
    begin
        CurDate := SetSelectedDate(DateTime);
        SetDisplayDate(CurDate);
    end;
    //ShowMessage('TtsDateTime Create Step 6d');
    RefreshData(False);
    //ShowMessage('TtsDateTime Create Step 6e');
    FOldScrollBarPosition := FDateScrollBar.Position;

    SetComboValue;
    ////ShowMessage('TtsDateTime Create Step 6f');
    if VarIsEmpty(DateTime)
        then T := Time
        else T := Frac(DateTime);

    FTxtAMPM.Text := TimePart('ampm', T);
    FTxtHour.Text := TimePart('h', T);
    FTxtMinute.Text := TimePart('n', T);
    if ShowSeconds
        then FTxtSeconds.Text := TimePart('s', T)
        else FTxtSeconds.Text := '00';

    FPrevHour := StrToInt(FTxtHour.Text);
    FPrevMinute := StrToInt(FTxtMinute.Text);
    FPrevSeconds := StrToInt(FTxtSeconds.Text);
    ////ShowMessage('TtsDateTime Create Step 6g');
end;

procedure TtsDateTime.CheckCurDateTime(Init: Boolean);
begin
    if IsUpdating then Exit;
    SetCurDateTime(Init);
end;

procedure TtsDateTime.SetControlColors;
var
    Color: TColor;
begin
    Color := clWindow;
    if not PopupForm then Color := DisabledColor;

    if FComboMonth.Color <> Color then FComboMonth.Color := Color;
    if FTxtYear.Color <> Color then FTxtYear.Color := Color;
    if FPnlEditYear.Color <> Color then FPnlEditYear.Color := Color;

    if FPnlEditTime.Color <> Color then FPnlEditTime.Color := Color;
    if FLblSep1.Color <> Color then FLblSep1.Color := Color;
    if FLblSep2.Color <> Color then FLblSep2.Color := Color;

    if FTxtHour.Color <> Color then FTxtHour.Color := Color;
    if FTxtMinute.Color <> Color then FTxtMinute.Color := Color;
    if FTxtSeconds.Color <> Color then FTxtSeconds.Color := Color;
    if FTxtAMPM.Color <> Color then FTxtAMPM.Color := Color;
end;

procedure TtsDateTime.SetOkButtonPos;
var
    Metric: TTextMetric;
    AvailableWidth, ButCancelWidth, ButOkWidth, MinButWidth: Integer;
    ButHeight: Integer;
begin
    GetTextMetrics(Canvas.Handle, Metric);
    FButOK.Caption := OkCaption;
    FButCancel.Caption := CancelCaption;

    ButOkWidth := Canvas.TextWidth(FButOK.Caption) + Metric.tmOverhang;
    ButCancelWidth := Canvas.TextWidth(FButCancel.Caption) + Metric.tmOverhang;
    MinButWidth := Max(DefaultButWidth, Max(ButOkWidth, ButCancelWidth) + 10);

    if not PopupForm and (DateTimeDisplay = dtDateTime) then
    begin
        FButOK.Height := Max(DefaultButHeight, FPnlEditTime.Height + 2);
        FButOk.Top := FPnlTime.Top + FPnlTime.Height - FButOk.Height - 1;

        if FPnlTime.Width + ButOKWidth + 11 < FPnlDate.Width then
        begin
            FButOK.Width := Min(MinButWidth, FPnlDate.Width - FPnlTime.Width - 8);
            FButOK.Left := FPnlDate.Left + FPnlDate.Width - FButOK.Width ;
        end
        else
        begin
            FButOK.Width := ButOKWidth;
            FButOK.Left := FPnlDate.Left + FPnlDate.Width - FButOK.Width ;
        end;

        FButCancel.Width := FButOK.Width;
        FButOK.Visible := True;
        FButCancel.Visible := False;
        FBevel.Visible := False;
    end
    else if not PopupForm and (DateTimeDisplay = dtTime) then
    begin
        FButOK.Height := DefaultButHeight;
        FButOk.Top := FPnlTime.Top;
        FButOk.Left := FPnlTime.Left + FPnlTime.Width + 8;
        FButOk.Width := MinButWidth;
        FButOK.Visible := True;
        FButCancel.Visible := False;
        FBevel.Visible := False;
    end
    else if PopupForm then
    begin
        ButHeight := DefaultButHeight;

        if FPnlTime.Visible
            then FButOk.Top := FPnlTime.Top + FPnlTime.Height + 8
            else FButOk.Top := FPnlDate.Top + FPnlDate.Height + 10;

        FButOk.Height := ButHeight;
        FButCancel.Top := FButOk.Top;
        FButCancel.Height := FButOk.Height;

        if DateTimeDisplay = dtTime
            then AvailableWidth := (MinButWidth * 2) + 16
            else AvailableWidth := ClientWidth - 16;

        if MinButWidth * 2 <= AvailableWidth
            then FButOk.Width := MinButWidth
            else FButOk.Width := (AvailableWidth div 2);
        FButCancel.Width := FButOk.Width;

        if DateTimeDisplay = dtTime then
        begin
            FButOk.Left := 8;
            FButCancel.Left := FButOk.Left + FButOk.Width + 8;
        end
        else
        begin
            FButOk.Left := (ClientWidth - (FButOk.Width + FButCancel.Width + 8)) div 2;
            FButCancel.Left := FButOk.Left + FButOk.Width + 8;
        end;

        if DateTimeDisplay <> dtTime then
        begin
            FBevel.Left := -1;
            FBevel.Top := FButOk.Top - 6;
            FBevel.Width := Self.Width + 1;
            FBevel.Visible := True;
        end
        else
            FBevel.Visible := False;

        FButOk.Visible := True;
        FButCancel.Visible := True;
    end
    else
    begin
        FBevel.Visible := False;
        FButOk.Visible := False;
        FButCancel.Visible := False;
    end;
end;

procedure TtsDateTime.SetCalendarHeight;
var
    NewHeight: Integer;
begin
    if DateTimeDisplay in [dtTime, dtDateTime]
        then NewHeight := FPnlTime.Top + FPnlTime.Height + 3
        else NewHeight := FPnlDate.Top * 2 + FPnlDate.Height;
    if FButCancel.Visible then
        NewHeight := Max(NewHeight, FButCancel.Top + FButCancel.Height + 4);
    ClientHeight := NewHeight;
end;

procedure TtsDateTime.SetDayNames;
var
    I, J: Integer;
begin
    for I := 1 to 7 do
    begin
        if (FirstDayOfWeek = dowSunday) then
            J := I
        else if (I = 7) then
            J := 1 
        else
            J := I + 1;

        case ShowDayNames of
            sdnFirstLetter: FDayNames[I] := UpperCase(Copy(ShortDayNames[J], 1, 1));
            sdnShortDayNames: FDayNames[I] := ShortDayNames[J];
            else FDayNames[I] := '';
        end;
    end;
end;

procedure TtsDateTime.PositionDateGrid;
var
    I: Integer;
    Width: Integer;
    Metric: TTextMetric;
begin
    FDateGrid.ResetSelection;
    FDateGrid.Canvas.Font.Assign(Canvas.Font);
    FDateGrid.DefaultRowHeight := FDateGrid.Canvas.TextHeight('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVXWYZ1234567890') + 2;

    //determine max width needed in columns
    Width := FDateGrid.Canvas.TextWidth('00');
    Width := Max(Width, FDateGrid.DefaultRowHeight);

    if ShowDayNames <> sdnNone then
    begin
        SetDayNames;
        for I := 1 to 7 do
        begin
            if FDateGrid.Canvas.TextWidth(FDayNames[I]) > Width then
                Width := FDateGrid.Canvas.TextWidth(FDayNames[I]);
        end;
    end;

    //setup columns
    GetTextMetrics(FDateGrid.Canvas.handle, Metric);
    Width := Width + Metric.tmOverhang;

    If (fsItalic in FDateGrid.Font.Style) and (Metric.tmOverhang = 0) then
        Width := Round(Width * 1.2);

    for I := 2 to 8 do
        FDateGrid.Col[I].Width := Max(15, Width) + 3;

    //setup column with weeknumbers
    FDateGrid.Col[1].Width := Max(7, FDateGrid.Canvas.TextWidth('53') + Metric.tmOverhang) + 1;
    FDateGrid.Col[1].Width := Round(FDateGrid.Col[1].Width * 1.5);
    If (fsItalic in FDateGrid.Font.Style) and (Metric.tmOverhang = 0) then
        FDateGrid.Col[1].Width := Round(FDateGrid.Col[1].Width * 1.2);

    FDateGrid.Col[1].Visible := ShowWeekNumbers;

    //setup rows
    FDateGrid.Rows := CalcGridRows;
    for I := 1 to FDateGrid.Rows do
    begin
        FDateGrid.ResetRowFont(I);
        FDateGrid.AssignRowFont(I);
        FDateGrid.RowHeight[I] := FDateGrid.DefaultRowHeight;
    end;
end;

procedure TtsDateTime.PositionMonthCombo(TextHeight: Integer);
var
    I: Integer;
    Width: Integer;
    BitmapCombo: TBitmap;
    ComboHeight: Integer;
begin
    Width := 0;
    for I := 1 to 12 do
    begin
        if Canvas.TextWidth(LongMonthNames[I]) > Width then
            Width := Canvas.TextWidth(LongMonthNames[I]);
    end;

    FComboMonth.ClientWidth := Round(Width * 1.3) + FComboMonth.DefaultButtonWidth;
    FComboMonth.DefaultColWidth := FComboMonth.ClientWidth + 1;
    FComboMonth.Col[1].Combo.Grid.Col[1].Width := FComboMonth.Width - FComboMonth.DefaultButtonWidth - 1;
    FComboMonth.Col[1].Combo.Grid.DefaultRowHeight := TextHeight + 2;

    ComboHeight := Max(MinEditControlHeight, TextHeight + 1);
    if ComboHeight mod 2 <> 0 then ComboHeight := ComboHeight + 1;
    FComboMonth.ClientHeight := ComboHeight;
    FComboMonth.DefaultRowHeight := FComboMonth.ClientHeight + 1;
    FComboMonth.DefaultButtonHeight := FComboMonth.DefaultRowHeight - (2 * FComboMonth.ButtonEdgeWidth) - 1;
    FComboMonth.Col[1].Combo.Grid.Font := FCOmboMonth.Font;

    BitmapCombo := TBitmap.Create;
    try
        BitMapCombo.LoadFromResourceName(HInstance,'TSCLNDRCOMBO');
        FComboMonth.CreateDefaultCombo(BitmapCombo, clNone, FComboMonth.DefaultButtonWidth, FComboMonth.DefaultButtonHeight);
    finally
        BitmapCombo.Free;
    end;

    FComboBevel.Width := FComboMonth.Width + 2;
    FComboBevel.Height := FComboMonth.Height + 2;
end;

procedure TtsDateTime.PositionYearEdit(TextHeight: Integer);
begin
    FPnlEditYear.ClientHeight := Max(MinEditControlHeight, FComboMonth.Height + 2);
    if FPnlEditYear.Height mod 2 <> 0 then FPnlEditYear.Height := FPnlEditYear.Height + 1;
    FTxtYear.ClientHeight := TextHeight;
    FTxtYear.Top := (FPnlEditYear.Height - FTxtYear.Height) div 2;
    FTxtYear.ClientWidth := Round(Canvas.TextWidth('0000') * 1.1);
    FPnlEditYear.ClientWidth := FTxtYear.Width + 8;
end;

procedure TtsDateTime.PositionScrollBar;
begin
    FDateScrollBar.Height := FPnlCalendar.Height - 2;
    FDateScrollBar.Top := FPnlCalendar.Top + 1;
    FDateScrollBar.Left := FPnlCalendar.Width + FPnlCalendar.Left + 4;
    if GetSystemMetrics(SM_CXVSCROLL) > 0 then
        FDateScrollBar.Width := GetSystemMetrics(SM_CXVSCROLL);
end;

procedure TtsDateTime.PositionYearButtons;
begin
    FButYearIncr.Height := (FPnlEditYear.Height) div 2;
    FButYearDecr.Height := FButYearIncr.Height;
    FButYearIncr.Top := FPnlEditYear.Top;
    FButYearDecr.Top := FButYearIncr.Top + FButYearIncr.Height;
    FButYearIncr.Width := Round(FButYearIncr.Height * 1.7);
    FButYearDecr.Width := Round(FButYearIncr.Height * 1.7);
end;

procedure TtsDateTime.PositionTimeButtons(TxtOffset, AMPMWidth, AMPMOffset,
                                          ButHeight, ButWidth,
                                          ButIncrTop, ButDecrTop: Integer);
begin
    FButHourIncr.Height := ButHeight;
    FButHourDecr.Height := ButHeight;
    FButHourIncr.Width := ButWidth;
    FButHourDecr.Width := ButWidth;
    FButHourIncr.Top := ButIncrTop;
    FButHourDecr.Top := ButDecrTop;

    FButMinIncr.Height := ButHeight;
    FButMinDecr.Height := ButHeight;
    FButMinIncr.Width := ButWidth;
    FButMinDecr.Width := ButWidth;
    FButMinIncr.Top := ButIncrTop;
    FButMinDecr.Top := ButDecrTop;

    FButSecIncr.Height := ButHeight;
    FButSecDecr.Height := ButHeight;
    FButSecIncr.Width := ButWidth;
    FButSecDecr.Width := ButWidth;
    FButSecIncr.Top := ButIncrTop;
    FButSecDecr.Top := ButDecrTop;

    FButAMPMIncr.Height := ButHeight;
    FButAMPMDecr.Height := ButHeight;
    FButAMPMIncr.Width := AMPMWidth div 2;
    FButAMPMDecr.Width := AMPMWidth div 2;
    FButAMPMIncr.Top := ButIncrTop;
    FButAMPMDecr.Top := ButDecrTop;

    FButHourDecr.Left := FTxtHour.Left - TxtOffset + 1;
    FButHourIncr.Left := FButHourDecr.Left + FButHourDecr.Width;

    FButMinDecr.Left := FTxtMinute.Left - TxtOffset + 1;
    FButMinIncr.Left := FButMinDecr.Left + FButMinDecr.Width;

    if ShowSeconds then
    begin
        FButSecDecr.Left := FTxtSeconds.Left - TxtOffset + 1;
        FButSecIncr.Left := FButSecDecr.Left + FButSecDecr.Width;

        FButAMPMDecr.Left := FTxtAMPM.Left - AMPMOffset;
        FButAMPMIncr.Left := FButAMPMDecr.Left + FButAMPMDecr.Width;
    end
    else
    begin
        FButAMPMDecr.Left := FTxtAMPM.Left;
        FButAMPMIncr.Left := FButAMPMDecr.Left + FButAMPMDecr.Width;
    end;
end;

function TtsDateTime.GetAMPMWidth: Integer;
begin
    Result := Round(Max(Canvas.TextWidth('AM'), Max(Canvas.TextWidth(TimeAMString), Canvas.TextWidth(TimePMString))) * 1.2);
end;

procedure TtsDateTime.PositionTimeControls(TextHeight: Integer);
var
    TxtWidth, AMPMWidth: Integer;
    TxtOffset, AMPMOffset: Integer;
    ButHeight, ButWidth: Integer;
    ButIncrTop, ButDecrTop: Integer;
    TxtTop: Integer;
    PnlTimeWidth: Integer;
begin
    TxtWidth := Round(Canvas.TextWidth('00') * 1.6);
    if TxtWidth mod 2 <> 0 then TxtWidth := TxtWidth + 1;
    TxtWidth := Max(22, TxtWidth);

    AMPMWidth := GetAMPMWidth;
    if AMPMWidth mod 2 <> 0 then AMPMWidth := AMPMWidth + 1;
    AMPMWidth := Max(22, AMPMWidth);
    AMPMOffset := 0;

    FTxtHour.ClientWidth := Round(Canvas.TextWidth('00') * 1.0);
    FTxtMinute.ClientWidth := FTxtHour.ClientWidth;

    if ShowSeconds then
    begin
        FTxtSeconds.ClientWidth := FTxtHour.ClientWidth;
        FTxtSeconds.Visible := True;
        FButSecIncr.Visible := True;
        FButSecDecr.Visible := True;
        FLblSep2.Visible := True;
    end
    else
    begin
        FTxtSeconds.Width := 0;
        FTxtSeconds.Visible := False;
        FButSecIncr.Visible := False;
        FButSecDecr.Visible := False;
        FLblSep2.Visible := False;
    end;

    if FFormat24Hour then
    begin
        FTxtAMPM.Visible := False;
        FTxtAMPM.Width := 0;
        FButAMPMIncr.Visible := False;
        FButAMPMDecr.Visible := False;
    end
    else
    begin
        FTxtAMPM.Visible := True;
        FButAMPMIncr.Visible := True;
        FButAMPMDecr.Visible := True;
        FTxtAMPM.ClientWidth := GetAMPMWidth;
        AMPMOffset := (AMPMWidth - FTxtAMPM.Width) div 2;
        FTxtAMPM.MaxLength := Max(Length(TimeAMString), Length(TimePMString));
    end;

    FLblSep1.Caption := TimeSeparator;
    FLblSep2.Caption := TimeSeparator;

    FTxtHour.ClientHeight := TextHeight;
    FTxtMinute.Height := FTxtHour.Height;
    FTxtSeconds.Height := FTxtHour.Height;
    FTxtAMPM.Height := FTxtHour.Height;
    FLblSep1.Height := FTxtHour.Height;
    FLblSep2.Height := FTxtHour.Height;

    if DateTimeDisplay = dtTime then
        FPnlEditTime.Height := Max(MinEditControlHeight + 4, TextHeight + 1)
    else
        FPnlEditTime.Height := Max(FPnlEditYear.Height, FTxtHour.Height + 2);
    TxtTop := (FPnlEditTime.Height - FTxtHour.Height) div 2;
    FTxtHour.Top := TxtTop;
    FTxtMinute.Top := TxtTop;
    FTxtSeconds.Top := TxtTop;
    FTxtAMPM.Top := TxtTop;
    FLblSep1.Top := Max(1, TxtTop - 1);
    FLblSep2.Top := Max(1, TxtTop - 1);

    TxtOffset := (TxtWidth - FTxtHour.Width) div 2;
    FTxtHour.Left := 1 + TxtOffset;
    FTxtMinute.Left := FTxtHour.Left + TxtWidth + 4;

    if ShowSeconds then
    begin
        FTxtSeconds.Left := FTxtMinute.Left + TxtWidth + 4;
        FTxtAMPM.Left := FTxtSeconds.Left + TxtWidth + 4 + AMPMOffset;
    end
    else
        FTxtAMPM.Left := FTxtMinute.Left + TxtWidth + 4;

    ButHeight := Round(FPnlEditTime.Height * 0.6);
    ButWidth := TxtWidth div 2;
    ButIncrTop := FPnlEditTime.Top + FPnlEditTime.Height + 2;
    ButDecrTop := ButIncrTop;

    FPnlTime.ClientHeight := FPnlEditTime.Height + ButHeight + 3;
    FLblSep1.Left := (FTxtHour.Left + FTxtHour.Width + FTxtMinute.Left - 1) div 2;
    FLblSep2.Left := 1 + FLblSep1.Left + FLblSep1.Width + TxtWidth;

    PositionTimeButtons(TxtOffset, AMPMWidth, AMPMOffset, ButHeight, ButWidth, ButIncrTop, ButDecrTop);

    if FTxtAMPM.Visible then
        PnlTimeWidth := FTxtAMPM.Left + AMPMWidth - AMPMOffset + 3
    else if ShowSeconds then
        PnlTimeWidth := FTxtSeconds.Left + TxtWidth - TxtOffset + 3
    else
        PnlTimeWidth := FTxtMinute.Left + TxtWidth - TxtOffset + 3;

    FPnlEditTime.Width := PnlTimeWidth;
    FPnlTime.Width := PnlTimeWidth;
end;

procedure TtsDateTime.SetButtonGlyphs(ButtonHeight: Integer);
var
    Bitmap: TBitmap;
    Glyph: TBitmap;
begin
    if ButTimeSizeChanged or ButYearSizeChanged then
    begin
        Bitmap := TBitmap.Create;
        Glyph := TBitmap.Create;
        try
            Glyph.Height := ButtonHeight div 2;
            if Glyph.Height mod 2 <> 1 then Glyph.Height := Glyph.Height - 1;
            Glyph.Width := Glyph.Height;

            Bitmap.Width := 5;
            Bitmap.Height := 5;

            Bitmap.Canvas.Brush.Style := bsSolid;
            Bitmap.Canvas.Brush.Color := clBtnFace;
            Bitmap.Canvas.FillRect(Rect(0, 0, Bitmap.Width, Bitmap.Height));
            Bitmap.Canvas.Pen.Color := clBtnText;
            Bitmap.Canvas.Pen.Width := 1;
            Bitmap.Canvas.MoveTo(0, 2);
            Bitmap.Canvas.LineTo(5, 2);

            Glyph.Canvas.StretchDraw(Rect(0, 0, Glyph.Width, Glyph.Height), Bitmap);
            if ButYearSizeChanged then FButYearDecr.Glyph.Assign(Glyph);
            if ButTimeSizeChanged then
            begin
                FButHourDecr.Glyph.Assign(Glyph);
                FButMinDecr.Glyph.Assign(Glyph);
                FButSecDecr.Glyph.Assign(Glyph);
                FButAMPMDecr.Glyph.Assign(Glyph);
            end;

            Bitmap.Canvas.MoveTo(2, 0);
            Bitmap.Canvas.LineTo(2, 5);

            Glyph.Canvas.StretchDraw(Rect(0, 0, Glyph.Width, Glyph.Height), Bitmap);
            if ButYearSizeChanged then FButYearIncr.Glyph.Assign(Glyph);
            if ButTimeSizeChanged then
            begin
                FButHourIncr.Glyph.Assign(Glyph);
                FButMinIncr.Glyph.Assign(Glyph);
                FButSecIncr.Glyph.Assign(Glyph);
                FButAMPMIncr.Glyph.Assign(Glyph);
            end;
        finally
            Bitmap.Free;
            Glyph.Free;
        end;

        SaveButtonHeights;
    end;
end;

procedure TtsDateTime.PositionControls;
var
    I, Width, ButtonHeight: Integer;
    TextHeight: Integer;
    ButYearIncrLeft: Integer;
begin
    if not HandleAllocated then Exit;
    if FInPositionControls then Exit;

    FInPositionControls := True;
    try
        ButYearIncrLeft := 0;
        if Assigned(Font) then Canvas.Font.Assign(Font);
        TextHeight := Canvas.TextHeight(LongMonthNames[1]);

        if DateTimeDisplay in [dtDate, dtDateTime] then
        begin
            PositionDateGrid;
            PositionMonthCombo(TextHeight);
            PositionYearEdit(TextHeight);

            FPnlCalendar.Height := FDateGrid.Rows * FDateGrid.RowHeight[1] + 3;
            FPnlCalendar.Top := FPnlEditYear.Height + 4;
            Width := 0;
            for i := 1 to FDateGrid.Cols do
                if (i > 1) or ShowWeekNumbers then Width := Width + FDateGrid.Col[i].Width;
            FPnlCalendar.Width := Width + 5;

            PositionScrollBar;
            PositionYearButtons;

            ButYearIncrLeft := FComboMonth.Left + FComboMonth.Width + 12 + FPnlEditYear.Width + 1;
            FPnlDate.Height := FPnlCalendar.Top + FPnlCalendar.Height;
            FPnlDate.Width := Max(FDateScrollBar.Left + FDateScrollBar.Width + 1, ButYearIncrLeft + FButYearIncr.Width);
        end;

        if DateTimeDisplay in [dtTime, dtDateTime] then
        begin
            GetHourFormat;
            PositionTimeControls(TextHeight);
        end;

        if PopupForm
            then BorderStyle := bsNone
            else BorderStyle := bsSingle;

        if DateTimeDisplay = dtTime then
        begin
            FPnlTime.Top := 4;
            if not PopupForm then FPnlTime.Left := FPnlTime.Top;;
            SetOkButtonPos;
            FPnlTime.Visible := True;
            FPnlDate.Visible := False;
            if FButOk.Visible
                then ClientWidth := Max(Max(FButOk.Left + FButOk.Width + 8, FButCancel.Left + FButCancel.Width + 8), FPnlTime.Width + 12)
                else ClientWidth := FPnlTime.Left * 2 + FPnlTime.Width + 4;

            if PopupForm then FPnlTime.Left := (ClientWidth - FPnlTime.Width) div 2;
            ButtonHeight := FButHourIncr.ClientHeight;
            FTxtHour.SelStart := 0;
            FTxtHour.SelLength := Length(FTxtHour.Text);
        end
        else if DateTimeDisplay = dtDateTime then
        begin
            FPnlDate.Top := 4;
            FPnlDate.Left := FPnlDate.Top;
            FPnlDate.Visible := True;
            FPnlTime.Visible := True;
            FPnlTime.Top := FPnlDate.Top + FPnlDate.Height + 4;
            FPnlTime.Left := FPnlDate.Left;
            ClientWidth := Max(2 * FPnlTime.Left + FPnlTime.Width, 2 * FPnlDate.Left + FPnlDate.Width);
            ButtonHeight := FButYearIncr.ClientHeight;
            SetOkButtonPos;
        end
        else
        begin
            FPnlDate.Top := 4;
            FPnlDate.Left := FPnlDate.Top;
            FPnlDate.Visible := True;
            FPnlTime.Visible := False;
            ClientWidth := FPnlDate.Left * 2 + FPnlDate.Width;
            ButtonHeight := FButYearIncr.ClientHeight;
            SetOkButtonPos;
        end;

        SetCalendarHeight;

        if DateTimeDisplay in [dtDate, dtDateTime] then
        begin
            if ButYearIncrLeft + FButYearIncr.Width < FDateGrid.Left + FDateGrid.Width then
            begin
                FButYearIncr.Left := FDateGrid.Left + FDateGrid.Width - FButYearIncr.Width + 1;
                FButYearDecr.Left := FButYearIncr.Left;
                FPnlEditYear.Left := FButYearIncr.Left - FPnlEditYear.Width - 1;
            end
            else
            begin
                FButYearIncr.Left := FPnlDate.Width - FButYearIncr.Width;
                FButYearDecr.Left := FButYearIncr.Left;
                FPnlEditYear.Left := FButYearIncr.Left - FPnlEditYear.Width - 1;
            end;
        end;

        SetButtonGlyphs(ButtonHeight);
        SetControlColors;
    finally
        FInPositionControls := False;
    end;
end;

procedure TtsDateTime.InitializeDisplay;
begin
    if not HandleAllocated
        then HandleNeeded
        else ReAlign;
    SetCurDateTime(True);
end;

procedure TtsDateTime.InitializeFocus;
begin
    if DateTimeDisplay in [dtDate, dtDateTime] then
        FDateGrid.SetFocus
    else
    begin
        FTxtHour.SetFocus;
        FTxtHour.SelStart := 0;
        FTxtHour.SelLength := Length(FTxtHour.Text);
    end;
end;

procedure TtsDateTime.ReAlign;
begin
    inherited;
    PositionControls;
end;

procedure TtsDateTime.SetFocus;
begin
    if DateTimeDisplay in [dtDate, dtDateTime] then
        FComboMonth.SetFocus
    else
    begin
        FTxtHour.SelStart := 0;
        FTxtHour.SelLength := 0;
        FTxtHour.SetFocus;
    end;
end;

function TtsDateTime.Max(i, j: Integer): Integer;
begin
    if i > j then
        Result := i
    else
        Result := j;
end;

function TtsDateTime.Min(i, j: Integer): Integer;
begin
    if i < j then
        Result := i
    else
        Result := j;
end;

procedure TtsDateTime.GetHourFormat;
begin
    if not AMPMFormat 
        then FFormat24Hour := True
        else FFormat24Hour := False;
end;

function TtsDateTime.TimePart(Code: String; Value: TTime): String;
begin
    Result := '';
    Code := LowerCase(Code);

    GetHourFormat;
    if Code = 'h' then
    begin
        if FFormat24Hour then
            Result := FormatDateTime('hh', Value)
        else
            Result := Copy(FormatDateTime('hh ampm', Value), 1, 2);
    end
    else if Code = 'n' then
        Result := FormatDateTime('nn', Value)
    else if Code = 's' then
        Result := FormatDateTime('ss', Value)
    else if (Code = 'ampm') and not FFormat24Hour then
        Result := FormatDateTime('ampm', Value);
end;

function TtsDateTime.DatePart(Code: String; Value: TDate): Word;
begin
    Code := LowerCase(Code);

    if Code = 'd' then
        Result := StrToInt(FormatDateTime('d', Value))
    else if Code = 'm' then
        Result := StrToInt(FormatDateTime('m', Value))
    else if Code = 'y' then
        Result := StrToInt(FormatDateTime('yyyy', Value))
    else
        Result := 0;
end;

procedure TtsDateTime.ToggleAMPM;
begin
    if Lowercase(Trim(FTxtAMPM.Text)) = Lowercase(Trim(TimePMString)) then
        FTxtAMPM.Text := TimeAMString
    else
        FTxtAMPM.Text := TimePMString;
end;

procedure TtsDateTime.SetButControlFocus(Button: TSpeedButton);
var
    Control: TEdit;
begin
    Control := nil;
    if (Button = FButYearIncr) or (Button = FButYearDecr) then
        Control := FTxtYear
    else if (Button = FButHourIncr) or (Button = FButHourDecr) then
        Control := FTxtHour
    else if (Button = FButMinIncr) or (Button = FButMinDecr) then
        Control := FTxtMinute
    else if (Button = FButSecIncr) or (Button = FButSecDecr) then
        Control := FTxtSeconds
    else if (Button = FButAMPMIncr) or (Button = FButAMPMDecr) then
        Control := FTxtAMPM;

    FActiveControl := Control;
    if Assigned(Control) then
    begin
        if (not Control.Focused) then
        begin
            Control.AutoSelect := False;
            Control.SelLength := 0;
            Control.SetFocus;
            Control.AutoSelect := True;
        end;
    end;
end;

procedure TtsDateTime.IncHour;
var
    Temp: Integer;
begin
    if FTxtHour.Text = '' then Exit;

    Temp := StrToInt(FTxtHour.Text);
    if FFormat24Hour then
    begin
        Inc(Temp, 1);
        if Temp > 23 then Temp := 0;
    end
    else
    begin
        Inc(Temp, 1);
        if Temp > 12 then Temp := 1;
    end;
    FTxtHour.Text := Format('%2.2d', [Temp]);
end;

procedure TtsDateTime.IncMinutes;
var
    Temp: Integer;
begin
    if FTxtMinute.Text = '' then Exit;

    Temp := StrToInt(FTxtMinute.Text);
    Inc(Temp, 1);
    if Temp > 59 then Temp := 0;
    FTxtMinute.Text := Format('%2.2d', [Temp]);
end;

procedure TtsDateTime.IncSeconds;
var
    Temp: Integer;
begin
    if FTxtSeconds.Text = '' then Exit;

    Temp := StrToInt(FTxtSeconds.Text);
    Inc(Temp, 1);
    if Temp > 59 then Temp := 0;
    FTxtSeconds.Text := Format('%2.2d', [Temp]);
end;


procedure TtsDateTime.DecHour;
var
    Temp: Integer;
begin
    if FTxtHour.Text = '' then Exit;

    Temp := StrToInt(FTxtHour.Text);
    if FFormat24Hour then
    begin
        Dec(Temp, 1);
        if Temp < 0 then Temp := 23;
    end
    else
    begin
        Dec(Temp, 1);
        if Temp < 1 then Temp := 12;
    end;
    FTxtHour.Text := Format('%2.2d', [Temp]);
end;

procedure TtsDateTime.DecMinutes;
var
    Temp: Integer;
begin
    if FTxtMinute.Text = '' then Exit;

    Temp := StrToInt(FTxtMinute.Text);
    Dec(Temp, 1);
    if Temp < 0 then Temp := 59;
    FTxtMinute.Text := Format('%2.2d', [Temp]);
end;

procedure TtsDateTime.DecSeconds;
var
    Temp: Integer;
begin
    if FTxtSeconds.Text = '' then Exit;

    Temp := StrToInt(FTxtSeconds.Text);
    Dec(Temp, 1);
    if Temp < 0 then Temp := 59;
    FTxtSeconds.Text := Format('%2.2d', [Temp]);
end;

function TtsDateTime.tsDayOfWeek(Value: TDate): Integer;
var
    I: Integer;
begin
    I := DayOfWeek(Value);
    if FirstDayOfWeek = dowMonday then Dec(I,1);
    if I = 0 then I := 7;
    Result := I;
end;

function TtsDateTime.ISODayOfWeek(Value: TDate): Integer;
var
    I: Integer;
begin
    I := DayOfWeek(Value) - 1;
    if I = 0 then I := 7;
    Result := I;
end;

function TtsDateTime.WeekNumber(Value: TDate): Word;
//calculate the weeknumber of a given date
var
    Day, Month, Year: Word;
    Days, i, DOW, Weeknr: Integer;
begin
    DecodeDate(Value, Year, Month, Day);
    DOW := ISODayOfWeek(EncodeDate(Year, 1, 1));
    Weeknr := 0;
    if DOW > 4 then
        // if jan 1st is in the 2nd half of the week
        // then jan 1st is not week 1 but week 52/53 of the prev year
        Weeknr :=  - 1;

    Days := Day - 1 + DOW - 1;
    for i := 1 to Month - 1 do
        Days := Days + MonthDays[IsLeapYear(Year), i];

    Weeknr := Weeknr + (Days div 7) + 1;

    if Weeknr <= 0 then
        Weeknr := WeekNumber(EncodeDate(Year - 1, 12, 31))  //get weeknr of 31 - 12 of prev year
    else if (Month = 12) then
    begin
        //check if in first week of following year
        DOW := ISODayOfWeek(EncodeDate(Year + 1, 1, 1));
        if (DOW <= 4) and (Day + DOW - 1 > 31) then Weeknr := 1;
    end;

    Result := Weeknr;
end;

function TtsDateTime.CaptionStr(DateTimeDisplay: TtsDateTimeDisplay): string;
begin
    Result := '';
    case DateTimeDisplay of
        dtDate: Result := DateCaption;
        dtDateTime: Result := DateTimeCaption;
        dtTime: Result := TimeCaption;
    end;
end;

function TtsDateTime.IsDefaultCaption(Caption: string): Boolean;
var
    I: TtsDateTimeDisplay;
begin
    for I := Low(TtsDateTimeDisplay) to High(TtsDateTimeDisplay) do
    begin
        Result := Caption = CaptionStr(I);
        if Result then Break;
    end;
end;

function TtsDateTime.RowsInMonth(Month: Integer; Year:Integer): Integer;
//calculates the rowcount needed to display a given month
var
    Days: Integer;
    Rows: Single;
begin
    Days := MonthDays[IsLeapYear(Year), Month] + tsDayOfWeek(EncodeDate(Year, Month, 1)) - 1;

    Rows := Days / 7 + 1;    // + 1 for the monthheader
    if ShowDayNames <> sdnNone then Rows := Rows + 1;
    if Rows - Trunc(Rows) > 0 then Rows := Rows + 1;

    Result := Trunc(Rows);
end;

procedure TtsDateTime.IncRow(var Row: Integer; var Month: Integer; var Year: Integer);
begin
    inc(Row, 1);
    if Row > RowsInMonth(Month, Year) then
    begin
        Row := 1;
        IncMonth(Month, Year);
    end;
end;

procedure TtsDateTime.DecRow(var Row: Integer; var Month: Integer; var Year: Integer);
begin
    dec(Row, 1);
    if Row < 1 then
    begin
        DecMonth(Month, Year);
        Row := RowsInMonth(Month, Year);
    end;
end;

procedure TtsDateTime.CheckValidDate(var Month, Year: Integer);
begin
    if Year > MaxCalendarYear then
    begin
        Year := MaxCalendarYear;
        Month := 12;
    end
    else if Year < MinCalendarYear then
    begin
        Year := MinCalendarYear;
        Month := 1;
    end;
end;

procedure TtsDateTime.DecMonth(var Month: Integer; var Year: Integer);
begin
    Dec(Month, 1);
    if Month < 1 then
    begin
        Dec(Year, 1);
        Month := 12;
    end;
    CheckValidDate(Month, Year);
end;

procedure TtsDateTime.IncMonth(var Month: Integer; var Year: Integer);
begin
    Inc(Month, 1);
    if Month > 12 then
    begin
        Inc(Year, 1);
        Month := 1;
    end;
    CheckValidDate(Month, Year);
end;

function TtsDateTime.GetFullYear(YearStr: string): Integer;
var
    CurY, CurM, CurD: Word;
    Century: Word;
begin
    Result := StrToInt(YearStr);
    if (Result <= 99) and (Length(Trim(YearStr)) <= 2) then
    begin
        DecodeDate(Date, CurY, CurM, CurD);
        Century := (CurY div 100) * 100;
        Result := Result + Century;
        if Result < CurY - 50 then
            Result := Result + 100
        else if Result > CurY + 50 then
            Result := Result - 100;

        if Result <= 0 then
            Result := 1
        else if Result > 9999 then
            Result := 9999;
    end;
end;

function TtsDateTime.YearOk(YearStr: string): Boolean;
var
    Year: Integer;
begin
    Result := False;
    if YearStr = '' then Exit;

    Year := GetFullYear(YearStr);
    Result := (Year >= FMinYear) and (Year <= FMaxYear);
end;

procedure TtsDateTime.CheckEnableButton;
var
    Ok: Boolean;
begin
    Ok := ((not FTxtHour.Visible) or (FTxtHour.Text <> '')) and
          ((not FTxtMinute.Visible) or (FTxtMinute.Text <> '')) and
          ((not FTxtSeconds.Visible) or (FTxtSeconds.Text <> ''));
    FButOk.Enabled := Ok;
    FButCancel.Enabled := Ok;
end;

procedure TtsDateTime.CheckMinMaxDate(var RowInMonth: Integer; var Month: Integer; var Year: Integer);
begin
    if Year * 1000 + Month * 10 + RowInMonth > FMaxRowMonthYear then
        DecodeRMYvalue(FMaxRowMonthYear, RowInMonth, Month, Year);

    if 100 * Year + Month < 100 * DatePart('y', MinDate) + DatePart('m', MinDate) then
    begin
        Year := DatePart('y', MinDate);
        Month := DatePart('m', MinDate);
        RowInMonth := 1;
    end;
end;

function TtsDateTime.Date2RMYValue(Value: TDate): Integer;
//RMY = Row in month + Month + Year combined in an integer value
var
    Month, Year: Integer;
    Rows: Single;
begin
    Month := DatePart('m', Value);
    Year := DatePart('y', Value);

    Rows := (DatePart('d', Value) + tsDayOfWeek(EncodeDate(Year, Month, 1)) - 1) / 7 + 1;
    if ShowDayNames <> sdnNone then Rows := Rows + 1;
    if Rows - Trunc(Rows) > 0 then Rows := Rows + 1;

    Result := Year * 1000 + Month * 10 + Trunc(Rows);
end;

procedure TtsDateTime.DecodeRMYvalue(RMYvalue: Integer; var RowInMonth: Integer; var Month: Integer; var Year: Integer);
begin
    RowInMonth := RMYvalue mod 10;
    Month := (RMYvalue div 10) mod 100;
    Year := RMYvalue div 1000;
end;

function TtsDateTime.FirstDayOfRMY(RMYvalue: Integer): Integer;
//Calculates the first day of the row pointed to by RMYvalue
//This can be a negative number, if it points to the row of the first week of the month
//and the month does not start on the 1st day of the week
var
    Row, Month, Year: Integer;
begin
    DecodeRMYvalue(RMYvalue, Row, Month, Year);

    Dec(Row, 2);
    if ShowDayNames <> sdnNone then Dec(Row, 1);

    Result := 7 * Row + 1;
    Dec(Result, tsDayOfWeek(EncodeDate(Year, Month, 1)) - 1);
end;

function TtsDateTime.DetermineMaxRowMonthYear: Integer;
var
    i, Month, Year: Integer;
begin
    Month := DatePart('m', MaxDate);
    Year := DatePart('y', MaxDate);

    if ShowSingleMonth then
    begin
        Result := Year * 1000 + Month * 10 + 1;
    end
    else
    begin
        i := CalendarRows;
        while i > RowsInMonth(Month, Year) do
        begin
            Dec(i, RowsInMonth(Month, Year));
            DecMonth(Month, Year);
        end;

        Result := Year * 1000 + Month * 10 + RowsInMonth(Month, Year) - i + 1;
    end;
end;

function TtsDateTime.GetFirstDayInRow(Year, Month, RowInMonth: Integer): Integer;
begin
    //calculate day #1 of the week pointed to by StartRowsInMonth
    Result := (RowInMonth - 3 - Ord(ShowDayNames <> sdnNone)) * 7 + (7 - tsDayOfWeek(EncodeDate(Year, Month, 1)) + 1) + 1;
    if Result < 1 then Result := 1;
end;

procedure TtsDateTime.BuildGridRows(RowInMonth: Integer; Month: Integer; Year: Integer);
//Fills the FRowData with all (coded) dates to be displayed in the grid.
var
    i, x, y, Day: Integer;
    DateValue: TDate;
begin
    Day := 1;
    if not ((RowInMonth = 1) or ((RowInMonth = 2) and (ShowDayNames <> sdnNone))) then
    begin
        Day := GetFirstDayInRow(Year, Month, RowInMonth);
    end;

    y := 1;
    repeat
        FRowData[y].MonthYear := Month + Year * 100;
        FRowData[y].RowInMonth := RowInMonth;
        FRowData[y].WeekNumber := 0;

        if (RowInMonth = 1) then
        begin
            FRowData[y].RowType := crtMonthHeader;
            inc(y, 1);
            inc(RowInMonth, 1);
        end
        else if (RowInMonth = 2) and (ShowDayNames <> sdnNone) then
        begin
            FRowData[y].RowType := crtDayNames;
            inc(y, 1);
            inc(RowInMonth, 1);
        end
        else
        begin
            repeat
                FRowData[y].MonthYear := Month + Year * 100;
                FRowData[y].RowInMonth := RowInMonth;
                FRowData[y].RowType := crtDays;

                //calculate week number based on weeks starting on Monday
                if FirstDayOfWeek = dowMonday then
                    FRowData[y].WeekNumber := WeekNumber(EncodeDate(Year, Month, Day))
                else
                begin
                    //if current week starts on sunday, get weeknr for monday
                    if tsDayOfWeek(EncodeDate(Year, Month, Day)) = 1 then
                        FRowData[y].WeekNumber := WeekNumber(EncodeDate(Year, Month, Day) + 1)
                    else
                        FRowData[y].WeekNumber := WeekNumber(EncodeDate(Year, Month, Day));
                end;

                x := tsDayOfWeek(EncodeDate(Year, Month, Day));  //starting position in first row

                for i := 1 to 7 do FRowData[y].Days[i] := 0;

                repeat
                    DateValue := EncodeDate(Year, Month, Day);

                    FRowData[y].Days[x] := Day;
                    if (DateValue < MinDate) then
                        FRowData[y].Days[x] :=  - FRowData[y].Days[x]
                    else
                    begin
                        if (DateValue > MaxDate) then
                            FRowData[y].Days[x] :=  - FRowData[y].Days[x]
                        else
                            case DayOfWeek(DateValue) of
                                1: if not SelectSunday then FRowData[y].Days[x] :=  - FRowData[y].Days[x];
                                7: if not SelectSaturday then FRowData[y].Days[x] :=  - FRowData[y].Days[x];
                            end;
                    end;

                    inc(Day, 1);
                    inc(x, 1);
                until (x > 7) or (Day > MonthDays[IsLeapYear(Year), Month]);

                inc(y, 1);
                inc(RowInMonth, 1);
            until (y > FDateGrid.Rows) or (Day > MonthDays[IsLeapYear(Year), Month]);

            if ShowSingleMonth then
            begin
                repeat
                    FRowData[y].MonthYear := Month + Year * 100;
                    FRowData[y].RowInMonth := RowInMonth;
                    FRowData[y].RowType := crtDays;
                    FRowData[y].WeekNumber := 0;

                    for i := 1 to 7 do FRowData[y].Days[i] := 0;

                    inc(y, 1);
                    inc(RowInMonth, 1);
                until y > FDateGrid.Rows;
                Break;
            end;

            Day := 1;
            IncMonth(Month, Year);
            RowInMonth := 1;
        end;
    until y > FDateGrid.Rows;
end;

function TtsDateTime.GetRMYRow(RMY: Integer): Integer;
var
    Row: Integer;
begin
    Result := 0;
    for Row := 1 to FDateGrid.Rows do
    begin
        if (FRowData[Row].RowType = crtDays) and ((FRowData[Row].MonthYear * 10 + FRowData[Row].RowInMonth) = RMY) then
        begin
            Result := Row;
            Break;
        end;
    end;
end;

procedure TtsDateTime.InvertSelectedDate;
var
    Row, Col: Integer;
    Rect: TRect;
begin
    if FValidDateSelected then
    begin
        Row := GetRMYRow(FSelectedRMY);
        if Row > 0 then
        begin
            //invert the currently selected date
            Col := DatePart('d', FSelectedDate) - FirstDayOfRMY(FSelectedRMY) + 2;
            Rect := FDateGrid.CellRect(Col, Row);
            Dec(Rect.Top, 1);
            Dec(Rect.Bottom, 1);

            FDateGrid.Canvas.CopyMode := cmDstInvert;
            FDateGrid.Canvas.CopyRect(Rect, FDateGrid.Canvas, Rect);
        end;
    end;

    if ShowToday then
    begin
        Row := GetRMYRow(FTodayRMY);
        if Row > 0 then
        begin
            //draw a frame around today's date
            Col := DatePart('d', Date) - FirstDayOfRMY(FTodayRMY) + 2;

            Rect := FDateGrid.CellRect(Col, Row);
            Dec(Rect.Top, 1);
            Dec(Rect.Bottom, 1);
            FDateGrid.Canvas.Brush.Color := clRed;
            FDateGrid.Canvas.FrameRect(Rect);
        end;
    end;
end;

procedure TtsDateTime.SelectDate(Col, Row: Integer);
begin
    if FValidDateSelected then InvertSelectedDate;

    FSelectedDate := EncodeDate(FRowData[Row].MonthYear div 100, FRowData[Row].MonthYear mod 100, FRowData[Row].Days[Col - 1]);
    FSelectedRMY := Date2RMYvalue(FSelectedDate);
    FValidDateSelected := True;
    InvertSelectedDate;
end;

procedure TtsDateTime.DoSelect;
begin
    if Assigned(FOnSelect) then FOnSelect(Self);
end;

procedure TtsDateTime.DoCancel;
begin
    if Assigned(FOnCancel) then FOnCancel(Self);
end;

procedure TtsDateTime.BeginUpdate;
begin
    Inc(FUpdateCount);
end;

procedure TtsDateTime.EndUpdate;
begin
    if FUpdateCount > 0 then Dec(FUpdateCount);
    if FUpdateCount = 0 then
    begin
        CheckReAlign;
        RefreshDates;
    end;
end;

function TtsDateTime.IsUpdating: Boolean;
begin
    Result := FUpdateCount > 0;
end;

procedure TtsDateTime.CheckUpdate;
begin
    if IsUpdating then Exit;
    Invalidate;
    InvalidateControls(Self);
end;

procedure TtsDateTime.CheckUpdateCalendar;
begin
    if IsUpdating then Exit;
    FDateGrid.Invalidate;
end;

procedure TtsDateTime.CheckReAlign;
begin
    if IsUpdating then Exit;
    ReAlign;
end;

procedure TtsDateTime.InvalidateControls(Control: TWinControl);
var
    I: Integer;
begin
    for I := 1 to Control.ControlCount do
    begin
        Control.Controls[I-1].Invalidate;
        if Control.Controls[I-1] is TWinControl then
            InvalidateControls(TWinControl(Control.Controls[I-1]));
    end;
end;

procedure TtsDateTime.SetColor(Value: TColor);
begin
    if Value <> FDateGrid.Color then
    begin
        FDateGrid.Color := Value;
        CheckUpdateCalendar;
    end;
end;

function TtsDateTime.GetColor: TColor;
begin
    Result := FDateGrid.Color;
end;

procedure TtsDateTime.SetDateTime(Value: Variant);
begin
    if not VariantEqual(FDateTime, Value) then
    begin
        if VarIsEmpty(Value) or (VarType(Value) in [varDate, varDouble]) then
        begin
            FDateTime := Value;
            CheckCurDateTime(True);
        end;
    end;
end;

function TtsDateTime.GetDateTime: Variant;
begin
    if VarIsEmpty(FDateTime) or not (VarType(FDateTime) in [varDate, varDouble])
        then Result := FDateTime
        else Result := VarAsType(FDateTime, varDate);
end;

procedure TtsDateTime.SetCalendarRows(Value: Integer);
begin
    if Value <> FCalendarRows then
    begin
        FCalendarRows := Min(tsMaxCalendarRows, Value);
        FDateGrid.Rows := CalcGridRows;
        CheckRealign;
        CheckRefreshData(False);
    end;
end;

procedure TtsDateTime.SetDateTimeDisplay(Value: TtsDateTimeDisplay);
begin
    if Value <> FDateTimeDisplay then
    begin
        FDateTimeDisplay := Value;
        CheckRealign;
        CheckRefreshData(False);

        if IsDefaultCaption(Caption) then
            Caption := CaptionStr(FDateTimeDisplay);
    end;
end;

procedure TtsDateTime.SetDayNameFontColor(Value: TColor);
begin
    if Value <> FDayNameFontColor then
    begin
        FDayNameFontColor := Value;
        CheckUpdateCalendar;
    end;
end;

procedure TtsDateTime.SetDisabledFontColor(Value: TColor);
begin
    if Value <> FDisabledFontColor then
    begin
        FDisabledFontColor := Value;
        CheckUpdateCalendar;
    end;
end;

procedure TtsDateTime.SetFirstDayOfWeek(Value: TtsFirstDayOfWeek);
begin
    if Value <> FFirstDayOfWeek then
    begin
        FFirstDayOfWeek := Value;
        CheckRealign;
        CheckRefreshData(True);
    end;
end;

procedure TtsDateTime.SetLineColor(Value: TColor);
begin
    if Value <> FLineColor then
    begin
        FLineColor := Value;
        CheckUpdateCalendar;
    end;
end;

procedure TtsDateTime.SetMaxDate(Value: TDate);
begin
    if Value <> FMaxDate then
    begin
        if Value < MinDate then InvalidOp(StsInvalidMaxDate);
        FMaxDate := Value;
        CheckRealign;
        CheckCurDateTime(True);
    end;
end;

procedure TtsDateTime.SetMinDate(Value: TDate);
begin
    if Value <> FMinDate then
    begin
        if Value > MaxDate then InvalidOp(StsInvalidMinDate);
        FMinDate := Value;
        CheckRealign;
        CheckCurDateTime(True);
    end;
end;

procedure TtsDateTime.SetMonthColor(Value: TColor);
begin
    if Value <> FMonthColor then
    begin
        FMonthColor := Value;
        CheckUpdateCalendar;
    end;
end;

procedure TtsDateTime.SetMonthFontColor(Value: TColor);
begin
    if Value <> FMonthFontColor then
    begin
        FMonthFontColor := Value;
        CheckUpdateCalendar;
    end;
end;

procedure TtsDateTime.SetOkCaption(Value: string);
begin
    if Value <> FOkCaption then
    begin
        FOkCaption := Value;
        FButOk.Caption := FOkCaption;
    end;
end;

procedure TtsDateTime.SetCancelCaption(Value: string);
begin
    if Value <> FCancelCaption then
    begin
        FCancelCaption := Value;
        FButCancel.Caption := FCancelCaption;
    end;
end;

procedure TtsDateTime.SetCaption(Value: string);
begin
    if Value <> FCaption then
        FCaption := Value;
end;

procedure TtsDateTime.SetSelectSaturday(Value: Boolean);
begin
    if Value <> FSelectSaturday then
    begin
        FSelectSaturday := Value;
        CheckReAlign;
        CheckRefreshData(not Value);
    end;
end;

procedure TtsDateTime.SetSelectSunday(Value: Boolean);
begin
    if Value <> FSelectSunday then
    begin
        FSelectSunday := Value;
        CheckReAlign;
        CheckRefreshData(not Value);
    end;
end;

procedure TtsDateTime.SetShowDayNames(Value: TtsShowDayNames);
begin
    if Value <> FShowDayNames then
    begin
        FShowDayNames := Value;
        FDateGrid.Rows := CalcGridRows;
        CheckReAlign;
        CheckRefreshData(True);
    end;
end;

procedure TtsDateTime.SetShowSeconds(Value: Boolean);
begin
    if Value <> FShowSeconds then
    begin
        FShowSeconds := Value;
        CheckReAlign;
    end;
end;

procedure TtsDateTime.SetShowToday(Value: Boolean);
begin
    if Value <> FShowToday then
    begin
        FShowToday := Value;
        CheckUpdateCalendar;
    end;
end;

procedure TtsDateTime.SetShowWeekNumbers(Value: Boolean);
begin
    if Value <> FShowWeekNumbers then
    begin
        FShowWeekNumbers := Value;
        CheckReAlign;
        CheckRefreshData(False);
    end;
end;

procedure TtsDateTime.SetShowSingleMonth(Value: Boolean);
begin
    if Value <> FShowSingleMonth then
    begin
        FShowSingleMonth := Value;
        FDateGrid.Rows := CalcGridRows;
        CheckReAlign;
        CheckRefreshData(True);
    end;
end;

procedure TtsDateTime.SetWeekFontColor(Value: TColor);
begin
    if Value <> FWeekFontColor then
    begin
        FWeekFontColor := Value;
        CheckUpdateCalendar;
    end;
end;

procedure TtsDateTime.SetPopupForm(Value: Boolean);
begin
    if Value <> FPopupForm then
    begin
        FPopupForm := Value;
        SetControlColors;
    end;
end;

function TtsDateTime.GetInDesignMode: Boolean;
begin
    Result := FInDesignMode or (csDesigning in Owner.ComponentState);
end;

procedure TtsDateTime.Close(Ok: Boolean);
begin
    FComboMonth.HideCombo;
    
    if not Ok then
    begin
        DoCancel;
        if PopupForm then GetParentForm(Self).Close;
    end
    else
    begin
        if (DateTimeDisplay in [dtDate, dtDateTime]) and not FValidDateSelected then
            Exit
        else if DateTimeDisplay = dtDate then
            FDateTime := TDateTime(FSelectedDate)
        else
        begin
            FPnlTime.SetFocus;
            FDateTime := StrToTime(FTxtHour.Text + TimeSeparator + FTxtMinute.Text + TimeSeparator + FTxtSeconds.Text + ' ' + FTxtAMPM.Text);
            if DateTimeDisplay = dtDateTime then FDateTime := TDateTime(FDateTime + FSelectedDate);
        end;

        DoSelect;
        if PopupForm then GetParentForm(Self).Close;
    end;
end;

procedure TtsDateTime.DateGridKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = Chr(VK_ESCAPE) then
        Close(False)
    else if Key = Chr(VK_RETURN) then
        Close(True);
end;

function TtsDateTime.GetMinDateInView(var MinDate: TDateTime): Boolean;
var
    Day: Integer;
    Row, I: Integer;
begin
    Day := 0;
    for Row := 1 to FDateGrid.Rows do
    begin
        if FRowData[Row].RowType = crtDays then
        begin
            for I := 1 to 7 do
            begin
                if FRowData[Row].Days[I] > 0 then
                begin
                    Day := FRowData[Row].Days[I];
                    Break;
                end;
            end;
            if Day > 0 then Break;
        end;
    end;

    Result := Day > 0;
    if Result then
        MinDate := EncodeDate(FRowData[Row].MonthYear div 100, FRowData[Row].MonthYear mod 100, Day);
end;

function TtsDateTime.GetMaxDateInView(var MaxDate: TDateTime): Boolean;
var
    Day: Integer;
    Row, I: Integer;
begin
    Day := 0;
    for Row := FDateGrid.Rows downto 1 do
    begin
        if FRowData[Row].RowType = crtDays then
        begin
            for I := 7 downto 1 do
            begin
                if FRowData[Row].Days[I] > 0 then
                begin
                    Day := FRowData[Row].Days[I];
                    Break;
                end;
            end;
            if Day > 0 then Break;
        end;
    end;

    Result := Day > 0;
    if Result then
        MaxDate := EncodeDate(FRowData[Row].MonthYear div 100, FRowData[Row].MonthYear mod 100, Day)
end;

function TtsDateTime.DateInView(Value: TDateTime): Boolean;
var
    MinDate, MaxDate: TDateTime;
begin
    Result := False;
    if GetMinDateInView(MinDate) and GetMaxDateInView(MaxDate) then
    begin
        Result := (Value >= MinDate) and (Value <= MaxDate);
    end;
end;

procedure TtsDateTime.PutDateInView(Value: TDateTime);
begin
    SetDisplayDate(Value);
    BuildGridData;
end;

procedure TtsDateTime.KeyScrollUp(PageUp: Boolean);
var
    PrevDate: TDateTime;
    PrevRMY: Integer;
    CurRow, CurMonth, CurYear: Integer;
    PrevRow, PrevMonth, PrevYear: Integer;
begin
    if VarIsEmpty(FSelectedDate) then Exit;

    if not DateInView(FselectedDate) then
        PutDateInView(FSelectedDate);

    if PageUp then
    begin
        DecodeRMYValue(FSelectedRMY, CurRow, CurMonth, CurYear);
        PrevDate := FSelectedDate - 28;
        PrevRMY := Date2RMYValue(PrevDate);
        DecodeRMYValue(PrevRMY, PrevRow, PrevMonth, PrevYear);
        while (PrevRow < CurRow) and (PrevMonth = CurMonth) or
              (PrevRow > CurRow) and (PrevMonth <> CurMonth) do
        begin
            PrevDate := PrevDate - 7;
            PrevRMY := Date2RMYValue(PrevDate);
            DecodeRMYValue(PrevRMY, PrevRow, PrevMonth, PrevYear);
            if CurMonth + (12 * (CurYear - PrevYear)) - PrevMonth > 1 then
            begin
                PrevDate := PrevDate + 7;
                Break;
            end;
        end;
    end
    else
        PrevDate := FSelectedDate - 7;

    if (PrevDate >= MinDate) and (PrevDate <= MaxDate) then
    begin
        while not DateInView(PrevDate) do
        begin
            ScrollLineUp;
            BuildGridData;
        end;
        SetSelectedDate(PrevDate);
    end
    else if FDisplayRowInMonth <> 1 then
        ScrollPageUp;
end;

procedure TtsDateTime.KeyScrollDown(PageDown: Boolean);
var
    NextDate: TDateTime;
    NextRMY: Integer;
    CurRow, CurMonth, CurYear: Integer;
    NextRow, NextMonth, NextYear: Integer;
begin
    if VarIsEmpty(FSelectedDate) then Exit;

    if not DateInView(FselectedDate) then
        PutDateInView(FSelectedDate);

    if PageDown then
    begin
        DecodeRMYValue(FSelectedRMY, CurRow, CurMonth, CurYear);
        NextDate := FSelectedDate + 28;
        NextRMY := Date2RMYValue(NextDate);
        DecodeRMYValue(NextRMY, NextRow, NextMonth, NextYear);
        while (NextRow > CurRow) and (NextMonth = CurMonth) or
              (NextRow < CurRow) and (NextMonth <> CurMonth) do
        begin
            NextDate := NextDate + 7;
            NextRMY := Date2RMYValue(NextDate);
            DecodeRMYValue(NextRMY, NextRow, NextMonth, NextYear);
            if NextMonth + (12 * (NextYear - CurYear)) - CurMonth > 1 then
            begin
                NextDate := NextDate - 7;
                Break;
            end;
        end;
    end
    else
        NextDate := FSelectedDate + 7;

    if (NextDate >= MinDate) and (NextDate <= MaxDate) then
    begin
        while not DateInView(NextDate) do
        begin
            ScrollLineDown;
            BuildGridData;
        end;
        SetSelectedDate(NextDate);
    end
    else if FDisplayRowInMonth <> 1 then
        ScrollPageDown;
end;

procedure TtsDateTime.KeyScrollLeft;
var
    PrevDate: TDateTime;
begin
    if VarIsEmpty(FSelectedDate) then Exit;

    if not DateInView(FselectedDate) then
        PutDateInView(FSelectedDate);

    PrevDate := GetPrevDay(FSelectedDate);
    if (PrevDate >= MinDate) and (PrevDate <= MaxDate) then
    begin
        while not DateInView(PrevDate) do
        begin
            ScrollLineUp;
            BuildGridData;
        end;
        SetSelectedDate(PrevDate);
    end;
end;

procedure TtsDateTime.KeyScrollRight;
var
    NextDate: TDateTime;
begin
    if VarIsEmpty(FSelectedDate) then Exit;

    if not DateInView(FselectedDate) then
        PutDateInView(FSelectedDate);

    NextDate := GetNextDay(FSelectedDate);
    if (NextDate >= MinDate) and (NextDate <= MaxDate) then
    begin
        while not DateInView(NextDate) do
        begin
            ScrollLineDown;
            BuildGridData;
        end;
        SetSelectedDate(NextDate);
    end;
end;

procedure TtsDateTime.DateGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Shift = [] then
    begin
        case Key of
            VK_UP: begin KeyScrollUp(False); Key := 0; end;
            VK_DOWN: begin KeyScrollDown(False); Key := 0; end;
            VK_LEFT: begin KeyScrollLeft; Key := 0; end;
            VK_RIGHT: begin KeyScrollRight; Key := 0; end;
            VK_PRIOR: begin KeyScrollUp(True); Key := 0; end;
            VK_NEXT: begin KeyScrollDown(True); Key := 0; end;
        end;
        if Key = 0 then RefreshData(False);
    end;
end;

procedure TtsDateTime.DateGridCellLoaded(Sender: TObject; DataCol,
  DataRow: Longint; var Value: Variant);
begin
    Value := '';

    case FRowData[DataRow].RowType of
        crtDayNames: begin
                         FDateGrid.RowFont[DataRow].Color := DayNameFontColor;
                         if DataCol = 1 then Value := ''
                                        else Value := FDayNames[DataCol - 1];
                     end;
        crtDays: begin
                     if ShowWeekNumbers and (DataCol = 1) then
                     begin
                         FDateGrid.RowFont[DataRow].Color := WeekFontColor;
                         if FRowData[DataRow].WeekNumber > 0 then
                            Value := IntToStr(FRowData[DataRow].WeekNumber);
                     end
                     else
                     begin
                         if FRowData[DataRow].Days[DataCol - 1] < 0 then
                             FDateGrid.RowFont[DataRow].Color := DisabledFontColor
                         else
                             FDateGrid.RowFont[DataRow].Color := Font.Color;

                         if FRowData[DataRow].Days[DataCol - 1] = 0 then
                             Value := ''
                         else
                             Value := IntToStr(Abs(FRowData[DataRow].Days[DataCol - 1]));
                     end;
                 end;
    end;

end;

procedure TtsDateTime.DateGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
    Col, Row: Longint;
begin
    if (Button = mbLeft) then
    begin
        FDateGrid.CellFromXY(X, Y, Col, Row);
        if (Col > 1) and (FRowData[Row].RowType = crtDays) then
        begin
            if (FRowData[Row].Days[Col - 1] > 0) then
            begin
                if not (ssDouble in Shift) then
                    SelectDate(Col, Row)
                else
                    Close(True);
            end;
        end;
    end;
end;

procedure TtsDateTime.DateGridMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
    Col, Row: Longint;
begin
    if not ControlVisible(Self) then Exit;

    if (Button = mbLeft) and FValidDateSelected then
    begin
        if (DateTimeDisplay = dtDate) and (not PopupForm) then
        begin
            FDateGrid.CellFromXY(X, Y, Col, Row);
            if (Col > 1) and (FRowData[Row].RowType = crtDays) then
            begin
                if (FRowData[Row].Days[Col - 1] > 0) then
                begin
                    Close(True);
                end;
            end;
        end;
    end;
end;

procedure TtsDateTime.DateGridPaint(Sender: TObject);
var
    x, StartRow, Row: Integer;
    Temp: String;
    ARect: TRect;
begin
    //draw headings with month names, and seperator lines next to week numbers
    //and under FDayNames

    FDateGrid.EnablePaint := False;

    try
        for Row := 1 to FDateGrid.Rows do
        begin
            if FRowData[Row].RowType = crtMonthHeader then
            begin
                //draw month header
                ARect.Left := 1;
                ARect.Right := FDateGrid.Width - 1;
                ARect.Top := (row - 1) * FDateGrid.RowHeight[row] + 1;
                ARect.Bottom := row * FDateGrid.RowHeight[row];

                FDateGrid.Canvas.Brush.Style := bsSolid;
                FDateGrid.Canvas.Brush.Color := MonthColor;
                FDateGrid.Canvas.FillRect(ARect);

                FDateGrid.Canvas.Font.Color := MonthFontColor;
                FDateGrid.Canvas.Font.Name := FDateGrid.Font.Name;

                Temp := LongMonthNames[Trunc(FRowData[Row].MonthYear mod 100)] + ' ' + IntToStr(FRowData[Row].MonthYear div 100);

                x := (ARect.Right - ARect.Left - FDateGrid.Canvas.TextWidth(Temp)) div 2;
                FDateGrid.Canvas.TextRect(ARect, ARect.Left + x, ARect.Top + 1 , Temp);
            end
            else if FRowData[Row].RowType = crtDayNames then
            begin
                //draw seperator line under day names
                FDateGrid.Canvas.Pen.Color := LineColor;
                FDateGrid.Canvas.Pen.Style := psSolid;
                FDateGrid.Canvas.Pen.Width := 1;
                FDateGrid.Canvas.MoveTo(Ord(ShowWeekNumbers) * (FDateGrid.Col[1].Width + 3), Row * FDateGrid.RowHeight[Row] - 2);
                FDateGrid.Canvas.LineTo(FDateGrid.Width - 2, Row * FDateGrid.RowHeight[Row] - 2);
            end
        end;

        if ShowWeekNumbers then
        begin
            //draw seperator line next to week numbers
            Row := 1;
            repeat
                if FRowData[Row].RowType = crtDays then
                begin
                    StartRow := Row;
                    repeat
                        Inc(Row, 1);
                    until (Row > FDateGrid.Rows) or (FRowData[Row].RowType <> crtDays);

                    FDateGrid.Canvas.Pen.Color := LineColor;
                    FDateGrid.Canvas.Pen.Style := psSolid;
                    FDateGrid.Canvas.Pen.Width := 1;
                    FDateGrid.Canvas.MoveTo(FDateGrid.Col[1].Width - 1, (StartRow - 1) * FDateGrid.RowHeight[1]);
                    FDateGrid.Canvas.LineTo(FDateGrid.Col[1].Width - 1, (Row - 1) * FDateGrid.RowHeight[1] - 3);
                end;

                Inc(Row, 1);
            until Row > FDateGrid.Rows;
        end;

        if ShowToday or FValidDateSelected then
            InvertSelectedDate;
    finally
        FDateGrid.EnablePaint := True;
    end;
end;

procedure TtsDateTime.ScrollLineUp;
begin
    if ShowSingleMonth then
    begin
        DecMonth(FDisplayMonth, FDisplayYear);
        FDisplayRowInMonth := Min(FDisplayRowInMonth, RowsInMonth(FDisplayMonth, FDisplayYear));
    end
    else
        DecRow(FDisplayRowInMonth, FDisplayMonth, FDisplayYear);
end;

procedure TtsDateTime.ScrollLineDown;
begin
    if ShowSingleMonth then
    begin
        IncMonth(FDisplayMonth, FDisplayYear);
        FDisplayRowInMonth := Min(FDisplayRowInMonth, RowsInMonth(FDisplayMonth, FDisplayYear));
    end
    else
        IncRow(FDisplayRowInMonth, FDisplayMonth, FDisplayYear);
end;

procedure TtsDateTime.ScrollPageUp;
begin
    if FDisplayRowInMonth = 1 then
    begin
        DecMonth(FDisplayMonth, FDisplayYear);
        FDisplayRowInMonth := Min(FDisplayRowInMonth, RowsInMonth(FDisplayMonth, FDisplayYear));
    end
    else
        FDisplayRowInMonth := 1;
end;

procedure TtsDateTime.ScrollPageDown;
begin
    IncMonth(FDisplayMonth, FDisplayYear);
    if FDisplayRowInMonth = 1 then
        FDisplayRowInMonth := Min(FDisplayRowInMonth, RowsInMonth(FDisplayMonth, FDisplayYear))
    else
        FDisplayRowInMonth := 1;
end;

procedure TtsDateTime.DateScrollBarScroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
var
    Temp: Integer;
begin
    if not FDateGrid.Focused then FDateGrid.SetFocus;

    if ScrollCode = scTrack then
    begin
        Temp := FDisplayYear * 12 + FDisplayMonth - 1 + ScrollPos - FOldScrollBarPosition;
        FDisplayYear := Temp div 12;
        FDisplayMonth := Temp mod 12 + 1;
        CheckValidDate(FDisplayMonth, FDisplayYear);

        try
            FDisplayRowInMonth := Min(FDisplayRowInMonth, RowsInMonth(FDisplayMonth, FDisplayYear));
        except;
            FDisplayMonth := FDisplayMonth;
        end;

        FOldScrollBarPosition := ScrollPos;
        RefreshData(False);
    end
    else
    begin
        ScrollPos := 23;
        FOldScrollBarPosition := 23;

        if ScrollCode <> scEndScroll then
        begin
            case ScrollCode of
                scLineUp: ScrollLineUp;
                scLineDown: ScrollLineDown;
                scPageUp: ScrollPageUp;
                scPageDown: ScrollPageDown;
            end;
            RefreshData(False);
        end
        else if not FDateGrid.Focused then
            FDateGrid.SetFocus;
    end;
end;

procedure TtsDateTime.DateScrollBarKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = Chr(VK_ESCAPE) then
        Close(False)
    else if Key = Chr(VK_RETURN) then
        Close(True);
end;

procedure TtsDateTime.grdMonthKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = Chr(VK_ESCAPE) then
        Close(False)
    else if Key = Chr(VK_RETURN) then
        Close(True)
end;

procedure TtsDateTime.grdMonthComboGetValue(Sender: TObject; Combo: TtsComboGrid; GridDataCol, GridDataRow,
                                            ComboDataRow: Longint; var Value: Variant);
begin
    FDisplayMonth := ComboDataRow;
    FDisplayRowInMonth := 1;
    BuildGridData;
    SetSelectedDateInView(False);
    RefreshControls;
end;

procedure TtsDateTime.txtYearKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = Chr(VK_RETURN) then
    begin
        if FTxtYear.Text <> IntToStr(FDisplayYear) then
        begin
            if YearOk(FTxtYear.Text) then
            begin
                YearUpdated;
                FTXtYear.SelStart := 0;
                FTxtYear.SelLength := Length(FTxtYear.Text);
            end;
        end
        else
            Close(True);
    end
    else if Key = Chr(VK_ESCAPE) then
    begin
        if FTxtYear.Text <> IntToStr(FDisplayYear) then
        begin
            FTxtYear.Text := IntToStr(FDisplayYear);
            FTXtYear.SelStart := 0;
        end
        else
            Close(False);
    end;

    if (Key <> Chr(VK_BACK)) and ((Key < '0') or (Key > '9'))  then
        Key := Chr(0);
end;

procedure TtsDateTime.txtYearKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if ((Shift = [ssShift]) and (Key = 45)) or ((Shift = [ssCtrl]) and (Key = 86)) then
        //prevent copying from clipboard
        Key := 0
    else
    begin
        case Key of
            VK_Up:   begin Inc(FDisplayYear, 1); RefreshData(False); end;
            VK_Down: begin Dec(FDisplayYear, 1); RefreshData(False); end;
        end;
    end;
end;

procedure TtsDateTime.txtYearExit(Sender: TObject);
begin
    if YearOk(FTxtYear.Text)
        then YearUpdated
        else FTxtYear.Text := IntToStr(FDisplayYear);
end;

procedure TtsDateTime.YearUpdated;
begin
    if FTxtYear.Text = '' then
        FDisplayYear := 1
    else
    begin
        FDisplayYear := GetFullYear(FTxtYear.Text);
        if FDisplayYear <> StrToInt(FTxtYear.Text) then
            FTxtYear.Text := IntToStr(FDisplayYear);
    end;
    BuildGridData;
    SetSelectedDateInView(False);
    RefreshControls;
end;

procedure TtsDateTime.butYearIncrMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    SetButControlFocus(TSpeedButton(Sender));
    FSpinButton := dtsIncrYear;
    timKeyDownDelayTimer(Sender);

    FTimKeyDownDelay.Interval := SpinKeyDownDelay;
    FTimKeyDownDelay.Enabled := True;
end;

procedure TtsDateTime.butYearIncrMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    FTimKeyDownDelay.Enabled := False;
    SetSelectedDateInView(True);
    RefreshControls;
end;

procedure TtsDateTime.butYearDecrMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    SetButControlFocus(TSpeedButton(Sender));
    FSpinButton := dtsDecrYear;
    timKeyDownDelayTimer(Sender);

    FTimKeyDownDelay.Interval := SpinKeyDownDelay;
    FTimKeyDownDelay.Enabled := True;
end;

procedure TtsDateTime.butYearDecrMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    FTimKeyDownDelay.Enabled := False;
    SetSelectedDateInView(True);
end;

procedure TtsDateTime.butTimeIncrMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    SetButControlFocus(TSpeedButton(Sender));
    FSpinButton := dtsIncrTime;
    timKeyDownDelayTimer(Sender);

    FTimKeyDownDelay.Interval := SpinKeyDownDelay;
    FTimKeyDownDelay.Enabled := True;
end;

procedure TtsDateTime.butTimeIncrMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    FTimKeyDownDelay.Enabled := False;
end;

procedure TtsDateTime.butTimeDecrMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    SetButControlFocus(TSpeedButton(Sender));
    FSpinButton := dtsDecrTime;
    timKeyDownDelayTimer(Sender);

    FTimKeyDownDelay.Interval := SpinKeyDownDelay;
    FTimKeyDownDelay.Enabled := True;
end;

procedure TtsDateTime.butTimeDecrMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    FTimKeyDownDelay.Enabled := False;
end;

procedure TtsDateTime.timKeyDownDelayTimer(Sender: TObject);
var
    Ticks, Delay: Cardinal;
begin
    FTimKeyDownDelay.Enabled := False;
    Ticks := GetTickCount();
    Delay := 60;

    if FSpinButton in [dtsIncrYear, dtsDecrYear] then
    begin
        if FSpinButton = dtsIncrYear then
        begin
            Inc(FDisplayYear, 1);
            if FDisplayRowInMonth <> 1 then
            begin
                IncMonth(FDisplayMonth, FDisplayYear);
                FDisplayRowInMonth := 1;
            end;
        end
        else if FSpinButton = dtsDecrYear then
        begin
            Dec(FDisplayYear, 1);
            if FDisplayRowInMonth <> 1 then FDisplayRowInMonth := 1;
        end;
        RefreshData(False);
    end
    else if FSpinButton = dtsIncrTime then
    begin
        if FActiveControl = FTxtHour then
        begin
            IncHour;
            Delay := 100;
        end
        else if FActiveControl = FTxtMinute then
        begin
            IncMinutes;
            Delay := 50;
        end
        else if FActiveControl = FTxtSeconds then
        begin
            IncSeconds;
            Delay := 50;
        end
        else if (FActiveControl = FTxtAMPM) and not FFormat24Hour then
        begin
            ToggleAMPM;
            Delay := 100;
        end
    end
    else if FSpinButton = dtsDecrTime then
    begin
        if FActiveControl = FTxtHour then
        begin
            DecHour;
            Delay := 100;
        end
        else if FActiveControl = FTxtMinute then
        begin
            DecMinutes;
            Delay := 50;
        end
        else if FActiveControl = FTxtSeconds then
        begin
            DecSeconds;
            Delay := 50;
        end
        else if (FActiveControl = FTxtAMPM) and not FFormat24Hour then
        begin
            ToggleAMPM;
            Delay := 100;
        end;
    end;

    FTimKeyDownDelay.Interval := Max(1, Delay - (GetTickCount - Ticks));
    FTimKeyDownDelay.Enabled := True;
end;

procedure TtsDateTime.txtHourKeyPress(Sender: TObject; var Key: Char);
var
    NewHour: String;
    ok: Boolean;
    i: Integer;
begin
    if Key = Chr(VK_ESCAPE) then
        Close(False)
    else if Key = Chr(VK_RETURN) then
        Close(True)
    else if Key <> Chr(VK_BACK) then
    begin
        ok := True;

        if (Key < '0') or (Key > '9') then
            ok := False
        else
        begin
            NewHour := FTxtHour.Text;
            i := FTxtHour.SelLength;
            if i > 0 then Delete(NewHour, FTxtHour.SelStart + 1, i);
            Insert(Key, NewHour, FTxtHour.SelStart + 1);

            if Length(NewHour) > 2 then
                ok := False
            else
            begin
                if FFormat24Hour then
                begin
                    if StrToInt(NewHour) > 23 then ok := False;
                end
                else
                    if StrToInt(NewHour) > 12 then ok := False;
            end;
        end;

        if ok then
        begin
            i := FTxtHour.SelStart;
            FTxtHour.Text := NewHour;
            FTxtHour.SelStart := i + 1;

            if FTxtHour.SelStart = 2 then
            begin
                FTxtMinute.SetFocus;
            end;

            if FTxtHour.Text <> '' then FPrevHour := StrToInt(FTxtHour.Text);
        end;

        Key := Chr(0);
    end;
end;

procedure TtsDateTime.txtMinuteKeyPress(Sender: TObject; var Key: Char);
var
    NewMinutes: String;
    ok: Boolean;
    i: Integer;
begin
    if Key = Chr(VK_ESCAPE) then
        Close(False)
    else if Key = Chr(VK_RETURN) then
        Close(True)
    else if Key <> Chr(VK_BACK) then
    begin
        ok := True;

        if (Key < '0') or (Key > '9') then
            ok := False
        else
        begin
            NewMinutes := FTxtMinute.Text;
            i := FTxtMinute.SelLength;
            if i > 0 then Delete(NewMinutes, FTxtMinute.SelStart + 1, i);
            Insert(Key, NewMinutes, FTxtMinute.SelStart + 1);

            if Length(NewMinutes) > 2 then ok := False
            else if StrToInt(NewMinutes) > 59  then ok := False;
        end;

        if ok then
        begin
            i := FTxtMinute.SelStart;
            FTxtMinute.Text := NewMinutes;
            FTxtMinute.SelStart := i + 1;

            if (FTxtMinute.SelStart = 2) and FTxtSeconds.Visible then
            begin
                FTxtSeconds.SetFocus;
            end;

            if FTxtMinute.Text <> '' then FPrevMinute := StrToInt(FTxtMinute.Text);
        end;

        Key := Chr(0);
    end;
end;

procedure TtsDateTime.txtSecondsKeyPress(Sender: TObject; var Key: Char);
var NewSeconds: String;
    ok: Boolean;
    i: Integer;
begin
    if Key = Chr(VK_ESCAPE) then
        Close(False)
    else if Key = Chr(VK_RETURN) then
        Close(True)
    else if Key <> Chr(VK_BACK) then
    begin
        ok := True;

        if (Key < '0') or (Key > '9') then
            ok := False
        else
        begin
            NewSeconds := FTxtSeconds.Text;
            i := FTxtSeconds.SelLength;
            if i > 0 then Delete(NewSeconds, FTxtSeconds.SelStart + 1, i);
            Insert(Key, NewSeconds, FTxtSeconds.SelStart + 1);

            if Length(NewSeconds) > 2 then ok := False
            else if StrToInt(NewSeconds) > 59  then ok := False;
        end;

        if ok then
        begin
            i := FTxtSeconds.SelStart;
            FTxtSeconds.Text := NewSeconds;
            FTxtSeconds.SelStart := i + 1;

            if (FTxtSeconds.SelStart = 2) and (FTxtAMPM.left > FTxtSeconds.Left) and FTxtAMPM.Visible then
            begin
                FTxtAMPM.SetFocus;
            end;

            if FTxtSeconds.Text <> '' then FPrevSeconds := StrToInt(FTxtSeconds.Text);
        end;

        Key := Chr(0);
    end;
end;

procedure TtsDateTime.txtAMPMKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = Chr(VK_ESCAPE) then
        Close(False)
    else if Key = Chr(VK_RETURN) then
        Close(True)
    else if (pos(LowerCase(Key), LowerCase(TimeAMString)) = 1) or ((Key = ' ') and (TimeAMString = '')) then
        FTxtAMPM.Text := TimeAMString
    else if (pos(LowerCase(Key), LowerCase(TimePMString)) = 1) or ((Key = ' ') and (TimePMString = '')) then
        FTxtAMPM.Text := TimePMString;
end;

procedure TtsDateTime.HandleKeyDownHomeEnd(Key: Word);
begin
    case Key of
        VK_Home:
            if (FTxtHour.Left > FTxtAMPM.Left) and FTxtAMPM.Visible then
            begin
                FTxtAMPM.SetFocus;
                FTxtAMPM.SelStart := 0;
            end
            else
            begin
                FTxtHour.SetFocus;
                FTxtHour.SelStart := 0;
            end;

        VK_End:
            if (FTxtSeconds.Left < FTxtAMPM.Left) and FTxtAMPM.Visible then
            begin
                FTxtAMPM.SetFocus;
                FTxtAMPM.SelStart := Length(FTxtAMPM.Text);
            end
            else
            begin
                FTxtSeconds.SetFocus;
                FTxtSeconds.SelStart := Length(FTxtSeconds.Text);
            end;
    end;
end;

procedure TtsDateTime.txtHourKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    //prevent copying from clipboard
    if ((Shift = [ssShift]) and (Key = 45)) or ((Shift = [ssCtrl]) and (Key = 86)) then
        Key := 0
    else
        case Key of
            VK_Left:
                if ((FTxtHour.SelStart = 0) or (ssCtrl in Shift)) and (FTxtHour.Left > FTxtAMPM.Left) and FTxtAMPM.Visible then
                begin
                    FTxtAMPM.SetFocus;
                end;
            VK_Right:
                if (FTxtHour.SelStart = Length(FTxtHour.Text)) or
                   (FTxtHour.SelLength = Length(FTxtHour.Text)) or
                   (ssCtrl in Shift) then
                begin
                    FTxtMinute.SetFocus;
                end;
            VK_Up:
                begin
                    IncHour;
                    Key := 0;
                end;
            VK_Down:
                begin
                    DecHour;
                    Key := 0;
                end;
            VK_Home, VK_End:
                HandleKeyDownHomeEnd(Key);
        end;
end;

procedure TtsDateTime.txtMinuteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    //prevent copying from clipboard
    if ((Shift = [ssShift]) and (Key = 45)) or ((Shift = [ssCtrl]) and (Key = 86)) then
        Key := 0
    else
        case Key of
            VK_Left:
                if (FTxtMinute.SelStart = 0) or (ssCtrl in Shift) then
                begin
                    FTxtHour.SetFocus;
                end;
            VK_Right:
                if (FTxtMinute.SelStart = Length(FTxtMinute.Text)) or
                   (FTxtMinute.SelLength = Length(FTxtMinute.Text)) or
                   (ssCtrl in Shift) then
                begin
                    if FTxtSeconds.Visible then
                        FTxtSeconds.SetFocus
                    else if FTxtAMPM.Visible then
                        FTxtAMPM.SetFocus
                end;
            VK_Up:
                begin
                    IncMinutes;
                    Key := 0;
                end;
            VK_Down:
                begin
                    DecMinutes;
                    Key := 0;
                end;
            VK_Home, VK_End:
                HandleKeyDownHomeEnd(Key);
        end;
end;


procedure TtsDateTime.txtSecondsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    //prevent copying from clipboard
    if ((Shift = [ssShift]) and (Key = 45)) or ((Shift = [ssCtrl]) and (Key = 86)) then
        Key := 0
    else
        case Key of
            VK_Left:
                if (FTxtSeconds.SelStart = 0) or (ssCtrl in Shift) then
                begin
                    FTxtMinute.SetFocus;
                end;
            VK_Right:
                if FTxtAMPM.Visible and (FTxtSeconds.Left < FTxtAMPM.Left) and
                   ((FTxtSeconds.SelStart = Length(FTxtSeconds.Text)) or
                    (FTxtSeconds.SelLength = Length(FTxtSeconds.Text)) or
                    (ssCtrl in Shift)) then
                begin
                    FTxtAMPM.SetFocus;
                end;
            VK_Up:
                begin
                    IncSeconds;
                    Key := 0;
                end;
            VK_Down:
                begin
                    DecSeconds;
                    Key := 0;
                end;
            VK_Home, VK_End:
                HandleKeyDownHomeEnd(Key);
        end;
end;


procedure TtsDateTime.txtAMPMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    //prevent copying from clipboard
    if ((Shift = [ssShift]) and (Key = 45)) or ((Shift = [ssCtrl]) and (Key = 86)) then
        Key := 0
    else
        case Key of
            VK_Left:
                if ((FTxtAMPM.SelStart = 0) or (ssCtrl in Shift)) and ((FTxtAMPM.Left > FTxtSeconds.Left) or (FTxtAMPM.Left > FTxtMinute.Left)) then
                begin
                    if FTxtSeconds.Visible then
                        FTxtSeconds.SetFocus
                    else if FTxtMinute.Visible then
                        FTxtMinute.SetFocus;
                end;
            VK_Right:
                if ((FTxtAMPM.SelStart = Length(FTxtAMPM.Text)) or (ssCtrl in Shift)) and (FTxtHour.Left > FTxtAMPM.Left) then
                begin
                    FTxtHour.SetFocus;
                end;
            VK_Up, VK_Down:
                begin
                    ToggleAMPM;
                    Key := 0;
                end;
            VK_Home, VK_End:
                HandleKeyDownHomeEnd(Key);
        end;
end;

procedure TtsDateTime.txtHourExit(Sender: TObject);
begin
    if Length(FTxtHour.Text) = 1 then FTxtHour.Text := '0' + FTxtHour.Text;
    if Length(FTxtHour.Text) = 0 then FTxtHour.Text := Format('%2.2d', [FPrevHour]);
end;

procedure TtsDateTime.txtMinuteExit(Sender: TObject);
begin
    if Length(FTxtMinute.Text) = 1 then FTxtMinute.Text := '0' + FTxtMinute.Text;
    if Length(FTxtMinute.Text) = 0 then FTxtMinute.Text := Format('%2.2d', [FPrevMinute]);
end;

procedure TtsDateTime.txtSecondsExit(Sender: TObject);
begin
    if Length(FTxtSeconds.Text) = 1 then FTxtSeconds.Text := '0' + FTxtSeconds.Text;
    if Length(FTxtSeconds.Text) = 0 then FTxtSeconds.Text := Format('%2.2d', [FPrevSeconds]);
end;

procedure TtsDateTime.txtHourChange(Sender: TObject);
begin
    CheckEnableButton;
end;

procedure TtsDateTime.txtMinuteChange(Sender: TObject);
begin
    CheckEnableButton;
end;

procedure TtsDateTime.txtSecondsChange(Sender: TObject);
begin
    CheckEnableButton;
end;

procedure TtsDateTime.butOKClick(Sender: TObject);
begin
    Close(True);
end;

procedure TtsDateTime.butCancelClick(Sender: TObject);
begin
    Close(False);
end;

{TtsDateTimeDef}

constructor TtsDateTimeDef.Create(AOwner: TComponent);
begin
    ////ShowMessage('TtsDateTimeDef create Start');
    inherited;
    ////ShowMessage('TtsDateTimeDef create TtsDateTime');
    FDateTimeControl := TtsDateTime.Create(Self);
    FDateTimeControl.Visible := False;
    ////ShowMessage('TtsDateTimeDef create FDateTimeControlProps');
    FDateTimeControlProps := TtsDateTimeDefProps.Create(Self);
    ////ShowMessage('TtsDateTimeDef create END');
end;

destructor TtsDateTimeDef.Destroy;
begin
    FDateTimeControlProps.Free;
    inherited;
end;

procedure TtsDateTimeDef.Assign(Source: TPersistent);
begin
    if Source is TtsDateTimeDef then
        FDateTimeControlProps.Assign(TtsDateTimeDef(Source).FDateTimeControlProps)
    else
        inherited;
end;

procedure TtsDateTimeDef.InitializeDisplay;
begin
    FDateTimeControl.Visible := True;
    FDateTimeControl.InitializeDisplay;
end;

procedure TtsDateTimeDef.InitializeFocus; 
begin
    FDateTimeControl.InitializeFocus;
end;

function TtsDateTimeDef.GetControl: TWinControl;
begin
    Result := FDateTimeControl;
end;

procedure TtsDateTimeDef.SetSelect(Value: TNotifyEvent);
begin
    FDateTimeControl.OnSelect := Value;
end;

function TtsDateTimeDef.GetSelect: TNotifyEvent;
begin
    Result := FDateTimeControl.OnSelect;
end;

procedure TtsDateTimeDef.SetCancel(Value: TNotifyEvent);
begin
    FDateTimeControl.OnCancel := Value;
end;

function TtsDateTimeDef.GetCancel: TNotifyEvent;
begin
    Result := FDateTimeControl.OnCancel;
end;

procedure TtsDateTimeDef.SetDateTime(Value: Variant);
begin
    FDateTimeControl.DateTime := Value;
end;

function TtsDateTimeDef.GetDateTime: Variant;
begin
    Result := FDateTimeControl.DateTime;
end;

procedure TtsDateTimeDef.SetDateTimeDisplay(Value: TtsDateTimeDisplay);
begin
    FDateTimeControl.DateTimeDisplay := Value;
end;

function TtsDateTimeDef.GetDateTimeDisplay: TtsDateTimeDisplay;
begin
    Result := FDateTimeControl.DateTimeDisplay;
end;

function TtsDateTimeDef.GetPopupForm: Boolean;
begin
    Result := FDateTimeControl.PopupForm;
end;

procedure TtsDateTimeDef.SetPopupForm(Value: Boolean);
begin
    FDateTimeControl.PopupForm := Value;
end;

procedure TtsDateTimeDef.SetDateTimeProps(Value: TtsDateTimeProps);
begin
    if FDateTimeControlProps <> Value then FDateTimeControlProps.Assign(Value);
end;

function TtsDateTimeDef.GetDateTimeProps: TtsDateTimeProps;
begin
    Result := FDateTimeControlProps;
end;

procedure TtsDateTimeDef.SetDateTimeControl(Value: TtsDateTime);
begin
    if FDateTimeControl <> Value then FDateTimeControl.Assign(Value);
end;

{TtsDateTimeDefProps}

procedure TtsDateTimeDefProps.Assign(Source: TPersistent);
begin
    if Source is TtsDateTimeDefProps then
    begin
        DateTimeControl.BeginUpdate;
        try
            AssignObject(Self, Source, '');
        finally
            DateTimeControl.EndUpdate;
        end;
    end
    else
        inherited;
end;

function TtsDateTimeDefProps.GetColor: TColor;
begin
    Result := DateTimeControl.Color;
end;

procedure TtsDateTimeDefProps.SetColor(Value: TColor);
begin
    DateTimeControl.Color := Value;
end;

function TtsDateTimeDefProps.GetCalendarRows: Integer;
begin
    Result := DateTimeControl.CalendarRows;
end;

procedure TtsDateTimeDefProps.SetCalendarRows(Value: Integer);
begin
    DateTimeControl.CalendarRows := Value;
end;

function TtsDateTimeDefProps.GetDateTimeDisplay: TtsDateTimeDisplay;
begin
    Result := DateTimeControl.DateTimeDisplay;
end;

procedure TtsDateTimeDefProps.SetDateTimeDisplay(Value: TtsDateTimeDisplay);
begin
    DateTimeControl.DateTimeDisplay := Value;
end;

function TtsDateTimeDefProps.GetDayNameFontColor: TColor;
begin
    Result := DateTimeControl.DayNameFontColor;
end;

procedure TtsDateTimeDefProps.SetDayNameFontColor(Value: TColor);
begin
    DateTimeControl.DayNameFontColor := Value;
end;

function TtsDateTimeDefProps.GetDisabledFontColor: TColor;
begin
    Result := DateTimeControl.DisabledFontColor;
end;

procedure TtsDateTimeDefProps.SetDisabledFontColor(Value: TColor);
begin
    DateTimeControl.DisabledFontColor := Value;
end;

function TtsDateTimeDefProps.GetFirstDayOfWeek: TtsFirstDayOfWeek;
begin
    Result := DateTimeControl.FirstDayOfWeek;
end;

procedure TtsDateTimeDefProps.SetFirstDayOfWeek(Value: TtsFirstDayOfWeek);
begin
    DateTimeControl.FirstDayOfWeek := Value;
end;

function TtsDateTimeDefProps.GetFont: TFont;
begin
    Result := DateTimeControl.Font;
end;

procedure TtsDateTimeDefProps.SetFont(Value: TFont);
begin
    DateTimeControl.Font := Value;
end;

function TtsDateTimeDefProps.GetParentFont: Boolean;
begin
    Result := DateTimeControl.ParentFont;
end;

procedure TtsDateTimeDefProps.SetParentFont(Value: Boolean);
begin
    DateTimeControl.ParentFont := Value;
end;

function TtsDateTimeDefProps.GetLineColor: TColor;
begin
    Result := DateTimeControl.LineColor;
end;

procedure TtsDateTimeDefProps.SetLineColor(Value: TColor);
begin
    DateTimeControl.LineColor := Value;
end;

function TtsDateTimeDefProps.GetMaxDate: TtsDate;
begin
    Result := DateTimeControl.MaxDate;
end;

procedure TtsDateTimeDefProps.SetMaxDate(Value: TtsDate);
begin
    DateTimeControl.MaxDate := Value;
end;

function TtsDateTimeDefProps.GetMinDate: TtsDate;
begin
    Result := DateTimeControl.MinDate;
end;

procedure TtsDateTimeDefProps.SetMinDate(Value: TtsDate);
begin
    DateTimeControl.MinDate := Value;
end;

function TtsDateTimeDefProps.GetMonthColor: TColor;
begin
    Result := DateTimeControl.MonthColor;
end;

procedure TtsDateTimeDefProps.SetMonthColor(Value: TColor);
begin
    DateTimeControl.MonthColor := Value;
end;

function TtsDateTimeDefProps.GetMonthFontColor: TColor;
begin
    Result := DateTimeControl.MonthFontColor;
end;

procedure TtsDateTimeDefProps.SetMonthFontColor(Value: TColor);
begin
    DateTimeControl.MonthFontColor := Value;
end;

function TtsDateTimeDefProps.GetOkCaption: string;
begin
    Result := DateTimeControl.OkCaption;
end;

procedure TtsDateTimeDefProps.SetOkCaption(Value: string);
begin
    DateTimeControl.OkCaption := Value;
end;

function TtsDateTimeDefProps.GetCancelCaption: string;
begin
    Result := DateTimeControl.CancelCaption;
end;

procedure TtsDateTimeDefProps.SetCancelCaption(Value: string);
begin
    DateTimeControl.CancelCaption := Value;
end;

function TtsDateTimeDefProps.GetCaption: string;
begin
    Result := DateTimeControl.Caption;
end;

procedure TtsDateTimeDefProps.SetCaption(Value: string);
begin
    DateTimeControl.Caption := Value;
end;

function TtsDateTimeDefProps.GetSelectSaturday: Boolean;
begin
    Result := DateTimeControl.SelectSaturday;
end;

procedure TtsDateTimeDefProps.SetSelectSaturday(Value: Boolean);
begin
    DateTimeControl.SelectSaturday := Value;
end;

function TtsDateTimeDefProps.GetSelectSunday: Boolean;
begin
    Result := DateTimeControl.SelectSunday;
end;

procedure TtsDateTimeDefProps.SetSelectSunday(Value: Boolean);
begin
    DateTimeControl.SelectSunday := Value;
end;

function TtsDateTimeDefProps.GetShowDayNames: TtsShowDayNames;
begin
    Result := DateTimeControl.ShowDayNames;
end;

procedure TtsDateTimeDefProps.SetShowDayNames(Value: TtsShowDayNames);
begin
    DateTimeControl.ShowDayNames := Value;
end;

function TtsDateTimeDefProps.GetShowSeconds: Boolean;
begin
    Result := DateTimeControl.ShowSeconds;
end;

procedure TtsDateTimeDefProps.SetShowSeconds(Value: Boolean);
begin
    DateTimeControl.ShowSeconds := Value;
end;

function TtsDateTimeDefProps.GetShowToday: Boolean;
begin
    Result := DateTimeControl.ShowToday;
end;

procedure TtsDateTimeDefProps.SetShowToday(Value: Boolean);
begin
    DateTimeControl.ShowToday := Value;
end;

function TtsDateTimeDefProps.GetShowWeekNumbers: Boolean;
begin
    Result := DateTimeControl.ShowWeekNumbers;
end;

procedure TtsDateTimeDefProps.SetShowWeekNumbers(Value: Boolean);
begin
    DateTimeControl.ShowWeekNumbers := Value;
end;

function TtsDateTimeDefProps.GetShowSingleMonth: Boolean;
begin
    Result := DateTimeControl.ShowSingleMonth;
end;

procedure TtsDateTimeDefProps.SetShowSingleMonth(Value: Boolean);
begin
    DateTimeControl.ShowSingleMonth := Value;
end;

function TtsDateTimeDefProps.GetWeekFontColor: TColor;
begin
    Result := DateTimeControl.WeekFontColor;
end;

procedure TtsDateTimeDefProps.SetWeekFontColor(Value: TColor);
begin
    DateTimeControl.WeekFontColor := Value;
end;

function TtsDateTimeDefProps.GetDateTime: Variant;
begin
    Result := DateTimeControl.DateTime;
end;

procedure TtsDateTimeDefProps.SetDateTime(Value: Variant);
begin
    DateTimeControl.DateTime := Value;
end;

function TtsDateTimeDefProps.GetPopupForm: Boolean;
begin
    Result := DateTimeControl.PopupForm;
end;

procedure TtsDateTimeDefProps.SetPopupForm(Value: Boolean);
begin
    DateTimeControl.PopupForm := Value;
end;

function TtsDateTimeDefProps.GetDateTimeControl: TtsDateTime;
begin
    Result := DateTimeDef.DateTimeControl;
end;

function TtsDateTimeDefProps.GetDateTimeDef: TtsDateTimeDef;
begin
    Result := TtsDateTimeDef(inherited DateTimeDef);
end;

end.
