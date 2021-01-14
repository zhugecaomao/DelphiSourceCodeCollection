unit FlatBtns;

interface

{$I FlatStyle.inc}

uses Windows, Messages, Classes, SysUtils, Controls, Forms, Graphics,
     ExtCtrls, FlatUtils;

const
  InitRepeatPause = 400; // pause before repeat timer (ms)
  RepeatPause     = 100; // pause before hint window displays (ms)

type
  { TDefineSpeed }
  TDefineSpeed = class(TVersionGraphic)
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
    FTransparent: TTransparentMode;
    TextBounds: TRect;
    GlyphPos: TPoint;
    FNumGlyphs: TNumGlyphs;
    fColorDown: TColor;
    FColorBorder: TColor;
    FColorShadow: TColor;
    fColorFocused: TColor;
    FGroupIndex: Integer;
    FGlyph: TBitmap;
    FDown: Boolean;
    FDragging: Boolean;
    FAllowAllUp: Boolean;
    FLayout: TButtonLayout;
    FSpacing: Integer;
    FMargin: Integer;
    FMouseIn: Boolean;
    FModalResult: TModalResult;
    fColorFlat: TColor;
    procedure SetColors(Index: Integer; Value: TColor);
    procedure UpdateExclusive;
    procedure SetGlyph(Value: TBitmap);
    procedure SetNumGlyphs(Value: TNumGlyphs);
    procedure SetDown(Value: Boolean);
    procedure SetAllowAllUp(Value: Boolean);
    procedure SetGroupIndex(Value: Integer);
    procedure SetLayout(Value: TButtonLayout);
    procedure SetSpacing(Value: Integer);
    procedure SetMargin(Value: Integer);
    procedure UpdateTracking;
    procedure SetTransparent (const Value: TTransparentMode);
  protected
    FState: TButtonState;
    function  GetPalette: HPALETTE; override;
    procedure Loaded; override;
    procedure WMLButtonDblClk(var Message: TWMLButtonDown); message WM_LBUTTONDBLCLK;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMButtonPressed(var Message: TMessage); message CM_BUTTONPRESSED;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMParentColorChanged(var Message: TWMNoParams); message CM_PARENTCOLORCHANGED;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove (Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
    property Transparent: TTransparentMode read FTransparent write SetTransparent default tmNone;
    property AllowAllUp: Boolean read FAllowAllUp write SetAllowAllUp default False;
    property Color default DefaultFlatColor;
    property ColorFocused: TColor index 0 read fColorFocused write SetColors default DefaultFocusedColor;
    property ColorDown: TColor index 1 read fColorDown write SetColors default DefaultDownColor;
    property ColorBorder: TColor index 2 read FColorBorder write SetColors default DefaultBorderColor;
    property ColorShadow: TColor index 3 read FColorShadow write SetColors default DefaultShadowColor;
    property ColorFlat: TColor index 4 read fColorFlat write SetColors default DefaultFlatColor;
    property GroupIndex: Integer read FGroupIndex write SetGroupIndex default 0;
    property Down: Boolean read FDown write SetDown default False;
    property Glyph: TBitmap read FGlyph write SetGlyph;
    property Layout: TButtonLayout read FLayout write SetLayout default blGlyphTop;
    property Margin: Integer read FMargin write SetMargin default -1;
    property NumGlyphs: TNumGlyphs read FNumGlyphs write SetNumGlyphs default 1;
    property ModalResult: TModalResult read FModalResult write FModalResult default 0;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    property Spacing: Integer read FSpacing write SetSpacing default 4;
   {$IFDEF DFS_DELPHI_4_UP}
    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); override;
   {$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Click; override;
    procedure MouseEnter;
    procedure MouseLeave;
  end;

  { TTimeBtnState }
  TTimeBtnState = set of (tbFocusRect, tbAllowTimer);
  { TDefineTimer }
  TDefineTimer = class(TDefineSpeed)
  private
    FRepeatTimer: TTimer;
    FTimeBtnState: TTimeBtnState;
    procedure TimerExpired( Sender: TObject);
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    property  Cursor default crHandPoint;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property TimeBtnState: TTimeBtnState read FTimeBtnState write FTimeBtnState;
  end;

  { TDefineSpin }
  TDefineSpin = class(TWinControl)
  private
    FUpButton: TDefineTimer;
    FDownButton: TDefineTimer;
    FFocusedButton: TDefineTimer;
    FFocusControl: TWinControl;
    FOnUpClick: TNotifyEvent;
    FOnDownClick: TNotifyEvent;
    function CreateButton: TDefineTimer;
    function GetUpGlyph: TBitmap;
    function GetDownGlyph: TBitmap;
    procedure SetUpGlyph(Value: TBitmap);
    procedure SetDownGlyph(Value: TBitmap);
    function GetUpNumGlyphs: TNumGlyphs;
    function GetDownNumGlyphs: TNumGlyphs;
    procedure SetUpNumGlyphs(Value: TNumGlyphs);
    procedure SetDownNumGlyphs(Value: TNumGlyphs);
    procedure BtnClick(Sender: TObject);
    procedure BtnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SetFocusBtn (Btn: TDefineTimer);
    procedure AdjustSize(var W, H: Integer); reintroduce;// {$IFDEF DFS_COMPILER_4_UP} reintroduce; {$ENDIF}
    procedure WMSize(var Message: TWMSize);  message WM_SIZE;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
  protected
    procedure Loaded; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Notification (AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure SetBounds (ALeft, ATop, AWidth, AHeight: Integer); override;
  published
    property DownGlyph: TBitmap read GetDownGlyph write SetDownGlyph;
    property DownNumGlyphs: TNumGlyphs read GetDownNumGlyphs write SetDownNumGlyphs default 1;
    property FocusControl: TWinControl read FFocusControl write FFocusControl;
    property UpGlyph: TBitmap read GetUpGlyph write SetUpGlyph;
    property UpNumGlyphs: TNumGlyphs read GetUpNumGlyphs write SetUpNumGlyphs default 1;
    property Enabled;
    property Visible;
    property OnDownClick: TNotifyEvent read FOnDownClick write FOnDownClick;
    property OnUpClick: TNotifyEvent read FOnUpClick write FOnUpClick;
  end;

  { TDefineButton }
  TDefineButton = class(TVersionControl)
  private
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
    FTransparent: TTransparentMode;
    FModalResult: TModalResult;
    TextBounds: TRect;
    GlyphPos: TPoint;
    FNumGlyphs: TNumGlyphs;
    fColorDown: TColor;
    FColorBorder: TColor;
    FColorShadow: TColor;
    fColorFocused: TColor;
    FGroupIndex: Integer;
    FGlyph: TBitmap;
    FDown: Boolean;
    FDragging: Boolean;
    FAllowAllUp: Boolean;
    FLayout: TButtonLayout;
    FSpacing: Integer;
    FMargin: Integer;
    FMouseIn: Boolean;
    FDefault: Boolean;
    fHasFocusFrame: boolean;
    fColorFlat: TColor;
    procedure SetColors(Index: Integer; Value: TColor);
    procedure UpdateExclusive;
    procedure SetGlyph(Value: TBitmap);
    procedure SetNumGlyphs(Value: TNumGlyphs);
    procedure SetDown(Value: Boolean);
    procedure SetAllowAllUp(Value: Boolean);
    procedure SetGroupIndex(Value: Integer);
    procedure SetLayout(Value: TButtonLayout);
    procedure SetSpacing(Value: Integer);
    procedure SetMargin(Value: Integer);
    procedure UpdateTracking;
    procedure SetDefault(const Value: Boolean);
    procedure SetTransparent (const Value: TTransparentMode);
  protected
    FState: TButtonState;
    function  GetPalette: HPALETTE; override;
    procedure Loaded; override;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
    procedure WMKeyUp(var Message: TWMKeyUp); message WM_KEYUP;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMMove(var Message: TWMMove); message WM_MOVE;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMLButtonDblClk(var Message: TWMLButtonDown); message WM_LBUTTONDBLCLK;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMButtonPressed(var Message: TMessage); message CM_BUTTONPRESSED;
    procedure CMDialogKey(var Message: TCMDialogKey); message CM_DIALOGKEY;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMParentColorChanged(var Message: TWMNoParams); message CM_PARENTCOLORCHANGED;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove (Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
    procedure SetName(const Value: TComponentName); override;
    property Transparent: TTransparentMode read FTransparent write SetTransparent default tmNone;
    property HasFocusFrame:boolean read fHasFocusFrame write fHasFocusFrame default true;
    property Default: Boolean read FDefault write SetDefault default False;
    property AllowAllUp: Boolean read FAllowAllUp write SetAllowAllUp default False;
    property ColorFocused: TColor index 0 read fColorFocused write SetColors default DefaultFocusedColor;
    property ColorDown: TColor index 1 read fColorDown write SetColors default DefaultDownColor;
    property ColorBorder: TColor index 2 read FColorBorder write SetColors default DefaultBorderColor;
    property ColorShadow: TColor index 3 read FColorShadow write SetColors default DefaultShadowColor;
    property ColorFlat: TColor index 4 read fColorFlat write SetColors default DefaultFlatColor;
    property GroupIndex: Integer read FGroupIndex write SetGroupIndex default 0;
    property Down: Boolean read FDown write SetDown default False;
    property Glyph: TBitmap read FGlyph write SetGlyph;
    property Layout: TButtonLayout read FLayout write SetLayout default blGlyphTop;
    property Margin: Integer read FMargin write SetMargin default -1;
    property NumGlyphs: TNumGlyphs read FNumGlyphs write SetNumGlyphs default 1;
    property TabStop default true;
    property Spacing: Integer read FSpacing write SetSpacing default 4;
    property ModalResult: TModalResult read FModalResult write FModalResult default 0;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Click; override;
    procedure MouseEnter;
    procedure MouseLeave;
  end;
  { TFlatSpeedButton }
  TFlatSpeedButton = class(TDefineSpeed)
  published
    property Transparent;
    property Version;
    property AllowAllUp;
    property ColorFocused;
    property ColorDown;
    property ColorBorder;
    property ColorShadow;
    property ColorFlat;
    property GroupIndex;
    property Down;
    property Caption;
    property Enabled;
    property Font;
    property Glyph;
    property Layout;
    property Margin;
    property NumGlyphs;
    property ModalResult;
    property ParentFont;
    property ParentColor;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Spacing;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseEnter;
    property OnMouseLeave;
   {$IFDEF DFS_DELPHI_4_UP}
    property Action;
    property Anchors;
    property BiDiMode;
    property Constraints;
    property DragKind;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
   {$ENDIF}
  end;
  { TFlatButton }
  TFlatButton = class(TDefineButton)
  published
    property Transparent;
    property HasFocusFrame;
    property Default;
    property AllowAllUp;
    property ColorFocused;
    property ColorDown;
    property ColorBorder;
    property ColorShadow;
    property ColorFlat;
    property GroupIndex;
    property Action;
    property Down;
    property Caption;
    property Enabled;
    property Font;
    property Glyph;
    property Layout;
    property Margin;
    property NumGlyphs;
    property ParentFont;
    property ParentColor;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabStop;
    property TabOrder;
    property Spacing;
    property ModalResult;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseEnter;
    property OnMouseLeave;
   {$IFDEF DFS_DELPHI_4_UP}
    property Anchors;
    property BiDiMode;
    property Constraints;
    property DragKind;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
   {$ENDIF}
  end;

implementation

{$R FlatArrow.res}

{ TDefineSpeed }
constructor TDefineSpeed.Create(AOwner: TComponent);
begin
  FGlyph        := TBitmap.Create;
  inherited Create(AOwner);
  ControlStyle  := [csCaptureMouse, csDoubleClicks];
  ParentFont    := True;
  ParentColor   := True;
  fColorFocused := DefaultFocusedColor;
  fColorDown    := DefaultDownColor;
  FColorBorder  := DefaultBorderColor;
  FColorShadow  := DefaultShadowColor;
  FState        := bsUp;
  fColorFlat    := DefaultFlatColor;
  FSpacing      := 4;
  FMargin       := -1;
  FNumGlyphs    := 1;
  FLayout       := blGlyphTop;
  FModalResult  := mrNone;
  FTransparent  := tmNone;
  SetBounds(0, 0, 25, 25);
end;

destructor TDefineSpeed.Destroy;
begin
  FGlyph.Free;
  inherited Destroy;
end;

procedure TDefineSpeed.Paint;
var
  FTransColor: TColor;
  FImageList: TImageList;
  sourceRect, destRect: TRect;
  tempGlyph: TBitmap;
  Offset: TPoint;
begin
  // get the transparent color
  FTransColor := FGlyph.Canvas.Pixels[0, FGlyph.Height - 1];
  Canvas.Font := Self.Font;

  if FState in [bsDown, bsExclusive] then
     Offset := Point(1, 1)
  else
     Offset := Point(0, 0);

  CalcButtonLayout(Canvas, ClientRect, Offset, FLayout, FSpacing,
                   FMargin, FGlyph, FNumGlyphs, Caption, TextBounds, GlyphPos);

  if not Enabled then
  begin
    FState := bsDisabled;
    FDragging := False;
  end
  else
    if FState = bsDisabled then
      if FDown and (GroupIndex <> 0) then
        FState := bsExclusive
      else
        FState := bsUp;

  // DrawBackground
  case FTransparent of
    tmAlways:;
    tmNone:
      begin
        case FState of
          bsUp:
            if FMouseIn then
              Canvas.Brush.Color := fColorFocused
            else
              Canvas.Brush.Color := fColorFlat;
          bsDown:
            Canvas.Brush.Color := fColorDown;
          bsExclusive:
            if FMouseIn then
              Canvas.Brush.Color := fColorFocused
            else
              Canvas.Brush.Color := fColorDown;
          bsDisabled:
            Canvas.Brush.Color := fColorFlat;
        end;
        Canvas.FillRect(ClientRect);
      end;
    tmNotFocused:
      if FMouseIn then
      begin
        case FState of
          bsUp:
            if FMouseIn then
              Canvas.Brush.Color := fColorFocused
            else
              Canvas.Brush.Color := Self.Color;
          bsDown:
            Canvas.Brush.Color := fColorDown;
          bsExclusive:
            if FMouseIn then
              Canvas.Brush.Color := fColorFocused
            else
              Canvas.Brush.Color := fColorDown;
          bsDisabled:
            Canvas.Brush.Color := Self.Color;
        end;
        Canvas.FillRect(ClientRect);
      end;
  end;

  // DrawBorder
  case FState of
    bsUp:            
      if FMouseIn then
         DrawButtonBorder(canvas, ClientRect, FColorShadow, 1)
      else
         DrawButtonBorder(canvas, ClientRect, FColorBorder, 1);
    bsDown, bsExclusive:
         DrawButtonBorder(canvas, ClientRect, FColorShadow, 1);
    bsDisabled:
         DrawButtonBorder(canvas, ClientRect, FColorBorder, 1);
  end;

  // DrawGlyph
  if not FGlyph.Empty then
  begin
    tempGlyph := TBitmap.Create;
    case FNumGlyphs of
      1: case FState of
           bsUp:        sourceRect := Rect(0, 0, FGlyph.Width, FGlyph.Height);
           bsDisabled:  sourceRect := Rect(0, 0, FGlyph.Width, FGlyph.Height);
           bsDown:      sourceRect := Rect(0, 0, FGlyph.Width, FGlyph.Height);
           bsExclusive: sourceRect := Rect(0, 0, FGlyph.Width, FGlyph.Height);
         end;
      2: case FState of
           bsUp:        sourceRect := Rect(0, 0, FGlyph.Width div FNumGlyphs, FGlyph.Height);
           bsDisabled:  sourceRect := Rect(FGlyph.Width div FNumGlyphs, 0, FGlyph.Width, FGlyph.Height);
           bsDown:      sourceRect := Rect(0, 0, FGlyph.Width div FNumGlyphs, FGlyph.Height);
           bsExclusive: sourceRect := Rect(0, 0, FGlyph.Width div FNumGlyphs, FGlyph.Height);
         end;
      3: case FState of
           bsUp:        SourceRect := Rect(0, 0, FGlyph.Width div FNumGlyphs, FGlyph.Height);
           bsDisabled:  SourceRect := Rect(FGlyph.width div FNumGlyphs, 0, (FGlyph.Width div FNumGlyphs) * 2, FGlyph.Height);
           bsDown:      SourceRect := Rect((FGlyph.Width div FNumGlyphs) * 2, 0, FGlyph.Width, FGlyph.Height);
           bsExclusive: SourceRect := Rect((FGlyph.Width div FNumGlyphs) * 2, 0, FGlyph.Width, FGlyph.Height);
         end;
      4: case FState of
           bsUp:        SourceRect := Rect(0, 0, FGlyph.Width div FNumGlyphs, FGlyph.Height);
           bsDisabled:  SourceRect := Rect(FGlyph.width div FNumGlyphs, 0, (FGlyph.Width div FNumGlyphs) * 2, FGlyph.Height);
           bsDown:      SourceRect := Rect((FGlyph.Width div FNumGlyphs) * 2, 0, (FGlyph.Width div FNumGlyphs) * 3, FGlyph.Height);
           bsExclusive: SourceRect := Rect((FGlyph.width div FNumGlyphs) * 3, 0, FGlyph.Width, FGlyph.Height);
         end;
    end;

    destRect := Rect(0, 0, FGlyph.Width div FNumGlyphs, FGlyph.Height);
    tempGlyph.Width := FGlyph.Width div FNumGlyphs;
    tempGlyph.Height := FGlyph.Height;
    tempGlyph.canvas.copyRect(destRect, FGlyph.canvas, sourcerect);

    if (FNumGlyphs = 1) and (FState = bsDisabled) then
    begin
      tempGlyph := CreateDisabledBitmap(tempGlyph, clBlack, clBtnFace, clBtnHighlight, clBtnShadow, True);
      FTransColor := tempGlyph.Canvas.Pixels[0, tempGlyph.Height - 1];
    end;

    FImageList := TImageList.CreateSize(FGlyph.Width div FNumGlyphs, FGlyph.Height);
    try
      FImageList.AddMasked(tempGlyph, FTransColor);
      FImageList.Draw(canvas, glyphpos.x, glyphpos.y, 0);
    finally
      FImageList.Free;
    end;
    tempGlyph.free;
  end;

  // DrawText
  Canvas.Brush.Style := bsClear;
  if FState = bsDisabled then
  begin
    OffsetRect(TextBounds, 1, 1);
    Canvas.Font.Color := clBtnHighlight;
    DrawText(Canvas.Handle, PChar(Caption), Length(Caption), TextBounds, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
    OffsetRect(TextBounds, -1, -1);
    Canvas.Font.Color := clBtnShadow;
    DrawText(Canvas.Handle, PChar(Caption), Length(Caption), TextBounds, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
  end
  else
    DrawText(Canvas.Handle, PChar(Caption), Length(Caption), TextBounds, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
end;

procedure TDefineSpeed.UpdateTracking;
var
  P: TPoint;
begin
  if Enabled then
  begin
    GetCursorPos(P);
    FMouseIn := not (FindDragTarget(P, True) = Self);
    if FMouseIn then
      MouseLeave
    else
      MouseEnter;
  end;
end;

procedure TDefineSpeed.Loaded;
begin
  inherited Loaded;
  Invalidate;
end;

procedure TDefineSpeed.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if(Button = mbLeft) and Enabled then
  begin
    if not FDown then
    begin
      FState := bsDown;
      Invalidate;
    end;
    FDragging := True;
  end;
end;

procedure TDefineSpeed.MouseMove (Shift: TShiftState; X, Y: Integer);
var
  NewState: TButtonState;
begin
  inherited;
  if FDragging then
  begin
    if not FDown then
      NewState := bsUp
    else
      NewState := bsExclusive;
    if (X >= 0) and (X < ClientWidth) and (Y >= 0) and (Y <= ClientHeight) then
      if FDown then
        NewState := bsExclusive
      else
        NewState := bsDown;
    if NewState <> FState then
    begin
      FState := NewState;
      Invalidate;
    end;
  end;
end;

procedure TDefineSpeed.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  DoClick: Boolean;
begin
  inherited MouseUp(Button, Shift, X, Y);
  if FDragging then
  begin
    FDragging := False;
    DoClick := (X >= 0) and (X < ClientWidth) and (Y >= 0) and (Y <= ClientHeight);
    if FGroupIndex = 0 then
    begin
      // Redraw face in-case mouse is captured
      FState := bsUp;
      FMouseIn := False;
      if DoClick and not (FState in [bsExclusive, bsDown]) then
        Invalidate;
    end
    else
      if DoClick then
      begin
        SetDown(not FDown);
        if FDown then Repaint;
      end
      else
      begin
        if FDown then FState := bsExclusive;
        Repaint;
      end;
    if DoClick then Click else MouseLeave;
    UpdateTracking;
  end;
end;

procedure TDefineSpeed.Click;
begin
  if Parent <> nil then
     GetParentForm(self).ModalResult := FModalResult;
  if Assigned(PopupMenu) then
     PopupMenu.PopUp(ClientToScreen(Point(0, Height)).X,
                     ClientToScreen(Point(0, Height)).Y);
  inherited Click;
end;

function TDefineSpeed.GetPalette: HPALETTE;
begin
  Result := FGlyph.Palette;
end;

procedure TDefineSpeed.SetColors(Index: Integer; Value: TColor);
begin
  case Index of
    0: fColorFocused := Value;
    1: fColorDown    := Value;
    2: FColorBorder  := Value;
    3: FColorShadow  := Value;
    4: FColorFlat    := Value;
  end;
  Invalidate;
end;

procedure TDefineSpeed.SetGlyph(Value: TBitmap);
begin
  if value <> FGlyph then
  begin
    FGlyph.Assign(value);
    if not FGlyph.Empty then
    begin
      if FGlyph.Width mod FGlyph.Height = 0 then
      begin
        FNumGlyphs := FGlyph.Width div FGlyph.Height;
        if FNumGlyphs > 4 then FNumGlyphs := 1;
      end;
    end;
    Invalidate;
  end;
end;

procedure TDefineSpeed.SetNumGlyphs(Value: TNumGlyphs);
begin
  if value <> FNumGlyphs then
  begin
    FNumGlyphs := value;
    Invalidate;
  end;
end;

procedure TDefineSpeed.UpdateExclusive;
var
  Msg: TMessage;
begin
  if (FGroupIndex <> 0) and (Parent <> nil) then
  begin
    Msg.Msg := CM_BUTTONPRESSED;
    Msg.WParam := FGroupIndex;
    Msg.LParam := Longint(Self);
    Msg.Result := 0;
    Parent.Broadcast(Msg);
  end;
end;

procedure TDefineSpeed.SetDown(Value: Boolean);
begin
  if FGroupIndex = 0 then Value := False;
  if Value <> FDown then
  begin
    if FDown and (not FAllowAllUp) then Exit;
    FDown := Value;
    if Value then
    begin
      if FState = bsUp then Invalidate;
      FState := bsExclusive
    end
    else
    begin
      FState := bsUp;
      Repaint;
    end;
    if Value then UpdateExclusive;
  end;
end;

procedure TDefineSpeed.SetGroupIndex(Value: Integer);
begin
  if FGroupIndex <> Value then
  begin
    FGroupIndex := Value;
    UpdateExclusive;
  end;
end;

procedure TDefineSpeed.SetLayout(Value: TButtonLayout);
begin
  if FLayout <> Value then
  begin
    FLayout := Value;
    Invalidate;
  end;
end;

procedure TDefineSpeed.SetMargin(Value: Integer);
begin
  if(Value <> FMargin) and(Value >= -1) then
  begin
    FMargin := Value;
    Invalidate;
  end;
end;

procedure TDefineSpeed.SetSpacing(Value: Integer);
begin
  if Value <> FSpacing then
  begin
    FSpacing := Value;
    Invalidate;
  end;
end;

procedure TDefineSpeed.SetAllowAllUp(Value: Boolean);
begin
  if FAllowAllUp <> Value then
  begin
    FAllowAllUp := Value;
    UpdateExclusive;
  end;
end;

procedure TDefineSpeed.WMLButtonDblClk(var Message: TWMLButtonDown);
begin
  inherited;
  if FDown then DblClick;
end;

procedure TDefineSpeed.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  if not Enabled then
  begin
    FMouseIn := False;
    FState := bsDisabled;
    //RemoveMouseTimer;
  end;
  UpdateTracking;
  Invalidate;
end;

procedure TDefineSpeed.CMButtonPressed(var Message: TMessage);
var
  Sender: TDefineSpeed;
begin
  if Message.WParam = FGroupIndex then
  begin
    Sender := TDefineSpeed(Message.LParam);
    if Sender <> Self then
    begin
      if Sender.Down and FDown then
      begin
        FDown := False;
        FState := bsUp;
        Invalidate;
      end;
      FAllowAllUp := Sender.AllowAllUp;
    end;
  end;
end;

procedure TDefineSpeed.CMDialogChar(var Message: TCMDialogChar);
begin
  with Message do
    if IsAccel(CharCode, Caption) and Enabled then
    begin
      Click;
      Result := 1;
    end else
      inherited;
end;

procedure TDefineSpeed.CMFontChanged(var Message: TMessage);
begin
  Invalidate;
end;

procedure TDefineSpeed.CMTextChanged(var Message: TMessage);
begin
  Invalidate;
end;

procedure TDefineSpeed.CMSysColorChange(var Message: TMessage);
begin
  inherited;
  if (Parent <> nil)and(ParentColor) then
      Color := TDefineSpeed(Parent).Color;
  Invalidate;
end;

procedure TDefineSpeed.CMParentColorChanged(var Message: TWMNoParams);
begin
  inherited;
  if (Parent <> nil)and(not ParentColor) then
      Color := TDefineSpeed(Parent).Color;
  Invalidate;
end;

procedure TDefineSpeed.MouseEnter;
begin
  if Enabled and not FMouseIn  then
  begin
    FMouseIn := True;
    Invalidate;
  end;
end;

procedure TDefineSpeed.MouseLeave;
begin
  if Enabled and FMouseIn and not FDragging then
  begin
    FMouseIn := False;
    Invalidate;
  end;
end;

{$IFDEF DFS_DELPHI_4_UP}
procedure TDefineSpeed.ActionChange(Sender: TObject; CheckDefaults: Boolean);

  procedure CopyImage(ImageList: TCustomImageList; Index: Integer);
  begin
    with Glyph do
    begin
      Width := ImageList.Width;
      Height := ImageList.Height;
      Canvas.Brush.Color := clFuchsia;//! for lack of a better color
      Canvas.FillRect(Rect(0,0, Width, Height));
      ImageList.Draw(Canvas, 0, 0, Index);
    end;
  end;

begin
  inherited ActionChange(Sender, CheckDefaults);
  if Sender is TCustomAction then
    with TCustomAction(Sender) do
    begin
      { Copy image from action's imagelist }
      if (Glyph.Empty) and (ActionList <> nil) and (ActionList.Images <> nil) and
        (ImageIndex >= 0) and (ImageIndex < ActionList.Images.Count) then
        CopyImage(ActionList.Images, ImageIndex);
    end;
end;
{$ENDIF}

procedure TDefineSpeed.SetTransparent(const Value: TTransparentMode);
begin
  FTransparent := Value;
  Invalidate;
end;

procedure TDefineSpeed.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if Assigned(FOnMouseEnter) then
     FOnMouseEnter(Self)
  else if not(csDesigning in ComponentState) then
     MouseEnter;
end;

procedure TDefineSpeed.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if Assigned(FOnMouseLeave) then
     FOnMouseLeave(Self)
  else if not(csDesigning in ComponentState) then
     MouseLeave;
end;

{ TDefineButton }

constructor TDefineButton.Create(AOwner: TComponent);
begin
  FGlyph        := TBitmap.Create;
  inherited Create(AOwner);
  ControlStyle  := [csCaptureMouse, csOpaque, csDoubleClicks];
  TabStop       := true;
  ParentFont    := True;
  ParentColor   := True;
  fColorFocused := DefaultFocusedColor;
  fColorDown    := DefaultDownColor;
  FColorBorder  := DefaultBorderColor;
  FColorShadow  := DefaultShadowColor;
  FState        := bsUp;
  fColorFlat    := DefaultFlatColor;
  FSpacing      := 4;
  FMargin       := -1;
  FNumGlyphs    := 1;
  FLayout       := blGlyphTop;
  FModalResult  := mrNone;
  FTransparent  := tmNone;
  fHasFocusFrame:= true;

  SetBounds(0, 0, 80, 25);
end;

destructor TDefineButton.Destroy;
begin
  FGlyph.Free;
  inherited Destroy;
end;

procedure TDefineButton.Paint;
var
  FTransColor: TColor;
  FImageList: TImageList;
  sourceRect, destRect, FocusRect: TRect;
  tempGlyph, memBitmap: TBitmap;
  Offset: TPoint;
begin
  // get the transparent color
  FTransColor  := FGlyph.Canvas.Pixels[0, FGlyph.Height - 1];

  memBitmap := TBitmap.Create; // create memory-bitmap to draw flicker-free
  try
    memBitmap.Height := ClientRect.Bottom;
    memBitmap.Width  := ClientRect.Right;
    memBitmap.Canvas.Font := Self.Font;

    if FState in [bsDown, bsExclusive] then
      Offset := Point(1, 1)
    else
      Offset := Point(0, 0);

    CalcButtonLayout(memBitmap.Canvas, ClientRect, Offset, FLayout, FSpacing,
                     FMargin, FGlyph, FNumGlyphs, Caption, TextBounds, GlyphPos);

    if not Enabled then
    begin
      FState    := bsDisabled;
      FDragging := False;
    end
    else
    begin
      if FState = bsDisabled then
      begin
        if FDown and (GroupIndex <> 0) then
           FState := bsExclusive
        else
           FState := bsUp;
      end;
    end;

    // DrawBackground
    case FTransparent of
      tmAlways:
        DrawParentImage(Self, memBitmap.Canvas);
      tmNone:
        begin
          case FState of
            bsUp:
              if FMouseIn then
                 memBitmap.Canvas.Brush.Color := fColorFocused
              else
                 memBitmap.Canvas.Brush.Color := fColorFlat;
            bsDown:
                 memBitmap.Canvas.Brush.Color := fColorDown;
            bsExclusive:
              if FMouseIn then
                 memBitmap.Canvas.Brush.Color := fColorFocused
              else
                 memBitmap.Canvas.Brush.Color := fColorDown;
            bsDisabled:
                 memBitmap.Canvas.Brush.Color := fColorFlat;
          end;
          memBitmap.Canvas.FillRect(ClientRect);
        end;
      tmNotFocused:
        if FMouseIn then
        begin
          case FState of
            bsUp:
              if FMouseIn then
                memBitmap.Canvas.Brush.Color := fColorFocused
              else
                memBitmap.Canvas.Brush.Color := fColorFlat;
            bsDown:
              memBitmap.Canvas.Brush.Color := fColorDown;
            bsExclusive:
              if FMouseIn then
                memBitmap.Canvas.Brush.Color := fColorFocused
              else
                memBitmap.Canvas.Brush.Color := fColorDown;
            bsDisabled:
              memBitmap.Canvas.Brush.Color := fColorFlat;
          end;
          memBitmap.Canvas.FillRect(ClientRect);
        end
        else
          DrawParentImage(Self, memBitmap.Canvas);
    end;

    // DrawBorder
    case FState of
      bsUp:
        if FMouseIn then
           DrawButtonBorder(memBitmap.canvas, ClientRect, FColorShadow, 1)
        else
          if FDefault then
             DrawButtonBorder(memBitmap.canvas, ClientRect, FColorBorder, 2)
          else
             DrawButtonBorder(memBitmap.canvas, ClientRect, FColorBorder, 1);
      bsDown, bsExclusive:
        DrawButtonBorder(memBitmap.canvas, ClientRect, FColorShadow, 1);
      bsDisabled:
        DrawButtonBorder(memBitmap.canvas, ClientRect, FColorBorder, 1);
    end;  
    if (FMouseIn)and(fHasFocusFrame) then begin
       with ClientRect do
       begin
        FocusRect := Rect(Left+2,Top+2,Right-2,Bottom-2);
       end;
       memBitmap.Canvas.DrawFocusRect(FocusRect);
    end;
    // DrawGlyph
    if not FGlyph.Empty then
    begin
      tempGlyph := TBitmap.Create;
      case FNumGlyphs of
        1: case FState of
             bsUp:        sourceRect := Rect(0, 0, FGlyph.Width, FGlyph.Height);
             bsDisabled:  sourceRect := Rect(0, 0, FGlyph.Width, FGlyph.Height);
             bsDown:      sourceRect := Rect(0, 0, FGlyph.Width, FGlyph.Height);
             bsExclusive: sourceRect := Rect(0, 0, FGlyph.Width, FGlyph.Height);
           end;
        2: case FState of
             bsUp:        sourceRect := Rect(0, 0, FGlyph.Width div FNumGlyphs, FGlyph.Height);
             bsDisabled:  sourceRect := Rect(FGlyph.Width div FNumGlyphs, 0, FGlyph.Width, FGlyph.Height);
             bsDown:      sourceRect := Rect(0, 0, FGlyph.Width div FNumGlyphs, FGlyph.Height);
             bsExclusive: sourceRect := Rect(0, 0, FGlyph.Width div FNumGlyphs, FGlyph.Height);
           end;
        3: case FState of
             bsUp:        SourceRect := Rect(0, 0, FGlyph.Width div FNumGlyphs, FGlyph.Height);
             bsDisabled:  SourceRect := Rect(FGlyph.width div FNumGlyphs, 0, (FGlyph.Width div FNumGlyphs) * 2, FGlyph.Height);
             bsDown:      SourceRect := Rect((FGlyph.Width div FNumGlyphs) * 2, 0, FGlyph.Width, FGlyph.Height);
             bsExclusive: SourceRect := Rect((FGlyph.Width div FNumGlyphs) * 2, 0, FGlyph.Width, FGlyph.Height);
           end;
        4: case FState of
             bsUp:        SourceRect := Rect(0, 0, FGlyph.Width div FNumGlyphs, FGlyph.Height);
             bsDisabled:  SourceRect := Rect(FGlyph.width div FNumGlyphs, 0, (FGlyph.Width div FNumGlyphs) * 2, FGlyph.Height);
             bsDown:      SourceRect := Rect((FGlyph.Width div FNumGlyphs) * 2, 0, (FGlyph.Width div FNumGlyphs) * 3, FGlyph.Height);
             bsExclusive: SourceRect := Rect((FGlyph.width div FNumGlyphs) * 3, 0, FGlyph.Width, FGlyph.Height);
           end;
      end;

      destRect := Rect(0, 0, FGlyph.Width div FNumGlyphs, FGlyph.Height);
      tempGlyph.Width  := FGlyph.Width div FNumGlyphs;
      tempGlyph.Height := FGlyph.Height;
      tempGlyph.canvas.copyRect(destRect, FGlyph.canvas, sourcerect);

      if (FNumGlyphs = 1) and (FState = bsDisabled) then
      begin
        tempGlyph := CreateDisabledBitmap(tempGlyph, clBlack, clBtnFace, clBtnHighlight, clBtnShadow, True);
        FTransColor := tempGlyph.Canvas.Pixels[0, tempGlyph.Height - 1];
      end;

      FImageList := TImageList.CreateSize(FGlyph.Width div FNumGlyphs, FGlyph.Height);
      try
        FImageList.AddMasked(tempGlyph, FTransColor);
        FImageList.Draw(memBitmap.canvas, glyphpos.x, glyphpos.y, 0);
      finally
        FImageList.Free;
      end;
      tempGlyph.free;
    end;

    // DrawText
    memBitmap.Canvas.Brush.Style := bsClear;
    if FState = bsDisabled then
    begin
      OffsetRect(TextBounds, 1, 1);
      memBitmap.Canvas.Font.Color := clBtnHighlight;
      DrawText(memBitmap.Canvas.Handle, PChar(Caption), Length(Caption), TextBounds, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
      OffsetRect(TextBounds, -1, -1);
      memBitmap.Canvas.Font.Color := clBtnShadow;
      DrawText(memBitmap.Canvas.Handle, PChar(Caption), Length(Caption), TextBounds, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
    end
    else
      DrawText(memBitmap.Canvas.Handle, PChar(Caption), Length(Caption), TextBounds, DT_CENTER or DT_VCENTER or DT_SINGLELINE);

    // Copy memBitmap to screen
    canvas.CopyRect(ClientRect, memBitmap.canvas, ClientRect);
  finally
    memBitmap.free; // delete the bitmap
  end;
end;

procedure TDefineButton.UpdateTracking;
var
  P: TPoint;
begin
  if Enabled then
  begin
    GetCursorPos(P);
    FMouseIn := not (FindDragTarget(P, True) = Self);
    if FMouseIn then
       MouseLeave
    else
       MouseEnter;
  end;
end;

procedure TDefineButton.Loaded;
begin
  inherited Loaded;
  Invalidate;
end;

procedure TDefineButton.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if(Button = mbLeft) and Enabled then
  begin
    if not FDown then
    begin
      FState := bsDown;
      Invalidate;
    end;
    FDragging := True;
    SetFocus;
  end;
end;

procedure TDefineButton.MouseMove (Shift: TShiftState; X, Y: Integer);
var
  NewState: TButtonState;
begin
  inherited;
  if FDragging then
  begin
    if not FDown then
      NewState := bsUp
    else
      NewState := bsExclusive;
    if (X >= 0) and (X < ClientWidth) and (Y >= 0) and (Y <= ClientHeight) then
      if FDown then
        NewState := bsExclusive
      else
        NewState := bsDown;
    if NewState <> FState then
    begin
      FState := NewState;
      Invalidate;
    end;
  end;
end;

procedure TDefineButton.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  DoClick: Boolean;
begin
  inherited MouseUp(Button, Shift, X, Y);
  if FDragging then
  begin
    FDragging := False;
    DoClick := (X >= 0) and (X < ClientWidth) and (Y >= 0) and (Y <= ClientHeight);
    if FGroupIndex = 0 then
    begin
      // Redraw face in-case mouse is captured
      FState := bsUp;
      FMouseIn := False;
      if DoClick and not (FState in [bsExclusive, bsDown]) then
        Invalidate;
    end
    else
      if DoClick then
      begin
        SetDown(not FDown);
        if FDown then Repaint;
      end
      else
      begin
        if FDown then FState := bsExclusive;
        Repaint;
      end;
    if DoClick then Click else
      MouseLeave;
    UpdateTracking;
  end;
end;

procedure TDefineButton.Click;
begin
  if Parent <> nil then begin
     GetParentForm(self).ModalResult := FModalResult;
     SetDown(False);
  end;
  if Assigned(PopupMenu) then
     PopupMenu.PopUp(ClientToScreen(Point(0, Height)).X,
                     ClientToScreen(Point(0, Height)).Y);
  inherited Click;
end;   

function TDefineButton.GetPalette: HPALETTE;
begin
  Result := FGlyph.Palette;
end;

procedure TDefineButton.SetColors(Index: Integer; Value: TColor);
begin
  case Index of
    0: fColorFocused := Value;
    1: fColorDown    := Value;
    2: FColorBorder  := Value;
    3: FColorShadow  := Value;
    4: FColorFlat    := Value;
  end;
  Invalidate;
end;

procedure TDefineButton.SetGlyph(Value: TBitmap);
begin
  if value <> FGlyph then
  begin
    FGlyph.Assign(value);
    if not FGlyph.Empty then
    begin
      if FGlyph.Width mod FGlyph.Height = 0 then
      begin
        FNumGlyphs := FGlyph.Width div FGlyph.Height;
        if FNumGlyphs > 4 then FNumGlyphs := 1;
      end;
    end;
    Invalidate;
  end;
end;

procedure TDefineButton.SetNumGlyphs(Value: TNumGlyphs);
begin
  if value <> FNumGlyphs then
  begin
    FNumGlyphs := value;
    Invalidate;
  end;
end;

procedure TDefineButton.UpdateExclusive;
var
  Msg: TMessage;
begin
  if (FGroupIndex <> 0) and (Parent <> nil) then
  begin
    Msg.Msg := CM_BUTTONPRESSED;
    Msg.WParam := FGroupIndex;
    Msg.LParam := Longint(Self);
    Msg.Result := 0;
    Parent.Broadcast(Msg);
  end;
end;

procedure TDefineButton.SetDown(Value: Boolean);
begin
  if FGroupIndex = 0 then Value := False;
  if Value <> FDown then
  begin
    if FDown and (not FAllowAllUp) then Exit;
    FDown := Value;
    if Value then
    begin
      if FState = bsUp then Invalidate;
      FState := bsExclusive
    end
    else
    begin
      FState := bsUp;
      Repaint;
    end;
    if Value then UpdateExclusive;
  end;
end;

procedure TDefineButton.SetGroupIndex(Value: Integer);
begin
  if FGroupIndex <> Value then
  begin
    FGroupIndex := Value;
    UpdateExclusive;
  end;
end;

procedure TDefineButton.SetLayout(Value: TButtonLayout);
begin
  if FLayout <> Value then
  begin
    FLayout := Value;
    Invalidate;
  end;
end;

procedure TDefineButton.SetMargin(Value: Integer);
begin
  if(Value <> FMargin) and(Value >= -1) then
  begin
    FMargin := Value;
    Invalidate;
  end;
end;

procedure TDefineButton.SetSpacing(Value: Integer);
begin
  if Value <> FSpacing then
  begin
    FSpacing := Value;
    Invalidate;
  end;
end;

procedure TDefineButton.SetAllowAllUp(Value: Boolean);
begin
  if FAllowAllUp <> Value then
  begin
    FAllowAllUp := Value;
    UpdateExclusive;
  end;
end;

procedure TDefineButton.WMLButtonDblClk(var Message: TWMLButtonDown);
begin
  inherited;
  if FDown then DblClick;
end;

procedure TDefineButton.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  if not Enabled then begin
    FMouseIn := False;
    FState := bsDisabled;
   // RemoveMouseTimer;
  end;
  UpdateTracking;
  Invalidate;
end;

procedure TDefineButton.CMButtonPressed(var Message: TMessage);
var
  Sender: TDefineButton;
begin
  if Message.WParam = FGroupIndex then
  begin
    Sender := TDefineButton(Message.LParam);
    if Sender <> Self then
    begin
      if Sender.Down and FDown then
      begin
        FDown := False;
        FState := bsUp;
        Invalidate;
      end;
      FAllowAllUp := Sender.AllowAllUp;
    end;
  end;
end;

procedure TDefineButton.CMDialogKey(var Message: TCMDialogKey);
begin
  with Message do
    if ((CharCode = VK_RETURN) and FMouseIn) and
       (KeyDataToShiftState(Message.KeyData) = []) and Enabled then
    begin
      Click;
      Result := 1;
    end else
      inherited;
end;

procedure TDefineButton.CMDialogChar(var Message: TCMDialogChar);
begin
  with Message do
    if IsAccel(CharCode, Caption) and Enabled then begin
      if GroupIndex <> 0 then
         SetDown(true);
      Click;
      Result := 1;
    end;
end;

procedure TDefineButton.CMFontChanged(var Message: TMessage);
begin
  Invalidate;
end;

procedure TDefineButton.CMTextChanged(var Message: TMessage);
begin
  Invalidate;
end;

procedure TDefineButton.CMSysColorChange(var Message: TMessage);
begin
  inherited;
  if (Parent <> nil)and(ParentColor) then
      Color := TDefineButton(Parent).Color;
  Invalidate;
end;

procedure TDefineButton.CMParentColorChanged(var Message: TWMNoParams);
begin
  inherited;
  if (Parent <> nil)and(not ParentColor) then
      Color := TDefineButton(Parent).Color;
  Invalidate;
end;

procedure TDefineButton.MouseEnter;
begin
  if Enabled and not FMouseIn then
  begin
    FMouseIn := True;
    Invalidate;
  end;
end;

procedure TDefineButton.MouseLeave;
begin
  if Enabled and FMouseIn and not FDragging then
  begin
    FMouseIn := False;
    Invalidate;
  end;
end;

procedure TDefineButton.SetDefault(const Value: Boolean);
var
 {$IFDEF DFS_COMPILER_2}
  Form: TForm;
 {$ELSE}
  Form: TCustomForm;
 {$ENDIF}
begin
  FDefault := Value;
  if HandleAllocated then
  begin
    Form := GetParentForm(Self);
    if Form <> nil then
      Form.Perform(CM_FOCUSCHANGED, 0, Longint(Form.ActiveControl));
  end;
  Invalidate;
end;

procedure TDefineButton.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  MouseLeave;
end;

procedure TDefineButton.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  if Enabled then
  begin
     FMouseIn := True;
     Invalidate;
  end;
end;

procedure TDefineButton.WMKeyDown(var Message: TWMKeyDown);
var CharCode:Word;
begin
  CharCode := Message.CharCode;
  if CharCode = VK_SPACE then
  begin
    if GroupIndex = 0 then
       FState := bsDown
    else
       SetDown(true);
    Invalidate;
  end;
end;

procedure TDefineButton.WMKeyUp(var Message: TWMKeyUp);
var CharCode:Word;
begin
  CharCode := Message.CharCode;
  if  CharCode = VK_SPACE then  begin
    if GroupIndex = 0 then
       FState := bsUp
    else
       SetDown(false);
    Click;
    Invalidate;
  end;
end;

procedure TDefineButton.SetTransparent(const Value: TTransparentMode);
begin
  FTransparent := Value;
  Invalidate;
end;

procedure TDefineButton.WMMove(var Message: TWMMove);
begin
  inherited;
  if not (FTransparent = tmNone) then
    Invalidate;
end;

procedure TDefineButton.WMSize(var Message: TWMSize);
begin
  inherited;
  if not (FTransparent = tmNone) then
    Invalidate;
end;

procedure TDefineButton.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if Assigned(FOnMouseEnter) then
     FOnMouseEnter(Self)
  else if not(csDesigning in ComponentState) then
     MouseEnter;
end;

procedure TDefineButton.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if Assigned(FOnMouseLeave) then
     FOnMouseLeave(Self)
  else if not(csDesigning in ComponentState) then
     MouseLeave;
end;

procedure TDefineButton.SetName(const Value: TComponentName);
begin
  inherited SetName(Value);
  if (csDesigning in ComponentState)and((GetTextLen = 0)or
     (CompareText(Caption, Name) = 0)) then
      Caption := Value;
end;

{ TDefineSpin }

constructor TDefineSpin.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csAcceptsControls, csSetCaption] + [csFramed, csOpaque]; 
  FUpButton    := CreateButton;
  FDownButton  := CreateButton;
  UpGlyph      := nil;
  DownGlyph    := nil;
  FFocusedButton := FUpButton;
  SetBounds(0,0,21,10);
end;

function TDefineSpin.CreateButton: TDefineTimer;
begin
  Result := TDefineTimer.Create(Self);
  Result.OnClick := BtnClick;
  Result.OnMouseDown := BtnMouseDown;
  Result.Visible := True;
  Result.Enabled := True;
  Result.TimeBtnState := [tbAllowTimer];
  Result.Parent := Self;
end;

procedure TDefineSpin.Notification (AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FFocusControl) then
    FFocusControl := nil;
end;

procedure TDefineSpin.AdjustSize(var W, H: Integer);
begin
  if (FUpButton = nil) or (csLoading in ComponentState) then Exit;
  FUpButton.SetBounds(0, 0, 15, H);
  FDownButton.SetBounds(16, 0, 15, H);
end;

procedure TDefineSpin.SetBounds (ALeft, ATop, AWidth, AHeight: Integer);
var
  W, H: Integer;
begin
  W := AWidth;
  H := AHeight;
  AdjustSize (W, H);
  inherited SetBounds (ALeft, ATop, W, H);
end;

procedure TDefineSpin.WMSize(var Message: TWMSize);
var
  W, H: Integer;
begin
  inherited;

  // check for minimum size
  W := Width;
  H := Height;
  AdjustSize (W, H);
  if (W <> Width) or (H <> Height) then
    inherited SetBounds(Left, Top, W, H);
  Message.Result := 0;
end;

procedure TDefineSpin.WMSetFocus(var Message: TWMSetFocus);
begin
  FFocusedButton.TimeBtnState := FFocusedButton.TimeBtnState + [tbFocusRect];
  FFocusedButton.Invalidate;
end;

procedure TDefineSpin.WMKillFocus(var Message: TWMKillFocus);
begin
  FFocusedButton.TimeBtnState := FFocusedButton.TimeBtnState - [tbFocusRect];
  FFocusedButton.Invalidate;
end;

procedure TDefineSpin.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_UP:
      begin
        SetFocusBtn(FUpButton);
        FUpButton.Click;
      end;
    VK_DOWN:
      begin
        SetFocusBtn(FDownButton);
        FDownButton.Click;
      end;
    VK_SPACE:
      FFocusedButton.Click;
  end;
end;

procedure TDefineSpin.BtnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    SetFocusBtn (TDefineTimer(Sender));
    if (FFocusControl <> nil) and FFocusControl.TabStop and 
        FFocusControl.CanFocus and (GetFocus <> FFocusControl.Handle) then
      FFocusControl.SetFocus
    else if TabStop and (GetFocus <> Handle) and CanFocus then
      SetFocus;
  end;
end;

procedure TDefineSpin.BtnClick(Sender: TObject);
begin
  if Sender = FUpButton then
    if Assigned(FOnUpClick) then
      FOnUpClick(Self);
  if Sender = FDownButton then
    if Assigned(FOnDownClick) then
      FOnDownClick(Self);
end;

procedure TDefineSpin.SetFocusBtn (Btn: TDefineTimer);
begin
  if TabStop and CanFocus and  (Btn <> FFocusedButton) then
  begin
    FFocusedButton.TimeBtnState := FFocusedButton.TimeBtnState - [tbFocusRect];
    FFocusedButton := Btn;
    if (GetFocus = Handle) then 
    begin
       FFocusedButton.TimeBtnState := FFocusedButton.TimeBtnState + [tbFocusRect];
       Invalidate;
    end;
  end;
end;

procedure TDefineSpin.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  Message.Result := DLGC_WANTARROWS;
end;

procedure TDefineSpin.Loaded;
var
  W, H: Integer;
begin
  inherited Loaded;
  W := Width;
  H := Height;
  AdjustSize (W, H);
  if (W <> Width) or (H <> Height) then
    inherited SetBounds(Left, Top, Width, Height);
end;

function TDefineSpin.GetUpGlyph: TBitmap;
begin
  Result := FUpButton.Glyph;
end;

procedure TDefineSpin.SetUpGlyph(Value: TBitmap);
begin
  if Value <> nil then
    FUpButton.Glyph := Value
  else
  begin
    FUpButton.Glyph.Handle := LoadBitmap(HInstance, 'FlatUp');
    FUpButton.NumGlyphs := 1;
    FUpButton.Margin := 2;
    FUpButton.Invalidate;
    FUpButton.Layout := blGlyphTop;
  end;
end;

function TDefineSpin.GetUpNumGlyphs: TNumGlyphs;
begin
  Result := FUpButton.NumGlyphs;
end;

procedure TDefineSpin.SetUpNumGlyphs(Value: TNumGlyphs);
begin
  FUpButton.NumGlyphs := Value;
end;

function TDefineSpin.GetDownGlyph: TBitmap;
begin
  Result := FDownButton.Glyph;
end;

procedure TDefineSpin.SetDownGlyph(Value: TBitmap);
begin
  if Value <> nil then
    FDownButton.Glyph := Value
  else
  begin
    FDownButton.Glyph.Handle := LoadBitmap(HInstance, 'FlatDown');
    FDownButton.NumGlyphs := 1;
    FDownButton.Margin := 2;
    FDownButton.Invalidate;
    FDownButton.Layout := blGlyphBottom;
  end;
end;

function TDefineSpin.GetDownNumGlyphs: TNumGlyphs;
begin
  Result := FDownButton.NumGlyphs;
end;

procedure TDefineSpin.SetDownNumGlyphs(Value: TNumGlyphs);
begin
  FDownButton.NumGlyphs := Value;
end;

{TDefineTimer}

constructor TDefineTimer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Cursor := crHandPoint;
end;

destructor TDefineTimer.Destroy;
begin
  if FRepeatTimer <> nil then
     FRepeatTimer.Free;
  inherited Destroy;
end;

procedure TDefineTimer.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if tbAllowTimer in FTimeBtnState then
  begin
    if FRepeatTimer = nil then
       FRepeatTimer := TTimer.Create(Self);

    FRepeatTimer.OnTimer  := TimerExpired;
    FRepeatTimer.Interval := InitRepeatPause;
    FRepeatTimer.Enabled  := True;
  end;
end;

procedure TDefineTimer.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  if FRepeatTimer <> nil then
     FRepeatTimer.Enabled  := False;
end;

procedure TDefineTimer.TimerExpired(Sender: TObject);
begin
  FRepeatTimer.Interval := RepeatPause;
  if (FState = bsDown) and MouseCapture then
  begin
    try
      Click;
    except
      FRepeatTimer.Enabled := False;
      raise;
    end;
  end;
end;

end.
