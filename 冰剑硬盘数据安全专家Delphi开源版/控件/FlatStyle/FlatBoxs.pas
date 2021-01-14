unit FlatBoxs;

interface

{$I FlatStyle.inc}

uses
  Windows, Messages, Classes, Forms, Controls, Graphics,
  SysUtils, ExtCtrls, FlatUtils, FlatSkins, ActnList, StdCtrls;

type
  { TDefineListBox }
  TDefineListBox = class(TVersionControl)
  private
    scrollType: TScrollType;
    FirstItem: Integer;
    FSorted: Boolean;
    FItems: TStringList;
    FRects: TList;
    FChecks: TList;
    FItemIndex: Integer;
    FMultiSelect: Boolean;
    FOnChange: TNotifyChange;
    FOnClick: TNotifyClick;
    FStyle: TListStyle;
    FCaption: TCaption;
    FMouseIn: boolean;
    procedure SetSorted(Value: Boolean);
    procedure SetItems(Value: TStringList);
    procedure SetSelected(Index: Integer; Value: Boolean);
    procedure SetItemIndex(Value: Integer);
    procedure SetMultiSelect(Value: Boolean);
    procedure SetListStyle(const Value: TListStyle);
    procedure SetCaption(const Value: TCaption);
    function  GetItemCount: Integer;
  protected
    procedure SetItemsRect;
    procedure Paint; override;
    procedure Loaded; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure SetName(const Value: TComponentName); override;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure ScrollTimerHandler(Sender: TObject);
    procedure StyleChange(Sender: TObject);
    procedure SelectNotifyEvent;
    procedure WMMove(var Message: TWMMove); message WM_MOVE;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMKeyDown(var Message: TWMKeyDown); message CN_KEYDOWN;
    procedure WMMouseWheel(var Message: TMessage); message WM_MOUSEWHEEL;
    procedure WMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMParentFontChanged(var Message: TMessage); message CM_PARENTFONTCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure DeleteChecked(index: integer);
    procedure AddCheck(index: integer);
    function FindChecked(Value: Integer;var Index:Integer): boolean;
    function GetMaxItems: Integer;
    function GetSelected(Index: Integer): Boolean;
    function GetSelCount: Integer;
    function GetItemIndex: Integer;
    function GetItemText: TCaption;
    property Skin: TListStyle read FStyle write SetListStyle;
    property MaxItems: Integer read GetMaxItems;
    property Items: TStringList read FItems write SetItems;
    property MultiSelect: Boolean read FMultiSelect write SetMultiSelect default false;
    property Caption:TCaption read FCaption write SetCaption;
    property Sorted: Boolean read FSorted write SetSorted default false;
    property OnClick: TNotifyClick read FOnClick write FOnClick;
    property OnChange: TNotifyChange read FOnChange write FOnChange;
    property TabStop default True;
    property ParentColor default True;
    property ParentFont default True;
    property Enabled default True;
    property Visible default True;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Click; override;
    procedure Clear;
    function  Find(Value:String; var Index : Integer):boolean;
    property  ItemText:TCaption read GetItemText;
    property  Selected[Index: Integer]: Boolean read GetSelected write SetSelected;
    property  SelCount: Integer read GetSelCount;
    property  ItemIndex: Integer read GetItemIndex write SetItemIndex;
    property  ItemCount: Integer read GetItemCount;
  end;

  { TFlatListBox }

  TFlatListBox = class(TDefineListBox)
  published
    property Caption;
    property Skin;
    property Align;
    property Items;
    property MultiSelect;
    property Sorted;
    property Font;
    property ParentFont;
    property ParentShowHint;
    property Enabled;
    property Visible;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property OnClick;
    property OnChange;
    property OnDblClick;
    property OnMouseMove;
    property OnMouseDown;
    property OnMouseUp;
    property OnKeyDown;
    property OnKeyPress;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyUp;
    property OnStartDock;
    property OnStartDrag;
  end;

  { TDefineListChecks }
  TDefineListChecks = class(TVersionControl)
  private
    FSelected: Integer;
    FCurSelected :integer;
    scrollType: TScrollType;
    FirstItem: Integer;
    FSorted: Boolean;
    FItems: TStringList;
    FRects: TList;
    FChecks: TList;
    FOnChange: TNotifyChange;
    FOnClick: TNotifyClick;
    FOnClickCheck: TNotifyEvent;
    FCaption: TCaption;
    FStyle: TCheckStyle;
    FMouseIn: boolean;
    procedure SetSorted(Value: Boolean);
    procedure SetItems(Value: TStringList);
    procedure SetChecked(Index: Integer; Value: Boolean);
    procedure SetCaption(const Value: TCaption);
    procedure SetCheckStyle(const Value: TCheckStyle);
    procedure SetItemIndex(Value: Integer);
    function GetItemCount: Integer;
  protected
    procedure Paint; override;
    procedure Loaded; override;
    procedure SetItemsRect;
    procedure ScrollTimerHandler(Sender: TObject);
    procedure DrawCheckRect(Canvas: TCanvas; StartRect: TRect; checked: Boolean);
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure StyleChange( Sender: TObject);
    procedure SetName(const Value: TComponentName); override;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMMove(var Message: TWMMove); message WM_MOVE;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMKeyDown(var Message: TWMKeyDown); message CN_KEYDOWN;
    procedure WMMouseWheel(var Message: TMessage); message WM_MOUSEWHEEL;
    procedure WMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMParentFontChanged(var Message: TMessage); message CM_PARENTFONTCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure SelectNotifyEvent;
    procedure DeleteChecked(index: integer);
    procedure AddCheck(index: integer);

    function FindChecked(Value: Integer;var Index:Integer): boolean;
    function GetChecked(Index: Integer): Boolean;  
    function GetSelCount: Integer;
    function GetItemIndex: Integer;
    function GetItemText: TCaption;
    function GetMaxItems: Integer;

    property Skin: TCheckStyle read FStyle write SetCheckStyle;
    property Sorted: Boolean read FSorted write SetSorted default false;
    property Items: TStringList read FItems write SetItems;
    property MaxItems: Integer read GetMaxItems;
    property Caption: TCaption read FCaption write SetCaption;
    property OnClick: TNotifyClick read FOnClick write FOnClick;
    property OnChange: TNotifyChange read FOnChange write FOnChange;
    property OnClickCheck: TNotifyEvent read FOnClickCheck write FOnClickCheck;
    property TabStop default True;
    property ParentColor default True;
    property ParentFont default True;
    property Enabled default True;
    property Visible default True;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear;
    procedure Click; override;
    procedure CheckAll;
    procedure CheckCancel;
    procedure Delete(Index:Integer);
    function  Find(Value: String; var Index: Integer): boolean;
    property  Checked[Index: Integer]: Boolean read GetChecked write SetChecked;
    property  SelCount: Integer read GetSelCount;
    property  ItemText: TCaption read GetItemText;
    property  ItemIndex: Integer read GetItemIndex write SetItemIndex;
    property  ItemCount: Integer read GetItemCount;
  end;

  { TFlatCheckListBox }
  TFlatCheckListBox = class(TDefineListChecks)
  published
    property Skin;
    property Caption;
    property Sorted;
    property Items;
    property Align;
    property Font;
    property ParentFont;
    property ParentShowHint;
    property Enabled;
    property Visible;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property ParentColor;
    property OnClick;
    property OnChange;
    property OnClickCheck;
    property OnMouseMove;
    property OnMouseDown;
    property OnMouseUp;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnStartDock;
    property OnStartDrag;
  end;
  { TDefineCheckBox }
  TDefineCheckBox = class(TVersionControl)
  private
    FMouseIn: Boolean;
    FMouseDown: Boolean;
    Focused: Boolean;
    FLayout: TLayoutPosition;
    FChecked: Boolean;
    FFocusedColor: TColor;
    FDownColor: TColor;
    FCheckedColor: TColor;
    FBorderColor: TColor;
    FTransparent: Boolean;
    procedure SetColors(Index: Integer; Value: TColor);
    procedure SetLayout(Value: TLayoutPosition);
    procedure SetChecked(Value: Boolean);
    procedure SetTransparent(const Value: Boolean);
  protected
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMTextChanged(var Message: TWmNoParams); message CM_TEXTCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMParentColorChanged(var Message: TWMNoParams); message CM_PARENTCOLORCHANGED;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMMove(var Message: TWMMove); message WM_MOVE;
    procedure Paint; override;
    property Transparent: Boolean read FTransparent write SetTransparent default True;
    property Checked: Boolean read FChecked write SetChecked default false;
    property ColorFocused: TColor index 0 read FFocusedColor write SetColors default DefaultBackdropColor;
    property ColorDown: TColor index 1 read FDownColor write SetColors default DefaultBarColor;
    property ColorChecked: TColor index 2 read FCheckedColor write SetColors default DefaultCheckColor;
    property ColorBorder: TColor index 3 read FBorderColor write SetColors default DefaultBorderColor;
    property Layout: TLayoutPosition read FLayout write SetLayout default lpLeft;
    property Color default DefaultFlatColor;
    property ParentColor default false;
    property TabStop default True;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  { TFlatCheckBox }
  TFlatCheckBox = class(TDefineCheckBox)
  published
    property Transparent;
    property Caption;
    property Checked;
    property ColorFocused;
    property ColorDown;
    property ColorChecked;
    property Color;
    property ColorBorder;
    property Action;
    property Enabled;
    property Font;
    property Layout;
    property ParentColor;
    property ParentFont;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
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
  end;

  { TDefineGroupBox }
  TDefineGroupBox = class(TVersionControl)
  private
    FTransparent: Boolean;
    FBorderColor: TColor;
    FBorder: TGroupBoxBorder;
    FBackgropStopColor: TColor;
    FBackgropStartColor: TColor;
    FStyleFace: TStyleFace;
    FBackgropOrien: TStyleOrien;
    FAlignment: TAlignmentText;
    procedure SetColors(const Index: Integer; const Value: TColor);
    procedure SetBorder(const Value: TGroupBoxBorder);
    procedure SetTransparent(const Value: Boolean);
    procedure SetBackgropOrien(const Value: TStyleOrien);
    procedure SetStyleFace(const Value: TStyleFace); virtual;
    procedure SetAlignment(const Value: TAlignmentText);
  protected
    procedure Paint; override;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMTextChanged(var Message: TWmNoParams); message CM_TEXTCHANGED;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMParentColorChanged(var Message: TWMNoParams); message CM_PARENTCOLORCHANGED;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMMove(var Message: TWMMove); message WM_MOVE;
    property ColorBorder: TColor index 0 read FBorderColor write SetColors default DefaultBorderColor;
    property BackgropStartColor: TColor index 1 read FBackgropStartColor write SetColors default DefaultColorStart;
    property BackgropStopColor: TColor index 2 read FBackgropStopColor write SetColors default DefaultColorStop;
    property BackgropOrien: TStyleOrien read FBackgropOrien write SetBackgropOrien default bsHorizontal;
    property StyleFace: TStyleFace read FStyleFace write SetStyleFace default fsDefault;
    property Border: TGroupBoxBorder read FBorder write SetBorder default brFull;
    property Transparent: Boolean read FTransparent write SetTransparent default false;
    property Alignment: TAlignmentText read FAlignment write SetAlignment default stLeft;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  { TDefineGroupBox }
  TFlatGroupBox = class(TDefineGroupBox)
  published
    property Action;
    property Transparent;
    property Alignment;
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
    property ColorBorder;
    property BackgropStartColor;
    property BackgropStopColor;
    property BackgropOrien;
    property StyleFace;
    property Border;
    property Anchors;
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

  { TDefineRadioButton }
  TDefineRadioButton = class(TVersionControl)
  private
    FMouseIn: Boolean;
    FMouseDown: Boolean;
    FFocused: Boolean;
    FGroupIndex: Integer;
    FLayout: TLayoutPosition;
    FChecked: Boolean;
    FFocusedColor: TColor;
    FDownColor: TColor;
    FCheckedColor: TColor;
    FBorderColor: TColor;
    FTransparent: Boolean;
    procedure SetColors(Index: Integer; Value: TColor);
    procedure SetLayout(Value: TLayoutPosition);
    procedure SetChecked(Value: Boolean);
    procedure SetTransparent(const Value: Boolean);
  protected
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMTextChanged(var Message: TWmNoParams); message CM_TEXTCHANGED;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMMove(var Message: TWMMove); message WM_MOVE;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMParentColorChanged(var Message: TWMNoParams); message CM_PARENTCOLORCHANGED;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
    property Transparent: Boolean read FTransparent write SetTransparent default true;
    property Checked: Boolean read FChecked write SetChecked default false;
    property ColorFocused: TColor index 0 read FFocusedColor write SetColors default DefaultBackdropColor;
    property ColorDown: TColor index 1 read FDownColor write SetColors default DefaultBarColor;
    property ColorChecked: TColor index 2 read FCheckedColor write SetColors default DefaultCheckColor;
    property ColorBorder: TColor index 3 read FBorderColor write SetColors default DefaultBorderColor;
    property GroupIndex: Integer read FGroupIndex write FGroupIndex default 0;
    property Layout: TLayoutPosition read FLayout write SetLayout default lpLeft;
    property Color default DefaultFlatColor;
    property ParentColor default false;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  { TFlatRadioButton }
  TFlatRadioButton = class(TDefineRadioButton)
  published
    property Action;
    property Transparent;
    property Version;
    property Caption;
    property Checked;
    property ColorFocused;
    property ColorDown;
    property ColorChecked;
    property ColorBorder;
    property Color;
    property Enabled;
    property Font;
    property GroupIndex;
    property Layout;
    property ParentColor;
    property ParentFont;
    property Anchors;
    property Constraints;
    property DragKind;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
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
    property OnEndDock;
    property OnStartDock;
  end;

  { TDefineRadioGroup }
  TDefineRadioGroup = class(TDefineGroupBox)
  private
    FButtons: TList;
    FItems: TStrings;
    FItemIndex: Integer;
    FColumns: Integer;
    FReading: Boolean;
    FUpdating: Boolean;
    function  GetButtons(Index: Integer): TFlatRadioButton;
    procedure ArrangeButtons;
    procedure ButtonClick(Sender: TObject);
    procedure ItemsChange(Sender: TObject);
    procedure SetButtonCount(Value: Integer);
    procedure SetColumns(Value: Integer);
    procedure SetItemIndex(Value: Integer);
    procedure SetItems(Value: TStrings);
    procedure SetStyleFace(const Value: TStyleFace); override;
    procedure UpdateButtons;
  protected
    procedure Loaded; override;
    procedure ReadState(Reader: TReader); override;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    property Columns: Integer read FColumns write SetColumns default 1;
    property ItemIndex: Integer read FItemIndex write SetItemIndex default -1;
    property Items: TStrings read FItems write SetItems;
    function CanModify: Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Buttons[Index: Integer]: TFlatRadioButton read GetButtons;
  end;

  { TFlatRadioGroup }
  TFlatRadioGroup = class(TDefineRadioGroup)
  published
    property Action;
    property Transparent;
    property Alignment;
    property Items;
    property ItemIndex;
    property Columns;
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
    property ColorBorder;
    property BackgropStartColor;
    property BackgropStopColor;
    property BackgropOrien;
    property StyleFace;
    property Border;
    property Anchors;
    property Constraints;
    property DragKind;
    property DragMode;
    property DragCursor;
    property DockSite;
    property OnEndDock;
    property OnStartDock;
    property OnDockDrop;
    property OnDockOver;
    property OnUnDock;
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
  { TDefineListBoxExt }
  TDefineListBoxExt = class(TVersionListBoxExt)
  private
    FParentColor: Boolean;
    FFocusColor: TColor;
    FBorderColor: TColor;
    FFlatColor: TColor;
    FMouseIn: Boolean;
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
    property ColorFocused: TColor index 0 read FFocusColor write SetColors default clWhite;
    property ColorBorder: TColor index 1 read FBorderColor write SetColors default DefaultBorderColor;
    property ColorFlat: TColor index 2 read FFlatColor write SetColors default DefaultFlatColor;
    property ParentColor: Boolean read FParentColor write SetParentColor default false;
    property ParentFont default True;
    property AutoSize default False;
    property Ctl3D default False;
    property BorderStyle default bsNone;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  { TFlatListBoxExt }
  TFlatListBoxExt = class(TDefineListBoxExt)
  published
    property ColorFocused;
    property ColorBorder;
    property ColorFlat;
    property ParentColor;
    property Style;
    property AutoComplete;
    property Align;
    property Anchors;
    property BiDiMode;
    property Columns;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property ExtendedSelect;
    property Font;
    property ImeMode;
    property ImeName;
    property IntegralHeight;
    property ItemHeight;
    property Items;
    property MultiSelect;
    property ParentBiDiMode;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ScrollWidth;
    property ShowHint;
    property Sorted;
    property TabOrder;
    property TabStop;
    property TabWidth;
    property Visible;
    property OnClick;
    property OnContextPopup;
    property OnData;
    property OnDataFind;
    property OnDataObject;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawItem;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMeasureItem;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
  end;
  { TFlatCheckListExt }
  TFlatCheckListExt = class(TDefineListBoxExt)
  private
    FAllowGrayed: Boolean;
    FFlat: Boolean;
    FStandardItemHeight: Integer;
    FOnClickCheck: TNotifyEvent;
    FSaveStates: TList;
    FHeaderColor: TColor;
    FHeaderBkColor: TColor;
    procedure ResetItemHeight;
    procedure DrawCheck(R: TRect; AState: TCheckBoxState; AEnabled: Boolean);
    procedure SetChecked(Index: Integer; AChecked: Boolean);
    function GetChecked(Index: Integer): Boolean;
    procedure SetState(Index: Integer; AState: TCheckBoxState);
    function GetState(Index: Integer): TCheckBoxState;
    procedure ToggleClickCheck(Index: Integer);
    procedure InvalidateCheck(Index: Integer);
    function CreateWrapper(Index: Integer): TObject;
    function ExtractWrapper(Index: Integer): TObject;
    function GetWrapper(Index: Integer): TObject;
    function HaveWrapper(Index: Integer): Boolean;
    procedure SetFlat(Value: Boolean);
    procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure WMDestroy(var Msg : TWMDestroy);message WM_DESTROY;
    function GetItemEnabled(Index: Integer): Boolean;
    procedure SetItemEnabled(Index: Integer; const Value: Boolean);
    function GetHeader(Index: Integer): Boolean;
    procedure SetHeader(Index: Integer; const Value: Boolean);
    procedure SetHeaderBkColor(const Value: TColor);
    procedure SetHeaderColor(const Value: TColor);
  protected
    procedure DrawItem(Index: Integer; Rect: TRect;
      State: TOwnerDrawState); override;
    function InternalGetItemData(Index: Integer): Longint; override;
    procedure InternalSetItemData(Index: Integer; AData: Longint); override;
    procedure SetItemData(Index: Integer; AData: LongInt); override;
    function GetItemData(Index: Integer): LongInt; override;
    procedure KeyPress(var Key: Char); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure ResetContent; override;
    procedure DeleteString(Index: Integer); override;
    procedure ClickCheck; dynamic;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    function GetCheckWidth: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CheckAll;
    procedure CheckCancel;
    property Checked[Index: Integer]: Boolean read GetChecked write SetChecked;
    property ItemEnabled[Index: Integer]: Boolean read GetItemEnabled write SetItemEnabled;
    property State[Index: Integer]: TCheckBoxState read GetState write SetState;
    property Header[Index: Integer]: Boolean read GetHeader write SetHeader;
  published
    property OnClickCheck: TNotifyEvent read FOnClickCheck write FOnClickCheck;
    property HeaderColor: TColor read FHeaderColor write SetHeaderColor default clInfoText;
    property HeaderBkColor: TColor read FHeaderBkColor write SetHeaderBkColor default clInfoBk;
    property AllowGrayed: Boolean read FAllowGrayed write FAllowGrayed default False;
    property Flat: Boolean read FFlat write SetFlat default True;
    property ColorFocused;
    property ColorBorder;
    property ColorFlat;
    property ParentColor;
    property Align;
    property Anchors;
    property AutoComplete;
    property BiDiMode;
    property Columns;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ImeMode;
    property ImeName;
    property IntegralHeight;
    property ItemHeight;
    property Items;
    property ParentBiDiMode;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Sorted;
    property Style;
    property TabOrder;
    property TabStop;
    property TabWidth;
    property Visible;
    property OnClick;
    property OnContextPopup;
    property OnData;
    property OnDataFind;
    property OnDataObject;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawItem;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMeasureItem;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
  end;

