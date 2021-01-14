unit FlatView;

interface

{$I FlatStyle.inc}
{$R-,T-,H+,X+}

uses Windows, Messages, Classes, Graphics, Controls, ComCtrls, Forms,
     Menus, commCtrl, ExtCtrls, FlatUtils;

type
  { TDefineTreeView }
  TDefineTreeView = class(TVersionTreeView)
  private
    FParentColor: Boolean;
    FFocusedColor: TColor;
    FBorderColor: TColor;
    FFlatColor: TColor;
    FMouseIn: Boolean;
    FInterDrawing: boolean;
    procedure SetColors(Index: Integer; Value: TColor);
    procedure SetParentColor(Value: Boolean);
    function  GetItemsCount: Integer;
  protected
    procedure RedrawBorder(const Clip: HRGN = 0);
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMParentColorChanged(var Message: TWMNoParams); message CM_PARENTCOLORCHANGED;
    procedure Loaded; override;
    property ColorFocused: TColor index 0 read FFocusedColor write SetColors default clWhite;
    property ColorBorder: TColor index 1 read FBorderColor write SetColors default DefaultBorderColor;
    property ColorFlat: TColor index 2 read FFlatColor write SetColors default DefaultFlatColor;
    property ParentColor: Boolean read FParentColor write SetParentColor default false;
    property ParentFont default True;
    property AutoSize default False;
    property Ctl3D default False;
    property BorderStyle default bsNone;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property ItemsCount: Integer read GetItemsCount;
  end;

  { TFlatTreeView }
  TFlatTreeView = class(TDefineTreeView)
  published
    property ColorFocused;
    property ColorBorder;
    property ColorFlat;
    property ParentColor;
    property Anchors;
    property AutoExpand;
    property BiDiMode;
    property ChangeDelay;
    property Constraints;
    property DragKind;
    property HotTrack;
    property Images;
    property Indent;
    property MultiSelect;
    property MultiSelectStyle;
    property ParentBiDiMode;
    property RightClickSelect;
    property RowSelect;
    property ShowButtons;
    property ShowLines;
    property ShowRoot;
    property SortType;
    property StateImages;
    property ToolTips;
    property Align;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;

    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
    property OnAddition;
    property OnAdvancedCustomDraw;
    property OnAdvancedCustomDrawItem;
    property OnChanging;
    property OnCollapsed;
    property OnCollapsing;
    property OnCompare;
    property OnContextPopup;
    property OnCreateNodeClass;
    property OnCustomDraw;
    property OnCustomDrawItem;
    property OnDeletion;
    property OnEdited;
    property OnEditing;
    property OnEndDock;
    property OnExpanding;
    property OnExpanded;
    property OnGetImageIndex;
    property OnGetSelectedIndex;
    property OnStartDock;
    { Items must be published after OnGetImageIndex and OnGetSelectedIndex }
    property Items;
  end;

  TDrawTitleEvent = procedure (Cnvs: TCanvas; Column: TListColumn;
                               Pressed: Boolean; R: TRect) of object;

  TDefineListView = class(TVersionListView)
  private
    FHeaderHandle: HWND;
    FHeaderInstance: Pointer;
    FDefHeaderProc: Pointer;
    FActiveSection: Integer;
    FHeaderDown: Boolean;
    FParentColor: Boolean;
    FFocusedColor: TColor;
    FBorderColor: TColor;
    FFlatColor: TColor;
    FMouseIn: Boolean;
    FOnDrawTitle: TDrawTitleEvent;
    FTitleFaceColor: TColor;
    FTitleCheckColor: TColor;
    FGroundPic: TPicture;
    FGroundHas: Boolean;
    FOnDrawBackground: TLVCustomDrawEvent;
    FGroundStretch: Boolean;
    FAllCheck: Boolean;
    procedure SetColors(Index: Integer; Value: TColor);
    procedure SetParentColor(Value: Boolean);
    function  GetColumnCount: Integer;
    function  GetItemsCount: Integer;
    procedure SetGroundPic(const Value: TPicture);
    procedure SetGroundHas(const Value: Boolean);
    function  GetHeaderHeight: Integer;
    procedure SetGroundStretch(const Value: Boolean);
    procedure SetAllCheck(const Value: Boolean);
  protected
    FCheckInBox: Boolean;
    procedure RedrawBorder(const Clip: HRGN = 0);
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMParentColorChanged(var Message: TWMNoParams); message CM_PARENTCOLORCHANGED;
    procedure HeaderWndProc(var Message: TMessage);
    procedure DrawTitle(Cnvs: TCanvas; Column: TListColumn; Active, Pressed: Boolean; R: TRect);
    procedure DrawHeader(DC: HDC);
    procedure WndProc(var Message: TMessage); override;
    procedure DrawBackground(Sender: TCustomListView; const ARect: TRect; var DefaultDraw: Boolean);
    procedure Loaded; override;
    function  GetHeaderSectionRect(Index: Integer): TRect;
    property HeaderHeight: Integer read GetHeaderHeight;
    property ColorFocused: TColor index 0 read FFocusedColor write SetColors default clWhite;
    property ColorBorder: TColor index 1 read FBorderColor write SetColors default DefaultBorderColor;
    property ColorFlat: TColor index 2 read FFlatColor write SetColors default DefaultFlatColor;
    property ColorTitleFace: TColor index 3 read FTitleFaceColor write SetColors default DefaultTitleFaceColor;
    property ColorTitleCheck: TColor index 4 read FTitleCheckColor write SetColors default DefaultTitleCheckColor;
    property ParentColor: Boolean read FParentColor write SetParentColor default false;
    property GroundHas: Boolean read FGroundHas write SetGroundHas default false;
    property GroundPic: TPicture read FGroundPic write SetGroundPic;
    property GroundStretch: Boolean read FGroundStretch write SetGroundStretch default false;
    property OnDrawBackground: TLVCustomDrawEvent read FOnDrawBackground write FOnDrawBackground;
    property OnDrawTitle: TDrawTitleEvent read FOnDrawTitle write FOnDrawTitle;
    property ParentFont default True;
    property AutoSize default False;
    property Ctl3D default False;
    property BorderStyle default bsNone;
    property FlatScrollBars default true;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property AllCheck: Boolean read FAllCheck write SetAllCheck default false;
    property ColCount: Integer read GetColumnCount;
    property ItemCount: Integer read GetItemsCount;
  end;

  { TFlatListView }

  TFlatListView = class(TDefineListView)
  published
    property ColorFocused;
    property ColorBorder;
    property ColorFlat;
    property ColorTitleFace;
    property ColorTitleCheck;
    property GroundHas;
    property GroundPic;
    property GroundStretch;
    property Action;
    property Align;
    property AllocBy;
    property Anchors;
    property Checkboxes;
    property Columns;
    property ColumnClick;
    property Enabled;
    property Font;
    property FlatScrollBars;
    property FullDrag;
    property GridLines;
    property HideSelection;
    property HotTrack;
    property HotTrackStyles;
    property HoverTime;
    property IconOptions;
    property Items;
    property LargeImages;
    property MultiSelect;
    property OwnerData;
    property OwnerDraw;
    property ReadOnly default False;
    property RowSelect;
    property ParentBiDiMode;
    property ParentColor default False;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowColumnHeaders;
    property ShowWorkAreas;
    property ShowHint;
    property SmallImages;
    property SortType;
    property StateImages;
    property TabOrder;
    property TabStop default True;
    property ViewStyle;
    property Visible;
    property OnAdvancedCustomDraw;
    property OnAdvancedCustomDrawItem;
    property OnAdvancedCustomDrawSubItem;
    property OnDrawTitle;
    property OnChange;
    property OnChanging;
    property OnClick;
    property OnColumnClick;
    property OnColumnDragged;
    property OnColumnRightClick;
    property OnCompare;
    property OnContextPopup;
    //property OnCustomDraw;
    property OnDrawBackground;
    property OnCustomDrawItem;
    property OnCustomDrawSubItem;
    property OnData;
    property OnDataFind;
    property OnDataHint;
    property OnDataStateChange;
    property OnDblClick;
    property OnDeletion;
    property OnDrawItem;
    property OnEdited;
    property OnEditing;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGetImageIndex;
    property OnGetSubItemImage;
    property OnDragDrop;
    property OnDragOver;
    property OnInfoTip;
    property OnInsert;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnSelectItem;
    property OnStartDock;
    property OnStartDrag;
  end;

