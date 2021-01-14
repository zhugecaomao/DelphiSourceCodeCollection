{*******************************************************************************

  UtilMind Common Controls (ListView and TreeView)
  Used by AppControls and DiskControls
  Original Filename: umComCtrls.pas
  Last updated: May 21, 2002

  Copyright (c) 1999-2003 UtilMind Solutions
  All rights reserved.
  E-Mail: info@utilmind.com
  WWW: http://www.utilmind.com, http://www.appcontrols.com

  The entire contents of this file is protected by International Copyright
Laws. Unauthorized reproduction, reverse-engineering, and distribution of all
or any portion of the code contained in this file is strictly prohibited and
may result in severe civil and criminal penalties and will be prosecuted to
the maximum extent possible under the law.

*******************************************************************************}
{$I umDefines.inc}

unit dcComCtrls;

interface

uses Windows, Messages, Classes, Controls, Graphics,
     ComCtrls, CommCtrl, Menus,
     Registry,
{$IFDEF USEINIFILES}
     IniFiles,
{$ENDIF}
{$IFDEF APPCONTROLS}
     acClasses, acGraphics;
{$ELSE}
     dcInternal;
{$ENDIF}

{$IFDEF VER130}
  {$DEFINE SUBITEMSBUGFIX}
{$ENDIF}
{$IFDEF VER140}
  {$DEFINE SUBITEMSBUGFIX}
{$ENDIF}

type
  TumCustomListView = class;

  TdcListViewSortDirection = (sdAscending, sdDescending);
  TdcListViewSortMarkKind = (mkSunken, mkRaised);
  TdcListViewSortMarkAlign = (maText, maEdge);
  TdcListViewToolTipOption = (ttoInstantShow, ttoLongStay, ttoBelowItem, ttoOffset);
  TdcListViewToolTipOptions = set of TdcListViewToolTipOption;

  TdcListViewDrawHeaderSection = procedure(Sender: TObject; Canvas: TCanvas; Rect: TRect;
                                           ColumnIndex: Integer; Pressed: Boolean) of object;
  TdcListViewToolTipEvent = procedure(Sender: TObject; var ToolTipText: String;
                                      Item: TListItem; LogicalCol: Integer) of object;

{$IFDEF D4}
  TdcListViewCustomDrawSubItemExEvent = procedure(Sender: TObject; Canvas: TCanvas; Rect: TRect;
       Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean) of object;
  TdcListViewColumnDragEvent = procedure(Sender: TObject; ColumnOrders: array of Integer) of object;
{$ENDIF}
  TdcListViewColumnResizeBeginEvent = procedure(Sender: TObject; Column: TListColumn; var AllowResize: Boolean) of object;

  { TdcListViewCursors }
  TdcListViewCursors = class(TPersistent)
  private
    FBorder,
    FHeader,
{$IFDEF APPCONTROLS}
    FHotCursor,
{$ENDIF}    
    FDivider,
    FScrollHorz,
    FScrollVert: TCursor;

    { for internal use }
    ListView: TumCustomListView;

{$IFDEF APPCONTROLS}
    procedure SetHotCursor(Value: TCursor);
{$ENDIF}    
  public
    constructor Create(aListView: TumCustomListView);
  published
    property Border: TCursor read FBorder write FBorder default crDefault;
    property Header: TCursor read FHeader write FHeader default crDefault;
{$IFDEF APPCONTROLS}
    property HotCursor: TCursor read FHotCursor write SetHotCursor default crLinkSelect;
{$ENDIF}
    property Divider: TCursor read FDivider write FDivider default crDefault;
    property ScrollHorz: TCursor read FScrollHorz write FScrollHorz default crDefault;
    property ScrollVert: TCursor read FScrollVert write FScrollVert default crDefault;
  end;

  { TdcListViewHeaderMenu }
  TdcListViewHeaderMenu = class(TPersistent)
  private
    FAlignLeftItem: TComponent;
    FAlignRightItem: TComponent;
    FAlignCenterItem: TComponent;
    FAscendingItem: TComponent;
    FDescendingItem: TComponent;
    FBestFitItem: TComponent;
    FPopupMenu: TPopupMenu;

    { for internal use }
    ListView: TumCustomListView;

    procedure SetAlignLeftItem(Value: TComponent);
    procedure SetAlignRightItem(Value: TComponent);
    procedure SetAlignCenterItem(Value: TComponent);
    procedure SetAscendingItem(Value: TComponent);
    procedure SetDescendingItem(Value: TComponent);
    procedure SetBestFitItem(Value: TComponent);
  public
    constructor Create(aListView: TumCustomListView);
  published
    property AlignLeftItem: TComponent read FAlignLeftItem write SetAlignLeftItem;
    property AlignRightItem: TComponent read FAlignRightItem write SetAlignRightItem;
    property AlignCenterItem: TComponent read FAlignCenterItem write SetAlignCenterItem;
    property AscendingItem: TComponent read FAscendingItem write SetAscendingItem;
    property DescendingItem: TComponent read FDescendingItem write SetDescendingItem;
    property BestFitItem: TComponent read FBestFitItem write SetBestFitItem;
    property PopupMenu: TPopupMenu read FPopupMenu write FPopupMenu;
  end;

  { TdcListViewRegistrySaver }
  TdcListViewRegistrySaver = class(TdcRegistrySaver)
  protected
    procedure DoSaveToRegistry(Reg: TRegistry); override;
    procedure DoLoadFromRegistry(Reg: TRegistry); override;

    {$IFDEF USEINIFILES}
    procedure DoSaveToIniFile(Ini: TIniFile); override;
    procedure DoLoadFromIniFile(Ini: TIniFile); override;
    {$ENDIF}
  end;

  { TumCustomListView }
  {$IFNDEF D4}
  THeaderStyle = (hsButtons, hsFlat);
  TListHotTrackStyle = (htHandPoint, htUnderlineCold, htUnderlineHot);
  TListHotTrackStyles = set of TListHotTrackStyle;
  {$ENDIF}

  TumCustomListView = class(TCustomListView)
  private
    FAbout: String;

    FCursors: TdcListViewCursors;    
    FHeaderColor: TColor;
    FHeaderStyle: THeaderStyle;
    FHeaderMenu: TdcListViewHeaderMenu;
    FShowHeaderMenu, FShowSortMark,
    FShowScrollTips, FShowToolTips: Boolean;
    FSortDirection: TdcListViewSortDirection;
    FSortColumn: Word;
    FSortMarkAlign: TdcListViewSortMarkAlign;
    FSortMarkKind: TdcListViewSortMarkKind;
    FSortMarkImageAsc,
    FSortMarkImageDesc: TPicture;
    FRegistrySaver: TdcListViewRegistrySaver;