implementation

uses Consts, RTLConsts, Themes;

{ TDefineCheckBox }

constructor TDefineCheckBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle  := [csSetCaption, csDoubleClicks];
  ParentColor   := False;
  ParentFont    := True;
  TabStop       := True;
  Enabled       := True;
  Visible       := True;
  Color         := DefaultFlatColor;
  FFocusedColor := DefaultBackdropColor;
  FDownColor    := DefaultBarColor;
  FCheckedColor   := DefaultCheckColor;
  FBorderColor  := DefaultBorderColor;   
  FLayout       := lpLeft;
  FChecked      := false;
  FTransparent  := True;
  SetBounds(0, 0, 121, 15);
end;

procedure TDefineCheckBox.SetColors(Index: Integer; Value: TColor);
begin
  case Index of
    0: FFocusedColor := Value;
    1: FDownColor    := Value;
    2: FCheckedColor   := Value;
    3: FBorderColor  := Value;
  end;
  Invalidate;
end;

procedure TDefineCheckBox.SetLayout(Value: TLayoutPosition);
begin
  FLayout := Value;
  Invalidate;
end;

procedure TDefineCheckBox.SetChecked(Value: Boolean);
begin
  if FChecked <> Value then
  begin
    FChecked := Value;
    Click;
    Invalidate;
    if csDesigning in ComponentState then
      if(GetParentForm(self) <> nil) and(GetParentForm(self).Designer <> nil) then
        GetParentForm(self).Designer.Modified;
  end;
end;

procedure TDefineCheckBox.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  if not Enabled then
  begin
    FMouseIn    := False;
    FMouseDown := False;
  end;
  Invalidate;
end;

procedure TDefineCheckBox.CMTextChanged(var Message: TWmNoParams);
begin
  inherited;
  Invalidate;
end;

procedure TDefineCheckBox.CMDialogChar(var Message: TCMDialogChar);
begin
  with Message do
    if IsAccel(Message.CharCode, Caption) and CanFocus then
    begin
      SetFocus;
      if Checked then
         Checked := False
      else
         Checked := True;
      Result := 1;
    end
    else
      if(CharCode = VK_SPACE) and Focused then
      begin
        if Checked then
           Checked := False
        else
           Checked := True;
      end
      else
        inherited;
end;

procedure TDefineCheckBox.CNCommand(var Message: TWMCommand);
begin
  if Message.NotifyCode = BN_CLICKED then Click;
end;

procedure TDefineCheckBox.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  if not(csDesigning in ComponentState) and Enabled then
  begin
    Focused := True;
    invalidate;
  end;
end;

procedure TDefineCheckBox.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  if not(csDesigning in ComponentState) and Enabled then
  begin
    FMouseIn := False;
    Focused  := False;
    invalidate;
  end;
end;

procedure TDefineCheckBox.CMSysColorChange(var Message: TMessage);
begin
  inherited;
  if (Parent <> nil)and(ParentColor) then
      Color := TDefineCheckBox(Parent).Color;
  Invalidate;
end;

procedure TDefineCheckBox.CMParentColorChanged(var Message: TWMNoParams);
begin
  inherited;
  FTransParent := not ParentColor;
  if (Parent <> nil)and(not ParentColor) then
  begin
      Color   := TDefineCheckBox(Parent).Color;
  end;
  Invalidate;
end;

procedure TDefineCheckBox.DoEnter;
begin
  inherited DoEnter;
  Focused := True;
  invalidate;
end;

procedure TDefineCheckBox.DoExit;
begin
  inherited DoExit;
  Focused := False;
  invalidate;
end;

procedure TDefineCheckBox.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if(Button = mbLeft) and Enabled then
  begin
    SetFocus;
    FMouseDown := true;
    invalidate;
  end;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TDefineCheckBox.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if(Button = mbLeft) and Enabled then
  begin
    FMouseDown := false;
    if FMouseIn then
      if Checked then
         Checked := False
      else
         Checked := True;
    invalidate;
  end;
  inherited MouseUp(Button, Shift, X, Y);
end;

procedure TDefineCheckBox.Paint;
var
  TextBounds, CheckRect: TRect;
  Format: UINT;
  TextAs:Integer;
begin
  with Canvas do
  begin
    Lock;
    Font.Assign(self.Font);
    Width  := TextWidth(Caption)+20;
    Height := TextHeight(Caption)+2;
    if FTransparent then
       DrawParentImage(Self, Canvas)
    else
    begin
       Brush.Color := self.Color;
       FillRect(ClientRect);
    end;
    //draw Background
    with ClientRect do
    begin
     case FLayout of
      lpLeft: CheckRect := Rect(Left + 1,   Top + 1, Left + 13, Top + 13);
     lpRight: CheckRect := Rect(Right - 13, Top + 1, Right - 1, Top + 13);
     end;
    end;
    Pen.style := psSolid;
    Pen.width := 1;
    if (Focused or FMouseIn)and(not(csDesigning in ComponentState)) then
    begin
     if (not FMouseDown) then
     begin
        Brush.color := FFocusedColor;
        Pen.color   := FBorderColor;
     end else begin
        Brush.color := FDownColor;
        Pen.color   := FBorderColor;
     end;
    end else begin
      Brush.color := self.Color;
      Pen.color   := FBorderColor;
    end;
    FillRect(CheckRect);
    if Checked then
    begin
     if Enabled then
        DrawInCheck(Canvas,CheckRect,FCheckedColor)
     else
        DrawInCheck(Canvas,CheckRect,clBtnShadow);
    end;
    //draw Border
    Brush.color := FBorderColor;
    FrameRect(CheckRect);
    //draw text
    Brush.Style := bsClear;
    Format      := DT_WORDBREAK;
    with ClientRect do
    begin
     TextAs:=(RectHeight(ClientRect)+ CheckRect.top - TextHeight('W')) div 2;
     case FLayout of
      lpLeft: begin
          TextBounds := Rect(Left + 16, Top + TextAs, Right - 1, Bottom - TextAs);
          Format     := Format or DT_LEFT;
      end;
      lpRight: begin
          TextBounds := Rect(Left + 1,  Top + TextAs, Right - 16, Bottom - TextAs);
          Format     := Format or DT_RIGHT;
      end;
     end;
    end;
    if not Enabled then begin
      OffsetRect(TextBounds, 1, 1);
      Font.Color := clBtnHighlight;
      DrawText(Handle, PChar(Caption), Length(Caption), TextBounds, Format);
      OffsetRect(TextBounds, -1, -1);
      Font.Color := clBtnShadow;
      DrawText(Handle, PChar(Caption), Length(Caption), TextBounds, Format);
    end
    else
      DrawText(Handle, PChar(Caption), Length(Caption), TextBounds, Format);
    unLock;
  end;
end;

procedure TDefineCheckBox.SetTransparent(const Value: Boolean);
begin
  if FTransparent <> Value then
  begin
     FTransparent := Value;
     ParentColor  := not Value;
     Invalidate;
  end;
end;

procedure TDefineCheckBox.WMMove(var Message: TWMMove);
begin
  inherited;
  if FTransparent then
     Invalidate;
end;

procedure TDefineCheckBox.WMSize(var Message: TWMSize);
begin
  inherited;
  if FTransparent then
     Invalidate;
end;

procedure TDefineCheckBox.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if not(csDesigning in ComponentState) and
        (GetActiveWindow <> 0) and (not FMouseIn) then
  begin
    FMouseIn := True;
    Invalidate;
  end;
end;

procedure TDefineCheckBox.CMMouseLeave(var Message: TMessage);
begin
 inherited;
 FMouseIn := false;
 Invalidate;
end;

procedure TDefineCheckBox.CMFontChanged(var Message: TMessage);
begin
 inherited;
 Invalidate;
end;

{ TDefineGroupBox }

constructor TDefineGroupBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csAcceptsControls, csOpaque];
  FBorderColor := DefaultBorderColor;
  FBackgropStartColor := DefaultColorStart;
  FBackgropStopColor  := DefaultColorStop;
  FBackgropOrien      := bsHorizontal;
  FAlignment          := stLeft;
  SetBounds(0, 0, 185, 105);
end;