implementation

{ TDefineTreeView }
constructor TDefineTreeView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle  := ControlStyle - [csOpaque];
  ParentFont     := True;
  AutoSize       := False;
  Ctl3D          := False;
  BorderStyle    := bsNone;
  Width          := 185;
  Height         := 89;
  FFocusedColor  := clWhite;
  FBorderColor   := DefaultBorderColor;
  FFlatColor     := DefaultFlatColor;
  FParentColor   := True;
  FInterDrawing  := False;
end;

destructor TDefineTreeView.Destroy;
begin
  inherited Destroy;
end;

procedure TDefineTreeView.SetParentColor(Value: Boolean);
begin
  if Value <> FParentColor then
  begin
    FParentColor := Value;
    if FParentColor then
    begin
      if Parent <> nil then
        FFlatColor := TForm(Parent).Color;
      RedrawBorder;
    end;
  end;
end;

procedure TDefineTreeView.CMSysColorChange(var Message: TMessage);
begin
  if FParentColor then
  begin
      if Parent <> nil then
         FFlatColor := TForm(Parent).Color;
  end;
  RedrawBorder;
end;

procedure TDefineTreeView.CMParentColorChanged(var Message: TWMNoParams);
begin
  if FParentColor then
  begin
      if Parent <> nil then
         FFlatColor := TForm(Parent).Color;
  end;
  RedrawBorder;
