unit FlatBars;

interface

{$I FlatStyle.inc}

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls, 
  Forms, ExtCtrls, Comctrls, FlatUtils, FlatBtns;

type
  { TFlatProgressBar }
  TFlatProgressBar = class(TVersionGraphic)
  private
    FTransparent: Boolean;
    FSmooth: Boolean;
    FUseAdvColors: Boolean;
    FAdvColorBorder: TAdvColors;
    FOrientation: TProgressBarOrientation;
    FElementWidth: Integer;
    FElementColor: TColor;
    FBorderColor: TColor;
    FPosition: Integer;
    FMin: Integer;
    FMax: Integer;
    FStep: Integer;
    procedure SetMin (Value: Integer);
    procedure SetMax (Value: Integer);
    procedure SetPosition (Value: Integer);
    procedure SetStep (Value: Integer);
    procedure SetColors (Index: Integer; Value: TColor);
    procedure SetAdvColors (Index: Integer; Value: TAdvColors);
    procedure SetUseAdvColors (Value: Boolean);
    procedure SetOrientation (Value: TProgressBarOrientation);
    procedure SetSmooth (Value: Boolean);
    procedure CheckBounds;
    procedure CMSysColorChange (var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMParentColorChanged (var Message: TWMNoParams); message CM_PARENTCOLORCHANGED;
    procedure SetTransparent (const Value: Boolean);
  protected
    procedure CalcAdvColors;
    procedure DrawElements;
    procedure Paint; override;
   {$IFDEF DFS_COMPILER_4_UP}
    procedure SetBiDiMode(Value: TBiDiMode); override;
   {$ENDIF}
  public
    constructor Create (AOwner: TComponent); override;
    procedure StepIt;
    procedure StepBy (Delta: Integer);
  published
    property Transparent: Boolean read FTransparent write SetTransparent default false;
    property Align;
    property Cursor;
    property Color default DefaultFlatColor;
    property ColorElement: TColor index 0 read FElementColor write SetColors default $00996633;
    property ColorBorder: TColor index 1 read FBorderColor write SetColors default DefaultBorderColor;
    property AdvColorBorder: TAdvColors index 0 read FAdvColorBorder write SetAdvColors default 50;
    property UseAdvColors: Boolean read FUseAdvColors write SetUseAdvColors default false;
    property Orientation: TProgressBarOrientation read FOrientation write SetOrientation default pbHorizontal;
    property Enabled;
    property ParentColor;
    property Visible;
    property Hint;
    property ShowHint;
    property PopupMenu;
    property ParentShowHint;
    property Min: Integer read FMin write SetMin;
    property Max: Integer read FMax write SetMax;
    property Position: Integer read FPosition write SetPosition default 0;
    property Step: Integer read FStep write SetStep default 10;
    property Smooth: Boolean read FSmooth write SetSmooth default false;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
   {$IFDEF DFS_COMPILER_4_UP}
    property Anchors;
    property BiDiMode write SetBidiMode;
    property Constraints;
    property DragKind;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
   {$ENDIF}
  end;

  TFlatTitlebar = class(TVersionControl)
  private
   FForm: TCustomForm;
   FWndProcInstance: Pointer;
   FDefProc: LongInt;
   FActive: Boolean;
   FDown: Boolean;
   FOldX, FOldY: Integer;
   FActiveTextColor: TColor;
   FInactiveTextColor: TColor;
   FTitlebarColor: TColor;
   FOnActivate: TNotifyEvent;
   FOnDeactivate: TNotifyEvent;
   procedure FormWndProc(var Message: TMessage);
   procedure DoActivateMessage(var Message: TWMActivate);
   procedure DoActivation;
   procedure DoDeactivation;
   procedure SetActiveTextColor(Value: TColor);
   procedure SetInactiveTextColor(Value: TColor);
   procedure SetTitlebarColor(Value: TColor);
   procedure CMFontChanged (var Message: TMessage); message CM_FONTCHANGED;
   procedure CMTextChanged (var Message: TMessage); message CM_TEXTCHANGED;
  protected
   procedure Loaded; override;
   procedure Paint; override;
   procedure SetParent(AParent: TWinControl); override;
   procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
   procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
   procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  public
    { Public declarations }
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;
  published
   property ActiveTextColor: TColor read FActiveTextColor write SetActiveTextColor;
   property InactiveTextColor: TColor read FInactiveTextColor write SetInactiveTextColor;
   property TitlebarColor: TColor read FTitlebarColor write SetTitlebarColor;
   property Align;
   property Font;
   property Caption;
   property OnMouseDown;
   property OnMouseMove;
   property OnMouseUp;
   property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
   property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
  end;
   { TFlatScrollbarThumb }
  TFlatScrollbarThumb = class(TDefineButton)
  private
    FDown: Boolean;
    FOldX, FOldY: Integer;
    FTopLimit: Integer;
    FBottomLimit: Integer;
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  public
    constructor Create(AOwner: TComponent); override;
    property Color;
  end;

{ TFlatScrollbarTrack }

  TFlatScrollbarTrack = class (TVersionControl)
  private
    FThumb: TFlatScrollbarThumb;

    FKind: TScrollBarKind;

    FSmallChange: Integer;
    FLargeChange: Integer;
    FMin: Integer;
    FMax: Integer;
    FPosition: Integer;

    procedure SetSmallChange(Value: Integer);
    procedure SetLargeChange(Value: Integer);
    procedure SetMin(Value: Integer);
    procedure SetMax(Value: Integer);
    procedure SetPosition(Value: Integer);
    procedure SetKind(Value: TScrollBarKind);

    procedure WMSize(var Message: TMessage); message WM_SIZE;

    function ThumbFromPosition: Integer;
    function PositionFromThumb: Integer;

    procedure DoPositionChange;

    procedure DoThumbHighlightColor(Value: TColor);
    procedure DoThumbShadowColor(Value: TColor);
    procedure DoThumbBorderColor(Value: TColor);
    procedure DoThumbFocusedColor(Value: TColor);
    procedure DoThumbDownColor(Value: TColor);
    procedure DoThumbColor(Value: TColor);

    procedure DoHScroll(var Message: TWMScroll);
    procedure DoVScroll(var Message: TWMScroll);
    procedure DoEnableArrows(var Message: TMessage);
    procedure DoGetPos(var Message: TMessage);
    procedure DoGetRange(var Message: TMessage);
    procedure DoSetPos(var Message: TMessage);
    procedure DoSetRange(var Message: TMessage);
    procedure DoKeyDown(var Message: TWMKeyDown);
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Paint; override;
  published
    property Align;
    property Color;
    property ParentColor;
    property Min: Integer read FMin write SetMin;
    property Max: Integer read FMax write SetMax;
    property SmallChange: Integer read FSmallChange write SetSmallChange;
    property LargeChange: Integer read FLargeChange write SetLargeChange;
    property Position: Integer read FPosition write SetPosition;
    property Kind: TScrollBarKind read FKind write SetKind;
    property Version;
  end;

{ TFlatScrollbarButton }

  TFlatScrollbarButton = class (TDefineButton)
  private
    FNewDown: Boolean;
    FTimer: TTimer;
    FOnDown: TNotifyEvent;
    procedure DoTimer(Sender: TObject);
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Align;
    property OnDown: TNotifyEvent read FOnDown write FOnDown;
    property Version;
  end;

  { TFlatScrollbar }

  TFlatOnScroll = procedure (Sender: TObject; ScrollPos: Integer) of object;

  TFlatScrollbar = class(TVersionControl)
  private
    FTrack: TFlatScrollbarTrack;

    FBtnOne: TFlatScrollbarButton;
    FBtnTwo: TFlatScrollbarButton;

    FMin: Integer;
    FMax: Integer;
    FSmallChange: Integer;
    FLargeChange: Integer;
    FPosition: Integer;
    FKind: TScrollBarKind;

    FButtonHighlightColor: TColor;
    FButtonShadowColor: TColor;
    FButtonBorderColor: TColor;
    FButtonFocusedColor: TColor;
    FButtonDownColor: TColor;
    FButtonColor: TColor;
    FThumbHighlightColor: TColor;
    FThumbShadowColor: TColor;
    FThumbBorderColor: TColor;
    FThumbFocusedColor: TColor;
    FThumbDownColor: TColor;
    FThumbColor: TColor;

    FOnScroll: TFlatOnScroll;

    procedure SetSmallChange(Value: Integer);
    procedure SetLargeChange(Value: Integer);
    procedure SetMin(Value: Integer);
    procedure SetMax(Value: Integer);
    procedure SetPosition(Value: Integer);
    procedure SetKind(Value: TScrollBarKind);

    procedure SetButtonHighlightColor(Value: TColor);
    procedure SetButtonShadowColor(Value: TColor);
    procedure SetButtonBorderColor(Value: TColor);
    procedure SetButtonFocusedColor(Value: TColor);
    procedure SetButtonDownColor(Value: TColor);
    procedure SetButtonColor(Value: TColor);
    procedure SetThumbHighlightColor(Value: TColor);
    procedure SetThumbShadowColor(Value: TColor);
    procedure SetThumbBorderColor(Value: TColor);
    procedure SetThumbFocusedColor(Value: TColor);
    procedure SetThumbDownColor(Value: TColor);
    procedure SetThumbColor(Value: TColor);

    procedure BtnOneClick(Sender: TObject);
    procedure BtnTwoClick(Sender: TObject);

    procedure EnableBtnOne(Value: Boolean);
    procedure EnableBtnTwo(Value: Boolean);

    procedure DoScroll;

    procedure WMSize(var Message: TWMSize); message WM_SIZE;

    procedure CNHScroll(var Message: TWMScroll); message WM_HSCROLL;
    procedure CNVScroll(var Message: TWMScroll); message WM_VSCROLL;
    procedure SBMEnableArrows(var Message: TMessage); message SBM_ENABLE_ARROWS;
    procedure SBMGetPos(var Message: TMessage); message SBM_GETPOS;
    procedure SBMGetRange(var Message: TMessage); message SBM_GETRANGE;
    procedure SBMSetPos(var Message: TMessage); message SBM_SETPOS;
    procedure SBMSetRange(var Message: TMessage); message SBM_SETRANGE;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Min: Integer read FMin write SetMin default 0;
    property Max: Integer read FMax write SetMax default 100;
    property SmallChange: Integer read FSmallChange write SetSmallChange default 1;
    property LargeChange: Integer read FLargeChange write SetLargeChange default 1;
    property Position: Integer read FPosition write SetPosition default 0;
    property Kind: TScrollBarKind read FKind write SetKind default sbVertical;
    property OnScroll: TFlatOnScroll read FOnScroll write FOnScroll;
    property ButtonHighlightColor: TColor read FButtonHighlightColor write SetButtonHighlightColor;
    property ButtonShadowColor: TColor read FButtonShadowColor write SetButtonShadowColor;
    property ButtonBorderColor: TColor read FButtonBorderColor write SetButtonBorderColor;
    property ButtonFocusedColor: TColor read FButtonFocusedColor write SetButtonFocusedColor;
    property ButtonDownColor: TColor read FButtonDownColor write SetButtonDownColor;
    property ButtonColor: TColor read FButtonColor write SetButtonColor;
    property ThumbHighlightColor: TColor read FThumbHighlightColor write SetThumbHighlightColor;
    property ThumbShadowColor: TColor read FThumbShadowColor write SetThumbShadowColor;
    property ThumbBorderColor: TColor read FThumbBorderColor write SetThumbBorderColor;
    property ThumbFocusedColor: TColor read FThumbFocusedColor write SetThumbFocusedColor;
    property ThumbDownColor: TColor read FThumbDownColor write SetThumbDownColor;
    property ThumbColor: TColor read FThumbColor write SetThumbColor;
    property Version;
    property Align;
    property Color;
    property ParentColor;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyUp;
    property OnStartDrag;
  end;
  { TFlatGauge }
  TFlatGauge = class(TVersionGraphic)
  private
    FTransparent: Boolean;
    FUseAdvColors: Boolean;
    FAdvColorBorder: TAdvColors;
    FBarColor, FBorderColor: TColor;
    FMinValue, FMaxValue, FProgress: LongInt;
    FShowText: Boolean;
    fTextFront: TCaption;
    fTextAfter: TCaption;
    fColorStop: TColor;
    fColorStart: TColor;
    fStyleBars: TStyleOrien;
    fStyleFace: TStyleFace;
    procedure SetShowText(Value: Boolean);
    procedure SetMinValue(Value: Longint);
    procedure SetMaxValue(Value: Longint);
    procedure SetProgress(Value: Longint);
    procedure SetColors (Index: Integer; Value: TColor);
    procedure SetAdvColors (Index: Integer; Value: TAdvColors);
    procedure SetUseAdvColors (Value: Boolean);
    procedure CMSysColorChange (var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMParentColorChanged (var Message: TWMNoParams); message CM_PARENTCOLORCHANGED;
    procedure SetTransparent (const Value: Boolean);
    procedure SetTextFront(const Value: TCaption);
    procedure SetTextAfter(const Value: TCaption);
    procedure SetStyleOrien(const Value: TStyleOrien);
    procedure SetStyleFace(const Value: TStyleFace);
  protected
    procedure CalcAdvColors;
    procedure Paint; override;
   {$IFDEF DFS_COMPILER_4_UP}
    procedure SetBiDiMode(Value: TBiDiMode); override;
   {$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AdvColorBorder: TAdvColors index 0 read FAdvColorBorder write SetAdvColors default 50;
    property Transparent: Boolean read FTransparent write SetTransparent default false;
    property UseAdvColors: Boolean read FUseAdvColors write SetUseAdvColors default False;

    property StyleFace: TStyleFace read fStyleFace write SetStyleFace default DefaultStyleFace;
    property StyleOrien: TStyleOrien read fStyleBars write SetStyleOrien default DefaultStyleHorizontal;
    property StyleColorStart: TColor index 2 read fColorStart write SetColors default DefaultColorStart;
    property StyleColorStop: TColor index 3 read fColorStop write SetColors default DefaultColorStop;
    property Version;
    property Color default $00E0E9EF;
    property ColorBorder: TColor index 0 read FBorderColor write SetColors default DefaultBorderColor;
    property BarColor: TColor index 1 read FBarColor write SetColors default $00996633;
    property Min: Longint read FMinValue write SetMinValue default 0;
    property Max: Longint read FMaxValue write SetMaxValue default 100;
    property Progress: Longint read FProgress write SetProgress;
    property ShowText: Boolean read FShowText write SetShowText default True;
    property TextFront: TCaption read fTextFront write SetTextFront;
    property TextAfter: TCaption read fTextAfter write SetTextAfter;
    property Align;
    property Enabled;
    property Font;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property ShowHint;
    property Visible;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
   {$IFDEF DFS_COMPILER_4_UP}
    property Anchors;
    property BiDiMode write SetBidiMode;
    property Constraints;
    property DragKind;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
   {$ENDIF}
  end;

implementation

{$R FlatBars.RES}

uses FlatConsts;

{ TFlatProgressBar }
constructor TFlatProgressBar.Create (AOwner: TComponent);
begin
  inherited Create(AOwner);
  Height          := 16;
  Width           := 147;
  FElementWidth   := 8;
  FElementColor   := $00996633;
  FBorderColor    := DefaultBorderColor;
  ParentColor     := True;
  Orientation     := pbHorizontal;
  FStep           := 10;
  FMin            := 0;
  FMax            := 100;
  FUseAdvColors   := false;
  FAdvColorBorder := 50;
  Transparent     := false;
end;

procedure TFlatProgressBar.SetOrientation (Value: TProgressBarOrientation);
begin
  if FOrientation <> Value then
  begin
    FOrientation := Value;
    if (csLoading in ComponentState) then
    begin
      Repaint;
      Exit;
    end;
    SetBounds(Left, Top, Height, Width);
    Invalidate;
  end;
end;

procedure TFlatProgressBar.SetMin (Value: Integer);
begin
  if FMin <> Value then
  begin
    FMin := Value;
    Invalidate;
  end;
end;

procedure TFlatProgressBar.SetMax (Value: Integer);
begin
  if FMax <> Value then
  begin
    if Value < FPosition then FPosition := Value;
    FMax := Value;
    Invalidate;
  end;
end;

procedure TFlatProgressBar.SetPosition (Value: Integer);
begin
  if Value > FMax then Value := FMax;
  if Value < FMin then Value := FMin;
  
  if Value > FPosition then
  begin
    FPosition := Value;
    DrawElements;
  end;
  if Value < FPosition then
  begin
    FPosition := Value;
    Invalidate;
  end;
end;

procedure TFlatProgressBar.SetStep (Value: Integer);
begin
  if FStep <> Value then
  begin
    FStep := Value;
    Invalidate;
  end;
end;

procedure TFlatProgressBar.StepIt;
begin
  if (FPosition + FStep) > FMax then
    FPosition := FMax
  else
    FPosition := FPosition + FStep;
  DrawElements;
end;

procedure TFlatProgressBar.StepBy (Delta: Integer);
begin
  if (FPosition + Delta) > FMax then
    FPosition := FMax
  else
    FPosition := FPosition + Delta;
  DrawElements;
end;

procedure TFlatProgressBar.SetColors (Index: Integer; Value: TColor);
begin
  case Index of
    0: FElementColor := Value;
    1: FBorderColor := Value;
  end;
  Invalidate;
end;

procedure TFlatProgressBar.CalcAdvColors;
begin
  if FUseAdvColors then
  begin
    FBorderColor := CalcAdvancedColor(Color, FBorderColor, FAdvColorBorder, darken);
  end;
end;

procedure TFlatProgressBar.SetAdvColors (Index: Integer; Value: TAdvColors);
begin
  case Index of
    0: FAdvColorBorder := Value;
  end;
  CalcAdvColors;
  Invalidate;
end;

procedure TFlatProgressBar.SetUseAdvColors (Value: Boolean);
begin
  if Value <> FUseAdvColors then
  begin
    FUseAdvColors := Value;
    ParentColor := Value;
    CalcAdvColors;
    Invalidate;
  end;
end;

procedure TFlatProgressBar.CMSysColorChange (var Message: TMessage);
begin
  if FUseAdvColors then
  begin
    ParentColor := True;
    CalcAdvColors;
  end;
  Invalidate;
end;

procedure TFlatProgressBar.CMParentColorChanged (var Message: TWMNoParams);
begin
  inherited;
  if FUseAdvColors then
  begin
    ParentColor := True;
    CalcAdvColors;
  end;
  Invalidate;
end;

procedure TFlatProgressBar.SetSmooth(Value: Boolean);
begin
  if Value <> FSmooth then
  begin
    FSmooth := Value;
    Invalidate;
  end;
end;

procedure TFlatProgressBar.SetTransparent(const Value: Boolean);
begin
  FTransparent := Value;
  Invalidate;
end;

{$IFDEF DFS_COMPILER_4_UP}
procedure TFlatProgressBar.SetBiDiMode(Value: TBiDiMode);
begin
  inherited;
  Invalidate;
end;
{$ENDIF}

procedure TFlatProgressBar.CheckBounds;
var
  maxboxes: Word;
begin
  if FOrientation = pbHorizontal then
  begin
    maxboxes := (Width - 3) div (FElementWidth + 1);
    if Width < 12 then
      Width := 12
    else
      Width := maxboxes * (FElementWidth + 1) + 3;
  end
  else
  begin
    maxboxes := (Height - 3) div (FElementWidth + 1);
    if Height < 12 then
      Height := 12
    else
      Height := maxboxes * (FElementWidth + 1) + 3;
  end;
end;

procedure TFlatProgressBar.Paint;
var
  PaintRect: TRect;
begin
  if not Smooth then
    CheckBounds;
  PaintRect := ClientRect;
  
  // Background
  if not FTransparent then begin
    canvas.Brush.Color := Self.Color;
    canvas.Brush.Style := bsSolid;
    canvas.FillRect(PaintRect);
  end;

  // Border
  canvas.Brush.Color := FBorderColor;
  Canvas.FrameRect(PaintRect);

  // Elements
  DrawElements;
end;

procedure TFlatProgressBar.DrawElements;
var
  NumElements, NumToPaint: LongInt;
  Painted: Byte;
  ElementRect: TRect;
begin
  with canvas do
  begin
    if not Smooth then begin
      if FOrientation = pbHorizontal then
      begin
        NumElements := Trunc((ClientWidth - 3) div (FElementWidth + 1));
        NumToPaint := Trunc((FPosition - FMin) / ((FMax - FMin) / NumElements) + 0.00000001);

        if NumToPaint > NumElements then
          NumToPaint := NumElements;

        {$IFDEF DFS_COMPILER_4_UP}
        if BidiMode = bdRightToLeft then
          ElementRect := Rect(ClientRect.Right - 2 - FElementWidth, ClientRect.Top + 2, ClientRect.Right - 2, ClientRect.Bottom - 2)
        else
          ElementRect := Rect(ClientRect.Left + 2, ClientRect.Top + 2, ClientRect.Left + 2 + FElementWidth, ClientRect.Bottom - 2);
        {$ELSE}
        ElementRect := Rect(ClientRect.Left + 2, ClientRect.Top + 2, ClientRect.Left + 2 + FElementWidth, ClientRect.Bottom - 2);
        {$ENDIF}

        if NumToPaint > 0 then
        begin
          Brush.Color := FElementColor;
          Brush.Style := bsSolid;
          for Painted := 1 to NumToPaint do
          begin
            Canvas.FillRect(ElementRect);
            {$IFDEF DFS_COMPILER_4_UP}
            if BidiMode = bdRightToLeft then
            begin
              ElementRect.Left := ElementRect.Left - FElementWidth - 1;
              ElementRect.Right := ElementRect.Right - FElementWidth - 1;
            end
            else
            begin
             ElementRect.Left := ElementRect.Left + FElementWidth + 1;
             ElementRect.Right := ElementRect.Right + FElementWidth + 1;
            end;
            {$ELSE}
            ElementRect.Left := ElementRect.Left + FElementWidth + 1;
            ElementRect.Right := ElementRect.Right + FElementWidth + 1;
            {$ENDIF}
          end;
        end;
      end
      else
      begin
        NumElements := Trunc((ClientHeight - 3) div (FElementWidth + 1));
        NumToPaint := Trunc((FPosition - FMin) / ((FMax - FMin) / NumElements) + 0.00000001);

        if NumToPaint > NumElements then
          NumToPaint := NumElements;
        ElementRect := Rect(ClientRect.Left + 2, ClientRect.Bottom - FElementWidth - 2, ClientRect.Right - 2, ClientRect.Bottom - 2);


        if NumToPaint > 0 then
        begin
          Brush.Color := FElementColor;
          Brush.Style := bsSolid;
          for Painted := 1 to NumToPaint do
          begin
            Canvas.FillRect(ElementRect);
            ElementRect.Top := ElementRect.Top - (FElementWidth + 1);
            ElementRect.Bottom := ElementRect.Bottom - (FElementWidth + 1);
          end;
        end;
      end;
    end
    else
    begin
      if (FOrientation = pbHorizontal) and (FPosition > 0) then
      begin
        Brush.Color := FElementColor;
        Canvas.FillRect(Rect(2, 2, ClientRect.Left + 2 + ((FPosition * (ClientWidth - 4)) div (FMax - FMin)), ClientRect.Bottom - 2));
      end
      else
      begin
        Brush.Color := FElementColor;
        Canvas.FillRect(Rect(2, ClientRect.Bottom - 2 - ((FPosition * (ClientHeight - 4)) div (FMax - FMin)), ClientRect.Right - 2, ClientRect.Bottom - 2));
      end;
    end;
  end;
end;

{ TFlatTitlebar }
constructor TFlatTitlebar.Create(AOwner: TComponent);
begin
 inherited Create(AOwner);
 Width := 100;
 Height := 19;
 ControlStyle := ControlStyle + [csAcceptsControls];
 TitlebarColor := ecCaptionBackground;
 ActiveTextColor := ecActiveCaption;
 InactiveTextColor := ecInactiveCaption;
  if csDesigning in ComponentState then
   begin
    FActive := True;
   end;
end;

destructor TFlatTitlebar.Destroy;
begin
 inherited Destroy;
end;

procedure TFlatTitlebar.Loaded;
var
 Wnd: HWND;
begin
 inherited Loaded;
  if not (csDesigning in ComponentState) and (FForm <> nil) then
   begin
    if FForm <> nil then
     begin
      Wnd := FForm.Handle;
      FWndProcInstance := MakeObjectInstance(FormWndProc);
      FDefProc := SetWindowLong(Wnd,GWL_WNDPROC,LongInt(FWndProcInstance));
     end;
  end;
end;

procedure TFlatTitlebar.FormWndProc(var Message: TMessage);
begin
 case Message.Msg of
  WM_ACTIVATE: DoActivateMessage(TWMActivate(Message));
 end;
 Message.Result := CallWindowProc(Pointer(FDefProc),FForm.Handle,Message.Msg,Message.WParam, Message.LParam);
end;

procedure TFlatTitlebar.DoActivateMessage(var Message: TWMActivate);
begin
 case Message.Active of
  WA_ACTIVE: DoActivation;
  WA_CLICKACTIVE: DoActivation;
  WA_INACTIVE: DoDeactivation;
 end;
end;

procedure TFlatTitlebar.DoActivation;
begin
 FActive := True;
 Invalidate;
 if Assigned(FOnActivate) then FOnActivate(Self);
end;

procedure TFlatTitlebar.DoDeactivation;
begin
 FActive := False;
 Invalidate;
 if Assigned(FOnDeactivate) then FOnDeactivate(Self);
end;

procedure TFlatTitlebar.Paint;
var
 iCaptionWidth, iCaptionHeight, iX, iY: Integer;
begin
 with Canvas do
  begin
   with ClientRect do
    begin
     Canvas.Font.Assign(Self.Font);
      case FActive of
       True: Canvas.Font.Color := FActiveTextColor;
       False: Canvas.Font.Color := FInactiveTextColor;
      end;
     iCaptionWidth := TextWidth(Caption);
     iCaptionHeight := TextHeight(Caption);
     Brush.Color := TitlebarColor;
     FillRect(ClientRect);
     iX := Width div 2 - iCaptionWidth div 2;
     iY := Height div 2 - iCaptionHeight div 2;
     TextOut(iX,iY,Caption);
    end;
  end;
end;

procedure TFlatTitlebar.MouseMove;
begin
 if FDown then
  begin
   TCustomForm(Owner).Left := TCustomForm(Owner).Left + X - FOldX;
   TCustomForm(Owner).Top := TCustomForm(Owner).Top + Y - FOldY;
  end;
end;

procedure TFlatTitlebar.MouseUp;
begin
 FDown := False;
end;

procedure TFlatTitlebar.MouseDown;
begin
 if (Button = mbleft) and not FDown then FDown := True;
 FOldX := X;
 FOldy := Y;
end;

procedure TFlatTitlebar.SetActiveTextColor(Value: TColor);
begin
 if Value <> FActiveTextColor then
  begin
   FActiveTextColor := Value;
   Invalidate;
  end;
end;

procedure TFlatTitlebar.SetInactiveTextColor(Value: TColor);
begin
 if Value <> FInactiveTextColor then
  begin
   FInactiveTextColor := Value;
   Invalidate;
  end;
end;

procedure TFlatTitlebar.SetTitlebarColor(Value: TColor);
begin
 if Value <> FTitlebarColor then
  begin
   FTitlebarColor := Value;
   Invalidate;
  end;
end;

procedure TFlatTitlebar.SetParent(AParent: TWinControl);
begin
 if (AParent <> nil) and not(AParent is TCustomForm) then
  raise EInvalidOperation.Create(SParentForm);
 FForm := TCustomForm(AParent);
 inherited;
end;

procedure TFlatTitlebar.CMFontChanged (var Message: TMessage);
begin
 Invalidate;
end;

procedure TFlatTitlebar.CMTextChanged (var Message: TMessage);
begin
 Invalidate;
end;

{ TFlatScrollbarTrackThumb }

constructor TFlatScrollbarThumb.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TFlatScrollbarThumb.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  iTop: Integer;
begin
  if TFlatScrollbarTrack(Parent).Kind = sbVertical then
  begin
    FTopLimit := 0;
    FBottomLimit := TFlatScrollbarTrack(Parent).Height;
    if FDown = True then
    begin
      iTop := Top + Y - FOldY;
      if iTop < FTopLimit then
      begin
        iTop := FTopLimit;
      end;
      if (iTop > FBottomLimit) or ((iTop + Height) > FBottomLimit) then
      begin
        iTop := FBottomLimit - Height;
      end;
      Top := iTop;
    end;
  end
  else
  begin
    FTopLimit := 0;
    FBottomLimit := TFlatScrollbarTrack(Parent).Width;
    if FDown = True then
    begin
      iTop := Left + X - FOldX;
      if iTop < FTopLimit then
      begin
        iTop := FTopLimit;
      end;
      if (iTop > FBottomLimit) or ((iTop + Width) > FBottomLimit) then
      begin
        iTop := FBottomLimit - Width;
      end;
      Left := iTop;
    end;
  end;
  TFlatScrollbarTrack(Parent).FPosition := TFlatScrollbarTrack(Parent).PositionFromThumb;
  TFlatScrollbarTrack(Parent).DoPositionChange;
  inherited MouseMove(Shift,X,Y);
end;

procedure TFlatScrollbarThumb.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDown := False;
  inherited MouseUp(Button,Shift,X,Y);
end;

procedure TFlatScrollbarThumb.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbleft) and not FDown then FDown := True;
  FOldX := X;
  FOldy := Y;
  inherited MouseDown(Button,Shift,X,Y);
end;

{ TFlatScrollbarTrack }

constructor TFlatScrollbarTrack.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Color := ecLightKaki;

  FThumb := TFlatScrollbarThumb.Create(Self);
  FThumb.Color := ecLightBrown;
  FThumb.ColorFocused := ecLightBrown;
  FThumb.ColorDown := ecLightBrown;
  FThumb.ColorBorder := ecLightBrown;
  //FThumb.ColorHighLight := ecLightBrown;
  FThumb.ColorShadow := ecLightBrown;
  FThumb.Height := 17;
  InsertControl(FThumb);

  FMin := 0;
  FMax := 100;
  FSmallChange := 1;
  FLargeChange := 1;
  FPosition := 0;

  FThumb.Top := ThumbFromPosition;
end;

destructor TFlatScrollbarTrack.Destroy;
begin
  FThumb.Free;
  inherited Destroy;
end;

procedure TFlatScrollbarTrack.Paint;
begin
  with Canvas do
  begin
    Brush.Color := Color;
    FillRect(ClientRect);
  end;
end;

procedure TFlatScrollbarTrack.SetSmallChange(Value: Integer);
begin
  if Value <> FSmallChange then
  begin
    FSmallChange := Value;
  end;
end;

procedure TFlatScrollbarTrack.SetLargeChange(Value: Integer);
begin
  if Value <> FLargeChange then
  begin
    FLargeChange := Value;
  end;
end;

procedure TFlatScrollbarTrack.SetMin(Value: Integer);
begin
  if Value <> FMin then
  begin
    FMin := Value;
    FThumb.Top := ThumbFromPosition;
  end;
end;

procedure TFlatScrollbarTrack.SetMax(Value: Integer);
begin
  if Value <> FMax then
  begin
    FMax := Value;
    FThumb.Top := ThumbFromPosition;
  end;
end;

procedure TFlatScrollbarTrack.SetPosition(Value: Integer);
begin
  FPosition := Value;
  if Position > Max then
  begin
    Position := Max;
  end;
  if Position < Min then
  begin
    Position := Min;
  end;
  case FKind of
    sbVertical: FThumb.Top := ThumbFromPosition;
    sbHorizontal: FThumb.Left := ThumbFromPosition;
  end;
end;

procedure TFlatScrollbarTrack.SetKind(Value: TScrollBarKind);
begin
  if Value <> FKind then
  begin
    FKind:= Value;
    case FKind of
      sbVertical: FThumb.Height := 17;
      sbHorizontal: FThumb.Width := 17;
    end;
  end;
  Position := FPosition;
end;

procedure TFlatScrollbarTrack.WMSize(var Message: TMessage);
begin
  if FKind = sbVertical then
  begin
    FThumb.Width := Width;
  end
  else
  begin
    FThumb.Height := Height;
   end;
end;

function TFlatScrollbarTrack.ThumbFromPosition: Integer;
var
  iHW, iMin, iMax, iPosition, iResult: Integer;
begin
  iHW := 0;
  case FKind of
    sbVertical: iHW := Height - FThumb.Height;
    sbHorizontal: iHW := Width - FThumb.Width;
  end;
  iMin := FMin;
  iMax := FMax;
  iPosition := FPosition;
  iResult := Round((iHW / (iMax - iMin)) * iPosition);
  Result := iResult;
end;

function TFlatScrollbarTrack.PositionFromThumb: Integer;
var
  iHW, iMin, iMax, iPosition, iResult: Integer;
begin
  iHW := 0;
  case FKind of
    sbVertical: iHW :=  Height - FThumb.Height;
    sbHorizontal: iHW := Width - FThumb.Width;
  end;
  iMin := FMin;
  iMax := FMax;
  iPosition := 0;
  case FKind of
    sbVertical: iPosition := FThumb.Top;
    sbHorizontal: iPosition := FThumb.Left;
  end;
  iResult := Round(iPosition / iHW * (iMax - iMin));
  Result := iResult;
end;

procedure TFlatScrollbarTrack.DoPositionChange;
begin
  TFlatScrollbar(Parent).FPosition := Position;
  TFlatScrollbar(Parent).DoScroll;
end;

procedure TFlatScrollbarTrack.DoThumbHighlightColor(Value: TColor);
begin
  //FThumb.ColorHighlight := Value;
end;

procedure TFlatScrollbarTrack.DoThumbShadowColor(Value: TColor);
begin
  FThumb.ColorShadow := Value;
end;

procedure TFlatScrollbarTrack.DoThumbBorderColor(Value: TColor);
begin
  FThumb.ColorBorder := Value;
end;

procedure TFlatScrollbarTrack.DoThumbFocusedColor(Value: TColor);
begin
  FThumb.ColorFocused := Value;
end;

procedure TFlatScrollbarTrack.DoThumbDownColor(Value: TColor);
begin
  FThumb.ColorDown := Value;
end;

procedure TFlatScrollbarTrack.DoThumbColor(Value: TColor);
begin
 FThumb.Color := Value;
end;

procedure TFlatScrollbarTrack.DoHScroll(var Message: TWMScroll);
var
  iPosition: Integer;
begin
  case Message.ScrollCode of
    SB_BOTTOM: Position := Max;
    SB_LINELEFT: begin
                iPosition := Position;
                Dec(iPosition,SmallChange);
                Position := iPosition;
               end;
    SB_LINERIGHT: begin
                 iPosition := Position;
                 Inc(iPosition,SmallChange);
                 Position := iPosition;
                end;
    SB_PAGELEFT: begin
                iPosition := Position;
                Dec(iPosition,LargeChange);
                Position := iPosition;
               end;
    SB_PAGERIGHT: begin
                 iPosition := Position;
                 Inc(iPosition,LargeChange);
                 Position := iPosition;
                end;
    SB_THUMBPOSITION, SB_THUMBTRACK: Position := Message.Pos;
    SB_TOP: Position := Min;
  end;
  Message.Result := 0;
end;

procedure TFlatScrollbarTrack.DoVScroll(var Message: TWMScroll);
var
  iPosition: Integer;
begin
  case Message.ScrollCode of
    SB_BOTTOM: Position := Max;
    SB_LINEUP: begin
                iPosition := Position;
                Dec(iPosition,SmallChange);
                Position := iPosition;
               end;
    SB_LINEDOWN: begin
                 iPosition := Position;
                 Inc(iPosition,SmallChange);
                 Position := iPosition;
                end;
    SB_PAGEUP: begin
                iPosition := Position;
                Dec(iPosition,LargeChange);
                Position := iPosition;
               end;
    SB_PAGEDOWN: begin
                 iPosition := Position;
                 Inc(iPosition,LargeChange);
                 Position := iPosition;
                end;
    SB_THUMBPOSITION, SB_THUMBTRACK: Position := Message.Pos;
    SB_TOP: Position := Min;
  end;
  Message.Result := 0;
end;

procedure TFlatScrollbarTrack.DoEnableArrows(var Message: TMessage);
begin
  if Message.WParam = ESB_DISABLE_BOTH then
  begin
    TFlatScrollbar(Parent).EnableBtnOne(False);
    TFlatScrollbar(Parent).EnableBtnTwo(False);
  end;
  if Message.WParam = ESB_DISABLE_DOWN then
  begin
    if FKind = sbVertical then TFlatScrollbar(Parent).EnableBtnTwo(False);
  end;
  if Message.WParam = ESB_DISABLE_LTUP then
  begin
    TFlatScrollbar(Parent).EnableBtnOne(False);
  end;
  if Message.WParam = ESB_DISABLE_LEFT then
  begin
    if FKind = sbHorizontal then TFlatScrollbar(Parent).EnableBtnOne(False);
  end;
  if Message.WParam = ESB_DISABLE_RTDN then
  begin
    TFlatScrollbar(Parent).EnableBtnTwo(False);
  end;
  if Message.WParam = ESB_DISABLE_UP then
  begin
    if FKind = sbVertical then TFlatScrollbar(Parent).EnableBtnOne(False);
  end;
  if Message.WParam = ESB_ENABLE_BOTH then
  begin
    TFlatScrollbar(Parent).EnableBtnOne(True);
    TFlatScrollbar(Parent).EnableBtnTwo(True);
  end;
  Message.Result := 1;
end;

procedure TFlatScrollbarTrack.DoGetPos(var Message: TMessage);
begin
  Message.Result := Position;
end;

procedure TFlatScrollbarTrack.DoGetRange(var Message: TMessage);
begin
  Message.WParam := Min;
  Message.LParam := Max;
end;

procedure TFlatScrollbarTrack.DoSetPos(var Message: TMessage);
begin
  Position := Message.WParam;
end;

procedure TFlatScrollbarTrack.DoSetRange(var Message: TMessage);
begin
  Min := Message.WParam;
  Max := Message.LParam;
end;

procedure TFlatScrollbarTrack.DoKeyDown(var Message: TWMKeyDown);
var
  iPosition: Integer;
begin
  iPosition := Position;
  case Message.CharCode of
    VK_PRIOR: Dec(iPosition,LargeChange);
    VK_NEXT: Inc(iPosition,LargeChange);
    VK_UP: if FKind = sbVertical then Dec(iPosition,SmallChange);
    VK_DOWN: if FKind = sbVertical then Inc(iPosition,SmallChange);
    VK_LEFT: if FKind = sbHorizontal then Dec(iPosition,SmallChange);
    VK_RIGHT: if FKind = sbHorizontal then Inc(iPosition,SmallChange);
  end;
  Position := iPosition;
end;

{ TFlatScrollbarButton }

constructor TFlatScrollbarButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TFlatScrollbarButton.Destroy;
begin
  inherited Destroy;
end;

procedure TFlatScrollbarButton.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button,Shift,X,Y);
  FNewDown := True;
  FTimer := TTimer.Create(Self);
  FTimer.Interval := 10;
  FTimer.OnTimer := DoTimer;
  FTimer.Enabled := True;
end;

procedure TFlatScrollbarButton.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift,X,Y);
end;