procedure GetStyleGroupBox(Value:TAlignmentText; var Result:UINT);
begin
  case Value of
   stLeft   : result := DT_TOP or DT_LEFT   or DT_VCENTER or DT_SINGLELINE or DT_NOPREFIX;
   stRight  : result := DT_TOP or DT_RIGHT  or DT_VCENTER or DT_SINGLELINE or DT_NOPREFIX;
   stCenter : result := DT_TOP or DT_CENTER or DT_VCENTER or DT_SINGLELINE or DT_NOPREFIX;
  end;
end;

procedure TDefineGroupBox.Paint;
var
  memBitmap: TBitmap;
  borderRect, textBounds: TRect;
  textHeight, textWidth, TextLeft, TextRight: integer;
  Format: UINT;
begin
  borderRect := ClientRect;
  GetStyleGroupBox(FAlignment,Format);
  memBitmap := TBitmap.Create; // create memory-bitmap to draw flicker-free
  try
    memBitmap.Height := ClientRect.Bottom;
    memBitmap.Width  := ClientRect.Right;
    memBitmap.Canvas.Font := Self.Font;

    textHeight := memBitmap.Canvas.TextHeight(caption);
    textWidth  := memBitmap.Canvas.TextWidth(caption);

    textBounds := Rect(ClientRect.Left + 10, ClientRect.Top, ClientRect.Right - 10, ClientRect.Top + textHeight);

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

    case FAlignment of
     stLeft:
       begin
         TextLeft := ClientRect.left + 5;
         TextRight:= ClientRect.left + 12 + textWidth;
       end;
     stRight:begin
         TextLeft := ClientRect.Right - TextWidth - 15;
         TextRight:= ClientRect.Right - 8;
       end;
    else//stCenter:
         TextRight:= (RectWidth(ClientRect) + textWidth + 5) div 2;
         TextLeft := (RectWidth(ClientRect) - textWidth - 12) div 2;
    end;
    // Draw Border
    memBitmap.Canvas.Pen.Color := FBorderColor;
    case FBorder of
      brFull:
        begin
          memBitmap.Canvas.Polyline([Point(TextLeft, ClientRect.top +(textHeight div 2)),
            Point(ClientRect.left, ClientRect.top +(textHeight div 2)),
            Point(ClientRect.left, ClientRect.bottom-1), Point(ClientRect.right-1, ClientRect.bottom-1),
            Point(ClientRect.right-1, ClientRect.top +(textHeight div 2)),
            Point(TextRight, ClientRect.top +(textHeight div 2))]);
        end;
      brOnlyTopLine:
        begin
            memBitmap.Canvas.Polyline([Point(ClientRect.left + 5, ClientRect.top +(textHeight div 2)), Point(ClientRect.left, ClientRect.top +(Canvas.textHeight(caption) div 2))]);
            memBitmap.Canvas.Polyline([Point(ClientRect.right-1, ClientRect.top +(textHeight div 2)), Point(ClientRect.left + 12 + textWidth, ClientRect.top +(textHeight div 2))]);
        end;
    end;

    // Draw Text
    memBitmap.Canvas.Brush.Style := bsClear;
    if not Enabled then
    begin
      OffsetRect(textBounds, 1, 1);
      memBitmap.Canvas.Font.Color := clBtnHighlight;
      DrawText(memBitmap.Canvas.Handle, PChar(Caption), Length(Caption), textBounds, Format);
      OffsetRect(textBounds, -1, -1);
      memBitmap.Canvas.Font.Color := clBtnShadow;
      DrawText(memBitmap.Canvas.Handle, PChar(Caption), Length(Caption), textBounds, Format);
    end
    else
      DrawText(memBitmap.Canvas.Handle, PChar(Caption), Length(Caption), textBounds, Format);

    // Copy memBitmap to screen
    Canvas.CopyRect(ClientRect, memBitmap.Canvas, ClientRect);
  finally
    memBitmap.free; // delete the bitmap
  end;
end;

procedure TDefineGroupBox.CMTextChanged(var Message: TWmNoParams);
begin
  inherited;
  Invalidate;
end;

procedure TDefineGroupBox.SetColors(const Index: Integer;
  const Value: TColor);
begin
  case Index of
    0: FBorderColor := Value;
    1: FBackgropStartColor := Value;
    2: FBackgropStopColor := Value;
  end;
  Invalidate;
end;

procedure TDefineGroupBox.SetBorder(const Value: TGroupBoxBorder);
begin
  FBorder := Value;
  Invalidate;
end;

procedure TDefineGroupBox.SetBackgropOrien(const Value: TStyleOrien);
begin
  if FBackgropOrien <> Value then begin
     FBackgropOrien := Value;
     Invalidate;
  end;
end;

procedure TDefineGroupBox.SetStyleFace(const Value: TStyleFace);
begin
  if FStyleFace <> Value then begin
     FStyleFace := Value;
     Invalidate;
  end;
end;

procedure TDefineGroupBox.CMParentColorChanged(var Message: TWMNoParams);
begin
  inherited;
  FTransParent := not ParentColor;
  if (Parent <> nil)and(ParentColor) then
  begin
      Color := TForm(Parent).Color;
  end;
  Invalidate;
end;

procedure TDefineGroupBox.CMSysColorChange(var Message: TMessage);
begin
  inherited;
  if (Parent <> nil)and(ParentColor) then
      Color := TForm(Parent).Color;
  Invalidate;
end;

procedure TDefineGroupBox.CMDialogChar(var Message: TCMDialogChar);
begin
  with Message do
    if IsAccel(Message.CharCode, Caption) and CanFocus then
    begin
      SetFocus; 
      Result := 1;
    end;
end;

procedure TDefineGroupBox.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TDefineGroupBox.SetTransparent(const Value: Boolean);
begin
  FTransparent := Value;
  Invalidate;
end;

procedure TDefineGroupBox.WMMove(var Message: TWMMove);
begin
  inherited;
  if FTransparent then
    Invalidate;
end;

procedure TDefineGroupBox.WMSize(var Message: TWMSize);
begin
  inherited;
  if FTransparent then
    Invalidate;
end;

procedure TDefineGroupBox.SetAlignment(const Value: TAlignmentText);
begin
 if FAlignment <> Value then
 begin
    FAlignment := Value;
    Invalidate;
 end;
end;

{ TDefineListBox }

var
  ScrollTimer: TTimer = nil;

const
  FTimerInterval = 600;
  FScrollSpeed   = 100;

procedure DrawScrollBar(control:TControl; Focused:boolean; canvas: TCanvas; BarsRect: TBarsRect; Style: TFlatSkin;
                        FirstItem, MaxItems, ItemsCount: Integer; Enabled: Boolean);
var
 x, y: Integer;
 procedure DrawImage;
 begin
   with Style, BarsRect do begin
    if not BarUseBitmap then
    begin
     if UserFace = fsDefault then
     begin
        canvas.Brush.Color := BarColor;
        canvas.FillRect(prevRect);
        canvas.FillRect(downRect);
     end else begin
     DrawBackdrop(Canvas,BarStartColor,BarStopColor,prevRect,BarOrien);
     case Style.BarOrien of
         bsHorizontal:DrawBackdrop(Canvas,BarStartColor,BarStopColor,downRect,BarOrien);  //水平
         bsVertical  :DrawBackdrop(Canvas,BarStopColor,BarStartColor,downRect,BarOrien);  //垂直
     end;
     end;
    end else begin
     DrawBitmap(Canvas,prevRect,BarTopBitmap);
     DrawBitmap(Canvas,downRect,BarDownBitmap);
    end;
   end;
 end;
begin
  // 画滚动条背景
  with Style,BarsRect do begin
  case Transparent of
          tmAlways: DrawParentImage(control, Canvas);
            tmNone: DrawImage;
      tmNotFocused: if Focused then
                       DrawImage
                    else
                       DrawParentImage(control, Canvas);
  end;
  // 画滚动条边框
  canvas.Brush.Color := BorderColor;
  canvas.FrameRect(prevRect);
  canvas.FrameRect(downRect);

  // Draw the up arrow
  x := (prevRect.Right - prevRect.Left) div 2 - 6;
  y :=  prevRect.Top + 4;

  if (firstItem <> 0) and Enabled then
  begin
    canvas.Brush.Color := BarArrowColor;
    canvas.Pen.Color   := BarArrowColor;
    canvas.Polygon([Point(x + 4, y + 2), Point(x + 8, y + 2), Point(x + 6, y)]);
  end
  else
  begin
    canvas.Brush.Color := clWhite;
    canvas.Pen.Color   := clWhite;
    Inc(x); Inc(y);
    canvas.Polygon([Point(x + 4, y + 2), Point(x + 8, y + 2), Point(x + 6, y)]);
    Dec(x); Dec(y);
    canvas.Brush.Color := clGray;
    canvas.Pen.Color   := clGray;
    canvas.Polygon([Point(x + 4, y + 2), Point(x + 8, y + 2), Point(x + 6, y)]);
  end;

  // Draw the down arrow
  x := (downRect.Right - downRect.Left) div 2 - 6;
  y :=  downRect.Bottom - 7;
  if (firstItem + maxItems + 1 <= ItemsCount) and Enabled then
  begin
    canvas.Brush.Color := BarArrowColor;
    canvas.Pen.Color   := BarArrowColor;
    canvas.Polygon([Point(X + 4, Y), Point(X + 8, Y), Point(X + 6, Y + 2)]);
  end
  else
  begin
    canvas.Brush.Color := clWhite;
    canvas.Pen.Color   := clWhite;
    Inc(x); Inc(y);
    canvas.Polygon([Point(X + 4, Y), Point(X + 8, Y), Point(X + 6, Y + 2)]);
    Dec(x); Dec(y);
    canvas.Brush.Color := clGray;
    canvas.Pen.Color   := clGray;
    canvas.Polygon([Point(X + 4, Y), Point(X + 8, Y), Point(X + 6, Y + 2)]);
  end;
  end;
end;

function CurItemRect(CurPos:TPoint;CurRect:TRect;ItemHeight:integer):TRect;
begin
 result := Rect(CurPos.x, CurPos.y, CurRect.Right - 3, CurPos.y + ItemHeight);
end;

procedure CreateRects(List:TList;MaxItems,ItemHeight:integer;CurPos:TPoint;CurRect:TRect);
var
  ItemRect: ^TRect;
  inx:integer;
begin
  RemoveList(List);
  for inx := 0 to MaxItems - 1 do
  begin
    New(ItemRect);
    ItemRect^ := CurItemRect(CurPos,CurRect,ItemHeight);
    List.Add(ItemRect);
    CurPos    := Point(CurPos.x, CurPos.y + ItemHeight + 2);
  end;
end;

constructor TDefineListBox.Create(AOwner: TComponent);
begin
  if ScrollTimer = nil then begin
     ScrollTimer := TTimer.Create(nil);
     ScrollTimer.Enabled  := False;
     ScrollTimer.Interval := FTimerInterval;
  end;
  inherited Create(AOwner);
  ControlStyle    := ControlStyle + [csOpaque];
  SetBounds(0, 0, 140, 158);
  ParentColor     := True;
  ParentFont      := True;
  Enabled         := true;
  Visible         := true;
  TabStop         := True;
  FStyle          := TListStyle.Create;
  FStyle.Parent   := self;
  FStyle.OnChange := StyleChange;
  FItems          := TStringList.Create;
  //FItems          := TListBoxStrings.Create;
  //TListBoxStrings(FItems).ListBox := Self;
  FItems.OnChange := StyleChange;
  FRects          := TList.Create;
  FChecks         := TList.Create;
  FMultiSelect    := false;
  FSorted         := false;
  FirstItem       := 0;
  FItemIndex      := -1;
  FCaption        := '';
end;

destructor TDefineListBox.Destroy;
begin
  ScrollTimer.Free;
  ScrollTimer := nil;
  //释放 FRect
  RemoveList(FRects, lsFree);
  //释放 FChecks
  RemoveList(FChecks, lsFree);
  FItems.Free;
  FStyle.Free;
  inherited Destroy;
end;

procedure TDefineListBox.WMMouseWheel(var Message: TMessage);
var
  fScrollLines: Integer;
begin
  if not(csDesigning in ComponentState) then
  begin
    SystemParametersInfo(SPI_GETWHEELSCROLLLINES, 0, @fScrollLines, 0);

    if(fScrollLines = 0) then
       fScrollLines := MaxItems;

    if ShortInt(Message.WParamHi) = -WHEEL_DELTA then
      if FirstItem + MaxItems + fScrollLines <= FItems.Count then
         Inc(FirstItem, fScrollLines)
      else
        if FItems.Count - MaxItems < 0 then
           FirstItem := 0
        else
           FirstItem := FItems.Count - MaxItems
    else
      if ShortInt(Message.WParamHi) = WHEEL_DELTA then
        if FirstItem - fScrollLines < 0 then
           FirstItem := 0
        else
           dec(FirstItem, fScrollLines);
    Invalidate;
  end;
end;

function TDefineListBox.GetItemText: TCaption;
begin
  if IndexInCount(FItemIndex,FItems.Count) then
     result := FItems.Strings[FItemIndex]
  else
     result := '';
end;

function TDefineListBox.Find(Value: String; var Index: Integer): boolean;
begin
  result := false;
  index  := -1;
  while(index < Items.Count) and(not result) do begin
     inc(Index);
     if IndexInCount(Index,Items.Count) then
        result := Items.Strings[index]=Value;
  end;
end;

function TDefineListBox.FindChecked(Value:Integer; var index:integer):boolean;
var inx:integer;
    tmp:^Integer;
begin
  inx    := 0;
  result := false;
  while (inx < FChecks.Count)and(not result) do
  begin
    tmp := FChecks.Items[inx];
    result := Tmp^ = Value;
    if result then index := inx else index := -1;
    inc(inx);
  end;
end;

procedure TDefineListBox.AddCheck(Index:integer);
var inx:^Integer;
    x:integer;
begin
 if not FindChecked(index,x) then begin
    new(inx);
    inx^:=Index;
    FChecks.Add(inx);
 end;
end;

procedure TDefineListBox.DeleteChecked(Index:Integer);
begin
  Dispose(FChecks.Items[index]);
  FChecks.Delete(index);
end;

procedure TDefineListBox.Click;
begin
  inherited Click;
  if not Focused then SetFocus;
  if assigned(FOnClick) and IndexInCount(FItemIndex,FItems.Count) then begin
     FOnClick(self,FItems.Strings[FItemIndex]);
  end;
