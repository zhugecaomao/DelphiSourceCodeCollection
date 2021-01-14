unit SampleCalendar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Grids,
  StdCtrls;

type
  TSampleCalendar = class(TCustomGrid)
  private
    { Private declarations }
    FDate: TDateTime;
    FMonthOffset: Integer;                           {存储月的偏移}
    FOnChange: TNotifyEvent;

    procedure SetCalendarDate(Value: TDateTime);
    function GetDateElement(Index: Integer): Integer;         {注意Index参数}
    procedure SetDateElement(Index: Integer; Value: Integer);
    function DayNum(ACol, ARow: Integer): Integer;

  protected
    { Protected declarations }
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState);
      override;

    procedure UpdateCalendar; virtual;                 {设置偏移的方法}
    procedure Click; override;
    procedure Change; dynamic;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure NextMonth;
    procedure PrevMonth;
    procedure NextYear;
    procedure PrevYear;
    function SelectCell(ACol, ARow: Longint): Boolean; override;

    property CalendarDate: TDateTime read FDate write SetCalendarDate;
    property Day: Integer index 3 read GetDateElement write SetDateElement;
    property Month: Integer index 2 read GetDateElement write SetDateElement;
    property Year: Integer index 1 read GetDateElement write SetDateElement;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;

  published
    { Published declarations }
    property Align;                           {发布属性}
    property BorderStyle;
    property Color;
    property Font;
    property GridLineWidth;
    property ParentColor;
    property ParentFont;
    property OnClick;                         {发布事件}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TSampleCalendar]);
end;

constructor TSampleCalendar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);                                  {调用继承的构造方法}
  ColCount := 7;                                           {每周一定是7天}
  RowCount := 7;                                          {加上开头，一定是6行}

  FixedCols := 0;                                           {没有行标签}
  FixedRows := 1;                                          {日期名一行}
  ScrollBars := ssNone;                                     {不需要滚动条}
  Options := Options - [goRangeSelect] + [goDrawFocusSelected];  {不能行选择}
  FDate := Date;                       {从RTL得到当前日期}
  UpdateCalendar;                                  {设置正确的偏移}
end;

procedure TSampleCalendar.WMSize(var Message: TWMSize);
var
  GridLines: Integer;                                   {临时局部变量}
begin
  GridLines := 6 * GridLineWidth;                        {计算所有行的大小}
  DefaultColWidth := (Message.Width - GridLines) div 7;     {设置新的默认cell宽度}
  DefaultRowHeight := (Message.Height - GridLines) div 7;    {设置新的默认cell高度}
end;

procedure TSampleCalendar.DrawCell(ACol, ARow: Longint; ARect: TRect;
  AState: TGridDrawState);
var
  TheText: string;
  TempDay: Integer;
begin
  if ARow = 0 then                                   {如果这是表头}
    TheText := ShortDayNames[ACol + 1]               {只是用日期的名称}
  else begin
    TheText := '';                                     {默认为空}
    TempDay := DayNum(ACol, ARow);                 {得到这个cell的数值}
    if TempDay <> -1 then TheText := IntToStr(TempDay);   {如果有效则填充}
  end;
  with ARect, Canvas do
    TextRect(ARect, Left + (Right - Left - TextWidth(TheText)) div 2,
      Top + (Bottom - Top - TextHeight(TheText)) div 2, TheText); 
end;

procedure TSampleCalendar.SetCalendarDate(Value: TDateTime);
begin
  FDate := Value;                      {设置新的日期值}
  UpdateCalendar;                                   {这原来是调用Refresh}
  Change;                                        {这是唯一的新语句}
end;

function TSampleCalendar.GetDateElement(Index: Integer): Integer;
var
  AYear, AMonth, ADay: Word;
begin
  DecodeDate(FDate, AYear, AMonth, ADay);               {将编码日期分解为元素}
  case Index of
    1: Result := AYear;
    2: Result := AMonth;
    3: Result := ADay;
    else Result := -1;
  end;
end;

procedure TSampleCalendar.SetDateElement(Index: Integer; Value: Integer);
var
  AYear, AMonth, ADay: Word;
begin
  if Value > 0 then                                      {所有元素必须是正数}
  begin
    DecodeDate(FDate, AYear, AMonth, ADay);          {获得当前日期元素}
    case Index of                                   {根据索引设置新的元素}
      1: AYear := Value;
      2: AMonth := Value;
      3: ADay := Value;
      else Exit;
    end;
    FDate := EncodeDate(AYear, AMonth, ADay);         {编码修改的日期}
    FDate := EncodeDate(AYear, AMonth, ADay);          {解码修改的日期}
    UpdateCalendar;                                  {这原来是调用Refresh}
    Change;                                      {这是新语句}
  end;
end;

procedure TSampleCalendar.UpdateCalendar;
var
  AYear, AMonth, ADay: Word;
  FirstDate: TDateTime;                             {月的第一天的日期}
begin
  if FDate <> 0 then                                {如果日期有效只计算偏移}
  begin
    DecodeDate(FDate, AYear, AMonth, ADay);         {得到日期元素}
    FirstDate := EncodeDate(AYear, AMonth, 1);         {第一天的日期}
    FMonthOffset := 2 - DayOfWeek(FirstDate);         {在表格中产生偏移}
    Row := (ADay - FMonthOffset) div 7 + 1;
    Col := (ADay - FMonthOffset) mod 7;
  end;
  Refresh;                                        {重画控件}
end;

function TSampleCalendar.DayNum(ACol, ARow: Integer): Integer;
begin
  Result := FMonthOffset + ACol + (ARow - 1) * 7;         {计算这个cell的日期}
  if (Result < 1) or (Result > MonthDays[IsLeapYear(Year), Month]) then
    Result := -1;                                     {如果无效返回－1}
end;

procedure TSampleCalendar.NextMonth;
begin
  CalendarDate := IncMonth(CalendarDate, 1);
end;

procedure TSampleCalendar.PrevMonth;
begin
  CalendarDate := IncMonth(CalendarDate, -1);
end;

procedure TSampleCalendar.NextYear;
begin
  CalendarDate := IncMonth(CalendarDate, 12);
end;

procedure TSampleCalendar.PrevYear;
begin
  CalendarDate := IncMonth(CalendarDate, -12);
end;

procedure TSampleCalendar.Click;
var
  TempDay: Integer;
begin
  TempDay := DayNum(Col, Row);               {获得被点击cell的日期数字}
  if TempDay <> -1 then Day := TempDay;         {如果有效，改变日期}
  inherited Click;                              {记住调用继承方法！}
end;

procedure TSampleCalendar.Change;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

function TSampleCalendar.SelectCell(ACol, ARow: Longint): Boolean;
begin
  if DayNum(ACol, ARow) = -1 then Result := False           {-1指明值无效}
  else Result := inherited SelectCell(ACol, ARow);            {否则使用继承的值}
end;



end.