end;

procedure TDefineTreeView.SetColors(Index: Integer; Value: TColor);
begin
  case Index of
    0: FFocusedColor := Value;
    1: FBorderColor := Value;
    2: begin
       FFlatColor := Value;
       FParentColor := False;
       end;
  end;
  RedrawBorder;
end;

procedure TDefineTreeView.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if (GetActiveWindow <> 0) then
  begin
    FMouseIn := True;
    RedrawBorder;
  end;
end;

procedure TDefineTreeView.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  FMouseIn := False;
  RedrawBorder;
end;

procedure TDefineTreeView.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  RedrawBorder;
end;

procedure TDefineTreeView.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  if not(csDesigning in ComponentState) then
    RedrawBorder;
end;

procedure TDefineTreeView.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  if not(csDesigning in ComponentState) then
    RedrawBorder;
end;

procedure TDefineTreeView.WMNCCalcSize(var Message: TWMNCCalcSize);
begin
  inherited;
  InflateRect(Message.CalcSize_Params^.rgrc[0], -1, -1);
end;

procedure TDefineTreeView.WMNCPaint(var Message: TMessage);
begin
  inherited;
  RedrawBorder(HRGN(Message.WParam));
end;

procedure TDefineTreeView.RedrawBorder(const Clip: HRGN = 0);
var ViewBorder:TBorderAttrib;
begin
  with ViewBorder do
  begin
    Ctrl := Self;
    BorderColor := ColorBorder;
    if Enabled then
    begin
       FlatColor   := ColorFlat;
       FocusColor  := ColorFocused;
    end
    else
    begin
       FlatColor   := clSilver;
       FocusColor  := clSilver;
    end;
    MouseState  := FMouseIn;
    DesignState := ComponentState;
    FocusState  := Focused;
    HasBars     := False;
  end;
  Color := DrawViewBorder(ViewBorder);
end;

function TDefineTreeView.GetItemsCount: Integer;
begin
  result := inherited Items.Count;
end;

procedure TDefineTreeView.Loaded;
begin
  inherited;
end;

{ TDefineListView }

constructor TDefineListView.Create(AOwner: TComponent);
begin
  FHeaderInstance := MakeObjectInstance(HeaderWndProc);
  FGroundPic      := TPicture.Create;
  inherited Create(AOwner);
  ParentFont         := True;
  AutoSize           := False;
  Ctl3D              := False;
  BorderStyle        := bsNone;
  FlatScrollBars     := True;
  Width              := 185;
  Height             := 89;
  FFocusedColor      := clWhite;
  FBorderColor       := DefaultBorderColor;
  FFlatColor         := DefaultFlatColor;
  FTitleFaceColor    := DefaultTitleFaceColor;
  FTitleCheckColor   := DefaultTitleCheckColor;
  FParentColor       := True;
  FGroundHas         := False;
  FGroundStretch     := False;
  FAllCheck          := False;
  FHeaderHandle      := 0;
  FDefHeaderProc     := nil;
end;