end;

procedure TDefineListBox.SetSorted(Value: Boolean);
begin
  if Value <> FSorted then
  begin
    FSorted       := Value;
    FItems.Sorted := Value;
    Invalidate;
  end;
end;

procedure TDefineListBox.SetItems(Value: TStringList);
begin
  FItems.Assign(Value);
end;

procedure TDefineListBox.SetItemsRect;
var
  CurPos: TPoint;
  curRect: TRect;
begin
  CurRect := ClientRect;
  with FStyle do begin
  if TitleHas then begin
    case TitlePosition of
      tsTop   : CurRect.Top    := CurRect.Top + TitleHeight;
      tsBottom: CurRect.Bottom := CurRect.Bottom - TitleHeight;
    end;
  end;
  // set left/top PosR for the the first item
  if ScrollBars then
     CurPos := Point(CurRect.left + 3, CurRect.top + 3 + BarsHeight)
  else
     CurPos := Point(CurRect.left + 3, CurRect.top + 3);

  // recreate all items-rect
  CreateRects(FRects,MaxItems,ItemHeight,CurPos,CurRect);
  end;
  Invalidate;
end;

function TDefineListBox.GetSelected(Index: Integer): Boolean;
begin
  Result := FindChecked(index, FItemIndex);
end;

procedure TDefineListBox.SetSelected(Index: Integer; Value: Boolean);
var inx:Integer;
begin
  if MultiSelect then
  begin
   if FindChecked(Index , inx) and Value then
      DeleteChecked(inx)
   else
      AddCheck(index);
  end else begin
      RemoveList(FChecks);
      FChecks.Clear;
  end;
  Invalidate;
end;

function TDefineListBox.GetSelCount: Integer;
begin
  if MultiSelect then
     Result := FChecks.Count
  else
     Result := -1;
end;

procedure TDefineListBox.Paint;
var
 memBitmap: TBitmap;
 inxRect, inxItem, CurIndex: Integer;
 itemRect: ^TRect;
 Format, TitleFormat: UINT;
 WorkRect, TitleRect:TRect;
 BarsRect: TBarsRect;
 curState: Boolean;
 procedure DrawImage(Canvas:TCanvas;Skin:TListStyle;WorkRect,TitleRect:TRect;TitleHas:Boolean);
 begin
  with Skin do begin
   //draw backgroud
   if not BackUseBitmap then
   begin
      if (Enabled)and(Focused or FMouseIn) then
         BoxDrawBackDrop(Canvas,BackStartColor,BackStopColor,BackdropOrien,WorkRect,BackdropColor,UserFace)
      else
         BoxDrawBackDrop(Canvas,BackStartColor,BackStopColor,BackdropOrien,WorkRect,BackFocusColor,UserFace);
   end
   else
      DrawBitmap(Canvas,WorkRect,BackBitmap);
   //draw title backgroud
   if TitleHas then
   begin
     if not TitleUseBitmap then
        BoxDrawBackDrop(Canvas,TitleStartColor,TitleStopColor,TitleOrien,TitleRect,TitleColor,UserFace)
     else
        DrawBitmap(Canvas,TitleRect,TitleBitmap);
   end;
  end;
 end;
begin
  // create memory-bitmap to draw flicker-free
  memBitmap := TBitmap.Create;
  try
   memBitmap.Height := ClientRect.Bottom;
   memBitmap.Width  := ClientRect.Right;
   //控制区域
   WorkRect   := ClientRect;
   TitleRect  := ClientRect;
   with FStyle do begin
    if TitleHas then begin
      case TitlePosition of
          tsTop : begin
           WorkRect.Top     := WorkRect.Top  + TitleHeight;
           TitleRect.Bottom := TitleRect.Top + TitleHeight;
         end;
       tsBottom : begin
           WorkRect.Bottom  := WorkRect.Bottom  - TitleHeight;
           TitleRect.Top    := TitleRect.Bottom - TitleHeight;
         end;
      end;
    end;
    with BarsRect do begin
    if ScrollBars then begin
      prevRect := Rect(WorkRect.Left, WorkRect.Top, WorkRect.Right, WorkRect.Top + BarsHeight);
      downRect := Rect(WorkRect.Left, WorkRect.Bottom - BarsHeight, WorkRect.Right, WorkRect.Bottom);
      workRect := Rect(workRect.Left, workRect.Top + BarsHeight, workRect.Right, workRect.Bottom - BarsHeight);
    end;
    end;
    GetStyleText(ItemAlignment, Format);
    GetStyleText(TitleAlignment,TitleFormat);
    // Clear Background
    case Transparent of
          tmAlways: DrawParentImage(Self, memBitmap.Canvas);
            tmNone: DrawImage(memBitmap.Canvas,FStyle,WorkRect,TitleRect,TitleHas);
      tmNotFocused: if Focused then
                       DrawImage(memBitmap.Canvas,FStyle,WorkRect,TitleRect,TitleHas)
                    else
                       DrawParentImage(Self, memBitmap.Canvas);
    end;
    //Draw ScrollBars
    if ScrollBars then begin
       DrawScrollBar(self, Focused, memBitmap.Canvas, BarsRect, FStyle, FirstItem, MaxItems, FItems.Count, Enabled);
    end;
    // Draw Border
    memBitmap.Canvas.Brush.Color := BorderColor;
    memBitmap.Canvas.FrameRect(ClientRect);
    // Draw Focused Frame
    if(fItems.Count <=0)and(Focused) then
       DrawFocusRect(memBitmap.Canvas,WorkRect,ItemHeight);
    // draw titletext
    if TitleHas then begin
       MemBitmap.Canvas.Font.Assign(FStyle.TitleFont);
       FlatDrawText(memBitmap.Canvas, Enabled, FCaption, TitleRect, TitleFormat);
    end;
   end;
   // Initialize the counter for the Items
   memBitmap.Canvas.Font.Assign(Self.Font);
   inxItem := FirstItem;
   // Draw Items
   for inxRect := 0 to MaxItems - 1 do
    begin
      itemRect := FRects.Items[inxRect];
      if(inxItem <= FItems.Count - 1) then
      begin
        // Item is selected
        CurState := FindChecked(inxItem, CurIndex);
        with FStyle do begin
         // Draw ItemBorder
         if ItemLineHas then
         begin
            memBitmap.Canvas.Brush.color := ItemLineColor;
            memBitmap.Canvas.FrameRect(itemRect^);
         end;
         if inxItem = FItemIndex then
         begin
          // Fill ItemRect
          BoxDrawBackDrop(memBitmap.Canvas,ItemStartColor,ItemStopColor,ItemOrien, itemRect^, ItemSelectColor,UserFace);
          if Focused and (not MultiSelect) then
             DrawFocusRect(memBitmap.Canvas,itemRect^,ItemHeight);
          memBitmap.Canvas.Brush.color := ItemFrameColor;
          memBitmap.Canvas.FrameRect(itemRect^);
         end else if CurState then begin
          BoxDrawBackDrop(memBitmap.Canvas,ItemStartColor,ItemStopColor,bsVertical, itemRect^, ItemSelectColor,UserFace);
         end; 
        end;
        // Draw ItemText
        FlatDrawText(memBitmap.Canvas, Enabled, FItems[inxItem], itemRect^, Format);
        // draw next Item
        Inc(inxItem);
      end;
    end;
    // Copy bitmap to screen
    Canvas.CopyRect(ClientRect, memBitmap.Canvas, ClientRect);
  finally
    // delete the memory bitmap
    memBitmap.free;
  end;
end;

procedure TDefineListBox.SelectNotifyEvent;
begin
  if assigned(FOnChange) and IndexInCount(FItemIndex,FItems.Count) then FOnChange(self,FItems.Strings[FItemIndex]);
  if assigned(FOnClick) and IndexInCount(FItemIndex,FItems.Count) then FOnClick(self,FItems.Strings[FItemIndex]);
end;

procedure TDefineListBox.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  curPos: TPoint;
  inxRect: Integer;
  curRect: ^TRect;
  BarsRect: TBarsRect;
begin
  GetCursorPos(curPos);
  curPos := ScreenToClient(curPos);
  with FStyle do
  begin
  if(FItems.Count > 0) and(Button = mbLeft) then
  begin
    for inxRect := 0 to FRects.Count - 1 do
    begin
      curRect := FRects.Items[inxRect];
      if PtInRect(curRect^, curPos) then
      begin
       FItemIndex := FirstItem + inxRect;
       SetSelected(FItemIndex,True);
       SetFocus;
       Invalidate;
       Exit;
      end;
    end;
  end;

  if ScrollBars then
  begin
    GetBarPosition(ClientRect,TitleHas,TitlePosition,BarsRect,TitleHeight,BarsHeight);
    if PtInRect(BarsRect.prevRect, curPos) then
    begin
      if (FirstItem - 1) < 0 then
        FirstItem := 0
      else
        Dec(FirstItem);
      SetFocus;
      Invalidate;
      scrollType := stUp;
      if ScrollTimer.Enabled then
         ScrollTimer.Enabled := False;
      ScrollTimer.OnTimer := ScrollTimerHandler;
      ScrollTimer.Enabled := True;
    end;
    if PtInRect(BarsRect.downRect, curPos) then
    begin
      if FirstItem + MaxItems + 1 <= FItems.Count then
         Inc(FirstItem);
      SetFocus;
      Invalidate;
      scrollType := stDown;
      if ScrollTimer.Enabled then
         ScrollTimer.Enabled := False;
      ScrollTimer.OnTimer := ScrollTimerHandler;
      ScrollTimer.Enabled := True;
    end;
  end;
  end;
  Inherited;
end;

procedure TDefineListBox.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ScrollTimer.Enabled  := False;
  ScrollTimer.Interval := FTimerInterval;
  inherited MouseUp(Button, Shift, X, Y);
end;

procedure TDefineListBox.ScrollTimerHandler(Sender: TObject);
begin
  ScrollTimer.Interval := FScrollSpeed;
  if scrollType = stUp then
    if(FirstItem - 1) < 0 then
    begin
      FirstItem := 0;
      ScrollTimer.Enabled := False;
    end
    else
      Dec(FirstItem)
  else
    if FirstItem + MaxItems + 1 <= FItems.Count then
      Inc(FirstItem)
    else
      ScrollTimer.Enabled := False;
  Invalidate;
end;

procedure TDefineListBox.Loaded;
begin
  inherited;
  SetItemsRect;
end;

procedure TDefineListBox.WMSize(var Message: TWMSize);
var y,inx:integer;
begin
  inherited;
  with FStyle do begin
  y := 2;
  for inx := 1 to MaxItems do
      y := y +(ItemHeight + 2);
  y := y + 2;
  if ScrollBars then
     y := y + BarsHeight * 2;
  if TitleHas then
     y := y + TitleHeight;
  if not(csLoading in ComponentState) then
     SetBounds(Left,Top,Width,y);
  end;
  // Recalculate the itemRects
  SetItemsRect;
end;

procedure TDefineListBox.WMMove(var Message: TWMMove);
begin
  inherited;
  if not(FStyle.Transparent = tmNone) then
    Invalidate;
end;

procedure TDefineListBox.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  FMouseIn := False;
  if IndexInCount(FItemIndex, FItems.Count) then
     SetSelected(FItemIndex,False);
  Invalidate;
end;

procedure TDefineListBox.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  if FItemIndex >= 0 then
     SetSelected(FItemIndex,True)
  else if FItems.Count > 0 then begin
     FItemIndex := 0;
     SetSelected(FItemIndex,True);
  end;
  Invalidate;
end;

procedure TDefineListBox.WMKeyDown(var Message: TWMKeyDown);
begin
  case Message.CharCode of
    VK_UP: begin
       if(FirstItem - 1) < 0 then
          FirstItem := 0
       else
          Dec(FirstItem);
       if FItems.Count > 0 then begin
        if FItemIndex > 0 then
           Dec(FItemIndex)
        else
           FItemIndex := 0;
        //SetSelected(FItemIndex,True);
        SelectNotifyEvent;
       end;
      end;
    VK_DOWN:begin
      if FirstItem + MaxItems + 1 <= FItems.Count then
         Inc(FirstItem);
         
      if FItems.Count > 0 then begin
       if FItemIndex < FItems.Count-1 then
          Inc(FItemIndex)
       else
          FItemIndex := FItems.Count-1;
       //SetSelected(FItemIndex,True);
       SelectNotifyEvent;
      end;
      end;
    VK_PRIOR:
      if(FirstItem - MaxItems) < 0 then
        FirstItem := 0
      else
        Dec(FirstItem, MaxItems);
    VK_NEXT:
      if FirstItem +(MaxItems * 2) <= FItems.Count then
        Inc(FirstItem, MaxItems)
      else
        FirstItem := FItems.Count - MaxItems;
    VK_SPACE: begin
      SetSelected(FItemIndex,True);
      SelectNotifyEvent;
      end;
  else
    inherited;
  end;
  Invalidate;
end;

function TDefineListBox.GetItemIndex: Integer;
begin
  Result := FItemIndex;
end;

procedure TDefineListBox.SetItemIndex(Value: Integer);
begin
  if GetItemIndex <> Value then
  begin
    FItemIndex := Value;
    Invalidate;
  end;
end;

procedure TDefineListBox.SetMultiSelect(Value: Boolean);
begin
  FMultiSelect := Value;
  if Value then
     FItemIndex := 0;
end;

procedure TDefineListBox.SetName(const Value: TComponentName);
begin
  if(csDesigning in ComponentState) and((Length(FCaption) = 0) or
    (CompareText(FCaption, Name) = 0)) then
    FCaption   := Value;
  inherited SetName(Value);
end;

procedure TDefineListBox.SetListStyle(const Value: TListStyle);
begin
 FStyle.Assign(Value);
end;

procedure TDefineListBox.StyleChange(Sender: TObject);
begin
 SetItemsRect;
 Invalidate;
end;

function TDefineListBox.GetMaxItems: Integer;
begin
  result := ClientRect.Bottom - ClientRect.Top;
  with FStyle do begin
  if TitleHas then
     result := result - TitleHeight;
  if ScrollBars then
     result := result - BarsHeight * 2;
  result :=(result - 4) div(ItemHeight + 2);
  end;
end;

procedure TDefineListBox.SetCaption(const Value: TCaption);
begin
 if FCaption <> Value then
 begin
    FCaption := Value;
    Invalidate;
 end;
