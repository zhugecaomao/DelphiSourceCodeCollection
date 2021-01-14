{*******************************************************}
{                                                       }
{       ObjectSight Visual Components                   }
{       TopGrid TtsDateTimeDef abstract class           }
{                                                       }
{       Copyright (c) 2001, ObjectSight                 }
{                                                       }
{*******************************************************}

unit TSDateTimeDef;

interface

uses
    Classes, Controls, Graphics;

type
    {$IFNDEF TSVER_V3}
    TtsDate = TDateTime; 
    {$ENDIF}

    TtsDateTimeLink = class;
    TtsDateTimeDefComponent = class;
    TtsDateTimeDefComponentClass = class of TtsDateTimeDefComponent;

    TtsDateTimeDisplay = (dtDate, dtTime, dtDateTime);
    TtsFirstDayOfWeek = (dowSunday, dowMonday);
    TtsShowDayNames = (sdnNone, sdnFirstLetter, sdnShortDayNames);

    TtsDateTimeProps = class(TPersistent)
    protected
        FDateTimeDef: TtsDateTimeDefComponent;

        function  GetColor: TColor; virtual; abstract;
        procedure SetColor(Value: TColor); virtual; abstract;
        function  GetCalendarRows: Integer; virtual; abstract;
        procedure SetCalendarRows(Value: Integer); virtual; abstract;
        function  GetDateTimeDisplay: TtsDateTimeDisplay; virtual; abstract;
        procedure SetDateTimeDisplay(Value: TtsDateTimeDisplay); virtual; abstract;
        function  GetDayNameFontColor: TColor; virtual; abstract;
        procedure SetDayNameFontColor(Value: TColor); virtual; abstract;
        function  GetDisabledFontColor: TColor; virtual; abstract;
        procedure SetDisabledFontColor(Value: TColor); virtual; abstract;
        function  GetFirstDayOfWeek: TtsFirstDayOfWeek; virtual; abstract;
        procedure SetFirstDayOfWeek(Value: TtsFirstDayOfWeek); virtual; abstract;
        function  GetFont: TFont; virtual; abstract;
        procedure SetFont(Value: TFont); virtual; abstract;
        function  GetParentFont: Boolean; virtual; abstract;
        procedure SetParentFont(Value: Boolean); virtual; abstract;
        function  GetLineColor: TColor; virtual; abstract;
        procedure SetLineColor(Value: TColor); virtual; abstract;
        function  GetMaxDate: TtsDate; virtual; abstract;
        procedure SetMaxDate(Value: TtsDate); virtual; abstract;
        function  GetMinDate: TtsDate; virtual; abstract;
        procedure SetMinDate(Value: TtsDate); virtual; abstract;
        function  GetMonthColor: TColor; virtual; abstract;
        procedure SetMonthColor(Value: TColor); virtual; abstract;
        function  GetMonthFontColor: TColor; virtual; abstract;
        procedure SetMonthFontColor(Value: TColor); virtual; abstract;
        function  GetOkCaption: string; virtual; abstract;
        procedure SetOkCaption(Value: string); virtual; abstract;
        function  GetCancelCaption: string; virtual; abstract;
        procedure SetCancelCaption(Value: string); virtual; abstract;
        function  GetCaption: string; virtual; abstract;
        procedure SetCaption(Value: string); virtual; abstract;
        function  GetSelectSaturday: Boolean; virtual; abstract;
        procedure SetSelectSaturday(Value: Boolean); virtual; abstract;
        function  GetSelectSunday: Boolean; virtual; abstract;
        procedure SetSelectSunday(Value: Boolean); virtual; abstract;
        function  GetShowDayNames: TtsShowDayNames; virtual; abstract;
        procedure SetShowDayNames(Value: TtsShowDayNames); virtual; abstract;
        function  GetShowSeconds: Boolean; virtual; abstract;
        procedure SetShowSeconds(Value: Boolean); virtual; abstract;
        function  GetShowToday: Boolean; virtual; abstract;
        procedure SetShowToday(Value: Boolean); virtual; abstract;
        function  GetShowWeekNumbers: Boolean; virtual; abstract;
        procedure SetShowWeekNumbers(Value: Boolean); virtual; abstract;
        function  GetShowSingleMonth: Boolean; virtual; abstract;
        procedure SetShowSingleMonth(Value: Boolean); virtual; abstract;
        function  GetWeekFontColor: TColor; virtual; abstract;
        procedure SetWeekFontColor(Value: TColor); virtual; abstract;
        function  GetDateTime: Variant; virtual; abstract;
        procedure SetDateTime(Value: Variant); virtual; abstract;
        function  GetPopupForm: Boolean; virtual; abstract;
        procedure SetPopupForm(Value: Boolean); virtual; abstract;

    public
        constructor Create(DateTimeDef: TtsDateTimeDefComponent);
        property DateTimeDef: TtsDateTimeDefComponent read FDateTimeDef;
        property DateTime: Variant read GetDateTime write SetDateTime;
        property PopupForm: Boolean read GetPopupForm write SetPopupForm default False;

    published
        property CalendarRows: Integer read GetCalendarRows write SetCalendarRows default 8;
        property CancelCaption: string read GetCancelCaption write SetCancelCaption;
        property Caption: string read GetCaption write SetCaption;
        property Color: TColor read GetColor write SetColor default clWindow;
        property DateTimeDisplay: TtsDateTimeDisplay read GetDateTimeDisplay write SetDateTimeDisplay default dtDate;
        property DayNameFontColor: TColor read GetDayNameFontColor write SetDayNameFontColor default clHighLight;
        property DisabledFontColor: TColor read GetDisabledFontColor write SetDisabledFontColor default clInactiveBorder;
        property FirstDayOfWeek: TtsFirstDayOfWeek read GetFirstDayOfWeek write SetFirstDayOfWeek default dowSunday;
        property Font: TFont read GetFont write SetFont;
        property LineColor: TColor read GetLineColor write SetLineColor default clGrayText;
        property MaxDate: TtsDate read GetMaxDate write SetMaxDate;
        property MinDate: TtsDate read GetMinDate write SetMinDate;
        property MonthColor: TColor read GetMonthColor write SetMonthColor default clHighLight;
        property MonthFontColor: TColor read GetMonthFontColor write SetMonthFontColor default clHighLightText;
        property OkCaption: String read GetOkCaption write SetOkCaption;
        property ParentFont: Boolean read GetParentFont write SetParentFont;
        property SelectSaturday: Boolean read GetSelectSaturday write SetSelectSaturday default True;
        property SelectSunday: Boolean read GetSelectSunday write SetSelectSunday default True;
        property ShowDayNames: TtsShowDayNames read GetShowDayNames write SetShowDayNames default sdnFirstLetter;
        property ShowSeconds: Boolean read GetShowSeconds write SetShowSeconds default False;
        property ShowSingleMonth: Boolean read GetShowSingleMonth write SetShowSingleMonth default True;
        property ShowToday: Boolean read GetShowToday write SetShowToday default True;
        property ShowWeekNumbers: Boolean read GetShowWeekNumbers write SetShowWeekNumbers default True;
        property WeekFontColor: TColor read GetWeekFontColor write SetWeekFontColor default clHighLight;
    end;

    TtsDateTimeDefComponent = class(TComponent)
    protected
        FLinks: TList;
        FRefCount: TList;

        function  GetControl: TWinControl; virtual; abstract;
        procedure SetSelect(Value: TNotifyEvent); virtual; abstract;
        function  GetSelect: TNotifyEvent; virtual; abstract;
        procedure SetCancel(Value: TNotifyEvent); virtual; abstract;
        function  GetCancel: TNotifyEvent; virtual; abstract;
        procedure SetDateTime(Value: Variant); virtual; abstract;
        function  GetDateTime: Variant; virtual; abstract;
        procedure SetDateTimeDisplay(Value: TtsDateTimeDisplay); virtual; abstract;
        function  GetDateTimeDisplay: TtsDateTimeDisplay; virtual; abstract;
        procedure SetPopupForm(Value: Boolean); virtual; abstract;
        function  GetPopupForm: Boolean; virtual; abstract;
        procedure SetDateTimeProps(Value: TtsDateTimeProps); virtual; abstract;
        function  GetDateTimeProps: TtsDateTimeProps; virtual; abstract;

        procedure AddLink(Link: TtsDateTimeLink);
        procedure RemoveLink(Link: TtsDateTimeLink; RemoveAll: Boolean);
        procedure NotifyLinks;

    public
        constructor Create(AOwner: TComponent); override;
        destructor  Destroy; override;

        procedure InitializeDisplay; virtual; abstract;
        procedure InitializeFocus; virtual; abstract;

        property DateTimeProps: TtsDateTimeProps read GetDateTimeProps write SetDateTimeProps;
        property Control: TWinControl read GetControl;
        property DateTime: Variant read GetDateTime write SetDateTime;
        property DateTimeDisplay: TtsDateTimeDisplay read GetDateTimeDisplay write SetDateTimeDisplay;
        property PopupForm: Boolean read GetPopupForm write SetPopupForm;

        property OnSelect: TNotifyEvent read GetSelect write SetSelect;
        property OnCancel: TNotifyEvent read GetCancel write SetCancel;
    end;

    TtsDateTimeLink = class(TPersistent)
    public
        procedure Add(DateTimeDef: TtsDateTimeDefComponent);
        procedure Remove(DateTimeDef: TtsDateTimeDefComponent);
        procedure DateTimeDefDeleted(DateTimeDef: TtsDateTimeDefComponent); virtual;
    end;

