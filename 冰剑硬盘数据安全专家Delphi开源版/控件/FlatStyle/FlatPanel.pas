unit FlatPanel;

interface

{$I FlatStyle.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, FlatUtils, StdCtrls, Themes;

type
  TFlatTicket = class(TCustomLabel)
  private
    function GetTop: Integer;
    function GetLeft: Integer;
    function GetWidth: Integer;
    function GetHeight: Integer;
    procedure SetHeight(const Value: Integer);
    procedure SetWidth(const Value: Integer);
  protected
    procedure AdjustBounds; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property BiDiMode;
    property Caption;
    property Color;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Font;
    property Height: Integer read GetHeight write SetHeight;
    property Left: Integer read GetLeft;
    property ParentBiDiMode;
    property ParentColor;
    property ParentFont;
    property Top: Integer read GetTop;
    property Transparent;
    property Layout;
    property WordWrap;
    property Width: Integer read GetWidth write SetWidth;
  end;
  { TDefinePanel }
  TDefinePanel = class(TVersionControl)
  private
    FAutoSizeDocking: Boolean;
    FTransparent: Boolean;
    FColorBorder: TColor;
    FBackgropStartColor: TColor;
    FBackgropStopColor: TColor;
    FBackgropOrien: TStyleOrien;
    FStyleFace: TStyleFace;
    FAlignment: TAlignment;
    FLocked: Boolean;
    FFullRepaint: Boolean;
    FParentBackgroundSet: Boolean;
    procedure SetColors (Index: Integer; Value: TColor);
    procedure SetTransparent (const Value: Boolean);
    procedure SetBackgropOrien(const Value: TStyleOrien);
    procedure SetStyleFace(const Value: TStyleFace);
    procedure SetAlignment(const Value: TAlignment);
  protected
    procedure Paint; override;
    procedure CMIsToolControl(var Message: TMessage); message CM_ISTOOLCONTROL;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
    procedure CMEnabledChanged (var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMTextChanged (var Message: TWmNoParams); message CM_TEXTCHANGED;
    procedure CMDockClient(var Message: TCMDockClient); message CM_DOCKCLIENT;
    procedure SetParentBackground(Value: Boolean); override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure AdjustClientRect(var Rect: TRect); override;
    function  CanAutoSize(var NewWidth, NewHeight: Integer): Boolean; override;
    property Transparent: Boolean read FTransparent write SetTransparent default false;
    property Alignment: TAlignment read FAlignment write SetAlignment default taCenter;
    property Locked: Boolean read FLocked write FLocked default False;
    property FullRepaint: Boolean read FFullRepaint write FFullRepaint default True;
    property ColorBorder: TColor index 0 read FColorBorder write SetColors default DefaultBorderColor;
    property BackgropStartColor: TColor index 1 read FBackgropStartColor write SetColors default DefaultColorStart;
    property BackgropStopColor: TColor index 2 read FBackgropStopColor write SetColors default DefaultColorStop;
    property BackgropOrien: TStyleOrien read FBackgropOrien write SetBackgropOrien default bsHorizontal;
    property StyleFace: TStyleFace read FStyleFace write SetStyleFace default fsDefault;
    property Color default clBtnFace;
  public
    constructor Create (AOwner: TComponent); override;
    function GetControlsAlignment: TAlignment; override;
    property ParentBackground stored FParentBackgroundSet;
  end;

  { TDefinePanel }
  TFlatPanel = class(TDefinePanel)
  published
    property Transparent;
    property Alignment;
    property Locked;
    property FullRepaint;
    property ColorBorder;
    property BackgropStartColor;
    property BackgropStopColor;
    property BackgropOrien;
    property StyleFace;
    property Color;
    property Caption;
    property Action;
    property Font;
    property ParentColor;
    property UseDockManager;
    property Enabled;
    property Visible;
    property Align;
    property AutoSize;
    property Cursor;
    property Hint;
    property ParentShowHint;
    property ShowHint;
    property PopupMenu;
    property TabOrder;
    property TabStop;
   {$IFDEF DFS_DELPHI_4_UP}
    property AutoSize;
    property UseDockManager;
    property Anchors;
    property BiDiMode;
    property Constraints;
    property DragKind;
    property DragMode;
    property DragCursor;
    property ParentBiDiMode;
    property DockSite;
    property OnEndDock;
    property OnStartDock;
    property OnCanResize;
    property OnConstrainedResize;
    property OnDockDrop;
    property OnDockOver;
    property OnGetSiteInfo;
    property OnUnDock;
   {$ENDIF}
   {$IFDEF DFS_DELPHI_5_UP}
    property OnContextPopup;
   {$ENDIF}
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnStartDrag;
  end;
  { TFlatLBPanel }
  TFlatLBPanel = class(TDefinePanel)
  private
    FTicketSpace: Integer;
    FTicket: TFlatTicket;
    FTicketPosition: TTicketPosition;
  protected
    procedure SetTicketPosition(const Value: TTicketPosition);
    procedure SetLabelSpacing(const Value: Integer);
    procedure SetName(const Value: TComponentName); override;
    procedure CMVisiblechanged(var Message: TMessage); message CM_VISIBLECHANGED;
    procedure CMBidimodechanged(var Message: TMessage); message CM_BIDIMODECHANGED;
    procedure SetParent(AParent: TWinControl); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure SetupInternalLabel;
  public
    constructor Create (AOwner: TComponent); override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer);override;
  published
    property Ticket: TFlatTicket read FTicket;
    property TicketPosition: TTicketPosition read FTicketPosition write SetTicketPosition default poLeft;
    property TicketSpace: Integer read FTicketSpace write SetLabelSpacing default 3;
    property Transparent;
    property Alignment;
    property Locked;
    property FullRepaint;
    property ColorBorder;
    property BackgropStartColor;
    property BackgropStopColor;
    property BackgropOrien;
    property StyleFace;
    property Color;
    property Caption;
    property Font;
    property ParentColor;
    property UseDockManager;
    property Enabled;
    property Visible;
    property Align;
    property AutoSize;
    property Cursor;
    property Hint;
    property ParentShowHint;
    property ShowHint;
    property PopupMenu;
    property TabOrder;
    property TabStop;
   {$IFDEF DFS_DELPHI_4_UP}
    property AutoSize;
    property UseDockManager;
    property Anchors;
    property BiDiMode;
    property Constraints;
    property DragKind;
    property DragMode;
    property DragCursor;
    property ParentBiDiMode;
    property DockSite;
    property OnEndDock;
    property OnStartDock;
    property OnCanResize;
    property OnConstrainedResize;
    property OnDockDrop;
    property OnDockOver;
    property OnGetSiteInfo;
    property OnUnDock;
   {$ENDIF}
   {$IFDEF DFS_DELPHI_5_UP}
    property OnContextPopup;
   {$ENDIF}
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnStartDrag;
  end;

implementation

{ TDefinePanel }
constructor TDefinePanel.Create (AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csAcceptsControls, csCaptureMouse, csClickEvents,
    csSetCaption, csOpaque, csDoubleClicks, csReplicatable];
  { When themes are on in an application default to making
    TDefinePanel's paint with their ParentBackground }
  if ThemeServices.ThemesEnabled then
     ControlStyle := ControlStyle + [csParentBackground] - [csOpaque];
  ParentColor     := True;
  UseDockManager  := True;
  ParentFont      := True;
  Color           := clBtnFace;
  FColorBorder    := DefaultBorderColor;
  FFullRepaint    := True;
  FAlignment      := taCenter;
  FBackgropStartColor := DefaultColorStart;
  FBackgropStopColor  := DefaultColorStop;
  FBackgropOrien      := bsHorizontal;
  SetBounds(0, 0, 185, 41);
end;

procedure TDefinePanel.SetColors (Index: Integer; Value: TColor);
begin
  case Index of
    0: FColorBorder := Value;
    1: FBackgropStartColor := Value;
    2: FBackgropStopColor := Value;
  end;
  Invalidate;
end;

procedure TDefinePanel.Paint;
var
  memBitmap: TBitmap;
  textBounds: TRect;
  Format: UINT;
begin
  TextBounds := ClientRect;
  TextBounds.Left  := TextBounds.Left + 3;
  TextBounds.Right := TextBounds.Right - 3;
  Format := DT_SINGLELINE or DT_VCENTER;
  case Alignment of
    taLeftJustify: Format := Format or DT_LEFT;
    taCenter:      Format := Format or DT_CENTER;
    taRightJustify:Format := Format or DT_RIGHT;
  end;   

  memBitmap := TBitmap.Create; // create memory-bitmap to draw flicker-free
  try
    memBitmap.Height := ClientRect.Bottom;
    memBitmap.Width  := ClientRect.Right;
    if not ThemeServices.ThemesEnabled or not ParentBackground then
    begin
      memBitmap.Canvas.Brush.Color := Color;
      memBitmap.Canvas.FillRect(TextBounds);
    end;
    // Draw Background
    if FTransparent then
       DrawParentImage(Self, memBitmap.Canvas)
    else begin
      if FStyleFace=fsDefault then begin
         memBitmap.Canvas.Brush.Color := Self.Color;
         memBitmap.Canvas.FillRect(ClientRect);
      end else
         DrawBackdrop(memBitmap.Canvas,FBackgropStartColor,FBackgropStopColor,ClientRect,FBackgropOrien);
    end;

    // Draw Border
    DrawButtonBorder(memBitmap.Canvas, ClientRect, FColorBorder, 1);

    // Draw Text
    memBitmap.Canvas.Font := Self.Font;
    memBitmap.Canvas.Brush.Style := bsClear;
    if not Enabled then begin
      OffsetRect(textBounds, 1, 1);
      memBitmap.Canvas.Font.Color := clBtnHighlight;
      DrawText(memBitmap.Canvas.Handle, PChar(Caption), Length(Caption), textBounds, Format);
      OffsetRect(textBounds, -1, -1);
      memBitmap.Canvas.Font.Color := clBtnShadow;
      DrawText(memBitmap.Canvas.Handle, PChar(Caption), Length(Caption), textBounds, Format);
    end else
      DrawText(memBitmap.Canvas.Handle, PChar(Caption), Length(Caption), textBounds, Format);

    // Copy memBitmap to screen
    canvas.CopyRect(ClientRect, memBitmap.canvas, ClientRect);
  finally
    memBitmap.free; // delete the bitmap
  end;
end;

procedure TDefinePanel.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TDefinePanel.CMTextChanged(var Message: TWmNoParams);
begin
  inherited;
  Invalidate;
end;

procedure TDefinePanel.SetTransparent(const Value: Boolean);
begin
  FTransparent := Value;
  Invalidate;
end;

procedure TDefinePanel.SetBackgropOrien(const Value: TStyleOrien);
begin
  FBackgropOrien := Value;
  Invalidate;
end;

procedure TDefinePanel.SetStyleFace(const Value: TStyleFace);
begin
  FStyleFace := Value;
  Invalidate;
end;

procedure TDefinePanel.SetAlignment(const Value: TAlignment);
begin
  FAlignment := Value;
  Invalidate;
end;

procedure TDefinePanel.CMIsToolControl(var Message: TMessage);
begin
  if not FLocked then Message.Result := 1;
end;

procedure TDefinePanel.WMWindowPosChanged(var Message: TWMWindowPosChanged);
var
  Rect: TRect;
begin
  if FullRepaint or (Caption <> '') then
     Invalidate
  else
  begin
    Rect.Right := Width;
    Rect.Bottom := Height;
    if Message.WindowPos^.cx <> Rect.Right then
    begin
       Rect.Top := 0;
       Rect.Left := Rect.Right - 2;
       InvalidateRect(Handle, @Rect, True);
    end;
    if Message.WindowPos^.cy <> Rect.Bottom then
    begin
       Rect.Left := 0;
       Rect.Top := Rect.Bottom - 2;
       InvalidateRect(Handle, @Rect, True);
    end;
  end;
  inherited;
end;

procedure TDefinePanel.CMDockClient(var Message: TCMDockClient);
var
  R: TRect;
  Dim: Integer;
begin
  if AutoSize then
  begin
    FAutoSizeDocking := True;
    try
      R := Message.DockSource.DockRect;
      case Align of
        alLeft: if Width = 0 then Width := R.Right - R.Left;
        alRight: if Width = 0 then
          begin
            Dim := R.Right - R.Left;
            SetBounds(Left - Dim, Top, Dim, Height);
          end;
        alTop: if Height = 0 then Height := R.Bottom - R.Top;
        alBottom: if Height = 0 then
          begin
            Dim := R.Bottom - R.Top;
            SetBounds(Left, Top - Dim, Width, Dim);
          end;
      end;
      inherited;
      Exit;
    finally
      FAutoSizeDocking := False;
    end;
  end;
  inherited;
end;

function TDefinePanel.CanAutoSize(var NewWidth, NewHeight: Integer): Boolean;
begin
  Result := (not FAutoSizeDocking) and inherited CanAutoSize(NewWidth, NewHeight);
end;

function TDefinePanel.GetControlsAlignment: TAlignment;
begin
  Result := FAlignment;
end;

procedure TDefinePanel.SetParentBackground(Value: Boolean);
begin
  { TCustomPanel needs to not have csOpaque when painting
    with the ParentBackground in Themed applications }
  if Value then
    ControlStyle := ControlStyle - [csOpaque]
  else
    ControlStyle := ControlStyle + [csOpaque];
  FParentBackgroundSet := True;
  inherited;
end;

procedure TDefinePanel.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW);
  end; 
end;

procedure TDefinePanel.AdjustClientRect(var Rect: TRect);
begin
  inherited AdjustClientRect(Rect);
  InflateRect(Rect, -1, -1);
end;

{ TFlatTicket }

constructor TFlatTicket.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Name := 'Label';  { do not localize }
  SetSubComponent(True);
  if Assigned(AOwner) then
     Caption := AOwner.Name;
end;

procedure TFlatTicket.AdjustBounds;
begin
  inherited AdjustBounds;
  if Owner is TFlatLBPanel then
    with Owner as TFlatLBPanel do
      SetTicketPosition(TicketPosition);
end;

function TFlatTicket.GetHeight: Integer;
begin
  Result := inherited Height;
end;

function TFlatTicket.GetLeft: Integer;
begin
  Result := inherited Left;
end;

function TFlatTicket.GetTop: Integer;
begin
  Result := inherited Top;
end;

function TFlatTicket.GetWidth: Integer;
begin
  Result := inherited Width;
end;

procedure TFlatTicket.SetHeight(const Value: Integer);
begin
  SetBounds(Left, Top, Width, Value);
end;

procedure TFlatTicket.SetWidth(const Value: Integer);
begin
  SetBounds(Left, Top, Value, Height);
end;
{ TFlatLBPanel }
procedure TFlatLBPanel.CMEnabledChanged (var Message: TMessage);
begin
  inherited;
  if Assigned(FTicket) then FTicket.Enabled := Enabled;
end;

procedure TFlatLBPanel.SetTicketPosition(const Value: TTicketPosition);
begin
  if FTicket = nil then exit;
  FTicketPosition := Value;
  SetTicketPoint(Value,Self,Ticket,FTicketSpace);
end;

procedure TFlatLBPanel.SetLabelSpacing(const Value: Integer);
begin
  if Assigned(FTicket) then FTicketSpace := Value;
  SetTicketPosition(FTicketPosition);
end;

procedure TFlatLBPanel.SetupInternalLabel;
begin
  if DefaultHasTicket then begin
   if Assigned(FTicket) then exit;
   FTicket := TFlatTicket.Create(Self);
   FTicket.FreeNotification(Self);
   FTicket.Transparent  := True;
   FTicket.FocusControl := Self;
  end;
end;

procedure TFlatLBPanel.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited SetBounds(ALeft, ATop, AWidth, AHeight);
  SetTicketPosition(FTicketPosition);
end;

procedure TFlatLBPanel.SetParent(AParent: TWinControl);
begin
  inherited SetParent(AParent);
  if FTicket = nil then exit;
  FTicket.Parent := AParent;
  FTicket.Visible := True;
end;

procedure TFlatLBPanel.CMBidimodechanged(var Message: TMessage);
begin
  inherited;
  if Assigned(FTicket) then FTicket.BiDiMode := BiDiMode;
end;

procedure TFlatLBPanel.CMVisiblechanged(var Message: TMessage);
begin
  inherited;
  if Assigned(FTicket) then FTicket.Visible := Visible;
end;

procedure TFlatLBPanel.SetName(const Value: TComponentName);
begin
  if Assigned(FTicket) then begin
   if (csDesigning in ComponentState) and ((FTicket.GetTextLen = 0) or
      (CompareText(FTicket.Caption, Name) = 0)) then
       FTicket.Caption := Value;
  end;
  inherited SetName(Value);
  if (csDesigning in ComponentState)and(Assigned(FTicket)) then
     Caption := '';
end;

procedure TFlatLBPanel.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (AComponent = FTicket) and (Operation = opRemove) then
     FTicket := nil;
end;

constructor TFlatLBPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTicketPosition   := poLeft;
  FTicketSpace      := 3;
  SetupInternalLabel;
end;

end.