procedure TFlatScrollbarButton.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseUp(Button,Shift,X,Y);
  FNewDown := False;
  FTimer.Enabled := False;
  FTimer.Free;
end;

procedure TFlatScrollbarButton.DoTimer(Sender: TObject);
begin
  if FNewDown = True then
  begin
    if Assigned(FOnDown) then FOnDown(Self);
    TFlatScrollbar(Parent).DoScroll;
  end;
end;

{ TFlatScrollbar }

constructor TFlatScrollbar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Width := 200;
  Height := 17;

  Color := ecLightKaki;

  FBtnOne := TFlatScrollbarButton.Create(Self);
  FBtnOne.Color := ecLightKaki;
  FBtnOne.ColorFocused := ecLightKaki;
  FBtnOne.ColorDown := ecLightKaki;
  FBtnOne.ColorBorder := ecLightKaki;
  FBtnOne.Glyph.LoadFromResourceName(hInstance,'THUMB_UP_ENABLED');
  FBtnOne.OnDown := BtnOneClick;
  InsertControl(FBtnOne);

  FBtnTwo := TFlatScrollbarButton.Create(Self);
  FBtnTwo.Color := ecLightKaki;
  FBtnTwo.ColorFocused := ecLightKaki;
  FBtnTwo.ColorDown := ecLightKaki;
  FBtnTwo.ColorBorder := ecLightKaki;
  FBtnTwo.Glyph.LoadFromResourceName(hInstance,'THUMB_DOWN_ENABLED');
  FBtnTwo.OnDown := BtnTwoClick;
  InsertControl(FBtnTwo);

  FTrack := TFlatScrollbarTrack.Create(Self);
  FTrack.Color := ecLightKaki;
  FTrack.SetBounds(0,0,Width,Height);
  InsertControl(FTrack);

  Kind := sbVertical;

  Min := 0;
  Max := 100;
  Position := 0;
  SmallChange := 1;
  LargeChange := 1;

  ButtonColor := ecScrollbar;
  ButtonFocusedColor := ecScrollbar;
  ButtonDownColor := ecScrollbar;
  ButtonBorderColor := ecScrollbar;
  ButtonHighlightColor := clWhite;
  ButtonShadowColor := clBlack;

  ThumbColor := ecScrollbarThumb;
  ThumbFocusedColor := ecScrollbarThumb;
  ThumbDownColor := ecScrollbarThumb;
  ThumbBorderColor := ecScrollbarThumb;
  ThumbHighlightColor := ecScrollbarThumb;
  ThumbShadowColor := ecScrollbarThumb;
