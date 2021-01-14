unit osColorComboBox;

interface

uses  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
      StdCtrls;

type
  TShowStyle = (ssOnlyColor, ssOnlyText, ssColorAndText);

  TosColorComboBox = class(TCustomComboBox)
  private
    FColorValue: TColor;
    FShowStyle: TShowStyle;
    FShowSystemColors : Boolean;

    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    function  IndexOfColor(Value: TColor): Integer;
    procedure SetColorValue(NewValue: TColor);
    procedure ResetItemHeight;
  protected
    FOnChange: TNotifyEvent;
    procedure CreateWnd; override;
    procedure DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState); override;
    procedure Click; override;
    procedure BuildList; virtual;
    procedure Change; override;
    procedure SetShowStyle(Value: TShowStyle);
  public
    constructor Create(AOwner: TComponent); override;
    procedure AddColor(ColorValue: TColor; ColorText: string);
    property Text;
  published
    property ColorValue: TColor read FColorValue write SetColorValue
             default clNone;
    property Color;
    property Ctl3D;
    property DragMode;
    property DragCursor;
    property Enabled;
    property Font;
    property Height default 23;
    property ItemHeight default 17;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property ShowStyle: TShowStyle read FShowStyle write SetShowStyle
             default ssOnlyColor;
    property ShowSystemColors : Boolean read FShowSystemColors write FShowSystemColors;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDropDown;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
  end;

function GetItemHeight(Font: TFont): Integer;

implementation

function GetItemHeight(Font: TFont): Integer;
var
  DC: HDC;
  SaveFont: HFont;
  Metrics: TTextMetric;
begin
  DC := GetDC(0);
  try
    SaveFont := SelectObject(DC, Font.Handle);
    GetTextMetrics(DC, Metrics);
    SelectObject(DC, SaveFont);
  finally
    ReleaseDC(0, DC);
  end;
  Result := Metrics.tmHeight + 2;
end;

{ TosColorComboBox }

const
  ColorsInList = 42;
  ColorValues: array [1..ColorsInList] of TColor = (
    clNone,
    clBlack,
    clMaroon,
    clGreen,
    clOlive,
    clNavy,
    clPurple,
    clTeal,
    clGray,
    clSilver,
    clRed,
    clLime,
    clYellow,
    clBlue,
    clFuchsia,
    clAqua,
    clWhite,
    clScrollBar,
    clBackground,
    clActiveCaption,
    clInactiveCaption,
    clMenu,
    clWindow,
    clWindowFrame,
    clMenuText,
    clWindowText,
    clCaptionText,
    clActiveBorder,
    clInactiveBorder,
    clAppWorkSpace,
    clHighlight,
    clHighlightText,
    clBtnFace,
    clBtnShadow,
    clGrayText,
    clBtnText,
    clInactiveCaptionText,
    clBtnHighlight,
    cl3DDkShadow,
    cl3DLight,
    clInfoText,
    clInfoBk);

constructor TosColorComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Style := csOwnerDrawFixed;
  ItemHeight := 17;
  Height := 23;
  FColorValue := clBlack;
  FShowStyle := ssOnlyColor;
  FShowSystemColors := True;
end;

procedure TosColorComboBox.AddColor(ColorValue: TColor; ColorText: string);
begin
  if IndexOfColor(ColorValue) = -1 then
    Items.AddObject(ColorText, TObject(ColorValue));
end;

procedure TosColorComboBox.BuildList;
var
  I: Integer;
  ColorName: string;
begin
  Clear;
  for I := 1 to ColorsInList do
    if (I <= 16) or
       ((I > 16) and FShowSystemColors) then
    begin
      ColorName := Copy(ColorToString(ColorValues[I]), 3, 30);
      Items.AddObject(ColorName, TObject(ColorValues[I]));
    end;
end;

function  TosColorComboBox.IndexOfColor(Value: TColor): Integer;
var
  nItem: Integer;
begin
  for nItem := Items.Count - 1 downto 0 do
    if TColor(Items.Objects[nItem]) = Value then
        Break;
  Result := nItem;
end;

procedure TosColorComboBox.SetColorValue(NewValue: TColor);
var
  Item: Integer;
begin
  if (ItemIndex < 0) or (NewValue <> FColorValue) then
  begin
    Item := IndexOfColor(NewValue);
    if Item >= 0 then
    begin
      FColorValue := NewValue;
      if ItemIndex <> Item then
        ItemIndex := Item;
      Change;
    end;
  end;
end;

procedure TosColorComboBox.CreateWnd;
begin
  inherited CreateWnd;
  BuildList;
  SetColorValue(FColorValue);
end;

procedure TosColorComboBox.DrawItem(Index: Integer; Rect: TRect;
                                  State: TOwnerDrawState);
const
  ColorWidth = 22;
var
  DrawColor: TColor;
  ARect: TRect;
begin
  if FShowStyle = ssOnlyText then
    inherited
  else
  begin
    DrawColor := TColor(Items.Objects[Index]);
    ARect := Rect;
    Inc(ARect.Top, 2);
    Inc(ARect.Left, 4);
    Dec(ARect.Bottom, 2);
    Canvas.FillRect(Rect);
    if FShowStyle = ssOnlyColor then
      Dec(ARect.Right, 4)
    else
    begin
      ARect.Right := ARect.Left + ColorWidth;
      Canvas.TextOut(ARect.Right + 8, ARect.Top, Items[Index]);
    end;
    with Canvas do
    begin
      Brush.Color := DrawColor;
      with ARect do
        Rectangle(Left, Top, Right, Bottom);
    end;
  end;
end;

procedure TosColorComboBox.Click;
begin
  if ItemIndex >= 0 then
    ColorValue := TColor(Items.Objects[ItemIndex]);

  inherited Click;
end;

procedure TosColorComboBox.CMFontChanged(var Message: TMessage);
begin
  inherited;
  if FShowStyle = ssColorAndText then
  begin
    ResetItemHeight;
    RecreateWnd;
  end;
end;

procedure TosColorComboBox.ResetItemHeight;
var
  newHeight: Integer;
begin
  newHeight := GetItemHeight(Font);
  if newHeight < 9 then
     newHeight := 9;
  ItemHeight := newHeight;
end;

procedure TosColorComboBox.Change;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TosColorComboBox.SetShowStyle(Value: TShowStyle);
begin
  if FShowStyle <> Value then
  begin
    FShowStyle := Value;
    Refresh;
  end;
end;

end.
 