end;

procedure TDefineListBox.WMEnabledChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TDefineListBox.Clear;
begin
  RemoveList(FChecks);
  RemoveList(FRects);
  FItems.Clear;
end;

procedure TDefineListBox.CMParentFontChanged(var Message: TMessage);
begin
  inherited;
  if ParentFont and Assigned(FStyle) then
  begin
     if FStyle.ParentFont then
        FStyle.TitleFont.Assign(Font);
  end;
end;

procedure TDefineListBox.CMFontChanged(var Message: TMessage);
begin
  inherited;
  if Assigned(FStyle) then
  begin
     if FStyle.ParentFont then
        FStyle.TitleFont.Assign(Font);
  end;
end;

function TDefineListBox.GetItemCount: Integer;
begin
  result := Items.Count;
end;

procedure TDefineListBox.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if not(csDesigning in ComponentState) and
        (GetActiveWindow <> 0) and (not FMouseIn) then
  begin
    FMouseIn := True;
    Invalidate;
  end;  
end;

procedure TDefineListBox.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  FMouseIn := false;
  Invalidate;
end;

{ TDefineListChecks }

constructor TDefineListChecks.Create(AOwner: TComponent);
begin
  if ScrollTimer = nil then begin
     ScrollTimer := TTimer.Create(nil);
     ScrollTimer.Enabled  := False;
     ScrollTimer.Interval := FTimerInterval;
  end;
  inherited Create(AOwner);
  ControlStyle    := ControlStyle + [csOpaque];
  SetBounds(0, 0, 140, 158);
  ParentColor     := True;
  ParentFont      := True;
  Enabled         := true;
  TabStop         := True;
  Visible         := true;
  FStyle          := TCheckStyle.Create;
  FStyle.Parent   := self;
  FStyle.OnChange := StyleChange;
  FItems          := TStringList.Create;
  FItems.OnChange := StyleChange;
  FRects          := TList.Create;
  FChecks         := TList.Create;
  FSorted         := false;
  FSelected       := -1;
  FirstItem       := 0;
  FCaption        := '';
end;

destructor TDefineListChecks.Destroy;
begin
  ScrollTimer.Free;
  ScrollTimer := nil;
  //释放 FRect
  RemoveList(FRects, lsFree);
  //释放 FChecks
  RemoveList(FChecks, lsFree);
  FItems.Free;
  FStyle.Free;
  inherited Destroy;
end;

procedure TDefineListChecks.WMMouseWheel(var Message: TMessage);
var
  fScrollLines: Integer;
begin
  if not(csDesigning in ComponentState) then
  begin
    SystemParametersInfo(SPI_GETWHEELSCROLLLINES, 0, @fScrollLines, 0);

    if(fScrollLines = 0) then
      fScrollLines := MaxItems;

    if ShortInt(Message.WParamHi) = -WHEEL_DELTA then
      if FirstItem + MaxItems + fScrollLines <= FItems.Count then
        Inc(FirstItem, fScrollLines)
      else
        if FItems.Count - MaxItems < 0 then
          FirstItem := 0
        else
          FirstItem := FItems.Count - MaxItems
    else
      if ShortInt(Message.WParamHi) = WHEEL_DELTA then
        if FirstItem - fScrollLines < 0 then
          FirstItem := 0
        else
          dec(FirstItem, fScrollLines);
    Invalidate;
  end;
end;

procedure TDefineListChecks.SetSorted(Value: Boolean);
begin
  if Value <> FSorted then
  begin
    FSorted       := Value;
    FItems.Sorted := Value;
    Invalidate;
  end;
end;

procedure TDefineListChecks.SetItems(Value: TStringList);
begin
  FItems.Assign(Value);
end;

procedure TDefineListChecks.SetItemsRect;
var
  CurPos: TPoint;
  CurRect:TRect;
begin
  CurRect := ClientRect;
  with FStyle do begin
  if TitleHas then begin
    case TitlePosition of
      tsTop   : CurRect.Top    := CurRect.Top + TitleHeight;
      tsBottom: CurRect.Bottom := CurRect.Bottom - TitleHeight;
    end;
  end;
  // set left/top PosR for the the first item
  if ScrollBars then
     CurPos := Point(CurRect.left + 3, CurRect.top + 3 + BarsHeight)
  else
     CurPos := Point(CurRect.left + 3, CurRect.top + 3);
  // Recreate all Item - Rects
  CreateRects(FRects,MaxItems,ItemHeight,CurPos,CurRect);
  end;
  Invalidate;
end;

function TDefineListChecks.GetChecked(Index: Integer): Boolean;
begin
  Result := FindChecked(index, FSelected);
end;

procedure TDefineListChecks.SetChecked(Index: Integer; Value: Boolean);
var inx:integer;
begin
  if FindChecked(Index,inx) and Value then
     DeleteChecked(inx)
  else begin
     AddCheck(index);
  end;
  Invalidate;
end;

function TDefineListChecks.GetSelCount: Integer;
begin
  result := FChecks.Count;
end;

procedure TDefineListChecks.DrawCheckRect(Canvas: TCanvas; StartRect: TRect; checked: Boolean);
var
  CheckBox: TRect;
begin
  DrawCheckBox(StartRect,FStyle.SelectPosition,FStyle.SelectSize,CheckBox);
  with Canvas do begin
   Pen.style := psSolid;
   Pen.width := 1;
   // 画背景
   Brush.color := FStyle.BackdropColor;

   FillRect(Checkbox);
   // 画选定
   if Checked then
   begin
    DrawInCheck(Canvas, CheckBox, FStyle.BorderColor);
   end;
   // 画边框
   Brush.color := FStyle.BorderColor;
   FrameRect(Checkbox);
  end;
end;

procedure TDefineListChecks.Paint;
var
  memBitmap: TBitmap;
  inxRect, inxItem: Integer;
  itemRect: ^TRect;
  Format, TitleFormat: UINT;
  WorkRect, TitleRect:TRect;
  BarsRect: TBarsRect;
  curIndex: integer;
  curState: boolean;
 procedure DrawImage(Canvas:TCanvas;Skin:TCheckStyle;WorkRect,TitleRect:TRect;TitleHas:Boolean);
 begin
  with Skin do begin
   //draw backgroud
   if not BackUseBitmap then
   begin
      if (Enabled)and(Focused or FMouseIn) then
         BoxDrawBackDrop(Canvas,BackStartColor,BackStopColor,BackdropOrien,WorkRect,BackdropColor,UserFace)
      else
         BoxDrawBackDrop(Canvas,BackStartColor,BackStopColor,BackdropOrien,WorkRect,BackFocusColor,UserFace);
   end
   else
      DrawBitmap(Canvas,WorkRect,BackBitmap);
   //draw title backgroud
   if TitleHas then
   begin
     if not TitleUseBitmap then
        BoxDrawBackDrop(Canvas,TitleStartColor,TitleStopColor,TitleOrien,TitleRect,TitleColor,UserFace)
     else
        DrawBitmap(Canvas,TitleRect,TitleBitmap);
   end;
  end;
 end;
begin
  // create memory-bitmap to draw flicker-free
  memBitmap := TBitmap.Create;
  try
   memBitmap.Height := ClientRect.Bottom;
   memBitmap.Width  := ClientRect.Right;
   //控制区域
   WorkRect   := ClientRect;
   TitleRect  := ClientRect;
   with FStyle do begin
    if TitleHas then begin
      case TitlePosition of
          tsTop : begin
           WorkRect.Top     := WorkRect.Top  + TitleHeight;
           TitleRect.Bottom := TitleRect.Top + TitleHeight;
         end;
       tsBottom : begin
           WorkRect.Bottom  := WorkRect.Bottom  - TitleHeight;
           TitleRect.Top    := TitleRect.Bottom - TitleHeight;
         end;
      end;
    end;
    with BarsRect do begin
    if ScrollBars then begin
      prevRect := Rect(WorkRect.Left, WorkRect.Top, WorkRect.Right, WorkRect.Top + BarsHeight);
      downRect := Rect(WorkRect.Left, WorkRect.Bottom - BarsHeight, WorkRect.Right, WorkRect.Bottom);
      workRect := Rect(workRect.Left, workRect.Top + BarsHeight, workRect.Right, workRect.Bottom - BarsHeight);
    end;
    end;
    //设置样式
    GetStyleText(TitleAlignment, TitleFormat);
    GetCheckBoxPosition(SelectPosition, Format);
    // Clear Background
    case Transparent of
          tmAlways: DrawParentImage(Self, memBitmap.Canvas);
            tmNone: DrawImage(memBitmap.Canvas,FStyle,WorkRect,TitleRect,TitleHas);
      tmNotFocused: if Focused then
                       DrawImage(memBitmap.Canvas,FStyle,WorkRect,TitleRect,TitleHas)
                    else
                       DrawParentImage(Self, memBitmap.Canvas);
    end;
    // Draw ScrollBars
    if ScrollBars then begin
       DrawScrollBar(self, Focused, memBitmap.Canvas, BarsRect, FStyle, FirstItem, MaxItems, FItems.Count, Enabled);
    end;
    // Draw Border
    memBitmap.Canvas.Brush.Color := BorderColor;
    memBitmap.Canvas.FrameRect(ClientRect);
    // Draw Focused Frame
    if(fItems.Count <=0)and(Focused) then
       DrawFocusRect(memBitmap.Canvas,WorkRect,ItemHeight);
    // draw titletext
    if TitleHas then begin
       MemBitmap.Canvas.Font.Assign(FStyle.TitleFont);
       FlatDrawText(memBitmap.Canvas, Enabled, FCaption, TitleRect, TitleFormat);
    end;
   end;
   // Initialize the counter for the Items
   memBitmap.Canvas.Font.Assign(Self.Font);
   inxItem := FirstItem;
   // Draw Items
   for inxRect := 0 to MaxItems - 1 do
    begin
      itemRect := FRects.Items[inxRect];
      if(inxItem <= FItems.Count - 1) then
      begin
        CurState := FindChecked(inxItem, CurIndex);
        // Item is selected
        with FStyle do begin
          // Draw ItemBorder
          if ItemLineHas then begin
             memBitmap.Canvas.Brush.color := ItemLineColor;
             memBitmap.Canvas.FrameRect(itemRect^);
          end;
          if inxItem = FSelected then begin
             // Fill ItemRect
             BoxDrawBackDrop(memBitmap.Canvas,ItemStartColor,ItemStopColor,ItemOrien,itemRect^, ItemSelectColor,UserFace);
             // draw focused rect
             if Focused then DrawFocusRect(memBitmap.Canvas,itemRect^,ItemHeight);
             // Draw selected ItemBorder
             memBitmap.Canvas.Brush.color := ItemFrameColor;
             memBitmap.Canvas.FrameRect(itemRect^);
          end else if CurState then begin
             BoxDrawBackDrop(memBitmap.Canvas,SelectStartColor, SelectStopColor,SelectOrien, itemRect^, SelectCheckColor,UserFace);
          end;
        // Draw select box
        DrawCheckRect(memBitmap.Canvas, itemRect^, CurState);
        // Draw ItemText
        case SelectPosition of
          bpLeft : begin
             itemRect^.Left  := itemRect^.Left + SelectSize + 3;//16;
             FlatDrawText(memBitmap.Canvas, Enabled, FItems[inxItem], itemRect^, Format);
             itemRect^.Left  := itemRect^.Left - SelectSize - 3;//16;
           end;
         bpRight : begin
             itemRect^.Right := itemRect^.Right - SelectSize - 1;// 14;
             FlatDrawText(memBitmap.Canvas, Enabled, FItems[inxItem], itemRect^, Format);
             itemRect^.Right := itemRect^.Right + SelectSize + 1;//14;
           end;
        end;
        end;
        //end draw itemtext
        Inc(inxItem);
      end;
     end;
    // Copy bitmap to screen
    Canvas.CopyRect(ClientRect, memBitmap.Canvas, ClientRect);
  finally
    // delete the memory bitmap
    memBitmap.free;
  end;
end;

function TDefineListChecks.FindChecked(Value:Integer; var index:integer):boolean;
var inx:integer;
    tmp:^Integer;
begin
  inx    := 0;
  result := false;
  while (inx < FChecks.Count)and(not result) do
  begin
    tmp := FChecks.Items[inx];
    result := Tmp^ = Value;
    if result then index := inx else index := -1;
    inc(inx);
  end;
end;

procedure TDefineListChecks.AddCheck(Index:integer);
var inx:^Integer;
    x:integer;
begin
  if not FindChecked(index,x) then begin
     new(inx);
     inx^:=Index;
     FChecks.Add(inx);
  end;
end;

procedure TDefineListChecks.DeleteChecked(Index:Integer);
begin
  dispose(FChecks.Items[index]);
  FChecks.Delete(index);
end;

procedure TDefineListChecks.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  curPos: TPoint;
  inxRect,index: Integer;
  curRect: ^TRect;
  checkRect: TRect;
  BarsRect: TBarsRect;
begin
  GetCursorPos(curPos);
  curPos := ScreenToClient(curPos);
  with FStyle do begin
  if(FItems.Count > 0) and(Button = mbLeft) then
  begin
    for inxRect := 0 to FRects.Count - 1 do
    begin
      curRect := FRects.Items[inxRect];
      //获取点击区域
      DrawCheckBox(curRect^, SelectPosition, SelectSize, checkRect);
      //选中状态
      if PtInRect(checkRect, curPos) then
      begin
        if FindChecked(FirstItem + inxRect, index) then
           DeleteChecked(index)
        else
           AddCheck(FirstItem + inxRect);
        SetFocus;
        if Assigned(FOnClickCheck) then
           FOnClickCheck(Self);
        Invalidate;
        Exit;
      end else if PtInRect(curRect^, curPos) then begin
        FSelected := FirstItem + inxRect;
        SetFocus;
        Invalidate;
        Exit;
      end;
    end;
  end;

  if ScrollBars then
  begin
    GetBarPosition(ClientRect,TitleHas,TitlePosition,BarsRect,TitleHeight,BarsHeight);
    if PtInRect(BarsRect.prevRect, curPos) then
    begin
      if(FirstItem - 1) < 0 then
         FirstItem := 0
      else
         Dec(FirstItem);
      SetFocus;
      Invalidate;
      scrollType := stUp;
      if ScrollTimer.Enabled then
        ScrollTimer.Enabled := False;
      ScrollTimer.OnTimer := ScrollTimerHandler;
      ScrollTimer.Enabled := True;
    end;
    if PtInRect(BarsRect.downRect, curPos) then
    begin
      if FirstItem + MaxItems + 1 <= FItems.Count then
        Inc(FirstItem);
      SetFocus;
      Invalidate;
      scrollType := stDown;
      if ScrollTimer.Enabled then
        ScrollTimer.Enabled := False;
      ScrollTimer.OnTimer := ScrollTimerHandler;
      ScrollTimer.Enabled := True;
    end;
  end;
  end;
  Inherited;