implementation

constructor TtsDateTimeProps.Create(DateTimeDef: TtsDateTimeDefComponent);
begin
    inherited Create;
    FDateTimeDef := DateTimeDef;
end;

{TtsDateTimeDefComponent}

constructor TtsDateTimeDefComponent.Create(AOwner: TComponent);
begin
    inherited;
    FLinks := TList.Create;
    FRefCount := TList.Create;
end;

destructor TtsDateTimeDefComponent.Destroy;
begin
    NotifyLinks;
    FLinks.Free;
    FRefCount.Free;
    inherited;
end;

procedure TtsDateTimeDefComponent.RemoveLink(Link: TtsDateTimeLink; RemoveAll: Boolean);
var
    Index: Integer;
begin
    Index := FLinks.IndexOf(Link);
    if Index >= 0 then
    begin
        FRefCount[Index] := Pointer(Integer(FRefCount[Index]) - 1);
        if RemoveAll or (Integer(FRefCount[Index]) <= 0) then
        begin
            FLinks.Delete(Index);
            FRefCount.Delete(Index);
        end;
    end;
end;

procedure TtsDateTimeDefComponent.AddLink(Link: TtsDateTimeLink);
var
    Index: Integer;
begin
    Index := FLinks.IndexOf(Link);
    if Index >= 0 then
        FRefCount[Index] := Pointer(Integer(FRefCount[Index]) + 1)
    else
    begin
        FLinks.Add(Link);
        FRefCount.Add(Pointer(1));
    end;
end;

procedure TtsDateTimeDefComponent.NotifyLinks;
var
    I: Integer;
    Link: TtsDateTimeLink;
begin
    for I := 0 to FLinks.Count - 1 do
    begin
        Link := TtsDateTimeLink(FLinks.Items[I]);
        Link.DateTimeDefDeleted(Self);
    end;
end;

{TtsDateTimeLink}

procedure TtsDateTimeLink.Add(DateTimeDef: TtsDateTimeDefComponent);
begin
    if not Assigned(DateTimeDef) then Exit;
    DateTimeDef.AddLink(Self);
end;

procedure TtsDateTimeLink.Remove(DateTimeDef: TtsDateTimeDefComponent);
begin
    if not Assigned(DateTimeDef) then Exit;
    DateTimeDef.RemoveLink(Self, False);
end;

procedure TtsDateTimeLink.DateTimeDefDeleted(DateTimeDef: TtsDateTimeDefComponent);
begin
end;

end.