end;

destructor TFlatScrollbar.Destroy;
begin
  FTrack.Free;
  FBtnOne.Free;
  FBtnTwo.Free;
  inherited Destroy;
end;

procedure TFlatScrollbar.SetSmallChange(Value: Integer);
begin
  if Value <> FSmallChange then
  begin
    FSmallChange := Value;
    FTrack.SmallChange := FSmallChange;
  end;
end;

procedure TFlatScrollbar.SetLargeChange(Value: Integer);
begin
  if Value <> FLargeChange then
  begin
    FLargeChange := Value;
    FTrack.LargeChange := FLargeChange;
  end;
end;

procedure TFlatScrollbar.SetMin(Value: Integer);
begin
  if Value <> FMin then
  begin
    FMin := Value;
    FTrack.Min := FMin;
  end;
end;

procedure TFlatScrollbar.SetMax(Value: Integer);
begin
  if Value <> FMax then
  begin
    FMax := Value;
    FTrack.Max := FMax;
  end;
end;

procedure TFlatScrollbar.SetPosition(Value: Integer);
begin
  FPosition := Value;
  if Position < Min then
  begin
    Position := Min;
  end;
  if Position > Max then
  begin
    Position := Max;
  end;
  FTrack.Position := FPosition;
end;

procedure TFlatScrollbar.SetKind(Value: TScrollBarKind);
var
  i: Integer;