end;

procedure TDefineListChecks.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ScrollTimer.Enabled := False;
  ScrollTimer.Interval := FTimerInterval;
  inherited MouseUp(Button, Shift, X, Y);
end;

procedure TDefineListChecks.ScrollTimerHandler(Sender: TObject);
begin
  ScrollTimer.Interval := FScrollSpeed;
  if scrollType = stUp then
    if(FirstItem - 1) < 0 then
    begin
      FirstItem := 0;
      ScrollTimer.Enabled := False;
    end
    else
      Dec(FirstItem)
  else
    if FirstItem + MaxItems + 1 <= FItems.Count then
      Inc(FirstItem)
    else
      ScrollTimer.Enabled := False;
  Invalidate;
end;

procedure TDefineListChecks.Loaded;
begin
  inherited;
  SetItemsRect;
end;

procedure TDefineListChecks.WMSize(var Message: TWMSize);
var y,inx:integer;
begin
  inherited;
  with FStyle do begin
  //reset clientrect size
  y := 2;
  for inx := 1 to MaxItems do
      y := y +(ItemHeight + 2);
  y := y + 2;
  if ScrollBars then
     y := y + BarsHeight * 2;
  if TitleHas then
     y := y + TitleHeight;
  if not(csLoading in ComponentState) then
     SetBounds(Left,Top,Width,y);
  end;
  // Recalculate the itemRects
  SetItemsRect;
end;

procedure TDefineListChecks.WMMove(var Message: TWMMove);
begin
  inherited;
  if not(FStyle.Transparent = tmNone) then
     Invalidate;
end;

procedure TDefineListChecks.Clear;
begin
  RemoveList(FChecks);
  RemoveList(FRects);
  FItems.Clear;
  FSelected := -1;
  Invalidate;
end;

procedure TDefineListChecks.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  FCurSelected := FSelected;
  FSelected    := -1;
  FMouseIn     := False;
  Invalidate;
end;

procedure TDefineListChecks.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  FSelected := FCurSelected;
  Invalidate;
end;

procedure TDefineListChecks.SelectNotifyEvent;
begin
  if assigned(FOnChange) and IndexInCount(FSelected,FItems.Count) then FOnChange(self,FItems.Strings[FSelected]);
  if assigned(FOnClick) and IndexInCount(FSelected,FItems.Count) then FOnClick(self,FItems.Strings[FSelected]);
end;

procedure TDefineListChecks.WMKeyDown(var Message: TWMKeyDown);
var index:Integer;
begin
  case Message.CharCode of
    VK_UP: begin
       if (FirstItem - 1) < 0 then
           FirstItem := 0
       else
           Dec(FirstItem);
       if FItems.Count > 0 then begin
        if FSelected > 0 then
           Dec(FSelected)
        else
           FSelected := 0;
        SelectNotifyEvent;
       end;
      end;
    VK_DOWN:begin
      if FirstItem + MaxItems + 1 <= FItems.Count then
         Inc(FirstItem);
      if FItems.Count > 0 then begin
       if FSelected  < FItems.Count - 1 then
          Inc(FSelected)
       else
          FSelected := FItems.Count - 1;
       SelectNotifyEvent;
      end;
      end;
    VK_PRIOR:
      if (FirstItem - MaxItems) < 0 then
          FirstItem := 0
      else
          Dec(FirstItem, MaxItems);
    VK_NEXT:
      if FirstItem +(MaxItems * 2) <= FItems.Count then
         Inc(FirstItem, MaxItems)
      else
         FirstItem := FItems.Count - MaxItems;
    VK_SPACE: begin
      if FindChecked(FSelected, Index) then
         DeleteChecked(Index)
      else
         AddCheck(FSelected);
      SelectNotifyEvent;
      end;
  else
    inherited;
  end;
  Invalidate;
end;

function TDefineListChecks.GetItemIndex: Integer;
begin
  Result := FSelected;
end;

procedure TDefineListChecks.SetItemIndex(Value: Integer);
begin
  if GetItemIndex <> Value then
  begin
    FSelected := Value;
    Invalidate;
  end;
end;

procedure TDefineListChecks.SetName(const Value: TComponentName);
begin
  if(csDesigning in ComponentState) and((Length(FCaption) = 0) or
    (CompareText(FCaption, Name) = 0)) then
    FCaption   := Value;
  inherited SetName(Value);
end;

function TDefineListChecks.GetItemText: TCaption;
begin
  if IndexInCount(FSelected,FItems.Count) then
     result := FItems.Strings[FSelected]
  else
     result := '';
end;

function TDefineListChecks.Find(Value: String;  var Index: Integer): boolean;
begin
  result := false;
  index  := -1;
  while(index < Items.Count) and(not result) do begin
     inc(Index);
     if IndexInCount(Index,Items.Count) then
        result := UpperCase(Items.Strings[index])=UpperCase(Value);
  end;
end;

procedure TDefineListChecks.Click;
begin
  inherited Click;
  if not Focused then SetFocus;
  if assigned(FOnClick) and IndexInCount(FSelected,FItems.Count) then begin
     FOnClick(self,FItems.Strings[FSelected]);
  end;
end;

procedure TDefineListChecks.CheckAll;
var inx:Integer;
begin
  if FItems.Count > 0 then begin
     RemoveList(FChecks);
     for inx := 0 to FItems.Count - 1 do
         AddCheck(inx);
  end;
  SelectNotifyEvent;
end;

procedure TDefineListChecks.CheckCancel;
begin
  RemoveList(FChecks);
  SelectNotifyEvent;
end;

procedure TDefineListChecks.SetCheckStyle(const Value: TCheckStyle);
begin
  FStyle.Assign(Value);
end;

procedure TDefineListChecks.StyleChange(Sender: TObject);
begin
  SetItemsRect;
  Invalidate;
end;

function TDefineListChecks.GetMaxItems: Integer;
begin
  result:=ClientRect.Bottom - ClientRect.Top;
  with FStyle do begin
  if TitleHas then
     result := result - TitleHeight;
  if ScrollBars then
     result := result - BarsHeight * 2;
  result :=(result - 4) div(ItemHeight + 2);
  end;
end;

procedure TDefineListChecks.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key,Shift);
  if(ssCtrl in Shift)and Focused then begin
    case key of
     vk_selall   :CheckAll;
     vk_selcancel:CheckCancel;
    end;
  end;
end;

procedure TDefineListChecks.SetCaption(const Value: TCaption);
begin
  if FCaption <> Value then begin
     FCaption := Value;
     Invalidate;
  end;
end;

procedure TDefineListChecks.WMEnabledChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TDefineListChecks.Delete(Index:Integer);
var inx:integer;
begin
  if IndexInCount(index,FItems.Count) then
  begin
     if FindChecked(index,inx) then
        DeleteChecked(inx);
     FItems.Delete(index);
  end;
end;

procedure TDefineListChecks.CMFontChanged(var Message: TMessage);
begin
  inherited;
  if Assigned(FStyle) then
  begin
     if FStyle.ParentFont then
        FStyle.TitleFont.Assign(Font);
  end;
end;

procedure TDefineListChecks.CMParentFontChanged(var Message: TMessage);
begin
  inherited;
  if ParentFont and Assigned(FStyle) then
  begin
     if FStyle.ParentFont then
        FStyle.TitleFont.Assign(Font);
  end;
end;

function TDefineListChecks.GetItemCount: Integer;
begin
  result := Items.Count;
end;

{ TDefineGroupButton }

type
  TDefineGroupButton = class(TFlatRadioButton)
  private
    FInClick: Boolean;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
  public
    constructor InternalCreate(RadioGroup: TDefineRadioGroup);
    destructor Destroy; override;
  end;

constructor TDefineGroupButton.InternalCreate(RadioGroup: TDefineRadioGroup);
begin
  inherited Create(RadioGroup);
  RadioGroup.FButtons.Add(Self);
  Visible := False;
  Enabled := RadioGroup.Enabled;
  ParentShowHint := False;
  OnClick := RadioGroup.ButtonClick;
  Parent := RadioGroup;
end;

destructor TDefineGroupButton.Destroy;
begin
  TDefineRadioGroup(Owner).FButtons.Remove(Self);
  inherited Destroy;
end;

procedure TDefineGroupButton.CNCommand(var Message: TWMCommand);
begin
  if not FInClick then
  begin
    FInClick := True;
    try
      if ((Message.NotifyCode = BN_CLICKED) or
        (Message.NotifyCode = BN_DOUBLECLICKED)) and
        TDefineRadioGroup(Parent).CanModify then
        inherited;
    except
      Application.HandleException(Self);
    end;
    FInClick := False;
  end;
end;

procedure TDefineGroupButton.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  TDefineRadioGroup(Parent).KeyPress(Key);
  if (Key = #8) or (Key = ' ') then
  begin
    if not TDefineRadioGroup(Parent).CanModify then Key := #0;
  end;
end;

procedure TDefineGroupButton.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  TDefineRadioGroup(Parent).KeyDown(Key, Shift);
end;

procedure TDefineListChecks.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if not(csDesigning in ComponentState) and
        (GetActiveWindow <> 0) and (not FMouseIn) then
  begin
    FMouseIn := True;
    Invalidate;
  end;  
end;

procedure TDefineListChecks.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  FMouseIn := false;
  Invalidate;
end;

{ TDefineRadioGroup }

constructor TDefineRadioGroup.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csSetCaption, csDoubleClicks, csParentBackground];
  FButtons     := TList.Create;
  FItems       := TStringList.Create;
  TStringList(FItems).OnChange := ItemsChange;
  FItemIndex   := -1;
  FColumns     := 1;
end;

destructor TDefineRadioGroup.Destroy;
begin
  SetButtonCount(0);
  TStringList(FItems).OnChange := nil;
  FItems.Free;
  FButtons.Free;
  inherited Destroy;
end;

procedure TDefineRadioGroup.ArrangeButtons;
var
  ButtonsPerCol, ButtonWidth, ButtonHeight, TopMargin, I: Integer;
  DC: HDC;
  SaveFont: HFont;
  Metrics: TTextMetric;
  DeferHandle: THandle;
  ALeft: Integer;
begin
  if (FButtons.Count <> 0) and not FReading then
  begin
    DC := GetDC(0);
    SaveFont := SelectObject(DC, Font.Handle);
    GetTextMetrics(DC, Metrics);
    SelectObject(DC, SaveFont);
    ReleaseDC(0, DC); 
    ButtonsPerCol := (FButtons.Count + FColumns - 1) div FColumns;
    ButtonWidth   := (Width - 10) div FColumns;
    I := Height - Metrics.tmHeight - 5;
    ButtonHeight := I div ButtonsPerCol;
    TopMargin    := Metrics.tmHeight + 5 + (I mod ButtonsPerCol) div 2;
    DeferHandle  := BeginDeferWindowPos(FButtons.Count);
    try
      for I := 0 to FButtons.Count - 1 do
        with TDefineGroupButton(FButtons[I]) do
        begin
          BiDiMode := Self.BiDiMode;
          ALeft := (I div ButtonsPerCol) * ButtonWidth + 8;
          if UseRightToLeftAlignment then
             ALeft := Self.ClientWidth - ALeft - Width;
          DeferHandle := DeferWindowPos(DeferHandle, Handle, 0,
            ALeft,
            (I mod ButtonsPerCol) * ButtonHeight + TopMargin,
            Width, Height,
            SWP_NOZORDER or SWP_NOACTIVATE);
          Visible := True;
        end;
    finally
      EndDeferWindowPos(DeferHandle);
    end;
  end;
end;

procedure TDefineRadioGroup.ButtonClick(Sender: TObject);
begin
  if not FUpdating then
  begin
    FItemIndex := FButtons.IndexOf(Sender);
    Changed;
    Click;
  end;
end;

procedure TDefineRadioGroup.ItemsChange(Sender: TObject);
begin
  if not FReading then
  begin
    if FItemIndex >= FItems.Count then FItemIndex := FItems.Count - 1;
    UpdateButtons;
  end;
end;

procedure TDefineRadioGroup.Loaded;
begin
  inherited Loaded;
  ArrangeButtons;
end;

procedure TDefineRadioGroup.ReadState(Reader: TReader);
begin
  FReading := True;
  inherited ReadState(Reader);
  FReading := False;
  UpdateButtons;
end;

procedure TDefineRadioGroup.SetButtonCount(Value: Integer);
begin
  while FButtons.Count < Value do TDefineGroupButton.InternalCreate(Self);
  while FButtons.Count > Value do TDefineGroupButton(FButtons.Last).Free;
end;

procedure TDefineRadioGroup.SetColumns(Value: Integer);
begin
  if Value < 1 then Value := 1;
  if Value > 16 then Value := 16;
  if FColumns <> Value then
  begin
    FColumns := Value;
    ArrangeButtons;
    Invalidate;
  end;
end;

procedure TDefineRadioGroup.SetItemIndex(Value: Integer);
begin
  if FReading then FItemIndex := Value else
  begin
    if Value < -1 then Value := -1;
    if Value >= FButtons.Count then Value := FButtons.Count - 1;
    if FItemIndex <> Value then
    begin
      if FItemIndex >= 0 then
         TDefineGroupButton(FButtons[FItemIndex]).Checked := False;
      FItemIndex := Value;
      if FItemIndex >= 0 then
         TDefineGroupButton(FButtons[FItemIndex]).Checked := True;
    end;
  end;
end;

procedure TDefineRadioGroup.SetItems(Value: TStrings);
begin
  FItems.Assign(Value);
end;

procedure TDefineRadioGroup.UpdateButtons;
var
  I: Integer;