destructor TDefineListView.Destroy;
begin
  if FHeaderHandle <> 0 then
     SetWindowLong(FHeaderHandle, GWL_WNDPROC, LongInt(FDefHeaderProc));
  FreeObjectInstance(FHeaderInstance);
  FHeaderHandle  := 0;
  FDefHeaderProc := nil;
  FGroundPic.Free;
  FGroundPic     := nil;
  OnCustomDraw   := nil;
  inherited Destroy;
end;

procedure DrawFrame(Canvas: TCanvas; var Rect: TRect; BorderColor, FaceColor: TColor;
  Width: Integer);

  procedure DoRect;
  begin
    with Canvas, Rect do
    begin
      Pen.Color := BorderColor;
      MoveTo(Left,Top);
      LineTo(Left,Bottom);
      Pen.Color := FaceColor;
      MoveTo(Left,Bottom);
      LineTo(Right,Bottom);
      MoveTo(Left,Top);
      LineTo(Right,Top);  
    end;
  end;

begin
  Canvas.Pen.Width := 1;
  inc(Rect.Left);
  Dec(Rect.Bottom); Dec(Rect.Right);
  while Width > 0 do
  begin
    Dec(Width);
    DoRect;
    InflateRect(Rect, -1, -1);
  end;
  Inc(Rect.Bottom); Inc(Rect.Right);
  dec(Rect.Left);
end;

procedure TDefineListView.DrawTitle(Cnvs: TCanvas; Column: TListColumn; Active, Pressed: Boolean; R: TRect);
var
  BR, RA, CR: TRect;
  S: String;
  B: TBitMap;
  TX, TY, GX, GY: Integer;
begin
 if (RectWidth(R) <= 0) or (RectHeight(R) <= 0) then Exit;
 S := Column.Caption;
 B := TBitMap.Create;
 try
  B.Width  := RectWidth(R)+1;
  B.Height := RectHeight(R);
  BR := Rect(0, 0, B.Width, B.Height);
  with B.Canvas do
  begin
    if Pressed then begin
      if (not FCheckInBox)and(ColumnClick) then
         Brush.Color := BS_XP_BTNDOWNCOLOR
      else
         Brush.Color := FTitleFaceColor;
      if not(Column.Index = 0) then
         Inc(Br.Left);
      Dec(Br.Right);
    end else if Active then begin
       if (not FCheckInBox)and(ColumnClick) then
         Brush.Color := BS_XP_BTNACTIVECOLOR
       else
         Brush.Color := FTitleFaceColor;
    end else begin
       DrawFrame(B.Canvas, BR, FTitleFaceColor, FTitleFaceColor, 1);
       Brush.Color := FTitleFaceColor;// clBtnFace;
    end;
    FillRect(BR);
    if (Column.Index = 0)and(CheckBoxes) then
    begin
     RA := RECT(0,0,HeaderHeight,HeaderHeight);
     FillRect(RA);
     CR := RECT(RA.Left+1,RA.Top+1,RA.Right-1,RA.Bottom-1);
     // »­Ñ¡¶¨
     if AllCheck then
     begin
      DrawInCheck(B.Canvas,CR,FTitleCheckColor);
     end;
     BR := RECT(RA.Right+2,BR.Top,BR.Right,BR.Bottom);
    end;
    Frame3d(B.Canvas, CR, FTitleCheckColor, FTitleCheckColor, 2);
    Brush.Style := bsClear;
    Font.Assign(Self.Font);
    Font.Color  := clBtnText;
  end;
  if Assigned(FOnDrawTitle) then
     FOnDrawTitle(B.Canvas, Column, Pressed, Rect(0, 0, B.Width, B.Height))
  else with B.Canvas do begin
    Brush.Style := bsClear;
    Inc(BR.Left, 2); Dec(BR.Right, 2);
    if (SmallImages <> nil) and (Column.ImageIndex >= 0) and
       (Column.ImageIndex < SmallImages.Count) then
    begin
        CorrectTextbyWidth(B.Canvas, S, RectWidth(BR) - 4 - SmallImages.Width);
        GX := BR.Left;
        if S = Column.Caption then
         case Column.Alignment of
           taRightJustify: GX := BR.Right - TextWidth(S) - SmallImages.Width - 4;
                 taCenter: GX := BR.Left + RectWidth(BR) div 2 - (TextWidth(S) + SmallImages.Width + 4) div 2;
         end;
        TX := GX + SmallImages.Width + 4;
        TY := BR.Top + (RectHeight(BR) - TextHeight(S)) div 2;
        GY := BR.Top + (RectHeight(BR) - SmallImages.Height) div 2;
        SmallImages.Draw(B.Canvas, GX, GY, Column.ImageIndex, True);
    end else begin
        CorrectTextbyWidth(B.Canvas, S, RectWidth(BR));
        TX := BR.Left;
        TY := BR.Top + (RectHeight(BR) - TextHeight(S)) div 2;
        case Column.Alignment of
            taRightJustify: TX := BR.Right - TextWidth(S);
                  taCenter: TX := (RectWidth(BR) - TextWidth(S) + 4) div 2;
        end;
    end;
    TextRect(BR, TX, TY, S);
  end;
  Cnvs.Draw(R.Left, R.Top, B);
 finally
  B.Free;
 end;