begin
  if FKind <> Value then
  begin
    FKind := Value;
    FTrack.Kind := FKind;
    if FKind = sbVertical then
    begin
      FBtnOne.Glyph.LoadFromResourceName(hInstance,'THUMB_UP_ENABLED');
      FBtnOne.Refresh;
      FBtnTwo.Glyph.LoadFromResourceName(hInstance,'THUMB_DOWN_ENABLED');
      FBtnTwo.Refresh;
    end
    else
    begin
      FBtnOne.Glyph.LoadFromResourceName(hInstance,'THUMB_LEFT_ENABLED');
      FBtnOne.Refresh;
      FBtnTwo.Glyph.LoadFromResourceName(hInstance,'THUMB_RIGHT_ENABLED');
      FBtnTwo.Refresh;
    end;
    if (csDesigning in ComponentState) and not (csLoading in ComponentState) then
    begin
      i := Width;
      Width := Height;
      Height := i;
    end;
  end;
end;

procedure TFlatScrollbar.SetButtonHighlightColor(Value: TColor);
begin
  if Value <> FButtonHighlightColor then
  begin
    FButtonHighlightColor := Value;
    //FBtnOne.ColorHighlight := ButtonHighlightColor;
    //FBtnTwo.ColorHighlight := ButtonHighlightColor;
  end;