begin
  SetButtonCount(FItems.Count);
  for I := 0 to FButtons.Count - 1 do
    TDefineGroupButton(FButtons[I]).Caption := FItems[I];
  if FItemIndex >= 0 then
  begin
    FUpdating := True;
    TDefineGroupButton(FButtons[FItemIndex]).Checked := True;
    FUpdating := False;
  end;
  ArrangeButtons;
  Invalidate;
end;

procedure TDefineRadioGroup.CMEnabledChanged(var Message: TMessage);
var
  I: Integer;
begin
  inherited;
  for I := 0 to FButtons.Count - 1 do
    TDefineGroupButton(FButtons[I]).Enabled := Enabled;
end;

procedure TDefineRadioGroup.CMFontChanged(var Message: TMessage);
begin
  inherited;
  ArrangeButtons;
end;

procedure TDefineRadioGroup.WMSize(var Message: TWMSize);
begin
  inherited;
  ArrangeButtons;
end;

function TDefineRadioGroup.CanModify: Boolean;
begin
  Result := True;
end;

function TDefineRadioGroup.GetButtons(Index: Integer): TFlatRadioButton;
begin
  Result := TFlatRadioButton(FButtons[Index]);
end;

procedure TDefineRadioGroup.SetStyleFace(const Value: TStyleFace);
begin
  inherited;
  FTransparent := (FStyleFace <> fsCustom) and (not ParentColor);
end;

{ TDefineRadioButton }

constructor TDefineRadioButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle  := [csSetCaption, csDoubleClicks];
  ParentColor   := False;
  ParentFont    := True;
  Enabled       := True;
  Visible       := True;
  Color         := DefaultFlatColor;
  FFocusedColor := DefaultBackdropColor;
  FDownColor    := DefaultBarColor;
  FCheckedColor   := DefaultCheckColor;
  FBorderColor  := DefaultBorderColor;
  FLayout       := lpLeft;
  FChecked      := false;
  FGroupIndex   := 0;
  FTransparent  := True;
  SetBounds(0, 0, 121, 15);
end;

procedure TDefineRadioButton.SetColors(Index: Integer; Value: TColor);
begin
  case Index of
    0: FFocusedColor := Value;
    1: FDownColor    := Value;
    2: FCheckedColor   := Value;
    3: FBorderColor  := Value;
  end;
  Invalidate;
end;

procedure TDefineRadioButton.SetLayout(Value: TLayoutPosition);
begin
  FLayout := Value;
  Invalidate;
end;

procedure TDefineRadioButton.SetChecked(Value: Boolean);
var
  I: Integer;
  Sibling: TDefineRadioButton;
begin
  if FChecked <> Value then
  begin
    TabStop  := Value;
    FChecked := Value;
    if Value then
    begin
      if Parent <> nil then
        for i := 0 to Parent.ControlCount-1 do
          if Parent.Controls[i] is TDefineRadioButton then
          begin
            Sibling := TDefineRadioButton(Parent.Controls[i]);
            if (Sibling <> Self) and (Sibling.GroupIndex = GroupIndex) then
            with TDefineRadioButton(Sibling) do
            begin
              if Assigned(Action) and (Action is TCustomAction) and
                 TCustomAction(Action).AutoCheck then
                 TCustomAction(Action).Checked := False;
              SetChecked(False);
            end;
          end;
      Click;
      if csDesigning in ComponentState then
        if (GetParentForm(self) <> nil) and (GetParentForm(self).Designer <> nil) then
            GetParentForm(self).Designer.Modified;
    end;
    invalidate;
  end;
end;

procedure TDefineRadioButton.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  if not Enabled then
  begin
    FMouseIn    := False;
    FMouseDown := False;
  end;
  Invalidate;
end;

procedure TDefineRadioButton.CMTextChanged(var Message: TWmNoParams);
begin
  inherited;
  Invalidate;
end;

procedure TDefineRadioButton.CMDialogChar(var Message: TCMDialogChar);
begin
  with Message do
    if IsAccel(Message.CharCode, Caption) and CanFocus then
    begin
      SetFocus;
      Result := 1;
    end
    else
      inherited;
end;

procedure TDefineRadioButton.CNCommand(var Message: TWMCommand);
begin
  if Message.NotifyCode = BN_CLICKED then Click;
end;

procedure TDefineRadioButton.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  if Enabled then
  begin
    FFocused := True;
    FMouseIn := True;
    if not FChecked then
       SetChecked(True);
  end;
  invalidate;
end;

procedure TDefineRadioButton.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  if Enabled then
  begin
    FMouseIn := False;
    FFocused := False;
  end;
  invalidate;
end;
        
procedure TDefineRadioButton.CMSysColorChange(var Message: TMessage);
begin
  inherited;
  if (Parent <> nil)and(ParentColor) then
      Color := TDefineRadioButton(Parent).Color;
  Invalidate;
end;

procedure TDefineRadioButton.CMParentColorChanged(var Message: TWMNoParams);
begin
  inherited;
  FTransParent := not ParentColor;
  if (Parent <> nil)and(ParentColor) then
  begin
      Color := TDefineRadioButton(Parent).Color;
  end;
  Invalidate;
end;

procedure TDefineRadioButton.DoEnter;
begin
  inherited DoEnter;
  if FMouseDown and FMouseIn then
     FChecked := True;
  FFocused := True;
  invalidate;
end;

procedure TDefineRadioButton.DoExit;
begin
  inherited DoExit;
  FFocused := False;
  FMouseIn := False;
  invalidate;
end;

procedure TDefineRadioButton.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if(Button = mbLeft) and Enabled then
  begin
    SetFocus;
    FMouseDown := true;
    invalidate;
  end;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TDefineRadioButton.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if(Button = mbLeft) and Enabled then
  begin
    FMouseDown := false;
    if (X>=0) and (X<=Width) and (Y>=0) and (Y<=Height) and not Checked then
        Checked := True;
    invalidate;
  end;
  inherited MouseUp(Button, Shift, X, Y);
end;

procedure TDefineRadioButton.Paint;
var
  TextBounds, RadioRect: TRect;
  Format: UINT;
  TextAs:Integer;
begin
  with Canvas do
  begin
    Lock;
    Font.Assign(self.Font);
    Width  := TextWidth(Caption)+20;
    Height := TextHeight(Caption)+2;
    if FTransparent then
       DrawParentImage(Self, Canvas)
    else
    begin
       Brush.Color := self.Color;
       FillRect(ClientRect);
    end;
    //draw Background + Border
    with ClientRect do
    begin
    case FLayout of
      lpLeft:RadioRect := Rect(Left + 1,   Top + 1, Left + 14, Top + 14);
     lpRight:RadioRect := Rect(Right - 14, Top + 1, Right - 1, Top + 14);
     end;
    end;
    Pen.style   := psSolid;
    Brush.Style := bsClear;
    Pen.width := 1;
    if (Focused or FMouseIn)and(not(csDesigning in ComponentState)) then
    begin
     if (not FMouseDown) then
     begin
        Brush.color := FFocusedColor;
        Pen.color   := FBorderColor;
     end else begin
        Brush.color := FDownColor;
        Pen.color   := FBorderColor;
     end;
    end else begin
      Brush.color := self.Color;
      Pen.color   := FBorderColor;
    end;
    DrawEllipse(Handle, RadioRect);
    if Checked then
    begin
     if Enabled then
     begin
        Brush.color := FCheckedColor;
        Pen.color   := FCheckedColor;
     end else begin
        Brush.color := clBtnShadow;
        Pen.color   := clBtnShadow;
     end;
     with RadioRect do
     begin
      RadioRect := Rect(Left + 4, Top + 4, Left + 9, Top + 9);
     end;
     DrawEllipse(Handle, RadioRect);
    end;
    //draw text
    Format := DT_WORDBREAK;
    Brush.Style := bsClear;
    with ClientRect do
    begin
     TextAs:=(RectHeight(ClientRect) - TextHeight('H')) div 2;
     case FLayout of
      lpLeft: begin
       TextBounds := Rect(Left + 16, Top + TextAs, Right - 1, Bottom - TextAs);
       Format     := Format or DT_LEFT;
      end;
      lpRight: begin
       TextBounds := Rect(Left + 1, Top + TextAs, Right - 16, Bottom - TextAs);
       Format     := Format or DT_RIGHT;
      end;
     end;
    end;
    if not Enabled then
    begin
      OffsetRect(TextBounds, 1, 1);
      Font.Color := clBtnHighlight;
      DrawText(Handle, PChar(Caption), Length(Caption), TextBounds, Format);
      OffsetRect(TextBounds, -1, -1);
      Font.Color := clBtnShadow;
      DrawText(Handle, PChar(Caption), Length(Caption), TextBounds, Format);
    end
    else
      DrawText(Handle, PChar(Caption), Length(Caption), TextBounds, Format);
    UnLock;
  end;
end;

procedure TDefineRadioButton.WMSize(var Message: TWMSize);
begin
  inherited;
  Invalidate;
end;

procedure TDefineRadioButton.WMMove(var Message: TWMMove);
begin
  inherited;
  Invalidate;
end;

procedure TDefineRadioButton.SetTransparent(const Value: Boolean);
begin
  if FTransparent <> Value then
  begin
     FTransparent := Value;
     ParentColor  := not Value;
     Invalidate;
  end;
end;

procedure TDefineRadioButton.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if not(csDesigning in ComponentState) and
        (GetActiveWindow <> 0) and (not FMouseIn) then
  begin
    FMouseIn := True;
    Invalidate;
  end;
end;

procedure TDefineRadioButton.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  FMouseIn := False;
  invalidate;
end;

procedure TDefineRadioButton.CMFontChanged(var Message: TMessage);
begin
 inherited;     
 invalidate;
end;

{ TDefineListBoxExt }

constructor TDefineListBoxExt.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle  := ControlStyle - [csOpaque];
  ParentFont    := True;
  AutoSize      := False;
  Ctl3D         := False;
  BorderStyle   := bsNone;
  FFocusColor   := clWhite;
  FBorderColor  := DefaultBorderColor;
  FFlatColor    := DefaultFlatColor;
  FParentColor  := True;
  FMouseIn      := False;
end;

procedure TDefineListBoxExt.RedrawBorder(const Clip: HRGN);
var
  Attrib:TBorderAttrib;
begin
  with Attrib do
  begin
   Ctrl        := self;
   BorderColor := ColorBorder;
   if Enabled then
   begin
      FocusColor  := ColorFocused;
      FlatColor   := ColorFlat;
   end
   else
   begin
      FocusColor  := clBtnFace;
      FlatColor   := clBtnFace;
   end;
   MouseState     := FMouseIn;
   FocusState     := Focused;
   DesignState    := ComponentState;
   HasBars        := false;
  end;
  Color := DrawEditBorder(Attrib,Clip);
end;

procedure TDefineListBoxExt.SetParentColor(Value: Boolean);
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

procedure TDefineListBoxExt.CMSysColorChange(var Message: TMessage);
begin
    if (Parent <> nil)and(FParentColor) then
       FFlatColor := TForm(Parent).Color;
    RedrawBorder;
end;

procedure TDefineListBoxExt.CMParentColorChanged(var Message: TWMNoParams);
begin
    if (Parent <> nil)and(FParentColor) then
       FFlatColor := TForm(Parent).Color;
    RedrawBorder;
end;

procedure TDefineListBoxExt.SetColors(Index: Integer; Value: TColor);
begin
  case Index of
    0: FFocusColor    := Value;
    1: FBorderColor   := Value;
    2: begin
         FFlatColor   := Value;
         FParentColor := False;
       end;
  end;
  RedrawBorder;
end;

procedure TDefineListBoxExt.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if (GetActiveWindow <> 0) then
  begin
    FMouseIn := True;
    RedrawBorder;
  end;           
end;

procedure TDefineListBoxExt.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  FMouseIn := False;
  RedrawBorder;
end;

procedure TDefineListBoxExt.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  RedrawBorder;
end;

procedure TDefineListBoxExt.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited; 
  if not(csDesigning in ComponentState) then
     RedrawBorder;
end;

procedure TDefineListBoxExt.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  if not(csDesigning in ComponentState) then
     RedrawBorder;
end;

procedure TDefineListBoxExt.WMNCCalcSize(var Message: TWMNCCalcSize);
begin
  inherited;
  InflateRect(Message.CalcSize_Params^.rgrc[0], -3, -3);
end;

procedure TDefineListBoxExt.WMNCPaint(var Message: TMessage);
begin
  inherited;    
  RedrawBorder(HRGN(Message.WParam));
end;

{ TFlatCheckWrapper }
type
  TFlatCheckWrapper = class
  private
    FData: LongInt;
    FState: TCheckBoxState;
    FDisabled: Boolean;
    FHeader: Boolean;
    procedure SetChecked(Check: Boolean);
    function GetChecked: Boolean;
  public
    class function GetDefaultState: TCheckBoxState;
    property Checked: Boolean read GetChecked write SetChecked;
    property State: TCheckBoxState read FState write FState;
    property Disabled: Boolean read FDisabled write FDisabled;
    property Header: Boolean read FHeader write FHeader;
  end;

var
  FCheckWidth, FCheckHeight: Integer;

procedure GetCheckSize;
begin
  with TBitmap.Create do
    try
      Handle := LoadBitmap(0, PChar(OBM_CHECKBOXES));
      FCheckWidth  := Width div 4;
      FCheckHeight := Height div 3;
    finally
      Free;
    end;
end;

function MakeSaveState(State: TCheckBoxState; Disabled: Boolean): TObject;
begin
  Result := TObject((Byte(State) shl 16) or Byte(Disabled));
end;

function GetSaveState(AObject: TObject): TCheckBoxState;
begin
  Result := TCheckBoxState(Integer(AObject) shr 16);
end;

function GetSaveDisabled(AObject: TObject): Boolean;
begin
  Result := Boolean(Integer(AObject) and $FF);
end;

{ TFlatCheckWrapper }

procedure TFlatCheckWrapper.SetChecked(Check: Boolean);
begin
  if Check then FState := cbChecked else FState := cbUnchecked;
end;

function TFlatCheckWrapper.GetChecked: Boolean;
begin
  Result := FState = cbChecked;
end;

class function TFlatCheckWrapper.GetDefaultState: TCheckBoxState;
begin
  Result := cbUnchecked;
end;

{ TFlatCheckListExt }

constructor TFlatCheckListExt.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFlat        := True;
  FHeaderColor := clInfoText;
  FHeaderBkColor := clInfoBk;
end;

destructor TFlatCheckListExt.Destroy;
begin
  FSaveStates.Free;
  inherited;
