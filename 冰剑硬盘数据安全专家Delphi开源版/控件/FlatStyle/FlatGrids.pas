{******************************************************************}
{ 经典的dbgrid控件,增加列排序功能,增加隔行背景色. xdywdy修改完成   }                                    
{******************************************************************}
unit FlatGrids;

{$I FlatStyle.inc}

interface

uses
  Windows, SysUtils, Messages, Classes, Controls, Forms, StdCtrls,
  Graphics, Grids, DBGrids, FlatUtils;

type
  TFlatDBGrid = class(TVersionDBGrid)
  private
    FSingleColor: TColor;
    FDoubleColor: TColor;
    FDbBgColor: boolean;
    OldGridWnd : TWndMethod;
    FParentColor: Boolean;
    FFocusColor: TColor;
    FBorderColor: TColor;
    FFlatColor: TColor;
    FMouseIn: Boolean;
    FLinesColor: TColor;
    procedure SetColors(Index: Integer; Value: TColor);
    procedure SetParentColor(Value: Boolean);
    procedure NewGridWnd (var Message : TMessage);
    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
    procedure SetDbBgColor(const Value: boolean);
  protected
    procedure DrawColumnCell(const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState); override;
    procedure RedrawBorder (const Clip: HRGN = 0);
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMParentColorChanged(var Message: TWMNoParams); message CM_PARENTCOLORCHANGED;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect;
      AState: TGridDrawState); override;
  public
    constructor Create(AOwner: TComponent); override;
    property Canvas;
    property SelectedRows;
  published
    property DbBgColor :Boolean read FDbBgColor Write SetDbBgColor default true;
    property ColorFocused: TColor index 0 read FFocusColor write SetColors default clWhite;
    property ColorBorder: TColor index 1 read FBorderColor write SetColors default DefaultBorderColor;
    property ColorFlat: TColor index 2 read FFlatColor write SetColors default DefaultFlatColor;
    property ColorLines: TColor index 3 read FLinesColor write SetColors default DefaultBorderColor;
    property ColorRowSingle :TColor index 4 read FSingleColor Write SetColors default clWhite;
    property ColorRowDouble :TColor index 5 read FDoubleColor Write SetColors default clWhite;
    property ParentColor: Boolean read FParentColor write SetParentColor default false;
    property Align;
    property Anchors;
    property BiDiMode;
    property Columns stored False; //StoreColumns;
    property Constraints;
    property DataSource;
    property DefaultDrawing;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property FixedColor;
    property Font;
    property ImeMode;
    property ImeName;
    property Options;
    property ParentBiDiMode;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property TitleFont;
    property Visible;
    property OnCellClick;
    property OnColEnter;
    property OnColExit;
    property OnColumnMoved;
    property OnDrawDataCell;  { obsolete }
    property OnDrawColumnCell;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditButtonClick;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
    property OnTitleClick;
  end;

  TFlatDrawGrid = class(TVersionDrawGrid)
  private
    FParentColor: Boolean;
    FFocusColor: TColor;
    FBorderColor: TColor;
    FFlatColor: TColor;
    FMouseIn: Boolean;
    FLinesColor: TColor;
    procedure SetColors(Index: Integer; Value: TColor);
    procedure SetParentColor(Value: Boolean);
  protected
    procedure RedrawBorder (const Clip: HRGN = 0);
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMParentColorChanged(var Message: TWMNoParams); message CM_PARENTCOLORCHANGED;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect;
      AState: TGridDrawState); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property ColorFocused: TColor index 0 read FFocusColor write SetColors default clWhite;
    property ColorBorder: TColor index 1 read FBorderColor write SetColors default DefaultBorderColor;
    property ColorFlat: TColor index 2 read FFlatColor write SetColors default DefaultFlatColor;
    property ColorLines: TColor index 3 read FLinesColor write SetColors default DefaultBorderColor;
    property ParentColor: Boolean read FParentColor write SetParentColor default false;
    property Align;
    property Anchors;
    property BiDiMode;
    property ColCount;
    property Constraints;
    property DefaultColWidth;
    property DefaultRowHeight;
    property DefaultDrawing;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property FixedColor;
    property FixedCols;
    property RowCount;
    property FixedRows;
    property Font;
    property Options;
    property ParentBiDiMode;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ScrollBars;
    property ShowHint;
    property TabOrder;
    property Visible;
    property VisibleColCount;
    property VisibleRowCount;
    property OnClick;
    property OnColumnMoved;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawCell;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGetEditMask;
    property OnGetEditText;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnRowMoved;
    property OnSelectCell;
    property OnSetEditText;
    property OnStartDock;
    property OnStartDrag;
    property OnTopLeftChanged;
  end;
  TFlatStringGrid = class;

  TFlatGridStrings = class(TStrings)
  private
    FGrid: TFlatStringGrid;
    FIndex: Integer;
    procedure CalcXY(Index: Integer; var X, Y: Integer);
  protected
    function Get(Index: Integer): string; override;
    function GetCount: Integer; override;
    function GetObject(Index: Integer): TObject; override;
    procedure Put(Index: Integer; const S: string); override;
    procedure PutObject(Index: Integer; AObject: TObject); override;
    procedure SetUpdateState(Updating: Boolean); override;
  public
    constructor Create(AGrid: TFlatStringGrid; AIndex: Longint);
    function Add(const S: string): Integer; override;
    procedure Assign(Source: TPersistent); override;
    procedure Clear; override;
    procedure Delete(Index: Integer); override;
    procedure Insert(Index: Integer; const S: string); override;
  end;

  TFlatStringGrid = class(TFlatDrawGrid)
  private
    FData: Pointer;
    FRows: Pointer;
    FCols: Pointer;
    FUpdating: Boolean;
    FNeedsUpdating: Boolean;
    FEditUpdate: Integer;
    procedure DisableEditUpdate;
    procedure EnableEditUpdate;
    procedure Initialize;
    procedure Update(ACol, ARow: Integer); reintroduce;
    procedure SetUpdateState(Updating: Boolean);
    function GetCells(ACol, ARow: Integer): string;
    function GetCols(Index: Integer): TStrings;
    function GetObjects(ACol, ARow: Integer): TObject;
    function GetRows(Index: Integer): TStrings;
    procedure SetCells(ACol, ARow: Integer; const Value: string);
    procedure SetCols(Index: Integer; Value: TStrings);
    procedure SetObjects(ACol, ARow: Integer; Value: TObject);
    procedure SetRows(Index: Integer; Value: TStrings);
    function EnsureColRow(Index: Integer; IsCol: Boolean): TFlatGridStrings;
    function EnsureDataRow(ARow: Integer): Pointer;
  protected
    procedure ColumnMoved(FromIndex, ToIndex: Longint); override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect;
      AState: TGridDrawState); override;
    function GetEditText(ACol, ARow: Longint): string; override;
    procedure SetEditText(ACol, ARow: Longint; const Value: string); override;
    procedure RowMoved(FromIndex, ToIndex: Longint); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Cells[ACol, ARow: Integer]: string read GetCells write SetCells;
    property Cols[Index: Integer]: TStrings read GetCols write SetCols;
    property Objects[ACol, ARow: Integer]: TObject read GetObjects write SetObjects;
    property Rows[Index: Integer]: TStrings read GetRows write SetRows;
  end;