end;

procedure TFlatScrollbar.SetButtonShadowColor(Value: TColor);
begin
  if Value <> FButtonShadowColor then
  begin
    FButtonShadowColor := Value;
    FBtnOne.ColorShadow := ButtonShadowColor;
    FBtnTwo.ColorShadow := ButtonShadowColor;
  end;
end;

procedure TFlatScrollbar.SetButtonBorderColor(Value: TColor);
begin
  if Value <> FButtonBorderColor then
  begin
    FButtonBorderColor := Value;
    FBtnOne.ColorBorder := ButtonBorderColor;
    FBtnTwo.ColorBorder := ButtonBorderColor;
  end;
end;

procedure TFlatScrollbar.SetButtonFocusedColor(Value: TColor);
begin
  if Value <> FButtonFocusedColor then
  begin
    FButtonFocusedColor := Value;
    FBtnOne.ColorFocused := ButtonFocusedColor;
    FBtnTwo.ColorFocused := ButtonFocusedColor;
  end;
end;

procedure TFlatScrollbar.SetButtonDownColor(Value: TColor);
begin
  if Value <> FButtonDownColor then
  begin
    FButtonDownColor := Value;
    FBtnOne.ColorDown := ButtonDownColor;
    FBtnTwo.ColorDown := ButtonDownColor;
  end;