end;

procedure TFlatCheckListExt.CreateWnd;
var
  I: Integer;
  Wrapper: TFlatCheckWrapper;
  SaveState: TObject;
begin
  inherited CreateWnd;
  if FSaveStates <> nil then
  begin
    for I := 0 to FSaveStates.Count - 1 do
    begin
      Wrapper := TFlatCheckWrapper(GetWrapper(I));
      SaveState := FSaveStates[I];
      Wrapper.FState := GetSaveState(SaveState);
      Wrapper.FDisabled := GetSaveDisabled(SaveState);
    end;
    FreeAndNil(FSaveStates);
  end;
  ResetItemHeight;
end;

procedure TFlatCheckListExt.DestroyWnd;
var
  I: Integer;
begin
  if Items.Count > 0 then
  begin
    FSaveStates := TList.Create;
    for I := 0 to Items.Count - 1 do
      FSaveStates.Add(MakeSaveState(State[I], not ItemEnabled[I]));
  end;
  inherited DestroyWnd;
end;

procedure TFlatCheckListExt.CreateParams(var Params: TCreateParams);
begin
  inherited;
  with Params do
    if Style and (LBS_OWNERDRAWFIXED or LBS_OWNERDRAWVARIABLE) = 0 then
      Style := Style or LBS_OWNERDRAWFIXED;
end;
    
function TFlatCheckListExt.GetCheckWidth: Integer;
begin
  Result := FCheckWidth + 2;
end;

procedure TFlatCheckListExt.CMFontChanged(var Message: TMessage);
begin
  inherited;
  ResetItemHeight;
end;

procedure TFlatCheckListExt.ResetItemHeight;
begin
  if HandleAllocated and (Style = lbStandard) then
  begin
    Canvas.Font := Font;
    FStandardItemHeight := Canvas.TextHeight('Wg');
    Perform(LB_SETITEMHEIGHT, 0, FStandardItemHeight);
  end;
end;

procedure TFlatCheckListExt.DrawItem(Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
var
  R: TRect;
  SaveEvent: TDrawItemEvent;
  ACheckWidth: Integer;
  Enable: Boolean;
begin
  ACheckWidth := GetCheckWidth;
  if Index < Items.Count then
  begin
    R := Rect;
    Enable := Self.Enabled and GetItemEnabled(Index);
    if not Header[Index] then
    begin
      if not UseRightToLeftAlignment then
      begin
        R.Right := Rect.Left;
        R.Left := R.Right - ACheckWidth;
      end
      else
      begin
        R.Left := Rect.Right;
        R.Right := R.Left + ACheckWidth;
      end;
      DrawCheck(R, GetState(Index), Enable);
    end
    else
    begin
      Canvas.Font.Color  := FHeaderColor;
      Canvas.Brush.Color := FHeaderBkColor;
    end;
    if not Enable then
      Canvas.Font.Color := clGrayText;
  end;

  if (Style = lbStandard) and Assigned(OnDrawItem) then
  begin
    { Force lbStandard list to ignore OnDrawItem event. }
    SaveEvent := OnDrawItem;
    OnDrawItem := nil;
    try
      inherited;
    finally
      OnDrawItem := SaveEvent;
    end;
  end
  else
    inherited;
end;

procedure TFlatCheckListExt.CNDrawItem(var Message: TWMDrawItem);
begin
  if Items.Count = 0 then exit;
  with Message.DrawItemStruct^ do
    if not Header[itemID] then
      if not UseRightToLeftAlignment then
        rcItem.Left := rcItem.Left + GetCheckWidth
      else
        rcItem.Right := rcItem.Right - GetCheckWidth;
  inherited;
end;

procedure TFlatCheckListExt.DrawCheck(R: TRect; AState: TCheckBoxState; AEnabled: Boolean);
var
  DrawState: Integer;
  DrawRect: TRect;
  OldBrushColor: TColor;
  OldBrushStyle: TBrushStyle;
  OldPenColor: TColor;
  Rgn, SaveRgn: HRgn;
  ElementDetails: TThemedElementDetails;
begin
  SaveRgn := 0;
  DrawRect.Left   := R.Left + (R.Right - R.Left - FCheckWidth) div 2;
  DrawRect.Top    := R.Top + (R.Bottom - R.Top - FCheckHeight) div 2;
  DrawRect.Right  := DrawRect.Left + FCheckWidth;
  DrawRect.Bottom := DrawRect.Top + FCheckHeight;
  with Canvas do
  begin
    if Flat then
    begin
      { Remember current clipping region }
      SaveRgn := CreateRectRgn(0,0,0,0);
      GetClipRgn(Handle, SaveRgn);
      { Clip 3d-style checkbox to prevent flicker }
      with DrawRect do
        Rgn := CreateRectRgn(Left + 2, Top + 2, Right - 2, Bottom - 2);
      SelectClipRgn(Handle, Rgn);
      DeleteObject(Rgn);
    end;

   if ThemeServices.ThemesEnabled then
   begin
      case AState of
        cbChecked:
          if AEnabled then
            ElementDetails := ThemeServices.GetElementDetails(tbCheckBoxCheckedNormal)
          else
            ElementDetails := ThemeServices.GetElementDetails(tbCheckBoxCheckedDisabled);
        cbUnchecked:
          if AEnabled then
            ElementDetails := ThemeServices.GetElementDetails(tbCheckBoxUncheckedNormal)
          else
            ElementDetails := ThemeServices.GetElementDetails(tbCheckBoxUncheckedDisabled)
        else // cbGrayed
          if AEnabled then
            ElementDetails := ThemeServices.GetElementDetails(tbCheckBoxMixedNormal)
          else
            ElementDetails := ThemeServices.GetElementDetails(tbCheckBoxMixedDisabled);
      end;
      ThemeServices.DrawElement(Handle, ElementDetails, R);
    end
    else
    begin
      case AState of
        cbChecked:
          DrawState := DFCS_BUTTONCHECK or DFCS_CHECKED;
        cbUnchecked:
          DrawState := DFCS_BUTTONCHECK;
        else // cbGrayed
          DrawState := DFCS_BUTTON3STATE or DFCS_CHECKED;
      end;
      if not AEnabled then
        DrawState := DrawState or DFCS_INACTIVE;
      DrawFrameControl(Handle, DrawRect, DFC_BUTTON, DrawState);
    end;

    if Flat then
    begin
      SelectClipRgn(Handle, SaveRgn);
      DeleteObject(SaveRgn);
      { Draw flat rectangle in-place of clipped 3d checkbox above }
      OldBrushStyle := Brush.Style;
      OldBrushColor := Brush.Color;
      OldPenColor := Pen.Color;
      Brush.Style := bsClear;
      Pen.Color := clBtnShadow;
      SetBkMode(Canvas.Handle,TRANSPARENT);
      with DrawRect do
        Rectangle(Left + 1, Top + 1, Right - 1, Bottom - 1);
      Brush.Style := OldBrushStyle;
      Brush.Color := OldBrushColor;
      Pen.Color := OldPenColor;
    end;
  end;
end;

procedure TFlatCheckListExt.SetChecked(Index: Integer; AChecked: Boolean);
begin
  if AChecked <> GetChecked(Index) then
  begin
    TFlatCheckWrapper(GetWrapper(Index)).SetChecked(AChecked);
    InvalidateCheck(Index);
  end;
end;

procedure TFlatCheckListExt.SetItemEnabled(Index: Integer; const Value: Boolean);
begin
  if Value <> GetItemEnabled(Index) then
  begin
    TFlatCheckWrapper(GetWrapper(Index)).Disabled := not Value;
    InvalidateCheck(Index);
  end;
end;

procedure TFlatCheckListExt.SetState(Index: Integer; AState: TCheckBoxState);
begin
  if AState <> GetState(Index) then
  begin
    TFlatCheckWrapper(GetWrapper(Index)).State := AState;
    InvalidateCheck(Index);
  end;
end;

procedure TFlatCheckListExt.InvalidateCheck(Index: Integer);
var
  R: TRect;
begin
  if not Header[Index] then
  begin
    R := ItemRect(Index);
    if not UseRightToLeftAlignment then
      R.Right := R.Left + GetCheckWidth
    else
      R.Left := R.Right - GetCheckWidth;
    InvalidateRect(Handle, @R, not (csOpaque in ControlStyle));
    UpdateWindow(Handle);
  end;
end;
    
function TFlatCheckListExt.GetChecked(Index: Integer): Boolean;
begin
  if HaveWrapper(Index) then
    Result := TFlatCheckWrapper(GetWrapper(Index)).GetChecked
  else
    Result := False;
end;

function TFlatCheckListExt.GetItemEnabled(Index: Integer): Boolean;
begin
  if HaveWrapper(Index) then
    Result := not TFlatCheckWrapper(GetWrapper(Index)).Disabled
  else
    Result := True;
end;

function TFlatCheckListExt.GetState(Index: Integer): TCheckBoxState;
begin
  if HaveWrapper(Index) then
    Result := TFlatCheckWrapper(GetWrapper(Index)).State
  else
    Result := TFlatCheckWrapper.GetDefaultState;
end;

procedure TFlatCheckListExt.KeyPress(var Key: Char);
begin
  if (Key = ' ') then
    ToggleClickCheck(ItemIndex);
  inherited KeyPress(Key);
end;

procedure TFlatCheckListExt.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  Index: Integer;
begin
  inherited;
  if Button = mbLeft then
  begin
    Index := ItemAtPos(Point(X,Y),True);
    if (Index <> -1) and GetItemEnabled(Index) then
      if not UseRightToLeftAlignment then
      begin
        if X - ItemRect(Index).Left < GetCheckWidth then
          ToggleClickCheck(Index)
      end
      else
      begin
        Dec(X, ItemRect(Index).Right - GetCheckWidth);
        if (X > 0) and (X < GetCheckWidth) then
          ToggleClickCheck(Index)
      end;
  end;
end;

procedure TFlatCheckListExt.ToggleClickCheck;
var
  State: TCheckBoxState;
begin
  if (Index >= 0) and (Index < Items.Count) and GetItemEnabled(Index) then
  begin
    State := Self.State[Index];
    case State of
      cbUnchecked:
        if AllowGrayed then State := cbGrayed else State := cbChecked;
      cbChecked: State := cbUnchecked;
      cbGrayed: State := cbChecked;
    end;
    Self.State[Index] := State;
    ClickCheck;
  end;
end;

procedure TFlatCheckListExt.ClickCheck;
begin
  if Assigned(FOnClickCheck) then FOnClickCheck(Self);
end;

function TFlatCheckListExt.GetItemData(Index: Integer): LongInt;
begin
  Result := 0;
  if HaveWrapper(Index) then
    Result := TFlatCheckWrapper(GetWrapper(Index)).FData;
end;

function TFlatCheckListExt.GetWrapper(Index: Integer): TObject;
begin
  Result := ExtractWrapper(Index);
  if Result = nil then
     Result := CreateWrapper(Index);
end;

function TFlatCheckListExt.ExtractWrapper(Index: Integer): TObject;
begin
  Result := TFlatCheckWrapper(inherited GetItemData(Index));
  if LB_ERR = Integer(Result) then
    raise EListError.CreateFmt(SListIndexError,[index]);
  if (Result <> nil) and (not (Result is TFlatCheckWrapper)) then
    Result := nil;
end;

function TFlatCheckListExt.InternalGetItemData(Index: Integer): LongInt;
begin
  Result := inherited GetItemData(Index);
end;

procedure TFlatCheckListExt.InternalSetItemData(Index: Integer; AData: LongInt);
begin
  inherited SetItemData(Index, AData);
end;

function TFlatCheckListExt.CreateWrapper(Index: Integer): TObject;
begin
  Result := TFlatCheckWrapper.Create;
  inherited SetItemData(Index, LongInt(Result));
end;

function TFlatCheckListExt.HaveWrapper(Index: Integer): Boolean;
begin
  Result := ExtractWrapper(Index) <> nil;
end;

procedure TFlatCheckListExt.SetItemData(Index: Integer; AData: LongInt);
var
  Wrapper: TFlatCheckWrapper;
begin
  if HaveWrapper(Index) or (AData <> 0) then
  begin
    Wrapper := TFlatCheckWrapper(GetWrapper(Index));
    Wrapper.FData := AData;
  end;
end;

procedure TFlatCheckListExt.ResetContent;
var
  I: Integer;
begin
  for I := 0 to Items.Count - 1 do
    if HaveWrapper(I) then
      GetWrapper(I).Free;
  inherited;
end;

procedure TFlatCheckListExt.DeleteString(Index: Integer);
begin
  if HaveWrapper(Index) then
    GetWrapper(Index).Free;
  inherited;
end;

procedure TFlatCheckListExt.SetFlat(Value: Boolean);
begin
  if Value <> FFlat then
  begin
    FFlat := Value;
    Invalidate;
  end;
end;

procedure TFlatCheckListExt.WMDestroy(var Msg: TWMDestroy);
var
  i: Integer;
begin
  for i := 0 to Items.Count -1 do
    ExtractWrapper(i).Free;
  inherited;
end;

function TFlatCheckListExt.GetHeader(Index: Integer): Boolean;
begin
  if HaveWrapper(Index) then
    Result := TFlatCheckWrapper(GetWrapper(Index)).Header
  else
    Result := False;
end;

procedure TFlatCheckListExt.SetHeader(Index: Integer; const Value: Boolean);
begin
  if Value <> GetHeader(Index) then
  begin
    TFlatCheckWrapper(GetWrapper(Index)).Header := Value;
    InvalidateCheck(Index);
  end;
end;

procedure TFlatCheckListExt.SetHeaderBkColor(const Value: TColor);
begin
  if Value <> FHeaderBkColor then
  begin
    FHeaderBkColor := Value;
    Invalidate;
  end;
end;

procedure TFlatCheckListExt.SetHeaderColor(const Value: TColor);
begin
  if Value <> HeaderColor then
  begin
    FHeaderColor := Value;
    Invalidate;
  end;
end;

procedure TFlatCheckListExt.CheckAll;
var inx:integer;
begin
 for inx := 0 to Items.Count - 1 do
     Checked[inx] := true;
end;

procedure TFlatCheckListExt.CheckCancel;
var inx:integer;
begin
 for inx := 0 to Items.Count - 1 do
     Checked[inx] := False;
end;

initialization
  GetCheckSize;

end.