end;

function TDefineListView.GetHeaderSectionRect(Index: Integer): TRect;
var
  SectionOrder: array of Integer;
  R: TRect;
begin
  if Self.FullDrag then
  begin
      SetLength(SectionOrder, Columns.Count);
      Header_GetOrderArray(FHeaderHandle, Columns.Count, PInteger(SectionOrder));
      Header_GETITEMRECT(FHeaderHandle, SectionOrder[Index] , @R);
  end else
      Header_GETITEMRECT(FHeaderHandle, Index, @R);
  Result := R;
end;

procedure TDefineListView.DrawHeader(DC: HDC);
var
  Cnvs: TControlCanvas;
  i, RightOffset, HeaderCount: Integer;
  R, BGR, HR: TRect;
  PS: TPaintStruct;
begin
  Cnvs := TControlCanvas.Create;
  try
    Cnvs.Handle := BeginPaint(FHeaderHandle, PS);
    HeaderCount := Header_GetItemCount(FHeaderHandle);
    RightOffset := 0;
    for i := 0 to HeaderCount - 1 do begin
        R := GetHeaderSectionRect(i);
        DrawTitle(Cnvs, Columns[i], False, (FActiveSection = I) and FHeaderDown, R);
        if RightOffset < R.Right then RightOffset := R.Right;
    end;
    GetWindowRect(FHeaderHandle, HR);
    BGR := Rect(RightOffset+1, 0, RectWidth(HR), RectHeight(HR));
    if BGR.Left < BGR.Right then begin
       Cnvs.Brush.Color := FTitleFaceColor;//clBtnFace;
       Cnvs.FillRect(BGR);
       DrawFrame(Cnvs, BGR, FTitleFaceColor, FTitleFaceColor, 1);
    end;;
  finally
    Cnvs.Free;
    EndPaint(FHeaderHandle, PS)
  end;
end;

procedure TDefineListView.HeaderWndProc(var Message: TMessage);
var
  X, Y: Integer;

 procedure GetSectionFromPoint(P: TPoint);
 var
  i: Integer;
  R,RA,BR: TRect;
 begin
  FActiveSection := -1;
  RA   := RECT(0,0,HeaderHeight,HeaderHeight);
  for i := 0 to Columns.Count - 1 do
  begin
    R := GetHeaderSectionRect(i);
    FCheckInBox := False;
    if i = 0 then
    begin
       BR := Rect(RA.Right,R.Top,R.Right,R.Bottom);
       if PtInRect(RA, Point(X, Y)) then
       begin
          FActiveSection := i;
          FCheckInBox    := True;
          Break;
       end
       else if PtInRect(BR, Point(X, Y)) then
       begin
          FActiveSection := i;
          Break;
       end;
    end else begin
     if PtInRect(R, Point(X, Y)) then
     begin
       FActiveSection := i;
       Break;
     end;
    end;
  end;
 end;

var
  Info: THDHitTestInfo;