end;

procedure TFlatScrollbar.SetButtonColor(Value: TColor);
begin
  if Value <> FButtonColor then
  begin
    FButtonColor := Value;
    FBtnOne.Color := ButtonColor;
    FBtnTwo.Color := ButtonColor;
  end;
end;

procedure TFlatScrollbar.SetThumbHighlightColor(Value: TColor);
begin
  if Value <> FThumbHighlightColor then
  begin
    FThumbHighlightColor := Value;
    FTrack.DoThumbHighlightColor(Value);
  end;
end;

procedure TFlatScrollbar.SetThumbShadowColor(Value: TColor);
begin
  if Value <> FThumbShadowColor then
  begin
    FThumbShadowColor := Value;
    FTrack.DoThumbShadowColor(Value);
  end;
end;

procedure TFlatScrollbar.SetThumbBorderColor(Value: TColor);
begin
  if Value <> FThumbBorderColor then
  begin
    FThumbBorderColor := Value;
    FTrack.DoThumbBorderColor(Value);
  end;
end;

procedure TFlatScrollbar.SetThumbFocusedColor(Value: TColor);
begin
  if Value <> FThumbFocusedColor then
  begin
    FThumbFocusedColor := Value;
    FTrack.DoThumbFocusedColor(Value);
  end;
