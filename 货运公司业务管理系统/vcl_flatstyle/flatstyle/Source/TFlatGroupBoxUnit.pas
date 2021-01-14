unit TFlatGroupBoxUnit;

interface

{$I DFS.inc}

uses
  Windows, Messages, SysUtils, Forms, Classes, Graphics, Controls, ExtCtrls, FlatUtilitys;

type
  TFlatGroupBox = class(TCustomControl)
  private
    FTransparent: Boolean;
    FUseAdvColors: Boolean;
    FAdvColorBorder: TAdvColors;
    FBorderColor: TColor;
    FBorder: TGroupBoxBorder;
    procedure SetAdvColors (Index: Integer; Value: TAdvColors);
    procedure SetUseAdvColors (Value: Boolean);
    procedure CMEnabledChanged (var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMTextChanged (var Message: TWmNoParams); message CM_TEXTCHANGED;
    procedure SetColors(const Index: Integer; const Value: TColor);
    procedure SetBorder(const Value: TGroupBoxBorder);
    procedure CMSysColorChange (var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMParentColorChanged (var Message: TWMNoParams); message CM_PARENTCOLORCHANGED;
    procedure CMDialogChar (var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure WMSize (var Message: TWMSize); message WM_SIZE;
    procedure WMMove (var Message: TWMMove); message WM_MOVE;
    procedure SetTransparent (const Value: Boolean);
  protected
    procedure CalcAdvColors;
    procedure Paint; override;
   {$IFDEF DFS_COMPILER_4_UP}
    procedure SetBiDiMode(Value: TBiDiMode); override;
   {$ENDIF}
  public
    constructor Create (AOwner: TComponent); override;
  published
    property Transparent: Boolean read FTransparent write SetTransparent default false;
    property Align;
    property Cursor;
    property Caption;
    property Font;
    property ParentFont;
    property Color;
    property ParentColor;
    property PopupMenu;
    property ShowHint;
    property ParentShowHint;
    property Enabled;
    property Visible;
    property TabOrder;
    property TabStop;
    property Hint;
    property HelpContext;
    property ColorBorder: TColor index 0 read FBorderColor write SetColors default $008396A0;
    property Border: TGroupBoxBorder read FBorder write SetBorder default brFull;
    property AdvColorBorder: TAdvColors index 0 read FAdvColorBorder write SetAdvColors default 50;
    property UseAdvColors: Boolean read FUseAdvColors write SetUseAdvColors default false;
   {$IFDEF DFS_COMPILER_4_UP}
    property Anchors;
    property BiDiMode write SetBidiMode;
    property Constraints;
    property DragKind;
    property DragMode;
    property DragCursor;
    property ParentBiDiMode;
    property DockSite;
    property OnEndDock;
    property OnStartDock;
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
    property OnStartDrag;
  end;

implementation

{ TFlatGroupBox }

constructor TFlatGroupBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csAcceptsControls, csOpaque];
  FBorderColor := $008396A0;
  FAdvColorBorder := 50;
  SetBounds(0, 0, 185, 105);
end;

procedure TFlatGroupBox.Paint;
var
  memoryBitmap: TBitmap;
  borderRect, textBounds: TRect;
  textHeight, textWidth: integer;
  Format: UINT;
begin
  borderRect := ClientRect;
  {$IFDEF DFS_COMPILER_4_UP}
  if BidiMode = bdRightToLeft then
    Format := DT_TOP or DT_RIGHT or DT_SINGLELINE
  else
    Format := DT_TOP or DT_LEFT or DT_SINGLELINE;
  {$ELSE}
  Format := DT_TOP or DT_LEFT or DT_SINGLELINE;
  {$ENDIF}

  memoryBitmap := TBitmap.Create; // create memory-bitmap to draw flicker-free
  try
    memoryBitmap.Height := ClientRect.Bottom;
    memoryBitmap.Width := ClientRect.Right;
    memoryBitmap.Canvas.Font := Self.Font;

    textHeight := memoryBitmap.canvas.TextHeight(caption);
    textWidth := memoryBitmap.Canvas.TextWidth(caption);

    {$IFDEF DFS_COMPILER_4_UP}
    if BidiMode = bdRightToLeft then
      textBounds := Rect(ClientRect.Right - 10 - textWidth, ClientRect.Top,
        ClientRect.Right - 10 , ClientRect.Top + textHeight)
    else
      textBounds := Rect(ClientRect.Left + 10, ClientRect.Top,
        ClientRect.Left + 10 + textWidth,
        ClientRect.Top + textHeight);
    {$ELSE}
    textBounds := Rect(ClientRect.Left + 10, ClientRect.Top,
      ClientRect.Left + 10 + textWidth,
      ClientRect.Top + textHeight);
    {$ENDIF}
    textBounds := Rect(ClientRect.Left + 10, ClientRect.Top,
      ClientRect.Right - 10,
      ClientRect.Top + textHeight);

    // Draw Background
    if FTransparent then
      DrawParentImage(Self, memoryBitmap.Canvas)
    else
    begin
      memoryBitmap.Canvas.Brush.Color := Self.Color;
      memoryBitmap.Canvas.FillRect(ClientRect);
    end;

    // Draw Border
    memoryBitmap.Canvas.Pen.Color := FBorderColor;
    case FBorder of
      brFull:
        {$IFDEF DFS_COMPILER_4_UP}
        if BidiMode = bdRightToLeft then
          memoryBitmap.Canvas.Polyline([Point(ClientRect.Right - 15 - textWidth, ClientRect.top + (textHeight div 2)),
            Point(ClientRect.left, ClientRect.top + (textHeight div 2)),
            Point(ClientRect.left, ClientRect.bottom-1), Point(ClientRect.right-1, ClientRect.bottom-1),
            Point(ClientRect.right-1, ClientRect.top + (textHeight div 2)),
            Point(ClientRect.Right - 7 , ClientRect.top + (textHeight div 2))])
        else
          memoryBitmap.Canvas.Polyline([Point(ClientRect.left + 5, ClientRect.top + (textHeight div 2)),
            Point(ClientRect.left, ClientRect.top + (textHeight div 2)),
            Point(ClientRect.left, ClientRect.bottom-1), Point(ClientRect.right-1, ClientRect.bottom-1),
            Point(ClientRect.right-1, ClientRect.top + (textHeight div 2)),
            Point(ClientRect.left + 12 + textWidth, ClientRect.top + (textHeight div 2))]);
        {$ELSE}
        memoryBitmap.Canvas.Polyline([Point(ClientRect.left + 5, ClientRect.top + (textHeight div 2)),
          Point(ClientRect.left, ClientRect.top + (textHeight div 2)),
          Point(ClientRect.left, ClientRect.bottom-1), Point(ClientRect.right-1, ClientRect.bottom-1),
          Point(ClientRect.right-1, ClientRect.top + (textHeight div 2)),
          Point(ClientRect.left + 12 + textWidth, ClientRect.top + (textHeight div 2))]);
        {$ENDIF}
      brOnlyTopLine:
        {$IFDEF DFS_COMPILER_4_UP}
        if BidiMode = bdRightToLeft then
        begin
          memoryBitmap.Canvas.Polyline([Point(ClientRect.right - 5, ClientRect.top + (textHeight div 2)), Point(ClientRect.right, ClientRect.top + (textHeight div 2))]);
          memoryBitmap.Canvas.Polyline([Point(ClientRect.left+1, ClientRect.top + (textHeight div 2)), Point(ClientRect.right - 12 - textWidth, ClientRect.top + (textHeight div 2))]);
        end
        else
        begin
          memoryBitmap.Canvas.Polyline([Point(ClientRect.left + 5, ClientRect.top + (textHeight div 2)), Point(ClientRect.left, ClientRect.top + (textHeight div 2))]);
          memoryBitmap.Canvas.Polyline([Point(ClientRect.right-1, ClientRect.top + (textHeight div 2)), Point(ClientRect.left + 12 + textWidth, ClientRect.top + (textHeight div 2))]);
        end;
        {$ELSE}
        begin
          memoryBitmap.Canvas.Polyline([Point(ClientRect.left + 5, ClientRect.top + (textHeight div 2)), Point(ClientRect.left, ClientRect.top + (Canvas.textHeight(caption) div 2))]);
          memoryBitmap.Canvas.Polyline([Point(ClientRect.right-1, ClientRect.top + (textHeight div 2)), Point(ClientRect.left + 12 + textWidth, ClientRect.top + (textHeight div 2))]);
        end;
        {$ENDIF}
    end;

    // Draw Text
    memoryBitmap.Canvas.Brush.Style := bsClear;
    if not Enabled then
    begin
      OffsetRect(textBounds, 1, 1);
      memoryBitmap.Canvas.Font.Color := clBtnHighlight;
      DrawText(memoryBitmap.Canvas.Handle, PChar(Caption), Length(Caption), textBounds, Format);
      OffsetRect(textBounds, -1, -1);
      memoryBitmap.Canvas.Font.Color := clBtnShadow;
      DrawText(memoryBitmap.Canvas.Handle, PChar(Caption), Length(Caption), textBounds, Format);
    end
    else
      DrawText(memoryBitmap.Canvas.Handle, PChar(Caption), Length(Caption), textBounds, Format);

    // Copy memoryBitmap to screen
    canvas.CopyRect(ClientRect, memoryBitmap.canvas, ClientRect);
  finally
    memoryBitmap.free; // delete the bitmap
  end;
end;

procedure TFlatGroupBox.CMTextChanged (var Message: TWmNoParams);
begin
  inherited;
  Invalidate;
end;

procedure TFlatGroupBox.SetColors(const Index: Integer;
  const Value: TColor);
begin
  case Index of
    0: FBorderColor := Value;
  end;
  Invalidate;
end;

procedure TFlatGroupBox.SetBorder(const Value: TGroupBoxBorder);
begin
  FBorder := Value;
  Invalidate;
end;

procedure TFlatGroupBox.SetAdvColors(Index: Integer; Value: TAdvColors);
begin
  case Index of
    0: FAdvColorBorder := Value;
  end;
  CalcAdvColors;
  Invalidate;
end;

procedure TFlatGroupBox.SetUseAdvColors(Value: Boolean);
begin
  if Value <> FUseAdvColors then
  begin
    FUseAdvColors := Value;
    ParentColor := Value;
    CalcAdvColors;
    Invalidate;
  end;
end;

procedure TFlatGroupBox.CalcAdvColors;
begin
  if FUseAdvColors then
  begin
    FBorderColor := CalcAdvancedColor(Color, FBorderColor, FAdvColorBorder, darken);
  end;
end;

procedure TFlatGroupBox.CMParentColorChanged(var Message: TWMNoParams);
begin
  inherited;
  if FUseAdvColors then
  begin
    ParentColor := True;
    CalcAdvColors;
  end;
  Invalidate;
end;

procedure TFlatGroupBox.CMSysColorChange(var Message: TMessage);
begin
  if FUseAdvColors then
  begin
    ParentColor := True;
    CalcAdvColors;
  end;
  Invalidate;
end;

procedure TFlatGroupBox.CMDialogChar(var Message: TCMDialogChar);
begin
  with Message do
    if IsAccel(Message.CharCode, Caption) and CanFocus then
    begin
      SetFocus; 
      Result := 1;
    end;
end;

procedure TFlatGroupBox.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TFlatGroupBox.SetTransparent(const Value: Boolean);
begin
  FTransparent := Value;
  Invalidate;
end;

procedure TFlatGroupBox.WMMove(var Message: TWMMove);
begin
  inherited;
  if FTransparent then
    Invalidate;
end;

procedure TFlatGroupBox.WMSize(var Message: TWMSize);
begin
  inherited;
  if FTransparent then
    Invalidate;
end;

{$IFDEF DFS_COMPILER_4_UP}
procedure TFlatGroupBox.SetBiDiMode(Value: TBiDiMode);
begin
  inherited;
  Invalidate;
end;
{$ENDIF}

end.