begin
  with Message do begin
   case Msg of
      WM_WINDOWPOSCHANGING :
      begin
       with TWMWINDOWPOSCHANGING(Message) do
            WindowPos.cx := WindowPos.cx + 4;
      end;
      WM_PAINT:DrawHeader(TWMPAINT(Message).DC);
      WM_ERASEBKGND : result := 1;
   else
      Result := CallWindowProc(FDefHeaderProc, FHeaderHandle, Msg, WParam, LParam);
   end;
   case Msg of
      WM_LBUTTONDOWN:
      begin
        X := TWMLBUTTONDOWN(Message).XPos;
        Y := TWMLBUTTONDOWN(Message).YPos;
        GetSectionFromPoint(Point(X, Y));
        Info.Point.X := X;
        Info.Point.Y := Y;
        SendMessage(FHeaderHandle, HDM_HITTEST, 0, Integer(@Info));
        FHeaderDown := not (Info.Flags = HHT_ONDIVIDER);
        if FCheckInBox then SetAllCheck(not FAllCheck);
        RedrawWindow(FHeaderHandle, nil, 0, RDW_INVALIDATE);
      end;
    WM_LBUTTONUP:
      begin
        FHeaderDown := False;
        FActiveSection := -1;
        RedrawWindow(FHeaderHandle, nil, 0, RDW_INVALIDATE);
      end;
   end;
  end;
end;

procedure TDefineListView.WndProc(var Message: TMessage);
var WndClass: String;
begin
  case Message.Msg of
    WM_PARENTNOTIFY:
       with TWMPARENTNOTIFY(Message) do
       begin
         SetLength(WndClass, 80);
         SetLength(WndClass, GetClassName(ChildWnd, PChar(WndClass), Length(WndClass)));
         if (Event = WM_CREATE) and (FHeaderHandle <> 0) and ShowColumnHeaders and
            (WndClass = 'SysHeader32') then
         begin
             SetWindowLong(FHeaderHandle, GWL_WNDPROC, LongInt(FDefHeaderProc));
             FHeaderHandle := 0;
         end;

         if (Event = WM_CREATE) and (FHeaderHandle = 0) and ShowColumnHeaders and
            (WndClass = 'SysHeader32') then
         begin
             FHeaderHandle := ChildWnd;
             FDefHeaderProc := Pointer(GetWindowLong(FHeaderHandle, GWL_WNDPROC));
             SetWindowLong(FHeaderHandle, GWL_WNDPROC, LongInt(FHeaderInstance));
         end;
        end; 
    WM_HSCROLL,
    WM_VSCROLL: if (GroundHas) then InvalidateRect(Handle, nil, False);
  end;
  inherited;
end;

procedure TDefineListView.RedrawBorder(const Clip: HRGN = 0);
var ViewBorder:TBorderAttrib;
    clColor:TColor;
begin
  with ViewBorder do
  begin
    Ctrl := Self;
    BorderColor := ColorBorder;
    if Enabled then
    begin
       FlatColor   := ColorFlat;
       FocusColor  := ColorFocused;
    end
    else
    begin
       FlatColor   := clSilver;
       FocusColor  := clSilver;
    end;
    MouseState  := FMouseIn;
    DesignState := ComponentState;
    FocusState  := Focused;
    HasBars     := False;
  end;
  clColor := DrawViewBorder(ViewBorder);
  if ((GroundPic.Graphic <> nil) and GroundHas) then
     Color := clNone
  else if Assigned(OnCustomDraw) then
     Color := clNone
  else   
     Color := clColor;
end;

procedure TDefineListView.SetParentColor(Value: Boolean);
begin
  if Value <> FParentColor then
  begin
    FParentColor := Value;
    if FParentColor then
    begin
      if Parent <> nil then
         FFlatColor := TForm(Parent).Color;
    end;
    RedrawBorder;
  end;
end;

procedure TDefineListView.CMSysColorChange(var Message: TMessage);
begin
  if FParentColor then
  begin
      if Parent <> nil then
        FFlatColor := TForm(Parent).Color;
  end;
  RedrawBorder;      
end;

procedure TDefineListView.CMParentColorChanged(var Message: TWMNoParams);
begin
  if FParentColor then
  begin
      if Parent <> nil then
        FFlatColor := TForm(Parent).Color;
  end;
  RedrawBorder;
end;

procedure TDefineListView.SetColors(Index: Integer; Value: TColor);
begin
  case Index of
    0: FFocusedColor := Value;
    1: FBorderColor  := Value;
    2: begin
          FFlatColor    := Value;
          FParentColor  := False;
       end;
    3: if FTitleFaceColor <> Value then
       begin
          FTitleFaceColor   := Value;
          RedrawWindow(FHeaderHandle, nil, 0, RDW_INVALIDATE);
       end;
    4: if FTitleCheckColor <> Value then
       begin
          FTitleCheckColor   := Value;
          RedrawWindow(FHeaderHandle, nil, 0, RDW_INVALIDATE);
       end;
  end;
  RedrawBorder;