end;

procedure TFlatScrollbar.SetThumbDownColor(Value: TColor);
begin
  if Value <> FThumbDownColor then
  begin
    FThumbDownColor := Value;
    FTrack.DoThumbDownColor(Value);
  end;
end;

procedure TFlatScrollbar.SetThumbColor(Value: TColor);
begin
  if Value <> FThumbColor then
  begin
    FThumbColor := Value;
    FTrack.DoThumbColor(Value);
  end;
end;

procedure TFlatScrollbar.BtnOneClick(Sender: TObject);
var
  iPosition: Integer;
begin
  iPosition := Position;
  Dec(iPosition,SmallChange);
  Position := iPosition;
end;

procedure TFlatScrollbar.BtnTwoClick(Sender: TObject);
var
  iPosition: Integer;
begin
  iPosition := Position;
  Inc(iPosition,SmallChange);
  Position := iPosition;
end;

procedure TFlatScrollbar.EnableBtnOne(Value: Boolean);
begin
  if Value = True then
  begin
    FBtnOne.Enabled := True;
    case FKind of
      sbVertical: FBtnOne.Glyph.LoadFromResourceName(hInstance,'THUMB_UP_ENABLED');
      sbHorizontal: FBtnOne.Glyph.LoadFromResourceName(hInstance,'THUMB_LEFT_ENABLED');
    end;
  end
  else
  begin
    case FKind of
      sbVertical: FBtnOne.Glyph.LoadFromResourceName(hInstance,'THUMB_UP_DISABLED');
      sbHorizontal: FBtnOne.Glyph.LoadFromResourceName(hInstance,'THUMB_LEFT_DISABLED');
    end;
    FBtnOne.Enabled := False;
  end;
end;

procedure TFlatScrollbar.EnableBtnTwo(Value: Boolean);
begin
  if Value = True then
  begin
    FBtnTwo.Enabled := True;
    case FKind of
      sbVertical: FBtnTwo.Glyph.LoadFromResourceName(hInstance,'THUMB_DOWN_ENABLED');
      sbHorizontal: FBtnTwo.Glyph.LoadFromResourceName(hInstance,'THUMB_RIGHT_ENABLED');
    end;
  end
  else
  begin
    case FKind of
      sbVertical: FBtnTwo.Glyph.LoadFromResourceName(hInstance,'THUMB_DOWN_DISABLED');
      sbHorizontal: FBtnTwo.Glyph.LoadFromResourceName(hInstance,'THUMB_RIGHT_DISABLED');
    end;
    FBtnTwo.Enabled := False;
  end;
end;

procedure TFlatScrollbar.WMSize(var Message: TWMSize);
begin
  if FKind = sbVertical then
  begin
    SetBounds(Left, Top, Width, Height);
    FBtnOne.SetBounds(0,0,Width,17);
    FBtnTwo.SetBounds(0,Height - 17,Width,17);
    FTrack.SetBounds(0,17,Width,Height - 34);
  end
  else
  begin
    SetBounds(Left, Top, Width, Height);
    FBtnOne.SetBounds(0,0,17,Height);
    FBtnTwo.SetBounds(Width - 17,0,17,Height);
    FTrack.SetBounds(17,0,Width - 34,Height);
  end;
  Position := FPosition;
end;

procedure TFlatScrollbar.DoScroll;
begin
  if Assigned(FOnScroll) then FOnScroll(Self,Position);
end;

{ These scrollbar messages are just passed onto the TFlatScrollbarTrack for handling }

procedure TFlatScrollbar.CNHScroll(var Message: TWMScroll);
begin
  FTrack.DoHScroll(Message);
end;

procedure TFlatScrollbar.CNVScroll(var Message: TWMScroll);
begin
  FTrack.DoVScroll(Message);
end;

procedure TFlatScrollbar.SBMEnableArrows(var Message: TMessage);
begin
  FTrack.DoEnableArrows(Message);
end;

procedure TFlatScrollbar.SBMGetPos(var Message: TMessage);
begin
  FTrack.DoGetPos(Message);
end;

procedure TFlatScrollbar.SBMGetRange(var Message: TMessage);
begin
  FTrack.DoGetRange(Message);
end;

