unit FlatTabs;

interface

{$I FlatStyle.inc}

uses
  Windows, Messages, Classes, Controls, Forms, Graphics, StdCtrls, SysUtils,
  FlatUtils, Themes, ComStrs, commCtrl, FlatPanel;

type
  { TDefineTab }
  TDefineTab = class(TVersionControl)
  private
    FUseAdvColors: Boolean;
    FAdvColorBorder: TAdvColors;
    FTabPosition: TFlatTabPosition;
    FTabs: TStringList;
    FTabsRect: TList;
    FTabHeight: Integer;
    FTabSpacing: Integer;
    FTabIndex: Integer;
    FUnselectedColor: TColor;
    FBorderColor: TColor;
    FOnChange: TNotifyEvent;
    FBorderWidth: Integer;
  protected
    procedure SetTabs (Value: TStringList);
    procedure SetTabPosition (Value: TFlatTabPosition);
    procedure SetTabHeight (Value: Integer);
    procedure SetTabSpacing (Value: Integer);
    procedure SetTabIndex (Value: Integer);
    procedure SetColors (Index: Integer; Value: TColor);
    procedure SetAdvColors (Index: Integer; Value: TAdvColors);
    procedure SetUseAdvColors (Value: Boolean);
    procedure SetTabRect;
    procedure CMDialogChar (var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMEnabledChanged (var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure WMSize (var Message: TWMSize); message WM_SIZE;
    procedure CMSysColorChange (var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMParentColorChanged (var Message: TWMNoParams); message CM_PARENTCOLORCHANGED;
    procedure CMDesignHitTest(var Message: TCMDesignHitTest); message CM_DESIGNHITTEST;
    procedure WMMove (var Message: TWMMove); message WM_MOVE;
    procedure SetBorderWidth(const Value: Integer);
    procedure CalcAdvColors;
    procedure MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Loaded; override;
    procedure Paint; override;
    procedure Change; dynamic;
    procedure AlignControls (AControl: TControl; var Rect: TRect); override;
    function  CanShowTab(TabIndex: Integer): Boolean; virtual;
    procedure TabsChanged (Sender: TObject);
    property BorderWidth: Integer read FBorderWidth write SetBorderWidth default 0;
    property ColorBorder: TColor index 0 read FBorderColor write SetColors default $008396A0;
    property ColorUnselectedTab: TColor index 1 read FUnselectedColor write SetColors default $00996633;
    property AdvColorBorder: TAdvColors index 0 read FAdvColorBorder write SetAdvColors default 50;
    property UseAdvColors: Boolean read FUseAdvColors write SetUseAdvColors default false;
    property Tabs: TStringList read FTabs write SetTabs;
    property TabHeight: Integer read FTabHeight write SetTabHeight default 16;
    property TabSpacing: Integer read FTabSpacing write SetTabSpacing default 4;
    property TabPosition: TFlatTabPosition read FTabPosition write SetTabPosition default fpTop;
    property TabIndex: Integer read FTabIndex write SetTabIndex default 0;
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

  TFlatTab = class(TDefineTab)
  published
    property Align;
    property BorderWidth;
    property ColorBorder;
    property ColorUnselectedTab;
    property AdvColorBorder;
    property UseAdvColors;
    property Tabs;
    property TabHeight;
    property TabSpacing;
    property TabPosition;
    property TabIndex;
    property Version;
    property Font;
    property Color;
    property ParentColor;
    property Enabled;
    property Visible;
    property Cursor;
    property ParentShowHint;
    property ParentFont;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property OnEnter;
    property OnExit;
    property OnMouseMove;
    property OnMouseDown;
    property OnMouseUp;
    property OnChange;
   {$IFDEF DFS_COMPILER_4_UP}
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

procedure TDefineTab.CMDesignHitTest(var Message: TCMDesignHitTest);
begin
  case FTabPosition of
    fpTop:
      if PtInRect(Rect(ClientRect.Left, ClientRect.Top, ClientRect.Right, ClientRect.Top + FTabHeight + 1), Point(message.XPos, message.YPos)) then
        Message.Result := 1
      else
        Message.Result := 0;
    fpBottom:
      if PtInRect(Rect(ClientRect.Left, ClientRect.Bottom - FTabHeight, ClientRect.Right, ClientRect.Bottom), Point(message.XPos, message.YPos)) then
        Message.Result := 1
      else
        Message.Result := 0;
  end;
end;

constructor TDefineTab.Create (AOwner: TComponent);
begin
  inherited;
  ControlStyle := ControlStyle + [csAcceptsControls, csOpaque];
  SetBounds(Left, Top, 289, 193);
  FTabs := TStringList.Create;
  FTabs.OnChange := TabsChanged;
  FTabsRect := TList.Create;
  FTabHeight := 16;
  FTabSpacing := 4;
  FTabPosition := fpTop;
  FTabIndex := 0;
  Color := $00E1EAEB;
  FBorderColor := $008396A0;
  FUnselectedColor := $00996633;
  ParentColor := true;
  ParentFont := true;
  FUseAdvColors := false;
  FAdvColorBorder := 50;
end;

function TDefineTab.CanShowTab(TabIndex: Integer): Boolean;
begin
  Result := True;
end;

destructor TDefineTab.Destroy;
begin
  FTabs.Free;
  RemoveList(FTabsRect, lsFree);
  inherited;
end;

procedure TDefineTab.CalcAdvColors;
begin
  if FUseAdvColors then
  begin
    FBorderColor := CalcAdvancedColor(Color, FBorderColor, FAdvColorBorder, darken);
  end;
end;

procedure TDefineTab.SetAdvColors (Index: Integer; Value: TAdvColors);
begin
  case Index of
    0: FAdvColorBorder := Value;
  end;
  CalcAdvColors;
  Invalidate;
end;

procedure TDefineTab.SetUseAdvColors (Value: Boolean);
begin
  if Value <> FUseAdvColors then
  begin
    FUseAdvColors := Value;
    ParentColor := Value;
    CalcAdvColors;
    Invalidate;
  end;
end;

procedure TDefineTab.CMSysColorChange (var Message: TMessage);
begin
  if FUseAdvColors then
  begin
    ParentColor := True;
    CalcAdvColors;
  end;
  Invalidate;
end;

procedure TDefineTab.CMParentColorChanged (var Message: TWMNoParams);
begin
  inherited;
  if FUseAdvColors then
  begin
    ParentColor := True;
    CalcAdvColors;
  end;
  Invalidate;
end;

procedure TDefineTab.Loaded;
begin
  inherited;
  SetTabRect;
  Invalidate;
end;

procedure TDefineTab.WMSize (var Message: TWMSize);
begin
  inherited;
  SetTabRect;
  Invalidate;
end;

procedure TDefineTab.CMEnabledChanged (var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TDefineTab.SetTabPosition (Value: TFlatTabPosition);
var
  I: Integer;
  r: TRect;
begin
  if Value <> FTabPosition then
  begin
    for I := 0 to ControlCount - 1 do // reposition client-controls
    begin
      if Value = fpTop then
        Controls[I].Top := Controls[I].Top + TabHeight
      else
        Controls[I].Top := Controls[I].Top - TabHeight;
    end;
    FTabPosition := Value;
    SetTabRect;
    Invalidate;
    r := ClientRect;
    AlignControls(self, r);
  end;
end;

procedure TDefineTab.SetTabIndex (Value: Integer);
begin
  if FTabs <> nil then begin
    if Value > (FTabs.Count - 1) then
       Value := FTabs.Count - 1
    else if Value < 0 then
        Value := 0;

    FTabIndex := Value;
    if Assigned(FOnChange) then
       FOnChange(Self);
    Invalidate;
  end else FTabIndex := 0;
  if csDesigning in ComponentState then
    if (GetParentForm(self) <> nil) and (GetParentForm(self).Designer <> nil) then
      GetParentForm(self).Designer.Modified;
end;

procedure TDefineTab.SetColors (Index: Integer; Value: TColor);
begin
  case Index of
    0: FBorderColor := Value;
    1: FUnselectedColor := Value;
  end;
  Invalidate;
end;

procedure TDefineTab.SetTabs (Value: TStringList);
var
  counter: Integer;
begin
  FTabs.Assign(Value);
  if FTabs.Count = 0 then // no tabs? then active tab = 0
    FTabIndex := 0
  else
    begin
      if (FTabs.Count - 1) < FTabIndex then // if TabIndex > last-tab the TabIndex = last-tab
        FTabIndex := FTabs.Count - 1;
      for counter := 0 to FTabs.Count - 1 do
        FTabs[counter] := Trim(FTabs[counter]); // delete all spaces at left and right
    end;
  SetTabRect;
  Invalidate;
end;

procedure TDefineTab.SetTabHeight (Value: Integer);
var
  r: TRect;
begin
  if Value < 0 then Value := 0; // TabHeigh can't negative
  FTabHeight := Value;
  SetTabRect;
  r := ClientRect;
  AlignControls(self, r);
  Invalidate;
end;

procedure TDefineTab.SetTabSpacing (Value: Integer);
begin
  if Value < 1 then Value := 1; // minimal tabspacing = 1 dot
  FTabSpacing := Value;
  SetTabRect;
  Invalidate;
end;

procedure TDefineTab.SetTabRect;
var
  TabCount: Integer;
  TabRect: ^TRect;
  position: TPoint;
  CaptionTextWidth: Integer;
  CaptionTextString: string;
begin
  // set the font and clear the tab-rect-list
  canvas.font := self.font;
  RemoveList(FTabsRect);
  FTabsRect.Clear;

  // set left/top position for the the first tab
  case FTabPosition of
    fpTop:
      {$IFDEF DFS_COMPILER_4_UP}
      if BidiMode = bdRightToLeft then
        position := Point(ClientRect.right, ClientRect.top)
      else
        position := Point(ClientRect.left, ClientRect.top);
      {$ELSE}
      position := Point(ClientRect.left, ClientRect.top);
      {$ENDIF}
    fpBottom:
      {$IFDEF DFS_COMPILER_4_UP}
      if BidiMode = bdRightToLeft then
        position := Point(ClientRect.right, ClientRect.bottom - FTabHeight)
      else
        position := Point(ClientRect.left, ClientRect.bottom - FTabHeight);
      {$ELSE}
      position := Point(ClientRect.left, ClientRect.bottom - FTabHeight);
      {$ENDIF}
  end;

  for TabCount := 0 to (FTabs.Count - 1) do
  begin
    New(TabRect); // create a new Tab-Rect
    if Pos('&', FTabs[TabCount]) <> 0 then // if & in an caption
    begin
      CaptionTextString := FTabs[TabCount]; // read the caption text
      Delete(CaptionTextString, Pos('&', FTabs[TabCount]), 1); // delete the &
      CaptionTextWidth := canvas.TextWidth(CaptionTextString); // calc the caption-width withou the &
    end
    else // else calc the caption-width
      CaptionTextWidth := canvas.TextWidth(FTabs[TabCount]);

    {$IFDEF DFS_COMPILER_4_UP}
    if BidiMode = bdRightToLeft then
    begin
      case FTabPosition of // set the rect
        fpTop:
          TabRect^ := Rect(position.x - CaptionTextWidth - 20, position.y, position.x, FTabHeight);
        fpBottom:
          TabRect^ := Rect(position.x - CaptionTextWidth - 20, position.y, position.x, position.y + FTabHeight);
      end;
      position := Point(position.x - CaptionTextWidth - 20 - FTabSpacing, position.y); // set left/top position for next rect
    end
    else
    begin
      case FTabPosition of // set the rect
        fpTop:
          TabRect^ := Rect(position.x, position.y, position.x + CaptionTextWidth + 20, FTabHeight);
        fpBottom:
          TabRect^ := Rect(position.x, position.y, position.x + CaptionTextWidth + 20, position.y + FTabHeight);
      end;
      position := Point(position.x + CaptionTextWidth + 20 + FTabSpacing, position.y); // set left/top position for next rect
    end;
    {$ELSE}
    case FTabPosition of // set the rect
      fpTop:
        TabRect^ := Rect(position.x, position.y, position.x + CaptionTextWidth + 20, FTabHeight);
      fpBottom:
        TabRect^ := Rect(position.x, position.y, position.x + CaptionTextWidth + 20, position.y + FTabHeight);
    end;
    position := Point(position.x + CaptionTextWidth + 20 + FTabSpacing, position.y); // set left/top position for next rect
    {$ENDIF}
    FTabsRect.Add(TabRect); // add the tab-rect to the tab-rect-list
  end;
end;

procedure TDefineTab.CMDialogChar (var Message: TCMDialogChar);
var
  currentTab: Integer;
begin
  with Message do
  begin
    if FTabs.Count > 0 then
    begin
      for currentTab := 0 to FTabs.Count - 1 do
      begin
        if IsAccel(CharCode, FTabs[currentTab]) then
        begin
          if (FTabIndex <> currentTab) then
          begin
            SetTabIndex(currentTab);
            SetFocus;
          end;
          Result := 1; 
          break;
        end;
      end;
    end
    else
      inherited;
  end;
end;

procedure TDefineTab.Paint;
var
  memoryBitmap: TBitmap;
  TabCount: Integer;
  TempRect: ^TRect;
begin
  memoryBitmap := TBitmap.Create; // create memory-bitmap to draw flicker-free
  try
    memoryBitmap.Height := ClientRect.Bottom;
    memoryBitmap.Width := ClientRect.Right;
    memoryBitmap.Canvas.Font := Self.Font;

    // Clear Background
    if FTabs.Count > 0 then
      DrawParentImage(Self, memoryBitmap.Canvas)
    else
    begin
      memoryBitmap.Canvas.Brush.Color := Self.Color;
      memoryBitmap.Canvas.FillRect(ClientRect);
    end;

    // Draw Border
    if FTabs.Count = 0 then
    begin
      memoryBitmap.canvas.Brush.Color := FBorderColor;
      memoryBitmap.canvas.FrameRect(ClientRect)
    end
    else
    begin
      memoryBitmap.canvas.Pen.Color := FBorderColor;
      TempRect := FTabsRect.Items[FTabIndex];
      if ClientRect.left <> TempRect^.left then // if Active Tab not first tab then __|Tab|___
      begin
        case FTabPosition of
          fpTop:
          begin
            memoryBitmap.Canvas.Polyline([Point(ClientRect.left, ClientRect.top + FTabHeight), Point(TempRect^.Left, ClientRect.top + FTabHeight)]);
            memoryBitmap.Canvas.Polyline([Point(TempRect^.Right-1, ClientRect.top + FTabHeight), Point(ClientRect.right, ClientRect.top + FTabHeight)]);
          end;
          fpBottom:
          begin
            memoryBitmap.Canvas.Polyline([Point(ClientRect.left, ClientRect.bottom - FTabHeight - 1), Point(TempRect^.Left, ClientRect.bottom - FTabHeight - 1)]);
            memoryBitmap.Canvas.Polyline([Point(TempRect^.Right-1, ClientRect.bottom - FTabHeight - 1), Point(ClientRect.right, ClientRect.bottom - FTabHeight - 1)]);
          end;
        end;
      end
      else // else |Tab|___
        case FTabPosition of
          fpTop:
            memoryBitmap.Canvas.Polyline([Point(TempRect^.Right-1, ClientRect.top + FTabHeight), Point(ClientRect.right, ClientRect.top + FTabHeight)]);
          fpBottom:
            memoryBitmap.Canvas.Polyline([Point(TempRect^.Right-1, ClientRect.bottom - FTabHeight - 1), Point(ClientRect.right, ClientRect.bottom - FTabHeight - 1)]);
        end;
      // border of the control
      case FTabPosition of
        fpTop:
          memoryBitmap.Canvas.Polyline([Point(ClientRect.left, ClientRect.top + FTabHeight), Point(ClientRect.left, ClientRect.bottom - 1), Point(ClientRect.right - 1, ClientRect.bottom - 1), Point(ClientRect.right - 1, ClientRect.top + FTabHeight)]);
        fpBottom:
          memoryBitmap.Canvas.Polyline([Point(ClientRect.left, ClientRect.bottom - FTabHeight - 1), Point(ClientRect.left, ClientRect.top), Point(ClientRect.right - 1, ClientRect.top), Point(ClientRect.right - 1, ClientRect.bottom - FTabHeight - 1)]);
      end;
    end;

    case FTabPosition of
      fpTop:
        begin
          memoryBitmap.canvas.brush.color := Color;
          memoryBitmap.Canvas.FillRect(Rect(ClientRect.left + 1, ClientRect.top + FTabHeight + 1, ClientRect.right - 1, ClientRect.bottom - 1));
        end;
      fpBottom:
        begin
          memoryBitmap.canvas.brush.color := Color;
          memoryBitmap.Canvas.FillRect(Rect(ClientRect.left + 1, ClientRect.top + 1, ClientRect.right - 1, ClientRect.bottom - FTabHeight - 1));
        end;
    end;

    // Draw Tabs
    for TabCount := 0 to FTabs.Count - 1 do
    begin
      TempRect := FTabsRect.Items[TabCount];
      memoryBitmap.canvas.brush.style := bsclear;
      memoryBitmap.canvas.pen.color := clBlack;
      if TabCount = FTabIndex then // if Active Tab not first tab then draw border |^^^|
      begin
        memoryBitmap.canvas.font.color := self.font.color;
        memoryBitmap.canvas.brush.color := Color;
        memoryBitmap.canvas.pen.color := FBorderColor;
        case FTabPosition of
          fpTop:
            begin
              memoryBitmap.Canvas.FillRect(Rect(TempRect^.left, TempRect^.top, TempRect^.right - 1, TempRect^.bottom + 1));
              memoryBitmap.Canvas.Polyline([Point(TempRect^.Left, TempRect^.Bottom), Point(TempRect^.Left, TempRect^.Top), Point(TempRect^.Right-1, TempRect^.Top), Point(TempRect^.Right-1, TempRect^.Bottom)]);
            end;
          fpBottom:
            begin
              memoryBitmap.Canvas.FillRect(Rect(TempRect^.left, TempRect^.top - 1, TempRect^.right - 1, TempRect^.bottom));
              memoryBitmap.Canvas.Polyline([Point(TempRect^.Left, TempRect^.top - 1), Point(TempRect^.Left, TempRect^.bottom - 1), Point(TempRect^.Right-1, TempRect^.bottom - 1), Point(TempRect^.Right-1, TempRect^.top - 1)]);
            end;
        end;
      end
      else // else only fill the tab
      begin
        memoryBitmap.canvas.font.color := color;
        memoryBitmap.canvas.brush.color := FUnselectedColor;
        memoryBitmap.Canvas.FillRect(TempRect^);
      end;
      memoryBitmap.Canvas.Brush.Style := bsClear;
      if (TabCount = FTabIndex) and not Enabled then
       begin
        memoryBitmap.Canvas.Font.Color := FUnselectedColor;
        DrawText(memoryBitmap.canvas.Handle, PChar(FTabs[TabCount]), Length(FTabs[TabCount]), TempRect^, DT_CENTER or DT_VCENTER or DT_SINGLELINE)
       end
      else
        DrawText(memoryBitmap.canvas.Handle, PChar(FTabs[TabCount]), Length(FTabs[TabCount]), TempRect^, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
    end;
    canvas.CopyRect(ClientRect, memoryBitmap.canvas, ClientRect); // Copy bitmap to screen
  finally
    memoryBitmap.free; // delete the bitmap
  end;
end;

procedure TDefineTab.MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  cursorPos: TPoint;
  currentTab: Integer;
  currentRect: ^TRect;
begin
  GetCursorPos(cursorPos);
  cursorPos := ScreenToClient(cursorPos);

  if FTabs.Count > 0 then
  begin
    for currentTab := 0 to FTabs.Count - 1 do
    begin
      currentRect := FTabsRect.Items[currentTab];
      if PtInRect(currentRect^, cursorPos) then
        if (FTabIndex <> currentTab) then begin// only change when new tab selected
          SetTabIndex(currentTab);
          if not(csDesigning in ComponentState) then
             SetFocus;
        end;
    end;
  end;
  inherited;
end;

procedure TDefineTab.AlignControls (AControl: TControl; var Rect: TRect);
begin
  case FTabPosition of
    fpTop:
      SetRect(Rect, clientRect.left + 1 + FBorderWidth, clientRect.top +
        TabHeight + 1 + FBorderWidth, clientRect.right - 1 - FBorderWidth,
        clientRect.bottom - 1 - FBorderWidth);
    fpBottom:
      SetRect(Rect, clientRect.left + 1 + FBorderWidth, clientRect.top + 1 +
        FBorderWidth, clientRect.right - 1 - FBorderWidth, clientRect.bottom -
        TabHeight - 1 - FBorderWidth);
  end;
  inherited;
end;

procedure TDefineTab.WMMove(var Message: TWMMove);
begin
  inherited;
  Invalidate;
end;

procedure TDefineTab.TabsChanged (Sender: TObject);
begin
  SetTabRect;
  Invalidate;
end;

procedure TDefineTab.SetBorderWidth(const Value: Integer);
var
  r: TRect;
begin
  if Value <> FBorderWidth then
  begin
    FBorderWidth := Value;
    r := ClientRect;
    AlignControls(self, r);
  end;
end;

procedure TDefineTab.Change;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;


end.