implementation

uses RTLConsts;

{ TFlatDBGrid }

constructor TFlatDBGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FSingleColor    := clWhite;
  FDoubleColor    := clWhite;//$00FFF0E1;
  OldGridWnd      := self.WindowProc ;
  self.WindowProc := NewGridWnd;
  fDBBGColor      := True;
  BorderStyle   := bsNone;
  FFocusColor   := clWhite;
  FBorderColor  := DefaultBorderColor;
  FLinesColor   := DefaultBorderColor;
  FFlatColor    := DefaultFlatColor;
  FParentColor  := True;
  FMouseIn      := False;
end;

procedure TFlatDBGrid.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     Self.DataSource.DataSet.MoveBy(1)
   else
     Self.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TFlatDBGrid.DrawColumnCell(const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if GdSelected in State then  exit;
  if DbBgColor then
  begin
   if DataSource.DataSet.RecNo mod 2<>0 then
      Canvas.Brush.Color := FSingleColor   //读取单横颜色值。。。
   else
      Canvas.Brush.Color := FDoubleColor; // 读取双横颜色值。$00F7E7E7。。
  end;
  DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TFlatDBGrid.SetDbBgColor(const Value: boolean);
begin
  FDbBgColor := Value;
  repaint;
end;

procedure TFlatDBGrid.WMVScroll(var Message: TWMVScroll);
var
  SI: TScrollInfo;
begin
inherited;
  if Datalink.Active then
    with Message, DataLink.DataSet do
      case ScrollCode of
        SB_THUMBPOSITION:
          begin
            if IsSequenced then
            begin
              SI.cbSize := sizeof(SI);
              SI.fMask := SIF_ALL;
              SetScrollPos(self.Handle,SB_VERT,Pos,True);    //强行设定滚动条的位置
              GetScrollInfo(Self.Handle, SB_VERT, SI);
              if SI.nTrackPos <= 1 then First
              else if SI.nTrackPos >= RecordCount then Last
              else RecNo := SI.nTrackPos;
            end
            else
              case Pos of
                0: First;
                1: MoveBy(-VisibleRowCount);
                2: Exit;
                3: MoveBy(VisibleRowCount);
                4: Last;
              end;
          end;
      end;
end;

procedure TFlatDBGrid.RedrawBorder(const Clip: HRGN);
var
  Attrib:TBorderAttrib;
begin
  with Attrib do
  begin
   Ctrl        := self;
   FocusColor  := ColorFocused;
   BorderColor := ColorBorder;
   FlatColor   := ColorFlat;
   MouseState  := FMouseIn;
   FocusState  := Focused;
   DesignState := ComponentState;
   HasBars     := ScrollBars = ssBoth;
  end;
  Color := DrawEditBorder(Attrib,Clip);
end;

procedure TFlatDBGrid.SetParentColor(Value: Boolean);
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

procedure TFlatDBGrid.CMSysColorChange(var Message: TMessage);
begin
    if (Parent <> nil)and(FParentColor) then
      FFlatColor := TForm(Parent).Color;
    RedrawBorder;
end;

procedure TFlatDBGrid.CMParentColorChanged(var Message: TWMNoParams);
begin
    if (Parent <> nil)and(FParentColor) then
       FFlatColor := TForm(Parent).Color;
    RedrawBorder;
end;

procedure TFlatDBGrid.SetColors(Index: Integer; Value: TColor);
begin
  case Index of
    0: FFocusColor    := Value;
    1: FBorderColor   := Value;
    2: begin
         FFlatColor   := Value;
         FParentColor := False;
       end;
    3: FLinesColor    := Value;
    4: FSingleColor   := Value;
    5: FDoubleColor   := Value;
  end;
  Repaint;
  RedrawBorder;
end;

procedure TFlatDBGrid.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if (GetActiveWindow <> 0) then
  begin
    FMouseIn := True;
    RedrawBorder;
  end;
end;

procedure TFlatDBGrid.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  FMouseIn := False;
  RedrawBorder;
end;

procedure TFlatDBGrid.CMEnabledChanged(var Message: TMessage);
const
  EnableColors: array[Boolean] of TColor = (clBtnFace, clWindow);
begin
  inherited;
  Color := EnableColors[Enabled];
  RedrawBorder;
end;

procedure TFlatDBGrid.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  if not(csDesigning in ComponentState) then
     RedrawBorder;
end;

procedure TFlatDBGrid.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  if not(csDesigning in ComponentState) then
     RedrawBorder;
end;

procedure TFlatDBGrid.WMNCCalcSize(var Message: TWMNCCalcSize);
begin
  inherited;
  InflateRect(Message.CalcSize_Params^.rgrc[0], -3, -3);
end;

procedure TFlatDBGrid.WMNCPaint(var Message: TMessage);
begin
  inherited;
  RedrawBorder(HRGN(Message.WParam));
end;

procedure TFlatDBGrid.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
var FRect:TRect;
begin
  inherited;
  //绘制数据区的表格边框
  with ARect, Canvas do
  begin
    FRect := Rect(Left-1,Top-1,Right+2,Bottom+2);
    //选择线型颜色。。。
    Brush.Color:=FLinesColor;
    //对表格进行绘制
    InflateRect(FRect, -1, -1);
    FrameRect(FRect);
  end;
end;

{ TFlatDrawGrid }

constructor TFlatDrawGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  BorderStyle   := bsNone;
  FFocusColor   := clWhite;
  FBorderColor  := DefaultBorderColor;
  FLinesColor   := DefaultBorderColor;
  FFlatColor    := DefaultFlatColor;
  FParentColor  := True;
  FMouseIn      := False;
end;

procedure TFlatDrawGrid.RedrawBorder(const Clip: HRGN);
var
  Attrib:TBorderAttrib;
begin
  with Attrib do
  begin
   Ctrl        := self;
   FocusColor  := ColorFocused;
   BorderColor := ColorBorder;
   FlatColor   := ColorFlat;
   FocusState  := Focused;
   MouseState  := FMouseIn;
   DesignState := ComponentState;
   HasBars     := ScrollBars = ssBoth;
  end;
  Color := DrawEditBorder(Attrib,Clip);
end;

procedure TFlatDrawGrid.SetParentColor(Value: Boolean);
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

procedure TFlatDrawGrid.CMSysColorChange(var Message: TMessage);
begin
    if (Parent <> nil)and(FParentColor) then
      FFlatColor := TForm(Parent).Color;
    RedrawBorder;
end;

procedure TFlatDrawGrid.CMParentColorChanged(var Message: TWMNoParams);
begin
    if (Parent <> nil)and(FParentColor) then
       FFlatColor := TForm(Parent).Color;
    RedrawBorder;
end;

procedure TFlatDrawGrid.SetColors(Index: Integer; Value: TColor);
begin
  case Index of
    0: FFocusColor    := Value;
    1: FBorderColor   := Value;
    2: begin
         FFlatColor   := Value;
         FParentColor := False;
       end;
    3: FLinesColor    := Value;
  end;
  Repaint;
  RedrawBorder;
end;

procedure TFlatDrawGrid.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if (GetActiveWindow <> 0) then
  begin
    FMouseIn := True;
    RedrawBorder;
  end;
end;

procedure TFlatDrawGrid.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  FMouseIn := False;
  RedrawBorder;
end;

procedure TFlatDrawGrid.CMEnabledChanged(var Message: TMessage);
const
  EnableColors: array[Boolean] of TColor = (clBtnFace, clWindow);
begin
  inherited;
  Color := EnableColors[Enabled];
  RedrawBorder;
end;

procedure TFlatDrawGrid.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  if not(csDesigning in ComponentState) then
     RedrawBorder;
end;

procedure TFlatDrawGrid.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  if not(csDesigning in ComponentState) then
     RedrawBorder;
end;

procedure TFlatDrawGrid.WMNCCalcSize(var Message: TWMNCCalcSize);
begin
  inherited;
  InflateRect(Message.CalcSize_Params^.rgrc[0], -3, -3);
end;

procedure TFlatDrawGrid.WMNCPaint(var Message: TMessage);
begin
  inherited;
  RedrawBorder(HRGN(Message.WParam));
end;

procedure TFlatDrawGrid.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
var FRect:TRect;
begin
  inherited;
  //绘制数据区的表格边框
  with ARect, Canvas do
  begin
    FRect := Rect(Left-2,Top-2,Right+2,Bottom+2);
    //选择线型颜色。。。
    Brush.Color:=FLinesColor;
    //对表格进行绘制
    InflateRect(FRect, -1, -1);
    FrameRect(FRect);
  end;
end;

{ TFlatStringGrid }

{ StrItem management for TStringSparseList }

type
  PStrItem = ^TStrItem;
  TStrItem = record
    FObject: TObject;
    FString: string;
  end;

function NewStrItem(const AString: string; AObject: TObject): PStrItem;
begin
  New(Result);
  Result^.FObject := AObject;
  Result^.FString := AString;
end;

procedure DisposeStrItem(P: PStrItem);
begin
  Dispose(P);
end;

type
{ TSparsePointerArray class}

{ Used by TSparseList.  Based on Sparse1Array, but has Pointer elements
  and Integer index, just like TPointerList/TList, and less indirection }

  { Apply function for the applicator:
        TheIndex        Index of item in array
        TheItem         Value of item (i.e pointer element) in section
        Returns: 0 if success, else error code. }
  TSPAApply = function(TheIndex: Integer; TheItem: Pointer): Integer;

  TSecDir = array[0..4095] of Pointer;  { Enough for up to 12 bits of sec }
  PSecDir = ^TSecDir;
  TSPAQuantum = (SPASmall, SPALarge);   { Section size }

  TFlatSparseArray = class(TObject)
  private
    secDir: PSecDir;
    slotsInDir: Word;
    indexMask, secShift: Word;
    FHighBound: Integer;
    FSectionSize: Word;
    cachedIndex: Integer;
    cachedPointer: Pointer;
    { Return item[i], nil if slot outside defined section. }
    function  GetAt(Index: Integer): Pointer;
    { Return address of item[i], creating slot if necessary. }
    function  MakeAt(Index: Integer): PPointer;
    { Store item at item[i], creating slot if necessary. }
    procedure PutAt(Index: Integer; Item: Pointer);
  public
    constructor Create(Quantum: TSPAQuantum);
    destructor  Destroy; override;

    { Traverse SPA, calling apply function for each defined non-nil
      item.  The traversal terminates if the apply function returns
      a value other than 0. }
    { NOTE: must be static method so that we can take its address in
      TSparseList.ForAll }
    function  ForAll(ApplyFunction: Pointer {TSPAApply}): Integer;

    { Ratchet down HighBound after a deletion }
    procedure ResetHighBound;

    property HighBound: Integer read FHighBound;
    property SectionSize: Word read FSectionSize;
    property Items[Index: Integer]: Pointer read GetAt write PutAt; default;
  end;

{ TFlatSparseList class }

  TFlatSparseList = class(TObject)
  private
    FList: TFlatSparseArray;
    FCount: Integer;    { 1 + HighBound, adjusted for Insert/Delete }
    FQuantum: TSPAQuantum;
    procedure NewList(Quantum: TSPAQuantum);
  protected
    function  Get(Index: Integer): Pointer;
    procedure Put(Index: Integer; Item: Pointer);
  public
    constructor Create(Quantum: TSPAQuantum);
    destructor  Destroy; override;
    procedure Clear;
    procedure Delete(Index: Integer);
    procedure Exchange(Index1, Index2: Integer);
    function ForAll(ApplyFunction: Pointer {TSPAApply}): Integer;
    procedure Insert(Index: Integer; Item: Pointer);
    procedure Move(CurIndex, NewIndex: Integer);
    property Count: Integer read FCount;
    property Items[Index: Integer]: Pointer read Get write Put; default;
  end;

{ TFlatSparseLists class }

  TFlatSparseLists = class(TStrings)
  private
    FList: TFlatSparseList;                 { of StrItems }
    FOnChange: TNotifyEvent;
  protected
    function  Get(Index: Integer): String; override;
    function  GetCount: Integer; override;
    function  GetObject(Index: Integer): TObject; override;
    procedure Put(Index: Integer; const S: String); override;
    procedure PutObject(Index: Integer; AObject: TObject); override;
    procedure Changed;
  public
    constructor Create(Quantum: TSPAQuantum);
    destructor  Destroy; override;
    procedure ReadData(Reader: TReader);
    procedure WriteData(Writer: TWriter);
    procedure DefineProperties(Filer: TFiler); override;
    procedure Delete(Index: Integer); override;
    procedure Exchange(Index1, Index2: Integer); override;
    procedure Insert(Index: Integer; const S: String); override;
    procedure Clear; override;
    property List: TFlatSparseList read FList;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

{ TFlatSparseArray }

const
  SPAIndexMask: array[TSPAQuantum] of Byte = (15, 255);
  SPASecShift: array[TSPAQuantum] of Byte = (4, 8);

{ Expand Section Directory to cover at least `newSlots' slots. Returns: Possibly
  updated pointer to the Section Directory. }
function  ExpandDir(secDir: PSecDir; var slotsInDir: Word;
  newSlots: Word): PSecDir;
begin
  Result := secDir;
  ReallocMem(Result, newSlots * SizeOf(Pointer));
  FillChar(Result^[slotsInDir], (newSlots - slotsInDir) * SizeOf(Pointer), 0);
  slotsInDir := newSlots;
end;

{ Allocate a section and set all its items to nil. Returns: Pointer to start of
  section. }
function  MakeSec(SecIndex: Integer; SectionSize: Word): Pointer;
var
  SecP: Pointer;
  Size: Word;
begin
  Size := SectionSize * SizeOf(Pointer);
  GetMem(secP, size);
  FillChar(secP^, size, 0);
  MakeSec := SecP
end;

constructor TFlatSparseArray.Create(Quantum: TSPAQuantum);
begin
  SecDir := nil;
  SlotsInDir := 0;
  FHighBound := -1;
  FSectionSize := Word(SPAIndexMask[Quantum]) + 1;
  IndexMask := Word(SPAIndexMask[Quantum]);
  SecShift := Word(SPASecShift[Quantum]);
  CachedIndex := -1
end;

destructor TFlatSparseArray.Destroy;
var
  i:  Integer;
  size: Word;
begin
  { Scan section directory and free each section that exists. }
  i := 0;
  size := FSectionSize * SizeOf(Pointer);
  while i < slotsInDir do begin
    if secDir^[i] <> nil then
      FreeMem(secDir^[i], size);
    Inc(i)
  end;

  { Free section directory. }
  if secDir <> nil then
    FreeMem(secDir, slotsInDir * SizeOf(Pointer));
end;

function  TFlatSparseArray.GetAt(Index: Integer): Pointer;
var
  byteP: PChar;
  secIndex: Cardinal;
begin
  { Index into Section Directory using high order part of
    index.  Get pointer to Section. If not null, index into
    Section using low order part of index. }
  if Index = cachedIndex then
    Result := cachedPointer
  else begin
    secIndex := Index shr secShift;
    if secIndex >= slotsInDir then
      byteP := nil
    else begin
      byteP := secDir^[secIndex];
      if byteP <> nil then begin
        Inc(byteP, (Index and indexMask) * SizeOf(Pointer));
      end
    end;
    if byteP = nil then Result := nil else Result := PPointer(byteP)^;
    cachedIndex := Index;
    cachedPointer := Result
  end
end;

function  TFlatSparseArray.MakeAt(Index: Integer): PPointer;
var
  dirP: PSecDir;
  p: Pointer;
  byteP: PChar;
  secIndex: Word;
begin
  { Expand Section Directory if necessary. }
  secIndex := Index shr secShift;       { Unsigned shift }
  if secIndex >= slotsInDir then
    dirP := expandDir(secDir, slotsInDir, secIndex + 1)
  else
    dirP := secDir;

  { Index into Section Directory using high order part of
    index.  Get pointer to Section. If null, create new
    Section.  Index into Section using low order part of index. }
  secDir := dirP;
  p := dirP^[secIndex];
  if p = nil then begin
    p := makeSec(secIndex, FSectionSize);
    dirP^[secIndex] := p
  end;
  byteP := p;
  Inc(byteP, (Index and indexMask) * SizeOf(Pointer));
  if Index > FHighBound then
    FHighBound := Index;
  Result := PPointer(byteP);
  cachedIndex := -1
end;

procedure TFlatSparseArray.PutAt(Index: Integer; Item: Pointer);
begin
  if (Item <> nil) or (GetAt(Index) <> nil) then
  begin
    MakeAt(Index)^ := Item;
    if Item = nil then
      ResetHighBound
  end
end;

function  TFlatSparseArray.ForAll(ApplyFunction: Pointer {TSPAApply}):
  Integer;
var
  itemP: PChar;                         { Pointer to item in section }
  item: Pointer;
  i, callerBP: Cardinal;
  j, index: Integer;
begin
  { Scan section directory and scan each section that exists,
    calling the apply function for each non-nil item.
    The apply function must be a far local function in the scope of
    the procedure P calling ForAll.  The trick of setting up the stack
    frame (taken from TurboVision's TCollection.ForEach) allows the
    apply function access to P's arguments and local variables and,
    if P is a method, the instance variables and methods of P's class }
  Result := 0;
  i := 0;
  asm
    mov   eax,[ebp]                     { Set up stack frame for local }
    mov   callerBP,eax
  end;
  while (i < slotsInDir) and (Result = 0) do begin
    itemP := secDir^[i];
    if itemP <> nil then begin
      j := 0;
      index := i shl SecShift;
      while (j < FSectionSize) and (Result = 0) do begin
        item := PPointer(itemP)^;
        if item <> nil then
          { ret := ApplyFunction(index, item.Ptr); }
          asm
            mov   eax,index
            mov   edx,item
            push  callerBP
            call  ApplyFunction
            pop   ecx
            mov   @Result,eax
          end;
        Inc(itemP, SizeOf(Pointer));
        Inc(j);
        Inc(index)
      end
    end;
    Inc(i)
  end;
end;

procedure TFlatSparseArray.ResetHighBound;
var
  NewHighBound: Integer;

  function  Detector(TheIndex: Integer; TheItem: Pointer): Integer; far;
  begin
    if TheIndex > FHighBound then
      Result := 1
    else
    begin
      Result := 0;
      if TheItem <> nil then NewHighBound := TheIndex
    end
  end;

begin
  NewHighBound := -1;
  ForAll(@Detector);
  FHighBound := NewHighBound
end;

{ TFlatSparseList }

constructor TFlatSparseList.Create(Quantum: TSPAQuantum);
begin
  NewList(Quantum)
end;

destructor TFlatSparseList.Destroy;
begin
  if FList <> nil then FList.Destroy
end;

procedure TFlatSparseList.Clear;
begin
  FList.Destroy;
  NewList(FQuantum);
  FCount := 0
end;

procedure TFlatSparseList.Delete(Index: Integer);
var
  I: Integer;
begin
  if (Index < 0) or (Index >= FCount) then Exit;
  for I := Index to FCount - 1 do
    FList[I] := FList[I + 1];
  FList[FCount] := nil;
  Dec(FCount);
end;

procedure TFlatSparseList.Exchange(Index1, Index2: Integer);
var
  temp: Pointer;
begin
  temp := Get(Index1);
  Put(Index1, Get(Index2));
  Put(Index2, temp);
end;

{ Jump to TFlatSparseArray.ForAll so that it looks like it was called
  from our caller, so that the BP trick works. }

function TFlatSparseList.ForAll(ApplyFunction: Pointer {TSPAApply}): Integer; assembler;
asm
        MOV     EAX,[EAX].TFlatSparseList.FList
        JMP     TFlatSparseArray.ForAll
end;

function  TFlatSparseList.Get(Index: Integer): Pointer;
begin
  if Index < 0 then TList.Error(SListIndexError, Index);
  Result := FList[Index]
end;

procedure TFlatSparseList.Insert(Index: Integer; Item: Pointer);
var
  i: Integer;
begin
  if Index < 0 then TList.Error(SListIndexError, Index);
  I := FCount;
  while I > Index do
  begin
    FList[i] := FList[i - 1];
    Dec(i)
  end;
  FList[Index] := Item;
  if Index > FCount then FCount := Index;
  Inc(FCount)
end;

procedure TFlatSparseList.Move(CurIndex, NewIndex: Integer);
var
  Item: Pointer;
begin
  if CurIndex <> NewIndex then
  begin
    Item := Get(CurIndex);
    Delete(CurIndex);
    Insert(NewIndex, Item);
  end;
end;

procedure TFlatSparseList.NewList(Quantum: TSPAQuantum);
begin
  FQuantum := Quantum;
  FList := TFlatSparseArray.Create(Quantum)
end;

procedure TFlatSparseList.Put(Index: Integer; Item: Pointer);
begin
  if Index < 0 then TList.Error(SListIndexError, Index);
  FList[Index] := Item;
  FCount := FList.HighBound + 1
end;

{ TFlatSparseLists }

constructor TFlatSparseLists.Create(Quantum: TSPAQuantum);
begin
  inherited Create;
  FList := TFlatSparseList.Create(Quantum)
end;

destructor  TFlatSparseLists.Destroy;
begin
  if FList <> nil then begin
    Clear;
    FList.Destroy
  end
end;

procedure TFlatSparseLists.ReadData(Reader: TReader);
var
  i: Integer;
begin
  with Reader do begin
    i := Integer(ReadInteger);
    while i > 0 do begin
      InsertObject(Integer(ReadInteger), ReadString, nil);
      Dec(i)
    end
  end
end;

procedure TFlatSparseLists.WriteData(Writer: TWriter);
var
  itemCount: Integer;

  function  CountItem(TheIndex: Integer; TheItem: Pointer): Integer; far;
  begin
    Inc(itemCount);
    Result := 0
  end;

  function  StoreItem(TheIndex: Integer; TheItem: Pointer): Integer; far;
  begin
    with Writer do
    begin
      WriteInteger(TheIndex);           { Item index }
      WriteString(PStrItem(TheItem)^.FString);
    end;
    Result := 0
  end;

begin
  with Writer do
  begin
    itemCount := 0;
    FList.ForAll(@CountItem);
    WriteInteger(itemCount);
    FList.ForAll(@StoreItem);
  end
end;

procedure TFlatSparseLists.DefineProperties(Filer: TFiler);
begin
  Filer.DefineProperty('List', ReadData, WriteData, True);
end;

function  TFlatSparseLists.Get(Index: Integer): String;
var
  p: PStrItem;
begin
  p := PStrItem(FList[Index]);
  if p = nil then Result := '' else Result := p^.FString
end;

function  TFlatSparseLists.GetCount: Integer;
begin
  Result := FList.Count
end;

function  TFlatSparseLists.GetObject(Index: Integer): TObject;
var
  p: PStrItem;
begin
  p := PStrItem(FList[Index]);
  if p = nil then Result := nil else Result := p^.FObject
end;

procedure TFlatSparseLists.Put(Index: Integer; const S: String);
var
  p: PStrItem;
  obj: TObject;
begin
  p := PStrItem(FList[Index]);
  if p = nil then obj := nil else obj := p^.FObject;
  if (S = '') and (obj = nil) then   { Nothing left to store }
    FList[Index] := nil
  else
    FList[Index] := NewStrItem(S, obj);
  if p <> nil then DisposeStrItem(p);
  Changed
end;

procedure TFlatSparseLists.PutObject(Index: Integer; AObject: TObject);
var
  p: PStrItem;
begin
  p := PStrItem(FList[Index]);
  if p <> nil then
    p^.FObject := AObject
  else if AObject <> nil then
    FList[Index] := NewStrItem('',AObject);
  Changed
end;

procedure TFlatSparseLists.Changed;
begin
  if Assigned(FOnChange) then FOnChange(Self)
end;

procedure TFlatSparseLists.Delete(Index: Integer);
var
  p: PStrItem;
begin
  p := PStrItem(FList[Index]);
  if p <> nil then DisposeStrItem(p);
  FList.Delete(Index);
  Changed
end;

procedure TFlatSparseLists.Exchange(Index1, Index2: Integer);
begin
  FList.Exchange(Index1, Index2);
end;

procedure TFlatSparseLists.Insert(Index: Integer; const S: String);
begin
  FList.Insert(Index, NewStrItem(S, nil));
  Changed
end;

procedure TFlatSparseLists.Clear;

  function  ClearItem(TheIndex: Integer; TheItem: Pointer): Integer; far;
  begin
    DisposeStrItem(PStrItem(TheItem));    { Item guaranteed non-nil }
    Result := 0
  end;

begin
  FList.ForAll(@ClearItem);
  FList.Clear;
  Changed
end;

{ TStringGridStrings }

{ AIndex < 0 is a column (for column -AIndex - 1)
  AIndex > 0 is a row (for row AIndex - 1)
  AIndex = 0 denotes an empty row or column }
constructor TFlatGridStrings.Create(AGrid: TFlatStringGrid; AIndex: Longint);
begin
  inherited Create;
  FGrid := AGrid;
  FIndex := AIndex;
end;

procedure TFlatGridStrings.Assign(Source: TPersistent);
var
  I, Max: Integer;
begin
  if Source is TStrings then
  begin
    BeginUpdate;
    Max := TStrings(Source).Count - 1;
    if Max >= Count then Max := Count - 1;
    try
      for I := 0 to Max do
      begin
        Put(I, TStrings(Source).Strings[I]);
        PutObject(I, TStrings(Source).Objects[I]);
      end;
    finally
      EndUpdate;
    end;
    Exit;
  end;
  inherited Assign(Source);
end;

procedure TFlatGridStrings.CalcXY(Index: Integer; var X, Y: Integer);
begin
  if FIndex = 0 then
  begin
    X := -1; Y := -1;
  end else if FIndex > 0 then
  begin
    X := Index;
    Y := FIndex - 1;
  end else
  begin
    X := -FIndex - 1;
    Y := Index;
  end;
end;

{ Changes the meaning of Add to mean copy to the first empty string }
function TFlatGridStrings.Add(const S: string): Integer;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    if Strings[I] = '' then
    begin
      if S = '' then
        Strings[I] := ' '
      else
        Strings[I] := S;
      Result := I;
      Exit;
    end;
  Result := -1;
end;

procedure TFlatGridStrings.Clear;
var
  SSList: TFlatSparseLists;
  I: Integer;

  function BlankStr(TheIndex: Integer; TheItem: Pointer): Integer; far;
  begin
    Objects[TheIndex] := nil;
    Strings[TheIndex] := '';
    Result := 0;
  end;

begin
  if FIndex > 0 then
  begin
    SSList := TFlatSparseLists(TFlatSparseList(FGrid.FData)[FIndex - 1]);
    if SSList <> nil then SSList.List.ForAll(@BlankStr);
  end
  else if FIndex < 0 then
    for I := Count - 1 downto 0 do
    begin
      Objects[I] := nil;
      Strings[I] := '';
    end;
end;

procedure InvalidOp(const id: string);
begin
  raise EInvalidGridOperation.Create(id);
end;

procedure TFlatGridStrings.Delete(Index: Integer);
begin
  InvalidOp(sInvalidStringGridOp);
end;

function TFlatGridStrings.Get(Index: Integer): string;
var
  X, Y: Integer;
begin
  CalcXY(Index, X, Y);
  if X < 0 then Result := '' else Result := FGrid.Cells[X, Y];
end;

function TFlatGridStrings.GetCount: Integer;
begin
  { Count of a row is the column count, and vice versa }
  if FIndex = 0 then Result := 0
  else if FIndex > 0 then Result := Integer(FGrid.ColCount)
  else Result := Integer(FGrid.RowCount);
end;

function TFlatGridStrings.GetObject(Index: Integer): TObject;
var
  X, Y: Integer;
begin
  CalcXY(Index, X, Y);
  if X < 0 then Result := nil else Result := FGrid.Objects[X, Y];
end;

procedure TFlatGridStrings.Insert(Index: Integer; const S: string);
begin
  InvalidOp(sInvalidStringGridOp);
end;

procedure TFlatGridStrings.Put(Index: Integer; const S: string);
var
  X, Y: Integer;
begin
  CalcXY(Index, X, Y);
  FGrid.Cells[X, Y] := S;
end;

procedure TFlatGridStrings.PutObject(Index: Integer; AObject: TObject);
var
  X, Y: Integer;
begin
  CalcXY(Index, X, Y);
  FGrid.Objects[X, Y] := AObject;
end;

procedure TFlatGridStrings.SetUpdateState(Updating: Boolean);
begin
  FGrid.SetUpdateState(Updating);
end;

{ TStringGrid }

constructor TFlatStringGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Initialize;
end;

destructor TFlatStringGrid.Destroy;
  function FreeItem(TheIndex: Integer; TheItem: Pointer): Integer; far;
  begin
    TObject(TheItem).Free;
    Result := 0;
  end;

begin
  if FRows <> nil then
  begin
    TFlatSparseList(FRows).ForAll(@FreeItem);
    TFlatSparseList(FRows).Free;
  end;
  if FCols <> nil then
  begin
    TFlatSparseList(FCols).ForAll(@FreeItem);
    TFlatSparseList(FCols).Free;
  end;
  if FData <> nil then
  begin
    TFlatSparseList(FData).ForAll(@FreeItem);
    TFlatSparseList(FData).Free;
  end;
  inherited Destroy;
end;

procedure TFlatStringGrid.ColumnMoved(FromIndex, ToIndex: Longint);

  function MoveColData(Index: Integer; ARow: TFlatSparseLists): Integer; far;
  begin
    ARow.Move(FromIndex, ToIndex);
    Result := 0;
  end;

begin
  TFlatSparseList(FData).ForAll(@MoveColData);
  Invalidate;
  inherited ColumnMoved(FromIndex, ToIndex);
end;

procedure TFlatStringGrid.RowMoved(FromIndex, ToIndex: Longint);
begin
  TFlatSparseList(FData).Move(FromIndex, ToIndex);
  Invalidate;
  inherited RowMoved(FromIndex, ToIndex);
end;

function TFlatStringGrid.GetEditText(ACol, ARow: Longint): string;
begin
  Result := Cells[ACol, ARow];
  if Assigned(OnGetEditText) then OnGetEditText(Self, ACol, ARow, Result);
end;

procedure TFlatStringGrid.SetEditText(ACol, ARow: Longint; const Value: string);
begin
  DisableEditUpdate;
  try
    if Value <> Cells[ACol, ARow] then Cells[ACol, ARow] := Value;
  finally
    EnableEditUpdate;
  end;
  inherited SetEditText(ACol, ARow, Value);
end;

procedure TFlatStringGrid.DrawCell(ACol, ARow: Longint; ARect: TRect;
  AState: TGridDrawState);
begin
  if DefaultDrawing then
    Canvas.TextRect(ARect, ARect.Left+2, ARect.Top+2, Cells[ACol, ARow]);
  inherited DrawCell(ACol, ARow, ARect, AState);
end;

procedure TFlatStringGrid.DisableEditUpdate;
begin
  Inc(FEditUpdate);
end;

procedure TFlatStringGrid.EnableEditUpdate;
begin
  Dec(FEditUpdate);
end;

procedure TFlatStringGrid.Initialize;
var
  quantum: TSPAQuantum;
begin
  if FCols = nil then
  begin
    if ColCount > 512 then quantum := SPALarge else quantum := SPASmall;
    FCols := TFlatSparseList.Create(quantum);
  end;
  if RowCount > 256 then quantum := SPALarge else quantum := SPASmall;
  if FRows = nil then FRows := TFlatSparseList.Create(quantum);
  if FData = nil then FData := TFlatSparseList.Create(quantum);
end;

procedure TFlatStringGrid.SetUpdateState(Updating: Boolean);
begin
  FUpdating := Updating; 
  if not Updating and FNeedsUpdating then
  begin
    InvalidateGrid;
    FNeedsUpdating := False;
  end;
end;

procedure TFlatStringGrid.Update(ACol, ARow: Integer);
begin
  if not FUpdating then InvalidateCell(ACol, ARow)
  else FNeedsUpdating := True;
  if (ACol = Col) and (ARow = Row) and (FEditUpdate = 0) then InvalidateEditor;
end;

function  TFlatStringGrid.EnsureColRow(Index: Integer; IsCol: Boolean): TFlatGridStrings;
var
  RCIndex: Integer;
  PList: ^TFlatSparseList;
begin
  if IsCol then PList := FCols else PList := FRows;
  Result := TFlatGridStrings(PList^[Index]);
  if Result = nil then
  begin
    if IsCol then RCIndex := -Index - 1 else RCIndex := Index + 1;
    Result := TFlatGridStrings.Create(Self, RCIndex);
    PList^[Index] := Result;
  end;
end;

function  TFlatStringGrid.EnsureDataRow(ARow: Integer): Pointer;
var
  quantum: TSPAQuantum;
begin
  Result := TFlatSparseLists(TFlatSparseList(FData)[ARow]);
  if Result = nil then
  begin
    if ColCount > 512 then quantum := SPALarge else quantum := SPASmall;
    Result := TFlatSparseLists.Create(quantum);
    TFlatSparseList(FData)[ARow] := Result;
  end;
end;

function TFlatStringGrid.GetCells(ACol, ARow: Integer): string;
var
  ssl: TFlatSparseLists;
begin
  ssl := TFlatSparseLists(TFlatSparseList(FData)[ARow]);
  if ssl = nil then Result := '' else Result := ssl[ACol];
end;

function TFlatStringGrid.GetCols(Index: Integer): TStrings;
begin
  Result := EnsureColRow(Index, True);
end;

function TFlatStringGrid.GetObjects(ACol, ARow: Integer): TObject;
var
  ssl: TFlatSparseLists;
begin
  ssl := TFlatSparseLists(TFlatSparseList(FData)[ARow]);
  if ssl = nil then Result := nil else Result := ssl.Objects[ACol];
end;

function TFlatStringGrid.GetRows(Index: Integer): TStrings;
begin
  Result := EnsureColRow(Index, False);
end;

procedure TFlatStringGrid.SetCells(ACol, ARow: Integer; const Value: string);
begin
  TFlatGridStrings(EnsureDataRow(ARow))[ACol] := Value;
  EnsureColRow(ACol, True);
  EnsureColRow(ARow, False);
  Update(ACol, ARow);
end;

procedure TFlatStringGrid.SetCols(Index: Integer; Value: TStrings);
begin
  EnsureColRow(Index, True).Assign(Value);
end;

procedure TFlatStringGrid.SetObjects(ACol, ARow: Integer; Value: TObject);
begin
  TFlatGridStrings(EnsureDataRow(ARow)).Objects[ACol] := Value;
  EnsureColRow(ACol, True);
  EnsureColRow(ARow, False);
  Update(ACol, ARow);
end;

procedure TFlatStringGrid.SetRows(Index: Integer; Value: TStrings);
begin
  EnsureColRow(Index, False).Assign(Value);
end;

end.