{$IFDEF D3}
    FCheckOnClick: Boolean; 
{$ELSE}
    FGridLines, FHotTrack, FRowSelect: Boolean;
{$ENDIF}
{$IFNDEF D4}
    FFlatScrollBars, FFullDrag: Boolean;
    FHotTrackStyles: TListHotTrackStyles;
{$ENDIF}

    FToolTipOptions: TdcListViewToolTipOptions;
    FToolTipText: String;

    FOnDrawHeaderSection: TdcListViewDrawHeaderSection;
    FOnToolTip: TdcListViewToolTipEvent;
    FOnMouseEnter, FOnMouseLeave: TNotifyEvent;
    FOnSettingsChanged: TNotifyEvent;
    FOnAlignmentChanged: TLVColumnClickEvent;
    FOnColumnResizeBegin: TdcListViewColumnResizeBeginEvent;
    FOnColumnResizeEnd: TLVColumnClickEvent;
{$IFDEF D4}
    FOnCustomDrawSubItemEx: TdcListViewCustomDrawSubItemExEvent;
    FOnColumnDragged: TdcListViewColumnDragEvent;
{$ENDIF}

    // overriden methods
    FOldAlignLeftItemClick: TNotifyEvent;
    FOldAlignRightItemClick: TNotifyEvent;
    FOldAlignCenterItemClick: TNotifyEvent;
    FOldAscendingItemClick: TNotifyEvent;
    FOldDescendingItemClick: TNotifyEvent;
    FOldBestFitItemClick: TNotifyEvent;

    // for internal use
    FDefaultMenu: TPopupMenu;
    FDefAscendingItem: TMenuItem;
    FDefDescendingItem: TMenuItem;
    FHeaderHandle: hWnd;
    FHeaderInstance: Pointer;
    FHoverSection: Integer;
    FOldHeaderWndProc: Pointer;
    MouseX, MouseY: Integer;
    HeaderVisible: Boolean;
    ColumnDragging: Boolean;
{$IFDEF D4}
    ColumnDragged: Boolean;
    CustomDrawRect: TRect;
{$ENDIF}
    //------------------

    procedure SetHeaderColor(Value: TColor);
    procedure SetHeaderStyle(Value: THeaderStyle);
    procedure SetShowSortMark(Value: Boolean);
    procedure SetSortDirection(Value: TdcListViewSortDirection);
    procedure SetSortColumn(Value: Word);
    procedure SetSortMarkAlign(Value: TdcListViewSortMarkAlign);
    procedure SetSortMarkKind(Value: TdcListViewSortMarkKind);
    procedure SetSortMarkImageAsc(Value: TPicture);
    procedure SetSortMarkImageDesc(Value: TPicture);
    function  GetToolTips: Boolean;            
    procedure SetToolTips(Value: Boolean);
    procedure SetToolTipOptions(Value: TdcListViewToolTipOptions);
    function  GetViewStyle: TViewStyle;

    function  GetSortType: TSortType;
    procedure SetSortType(Value: TSortType);
    procedure SetHoverSection(Value: Integer);
    {$IFNDEF D3}
    procedure SetGridLines(Value: Boolean);
    procedure SetHotTrack(Value: Boolean);
    procedure SetRowSelect(Value: Boolean);
    {$ENDIF}
    {$IFNDEF D4}
    procedure ResetExStyles;
    procedure SetFlatScrollBars(Value: Boolean);
    procedure SetFullDrag(Value: Boolean);
    procedure SetHotTrackStyles(Value: TListHotTrackStyles);
    {$ENDIF}
    {$IFNDEF D5}
    function  GetHoverTime: Integer;
    procedure SetHoverTime(Value: Integer);
    {$ENDIF}
    {$IFDEF D4}
    procedure SetOnCustomDrawSubItemEx(const Value: TdcListViewCustomDrawSubItemExEvent);
    procedure StdOnCustomDrawSubItemHook(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    {$ENDIF}

    procedure HeaderWndProc(var Message: TMessage);
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMWinIniChange(var Message: TMessage); message CM_WININICHANGE;
    procedure CNKeyDown(var Message: TWMKEY); message CN_KEYDOWN;
{$IFDEF D4}
    procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;
{$ENDIF}
{$IFDEF D3}
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
{$ENDIF}
    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
    procedure WMParentNotify(var Message: TWMParentNotify); message WM_PARENTNOTIFY;
    procedure WMDrawHeader(var Message: TWMDrawItem); message WM_DRAWITEM;
    procedure WMNotify(var Message: TWMNotify); message WM_NOTIFY;

    procedure AlignLeftItemClick(Sender: TObject);
    procedure AlignRightItemClick(Sender: TObject);
    procedure AlignCenterItemClick(Sender: TObject);
    procedure AscendingItemClick(Sender: TObject);
    procedure DescendingItemClick(Sender: TObject);
    procedure BestFitItemClick(Sender: TObject);

{$IFDEF D3}
    procedure SortMarkImageChanged(Sender: TObject);
{$ENDIF}

    property HoverSection: Integer read FHoverSection write SetHoverSection;
  protected
    DefaultSortProc: Pointer;

    procedure Notification(aComponent: TComponent; Operation: TOperation); override;
    procedure Loaded; override;
    procedure CreateWnd; override;

    procedure AlignControls(aControl: TControl; var Rect: TRect); override;
{$IFDEF SUBITEMSBUGFIX}
    function CreateListItem: TListItem; override;
{$ENDIF}
    procedure SetViewStyle(Value: TViewStyle); {$IFNDEF D6} virtual; {$ELSE} reintroduce; {$ENDIF}
    procedure ColClick(Column: TListColumn); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure WndProc(var Message: TMessage); override;

{$IFDEF D4}
    function  CustomDrawSubItem(Item: TListItem; SubItem: Integer; State: TCustomDrawState; Stage: TCustomDrawStage): Boolean; override;
{$ENDIF}
    procedure AlignmentChanged(Column: TListColumn); dynamic;
    procedure ColumnResizeBegin(Column: TListColumn; var AllowResize: Boolean); dynamic;
    procedure ColumnResizeEnd(Column: TListColumn); dynamic;
    procedure DrawHeader(Canvas: TCanvas; Rect: TRect; ColumnIndex: Integer; Pressed: Boolean); dynamic;
    procedure UpdateListItems; virtual;

    { protected (hidden) properties (for internal use) }
    property Columns;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure RepaintHeader; virtual;
    {$IFDEF D4}
    function FindCaption(const Caption: String): TListItem; overload;
    {$ENDIF} 

    function CountPerPage: Integer; // calculates number of items that can fit vertically in the visible area of a listview control when in list or report view    
    function GetColumnAt(X: Integer): TListColumn;
    {$IFNDEF D6}
    procedure Clear;
    procedure DeleteSelected;
    procedure SelectAll;
    {$ENDIF}
    procedure UnselectAll;    
    function  IsScrollBarsVisible: Boolean;
    procedure BestFit{$IFDEF D4}(FitHeaderText: Boolean = False){$ENDIF};
{$IFDEF D4}
    procedure SetColumnOrders(ColumnOrders: Array of Integer);
{$ENDIF}

    function ImportFromTXT(const FileName: String; SeparatorChar: Char {$IFDEF D4} = #9{$ENDIF}): Boolean;
    procedure ExportToTXT(const FileName: String; ExportColumnCaptions: Boolean {$IFDEF D4} = True {$ENDIF});
    procedure ExportToHTML(const FileName: String; ExportColumnCaptions: Boolean {$IFDEF D4} = True {$ENDIF}; const DocumentTitle: String {$IFDEF D4} = '' {$ENDIF});

    procedure ReplaceStr(const OldCaption, NewCaption: String {$IFDEF D4}; ReplaceOnlyVisibleItems: Boolean = True {$ENDIF});

    // public properties (not for Object Inspector)
    property Items;
  published
    { derived properties/events }
    property Align;
    property AllocBy;
{$IFDEF D4}
    property Anchors;
    property BiDiMode;
{$ENDIF}
    property BorderStyle;
{$IFDEF D4}
    property BorderWidth;
{$ENDIF}
{$IFDEF D3}
    property Checkboxes;
{$ENDIF}
    property Color;
    property ColumnClick;
{$IFDEF D4}
    property Constraints;
{$ENDIF}
    property Ctl3D;
    property Enabled;
    property Font;
{$IFDEF D4}
    property FlatScrollBars;
    property FullDrag;
{$ENDIF}
{$IFDEF D3}
    property GridLines;
{$ENDIF}
    property HideSelection;
{$IFDEF D3}
    property HotTrack;
{$ENDIF}
{$IFDEF D4}
    property HotTrackStyles;
{$ENDIF}
{$IFDEF D5}
    property HoverTime;
{$ENDIF}
    property IconOptions;
    property MultiSelect;
{$IFDEF D4}
    property OwnerData;
    property OwnerDraw;
{$ENDIF}
    property ReadOnly default False;
{$IFDEF D3}
    property RowSelect;
{$ENDIF}
{$IFDEF D4}
    property ParentBiDiMode;
{$ENDIF}
    property ParentColor default False;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowColumnHeaders;
{$IFDEF D5}
    property ShowWorkAreas;
{$ENDIF}
    property ShowHint;
    property TabOrder;
    property TabStop default True;
    property Visible;
{$IFDEF D5}
    property OnAdvancedCustomDraw;
    property OnAdvancedCustomDrawItem;
    property OnAdvancedCustomDrawSubItem;
{$ENDIF}
    property OnChange;
    property OnChanging;
    property OnClick;
    property OnColumnClick;
{$IFDEF D5}
    property OnColumnRightClick;
{$ENDIF}
    property OnCompare;
{$IFDEF D5}
    property OnContextPopup;
{$ENDIF}
{$IFDEF D4}
    property OnCustomDraw;
    property OnCustomDrawItem;
    property OnCustomDrawSubItem;
    property OnData;
    property OnDataFind;
    property OnDataHint;
    property OnDataStateChange;
{$ENDIF}
    property OnDblClick;
    property OnDeletion;
{$IFDEF D4}
    property OnDrawItem;
{$ENDIF}
    property OnEdited;
    property OnEditing;
    property OnEnter;
    property OnExit;
{$IFDEF D4}
    property OnGetImageIndex;
{$ENDIF}
{$IFDEF D5}
    property OnGetSubItemImage;
{$ENDIF}
{$IFDEF D5}
    property OnInfoTip;
{$ENDIF}
    property OnInsert;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
{$IFDEF D4}
    property OnMouseWheel;
    property OnResize;
    property OnSelectItem;
{$ENDIF}

    // new properties/events
    property About: String read FAbout write FAbout stored False;
    property ViewStyle: TViewStyle read GetViewStyle write SetViewStyle default vsReport;
    property SortType: TSortType read GetSortType write SetSortType default stData;

    property Cursors: TdcListViewCursors read FCursors write FCursors;
    property HeaderColor: TColor read FHeaderColor write SetHeaderColor default clNone;
    property HeaderStyle: THeaderStyle read FHeaderStyle write SetHeaderStyle default hsButtons;
    property HeaderMenu: TdcListViewHeaderMenu read FHeaderMenu write FHeaderMenu;
    property ShowHeaderMenu: Boolean read FShowHeaderMenu write FShowHeaderMenu default True;
    property ShowSortMark: Boolean read FShowSortMark write SetShowSortMark default True;
    property SortDirection: TdcListViewSortDirection read FSortDirection write SetSortDirection default sdAscending;
    property SortColumn: Word read FSortColumn write SetSortColumn default 0;
    property SortMarkAlign: TdcListViewSortMarkAlign read FSortMarkAlign write SetSortMarkAlign default maText;
    property SortMarkKind: TdcListViewSortMarkKind read FSortMarkKind write SetSortMarkKind default mkSunken;
    property SortMarkImageAsc: TPicture read FSortMarkImageAsc write SetSortMarkImageAsc;
    property SortMarkImageDesc: TPicture read FSortMarkImageDesc write SetSortMarkImageDesc;
    property RegistrySaver: TdcListViewRegistrySaver read FRegistrySaver write FRegistrySaver;

{$IFDEF D3}
    property CheckOnClick: Boolean read FCheckOnClick write FCheckOnClick default False;
{$ELSE}
    property GridLines: Boolean read FGridLines write SetGridLines default False;
    property HotTrack: Boolean read FHotTrack write SetHotTrack default False;
    property RowSelect: Boolean read FRowSelect write SetRowSelect default False;
{$ENDIF}
{$IFNDEF D4}
    property FlatScrollBars: Boolean read FFlatScrollBars write SetFlatScrollBars default False;
    property FullDrag: Boolean read FFullDrag write SetFullDrag default False;
    property HotTrackStyles: TListHotTrackStyles read FHotTrackStyles write SetHotTrackStyles default [];
{$ENDIF}
{$IFNDEF D5}
    property HoverTime: Integer read GetHoverTime write SetHoverTime default -1;
{$ENDIF}

    property ShowScrollTips: Boolean read FShowScrollTips write FShowScrollTips default True; 
    property ShowToolTips: Boolean read GetToolTips write SetToolTips default True;
    property ToolTipOptions: TdcListViewToolTipOptions read FToolTipOptions write SetToolTipOptions default [];

    property OnAlignmentChanged: TLVColumnClickEvent read FOnAlignmentChanged write FOnAlignmentChanged;
    property OnDrawHeaderSection: TdcListViewDrawHeaderSection read FOnDrawHeaderSection write FOnDrawHeaderSection;
    property OnToolTip: TdcListViewToolTipEvent read FOnToolTip write FOnToolTip;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    property OnSettingsChanged: TNotifyEvent read FOnSettingsChanged write FOnSettingsChanged;
    property OnColumnResizeBegin: TdcListViewColumnResizeBeginEvent read FOnColumnResizeBegin write FOnColumnResizeBegin;
    property OnColumnResizeEnd: TLVColumnClickEvent read FOnColumnResizeEnd write FOnColumnResizeEnd;    
    {$IFDEF D4}
    property OnCustomDrawSubItemEx: TdcListViewCustomDrawSubItemExEvent read FOnCustomDrawSubItemEx write SetOnCustomDrawSubItemEx;
    property OnColumnDragged: TdcListViewColumnDragEvent read FOnColumnDragged write FOnColumnDragged;
    {$ENDIF}
  end;


{$IFDEF APPCONTROLS}
type
  TdcListView = class(TumCustomListView)
  published
    property Columns;
    property Items;
    property LargeImages;
    property SmallImages;
    property StateImages;
    
    property DragCursor;
    property DragMode;
{$IFDEF D4}
    property DragKind;
    property OnStartDock;
    property OnEndDock;
{$ENDIF}
    property OnStartDrag;
    property OnEndDrag;
    property OnDragDrop;
    property OnDragOver;
  end;

// -- TreeView -------------------------

  { TdcTreeViewCursors }
  TdcTreeViewCursors = class(TPersistent)
  private
    FBorder,
    FScrollHorz,
    FScrollVert: TCursor;
  published
    property Border: TCursor read FBorder write FBorder default crDefault;
    property ScrollHorz: TCursor read FScrollHorz write FScrollHorz default crDefault;
    property ScrollVert: TCursor read FScrollVert write FScrollVert default crDefault;
  end;

  { acTreeView }
  TdcTreeViewCustomPopupMenuEvent = procedure(Sender: TObject; ScreenX, ScreenY: Integer;
     ClickedNode: TTreeNode) of object;
  TdcTreeView = class(TTreeView)
  private
    FAbout: String;
    FCursors: TdcTreeViewCursors;
    FDragForm: Boolean;
    FMouseTrack: Boolean;

    FOnMouseEnter, FOnMouseLeave: TNotifyEvent;
    FOnCustomPopupMenu: TdcTreeViewCustomPopupMenuEvent;

    // for internal use
    FLastPoint: TPoint;

  {$IFNDEF D4}
    FAutoExpand,
    FHotTrack,
    FRowSelect,
    FToolTips: Boolean;

    procedure SetAutoExpand(Value: Boolean);
    procedure SetHotTrack(Value: Boolean);
    procedure SetRowSelect(Value: Boolean);
    procedure SetToolTips(Value: Boolean);
  {$ENDIF}
    function  GetItemHeight: ShortInt;
    procedure SetItemHeight(Value: ShortInt);
    function  GetSelectedAbsoluteIndex: Integer;
    procedure SetSelectedAbsoluteIndex(Value: Integer);

    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMSysColorChange(var Message: TWMSysColorChange); message WM_SYSCOLORCHANGE;
  protected
    procedure WndProc(var Message: TMessage); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    function ImportFromTXT(const FileName: String; RootNode: TTreeNode {$IFDEF D4} = nil;
       FirstLevelImageIndex: Integer = 0; SecondLevelImageIndex: Integer = -1;
       ThirdLevelImageIndex: Integer = -1 {$ENDIF}): Boolean;
    procedure ImportFromTreeView(SourceTreeView: TCustomTreeView;
       SourceRootNode: TTreeNode {$IFDEF D4} = nil {$ENDIF};
       TargetRootNode: TTreeNode {$IFDEF D4} = nil {$ENDIF});

    function FindNode(const Text: String): TTreeNode;
    function FindNodeByAbsoluteIndex(AbsoluteIndex: Integer): TTreeNode;

    property ItemHeight: ShortInt read GetItemHeight write SetItemHeight;
    property SelectedAbsoluteIndex: Integer read GetSelectedAbsoluteIndex write SetSelectedAbsoluteIndex default -1;
  published
    property About: String read FAbout write FAbout stored False;
    property Cursors: TdcTreeViewCursors read FCursors write FCursors;
    property DragForm: Boolean read FDragForm write FDragForm default False;
    property MouseTrack: Boolean read FMouseTrack write FMouseTrack default False;

    {$IFNDEF D4}
    property AutoExpand: Boolean read FAutoExpand write SetAutoExpand default False;
    property HotTrack: Boolean read FHotTrack write SetHotTrack default False;
    property RowSelect: Boolean read FRowSelect write SetRowSelect default False;
    property ToolTips: Boolean read FToolTips write SetToolTips default True;
    {$ENDIF}

    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    property OnCustomPopupMenu: TdcTreeViewCustomPopupMenuEvent read FOnCustomPopupMenu write FOnCustomPopupMenu;
  end;
{$ENDIF APPCONTROLS}

function UMDefaultListViewSort(Item1, Item2: TListItem;
  lParam: Integer): Integer; stdcall;

implementation

{$J+}{$I-}

uses Forms, StdCtrls, SysUtils, ShellAPI,
     {$IFDEF SUBITEMSBUGFIX} ImgList, {$ENDIF}
     {$IFDEF APPCONTROLS} acPropUtils, acUtils, acXPThemes
     {$ELSE} dcPropUtils, dcUtils, dcXPThemes {$ENDIF};

var
  ScrollHintWnd: THintWindow;
  ClickedColumn: Integer; // static only. do not put it to class.

function GetScrollHint: THintWindow;
begin
  if ScrollHintWnd = nil then
   begin
    ScrollHintWnd := HintWindowClass.Create(Application);
    ScrollHintWnd.Visible := False;
   end;
  Result := ScrollHintWnd;
end;

const
  DEF_SORT_ASCENDING  = 'Sort &Ascending';
  DEF_SORT_DESCENDING = 'Sort &Descending';

  { http://msdn.microsoft.com/library/sdkdoc/shellcc/CommCtls/ToolTip/ToolTip.htm }
  { http://msdn.microsoft.com/library/default.asp?url=/library/en-us/shellcc/platform/CommCtls/ListView/Messages/messages.asp }
  LVM_FIRST                     = $1000;
  LVM_GETITEMRECT               = LVM_FIRST + 14;
  LVM_GETEDITCONTROL            = LVM_FIRST + 24;
  LVM_SETEXTENDEDLISTVIEWSTYLE  = LVM_FIRST + 54;
  LVM_GETEXTENDEDLISTVIEWSTYLE  = LVM_FIRST + 55;
  LVM_SUBITEMHITTEST            = LVM_FIRST + 57;
  LVM_SETHOTCURSOR              = LVM_FIRST + 62;  
  LVM_SETHOVERTIME              = LVM_FIRST + 71;
  LVM_GETHOVERTIME              = LVM_FIRST + 72;
  LVM_GETTOOLTIPS               = LVM_FIRST + 78;

  LVN_GETINFOTIPW               = LVN_FIRST - 58;

  TTDT_AUTOMATIC                = 0;
  TTDT_AUTOPOP                  = 2;
  TTM_SETDELAYTIME              = WM_USER + 3;
  TTM_TRACKPOSITION             = WM_USER + 18;
  TTM_SETMAXTIPWIDTH            = WM_USER + 24;
  TTN_FIRST                     = -520;
  TTN_GETDISPINFOW              = TTN_FIRST - 10;

{$IFNDEF D3}
  WM_MOUSELEAVE                 = $02A3; // Exists since Win98

  { List View Extended Styles }
  LVS_EX_GRIDLINES        = $00000001;
  LVS_EX_SUBITEMIMAGES    = $00000002;
  LVS_EX_CHECKBOXES       = $00000004;
  LVS_EX_TRACKSELECT      = $00000008;
  LVS_EX_HEADERDRAGDROP   = $00000010;
  LVS_EX_FULLROWSELECT    = $00000020; // applies to report mode only
  LVS_EX_ONECLICKACTIVATE = $00000040;
  LVS_EX_TWOCLICKACTIVATE = $00000080;
{$ENDIF}
{$IFNDEF D4}
  LVS_EX_FLATSB           = $00000100;
  LVS_EX_REGIONAL         = $00000200;
  LVS_EX_INFOTIP          = $00000400; // listview does InfoTips for you
  LVS_EX_UNDERLINEHOT     = $00000800;
  LVS_EX_UNDERLINECOLD    = $00001000;
  LVS_EX_MULTIWORKAREAS   = $00002000;

  { TreeView }
  TVS_NOTOOLTIPS          = $0080;
  TVS_CHECKBOXES          = $0100;
  TVS_TRACKSELECT         = $0200;
  TVS_SINGLEEXPAND        = $0400;
  TVS_FULLROWSELECT       = $1000;
  TVM_SETITEMHEIGHT       = TV_FIRST + 27;
  TVM_GETITEMHEIGHT       = TV_FIRST + 28;

  { Header }
  HDN_BEGINDRAG           = HDN_FIRST - 10;
  HDN_ENDDRAG             = HDN_FIRST - 11;
{$ENDIF}

  { Definitions for the RegistrySaver }
  RSSortColumn    = 'SortColumn';
  RSSortDirection = 'SortDirection';
  RSViewStyle     = 'ViewStyle';

type
  NMTTDISPINFOW = packed record
    hdr: TNMHdr;
    lpszText: PWideChar;
    szText: Array[0..79] of WideChar;
    hinst: HINST;
    uFlags: UINT;
    lParam: LPARAM;
  end;
  PNMTTDispInfoW = ^TNMTTDispInfoW;
  TNMTTDispInfoW = NMTTDISPINFOW;

type
  tagLVHITTESTINFO = packed record
    pt: TPoint;
    flags: UINT;
    iItem: Integer;
    iSubItem: Integer;
  end;
  TLVHitTestInfo = tagLVHITTESTINFO;

{$IFNDEF D3}
function ListView_SetExtendedListViewStyle(hwndLV: HWND; dw: DWORD): BOOL;
begin
  Result := BOOL(SendMessage(hwndLV, LVM_SETEXTENDEDLISTVIEWSTYLE, 0, dw));
end;

{$IFDEF APPCONTROLS}
function ListView_SetHotCursor(hwndLV: HWND; hcur: HCURSOR): HCURSOR;
begin
  Result := SendMessage(hwndLV, LVM_SETHOTCURSOR, 0, hcur);
end;
{$ENDIF}
{$ENDIF}

{$IFNDEF D4}
function ListView_SetHoverTime(hwndLV: HWND; dwHoverTimeMs: DWORD): DWORD;
begin
  Result := SendMessage(hwndLV, LVM_SETHOVERTIME, 0, dwHoverTimeMs);
end;

function ListView_GetHoverTime(hwndLV: HWND): Integer;
begin
  Result := SendMessage(hwndLV, LVM_GETHOVERTIME, 0, 0);
end;

{$IFDEF APPCONTROLS}
function TreeView_SetItemHeight(hwnd: HWND; iHeight: Integer): Integer;
begin
  Result := SendMessage(hwnd, TVM_SETITEMHEIGHT, iHeight, 0);
end;

function TreeView_GetItemHeight(hwnd: HWND): Integer;
begin
  Result := SendMessage(hwnd, TVM_GETITEMHEIGHT, 0, 0);
end;
{$ENDIF}
{$ENDIF}


{$IFDEF SUBITEMSBUGFIX} // Delphi 5 memory leak bugfix
type
{$HINTS OFF}
   TdcHackListItem = class(TPersistent)
   private
     FOwner: TListItems;
     FSubItems: TStrings;
   end;
{$HINTS ON}   

   TdcHackListItems = class(TListItems)
   end;

   TdcFixedListItem = class(TListItem)
   public
     constructor Create(AOwner: TListItems);
   end;

   TdcFixedSubItems = class(TStringList)
   private
     FOwner: TListItem;
     FImageIndices: TList;
     procedure SetColumnWidth(Index: Integer);
     procedure RefreshItem(Index: Integer);
   protected
     function GetHandle: HWND;
     function Add(const S: string): Integer; override;
     procedure Delete(Index: Integer); override;
     procedure Put(Index: Integer; const St: String); override;
     procedure SetUpdateState(Updating: Boolean); override;
   public
     constructor Create(AOwner: TListItem);
     destructor Destroy; override;

     procedure Clear; override;
     procedure Insert(Index: Integer; const St: String); override;
     property Handle: HWND read GetHandle;
     property Owner: TListItem read FOwner;
   end;

constructor TdcFixedSubItems.Create(AOwner: TListItem);
begin
   inherited Create;
   FOwner := AOwner;
   FImageIndices := TList.Create;
end;

destructor TdcFixedSubItems.Destroy;
begin
   FImageIndices.Free;
   inherited;
end;

function TdcFixedSubItems.Add(const S: string): Integer;
begin
   Result := inherited Add(S);
   FImageIndices.Add(Pointer(-1));
   RefreshItem(Result + 1);
end;

procedure TdcFixedSubItems.Delete(Index: Integer);
begin
   inherited;
   FImageIndices.Delete(Index);
   Owner.Update;
end;

function TdcFixedSubItems.GetHandle: HWND;
begin
   Result := Owner.Owner.Handle;
end;

procedure TdcFixedSubItems.SetColumnWidth(Index: Integer);
var
   ListView: TCustomListView;
begin
   ListView := Owner.ListView;
   if TumCustomListView(ListView).ColumnsShowing and
      (TumCustomListView(ListView).Columns.Count > Index) and
      (ListView.Column[Index].WidthType = ColumnTextWidth) then
     TumCustomListView(ListView).UpdateColumn(Index);
end;

procedure TdcFixedSubItems.Insert(Index: Integer; const St: String);
var
  I: Integer;
begin
  inherited Insert(Index, St);
  FImageIndices.Insert(Index, Pointer(-1));
  for I := Index + 1 to Count do
    RefreshItem(I);
end;

procedure TdcFixedSubItems.Put(Index: Integer; const St: String);
begin
  inherited Put(Index, St);
  RefreshItem(Index + 1);
end;

procedure TdcFixedSubItems.RefreshItem(Index: Integer);
begin
   ListView_SetItemText(Handle, Owner.Index, Index, LPSTR_TEXTCALLBACK);
   SetColumnWidth(Index);
end;

procedure TdcFixedSubItems.SetUpdateState(Updating: Boolean);
begin
   TdcHackListItems(Owner.Owner).SetUpdateState(Updating);
end;

procedure TdcFixedSubItems.Clear; // The fix
begin
   inherited Clear;
   FImageIndices.Clear;
end;

constructor TdcFixedListItem.Create(AOwner: TListItems);
begin
   inherited Create(AOwner);
   SubItems.Free;
   TdcHackListItem(Self).FSubItems := TdcFixedSubItems.Create(Self);
end;
{$ENDIF}


{ TdcListViewCursors }
constructor TdcListViewCursors.Create(aListView: TumCustomListView);
begin
  inherited Create;
  ListView := aListView;
{$IFDEF APPCONTROLS}
  FHotCursor := crLinkSelect;
{$ENDIF}  
end;

{$IFDEF APPCONTROLS}
procedure TdcListViewCursors.SetHotCursor(Value: TCursor);
begin
  if FHotCursor <> Value then
   begin
    FHotCursor := Value;

    if not (csLoading in ListView.ComponentState) then
      ListView_SetHotCursor(ListView.Handle, Screen.Cursors[Value]);
   end;
end;
{$ENDIF}


{ TdcListViewHeaderMenu }
constructor TdcListViewHeaderMenu.Create(aListView: TumCustomListView);
begin
  inherited Create;
  ListView := aListView;
end;

procedure TdcListViewHeaderMenu.SetAlignLeftItem(Value: TComponent);
begin
  FAlignLeftItem := Value;
  if Assigned(FAlignLeftItem) then
   begin
    FAlignLeftItem.FreeNotification(ListView);
    with ListView do
     if not (csDesigning in ComponentState) then
      begin
       FOldAlignLeftItemClick := GetPropNotifyEventValue(FAlignLeftItem, 'OnClick');
       SetPropNotifyEventValue(FAlignLeftItem, 'OnClick', AlignLeftItemClick);
      end;
   end;
end;

procedure TdcListViewHeaderMenu.SetAlignRightItem(Value: TComponent);
begin
  FAlignRightItem := Value;
  if Assigned(FAlignRightItem) then
   begin
    FAlignRightItem.FreeNotification(ListView);
    with ListView do
     if not (csDesigning in ComponentState) then
      begin
       FOldAlignRightItemClick := GetPropNotifyEventValue(FAlignRightItem, 'OnClick');      
       SetPropNotifyEventValue(FAlignRightItem, 'OnClick', AlignRightItemClick);
      end;
   end;
end;

procedure TdcListViewHeaderMenu.SetAlignCenterItem(Value: TComponent);
begin
  FAlignCenterItem := Value;
  if Assigned(FAlignCenterItem) then
   begin
    FAlignCenterItem.FreeNotification(ListView);
    with ListView do
     if not (csDesigning in ComponentState) then
      begin
       FOldAlignCenterItemClick := GetPropNotifyEventValue(FAlignCenterItem, 'OnClick');      
       SetPropNotifyEventValue(FAlignCenterItem, 'OnClick', AlignCenterItemClick);
      end;
   end;
end;

procedure TdcListViewHeaderMenu.SetAscendingItem(Value: TComponent);
begin
  FAscendingItem := Value;
  if Assigned(FAscendingItem) then
   begin
    FAscendingItem.FreeNotification(ListView);
    with ListView do
     if not (csDesigning in ComponentState) then
      begin
       FOldAscendingItemClick := GetPropNotifyEventValue(FAscendingItem, 'OnClick');      
       SetPropNotifyEventValue(FAscendingItem, 'OnClick', AscendingItemClick);
      end;
   end;
end;

procedure TdcListViewHeaderMenu.SetDescendingItem(Value: TComponent);
begin
  FDescendingItem := Value;
  if Assigned(FDescendingItem) then
   begin
    FDescendingItem.FreeNotification(ListView);
    with ListView do
     if not (csDesigning in ComponentState) then
      begin
       FOldDescendingItemClick := GetPropNotifyEventValue(FDescendingItem, 'OnClick');      
       SetPropNotifyEventValue(FDescendingItem, 'OnClick', DescendingItemClick);
      end;
   end;
end;

procedure TdcListViewHeaderMenu.SetBestFitItem(Value: TComponent);
begin
  FBestFitItem := Value;
  if Assigned(FBestFitItem) then
   begin
    FBestFitItem.FreeNotification(ListView);
    with ListView do
     if not (csDesigning in ComponentState) then
      begin
       FOldBestFitItemClick := GetPropNotifyEventValue(FBestFitItem, 'OnClick');
       SetPropNotifyEventValue(FBestFitItem, 'OnClick', BestFitItemClick);
      end;
   end;
end;

{ TdcListViewRegistrySaver }
procedure TdcListViewRegistrySaver.DoSaveToRegistry(Reg: TRegistry);
var
  I: Integer;
begin
  if Owner is TumCustomListView then
   with Owner as TumCustomListView, Reg do
    begin
     WriteInteger(RSSortColumn, FSortColumn);
     WriteInteger(RSSortDirection, Integer(FSortDirection));
     WriteInteger(RSViewStyle, Integer(ViewStyle));
     I := Columns.Count;
     if I <> 0 then
      for I := 0 to I - 1 do
       WriteInteger(IntToStr(I), Columns[I].Width);
    end;
end;

procedure TdcListViewRegistrySaver.DoLoadFromRegistry(Reg: TRegistry);
var
  I: Integer;
begin
  if Owner is TumCustomListView then
   with Owner as TumCustomListView, Reg do
    begin
     SortColumn := ReadInteger(RSSortColumn);
     SortDirection := TdcListViewSortDirection(ReadInteger(RSSortDirection));
     ViewStyle := TViewStyle(ReadInteger(RSViewStyle));
     I := Columns.Count;
     if I <> 0 then
      for I := 0 to I - 1 do
       Columns[I].Width := ReadInteger(IntToStr(I));
    end;
end;

{$IFDEF USEINIFILES}
procedure TdcListViewRegistrySaver.DoSaveToIniFile(Ini: TIniFile);
var
  I: Integer;
begin
  if Owner is TumCustomListView then
   with Owner as TumCustomListView, Ini do
    begin
     WriteInteger(IniSection, RSSortColumn, FSortColumn);
     WriteInteger(IniSection, RSSortDirection, Integer(FSortDirection));
     WriteInteger(IniSection, RSViewStyle, Integer(ViewStyle));
     I := Columns.Count;
     if I <> 0 then
      for I := 0 to I - 1 do
       WriteInteger(IniSection, IntToStr(I), Columns[I].Width);
    end;
end;

procedure TdcListViewRegistrySaver.DoLoadFromIniFile(Ini: TIniFile);
var
  I: Integer;
begin
  if Owner is TumCustomListView then
   with Owner as TumCustomListView, Ini do
    begin
     SortColumn := ReadInteger(IniSection, RSSortColumn, SortColumn);
     SortDirection := TdcListViewSortDirection(ReadInteger(IniSection, RSSortDirection, Integer(SortDirection)));
     ViewStyle := TViewStyle(ReadInteger(IniSection, RSViewStyle, Integer(ViewStyle)));
     I := Columns.Count;
     if I <> 0 then
      for I := 0 to I - 1 do
       Columns[I].Width := ReadInteger(IniSection, IntToStr(I), Column[I].Width);
    end;
end;
{$ENDIF}


{ TumCustomListView }
function UMDefaultListViewSort(Item1, Item2: TListItem;
  lParam: Integer): Integer;

  function CompareItems(const Str1, Str2: String): Integer;

    function IsValidNumber(const S: String; var V: Extended): Boolean;
    var
      ErrCode: Integer;
    begin
      Val(S, V, ErrCode);
      Result := (ErrCode = 0);
    end;

    function IsValidDate(const S: String; var DT: TDateTime): Boolean;
    begin
      DT := StrToDateTimeDef(S, 0);
      Result := DT <> 0;
    end;

  var
    Val1, Val2: Extended;
    DT1, DT2: TDateTime;
  begin
    if (Str1 <> '') and (Str2 = '') then Result := -1 else
    if (Str2 <> '') and (Str1 = '') then Result := 1 else
    if IsValidNumber(Str1, Val1) and IsValidNumber(Str2, Val2) then
      if Val1 < Val2 then Result := -1 else
      if Val1 > Val2 then Result := 1 else Result := 0
    else
    if IsValidDate(Str1, DT1) and IsValidDate(Str2, DT2) then
      if DT1 < DT2 then Result := -1 else
      if DT1 > DT2 then Result := 1 else Result := 0
    else
      Result := AnsiCompareStr(Str1, Str2);
  end;

var
  Str1, Str2: String;
  Column: Integer;
begin
  with Item1 do
   if Assigned(TumCustomListView(ListView).OnCompare) then
     TumCustomListView(ListView).OnCompare(ListView, Item1, Item2, lParam, Result)
   else
    begin
     Column := LoWord(lParam);
     if Column = 0 then
      begin
       Str1 := Item1.Caption;
       Str2 := Item2.Caption;
      end
     else
      begin
       if Item1.SubItems.Count > Column - 1 then
         Str1 := Item1.SubItems[Column - 1]
       else
         Str1 := '';
       if Item2.SubItems.Count > Column - 1 then
         Str2 := Item2.SubItems[Column - 1]
       else
         Str2 := '';
      end;
      
     Result := CompareItems(Str1, Str2) * ShortInt(HiWord(lParam));
    end;
end;

constructor TumCustomListView.Create(aOwner: Tcomponent);
begin
  inherited;
  inherited ViewStyle := vsReport;
  inherited SortType := stData;
  DefaultSortProc := @UMDefaultListViewSort;

  FHeaderColor := clNone;
  FHoverSection := -1;
  FHeaderMenu := TdcListViewHeaderMenu.Create(Self);
  FCursors := TdcListViewCursors.Create(Self);
  FRegistrySaver := TdcListViewRegistrySaver.Create(Self);
  FSortMarkImageAsc := TPicture.Create;
  FSortMarkImageDesc := TPicture.Create;
{$IFDEF D3}
  FSortMarkImageAsc.OnChange := SortMarkImageChanged;
  FSortMarkImageDesc.OnChange := SortMarkImageChanged;
{$ENDIF}    

  FDefaultMenu := TPopupMenu.Create(Self);
  FDefAscendingItem := TMenuItem.Create(Self);
  FDefDescendingItem := TMenuItem.Create(Self);
{ If you'd like to show radio items for default
  header menu - uncoment next two lines }
//  FDefAscendingItem.RadioItem := True;
//  FDefDescendingItem.RadioItem := True;
  FDefAscendingItem.Caption := DEF_SORT_ASCENDING;
  FDefDescendingItem.Caption := DEF_SORT_DESCENDING;
  FDefAscendingItem.OnClick := AscendingItemClick;
  FDefDescendingItem.OnClick := DescendingItemClick;
  FDefaultMenu.Items.Add(FDefAscendingItem);
  FDefaultMenu.Items.Add(FDefDescendingItem);
  
  FShowHeaderMenu := True;
  FShowScrollTips := True;
  FShowSortMark := True;
  FShowToolTips := True;

  ClickedColumn := -1;

  {$IFDEF D6}
  FHeaderInstance := Classes.MakeObjectInstance(HeaderWndProc);
  {$ELSE}
  FHeaderInstance := MakeObjectInstance(HeaderWndProc);
  {$ENDIF}
end;

destructor TumCustomListView.Destroy;
begin
  if FHeaderHandle <> 0 then
    SetWindowLong(FHeaderHandle, GWL_WNDPROC, LongInt(FOldHeaderWndProc));
  {$IFDEF D6}
  Classes.FreeObjectInstance(FHeaderInstance);
  {$ELSE}
  FreeObjectInstance(FHeaderInstance);
  {$ENDIF}
  FDefaultMenu.Free;
  FSortMarkImageDesc.Free;
  FSortMarkImageAsc.Free;
  FRegistrySaver.Free;
  FCursors.Free;
  FHeaderMenu.Free;

  inherited;
end;

procedure TumCustomListView.Notification(aComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if Operation = opRemove then
   if aComponent = FHeaderMenu.FPopupMenu then
     FHeaderMenu.FPopupMenu := nil
   else
    if aComponent = FHeaderMenu.FAscendingItem then
      FHeaderMenu.FAscendingItem := nil
    else
     if aComponent = FHeaderMenu.FDescendingItem then
       FHeaderMenu.FDescendingItem := nil
     else
      if aComponent = FHeaderMenu.FAlignLeftItem then
        FHeaderMenu.FAlignLeftItem := nil
      else
       if aComponent = FHeaderMenu.FAlignRightItem then
         FHeaderMenu.FAlignRightItem := nil
       else
        if aComponent = FHeaderMenu.FAlignCenterItem then
          FHeaderMenu.FAlignCenterItem := nil
        else
         if aComponent = FHeaderMenu.FBestFitItem then
           FHeaderMenu.FBestFitItem := nil;    
end;

procedure TumCustomListView.Loaded;
begin
  inherited;

  // fix the hot cursor
{$IFDEF APPCONTROLS}
  if FCursors.FHotCursor <> crLinkSelect then
    ListView_SetHotCursor(Handle, Screen.Cursors[FCursors.FHotCursor]);
{$ENDIF}

  // load sorting rules from the registry
  FRegistrySaver.Load;
end;

procedure TumCustomListView.CreateWnd;
begin
  inherited;
  ShowToolTips := FShowToolTips;
end;

procedure TumCustomListView.AlignControls(aControl: TControl; var Rect: TRect);
begin
  { This f**king kluge required to avoid D4/D5+ bug of ListView
    which occurs when something trying to
    change the WindowState of owner form on stage of
    loading properties (i.e: when acFormPlacementSaver want
    to restore settings from registry and maximize form on startup)
    AND ListView with ViewStyle=vsReport contains couple of
    columns which does not fit the width of control.
    This variable will not let to realign controls on loading...
    Aleksey, 2 April, 2002 }
end;

{$IFDEF SUBITEMSBUGFIX}
function TumCustomListView.CreateListItem: TListItem;
begin
   Result := TdcFixedListItem.Create(Items);
end;
{$ENDIF}

procedure TumCustomListView.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TumCustomListView.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

procedure TumCustomListView.CMSysColorChange(var Message: TMessage);
begin
  if HandleAllocated then
   begin
    { bugfix for regular ListView. This fixes the appearance
      when the system colors is changed }
    ListView_SetTextBkColor(Handle, ColorToRGB(Color));
    ListView_SetBkColor(Handle, ColorToRGB(Color));
   end
end;

procedure TumCustomListView.CMWinIniChange(var Message: TMessage);
begin
  inherited;
  if Message.wParam <> 20 then { wallpaper changed }
    UpdateListItems;
end;

procedure TumCustomListView.CNKeyDown(var Message: TWMKey);
begin
  { avoiding clicking the default buttons in dialogs
    when the list item currently editing (5-Sep-2001, AK) }
  if not IsEditing then
   begin
    Message.Result := 1;
    inherited;
   end;
end;

{$IFDEF D4}
procedure TumCustomListView.CNNotify(var Message: TWMNotify);
begin
  with Message do
    case NMHdr^.code of
     { Kludge for correct custom drawing of subitems.
       Used to determinate correct drawing rectangle.
       Unfortunately standard routine does not provide us with
       drawing rectangle + we could not determinate the column
       width using Width property since it does not change
       dynamically on resize :-(. }
      NM_CUSTOMDRAW: if not (csDesigning in ComponentState) and
                        Assigned(FOnCustomDrawSubItemEx) then
                      CustomDrawRect := PNMCustomDraw(NMHdr)^.rc;
     end;
  inherited;
end;
{$ENDIF}

{$IFDEF D3}
procedure TumCustomListView.WMLButtonUp(var Message: TWMLButtonUp);
var
  Item: TListItem;
begin
  // before inherited, while it has csClicked in ControlState
  if FCheckOnClick and (csClicked in ControlState) and Checkboxes and (ViewStyle = vsReport) and
     PtInRect(ClientRect, SmallPointToPoint(Message.Pos)) then
   begin
    with Message.Pos do
     Item := GetItemAt(X, Y);
    if Item <> nil then
      Item.Checked := not Item.Checked;
   end;
  inherited;
end;
{$ENDIF}

procedure TumCustomListView.WMParentNotify(var Message: TWMParentNotify);
begin
  with Message do
   if (Event = WM_CREATE) and (FHeaderHandle = 0) then
    begin
     FHeaderHandle := ChildWnd;
     HeaderStyle := FHeaderStyle; // reset it
     FOldHeaderWndProc := Pointer(GetWindowLong(FHeaderHandle, GWL_WNDPROC));
     SetWindowLong(FHeaderHandle, GWL_WNDPROC, LongInt(FHeaderInstance));
    end;
  inherited;
end;

procedure TumCustomListView.WMDrawHeader(var Message: TWMDrawItem);
var
  State: TOwnerDrawState;
  SavedDC: Integer;
  Canvas: TCanvas;
begin
  with Message.DrawItemStruct^ do
   begin
    if not IsThemeEnabled and ColumnDragging then Exit;

    Message.Result := 1;
    {$IFDEF D5}
    State := TOwnerDrawState(LongRec(ItemState).Lo);
    {$ELSE}
    State := TOwnerDrawState(WordRec(LongRec(ItemState).Lo).Lo);
    {$ENDIF}

    Canvas := TCanvas.Create;
    with Canvas do
     try
       SavedDC := SaveDC(hDC);
       try
         Handle := hDC;
         Font := inherited Font;

         if Assigned(FOnDrawHeaderSection) then
           FOnDrawHeaderSection(Self, Canvas, rcItem, ItemID, odSelected in State)
         else
           DrawHeader(Canvas, rcItem, ItemID, odSelected in State);
       finally
         HeaderVisible := True;
         Handle := 0;
         RestoreDC(hDC, SavedDC);
       end;
     finally
       Free;
     end;
   end;
end;

procedure TumCustomListView.WMNotify(var Message: TWMNotify);
const
  NotifyBusy: Boolean = False;
var
  I: Integer;
  Item: THDItem;
begin
  case Message.NMHdr.Code of
    HDN_BEGINDRAG: if FullDrag then ColumnDragging := True;
    HDN_ENDDRAG: begin  // Foolishing the column: AK, 11-NOV-2001
                  ColumnDragging := False;
{$IFDEF D4}
                  Invalidate; // invalidate items

                  ColumnDragged := True;
                  Exit; // but don't pass it to default handler
{$ENDIF}
                 end;
   end;

  inherited;
  if NotifyBusy then Exit;

  case Message.NMHdr.Code of
    HDN_ITEMCHANGED,
    HDN_ITEMCHANGEDW: if HandleAllocated then
                       try
                         NotifyBusy := True;

                         // the ownerdraw flag
                         for I := Columns.Count - 1 downto 0 do
                          begin
                           Item.Mask := HDI_FORMAT;
                           if Header_GetItem(FHeaderHandle, I, Item) then
                            begin
                             Item.Fmt := Item.Fmt or HDF_OWNERDRAW;
                             Header_SetItem(FHeaderHandle, I, Item);
                            end;
                          end;
                       finally
                         NotifyBusy := False;
                       end;
   end;
end;

procedure TumCustomListView.WMVScroll(var Message: TWMVScroll);
var
  ScrollHint: THintWindow;
  s: ShortString;
  rc: TRect;
  pt: TPoint;
begin
  inherited;

  if FShowScrollTips then
   with Message do
    case ScrollCode of
      SB_THUMBTRACK: if ViewStyle = vsReport then
         begin
          ScrollHint := GetScrollHint;
          with ScrollHint do
           begin
            { getting the caption }
            if (SortColumn < 1) or (SortColumn > Items[Pos].SubItems.Count) then
              s := Items[Pos].Caption
            else
              s := Items[Pos].SubItems[SortColumn - 1];
            ScrollHint.Visible := s <> '';
            if not Visible then
             begin
              ActivateHint(Rect(0, 0, 0, 0), '');
              Exit;
             end
            else Color := Application.HintColor;
           end;

          { displaying the hint }
{$IFDEF D3}
          rc := ScrollHint.CalcHintRect(250, s, nil);
{$ELSE}
          rc := Rect(0, 0,
                     ScrollHint.Canvas.TextWidth(s) + 6,
                     ScrollHint.Canvas.TextHeight(s) + 4);
{$ENDIF}
          GetCursorPos(pt);
          pt := ScreenToClient(pt);
          pt := ClientToScreen(Point(ClientWidth - rc.Right - 2, pt.y));
          OffsetRect(rc, pt.x, pt.y);
          ScrollHint.ActivateHint(rc, s);
{$IFNDEF D3}
          ScrollHint.Invalidate;
{$ENDIF}
          ScrollHint.Update;
         end;
      SB_ENDSCROLL:
         with GetScrollHint do
          begin
           Visible := False;          
           ActivateHint(Rect(0, 0, 0, 0), '');
          end;
     end;
end;

procedure TumCustomListView.ColClick(Column: TListColumn);
begin
  if Column.Index = FSortColumn then
    SortDirection := TdcListViewSortDirection(not Boolean(FSortDirection))
  else
    SortColumn := Column.Index;
  inherited;
end;

procedure TumCustomListView.AlignLeftItemClick(Sender: TObject);
begin
  if Assigned(FOldAlignLeftItemClick) then
    FOldAlignLeftItemClick(Sender);

  if (ClickedColumn < 0) or (ClickedColumn >= Columns.Count) or (FHeaderHandle = 0) then Exit;
  Columns[ClickedColumn].Alignment := taLeftJustify;
  AlignmentChanged(Column[ClickedColumn]);
end;

procedure TumCustomListView.AlignRightItemClick(Sender: TObject);
begin
  if Assigned(FOldAlignRightItemClick) then
    FOldAlignRightItemClick(Sender);

  if (ClickedColumn < 0) or (ClickedColumn >= Columns.Count) or (FHeaderHandle = 0) then Exit;
  Columns[ClickedColumn].Alignment := taRightJustify;
  AlignmentChanged(Column[ClickedColumn]);
end;

procedure TumCustomListView.AlignCenterItemClick(Sender: TObject);
begin
  if Assigned(FOldAlignCenterItemClick) then
    FOldAlignCenterItemClick(Sender);

  if (ClickedColumn < 0) or (ClickedColumn >= Columns.Count) or (FHeaderHandle = 0) then Exit;
  Columns[ClickedColumn].Alignment := taCenter;
  AlignmentChanged(Column[ClickedColumn]);
end;

procedure TumCustomListView.AscendingItemClick(Sender: TObject);
begin
  if Assigned(FOldAscendingItemClick) then
    FOldAscendingItemClick(Sender);

  if (ClickedColumn < 0) or (ClickedColumn >= Columns.Count) or (FHeaderHandle = 0) then Exit;

  FSortDirection := sdAscending;
  SortColumn := ClickedColumn;

  if Assigned(OnColumnClick) then
    OnColumnClick(Self, Columns[ClickedColumn]);
end;

procedure TumCustomListView.DescendingItemClick(Sender: TObject);
begin
  if Assigned(FOldDescendingItemClick) then
    FOldDescendingItemClick(Sender);

  if (ClickedColumn < 0) or (ClickedColumn >= Columns.Count) or (FHeaderHandle = 0) then Exit;

  FSortDirection := sdDescending;
  SortColumn := ClickedColumn;

  if Assigned(OnColumnClick) then
    OnColumnClick(Self, Columns[ClickedColumn]);
end;

procedure TumCustomListView.BestFitItemClick(Sender: TObject);
begin
  if Assigned(FOldBestFitItemClick) then
    FOldBestFitItemClick(Sender);

  BestFit;
end;

{$IFDEF D3}
procedure TumCustomListView.SortMarkImageChanged(Sender: TObject);
begin
  if IsPictureNotEmpty(FSortMarkImageAsc) then
    FSortMarkImageAsc.Graphic.Transparent := True;
  if IsPictureNotEmpty(FSortMarkImageDesc) then
    FSortMarkImageDesc.Graphic.Transparent := True;
end;
{$ENDIF}

procedure TumCustomListView.HeaderWndProc(var Message: TMessage);
var
  Pnt: TPoint;
  Column: TListColumn;
{$IFDEF D4}
  ColumnOrder: array of Integer;
{$ENDIF}
  HTI: THDHitTestInfo;
begin
  with Message do
   try
     case Msg of
       WM_MOUSEMOVE: if IsThemeEnabled then
                      begin
                       HTI.Point := Point(LoWord(lParam), HiWord(lParam));
                       SendMessage(FHeaderHandle, HDM_HITTEST, 0, Integer(@HTI));
                       HoverSection := HTI.Item;
                      end;
       WM_MOUSELEAVE: HoverSection := -1; // Does not exists in Win95, but who cares. This made for XP and higher :-)
       WM_SETCURSOR: with FCursors do
                      begin
                       Result := CallWindowProc(FOldHeaderWndProc, FHeaderHandle, Msg, WParam, LParam);

                       if GetCursor = Screen.Cursors[crDefault] then
                        if FHeader <> crDefault then
                          Windows.SetCursor(Screen.Cursors[FCursors.FHeader])
                        else
                       else // Divider
                        if FDivider <> crDefault then
                          Windows.SetCursor(Screen.Cursors[FCursors.FDivider]);
                      Exit;
                     end;
       WM_RBUTTONUP: begin
                      HTI.Point := Point(LoWord(lParam), HiWord(lParam));
                      SendMessage(FHeaderHandle, HDM_HITTEST, 0, Integer(@HTI));
                      if HTI.Item <> -1 then
                        Column := Columns[HTI.Item]
                      else
                        Column := nil;

                      if Column <> nil then
                       with FHeaderMenu do
                        begin
                         ClickedColumn := Column.Index;

                         FDefAscendingItem.Checked := (ClickedColumn = SortColumn) and (SortDirection = sdAscending);
                         FDefDescendingItem.Checked := (ClickedColumn = SortColumn) and (SortDirection = sdDescending);
                         SetItemChecked(FAscendingItem, FDefAscendingItem.Checked);
                         SetItemChecked(FDescendingItem, FDefDescendingItem.Checked);
                         SetItemChecked(FAlignLeftItem, Column.Alignment = taLeftJustify);
                         SetItemEnabled(FAlignLeftItem, Column.Index <> 0);
                         SetItemChecked(FAlignRightItem, Column.Alignment = taRightJustify);
                         SetItemEnabled(FAlignRightItem, Column.Index <> 0);
                         SetItemChecked(FAlignCenterItem, Column.Alignment = taCenter);
                         SetItemEnabled(FAlignCenterItem, Column.Index <> 0);

                         if FShowHeaderMenu then
                          begin
                           Pnt := ClientToScreen(Point(LoWord(lParam), HiWord(lParam)));
                           if Assigned(FPopupMenu) then
                             FPopupMenu.Popup(Pnt.X, Pnt.Y)
                           else
                             FDefaultMenu.Popup(Pnt.X, Pnt.Y);
                           Exit; // don't pass it to the listview                             
                          end;
                        end
                      else ClickedColumn := -1;
                     end;
       WM_CAPTURECHANGED: begin
                           ColumnDragging := False;
{$IFDEF D4}
                           if ColumnDragged then
                            begin
                             ColumnDragged := False;
                             { fire overriden and altered event,
                               see also HDN_ENDDRAG, AK: 11-NOV-2001 }

                             if Assigned(OnColumnDragged) then
                              begin
                               SetLength(ColumnOrder, Columns.Count);
                               ListView_GetColumnOrderArray(Handle, Columns.Count, PInteger(ColumnOrder));
                               OnColumnDragged(Self, ColumnOrder);
                              end;
                            end;
{$ENDIF}
                          end;
       WM_NCDESTROY: begin
                      FRegistrySaver.Save;
                      Result := CallWindowProc(FOldHeaderWndProc, FHeaderHandle, Msg, WParam, LParam);
                      FHeaderHandle := 0;
                      FOldHeaderWndProc := nil;
                      Exit;
                     end;
      end;
     Result := CallWindowProc(FOldHeaderWndProc, FHeaderHandle, Msg, WParam, LParam);
   except
     Application.HandleException(Self);
   end;
end;

procedure TumCustomListView.SetHeaderColor(Value: TColor);
begin
  if FHeaderColor <> Value then
   begin
    FHeaderColor := Value;
    RepaintHeader;
   end;
end;

procedure TumCustomListView.SetHeaderStyle(Value: THeaderStyle);
var
  PrevLong, Long: LongInt;
begin
  FHeaderStyle := Value;
  if FHeaderHandle = 0 then Exit;

  PrevLong := GetWindowLong(FHeaderHandle, GWL_STYLE);
  if FHeaderStyle = hsButtons then
    Long := PrevLong or HDS_BUTTONS
  else
    Long := PrevLong and (not HDS_BUTTONS);

  if PrevLong <> Long then
    SetWindowLong(FHeaderHandle, GWL_STYLE, Long);
end;

procedure TumCustomListView.SetShowSortMark(Value: Boolean);
begin
  if FShowSortMark <> Value then
   begin
    FShowSortMark := Value;
    RepaintHeader;
   end;
end;

procedure TumCustomListView.SetSortDirection(Value: TdcListViewSortDirection);
begin
  if FSortDirection <> Value then
   begin
    FSortDirection := Value;
    RepaintHeader;
    if SortType <> stNone then AlphaSort;
   end;
end;

procedure TumCustomListView.SetSortColumn(Value: Word);
begin
  FSortColumn := Value;
  RepaintHeader;
  if SortType <> stNone then AlphaSort;
end;

procedure TumCustomListView.SetSortMarkAlign(Value: TdcListViewSortMarkAlign);
begin
  if FSortMarkAlign <> Value then
   begin
    FSortMarkAlign := Value;
    RepaintHeader;
   end;
end;

procedure TumCustomListView.SetSortMarkKind(Value: TdcListViewSortMarkKind);
begin
  if FSortMarkKind <> Value then
   begin
    FSortMarkKind := Value;
    RepaintHeader;
   end;
end;

procedure TumCustomListView.SetSortMarkImageAsc(Value: TPicture);
begin
  FSortMarkImageAsc.Assign(Value);
  RepaintHeader;
end;

procedure TumCustomListView.SetSortMarkImageDesc(Value: TPicture);
begin
  FSortMarkImageDesc.Assign(Value);
  RepaintHeader;
end;

function  TumCustomListView.GetSortType: TSortType;
begin
  Result := inherited SortType;
end;

procedure TumCustomListView.SetSortType(Value: TSortType);
begin
  inherited SortType := Value;
  RepaintHeader;
end;

procedure TumCustomListView.SetHoverSection(Value: Integer);
begin
  if FHoverSection <> Value then
   begin
    FHoverSection := Value;
    if IsThemeEnabled then
      RepaintHeader;
   end;
end;

{$IFNDEF D4}
procedure TumCustomListView.ResetExStyles;
var
  Styles: DWORD;
  TempImages: TImageList;
begin
  if HandleAllocated then
   begin
    TempImages := nil;
    if StateImages <> nil then
    begin
      TempImages := StateImages;
      StateImages := nil;
    end;
    Styles := 0;
    {$IFNDEF D3}
    if FGridLines then Styles := Styles or LVS_EX_GRIDLINES;
    if FHotTrack then Styles := Styles or LVS_EX_TRACKSELECT;
    if FRowSelect then Styles := Styles or LVS_EX_FULLROWSELECT;
    {$ENDIF}
    if FFlatScrollBars then Styles := Styles or LVS_EX_FLATSB;
    if FFullDrag then Styles := Styles or LVS_EX_HEADERDRAGDROP;
    if htHandPoint in FHotTrackStyles then
      Styles := Styles or LVS_EX_ONECLICKACTIVATE
    else if FHotTrackStyles * [htUnderlineHot, htUnderlineCold] <> [] then
      Styles := Styles or LVS_EX_TWOCLICKACTIVATE;
    if htUnderlineHot in FHotTrackStyles then
      Styles := Styles or LVS_EX_UNDERLINEHOT;
    if htUnderlineCold in FHotTrackStyles then
      Styles := Styles or LVS_EX_UNDERLINECOLD;
    ListView_SetExtendedListViewStyle(Handle, Styles);
    if TempImages <> nil then
      StateImages := TempImages;
   end;
end;
{$ENDIF}

{$IFNDEF D3}
procedure TumCustomListView.SetGridLines(Value: Boolean);
begin
  if FGridLines <> Value then
   begin
    FGridLines := Value;
    ResetExStyles;
   end;
end;

procedure TumCustomListView.SetHotTrack(Value: Boolean);
begin
  if FHotTrack <> Value then
   begin
    FHotTrack := Value;
    ResetExStyles;
   end;
end;

procedure TumCustomListView.SetRowSelect(Value: Boolean);
begin
  if FRowSelect <> Value then
   begin
    FRowSelect := Value;
    ResetExStyles;
   end;
end;
{$ENDIF}

{$IFNDEF D4}
procedure TumCustomListView.SetFlatScrollBars(Value: Boolean);
begin
  if FFlatScrollBars <> Value then
   begin
    FFlatScrollBars := Value;
    ResetExStyles;
   end;
end;

procedure TumCustomListView.SetFullDrag(Value: Boolean);
begin
  if FFullDrag <> Value then
   begin
    FFullDrag := Value;
    ResetExStyles;
   end;
end;

procedure TumCustomListView.SetHotTrackStyles(Value: TListHotTrackStyles);
begin
  if FHotTrackStyles <> Value then
   begin
    FHotTrackStyles := Value;
    ResetExStyles;
   end;
end;
{$ENDIF}

{$IFNDEF D5}
function  TumCustomListView.GetHoverTime: Integer;
begin
  Result := ListView_GetHoverTime(Handle);
end;

procedure TumCustomListView.SetHoverTime(Value: Integer);
begin
  if Value <> GetHoverTime then
    ListView_SetHoverTime(Handle, Value);
end;
{$ENDIF}

{$IFDEF D4}
procedure TumCustomListView.SetOnCustomDrawSubItemEx(const Value: TdcListViewCustomDrawSubItemExEvent);
begin
  FOnCustomDrawSubItemEx := Value;
  
  if not (csDesigning in ComponentState) then
    if Assigned(Value) then
      OnCustomDrawSubItem := StdOnCustomDrawSubItemHook
    else
      OnCustomDrawSubItem := nil;
end;

procedure TumCustomListView.StdOnCustomDrawSubItemHook(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  // this is kludge. nothing should happend
end;
{$ENDIF}

procedure TumCustomListView.AlignmentChanged(Column: TListColumn);
begin
  if Assigned(FOnAlignmentChanged) then
    FOnAlignmentChanged(Self, Column);
end;

procedure TumCustomListView.ColumnResizeBegin(Column: TListColumn; var AllowResize: Boolean);
begin
  if Assigned(FOnColumnResizeBegin) then
    FOnColumnResizeBegin(Self, Column, AllowResize);
end;

procedure TumCustomListView.ColumnResizeEnd(Column: TListColumn);
begin
  if Assigned(FOnColumnResizeEnd) then
    FOnColumnResizeEnd(Self, Column);
end;

procedure TumCustomListView.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  MouseX := X;
  MouseY := Y;
  inherited;
end;

function TumCustomListView.GetToolTips: Boolean;
begin
  if csDesigning in ComponentState then
    Result := FShowToolTips
  else
    Result := (SendMessage(Handle, LVM_GETEXTENDEDLISTVIEWSTYLE, 0, 0) and LVS_EX_INFOTIP) > 0;
end;

procedure TumCustomListView.SetToolTips(Value: Boolean);
const
  ExtendedStyles: Array[Boolean] of Integer = (0, LVS_EX_INFOTIP);
begin
  FShowToolTips := Value;

  if not (csDesigning in ComponentState) then
    SendMessage(Handle, LVM_SETEXTENDEDLISTVIEWSTYLE,
                LVS_EX_INFOTIP, ExtendedStyles[Value]);
end;

procedure TumCustomListView.SetToolTipOptions(Value: TdcListViewToolTipOptions);
const
  Auto: Array[Boolean] of Integer = (500, 1);
  AutoPop: Array[Boolean] of Integer = (3000, 32000);
var
  ToolTip: HWND;
begin
  if (ttoOffset in Value) and not (ttoOffset in FToolTipOptions) then
    Value := Value - [ttoBelowItem];
  if (ttoBelowItem in Value) and not (ttoBelowItem in FToolTipOptions) then
    Value := Value - [ttoOffset];
  FToolTipOptions := Value;
  
  ToolTip := SendMessage(Handle, LVM_GETTOOLTIPS, 0, 0);
  SendMessage(ToolTip, TTM_SETDELAYTIME, TTDT_AUTOMATIC, Auto[ttoInstantShow in FToolTipOptions]);
  SendMessage(ToolTip, TTM_SETDELAYTIME, TTDT_AUTOPOP, AutoPop[ttoLongStay in FToolTipOptions]);
end;

function  TumCustomListView.GetViewStyle: TViewStyle;
begin
  Result := inherited ViewStyle;
end;

procedure TumCustomListView.SetViewStyle(Value: TViewStyle);
begin
  inherited ViewStyle := Value;
  { bugfix: the listview does not sorts items when ViewStyle changes }
  AlphaSort;
end;

procedure TumCustomListView.WndProc(var Message: TMessage);
var
  Wnd: HWND;
  WinPlace: TWindowPlacement;
  HitTest: TLVHitTestInfo;
  x, y: Integer;
  Item: TListItem;
  ItemBound: TRect;
  CursorPos: TPoint;
  AllowResize: Boolean;
begin
  with Message do
   begin
    case Msg of
      WM_NOTIFY: case PHDNotify(lParam)^.HDR.Code of
                   HDN_BEGINTRACK, HDN_BEGINTRACKW:
                     begin
                      AllowResize := True;
                      ColumnResizeBegin(Columns[PHDNotify(lParam)^.Item], AllowResize);
                      if not AllowResize then
                       begin
                        Result := 1;
                        Exit; // don't pass to default handler
                       end;
                     end;
                  end;
      WM_SETCURSOR: with FCursors do
                     begin
                      case TWMSetCursor(Message).HitTest of
                        htBorder: SetCursor(Screen.Cursors[FBorder]);
                        htHScroll: SetCursor(Screen.Cursors[FScrollHorz]);
                        htVScroll: SetCursor(Screen.Cursors[FScrollVert]);
                        else inherited
                       end;
                      Exit;
                     end;
      WM_ERASEBKGND: if not HeaderVisible then RepaintHeader;
      LVM_SORTITEMS: begin
                      if ViewStyle = vsReport then WParamLo := SortColumn
                      else WParamLo := 0;
                      if FSortDirection = sdAscending then WParamHi := 1
                      else WParamHi := Word(-1);
                      LParam := Integer(DefaultSortProc);
                     end;
{$IFDEF D4}{$IFNDEF D6} // WARNING! CRITICAL BUGFIX (23.03.2003, AK)
// This is bugfix for BCB4 and Delphi 5. They did not cleaned LVCF_IMAGE flag,
// thus it leads to critical system crash (kernel32 error and system crash) under
// Windows XP in applications which has an XP manifest.
      LVM_SETCOLUMN: with PLVColumn(lParam)^ do
                      if Columns[wParam].ImageIndex = -1 then
                        mask := mask and not LVCF_IMAGE;
{$ENDIF}{$ENDIF}
     end;

   inherited;

   if Msg <> WM_NOTIFY then Exit;

   Wnd := PNMHdr(lParam)^.hWndFrom;
   case PNMHdr(lParam)^.Code of
     HDN_ENDTRACK, HDN_ENDTRACKW: ColumnResizeEnd(Columns[PHDNotify(lParam)^.Item]);
     TTN_GETDISPINFOW:
       begin
        SetToolTipOptions(FToolTipOptions); //in case of dynamic creation
        if Assigned(FOnToolTip) then
         begin
          HitTest.pt.x := MouseX + 2;
          HitTest.pt.y := MouseY;
          HitTest.iItem := -1; //in case of unsupported hittest message
          HitTest.iSubItem := -1;
          SendMessage(Handle, LVM_SUBITEMHITTEST, 0, Integer(@HitTest));
          if HitTest.iItem >= 0 then
           begin
            Item := Items[HitTest.iItem];
            if HitTest.iSubItem > Item.SubItems.Count then Exit;

            if PNMTTDispInfoW(Message.lParam)^.lpszText <> nil then
              FToolTipText := WideCharToString(PNMTTDispInfoW(Message.lParam)^.lpszText)
            else
              FToolTipText := '';

            FOnToolTip(Self, FToolTipText, Item, HitTest.iSubItem);

            GetMem(PNMTTDispInfoW(Message.lParam)^.lpszText, SizeOf(WideChar) * Length(FToolTipText) + 2);
            StringToWideChar(FToolTipText, PNMTTDispInfoW(Message.lParam)^.lpszText, Length(FToolTipText) shl 1);

            // allow multiline tooltips. maxwidth=400pixels
            SendMessage(Wnd, TTM_SETMAXTIPWIDTH, 0, 400);
           end;
         end;
       end;
     TTN_SHOW:
       begin
        SetToolTipOptions(FToolTipOptions); //in case of dynamic creation
        WinPlace.Length := SizeOf(WinPlace);
        GetWindowPlacement(Wnd, @WinPlace);
        HitTest.pt.x := MouseX + 2;
        HitTest.pt.y := MouseY;
        HitTest.iItem := -1; //in case of unsupported hittest message
        HitTest.iSubItem := -1;
        SendMessage(Handle, LVM_SUBITEMHITTEST, 0, Integer(@HitTest));
        if HitTest.iItem >= 0 then
         begin
          ItemBound.Left := LVIR_LABEL;
          SendMessage(Handle, LVM_GETITEMRECT, HitTest.iItem, Integer(@ItemBound));
          y := WinPlace.rcNormalPosition.Top;
          x := WinPlace.rcNormalPosition.Left;
          if ttoOffset in FToolTipOptions then
           begin
            GetCursorPos(CursorPos);
            x := CursorPos.x + 16;
            y := CursorPos.y + 16;
           end
          else
           if ttoBelowItem in FToolTipOptions then
             inc(y, ItemBound.Bottom - ItemBound.Top);
          SetWindowPos(Wnd, HWND_TOPMOST, x, y, 0, 0, SWP_NOSIZE or SWP_NOACTIVATE);
         end;
       end;
    end;
  end;
end;

{$IFDEF D4}
function TumCustomListView.CustomDrawSubItem(Item: TListItem; SubItem: Integer; State: TCustomDrawState; Stage: TCustomDrawStage): Boolean;
var
  DC: hDC;
  InternalRect, ItemRect: TRect;
  Bitmap: TBitmap;

  function IsSelected: Boolean;
  var
    I, DirtBegin, IFound: Integer;
    ColumnOrders: Array of Integer;
  begin
    { checking whether this is clean position
      (all normal items comes after custom items) }
    I := Columns.Count;
    SetLength(ColumnOrders, I);
    ListView_GetColumnOrderArray(Handle, I, PInteger(ColumnOrders));
    IFound := -1;
    DirtBegin := 0;
    for I := 0 to I - 1 do
     begin
      if ColumnOrders[I] = SubItem then IFound := I;
      if Columns[ColumnOrders[I]].ImageIndex = -1 then
       begin
        DirtBegin := I;
        Break;
       end;
     end;

    Result := (IFound = -1) or (IFound >= DirtBegin);
  end;

begin
  Result := True;
  if Stage = cdPrePaint then
   begin
    if Assigned(OnCustomDrawSubItem) then
      OnCustomDrawSubItem(Self, Item, SubItem, State, Result);

    if (Item.SubItems.Count >= SubItem) and
      Assigned(FOnCustomDrawSubItemEx) then
     begin
      Bitmap := TBitmap.Create;
      try
        with Bitmap do
         begin
          { correct rectangle }
          ItemRect := Item.DisplayRect(drBounds);
          { temporary bitmap bounds }
          Width := CustomDrawRect.Right - CustomDrawRect.Left;
          Height := ItemRect.Bottom - ItemRect.Top;
          { for temporary drawing in the event handler }
          InternalRect := Rect(0, 0, Bitmap.Width, Bitmap.Height);
         end;

        {~ fill background ~}
        Bitmap.Canvas.Font.Color := Font.Color;
        if Item.Selected and IsSelected then
         if GetFocus = Handle then
          begin
           Bitmap.Canvas.Brush.Color := clHighlight;
           Bitmap.Canvas.Font.Color := clHighlightText;
          end
         else
          if HideSelection then
            Bitmap.Canvas.Brush.Color := Color
          else
            Bitmap.Canvas.Brush.Color := clBtnFace
        else
          Bitmap.Canvas.Brush.Color := Color;
        Bitmap.Canvas.FillRect(InternalRect);
        {~~~~~~~~~~~~~~~~~~~}

        FOnCustomDrawSubItemEx(Self, Bitmap.Canvas, InternalRect, Item, SubItem, State, Result);
        if not Result then
         begin
          DC := GetDC(Handle);
          try
            with Bitmap do
              BitBlt(DC, CustomDrawRect.Left + ItemRect.Left, ItemRect.Top, Width, Height, Canvas.Handle, 0, 0, SRCCOPY);
          finally
            ReleaseDC(Handle, DC);
          end;
         end; 
      finally
        Bitmap.Free;
      end;
     end;
   end;  

{$IFDEF D5}
  if Assigned(OnAdvancedCustomDrawSubItem) then
    OnAdvancedCustomDrawSubItem(Self, Item, SubItem, State, Stage, Result);
{$ENDIF}
end;
{$ENDIF}

procedure TumCustomListView.DrawHeader(Canvas: TCanvas; Rect: TRect; ColumnIndex: Integer; Pressed: Boolean);
const
  DRAWTEXTEX_FLAGS = DT_NOPREFIX or DT_SINGLELINE or DT_VCENTER or DT_END_ELLIPSIS;
  DRAWTEXTEX_ALIGNMENT: Array[TAlignment] of UINT = (DT_LEFT, DT_RIGHT, DT_CENTER);
  HighlightColors: Array[TdcListViewSortMarkKind] of TColor = (clBtnShadow, clBtnHighlight);
  ShadowColors: Array[TdcListViewSortMarkKind] of TColor = (clBtnHighlight, clBtnShadow);
var
  ArrowWidth, ArrowMargin: Byte;

  procedure DrawArrow(X: Integer);
  const
    ArrowHeight = 13;

    function YPos(MarkHeight: Integer; Default: Boolean): Integer;
    begin
      if Default then
        Result := GetTextHeight(Canvas)
      else
        Result := Rect.Bottom - Rect.Top;
      with Rect do
        Result := (Result - MarkHeight) shr 1 + Rect.Top + Byte(Pressed);
    end;

  var
    Y: Integer;
  begin
    with Canvas do
     begin
      Y := YPos(ArrowHeight, True);
      
      if FSortDirection = sdAscending then
       if IsPictureNotEmpty(FSortMarkImageAsc) then
         Draw(X, YPos(FSortMarkImageAsc.Graphic.Height, False), FSortMarkImageAsc.Graphic)
       else
        begin
         Pen.Color := HighlightColors[FSortMarkKind];
         if IsNT then
          begin
           MoveTo(X + 3, Y + 5);
           LineTo(X, Y + ArrowHeight - 2);
          end
         else
          begin
           MoveTo(X, Y + ArrowHeight - 3);
           LineTo(X + 3, Y + 4);
          end;

         Pen.Color := ShadowColors[FSortMarkKind];
         MoveTo(X, Y + ArrowHeight - 2);
         LineTo(X + 7, Y + ArrowHeight - 2);
         LineTo(X + 4, Y + 4);
        end
      else
       if IsPictureNotEmpty(FSortMarkImageDesc) then
         Draw(X, YPos(FSortMarkImageDesc.Graphic.Height, False), FSortMarkImageDesc.Graphic)
       else
        begin
         Pen.Color := HighlightColors[FSortMarkKind];
         MoveTo(X + 6, Y + 5);
         LineTo(X, Y + 5);
         LineTo(X + 3, Y + ArrowHeight - 1);

         Pen.Color := ShadowColors[FSortMarkKind];
         MoveTo(X + 7, Y + 5);
         LineTo(X + 4, Y + ArrowHeight - 1);
        end;
     end;
  end;

var
  ActiveColumn, UseXPTheme: Boolean;
  R, CalcRect: TRect;
  Column: TListColumn;
  HeaderItemState, XShift, XSmShift: Byte;

  procedure DrawText;
  begin
    if Pressed then OffsetRect(R, 1, 1);
    if ActiveColumn and (Column.Alignment = taLeftJustify) then Inc(R.Top, 2 + Byte(UseXPTheme));

    with Canvas do
     begin
{$IFDEF D7} // Kludge around of strange D7 behavior. It changes font after drawing the theme.
      if UseXPTheme then
       begin
        Canvas.Font.Size := Canvas.Font.Size + 1;
        Canvas.Font.Size := Canvas.Font.Size - 1;        
       end;
{$ENDIF}

      DrawTextEx(Canvas.Handle, PChar(Columns[ColumnIndex].Caption), -1, R,
         DRAWTEXTEX_FLAGS or DRAWTEXTEX_ALIGNMENT[Column.Alignment], nil);
     end;    

    if ActiveColumn and (Column.Alignment = taLeftJustify) then Dec(R.Top, 2 + Byte(UseXPTheme));
  end;

begin
  if (ColumnIndex < 0) or (ColumnIndex >= Columns.Count) then Exit;

  R := Rect;
  Column := Columns[ColumnIndex];
  with Canvas do
   begin
    UseXPTheme := IsThemeEnabled;

    // theme
    if UseXPTheme then
     begin
      if Pressed then
        HeaderItemState := 3 // HIS_PRESSED
      else
       if (HoverSection = ColumnIndex) and not ColumnDragging then
         HeaderItemState := 2 // HIS_HOT
       else
         HeaderItemState := 1; // HIS_NORMAL
      DrawThemedControl(Self.Handle, Handle, 'Header', 1{HP_HEADERITEM}, HeaderItemState, R);
     end;

    // background
    if FHeaderColor <> clNone then
     begin
      Brush.Color := FHeaderColor;
      FillRect(R);
     end;
    SetBkMode(Handle, TRANSPARENT);

    // adjust recrangle
    XSmShift := Byte(UseXPTheme) shl 1;
    XShift := 4 + XSmShift;
    case Column.Alignment of
      taRightJustify: Dec(R.Right, XShift);
      taLeftJustify: Inc(R.Left, XShift);
     end;

    // icon
{$IFDEF D4}
    if (Column.ImageIndex <> -1) and Assigned(SmallImages) then
     begin
      case Column.Alignment of
        taLeftJustify: begin
                        if not UseXPTheme then
                          Inc(R.Left, 2);
                        SmallImages.Draw(Canvas, R.Left, R.Top + XSmShift, Column.ImageIndex);
                        Inc(R.Left, SmallImages.Width + XShift);
                       end;
        taRightJustify: begin
                         if not UseXPTheme then
                           Dec(R.Right, 2);
                         SmallImages.Draw(Canvas, R.Right - SmallImages.Width + 2, R.Top + XSmShift, Column.ImageIndex);
                         Dec(R.Right, SmallImages.Width + XShift);
                        end;
       end;
     end;
{$ENDIF}

    // text
    ActiveColumn := FShowSortMark and (SortType <> stNone) and (FSortColumn = ColumnIndex);
    if ActiveColumn then
     begin
      // calculate the width of sort arrow
      ArrowWidth := 8; // default arrow
      ArrowMargin := 10;
      if FSortDirection = sdAscending then
        if IsPictureNotEmpty(FSortMarkImageAsc) then
          ArrowWidth := FSortMarkImageAsc.Width
        else
      else
        if IsPictureNotEmpty(FSortMarkImageDesc) then
          ArrowWidth := FSortMarkImageDesc.Width;

      if Column.Alignment = taRightJustify then
        Inc(R.Left, ArrowWidth + ArrowMargin + 2)
      else
        Dec(R.Right, ArrowWidth + ArrowMargin + 2);

      { How big of a rectangle do we have to work with for the text? }
      CalcRect := R;
      DrawTextEx(Canvas.Handle, PChar(Column.Caption), -1, CalcRect,
         DRAWTEXTEX_FLAGS or DT_CALCRECT or DRAWTEXTEX_ALIGNMENT[Column.Alignment], nil);

      case Column.Alignment of
        taRightJustify: R.Left := R.Right - (CalcRect.Right - CalcRect.Left);
        taCenter: begin
                   R.Left := R.Left + (((R.Right - R.Left) - (CalcRect.Right - CalcRect.Left)) shr 1);
                   R.Right := R.Left + (CalcRect.Right - CalcRect.Left);
                  end;
        else R := CalcRect;
       end;
      if R.Left < Rect.Left then R.Left := Rect.Left;
      if R.Right > Rect.Right then R.Right := Rect.Right;

      DrawText;

      // draw sort arrow
      case Column.Alignment of
        taRightJustify: // Only draw if we have enough room
          begin
           if FSortMarkAlign <> maEdge then
             while ((R.Left - ArrowWidth - ArrowMargin - 2) < Rect.Left) and (ArrowMargin > 4) do
               Dec(ArrowMargin);

           if (R.Left - ArrowWidth - ArrowMargin - 2) >= Rect.Left then
             if FSortMarkAlign = maEdge then
               DrawArrow(Rect.Left + ArrowWidth)
             else
               DrawArrow(R.Left - ArrowWidth - ArrowMargin);
          end;
        else
          begin
           if FSortMarkAlign <> maEdge then
             while ((R.Right + ArrowWidth + ArrowMargin + 2) > Rect.Right) and (ArrowMargin > 4) do
               Dec(ArrowMargin);

           if (R.Right + ArrowWidth + ArrowMargin + 2) <= Rect.Right then
            if FSortMarkAlign = maEdge then
              DrawArrow(Rect.Right - ArrowWidth shl 1 - 1)
            else
              DrawArrow(R.Right + ArrowMargin);
          end;    
       end;
     end
    else DrawText;
   end;
end;

procedure TumCustomListView.UpdateListItems;
begin
  GetFormatSettings;
  if Assigned(FOnSettingsChanged) then
   FOnSettingsChanged(Self);
end;

procedure TumCustomListView.RepaintHeader;
begin
  if (FHeaderHandle <> 0) and IsWindowVisible(FHeaderHandle) then
    InvalidateRect(FHeaderHandle, nil, True);
end;

{$IFDEF D4}
function TumCustomListView.FindCaption(const Caption: String): TListItem;
begin
  Result := inherited FindCaption(0, Caption, False, True, False);
end;
{$ENDIF}


{ public routines }
function TumCustomListView.CountPerPage: Integer; { calculates number of items that can fit vertically in the visible area of a listview control when in list or report view }
begin
  if HandleAllocated then
    Result := ListView_GetCountPerPage(Handle)
  else
    Result := 0;  
end;

function  TumCustomListView.GetColumnAt(X: Integer): TListColumn;
var
  I, J, XPos: Integer;
  {$IFDEF D4}
  ColumnOrders: Array of Integer;
  {$ENDIF}
begin
  // Fix the position by scroll view
  inc(X, GetScrollPos(Handle, SB_HORZ));

  Result := nil;
  XPos := 0;
  I := Columns.Count;
  if I <> 0 then
   begin
    {$IFDEF D4}
    SetLength(ColumnOrders, I);
    ListView_GetColumnOrderArray(Handle, Columns.Count, PInteger(ColumnOrders));
    {$ENDIF}

    for I := 0 to I - 1 do
     begin
      {$IFDEF D4}
      J := ColumnOrders[I];
      {$ELSE}
      J := I;
      {$ENDIF}
      if (X >= XPos) and (X <= XPos + Columns[J].Width) then
       begin
        Result := Columns[J];
        Exit;
       end
      else inc(XPos, Columns[J].Width);
     end;
   end;
end;

{$IFNDEF D6}
procedure TumCustomListView.Clear;
begin
  Items.BeginUpdate;
  try
    Items.Clear;
  finally
    Items.EndUpdate;
  end;
end;

procedure TumCustomListView.DeleteSelected;
var
  I: Integer;
begin
  I := Items.Count;
  if I <> 0 then
   begin
    Items.BeginUpdate;
    try
      for I := I - 1 downto 0 do
        if Items[I].Selected then
          Delete(Items[I]);
    finally
      Items.EndUpdate;
    end;
   end; 
end;

procedure TumCustomListView.SelectAll;
var
  I: Integer;
begin
  for I := 0 to Items.Count - 1 do
    Items[I].Selected := True;
end;
{$ENDIF}

procedure TumCustomListView.UnselectAll;
var
  I: Integer;
begin
  for I := 0 to Items.Count - 1 do
    Items[I].Selected := False;
end;

function TumCustomListView.IsScrollBarsVisible: Boolean;
var
  WindowStyle: LongInt;
begin
  WindowStyle := GetWindowLong(Handle, GWL_STYLE);
  Result := (WindowStyle and WS_VSCROLL <> 0) or
            (WindowStyle and WS_HSCROLL <> 0);
end;

procedure TumCustomListView.BestFit{$IFDEF D4}(FitHeaderText: Boolean = False){$ENDIF};
var
  I: Integer;
begin
  if Items.Count = 0 then Exit; // don't adjust empty list
  
  Items.BeginUpdate;
  Columns.BeginUpdate;
  try
    for I := 0 to Columns.Count - 1 do
{$IFDEF D4}
     if FitHeaderText then
       Columns[I].Width := -2
     else
{$ENDIF}
       Columns[I].Width := -1;
  finally
    Columns.EndUpdate;
    Items.EndUpdate;
  end;
end;

{$IFDEF D4}
procedure TumCustomListView.SetColumnOrders(ColumnOrders: Array of Integer);
var
  I: Integer;
  NewColumnOrders: Array of Integer;
begin
  with Columns do
   if Count <> 0 then
    begin
     SetLength(NewColumnOrders, Count);
     for I := 0 to Count - 1 do
       NewColumnOrders[I] := ColumnOrders[I];

     ListView_SetColumnOrderArray(Handle, Count, PInteger(NewColumnOrders));
    end;
end;
{$ENDIF}

function TumCustomListView.ImportFromTXT(const FileName: String; SeparatorChar: Char {$IFDEF D4} = #9{$ENDIF}): Boolean;
var
  I: Integer;
  T: TextFile;
  St, ItemSt: String;
  Item: TListItem;
begin
  Result := False;
  if FileExists(FileName) then
   begin
    Items.BeginUpdate;
    try
      Items.Clear;
      AssignFile(T, FileName);
      Reset(T);
      try
        while True do
         begin
          ReadLn(T, St);
          if (IOResult <> 0) or (St = '') then
           begin
            Result := True;
            Break;
           end;
          Item := nil;
          repeat
            I := Pos(SeparatorChar, St);
            if I <> 0 then
             begin
              ItemSt := Copy(St, 1, I - 1);
              St := Copy(St, I + 1, Length(St));
             end
            else
              ItemSt := St;

            if Item = nil then
             begin
              Item := Items.Add;
              Item.Caption := ItemSt;
             end
            else
             Item.SubItems.Add(ItemSt);
          until I = 0;
         end;
      finally
        CloseFile(T);
      end;
    finally
      Items.EndUpdate;
    end;
   end;
end;

procedure TumCustomListView.ExportToTXT(const FileName: String; ExportColumnCaptions: Boolean {$IFDEF D4} = True {$ENDIF});
var
  Col, Idx: Integer;
  T: TextFile;
begin
  Col := Columns.Count;
  Idx := Items.Count;
  if (Col <> 0) and (Idx <> 0) then
   begin
    AssignFile(T, FileName);
    Rewrite(T);
    try
      // columns
      if ExportColumnCaptions then
       begin
        for Col := 0 to Col - 1 do
         begin
          if Col <> 0 then
            Write(T, #9);
          Write(T, Columns[Col].Caption);
         end;
        Write(T, #13#10);
       end;

      // items
      for Idx := 0 to Idx - 1 do
       begin
        Write(T, Items[Idx].Caption);
        Col := Items[Idx].SubItems.Count;
        for Col := 0 to Col - 1 do
          Write(T, #9 + Items[Idx].SubItems[Col]);
        Write(T, #13#10);
       end;
    finally
      CloseFile(T);
    end;
   end;
end;

procedure TumCustomListView.ExportToHTML(const FileName: String; ExportColumnCaptions: Boolean {$IFDEF D4} = True {$ENDIF}; const DocumentTitle: String {$IFDEF D4} = '' {$ENDIF});
var
  Col, Idx: Integer;
  T: TextFile;

  procedure PutItem(const ItemStr: String);
  begin
    Write(T, '      <TD>' + ItemStr + '</TD>'#13#10);
  end;

begin
  Col := Columns.Count;
  Idx := Items.Count;
  if (Col <> 0) and (Idx <> 0) then
   begin
    AssignFile(T, FileName);
    Rewrite(T);
    try
      Write(T, '<html>'#13#10);
      if DocumentTitle <> '' then
        Write(T, '<head>'#13#10'  <title>' + DocumentTitle+ '</title>'#13#10'</head>');
      Write(T, '<body>'#13#10'  <TABLE cellSpacing="1" cellPadding="1" border="1">'#13#10);

      // columns
      if ExportColumnCaptions then
       begin
        Write(T, '    <TR BgColor=Silver>'#13#10);
        for Col := 0 to Col - 1 do
          PutItem(Columns[Col].Caption);
        Write(T, '    </TR>'#13#10);
       end;

      // items
      for Idx := 0 to Idx - 1 do
       begin
        Write(T, '    <TR>'#13#10);
        PutItem(Items[Idx].Caption);
        Col := Items[Idx].SubItems.Count;        
        for Col := 0 to Col - 1 do
          PutItem(Items[Idx].SubItems[Col]);
        Write(T, '    </TR>'#13#10);
       end;

       // finish it
       Write(T, '  </TABLE>'#13#10'</body>'#13#10'</html>');
    finally
      CloseFile(T);
    end;
   end;
end;

procedure TumCustomListView.ReplaceStr(const OldCaption, NewCaption: String {$IFDEF D4}; ReplaceOnlyVisibleItems: Boolean = True {$ENDIF});
var
  I, S: Integer;
begin
  I := Items.Count;
  if I <> 0 then
   for I := 0 to I - 1 do
    with Items[I] do
     begin
      if Caption = OldCaption then
        Caption := NewCaption;

      S := SubItems.Count;
{$IFDEF D4}
      if ReplaceOnlyVisibleItems and (S > Columns.Count) then
        S := Columns.Count;
{$ENDIF}        
      for S := 0 to S - 1 do
       if SubItems[S] = OldCaption then
         SubItems[S] := NewCaption;
     end;
end;


{$IFDEF APPCONTROLS}
// -- TreeView ----------------

{ TdcTreeView }
constructor TdcTreeView.Create(aOwner: TComponent);
begin
  inherited;
  FCursors := TdcTreeViewCursors.Create;

  {$IFNDEF D4}
  FToolTips := True;
  {$ENDIF}
end;

destructor TdcTreeView.Destroy;
begin
  FCursors.Free;
  inherited;
end;

function TdcTreeView.ImportFromTXT(const FileName: String; RootNode: TTreeNode {$IFDEF D4} = nil;
   FirstLevelImageIndex: Integer = 0; SecondLevelImageIndex: Integer = -1;
   ThirdLevelImageIndex: Integer = -1 {$ENDIF}): Boolean;
var
  T: TextFile;
  St: String;
  CurNode, NextNode: TTreeNode;
  RootLevel, ThisLevel: Integer;

  function FindLevel(const St: String): Integer;
  var
    I: Integer;
  begin
    I := 1;
    Result := 0;
    while St[I] in [' ', #9] do
     begin
      Inc(I);
      Inc(Result);
     end;
  end;

begin
  Result := False;
  if FileExists(FileName) then
   begin
    CurNode := nil;
    Items.BeginUpdate;
    try
      if RootNode = nil then
       begin
        Items.Clear;
        RootLevel := 0;
       end
      else
       begin
        RootNode.DeleteChildren;
        RootLevel := RootNode.Level + 1;
       end;
      AssignFile(T, FileName);
      Reset(T);
      try
        while True do
         begin
          ReadLn(T, St);
          if (IOResult <> 0) or (St = '') then
           begin
            Result := True;
            Break;
           end;

          ThisLevel := FindLevel(St) + RootLevel;
          St := Trim(St);
          if CurNode = nil then
            CurNode := Items.AddChild(RootNode, St)
          else
            if CurNode.Level = ThisLevel then
              CurNode := Items.AddChild(CurNode.Parent, St)
            else
              if CurNode.Level = (ThisLevel - 1) then
                CurNode := Items.AddChild(CurNode, St)
              else
                if CurNode.Level > ThisLevel then
                 begin
                  NextNode := CurNode.Parent;
                  while NextNode.Level > ThisLevel do
                    NextNode := NextNode.Parent;
                  CurNode := Items.AddChild(NextNode.Parent, St);
                 end;

{$IFDEF D4}
           if (CurNode.Level - RootLevel = 0) or
              ((CurNode.Level - RootLevel = 1) and (SecondLevelImageIndex = -1)) or
              ((CurNode.Level - RootLevel = 2) and (ThirdLevelImageIndex = -1)) then
             CurNode.ImageIndex := FirstLevelImageIndex
           else
             if (CurNode.Level - RootLevel = 1) or (ThirdLevelImageIndex = -1) then
               CurNode.ImageIndex := SecondLevelImageIndex
             else
               CurNode.ImageIndex := ThirdLevelImageIndex;
           CurNode.SelectedIndex := CurNode.ImageIndex;
{$ENDIF}               
         end;
      finally
        CloseFile(T);
      end;
    finally
      Items.EndUpdate;
    end;
   end;
end;

procedure TdcTreeView.ImportFromTreeView(SourceTreeView: TCustomTreeView;
       SourceRootNode: TTreeNode {$IFDEF D4} = nil {$ENDIF};
       TargetRootNode: TTreeNode {$IFDEF D4} = nil {$ENDIF});

  function CopyChild(SourceNode, TargetParentNode: TTreeNode): TTreeNode;
  begin
    Result := Items.AddChild(TargetParentNode, SourceNode.Text);
    Result.ImageIndex := SourceNode.ImageIndex;
    Result.SelectedIndex := SourceNode.SelectedIndex;
    Result.StateIndex := SourceNode.StateIndex;
    Result.OverlayIndex := SourceNode.OverlayIndex;
    Result.Data := SourceNode.Data;
    Result.Cut := SourceNode.Cut;
  end;

  procedure CopyBrunch(SourceNode, TargetNode: TTreeNode);
  var
    I: Integer;
    Child: TTreeNode;
  begin
    Child := CopyChild(SourceNode, TargetNode);
    if SourceNode.Count <> 0 then
     for I := 0 to SourceNode.Count - 1 do
       CopyBrunch(SourceNode.Item[I], Child);
  end;

var
  I: Integer;
begin
  with TTreeView(SourceTreeView) do
   begin
    if Items.Count = 0 then Exit;

    Self.Items.BeginUpdate;
    try
      if TargetRootNode = nil then
        Self.Items.Clear
      else
        TargetRootNode.DeleteChildren;

      if SourceRootNode = nil then
       begin
        I := Items.Count;
        if I <> 0 then
         for I := 0 to I - 1 do
          if Items[I].Parent = nil then
           CopyBrunch(Items[I], TargetRootNode);
       end
      else
       CopyBrunch(SourceRootNode, TargetRootNode);
    finally
      Self.Items.EndUpdate;
    end;
   end;
end;

function TdcTreeView.FindNode(const Text: String): TTreeNode;

  function FindOne(RootNode: TTreeNode): TTreeNode;
  var
    Node: TTreeNode;
  begin
    if AnsiCompareText(Text, RootNode.Text) = 0 then
      Result := RootNode
    else
     begin
      Result := nil;
      Node := RootNode.GetFirstChild;
      while Node <> nil do
       begin
        Result := FindOne(Node);
        if Result <> nil then Exit;
        Node := RootNode.GetNextChild(Node);
       end;
     end;
  end;

var
  Node: TTreeNode;
begin
  Result := nil;
  with Items do
   begin
    Node := GetFirstNode;
    while Node <> nil do
     begin
      Result := FindOne(Node);
      if Result <> nil then Break;
      Node := Node.GetNext;
     end;
   end;
end;

function TdcTreeView.FindNodeByAbsoluteIndex(AbsoluteIndex: Integer): TTreeNode;

  function FindOne(RootNode: TTreeNode): TTreeNode;
  var
    Node: TTreeNode;
  begin
    if AbsoluteIndex = RootNode.AbsoluteIndex then
      Result := RootNode
    else
     begin
      Result := nil;
      Node := RootNode.GetFirstChild;
      while Node <> nil do
       begin
        Result := FindOne(Node);
        if Result <> nil then Exit;
        Node := RootNode.GetNextChild(Node);
       end;
     end;
  end;

var
  Node: TTreeNode;
begin
  Result := nil;
  with Items do
   begin
    Node := GetFirstNode;
    while Node <> nil do
     begin
      Result := FindOne(Node);
      if Result <> nil then Break;
      Node := Node.GetNext;
     end;
   end;
end;

procedure TdcTreeView.WndProc(var Message: TMessage);
begin
  if Message.Msg = WM_SETCURSOR then
   with FCursors do
    case TWMSetCursor(Message).HitTest of
      htBorder: SetCursor(Screen.Cursors[FBorder]);
      htHScroll: SetCursor(Screen.Cursors[FScrollHorz]);
      htVScroll: SetCursor(Screen.Cursors[FScrollVert]);
      else inherited
     end
  else inherited
end;

procedure TdcTreeView.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Pnt: TPoint;
begin
  inherited;
  if (Button = mbRight) and Assigned(FOnCustomPopupMenu) then
   begin
    Pnt := ClientToScreen(Point(X, Y));
    FOnCustomPopupMenu(Self, Pnt.X, Pnt.Y, GetNodeAt(X, Y));
   end;
end;

procedure TdcTreeView.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  Node: TTreeNode;
begin
  inherited;
  if FMouseTrack then
   begin
    if ((FLastPoint.X = X) and (FLastPoint.Y = Y)) or ((FLastPoint.X = -1) and (FLastPoint.Y = -1)) then
     begin
      FLastPoint := Point(X, Y);
      Exit;
     end;

    Node := GetNodeAt(X, Y);
    if Node <> nil then
      Selected := Node;
   end;   
end;

procedure TdcTreeView.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TdcTreeView.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

procedure TdcTreeView.WMSysColorChange(var Message: TWMSysColorChange);
begin
  inherited;
  RecreateWnd;
end;

{ private }
function  TdcTreeView.GetItemHeight: ShortInt;
begin
  Result := TreeView_GetItemHeight(Handle);
end;

procedure TdcTreeView.SetItemHeight(Value: ShortInt);
begin
  TreeView_SetItemHeight(Handle, Value);
end;

function  TdcTreeView.GetSelectedAbsoluteIndex: Integer;
begin
  if Selected <> nil then
    Result := Selected.AbsoluteIndex
  else
    Result := -1;
end;

procedure TdcTreeView.SetSelectedAbsoluteIndex(Value: Integer);
begin
  Selected := FindNodeByAbsoluteIndex(Value);
end;

{$IFNDEF D4}
procedure SetComCtlStyle(Ctl: TWinControl; Value: Integer; UseStyle: Boolean);
var
  Style: Integer;
begin
  if Ctl.HandleAllocated then
   begin
    Style := GetWindowLong(Ctl.Handle, GWL_STYLE);
    if not UseStyle then Style := Style and not Value
    else Style := Style or Value;
    SetWindowLong(Ctl.Handle, GWL_STYLE, Style);
  end;
end;

procedure TdcTreeView.SetAutoExpand(Value: Boolean);
begin
  if FAutoExpand <> Value then
   begin
    FAutoExpand := Value;
    SetComCtlStyle(Self, TVS_SINGLEEXPAND, Value);
   end;
end;

procedure TdcTreeView.SetHotTrack(Value: Boolean);
begin
  if FHotTrack <> Value then
   begin
    FHotTrack := Value;
    SetComCtlStyle(Self, TVS_TRACKSELECT, Value);
   end;
end;

procedure TdcTreeView.SetRowSelect(Value: Boolean);
begin
  if FRowSelect <> Value then
   begin
    FRowSelect := Value;
    SetComCtlStyle(Self, TVS_FULLROWSELECT, Value);
   end;
end;

procedure TdcTreeView.SetToolTips(Value: Boolean);
begin
  if FToolTips <> Value then
   begin
    FToolTips := Value;
    SetComCtlStyle(Self, TVS_NOTOOLTIPS, not Value);
   end;
end;
{$ENDIF}
{$ENDIF APPCONTROLS}

end.