end;

procedure TDefineListView.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if (GetActiveWindow <> 0) then
  begin
    FMouseIn := True;
    RedrawBorder;
  end;
end;

procedure TDefineListView.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  FMouseIn := False;
  RedrawBorder;
end;

procedure TDefineListView.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  RedrawBorder;
end;

procedure TDefineListView.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  if not(csDesigning in ComponentState) then
    RedrawBorder;
end;

procedure TDefineListView.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  if not(csDesigning in ComponentState) then
    RedrawBorder;
end;

procedure TDefineListView.WMNCCalcSize(var Message: TWMNCCalcSize);
begin
  inherited;
  InflateRect(Message.CalcSize_Params^.rgrc[0], -1, -1);
end;

procedure TDefineListView.WMNCPaint(var Message: TMessage);
begin
  inherited;
  RedrawBorder(HRGN(Message.WParam));
end;

function TDefineListView.GetColumnCount: Integer;
begin
  result := inherited Columns.Count;
end;

function TDefineListView.GetItemsCount: Integer;
begin
  result := inherited Items.Count;
end;

procedure TDefineListView.SetGroundPic(const Value: TPicture);
begin
  FGroundPic.Assign(Value);
  if FGroundPic.Graphic = nil then
     FGroundHas := false;
  RedrawBorder;
  Invalidate;
end;

procedure TDefineListView.DrawBackground(Sender: TCustomListView; const ARect: TRect; var DefaultDraw: Boolean);
var
  x,y:integer;
  R:TRect;
begin
  if GroundPic.Graphic <> nil then
  begin
   with Canvas, ClientRect do
   begin
    Lock;
    R := Rect(Left, Top + HeaderHeight, Right, Bottom);
    if not GroundStretch then
    begin
      x:=0; y:=HeaderHeight;
      while x < Width do
      begin
       while y < Height do
       begin
        Draw(x, y, GroundPic.Graphic);
        y := y + GroundPic.Height;
       end;
       x := x + GroundPic.Width;
       y := HeaderHeight;
      end;
    end else begin
      StretchDraw(R, GroundPic.Graphic);
    end;
    SetBkMode(Handle, TRANSPARENT);
    Unlock;
   end;
   Perform(LVM_SETTEXTBKCOLOR, 0, LongInt(CLR_NONE));
   ListView_SetBKColor(Handle, CLR_NONE);
  end;
end;

procedure TDefineListView.SetGroundHas(const Value: Boolean);
begin
  FGroundHas := Value;
  if FGroundHas and (FGroundPic.Graphic <> nil) then
     OnCustomDraw := DrawBackground
  else if not(csDesigning in ComponentState) then
     OnCustomDraw := FOnDrawBackground
  else begin
     OnCustomDraw := Nil;
  end;
  RedrawBorder;
  Invalidate;
end;

procedure TDefineListView.Loaded;
begin
  inherited;
  if (GroundHas)and(GroundPic.Graphic <> nil) then
      OnCustomDraw := DrawBackground
  else
      OnCustomDraw := OnDrawBackground;
end;

function TDefineListView.GetHeaderHeight: Integer;
begin
  result := RectHeight(GetHeaderSectionRect(0));
  if not (ShowColumnHeaders and (ViewStyle = vsReport)) then
     result := 0;
end;

procedure TDefineListView.SetGroundStretch(const Value: Boolean);
begin
  if FGroundStretch <> value then
  begin
     FGroundStretch := Value;
     RedrawBorder;
     Invalidate;
  end;
end;

procedure TDefineListView.WMPaint(var Message: TWMPaint);
begin
  inherited;
  RedrawWindow(FHeaderHandle, nil, 0, RDW_INVALIDATE);
end;

procedure TDefineListView.SetAllCheck(const Value: Boolean);
var
  inx : integer;
begin
  if FAllCheck <> Value then
  begin
     FAllCheck := Value;
     for inx:=0 to Items.Count - 1 do
         Items.Item[inx].Checked := FAllCheck;
  end;
end;

end.