procedure TFlatScrollbar.SBMSetPos(var Message: TMessage);
begin
  FTrack.DoSetPos(Message);
end;

procedure TFlatScrollbar.SBMSetRange(var Message: TMessage);
begin
  FTrack.DoSetRange(Message);
end;

{ This message handler handles keyboard events }

procedure TFlatScrollbar.WMKeyDown(var Message: TWMKeyDown);
begin
  FTrack.DoKeyDown(Message); { Problems? }
end;

{ TFlatGauge }

constructor TFlatGauge.Create(AOwner: TComponent);
begin
  inherited Create (AOwner);
  ControlStyle := ControlStyle + [csFramed, csOpaque];
  SetBounds(0,0,145,25);
  FMinValue       := 0;
  FMaxValue       := 100;
  FProgress       := 25;
  FShowText       := True;
  FBarColor       := $00996633;
  FBorderColor    := DefaultBorderColor;
  fStyleFace      := DefaultStyleFace;
  fStyleBars      := DefaultStyleHorizontal;

  fColorStart     := DefaultColorStart;
  fColorStop      := DefaultColorStop;
  ParentColor     := true;
  fTextAfter      := '';
  fTextFront      := '';
end;

procedure TFlatGauge.Paint;
var
  barRect, solvedRect: TRect;
  PercentText: String;
  PerInt,iDrawLen:Integer;
  memBitmap: TBitmap;
begin
  barRect   := ClientRect;
  memBitmap := TBitmap.Create;
  try;
   memBitmap.Width := ClientRect.Right;
   memBitmap.Height:= ClientRect.Bottom;
   // Clear Background
   if not FTransparent then begin
    memBitmap.Canvas.Brush.Color := Color;
    memBitmap.Canvas.FillRect(barRect);
   end;

   // Draw Border
   DrawButtonBorder(memBitmap.Canvas, ClientRect, FBorderColor, 1);

   // Calculate the Rect
   InflateRect(barRect, -3, -3);

   iDrawLen := Trunc((barRect.right - barRect.left) / (FMaxValue - FMinValue) * FProgress);
   {$IFDEF DFS_COMPILER_4_UP}
   if BidiMode = bdRightToLeft then
      solvedRect := Rect(barRect.right - iDrawLen, barRect.top, barRect.right, barRect.bottom)
   else
      solvedRect := Rect(barRect.left, barRect.top, barRect.left + iDrawLen, barRect.bottom);
   {$ELSE}
      solvedRect := Rect(barRect.left, barRect.top, barRect.left + iDrawLen, barRect.bottom);
   {$ENDIF}

   // Fill the Rect
   if fStyleFace = fsDefault then begin
      memBitmap.Canvas.Brush.Color := FBarColor;
      memBitmap.Canvas.FillRect(solvedRect);
   end else begin
      DrawBackdrop(memBitmap.Canvas,fColorStart,fColorStop,solvedRect,fStyleBars);
   end;
   // Draw Text
   if FShowText then begin
    PerInt      := Trunc(((FProgress-FMinValue)/(FMaxValue-FMinValue)) * 100);
    PercentText := format('%s%3d%%%s',[fTextFront,PerInt,fTextAfter]);
    memBitmap.Canvas.Font.Assign(Self.Font);
    memBitmap.Canvas.Brush.Style := bsClear;
    DrawText(memBitmap.Canvas.Handle, PChar(PercentText), Length(PercentText), barRect, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
    // bar is under caption
    IntersectClipRect(memBitmap.canvas.handle, solvedrect.left, solvedrect.top, solvedrect.right, solvedrect.bottom);
    memBitmap.Canvas.Font.Color := color;
    DrawText(memBitmap.Canvas.Handle, PChar(PercentText), Length(PercentText), barRect, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
   end;
   canvas.Lock;
   Canvas.CopyMode := cmSrcCopy;
   canvas.CopyRect(ClientRect, memBitmap.canvas, ClientRect);
   canvas.Unlock;
  finally
   memBitmap.Free;
  end;
end;

procedure TFlatGauge.SetShowText(Value: Boolean);
begin
  if FShowText <> Value then begin
    FShowText := Value;
    Repaint;
  end;
end;

procedure TFlatGauge.SetMinValue(Value: Longint);
begin
  if Value <> FMinValue then begin
    if Value > FMaxValue then
      FMinValue := FMaxValue
    else
      FMinValue := Value;
    if FProgress < Value then FProgress := Value;
      Repaint;
  end;
end;

procedure TFlatGauge.SetMaxValue(Value: Longint);
begin
  if Value <> FMaxValue then begin
    if Value < FMinValue then
      FMaxValue := FMinValue
    else
      FMaxValue := Value;
    if FProgress > Value then FProgress := Value;
      Repaint;
  end;
end;

procedure TFlatGauge.SetProgress(Value: Longint);
begin
  if Value < FMinValue then
     Value := FMinValue
  else
    if Value > FMaxValue then
       Value := FMaxValue;
  if FProgress <> Value then begin
    FProgress := Value;
    Repaint;
  end;
end;

procedure TFlatGauge.SetColors (Index: Integer; Value: TColor);
begin
  case Index of
    0: FBorderColor := Value;
    1: FBarColor    := Value;
    2: fColorStart  := Value;
    3: fColorStop   := Value;
  end;
  Invalidate;
end;

procedure TFlatGauge.CalcAdvColors;
begin
  if FUseAdvColors then begin
     FBorderColor := CalcAdvancedColor(Color, FBorderColor, FAdvColorBorder, darken);
  end;
end;

procedure TFlatGauge.SetAdvColors (Index: Integer; Value: TAdvColors);
begin
  case Index of
    0: FAdvColorBorder := Value;
  end;
  CalcAdvColors;
  Invalidate;
end;

procedure TFlatGauge.SetUseAdvColors (Value: Boolean);
begin
  if Value <> FUseAdvColors then begin
    FUseAdvColors := Value;
    ParentColor := Value;
    CalcAdvColors;
    Invalidate;
  end;
end;

procedure TFlatGauge.CMSysColorChange (var Message: TMessage);
begin
  if FUseAdvColors then begin
    ParentColor := True;
    CalcAdvColors;
  end;
  Invalidate;
end;

procedure TFlatGauge.CMParentColorChanged (var Message: TWMNoParams);
begin
  inherited;
  if FUseAdvColors then begin
    ParentColor := True;
    CalcAdvColors;
  end;
  Invalidate;
end;

procedure TFlatGauge.SetTransparent(const Value: Boolean);
begin
  FTransparent := Value;
  Invalidate;
end;

{$IFDEF DFS_COMPILER_4_UP}
procedure TFlatGauge.SetBiDiMode(Value: TBiDiMode);
begin
  inherited;
  Invalidate;
end;
{$ENDIF}

procedure TFlatGauge.SetTextAfter(const Value: TCaption);
begin
   if fTextAfter <> Value then begin
      fTextAfter := Value;
      Invalidate;
   end;
end;

procedure TFlatGauge.SetTextFront(const Value: TCaption);
begin
   if fTextFront <> Value then begin
      fTextFront := Value;
      Invalidate;
   end;
end;

procedure TFlatGauge.SetStyleOrien(const Value: TStyleOrien);
begin
  if fStyleBars <> Value then begin
     fStyleBars := Value;
     Invalidate;
  end;
end;

procedure TFlatGauge.SetStyleFace(const Value: TStyleFace);
begin
  if fStyleFace <> Value then begin
     fStyleFace := Value;
     Invalidate;
  end;
end;

end.
