unit FlatCtrls;

interface

{$I FlatStyle.inc}

uses
  Windows, Messages, Classes, Controls, Forms, Graphics, SysUtils,
  StdCtrls, Dialogs, ExtCtrls, FlatUtils, FlatSkins, FlatBtns,
  MaskUtils, FlatWatet;

type
  { TFlatTicket }
  TFlatTicket = class(TCustomLabel)
  private
    function  GetTop: Integer;
    function  GetLeft: Integer;
    function  GetWidth: Integer;
    function  GetHeight: Integer;
    procedure SetHeight(const Value: Integer);
    procedure SetWidth(const Value: Integer);
  protected
    procedure AdjustBounds; override;
    property AutoSize default True;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Caption;
    property Font;
    property Height: Integer read GetHeight write SetHeight;
    property ParentFont;
    property Left: Integer read GetLeft;
    property Top: Integer read GetTop;
    property Width: Integer read GetWidth write SetWidth;
  end;
  
  { TDefineEdit }
  TDefineEdit = class(TVersionEdit)
  private
    FParentColor: Boolean;
    FFocusColor: TColor;
    FBorderColor: TColor;
    FFlatColor: TColor;
    FAlignment: TAlignment;
    FTicketSpace: Integer;
    FTicket: TFlatTicket;
    FTicketPosition: TTicketPosition;
    procedure SetColors(Index: Integer; Value: TColor);
    procedure SetParentColor (Value: Boolean);
  protected
    FMouseIn: Boolean;
    fLabel: TLabel;
    procedure RedrawBorder(const Clip: HRGN);
    procedure NewAdjustHeight;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMParentColorChanged(var Message: TWMNoParams); message CM_PARENTCOLORCHANGED;
    procedure SetAlignment(const Value: TAlignment);

    procedure LabelMouseEnter(Sender: TObject);
    procedure SetTicketPosition(const Value: TTicketPosition);
    procedure SetTicketSpace(const Value: Integer);
    procedure SetName(const Value: TComponentName); override;
    procedure CMVisiblechanged(var Message: TMessage); message CM_VISIBLECHANGED;
    procedure CMBidimodechanged(var Message: TMessage); message CM_BIDIMODECHANGED;
    procedure SetParent(AParent: TWinControl); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    procedure KeyPress(var Key: Char); override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Loaded; override;
    procedure SetupInternalLabel;
    property Ticket: TFlatTicket read FTicket;
    property TicketPosition: TTicketPosition read FTicketPosition write SetTicketPosition default poLeft;
    property TicketSpace: Integer read FTicketSpace write SetTicketSpace default 3;

    property ColorFocused: TColor index 0 read FFocusColor write SetColors default clWhite;
    property ColorBorder: TColor index 1 read FBorderColor write SetColors default DefaultBorderColor;
    property ColorFlat: TColor index 2 read FFlatColor write SetColors default DefaultFlatColor;
    property ParentColor: Boolean read FParentColor write SetParentColor default false;
    property Alignment: TAlignment read FAlignment write SetAlignment default taLeftJustify;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;  
    procedure SetBounds(ALeft: Integer; ATop: Integer; AWidth: Integer; AHeight: Integer); override;
  end;

  { TFlatEdit }
  TFlatEdit = class(TDefineEdit)
  published
    property Alignment;
    property ColorFocused;
    property ColorBorder;
    property ColorFlat;
    property ParentColor;
    property CharCase;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property MaxLength;
    property OEMConvert;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Text;
    property Visible;
    property ImeMode;
    property ImeName;

    property Ticket;
    property TicketPosition;
    property TicketSpace;

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
  end;

  { TFlatInteger }
  TFlatInteger = class(TDefineEdit)
  private
    FMinValue: LongInt;
    FMaxValue: LongInt;
    FIncrement: LongInt;
    FButton: TDefineSpin;
    FEditorEnabled: Boolean;
    function GetMinHeight: Integer;
    function GetValue: LongInt;
    function CheckValue (NewValue: LongInt): LongInt;
    procedure SetValue (NewValue: LongInt);
  protected
    function  IsValidChar (Key: Char): Boolean; virtual;
    procedure UpClick (Sender: TObject); virtual;
    procedure DownClick (Sender: TObject); virtual;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Loaded; override;
    procedure CreateWnd; override;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;    
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure CMEnter(var Message: TCMGotFocus); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure WMPaste(var Message: TWMPaste); message WM_PASTE;
    procedure WMCut(var Message: TWMCut); message WM_CUT;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Button: TDefineSpin read FButton;
  published
    property Increment: LongInt read FIncrement write FIncrement default 1;
    property MaxValue: LongInt read FMaxValue write FMaxValue default 0;
    property MinValue: LongInt read FMinValue write FMinValue default 0;
    property Value: LongInt read GetValue write SetValue default 0;
    property EditorEnabled: Boolean read FEditorEnabled write FEditorEnabled default True;
    property Alignment;
    property ColorFocused;
    property ColorBorder;
    property ColorFlat;
    property AutoSelect;
    property AutoSize;
    property DragCursor;
    property DragMode;
    property Enabled;
    property ImeMode;
    property ImeName;
    property Font;
    property Ticket;
    property TicketPosition;
    property TicketSpace;
    property ParentColor;
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
  end;
  { TFlatFloat }
  TFlatFloat = class(TDefineEdit)
  private
    FPrecision, FDigits: Integer;
    FFloatFormat: TFloatFormat;
    FMinValue: Extended;
    FMaxValue: Extended;
    FIncrement: Extended;
    FButton: TDefineSpin;
    FEditorEnabled: Boolean;
    function GetMinHeight: Integer;
    function GetValue: Extended;
    function CheckValue (Value: Extended): Extended;
    procedure SetValue (Value: Extended);
    procedure SetPrecision (Value: Integer);
    procedure SetDigits (Value: Integer);
    procedure SetFloatFormat (Value: TFloatFormat);
  protected
    function IsValidChar (Key: Char): Boolean; virtual;
    procedure UpClick (Sender: TObject); virtual;
    procedure DownClick (Sender: TObject); virtual;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Loaded; override;
    procedure CreateWnd; override;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure CMEnter(var Message: TCMGotFocus); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure WMPaste(var Message: TWMPaste); message WM_PASTE;
    procedure WMCut(var Message: TWMCut); message WM_CUT;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Button: TDefineSpin read FButton;
  published
    property Digits: Integer read FDigits write SetDigits;
    property Precision: Integer read FPrecision write SetPrecision;
    property FloatFormat: TFloatFormat read FFloatFormat write SetFloatFormat;
    property EditorEnabled: Boolean read FEditorEnabled write FEditorEnabled default True;
    property Increment: Extended read FIncrement write FIncrement;
    property MaxValue: Extended read FMaxValue write FMaxValue;
    property MinValue: Extended read FMinValue write FMinValue;
    property Value: Extended read GetValue write SetValue;
    property Alignment;
    property ColorFocused;
    property ColorBorder;
    property ColorFlat;
    property AutoSelect;
    property AutoSize;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property Ticket;
    property TicketPosition;
    property TicketSpace;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property ImeMode;
    property ImeName;
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
  end;
  { TDefineMemo }
  TDefineMemo = class(TVersionMemo)
  private
    FParentColor: Boolean;
    FFocusColor: TColor;
    FBorderColor: TColor;
    FFlatColor: TColor;
    FMouseIn: Boolean;
    procedure SetColors(Index: Integer; Value: TColor);
    procedure SetParentColor(Value: Boolean);
  protected
    procedure RedrawBorder (const Clip: HRGN);
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMParentColorChanged(var Message: TWMNoParams); message CM_PARENTCOLORCHANGED;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property ColorFocused: TColor index 0 read FFocusColor write SetColors default clWhite;
    property ColorBorder: TColor index 1 read FBorderColor write SetColors default DefaultBorderColor;
    property ColorFlat: TColor index 2 read FFlatColor write SetColors default DefaultFlatColor;
    property ParentColor: Boolean read FParentColor write SetParentColor default false;
    property Align;
    property Alignment;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property MaxLength;
    property OEMConvert;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property ScrollBars;
    property TabOrder;
    property TabStop;
    property Visible;
    property Lines;
    property WantReturns;
    property WantTabs;
    property WordWrap;

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
  end;

  { TFlatMemo }
  TFlatMemo = class(TDefineMemo)
  published
    property ColorFocused;
    property ColorBorder;
    property ColorFlat;
    property ParentColor;
    property Version;
    property Align;
    property Alignment;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property MaxLength;
    property OEMConvert;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property ScrollBars;
    property TabOrder;
    property TabStop;
    property Visible;
    property Lines;
    property WantReturns;
    property WantTabs;
    property WordWrap;
    property ImeMode;
    property ImeName;

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
  end;
  {TDefineMask}
  DefineError = class(Exception);
  
  TDefineState = set of (msMasked, msReEnter, msDBSetText);
  
  TDefineMask = class(TDefineEdit)
  private
    FEditMask: TEditMask;
    FMaskBlank: Char;
    FMaxChars: Integer;
    FMaskSave: Boolean;
    FMaskState: TDefineState;
    FCaretPos: Integer;
    FBtnDownX: Integer;
    FOldValue: string;
    FSettingCursor: Boolean;
    FOnValidate: TValidateEvent;
    function DoInputChar(var NewChar: Char; MaskOffset: Integer): Boolean;
    function InputChar(var NewChar: Char; Offset: Integer): Boolean;
    function DeleteSelection(var Value: string; Offset: Integer; Len: Integer): Boolean;
    function InputString(var Value: string; const NewValue: string; Offset: Integer): Integer;
    function AddEditFormat(const Value: string; Active: Boolean): string;
    function RemoveEditFormat(const Value: string): string;
    function FindLiteralChar (MaskOffset: Integer; InChar: Char): Integer;
    function GetEditText: string;
    function GetMasked: Boolean;
    function GetText: TMaskedText;
    function GetMaxLength: Integer;
    function CharKeys(var CharCode: Char): Boolean;
    procedure SetEditText(const Value: string);
    procedure SetEditMask(const Value: TEditMask);
    procedure SetMaxLength(Value: Integer);
    procedure SetText(const Value: TMaskedText);
    procedure DeleteKeys(CharCode: Word);
    procedure HomeEndKeys(CharCode: Word; Shift: TShiftState);
    procedure CursorInc(CursorPos: Integer; Incr: Integer);
    procedure CursorDec(CursorPos: Integer);
    procedure ArrowKeys(CharCode: Word; Shift: TShiftState);
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMCut(var Message: TMessage); message WM_CUT;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit);   message CM_EXIT;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMWantSpecialKey(var Message: TCMWantSpecialKey); message CM_WANTSPECIALKEY;
  protected
    procedure ReformatText(const NewMask: string);
    procedure GetSel(var SelStart: Integer; var SelStop: Integer);
    procedure SetSel(SelStart: Integer; SelStop: Integer);
    procedure SetCursor(Pos: Integer);
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    function EditCanModify: Boolean; virtual;
    procedure Reset; virtual;
    function GetFirstEditChar: Integer;
    function GetLastEditChar: Integer;
    function GetNextEditChar(Offset: Integer): Integer;
    function GetPriorEditChar(Offset: Integer): Integer;
    function GetMaxChars: Integer;
    function Validate(const Value: string; var Pos: Integer): Boolean; virtual;
    procedure ValidateError; virtual;
    procedure CheckCursor;
    property MaskState: TDefineState read FMaskState write FMaskState;
    property MaxLength: Integer read GetMaxLength write SetMaxLength default 0;
    property OnValidate : TValidateEvent read FOnValidate write FOnValidate;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ValidateEdit; virtual;
    procedure Clear; override;
    function GetTextLen: Integer;
    property IsMasked: Boolean read GetMasked;
    property EditText: string read GetEditText write SetEditText;
    property Text: TMaskedText read GetText write SetText;
    property EditMask: TEditMask read FEditMask write SetEditMask;
  end;

  { TFlatIPEdit }
  TFlatIPEdit = class(TDefineMask)
  protected
    { Protected declarations }
    IPText:TIP;
    fIPAddress : String;
    function  GetInx: integer;
    function  GetIPText: String;
    procedure SetIPText(const Value: String);
    function  Replace(Start, Len: Integer):integer;
    procedure KeyPress(var Key: Char); override;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMExit(var Message: TCMExit);  message CM_EXIT;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
  public
    property Index:integer read GetInx;
    constructor Create(AOwner: TComponent); override;
  published
    property IPAddress: String read GetIPText write SetIPText;
    property Text;
    property Ticket;
    property TicketPosition;
    property TicketSpace;
    property ColorFocused;
    property ColorBorder;
    property ColorFlat;
    property ParentColor;
    property Alignment;
    property AutoSelect;
    property CharCase;
    property Color;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property OEMConvert;
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
    property OnValidate;
  end;

  { TFlatMaskEdit }
  TFlatMaskEdit = class(TDefineMask)
  published
    property Ticket;
    property TicketPosition;
    property TicketSpace;

    property ColorFocused;
    property ColorBorder;
    property ColorFlat;
    property ParentColor;
    property Alignment;
    property CharCase;
    property Color;
    property DragCursor;
    property DragMode;
    property Enabled;
    property EditMask;
    property Font;
    property HideSelection;
    property MaxLength;
    property OEMConvert;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property PopupMenu;
    property ImeMode;
    property ImeName;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Text;
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
    property OnValidate;
  end;
  
  { TDefineComboBox }
  TDefineComboBox = class(TVersionComboBox)
  private
    FArrowColor: TColor;
    FArrowBackgroundColor: TColor;
    FBorderColor: TColor;
    FButtonWidth: Integer;
    FChildHandle: HWND;
    FDefListProc: Pointer;
    FListHandle: HWND;
    FListInstance: Pointer;
    FSysBtnWidth: Integer;
    FSolidBorder: Boolean;
    FTicketSpace: Integer;
    FTicket: TFlatTicket;
    FMouseInControl: Boolean;
    FTicketPosition: TTicketPosition;
    FFocusedColor: TColor;
    FFlatColor: TColor;
    fParentColor: Boolean;
    FReadOnly: boolean;
    procedure SetColors(Index: Integer; Value: TColor);
    function GetButtonRect: TRect;
    procedure PaintButton;
    procedure PaintBorder;
    procedure RedrawBorders;
    procedure InvalidateSelection;
    function  GetSolidBorder: Boolean;
    procedure SetSolidBorder;
    procedure SetParentColor(const Value: Boolean);
  protected
    procedure ListWndProc(var Message: TMessage);
    procedure KeyPress(var Key: Char); override;
    procedure WMSetFocus(var Message: TMessage); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TMessage); message WM_KILLFOCUS;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMKeyDown(var Message: TMessage); message WM_KEYDOWN;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
    procedure CMEnabledChanged(var Msg: TMessage); message CM_ENABLEDCHANGED;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMParentColorChanged(var Message: TWMNoParams); message CM_PARENTCOLORCHANGED;
    procedure WndProc(var Message: TMessage); override;
    procedure ComboWndProc(var Message: TMessage; ComboWnd: HWnd; ComboProc: Pointer); override;
    procedure SetTicketPosition(const Value: TTicketPosition);
    procedure SetTicketSpace(const Value: Integer);
    procedure SetName(const Value: TComponentName); override;
    procedure CMVisiblechanged(var Message: TMessage); message CM_VISIBLECHANGED;
    procedure CMBidimodechanged(var Message: TMessage); message CM_BIDIMODECHANGED;
    procedure SetParent(AParent: TWinControl); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetupInternalLabel;
    property SolidBorder: Boolean read FSolidBorder;
    property Ticket: TFlatTicket read FTicket;
    property TicketPosition: TTicketPosition read FTicketPosition write SetTicketPosition default poLeft;
    property TicketSpace: Integer read FTicketSpace write SetTicketSpace;
    property ParentColor: Boolean read fParentColor write SetParentColor default true;
    property ColorArrow: TColor index 0 read FArrowColor write SetColors default clBlack;
    property ColorArrowBackground: TColor index 1 read FArrowBackgroundColor write SetColors default $00C5D6D9;
    property ColorBorder: TColor index 2 read FBorderColor write SetColors default DefaultBorderColor;
    property ColorFlat: TColor index 3 read FFlatColor write SetColors default DefaultFlatColor;
    property ColorFocued: TColor index 4 read FFocusedColor write SetColors default clWhite;
    property ReadOnly: boolean read FReadOnly write FReadOnly default false;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetBounds(ALeft: Integer; ATop: Integer; AWidth: Integer; AHeight: Integer); override;
  end;
  { TFlatComboBox }
  TFlatComboBox = class(TDefineComboBox)
  published
    property Ticket;
    property TicketPosition;
    property TicketSpace;
    property Style;
    property ParentColor;
    property ColorArrow;
    property ColorArrowBackground;
    property ColorBorder;
    property ColorFlat;
    property ColorFocued;
    property DragMode;
    property DragCursor;
    property DropDownCount;
    property Enabled;
    property ReadOnly;
    property Font;
    property ItemHeight;
    property Items;
    property MaxLength;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Sorted;
    property TabOrder;
    property TabStop;
    property ImeMode;
    property ImeName;
    property Text;
    property Visible;
    property ItemIndex;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawItem;
    property OnDropDown;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMeasureItem;
    property OnStartDrag;
    property Anchors;
    property BiDiMode;
    property Constraints;
    property DragKind;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
  end;

  { TDefineColorBox }
  TDefineColorBox = class(TVersionComboBox)
  private
    FArrowColor: TColor;
    FArrowBackgroundColor: TColor;
    FBorderColor: TColor;
    FHighlightColor: TColor;
    FButtonWidth: Integer;
    FChildHandle: HWND;
    FDefListProc: Pointer;
    FListHandle: HWND;
    FListInstance: Pointer;
    FSysBtnWidth: Integer;
    FSolidBorder: Boolean;
    FShowNames: Boolean;
    FValue: TColor;
    FColorBoxWidth: Integer;
    FColorDlg: TColorDialog;
    FTicketSpace: Integer;
    FTicket: TFlatTicket;
    FTicketPosition: TTicketPosition;
    fLanguage: TLanguage;
    procedure SetColors(Index: Integer; Value: TColor);
    function  GetButtonRect: TRect;
    procedure PaintButton;
    procedure PaintBorder;
    procedure RedrawBorders;
    procedure InvalidateSelection;
    function  GetSolidBorder: Boolean;
    procedure SetSolidBorder;
    procedure SetShowNames(Value: Boolean);
    procedure SetColorValue(Value: TColor);
    procedure SetColorBoxWidth(Value: Integer);
    procedure SetTicketPosition(const Value: TTicketPosition);
    procedure SetTicketSpace(const Value: Integer);
    procedure SetLanguage(const Value: TLanguage);
  protected
    procedure DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState); override;
    procedure CreateWnd; override;
    procedure WndProc(var Message: TMessage); override;
    procedure ListWndProc(var Message: TMessage);
    procedure WMSetFocus(var Message: TMessage); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TMessage); message WM_KILLFOCUS;
    procedure WMKeyDown(var Message: TMessage); message WM_KEYDOWN;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
    procedure CMEnabledChanged(var Msg: TMessage); message CM_ENABLEDCHANGED;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure ComboWndProc(var Message: TMessage; ComboWnd: HWnd; ComboProc: Pointer); override;
    property  SolidBorder: Boolean read FSolidBorder;
    procedure Click; override;
    procedure SetName(const Value: TComponentName); override;
    procedure CMVisiblechanged(var Message: TMessage); message CM_VISIBLECHANGED;
    procedure CMBidimodechanged(var Message: TMessage); message CM_BIDIMODECHANGED;
    procedure SetParent(AParent: TWinControl); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetupInternalLabel;
    property Color default DefaultFlatColor;
    property ColorArrow: TColor index 0 read FArrowColor write SetColors default clBlack;
    property ColorArrowBackground: TColor index 1 read FArrowBackgroundColor write SetColors default $00C5D6D9;
    property ColorBorder: TColor index 2 read FBorderColor write SetColors default DefaultBorderColor;
    property ColorHighlight: TColor index 3 read FHighlightColor write SetColors default clHighlight;
    property ColorBoxWidth: Integer read FColorBoxWidth write SetColorBoxWidth default 30;
    property ShowNames: Boolean read FShowNames write SetShowNames;
    property Value: TColor read FValue write SetColorValue;
    property Language:TLanguage read fLanguage write SetLanguage default lgChinese;
    property Ticket: TFlatTicket read FTicket;
    property TicketPosition: TTicketPosition read FTicketPosition write SetTicketPosition default poLeft;
    property TicketSpace: Integer read FTicketSpace write SetTicketSpace default 3;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function AddColor(ColorName: String; Color: TColor): Boolean;
    function DeleteColorByName(ColorName: String): Boolean;
    function DeleteColorByColor(Color: TColor): Boolean;
    procedure SetBounds(ALeft: Integer; ATop: Integer; AWidth: Integer; AHeight: Integer); override;
  end;

  { TFlatColorBox }

  TFlatColorBox = class(TDefineColorBox)
  published
    property Color;
    property ColorArrow;
    property ColorArrowBackground;
    property ColorBorder;
    property ColorHighlight;
    property ColorBoxWidth;
    property ShowNames;
    property Value;
    property Language;
    property Ticket;
    property TicketPosition;
    property TicketSpace;
    property DragMode;
    property DragCursor;
    property DropDownCount;
    property Enabled;
    property Font;
    property MaxLength;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property ImeMode;
    property ImeName;
    property Sorted;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnChange;
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
    property OnMeasureItem;
    property OnStartDrag;
  end;

  { TDefineSplitter }
  TDefineHack = class(TWinControl);
  
  TDefineSplitter = class(TVersionGraphic)
  private
    FBorderColor: TColor;
    FFocusedColor: TColor;
    FLineDC: HDC;
    FDownPos: TPoint;
    FSplit: Integer;
    FMinSize: NaturalNumber;
    FMaxSize: Integer;
    FControl: TControl;
    FNewSize: Integer;
    FActiveControl: TWinControl;
    FOldKeyDown: TKeyEvent;
    FLineVisible: Boolean;
    FOnMoved: TNotifyEvent;
    FStatus: TSplitterStatus;
    procedure AllocateLineDC;
    procedure DrawLine;
    procedure ReleaseLineDC;
    procedure UpdateSize(X, Y: Integer);
    procedure FocusKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SetColors (Index: Integer; Value: TColor);
    procedure CMSysColorChange (var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMParentColorChanged (var Message: TWMNoParams); message CM_PARENTCOLORCHANGED;
    procedure CMEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMExit(var Message: TMessage); message CM_MOUSELEAVE;
  protected
    procedure Paint; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure StopSizing;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Color default $00E0E9EF;
    property ColorFocused: TColor index 0 read FFocusedColor write SetColors default $0053D2FF;
    property ColorBorder: TColor index 1 read FBorderColor write SetColors default $00555E66;
    property MinSize: NaturalNumber read FMinSize write FMinSize default 30;
    property OnMoved: TNotifyEvent read FOnMoved write FOnMoved;
    property Align default alLeft;
    property Enabled;
    property ParentColor;
    property ParentShowHint;
    property ShowHint;
    property Visible;
  end;
  { TFlatSplitter }
  TFlatSplitter = class(TDefineSplitter)
  published
    property Color;
    property ColorFocused;
    property ColorBorder;
    property MinSize;
    property OnMoved;
    property Align;
    property Enabled;
    property ParentColor;
    property ParentShowHint;
    property ShowHint;
    property Visible;
  end;
  { TDefineAnimation }
  TDefineAnimation = class(TVersionControl)
  private
    FTransparent: Boolean;
    FAnimation: TBitmap;
    FFrames: Integer;
    FFrameWidth: Integer;
    FFrame: Integer;
    FInterval: Integer;
    FTransColor: TColor;
    FActive: Boolean;
    FLoop: Boolean;
    FReverse: Boolean;
    FTimer: TTimer;
    FBorderColor: TColor;
    FBorder: Boolean;
    FFrameChange: TOnFrameChange;
    FAnimationLayout: TAnimationLayout;
    procedure SetAnimation(Value: TBitmap);
    procedure SetFrames(Value: Integer);
    procedure SetFrameWidth(Value: Integer);
    procedure SetFrame(Value: Integer);
    procedure SetActive(Value: Boolean);
    procedure SetTransparent(Value: Boolean);
    procedure SetLoop(Value: Boolean);
    procedure SetReverse(Value: Boolean);
    procedure SetInterval(Value: Integer);
    procedure SetBorder(Value: Boolean);
    procedure DoTimer(Sender: TObject);
    procedure SetColors(Index: Integer; Value: TColor);
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMParentColorChanged(var Message: TWMNoParams); message CM_PARENTCOLORCHANGED;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure SetAnimationLayout(const Value: TAnimationLayout);
  protected
    procedure Paint; override;
    property Animation: TBitmap read FAnimation write SetAnimation;
    property Frames: Integer read FFrames write SetFrames;
    property FrameWidth: Integer read FFrameWidth write SetFrameWidth;
    property Frame: Integer read FFrame write SetFrame default 1;
    property Interval: Integer read FInterval write SetInterval;
    property ColorTransparent: TColor index 0 read FTransColor write SetColors default clFuchsia;
    property ColorBorder: TColor index 1 read FBorderColor write SetColors default DefaultBorderColor;
    property Active: Boolean read FActive write SetActive;
    property Loop: Boolean read FLoop write SetLoop;
    property Reverse: Boolean read FReverse write SetReverse;
    property Border: Boolean read FBorder write SetBorder default false;
    property AnimationLayout: TAnimationLayout read FAnimationLayout write SetAnimationLayout;
    property OnFrameChange: TOnFrameChange read FFrameChange write FFrameChange;
    property Transparent: Boolean read FTransparent write SetTransparent default false;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  { TFlatAnimation }
  TFlatAnimation = class(TDefineAnimation)
  published
    property Color;
    property Animation;
    property Frames;
    property FrameWidth;
    property Frame;
    property Interval;
    property ColorTransparent;
    property ColorBorder;
    property Active;
    property Loop;
    property Reverse;
    property Border;
    property AnimationLayout;
    property OnFrameChange;
    property Transparent;
    property Align;
    property Enabled;
    property ParentColor;
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
  end;

  { TFlatHint }
  TFlatHint = class(TVersionComponent)
  private
    FHintFont: TFont;
    FBackgroundColor: TColor;
    FBorderColor: TColor;
    FArrowBackgroundColor: TColor;
    FArrowColor: TColor;
    FHintWidth: Integer;
    FOnShowHint: TShowHintEvent;
    procedure SetColors (Index: Integer; Value: TColor);
    procedure SetHintFont (Value: TFont);
    procedure GetHintInfo (var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property ColorBackground: TColor index 0 read FBackgroundColor write SetColors default clWhite;
    property ColorBorder: TColor index 1 read FBorderColor write SetColors default clBlack;
    property ColorArrowBackground: TColor index 2 read FArrowBackgroundColor write SetColors default $0053D2FF;
    property ColorArrow: TColor index 3 read FArrowColor write SetColors default clBlack;
    property MaxWidth: Integer read FHintWidth write FHintWidth default 200;
    property Font: TFont read FHintFont write SetHintFont;
    property OnShowHint: TShowHintEvent read FOnShowHint write FOnShowHint;
  end;
  { TFlatHintWindow }
  TFlatHintWindow = class(THintWindow)
  private
    FArrowPos: TArrowPos;
    FArrowPoint: TPoint;
    FHint: TFlatHint;
    function FindFlatHint: TFlatHint;
  protected
    procedure Paint; override;
    procedure CreateParams(var Params: TCreateParams); override;
  public
    procedure ActivateHint(HintRect: TRect; const AHint: string); Override;
  end;

  TDefineImage = class(TVersionGraphic)
  private
    FBitmap: TBitmap;
    FOnProgress: TProgressEvent;
    FStretch: Boolean;
    FCenter: Boolean;
    FIncrementalDisplay: Boolean;
    FTransparent: Boolean;
    FDrawing: Boolean;
    FProportional: Boolean;    
    procedure PictureChanged(Sender: TObject);
    procedure SetCenter(Value: Boolean);
    procedure SetPicture(Value: TBitmap);
    procedure SetStretch(Value: Boolean);
    procedure SetTransparent(Value: Boolean);
    procedure SetProportional(Value: Boolean);
  protected
    function CanAutoSize(var NewWidth, NewHeight: Integer): Boolean; override;
    function DestRect: TRect;
    function DoPaletteChange: Boolean;
    function GetPalette: HPALETTE; override;
    function GetCanvas: TCanvas;
    procedure Paint; override;
    procedure Progress(Sender: TObject; Stage: TProgressStage;
              PercentDone: Byte; RedrawNow: Boolean; const R: TRect; const Msg: string); dynamic;
    property Center: Boolean read FCenter write SetCenter default False;
    property IncrementalDisplay: Boolean read FIncrementalDisplay write FIncrementalDisplay default False;
    property Proportional: Boolean read FProportional write SetProportional default false;
    property Stretch: Boolean read FStretch write SetStretch default False;
    property Transparent: Boolean read FTransparent write SetTransparent default False;
    property OnProgress: TProgressEvent read FOnProgress write FOnProgress;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Bitmap: TBitmap read FBitmap write SetPicture;
    property Canvas: TCanvas read GetCanvas;
    property OnMouseMove;
  end;

  TFlatImage = class(TDefineImage)
  published
    property Align;
    property Anchors;
    property AutoSize;
    property Center;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property IncrementalDisplay;
    property ParentShowHint;
    property Bitmap;
    property PopupMenu;
    property Proportional;
    property ShowHint;
    property Stretch;
    property Transparent;
    property Visible;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnProgress;
    property OnStartDock;
    property OnStartDrag;
  end;

  TDefineTimer = class(TVersionComponent)
  private
    FInterval: Cardinal;
    FHandle: HWND;
    FOnTimer: TNotifyEvent;
    FEnabled: Boolean;
    procedure SetEnabled(Value: Boolean);
    procedure SetInterval(Value: Cardinal);
    procedure SetOnTimer(Value: TNotifyEvent);
  protected
    procedure Timer; dynamic;
    procedure UpdateTimer;
    procedure WndProc(var Msg: TMessage);
    property  Enabled: Boolean read FEnabled write SetEnabled default True;
    property  Interval: Cardinal read FInterval write SetInterval default 50;
    property  OnTimer: TNotifyEvent read FOnTimer write SetOnTimer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TDefineWater = class(TDefineTimer)
  private
    FState: Integer;
    FParam: TOtherParam;
    FDamping: TWaterDamping;
    FBitmap: TBitmap;
    FImage: TDefineImage;
    FPlayState: boolean;
    FItems: TStringList;
    procedure SetDamping(Value: TWaterDamping);
    procedure SetItems(const Value: TStringList);
  protected
    FWater: TDefineWatet;
    procedure OnMouseMove(Sender: TObject; Shift: TShiftState; X,  Y: Integer);
    procedure Play(sender: TObject);
    procedure InitiateWater;
    property  Bitmap: TBitmap read FBitmap;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Damping: TWaterDamping read FDamping write SetDamping;
    property CtrlImage: TDefineImage read FImage write FImage;
    property Items: TStringList read FItems write SetItems;
    property Enabled;
    property Interval;
  end;

  TFlatWater = class(TDefineWater)
  published
    property Damping;
    property CtrlImage;
    property Items;
    property Enabled;
    property Interval;
  end;

implementation

uses Clipbrd, FlatConsts;

{ TFlatTicket }
constructor TFlatTicket.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Name     := 'Ticket';  { do not localize }
  SetSubComponent(True);
  if Assigned(AOwner) then
     Caption := AOwner.Name;
  AutoSize := True;
end;

procedure TFlatTicket.AdjustBounds;
begin
  inherited AdjustBounds;
  if Owner is TDefineEdit then begin
    with Owner as TDefineEdit do begin
         SetTicketPosition(TicketPosition);
    end;
  end;
  if Owner is TDefineComboBox then begin
    with Owner as TDefineComboBox do
      SetTicketPosition(TicketPosition);
  end;
  if Owner is TDefineColorBox then begin
    with Owner as TDefineColorBox do
      SetTicketPosition(TicketPosition);
  end;
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

{ TDefineEdit }

procedure TDefineEdit.SetupInternalLabel;
begin
  if not(csDesigning in ComponentState) then begin
     fLabel           := TLabel.Create(Self);
     fLabel.Parent    := self;
     fLabel.OnClick   := LabelMouseEnter;
     fLabel.AutoSize  := false;
     fLabel.Visible   := false;
     fLabel.Transparent  := True;
     fLabel.FocusControl := self;
     fLabel.Font.Assign(Font);
  end;
  if (DefaultHasTicket)and(not Assigned(FTicket)) then
  begin
   FTicket := TFlatTicket.Create(self);
   FTicket.FreeNotification(Self);
   FTicket.AutoSize     := True;
   FTicket.Transparent  := True;
   FTicket.FocusControl := Self;
  end;
end;

constructor TDefineEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle     := ControlStyle - [csFramed];
  ParentFont       := True;
  AutoSize         := False;
  Ctl3D            := False;
  BorderStyle      := bsNone;
  FFocusColor      := clWhite;
  FBorderColor     := DefaultBorderColor;
  FFlatColor       := DefaultFlatColor;
  FParentColor     := True; 
  FAlignment       := taLeftJustify;
  FTicketPosition  := poLeft;
  FTicketSpace     := 3;
  SetupInternalLabel;
end;

destructor TDefineEdit.Destroy;
begin
  if Assigned(fLabel) then
     fLabel.Free;
  if Assigned(FTicket) then
     FTicket.Free;
  inherited destroy;
end;

procedure TDefineEdit.RedrawBorder(const Clip: HRGN);
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
   HasBars     := false;
  end;
  Color := DrawEditBorder(Attrib,Clip);
  if (not(csDesigning in ComponentState))and(Assigned(fLabel)) then
  begin
      if not Focused then
         fLabel.Visible := self.Text = ''
      else
         fLabel.Visible := False;
      if fLabel.Visible then
      begin
         fLabel.Font.Assign(self.Font);
         fLabel.Width   := self.Width;
         fLabel.Top     := (self.Height-fLabel.Height) div 2;
         fLabel.Left    := 0;
         fLabel.Caption := self.Hint;
      end;
  end;
end;

procedure TDefineEdit.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do begin
    Params.Style := Params.Style or ES_MULTILINE or Aligns[FAlignment];
  end;
end;

procedure TDefineEdit.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if (Key = Char(VK_RETURN)) then
      Key := #0;
end;

procedure TDefineEdit.SetParentColor(Value: Boolean);
begin
  if Value <> FParentColor then
  begin
    FParentColor := Value;
    if FParentColor then
    begin
      if Parent <> nil then
         FFlatColor := TForm(Parent).Color;
      RedrawBorder(0);
    end;
  end;
end;     

procedure TDefineEdit.LabelMouseEnter(Sender: TObject);
begin
  if (not(csDesigning in ComponentState))and(Assigned(fLabel)) then begin
     fLabel.Visible := false;
     self.SetFocus;
  end;
end;

procedure TDefineEdit.SetTicketPosition(const Value: TTicketPosition);
begin
  if Assigned(FTicket) then
  begin
    FTicketPosition := Value;
    SetTicketPoint(Value,Self,Ticket,FTicketSpace);
  end;
end;

procedure TDefineEdit.SetTicketSpace(const Value: Integer);
begin
  if Assigned(FTicket) then
  begin
     FTicketSpace := Value;
     SetTicketPosition(FTicketPosition);
  end;
end;

procedure TDefineEdit.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited SetBounds(ALeft, ATop, AWidth, AHeight);
  SetTicketPosition(FTicketPosition);
end;

procedure TDefineEdit.SetParent(AParent: TWinControl);
begin
  if Assigned(FTicket) then
  begin
     FTicket.Parent  := AParent;
     FTicket.Visible := Visible;
  end;
  inherited SetParent(AParent); 
end;

procedure TDefineEdit.CMBidimodechanged(var Message: TMessage);
begin
  inherited;
  if Assigned(FTicket) then FTicket.BiDiMode := BiDiMode;
end;

procedure TDefineEdit.CMVisiblechanged(var Message: TMessage);
begin
  inherited;
  if Assigned(FTicket) then FTicket.Visible := Visible;
end;

procedure TDefineEdit.SetName(const Value: TComponentName);
begin
  if Assigned(FTicket) then
  begin
   if (csDesigning in ComponentState) and ((FTicket.GetTextLen = 0) or
      (CompareText(FTicket.Caption, Name) = 0)) then
       FTicket.Caption := Value;
  end;
  inherited SetName(Value);
  if (csDesigning in ComponentState)and(Assigned(FTicket))and
    ((GetTextLen = 0)or(CompareText(Text, Name) = 0)) then
      Text := '';
end;

procedure TDefineEdit.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (AComponent = FTicket) and (Operation = opRemove) then
     FTicket := nil;
end;

procedure TDefineEdit.CMSysColorChange(var Message: TMessage);
begin
  if (Parent <> nil)and(FParentColor) then
      FFlatColor := TForm(Parent).Color;
  RedrawBorder(0);
end;

procedure TDefineEdit.CMParentColorChanged(var Message: TWMNoParams);
begin
  if (Parent <> nil)and(FParentColor) then
      FFlatColor := TForm(Parent).Color;
  RedrawBorder(0);
end;

procedure TDefineEdit.SetColors(Index: Integer; Value: TColor);
begin
  case Index of
    0: FFocusColor  := Value;
    1: FBorderColor := Value;
    2: begin
        FFlatColor   := Value;
        FParentColor := False;
       end;
  end;
  RedrawBorder(0);
end;

procedure TDefineEdit.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if (GetActiveWindow <> 0) then
  begin
    FMouseIn := True;
    RedrawBorder(0);
  end;
end;

procedure TDefineEdit.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  FMouseIn := False;
  RedrawBorder(0);
end;

procedure TDefineEdit.NewAdjustHeight;
var
  DC: HDC;
  SaveFont: HFONT;
  Metrics: TTextMetric;
begin
  DC := GetDC(0);
  SaveFont := SelectObject(DC, Font.Handle);
  GetTextMetrics(DC, Metrics);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
  Height := Metrics.tmHeight + 6;
end;

procedure TDefineEdit.Loaded;
begin
  inherited;
  if not(csDesigning in ComponentState) then
  begin
     NewAdjustHeight;
  end;
end;

procedure TDefineEdit.CMTextChanged(var Message: TMessage);
begin
  inherited;
  if not(csDesigning in ComponentState) and Assigned(fLabel) then
  begin
     if fLabel.Visible then
        fLabel.Visible := false;
     if (not fLabel.Visible) and (Text = '') then
        fLabel.Visible := True;
  end;
end;

procedure TDefineEdit.CMEnabledChanged(var Message: TMessage);
const
  EnableColors: array[Boolean] of TColor= (clBtnFace, clWindow);
begin
  inherited;
  Color := EnableColors[Enabled];
  if assigned(FTicket) then FTicket.Enabled := Enabled;
  if (not(csDesigning in ComponentState))and(assigned(fLabel)) then
     fLabel.Enabled  := Enabled;
  RedrawBorder(0);
end;

procedure TDefineEdit.CMFontChanged(var Message: TMessage);
begin
  inherited;
  if not((csDesigning in ComponentState) and (csLoading in ComponentState)) then
    NewAdjustHeight;
  if (not(csDesigning in ComponentState))and(assigned(fLabel)) then
    fLabel.Font.Assign(Font);
end;

procedure TDefineEdit.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  if not(csDesigning in ComponentState) then
  begin
    RedrawBorder(0);
    SelectAll;
  end;
end;

procedure TDefineEdit.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  if not(csDesigning in ComponentState) then
    RedrawBorder(0);
end;

procedure TDefineEdit.WMNCCalcSize(var Message: TWMNCCalcSize);
begin
  inherited;
  InflateRect(Message.CalcSize_Params^.rgrc[0], -3, -3);
end;

procedure TDefineEdit.WMNCPaint(var Message: TMessage);
begin
  inherited;
  RedrawBorder(HRGN(Message.WParam));
end;

procedure TDefineEdit.SetAlignment(const Value: TAlignment);
begin
  If FAlignment <> Value Then
  begin
    FAlignment := Value;
    RecreateWnd;
  end;
end;

{ TFlatInteger }

constructor TFlatInteger.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csSetCaption];
  FButton := TDefineSpin.Create(Self);
  FButton.Parent       := Self;
  FButton.Width        := 32;
  FButton.Height       := 10;
  FButton.Visible      := True;
  FButton.FocusControl := Self;
  FButton.OnUpClick    := UpClick;
  FButton.OnDownClick  := DownClick;
  Text                 := '0';
  FIncrement           := 1;
  FMaxValue            := 0;
  FMinValue            := 0;
  FEditorEnabled       := True;
end;

destructor TFlatInteger.Destroy;
begin
  FButton := nil;
  inherited Destroy;
end;

procedure TFlatInteger.UpClick (Sender: TObject);
begin
  if ReadOnly then
     MessageBeep(0)
  else
     Value := Value + FIncrement;
end;

procedure TFlatInteger.DownClick (Sender: TObject);
begin
  if ReadOnly then
     MessageBeep(0)
  else
     Value := Value - FIncrement;
end;

procedure TFlatInteger.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_UP:   UpClick(Self);
    VK_DOWN: DownClick(Self);
  end;
  inherited KeyDown(Key, Shift);
end;

function TFlatInteger.IsValidChar(Key: Char): Boolean;
begin
  Result := (Key in ['0'..'9',#8,#13]);
  if not FEditorEnabled and Result then
    Result := False;
end;

procedure TFlatInteger.KeyPress(var Key: Char);
begin
  if not IsValidChar(Key) then begin
    Key := #0;
    MessageBeep(0)
  end;
  if Key <> #0 then
  inherited KeyPress(Key);
end;

procedure TFlatInteger.WMSize(var Message: TWMSize);
var
  MinHeight: Integer;
begin
  inherited;
  MinHeight := GetMinHeight;
  if Height < MinHeight then
     Height := MinHeight
  else
    if FButton <> nil then
    begin
      FButton.SetBounds(Width - FButton.Width - 5, 0, FButton.Width, Height - 6);
      SetEditRect(Handle, Clientwidth, ClientHeight, FButton.Width);
    end;
end;

function TFlatInteger.GetMinHeight: Integer;
var
  DC: HDC;
  SaveFont: HFont;
  SysMetrics, Metrics: TTextMetric;
begin
  DC := GetDC(0);
  GetTextMetrics(DC, SysMetrics);
  SaveFont := SelectObject(DC, Font.Handle);
  GetTextMetrics(DC, Metrics);
  SelectObject(DC, SaveFont);
  Result := Metrics.tmHeight + 7;
  ReleaseDC(0, DC);
end;

function TFlatInteger.CheckValue(NewValue: LongInt): LongInt;
begin
  Result := NewValue;
  if (FMaxValue <> FMinValue) then
  begin
    if NewValue < FMinValue then
       Result := FMinValue
    else
      if NewValue > FMaxValue then
         Result := FMaxValue;
  end;
end;

procedure TFlatInteger.WMPaste(var Message: TWMPaste);
begin
  if not FEditorEnabled or ReadOnly then
    Exit;
  inherited;
end;

procedure TFlatInteger.WMCut(var Message: TWMPaste);
begin
  if not FEditorEnabled or ReadOnly then
    Exit;
  inherited;
end;

procedure TFlatInteger.CMExit(var Message: TCMExit);
begin
  inherited;
  if Text = '' then
     Value := 0;
  if CheckValue(Value) <> Value then
     SetValue(Value)
  else
     SetValue(Value);
end;

function TFlatInteger.GetValue: LongInt;
begin
  if Text = '' then
     Text := '0';
  try
    result := StrToInt(Text);
  except
    result := FMinValue;
  end;
end;

procedure TFlatInteger.SetValue(NewValue: LongInt);
begin
  Text := IntToStr(CheckValue(NewValue));
end;

procedure TFlatInteger.CMEnter(var Message: TCMGotFocus);
begin
  if AutoSelect and not (csLButtonDown in ControlState) then
     SelectAll;
  inherited;
end;

procedure TFlatInteger.Loaded;
begin
  SetEditRect(Handle, Clientwidth, ClientHeight, FButton.Width);
  FButton.SetBounds(Width - FButton.Width - 5, 0, FButton.Width, Height - 6);
  inherited;
end;

procedure TFlatInteger.CreateWnd;
begin
  inherited;
  SetEditRect(Handle, Clientwidth, ClientHeight, FButton.Width);
  FButton.SetBounds(Width - FButton.Width - 5, 0, FButton.Width, Height - 6);
end;

procedure TFlatInteger.CMTextChanged(var Message: TMessage);
begin
  inherited;
  if Text = '' then begin
     Text := '0';
  end;
  Value := CheckValue(StrToInt(Text));
end;

{ TFlatFloat }

constructor TFlatFloat.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle         := ControlStyle - [csSetCaption];
  FButton              := TDefineSpin.Create (Self);
  FButton.Parent       := Self;
  FButton.Width        := 32;
  FButton.Height       := 10;
  FButton.Visible      := True;
  FButton.FocusControl := Self;
  FButton.OnUpClick    := UpClick;
  FButton.OnDownClick  := DownClick;
  Text := '0' + DecimalSeparator + '00';
  FDigits              := 2;
  FPrecision           := 9;
  FIncrement           := 0.5;
  FEditorEnabled       := True;
end;

destructor TFlatFloat.Destroy;
begin
  FButton := nil;
  inherited Destroy;
end;

procedure TFlatFloat.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
      VK_UP: UpClick(Self);
    VK_DOWN: DownClick(Self);
  end;
  inherited KeyDown(Key, Shift);
end;

procedure TFlatFloat.KeyPress(var Key: Char);
begin
  if (not IsValidChar(Key))or((key='.') and (pos('.',Text)>0)) then begin
    Key := #0;
    MessageBeep(0)
  end;

  if Key <> #0 then
  inherited KeyPress(Key);
end;

function TFlatFloat.IsValidChar(Key: Char): Boolean;
begin
  Result := (Key in [DecimalSeparator, '0'..'9',#8,#13,#46]);
  if not FEditorEnabled and Result then
    Result := False;
end;

procedure TFlatFloat.WMSize(var Message: TWMSize);
var
  MinHeight: Integer;
begin
  inherited;
  MinHeight := GetMinHeight;
  if Height < MinHeight then
    Height := MinHeight
  else
    if FButton <> nil then
    begin
      FButton.SetBounds(Width - FButton.Width - 5, 0, FButton.Width, Height - 6);
      SetEditRect(Handle, Clientwidth, ClientHeight, FButton.Width);
    end;
end;

function TFlatFloat.CheckValue(Value: Extended): Extended;
begin
  Result := Value;
  if (FMaxValue <> FMinValue) then begin
    if Value < FMinValue then
       Result := FMinValue
    else
      if Value > FMaxValue then
        Result := FMaxValue;
  end;
end;

function TFlatFloat.GetMinHeight: Integer;
var
  DC: HDC;
  SaveFont: HFont;
  SysMetrics, Metrics: TTextMetric;
begin
  DC := GetDC(0);
  GetTextMetrics(DC, SysMetrics);
  SaveFont := SelectObject(DC, Font.Handle);
  GetTextMetrics(DC, Metrics);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
  Result := Metrics.tmHeight + 7;
end;

procedure TFlatFloat.UpClick(Sender: TObject);
begin
  if ReadOnly then
    MessageBeep(0)
  else
    Value := Value + FIncrement;
end;

procedure TFlatFloat.DownClick(Sender: TObject);
begin
  if ReadOnly then
    MessageBeep(0)
  else
    Value := Value - FIncrement;
end;

procedure TFlatFloat.WMPaste(var Message: TWMPaste);
begin
  if not FEditorEnabled or ReadOnly then
    Exit;
  inherited;
end;

procedure TFlatFloat.WMCut(var Message: TWMPaste);
begin
  if not FEditorEnabled or ReadOnly then
    Exit;
  inherited;
end;

procedure TFlatFloat.CMExit(var Message: TCMExit);
begin
  inherited;
  if (Text = '')or(Text = 'гд')or(Text = '.') then
     Value := 0;
  if CheckValue(Value) <> Value then
     SetValue(Value)
  else
     SetValue(Value);
end;

function TFlatFloat.GetValue: Extended;
var
  s: string;
begin
  try
    s := Text;
    while Pos(CurrencyString, S) > 0 do
      Delete(S, Pos(CurrencyString, S), Length(CurrencyString));
    while Pos(#32, S) > 0 do
      Delete(S, Pos(#32, S), 1);
    while Pos(ThousandSeparator, S) > 0 do
      Delete(S, Pos(ThousandSeparator, S), Length(ThousandSeparator));

    //Delete negative numbers in format Currency
    if Pos('(', S) > 0 then
    begin
      Delete(S, Pos('(', S), 1);
      if Pos(')', S) > 0 then
        Delete(S, Pos(')', S), 1);
      Result := StrToFloat(S)*-1;
    end
    else
      Result := StrToFloat(S);
  except
    Result := FMinValue;
  end;
end;

procedure TFlatFloat.SetFloatFormat(Value: TFloatFormat);
begin
  FFloatFormat := Value;
  Text := FloatToStrF(CheckValue(GetValue), FloatFormat, Precision, Digits);
end;

procedure TFlatFloat.SetDigits(Value: Integer);
begin
  FDigits := Value;
  Text := FloatToStrF(CheckValue(GetValue), FloatFormat, Precision, Digits);
end;

procedure TFlatFloat.SetPrecision(Value: Integer);
begin
  FPrecision := Value;
  Text := FloatToStrF(CheckValue(GetValue), FloatFormat, Precision, Digits);
end;

procedure TFlatFloat.SetValue(Value: Extended);
begin
  Text := FloatToStrF(CheckValue(Value), FloatFormat, Precision, Digits);
end;

procedure TFlatFloat.CMEnter(var Message: TCMGotFocus);
begin
  if AutoSelect and not (csLButtonDown in ControlState) then
    SelectAll;
  inherited;
end;

procedure TFlatFloat.Loaded;
begin
  SetEditRect(Handle, Clientwidth, ClientHeight, FButton.Width);
  FButton.SetBounds(Width - FButton.Width - 5, 0, FButton.Width, Height - 6);
  inherited;
end;

procedure TFlatFloat.CreateWnd;
begin
  inherited;
  SetEditRect(Handle, Clientwidth, ClientHeight, FButton.Width);
  FButton.SetBounds(Width - FButton.Width - 5, 0, FButton.Width, Height - 6);
end;

procedure TFlatFloat.CMTextChanged(var Message: TMessage);
begin
  inherited;
  if Text = '' then begin
     Text := '0';
  end;
  Value := GetValue;
end;

{ TDefineMemo }
constructor TDefineMemo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle  := ControlStyle - [csFramed];
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

procedure TDefineMemo.RedrawBorder(const Clip: HRGN);
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
   FocusState     := Focused;
   DesignState    := ComponentState;
   HasBars     := ScrollBars = ssBoth;
  end;
  Color := DrawEditBorder(Attrib,Clip);
end;

procedure TDefineMemo.SetParentColor(Value: Boolean);
begin
  if Value <> FParentColor then
  begin
    FParentColor := Value;
    if FParentColor then
    begin
      if Parent <> nil then
        FFlatColor := TForm(Parent).Color;
      RedrawBorder(0);
    end;
  end;
end;       

procedure TDefineMemo.CMSysColorChange(var Message: TMessage);
begin
    if (Parent <> nil)and(FParentColor) then
      FFlatColor := TForm(Parent).Color;
    RedrawBorder(0);
end;

procedure TDefineMemo.CMParentColorChanged(var Message: TWMNoParams);
begin
    if (Parent <> nil)and(FParentColor) then
       FFlatColor := TForm(Parent).Color;
    RedrawBorder(0);
end;

procedure TDefineMemo.SetColors(Index: Integer; Value: TColor);
begin
  case Index of
    0: FFocusColor    := Value;
    1: FBorderColor   := Value;
    2: begin
         FFlatColor   := Value;
         FParentColor := False;
       end;
  end;
  RedrawBorder(0);
end;

procedure TDefineMemo.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if (GetActiveWindow <> 0) then
  begin
    FMouseIn := True;
    RedrawBorder(0);
  end;
end;

procedure TDefineMemo.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  FMouseIn := False;
  RedrawBorder(0);
end;

procedure TDefineMemo.CMEnabledChanged(var Message: TMessage);
const
  EnableColors: array[Boolean] of TColor = (clBtnFace, clWindow);
begin
  inherited;
  Color := EnableColors[Enabled];
  RedrawBorder(0);
end;

procedure TDefineMemo.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  if not(csDesigning in ComponentState) then
    RedrawBorder(0);
end;

procedure TDefineMemo.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  if not(csDesigning in ComponentState) then
    RedrawBorder(0);
end;

procedure TDefineMemo.WMNCCalcSize(var Message: TWMNCCalcSize);
begin
  inherited;
  InflateRect(Message.CalcSize_Params^.rgrc[0], -3, -3);
end;

procedure TDefineMemo.WMNCPaint(var Message: TMessage);
begin
  inherited;
  RedrawBorder(HRGN(Message.WParam));
end;

{ TFlatIPEdit }

function TFlatIPEdit.Replace(Start, Len: Integer): integer;
var t,s:String;
begin
  s := Text;
  t := trim(copy(Text,Start-Len,Len));
  if t <> '' then begin
   if StrToInt(t)>255 then begin
     delete(s,Start-Len,Len);
     insert('255',s,Start-Len);
     Text      := s;
     SelStart  := Start-4;
     SelLength := Len;
   end;
  end;
  result := SelStart;
end;

procedure TFlatIPEdit.CMTextChanged(var Message: TMessage);
begin
  inherited;
  SetIPText(Text);
end;

constructor TFlatIPEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  EditMask := IPMaskStr;
  Text     := IPStart;
end;

function TFlatIPEdit.GetIPText: String;
begin
  result := self.Text;
  while Pos(#32,Result) > 0 do
        delete(Result,Pos(#32,Result),1);
end;

procedure TFlatIPEdit.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
end;

procedure TFlatIPEdit.SetIPText(const Value: String);
var i:integer;
    t:TIPChar;
    s:string;
begin
if fIPAddress <> Value then begin
 if Value <> '' then begin
    s := '';
    for i:=1 to Length(Value) do begin
        if Value[i] in ['0'..'9','.'] then
           s := s + Value[i];
    end;
    if Length(s)>0 then
    begin
    if s[Length(s)]<>'.' then
       s:=s+'.';
    IPEmpty(IPText);
    i:=1;
    while (pos('.',s)>0)and(i<=4) do begin
     t:=Trim(Copy(s,1,Pos('.',s)-1));
     if t <> '' then begin
        if StrToInt(t) > 255 then
           IPValue(IPText,I,'255')
        else begin
          case Length(t) of
           1:t := #32+t+#32;
           2:t := #32+t;
          end;
        IPValue(IPText,I,t);
        end;
     end;
     s:=copy(s,Pos('.',s)+1,Length(s));
     Inc(I);
    end;
    end;
    fIPAddress := format('%s.%s.%s.%s',[IPText.NO1,IPText.NO2,IPText.NO3,IPText.NO4]);
 end else begin
    fIPAddress := IPStart;
 end;
end;
Text := fIPAddress;
end;

procedure TFlatIPEdit.CMExit(var Message: TCMExit);
begin
 if IsMasked and not (csDesigning in ComponentState) then
    SetIPText(Text);
 inherited;
end;

function TFlatIPEdit.GetInx: integer;
var inx:integer;
begin
 GetSel(Result,inx);
end;

procedure TFlatIPEdit.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
end;

procedure TFlatIPEdit.KeyUp(var Key: Word; Shift: TShiftState);
begin
 if IsMasked then begin
  if SelStart <= 4 then
     Replace( 4,3)
  else if SelStart <=  8 then
     Replace( 8,3)
  else if SelStart <= 12 then
     Replace(12,3)
  else
     Replace(16,3);
  end;
 inherited KeyUp(Key,Shift);
end;

{ TDefineComboBox }

procedure TDefineComboBox.SetupInternalLabel;
begin
  if DefaultHasTicket then begin
   if Assigned(FTicket) then exit;

   FTicket := TFlatTicket.Create(Self);
   FTicket.FreeNotification(Self);
   FTicket.Transparent  := True;
   FTicket.FocusControl := Self;
  end;
end;

constructor TDefineComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csFixedHeight] + [csOpaque];
  TControlCanvas(Canvas).Control := self;
  SetBounds(0,0,120,20);
  FButtonWidth    := 16;
  FSysBtnWidth    := GetSystemMetrics(SM_CXVSCROLL);
  FListInstance   := MakeObjectInstance(ListWndProc);
  FDefListProc    := nil;
  ItemHeight      := 13;
  FArrowColor     := clBlack;
  FArrowBackgroundColor := $00C5D6D9;
  FFocusedColor   := clWhite;
  FFlatColor      := DefaultFlatColor;
  FParentColor    := True;
  FBorderColor    := DefaultBorderColor;
  FReadOnly       := false;
  FTicketPosition := poLeft;
  FTicketSpace    := 3;  
  SetupInternalLabel;
end;

destructor TDefineComboBox.Destroy;
begin
  FreeObjectInstance(FListInstance);
  inherited Destroy;
end;

procedure TDefineComboBox.SetColors(Index: Integer; Value: TColor);
begin
  case Index of
    0: FArrowColor   := Value;
    1: FArrowBackgroundColor := Value;
    2: FBorderColor  := Value;
    3: FFlatColor    := Value;
    4: FFocusedColor := Value;
  end;
  if index = 3 then
     FParentColor := False;
  Invalidate;
end;

procedure TDefineComboBox.CMSysColorChange(var Message: TMessage);
begin
  if FParentColor then begin
     if Parent <> nil then
        FFlatColor := TForm(Parent).Color;
  end;
  Invalidate;
end;

procedure TDefineComboBox.InvalidateSelection;
var
  R: TRect;
begin
  R := ClientRect;
  InflateRect(R, -2, -3);
  R.Left := R.Right - FButtonWidth - 8;
  Dec(R.Right, FButtonWidth + 3);
  if(GetFocus = Handle) and not DroppedDown then
    Canvas.Brush.Color := clHighlight
  else
    Canvas.Brush.Color := Color;
  Canvas.Brush.Style := bsSolid;
  Canvas.FillRect(R);
  if(GetFocus = Handle) and not DroppedDown then
  begin
    R := ClientRect;
    InflateRect(R, -3, -3);
    Dec(R.Right, FButtonWidth + 2);
    Canvas.FrameRect(R);
    Canvas.Brush.Color := clWindow;
  end;
  ExcludeClipRect(Canvas.Handle, ClientWidth - FSysBtnWidth - 2, 0, ClientWidth, ClientHeight);
end;

procedure TDefineComboBox.CMParentColorChanged(var Message: TWMNoParams);
begin
  if FParentColor then begin
     if Parent <> nil then
        FFlatColor := TForm(Parent).Color;
  end;
  Invalidate;
end;

procedure TDefineComboBox.WndProc(var Message: TMessage);
begin
  if (Message.Msg = WM_PARENTNOTIFY) then
    case LoWord(Message.wParam) of
      WM_CREATE:
        if FDefListProc <> nil then
        begin
          SetWindowLong(FListHandle, GWL_WNDPROC, Longint(FDefListProc));
          FDefListProc := nil;
          FChildHandle := Message.lParam;
        end
        else
          if FChildHandle = 0 then
            FChildHandle := Message.lParam
          else
            FListHandle := Message.lParam;
      end
  else
    if (Message.Msg = WM_WINDOWPOSCHANGING) then
      if Style in [csDropDown, csSimple] then
        SetWindowPos( EditHandle, 0,
          0, 0, ClientWidth - FButtonWidth - 2 * 2 - 4, Height - 2 * 2 - 2,
          SWP_NOMOVE + SWP_NOZORDER + SWP_NOACTIVATE + SWP_NOREDRAW);
  inherited;
  if Message.Msg = WM_CTLCOLORLISTBOX then
  begin
    SetBkColor(Message.wParam, ColorToRGB(Color));
    Message.Result := CreateSolidBrush(ColorToRGB(Color));
  end;
end;

procedure TDefineComboBox.ListWndProc(var Message: TMessage);
begin
  case Message.Msg of
    WM_WINDOWPOSCHANGING:
      with TWMWindowPosMsg(Message).WindowPos^ do
      begin
        // size of the drop down list
        if Style in [csDropDown, csDropDownList] then
          cy := (GetFontHeight(Font)-2) * Min(DropDownCount, Items.Count) + 4
        else
          cy := (ItemHeight) * Min(DropDownCount, Items.Count) + 4;
        if cy <= 4  then
          cy := 10;
      end;
    else
      with Message do
        Result := CallWindowProc(FDefListProc, FListHandle, Msg, WParam, LParam);
  end;
end;

procedure TDefineComboBox.ComboWndProc(var Message: TMessage; ComboWnd: HWnd; ComboProc: Pointer);
begin
  inherited;
  if (ComboWnd = EditHandle) then
    case Message.Msg of
      WM_SETFOCUS, WM_KILLFOCUS:
        SetSolidBorder;
    end;
end;

procedure TDefineComboBox.WMSetFocus(var Message: TMessage);
begin
  inherited;
  if not (csDesigning in ComponentState) then
  begin
    SetSolidBorder;
    Color := FFocusedColor;
    if not (Style in [csSimple, csDropDown]) then
      InvalidateSelection;
  end;
end;

procedure TDefineComboBox.WMKillFocus(var Message: TMessage);
begin
  inherited;
  if not (csDesigning in ComponentState) then
  begin
    SetSolidBorder;
    Color := FFlatColor;
    if not (Style in [csSimple, csDropDown]) then
      InvalidateSelection;
  end;
end;

procedure TDefineComboBox.CMEnabledChanged(var Msg: TMessage);
begin
  inherited;
  Invalidate;
  if Assigned(FTicket) then FTicket.Enabled := Enabled;
end;

procedure TDefineComboBox.CNCommand(var Message: TWMCommand);
var
  R: TRect;
begin
  inherited;
  if Message.NotifyCode in [1, 9, CBN_DROPDOWN, CBN_SELCHANGE] then
  begin
    if not (Style in [csSimple, csDropDown]) then
      InvalidateSelection;
  end;
  if (Message.NotifyCode in [CBN_CLOSEUP]) then
  begin
    R := GetButtonRect;
    Dec(R.Left, 2);
    InvalidateRect(Handle, @R, FALSE);
  end;
end;

procedure TDefineComboBox.WMKeyDown(var Message: TMessage);
var
  S: String;
begin
  S := Text;
  inherited;
  if not (Style in [csSimple, csDropDown]) and(Text <> S) then
    InvalidateSelection;
end;

procedure TDefineComboBox.WMPaint(var Message: TWMPaint);
var
  R: TRect;
  DC: HDC;
  PS: TPaintStruct;
begin
  DC := BeginPaint(Handle, PS);
  try
    R := PS.rcPaint;
    if R.Right > Width - FButtonWidth - 4 then
      R.Right := Width - FButtonWidth - 4;
    FillRect(DC, R, Brush.Handle);
    if RectInRect(GetButtonRect, PS.rcPaint) then
      PaintButton;
    ExcludeClipRect(DC, ClientWidth - FSysBtnWidth - 2, 0, ClientWidth, ClientHeight);
    PaintWindow(DC);
    if(Style = csDropDown) and DroppedDown then
    begin
      R := ClientRect;
      InflateRect(R, -2, -2);
      R.Right := Width - FButtonWidth - 3;
      Canvas.Brush.Color := clWindow;
      Canvas.FrameRect(R);
    end
    else
      if Style <> csDropDown then
        InvalidateSelection;
  finally
    EndPaint(Handle, PS);
  end;
  RedrawBorders;
  Message.Result := 0;
end;

procedure TDefineComboBox.WMNCPaint(var Message: TMessage);
begin
  inherited;
  RedrawBorders;
end;

procedure TDefineComboBox.CMFontChanged(var Message: TMessage);
begin
  inherited;
  ItemHeight := 13;
  RecreateWnd;
end;

function TDefineComboBox.GetButtonRect: TRect;
begin
  GetWindowRect(Handle, Result);
  OffsetRect(Result, -Result.Left, -Result.Top);
  Inc(Result.Left, ClientWidth - FButtonWidth);
  OffsetRect(Result, -1, 0);
end;

procedure TDefineComboBox.PaintButton;
var
  R: TRect;
  x, y: Integer;
begin
  R := GetButtonRect;
  InflateRect(R, 1, 0);

  Canvas.Brush.Color := FArrowBackgroundColor;
  Canvas.FillRect(R);
  Canvas.Brush.Color := FBorderColor;
  Canvas.FrameRect(R);

  x :=(R.Right - R.Left) div 2 - 6 + R.Left;
  if DroppedDown then
    y :=(R.Bottom - R.Top) div 2 - 1 + R.Top
  else
    y :=(R.Bottom - R.Top) div 2 - 1 + R.Top;

  if Enabled then
  begin
    Canvas.Brush.Color := FArrowColor;
    Canvas.Pen.Color := FArrowColor;
    if DroppedDown then
      Canvas.Polygon([Point(x + 4, y + 2), Point(x + 8, y + 2), Point(x + 6, y)])
    else
      Canvas.Polygon([Point(x + 4, y), Point(x + 8, y), Point(x + 6, y + 2)]);
  end
  else
  begin
    Canvas.Brush.Color := clWhite;
    Canvas.Pen.Color := clWhite;
    Inc(x); Inc(y);
    if DroppedDown then
      Canvas.Polygon([Point(x + 4, y + 2), Point(x + 8, y + 2), Point(x + 6, y)])
    else
      Canvas.Polygon([Point(x + 4, y), Point(x + 8, y), Point(x + 6, y + 2)]);
    Dec(x); Dec(y);
    Canvas.Brush.Color := clGray;
    Canvas.Pen.Color := clGray;
    if DroppedDown then
      Canvas.Polygon([Point(x + 4, y + 2), Point(x + 8, y + 2), Point(x + 6, y)])
    else
      Canvas.Polygon([Point(x + 4, y), Point(x + 8, y), Point(x + 6, y + 2)]);
  end;
  ExcludeClipRect(Canvas.Handle, ClientWidth - FSysBtnWidth, 0, ClientWidth, ClientHeight);
end;

procedure TDefineComboBox.PaintBorder;
var
  DC: HDC;
  R: TRect;
  BtnFaceBrush, WindowBrush: HBRUSH;
begin
  DC := GetWindowDC(Handle);

  GetWindowRect(Handle, R);
  OffsetRect(R, -R.Left, -R.Top);
  Dec(R.Right, FButtonWidth + 1);
  try
    BtnFaceBrush := CreateSolidBrush(ColorToRGB(FBorderColor));
    WindowBrush  := CreateSolidBrush(ColorToRGB(Color));
    if(not(csDesigning in ComponentState) and
     (Focused or(FMouseInControl and not(Screen.ActiveControl is TDefineComboBox)))) then
       Color := FFocusedColor
    else
       Color := FFlatColor;
    FrameRect(DC, R, BtnFaceBrush);
    InflateRect(R, -1, -1);
    FrameRect(DC, R, WindowBrush);
    InflateRect(R, -1, -1);
    FrameRect(DC, R, WindowBrush);
  finally
    ReleaseDC(Handle, DC);
  end;
  DeleteObject(WindowBrush);
  DeleteObject(BtnFaceBrush);
end;

function TDefineComboBox.GetSolidBorder: Boolean;
begin
  Result :=((csDesigning in ComponentState) and Enabled) or
   (not(csDesigning in ComponentState) and
   (DroppedDown or(GetFocus = Handle) or(GetFocus = EditHandle)) );
end;

procedure TDefineComboBox.SetSolidBorder;
var
  sb: Boolean;
begin
  sb := GetSolidBorder;
  if sb <> FSolidBorder then begin
    FSolidBorder := sb;
    RedrawBorders;
  end;
end;

procedure TDefineComboBox.RedrawBorders;
begin
  PaintBorder;
  if Style <> csSimple then
     PaintButton;
end;

procedure TDefineComboBox.CMBidimodechanged(var Message: TMessage);
begin
  inherited;
  if Assigned(FTicket) then FTicket.BiDiMode := BiDiMode;
end;

procedure TDefineComboBox.CMVisiblechanged(var Message: TMessage);
begin
  inherited;
  if Assigned(FTicket) then FTicket.Visible := Visible;
end;

procedure TDefineComboBox.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if(AComponent = FTicket) and(Operation = opRemove) then
     FTicket := nil;
end;

procedure TDefineComboBox.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited SetBounds(ALeft, ATop, AWidth, AHeight);
  SetTicketPosition(FTicketPosition);
end;

procedure TDefineComboBox.SetTicketPosition(const Value: TTicketPosition);
begin
  if FTicket = nil then exit;
  FTicketPosition := Value;
  SetTicketPoint(Value,Self,Ticket,FTicketSpace);
end;

procedure TDefineComboBox.SetTicketSpace(const Value: Integer);
begin
  if assigned(FTicket) then FTicketSpace := Value;
  SetTicketPosition(FTicketPosition);
end;

procedure TDefineComboBox.SetName(const Value: TComponentName);
begin
  if assigned(FTicket) then begin
   if(csDesigning in ComponentState) and((FTicket.GetTextLen = 0) or
     (CompareText(FTicket.Caption, Name) = 0)) then
       FTicket.Caption := Value;
  end;
  inherited SetName(Value);
  if csDesigning in ComponentState then
     Text := '';
end;

procedure TDefineComboBox.SetParent(AParent: TWinControl);
begin
  inherited SetParent(AParent);
  if FTicket = nil then exit;
  FTicket.Parent := AParent;
  FTicket.Visible := True;
end;   

procedure TDefineComboBox.SetParentColor(const Value: Boolean);
begin
  if Value <> FParentColor then begin
    FParentColor := Value;
    if FParentColor then begin
      if Parent <> nil then
         FFlatColor := TForm(Parent).Color;
      RedrawBorders;
    end;
  end;
end;

procedure TDefineComboBox.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if(GetActiveWindow <> 0) then
  begin
    FMouseInControl := True;
    RedrawBorders;
  end;
end;

procedure TDefineComboBox.CMMouseLeave(var Message: TMessage);
begin
 inherited;
  FMouseInControl := False;
  RedrawBorders;
end;

procedure TDefineComboBox.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if(Key in [#32..#255]) and(FReadOnly) then begin
    MessageBeep(0);
    Key := #0;
  end;
end;

{ TDefineColorBox }

procedure TDefineColorBox.SetupInternalLabel;
begin
  if DefaultHasTicket then begin
   if Assigned(FTicket) then exit;

   FTicket := TFlatTicket.Create(Self);
   FTicket.FreeNotification(Self);
   FTicket.Transparent  := True;
   FTicket.FocusControl := Self;
  end;
end;

constructor TDefineColorBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csFixedHeight] + [csOpaque];
  TControlCanvas(Canvas).Control := Self;
  FColorDlg        := TColorDialog.Create(Self);
  Style            := csOwnerDrawFixed;
  SetBounds(0,0,120,20);
  FButtonWidth     := 16;
  FSysBtnWidth     := GetSystemMetrics(SM_CXVSCROLL);
  FListInstance    := MakeObjectInstance(ListWndProc);
  FDefListProc     := nil;
  FArrowColor      := clBlack;
  FArrowBackgroundColor := $00C5D6D9;
  FBorderColor     := DefaultBorderColor;
  FHighlightColor  := clHighlight;
  FShowNames       := True;
  FColorBoxWidth   := 30;
  FValue           := clBlack;
  FTicketPosition  := poLeft;
  FTicketSpace     := 3;
  fLanguage        := lgChinese;
  SetupInternalLabel;
end;

destructor TDefineColorBox.Destroy;
begin
  FColorDlg.Free;
  FreeObjectInstance(FListInstance);
  inherited;
end;

procedure TDefineColorBox.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited SetBounds(ALeft, ATop, AWidth, AHeight);
  SetTicketPosition(FTicketPosition);
end;

procedure TDefineColorBox.CMBidimodechanged(var Message: TMessage);
begin
  inherited;
  if Assigned(FTicket) then FTicket.BiDiMode := BiDiMode;
end;

procedure TDefineColorBox.CMVisiblechanged(var Message: TMessage);
begin
  inherited;
  if Assigned(FTicket) then FTicket.Visible := Visible;
end;

procedure TDefineColorBox.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if(AComponent = FTicket) and(Operation = opRemove) then
     FTicket := nil;
end;

procedure TDefineColorBox.SetName(const Value: TComponentName);
begin
  if Assigned(FTicket) then begin
   if(csDesigning in ComponentState) and((FTicket.GetTextLen = 0) or
    (CompareText(FTicket.Caption, Name) = 0)) then begin
    FTicket.Caption := Value;
    case fLanguage of
      lgChinese:FTicket.Caption := StdColorCN;
      lgEnglish:FTicket.Caption := StdColorEN;
    end;
   end;
  end;
  inherited SetName(Value);
end;

procedure TDefineColorBox.SetParent(AParent: TWinControl);
begin
  inherited  SetParent(AParent);
  if FTicket = nil then exit;
  FTicket.Parent := AParent;
  FTicket.Visible := True;
end;

procedure TDefineColorBox.SetLanguage(const Value: TLanguage);
var Item:Integer;
begin
  if(fLanguage <> Value)and(Items.Count>=StdColorCount) then begin
    fLanguage := Value;
    for Item := Low(StdColors) to High(StdColors) do begin
        case Value of
         lgChinese : Items[Item] := StdColors[Item].cnName;
         lgEnglish : Items[Item] := StdColors[Item].enName;
        end;
    end;
    if Assigned(FTicket) then begin
     case fLanguage of
      lgChinese : FTicket.Caption := StdColorCN;
      lgEnglish : FTicket.Caption := StdColorEN;
     end;
    end;
    for Item := 0 to Pred(Items.Count) do
    begin
      if TColor(Items.Objects[Item]) = FValue then
       begin
        ItemIndex := Item;
        Change;
        Break;
       end;
    end;
  end;
end;

procedure TDefineColorBox.SetTicketSpace(const Value: Integer);
begin
  FTicketSpace := Value;
  SetTicketPosition(FTicketPosition);
end;

procedure TDefineColorBox.SetTicketPosition(const Value: TTicketPosition);
begin
  if FTicket = nil then exit;
  FTicketPosition := Value;
  SetTicketPoint(Value,Self,Ticket,FTicketSpace);;
end;

procedure TDefineColorBox.CreateWnd;
var
  I: Integer;
  ColorName: string;
begin
  inherited CreateWnd;
  Clear;
  for I := Low(StdColors) to High(StdColors) do begin
    case fLanguage of
      lgChinese : ColorName := StdColors[I].cnName;
      lgEnglish : ColorName := StdColors[I].enName;
    end;
    Items.AddObject(ColorName, TObject(StdColors[I].Value));
  end;
  ItemIndex := 0;
  Change;
end;

procedure TDefineColorBox.SetColors(Index: Integer; Value: TColor);
begin
  case Index of
    0: FArrowColor           := Value;
    1: FArrowBackgroundColor := Value;
    2: FBorderColor          := Value;
    3: FHighlightColor       := Value;
  end;
  Invalidate;
end;

procedure TDefineColorBox.WndProc(var Message: TMessage);
begin
  if(Message.Msg = WM_PARENTNOTIFY) then
    case LoWord(Message.wParam) of
      WM_CREATE:
        if FDefListProc <> nil then
        begin
          SetWindowLong(FListHandle, GWL_WNDPROC, Longint(FDefListProc));
          FDefListProc := nil;
          FChildHandle := Message.lParam;
        end
        else
          if FChildHandle = 0 then
            FChildHandle := Message.lParam
          else
            FListHandle := Message.lParam;
      end
  else
    if(Message.Msg = WM_WINDOWPOSCHANGING) then
      if Style in [csDropDown, csSimple] then
        SetWindowPos( EditHandle, 0,
          0, 0, ClientWidth - FButtonWidth - 2 * 2 - 4, Height - 2 * 2 - 2,
          SWP_NOMOVE + SWP_NOZORDER + SWP_NOACTIVATE + SWP_NOREDRAW);
  inherited;
  if Message.Msg = WM_CTLCOLORLISTBOX then
  begin
    SetBkColor(Message.wParam, ColorToRGB(Color)); 
    Message.Result := CreateSolidBrush(ColorToRGB(Color));
  end;
end;

procedure TDefineColorBox.ListWndProc(var Message: TMessage);
begin
  case Message.Msg of
    WM_WINDOWPOSCHANGING:
      with TWMWindowPosMsg(Message).WindowPos^ do
      begin
        // size of the drop down list
        if Style in [csDropDown, csDropDownList] then
           cy :=(GetFontHeight(Font)-2) * Min(DropDownCount, Items.Count) + 4
        else
           cy :=(ItemHeight) * Min(DropDownCount, Items.Count) + 4;
        if cy <= 4  then
           cy := 12;
      end;
    else
      with Message do
        Result := CallWindowProc(FDefListProc, FListHandle, Msg, WParam, LParam);
  end;
end;

procedure TDefineColorBox.ComboWndProc(var Message: TMessage; ComboWnd: HWnd; ComboProc: Pointer);
begin
  inherited;
  if(ComboWnd = EditHandle) then
    case Message.Msg of
      WM_SETFOCUS, WM_KILLFOCUS:
        SetSolidBorder;
    end;
end;

procedure TDefineColorBox.WMSetFocus(var Message: TMessage);
begin
  inherited;
  if not(csDesigning in ComponentState) then
  begin
    SetSolidBorder;
    if not(Style in [csSimple, csDropDown]) then
      InvalidateSelection;
  end;
end;

procedure TDefineColorBox.WMKillFocus(var Message: TMessage);
begin
  inherited;
  if not(csDesigning in ComponentState) then
  begin
    SetSolidBorder;
    if not(Style in [csSimple, csDropDown]) then
      InvalidateSelection;
  end;
end;

procedure TDefineColorBox.CMEnabledChanged(var Msg: TMessage);
begin
  inherited;
  FTicket.Enabled := Enabled;
  Invalidate;
end;

procedure TDefineColorBox.CNCommand(var Message: TWMCommand);
var
  R: TRect;
begin
  inherited;
  if Message.NotifyCode in [1, 9, CBN_DROPDOWN, CBN_SELCHANGE] then
  begin
    if not(Style in [csSimple, csDropDown]) then
      InvalidateSelection;
  end;
  if(Message.NotifyCode in [CBN_CLOSEUP]) then
  begin
    R := GetButtonRect;
    Dec(R.Left, 2);
    InvalidateRect(Handle, @R, FALSE);
  end;
end;

procedure TDefineColorBox.WMKeyDown(var Message: TMessage);
var
  S: String;
begin
  S := Text;
  inherited;
  if not(Style in [csSimple, csDropDown]) and(Text <> S) then
    InvalidateSelection;
end;

procedure TDefineColorBox.WMPaint(var Message: TWMPaint);
var
  R: TRect;
  DC: HDC;
  PS: TPaintStruct;
begin
  DC := BeginPaint(Handle, PS);
  try
    R := PS.rcPaint;
    if R.Right  > Width - FButtonWidth - 4 then
       R.Right := Width - FButtonWidth - 4;
    FillRect(DC, R, Brush.Handle);
    if RectInRect(GetButtonRect, PS.rcPaint) then
       PaintButton;
    ExcludeClipRect(DC, ClientWidth - FSysBtnWidth - 2, 0, ClientWidth, ClientHeight);
    PaintWindow(DC);
    if(Style = csDropDown) and DroppedDown then
    begin
      R := ClientRect;
      InflateRect(R, -2, -2);
      R.Right := Width - FButtonWidth - 3;
      Canvas.Brush.Color := clWindow;
      Canvas.FrameRect(R);
    end
    else
      if Style <> csDropDown then
        InvalidateSelection;
  finally
    EndPaint(Handle, PS);
  end;
  RedrawBorders;
  Message.Result := 0;
end;

procedure TDefineColorBox.WMNCPaint(var Message: TMessage);
begin
  inherited;
  RedrawBorders;
end;

procedure TDefineColorBox.CMFontChanged(var Message: TMessage);
begin
  inherited;
  ItemHeight := 13;
  RecreateWnd;
end;

procedure TDefineColorBox.InvalidateSelection;
var
  R: TRect;
begin
  R := ClientRect;
  InflateRect(R, -2, -3);
  R.Left := R.Right - FButtonWidth - 8;
  Dec(R.Right, FButtonWidth + 3);
  if(GetFocus = Handle) and not DroppedDown then
    Canvas.Brush.Color := FHighLightcolor
  else
    Canvas.Brush.Color := Color;
  Canvas.Brush.Style := bsSolid;
  Canvas.FillRect(R);
  if(GetFocus = Handle) and not DroppedDown then
  begin
    R := ClientRect;
    InflateRect(R, -3, -3);
    Dec(R.Right, FButtonWidth + 2);
    Canvas.FrameRect(R);
    Canvas.Brush.Color := clWindow;
  end;
  ExcludeClipRect(Canvas.Handle, ClientWidth - FSysBtnWidth - 2, 0, ClientWidth, ClientHeight);
end;

function TDefineColorBox.GetButtonRect: TRect;
begin
  GetWindowRect(Handle, Result);
  OffsetRect(Result, -Result.Left, -Result.Top);
  Inc(Result.Left, ClientWidth - FButtonWidth);
  OffsetRect(Result, -1, 0);
end;

procedure TDefineColorBox.PaintButton;
var
  R: TRect;
  x, y: Integer;
begin
  R := GetButtonRect;
  InflateRect(R, 1, 0);

  Canvas.Brush.Color := FArrowBackgroundColor;
  Canvas.FillRect(R);
  Canvas.Brush.Color := FBorderColor;
  Canvas.FrameRect(R);

  x :=(R.Right - R.Left) div 2 - 6 + R.Left;
  if DroppedDown then
    y :=(R.Bottom - R.Top) div 2 - 1 + R.Top
  else
    y :=(R.Bottom - R.Top) div 2 - 1 + R.Top;

  if Enabled then begin
    canvas.Brush.Color := FArrowColor;
    canvas.Pen.Color := FArrowColor;
    if DroppedDown then
      canvas.Polygon([Point(x + 4, y + 2), Point(x + 8, y + 2), Point(x + 6, y)])
    else
      canvas.Polygon([Point(x + 4, y), Point(x + 8, y), Point(x + 6, y + 2)]);
  end else begin
    canvas.Brush.Color := clWhite;
    canvas.Pen.Color := clWhite;
    Inc(x); Inc(y);
    if DroppedDown then
      canvas.Polygon([Point(x + 4, y + 2), Point(x + 8, y + 2), Point(x + 6, y)])
    else
      canvas.Polygon([Point(x + 4, y), Point(x + 8, y), Point(x + 6, y + 2)]);
    Dec(x); Dec(y);
    canvas.Brush.Color := clGray;
    canvas.Pen.Color := clGray;
    if DroppedDown then
      canvas.Polygon([Point(x + 4, y + 2), Point(x + 8, y + 2), Point(x + 6, y)])
    else
      canvas.Polygon([Point(x + 4, y), Point(x + 8, y), Point(x + 6, y + 2)]);
  end;
  ExcludeClipRect(Canvas.Handle, ClientWidth - FSysBtnWidth, 0, ClientWidth, ClientHeight);
end;

procedure TDefineColorBox.PaintBorder;
var
  DC: HDC;
  R: TRect;
  BtnFaceBrush, WindowBrush: HBRUSH;
begin
  DC := GetWindowDC(Handle);

  GetWindowRect(Handle, R);
  OffsetRect(R, -R.Left, -R.Top);
  Dec(R.Right, FButtonWidth + 1);
  try
    BtnFaceBrush := CreateSolidBrush(ColorToRGB(FBorderColor));
    WindowBrush := CreateSolidBrush(ColorToRGB(Color));

    FrameRect(DC, R, BtnFaceBrush);
    InflateRect(R, -1, -1);
    FrameRect(DC, R, WindowBrush);
    InflateRect(R, -1, -1);
    FrameRect(DC, R, WindowBrush);
  finally
    ReleaseDC(Handle, DC);
  end;
  DeleteObject(WindowBrush);
  DeleteObject(BtnFaceBrush);
end;

function TDefineColorBox.GetSolidBorder: Boolean;
begin
 Result :=((csDesigning in ComponentState) and Enabled) or
   (not(csDesigning in ComponentState) and
   (DroppedDown or(GetFocus = Handle) or(GetFocus = EditHandle)) );
end;

procedure TDefineColorBox.SetSolidBorder;
var
 sb: Boolean;
begin
 sb := GetSolidBorder;
  if sb <> FSolidBorder then
   begin
    FSolidBorder := sb;
    RedrawBorders;
   end;
end;

procedure TDefineColorBox.RedrawBorders;
begin
  PaintBorder;
  if Style <> csSimple then PaintButton;
end;

procedure TDefineColorBox.SetShowNames(Value: Boolean);
begin
 if Value <> FShowNames then
  begin
   FShowNames := Value;
   Invalidate;
  end;
end;

procedure TDefineColorBox.SetColorValue(Value: TColor);
var
 Item: Integer;
 CurrentColor: TColor;
begin
 if(ItemIndex < 0) or(Value <> FValue) then
  begin
   for Item := 0 to Pred(Items.Count) do
    begin
     CurrentColor := TColor(Items.Objects[Item]);
      if CurrentColor = Value then
       begin
        FValue := Value;
         if ItemIndex <> Item then ItemIndex := Item;
        Change;
        Break;
       end;
    end;
  end;
end;

procedure TDefineColorBox.SetColorBoxWidth(Value: Integer);
begin
 if Value <> FColorBoxWidth then
  begin
   FColorBoxWidth := Value;
  end;
 Invalidate;
end;

procedure TDefineColorBox.DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  ARect: TRect;
  Text: array[0..255] of Char;
  Safer: TColor;
begin
  ARect := Rect;
  with ARect do begin
   Inc(Top,    1);
   Inc(Left,   1);
   Dec(Right,  1);
   Dec(Bottom, 1);
   if FShowNames then begin
      Right := Left + FColorBoxWidth;
   end else begin
      Dec(Right, 5);
   end;
  end;
  with Canvas do begin
    Safer := Brush.Color;
    if(odSelected in State) then begin
      Brush.Color := FHighlightColor;
    end else begin
      Brush.Color := Color;
    end;
    FillRect(Rect);
    Pen.Color   := clBlack;
    Rectangle(ARect);
    Brush.Color := ColorToRgb(TColor(Items.Objects[Index]));
    try
      InflateRect(ARect, -1, -1);
      FillRect(ARect)
    finally
      Brush.Color := Safer;
    end;
    if FShowNames then begin
      StrPCopy(Text, Items[Index]);
      Rect.Left   := ARect.Right + 5;
      Brush.Style := bsClear;
      DrawText(Canvas.Handle, Text, StrLen(Text), Rect, DT_SINGLELINE or DT_VCENTER or DT_NOPREFIX);
      Brush.Style := bsSolid;
    end;
  end;
end;

procedure TDefineColorBox.Click;
begin
  if ItemIndex >= 0 then
  begin
    if(Items[ItemIndex] = StdCustomCN)or(Items[ItemIndex] = StdCustomEN) then
    begin
      if not FColorDlg.Execute then
         Exit;
      Items.Objects[ItemIndex] := TObject(FColorDlg.Color);
    end;
    Value := TColor(Items.Objects[ItemIndex]);
  end;
  inherited Click;
end;

function TDefineColorBox.AddColor(ColorName: String; Color: TColor): Boolean;
var
  I: Integer;
begin
  for I := 0 to Items.Count - 1 do begin
    if UpperCase(ColorName) = UpperCase(Items[I]) then begin
       Result := False;
       Exit;
    end;
  end;
  Items.InsertObject(Items.Count - 1, ColorName, TObject(Color));
  Result := True;
end;

function TDefineColorBox.DeleteColorByName(ColorName: String): Boolean;
var
  I: Integer;
begin
  for I := 0 to Items.Count - 1 do begin
    if UpperCase(ColorName) = UpperCase(Items[I]) then begin
      Items.Delete(I);
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;

function TDefineColorBox.DeleteColorByColor(Color: TColor): Boolean;
var
  I: Integer;
begin
  for I := 0 to Items.Count - 1 do begin
    if Color = TColor(Items.Objects[I]) then begin
      Items.Delete(I);
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;

{ TDefineSplitter }

constructor TDefineSplitter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csOpaque];
  Align := alLeft;
  Width := 5;
  Cursor := crHSplit;
  FMinSize := 30;
  FStatus := ssOut;
  ParentColor := true;
  ColorFocused := $0053D2FF;
  ColorBorder := $00555E66;
end;

procedure TDefineSplitter.AllocateLineDC;
begin
  FLineDC := GetDCEx(Parent.Handle, 0, DCX_CACHE or DCX_CLIPSIBLINGS or DCX_LOCKWINDOWUPDATE);
end;

procedure TDefineSplitter.DrawLine;
var
  P: TPoint;
begin
  FLineVisible := not FLineVisible;
  P := Point(Left, Top);
  if Align in [alLeft, alRight] then
    P.X := Left + FSplit
  else
    P.Y := Top + FSplit;
  with P do
    PatBlt(FLineDC, X, Y, Width, Height, PATINVERT);
end;

procedure TDefineSplitter.ReleaseLineDC;
begin
  ReleaseDC(Parent.Handle, FLineDC);
end;

procedure TDefineSplitter.Paint;
var
  memBitmap: TBitmap;
begin
  memBitmap := TBitmap.Create; // create memory-bitmap to draw flicker-free
  try
    memBitmap.Height := ClientRect.Bottom;
    memBitmap.Width := ClientRect.Right;

    if FStatus = ssIn then
    begin
      memBitmap.Canvas.Brush.Color := FFocusedColor;
      memBitmap.Canvas.FillRect(ClientRect);
      DrawButtonBorder(memBitmap.Canvas, ClientRect, FBorderColor, 1);
    end;
    if FStatus = ssOut then
    begin
      memBitmap.Canvas.Brush.Color := Color;
      memBitmap.Canvas.FillRect(ClientRect);
      DrawButtonBorder(memBitmap.Canvas, ClientRect, FBorderColor, 1);
    end;

    canvas.CopyRect(ClientRect, memBitmap.canvas, ClientRect); // Copy bitmap to screen
  finally
    memBitmap.free; // delete the bitmap
  end;
end;

procedure TDefineSplitter.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

function FindControl: TControl;
var
  P: TPoint;
  I: Integer;
begin
  Result := nil;
  P := Point(Left, Top);
  case Align of
    alLeft: Dec(P.X);
    alRight: Inc(P.X, Width);
    alTop: Dec(P.Y);
    alBottom: Inc(P.Y, Height);
  else
    Exit;
  end;
  for I := 0 to Parent.ControlCount - 1 do
  begin
    Result := Parent.Controls[I];
    if PtInRect(Result.BoundsRect, P) then
      Exit;
  end;
  Result := nil;
end;

var
  I: Integer;
begin
  inherited;
  if Button = mbLeft then
  begin
    FControl := FindControl;
    FDownPos := Point(X, Y);
    if Assigned(FControl) then
    begin
      if Align in [alLeft, alRight] then
      begin
        FMaxSize := Parent.ClientWidth - FMinSize;
        for I := 0 to Parent.ControlCount - 1 do
          with Parent.Controls[I] do
            if Align in [alLeft, alRight] then
              Dec(FMaxSize, Width);
            Inc(FMaxSize, FControl.Width);
        end
else
begin
FMaxSize := Parent.ClientHeight - FMinSize;
for I := 0 to Parent.ControlCount - 1 do
with Parent.Controls[I] do
if Align in [alTop, alBottom] then Dec(FMaxSize, Height);
Inc(FMaxSize, FControl.Height);
end;
UpdateSize(X, Y);
AllocateLineDC;
with ValidParentForm(Self) do
if ActiveControl <> nil then
begin
FActiveControl := ActiveControl;
FOldKeyDown := TDefineHack(FActiveControl).OnKeyDown;
TDefineHack(FActiveControl).OnKeyDown := FocusKeyDown;
end;
DrawLine;
end;
end;
end;

procedure TDefineSplitter.UpdateSize(X, Y: Integer);
var
  S: Integer;
begin
  if Align in [alLeft, alRight] then
    FSplit := X - FDownPos.X
  else
    FSplit := Y - FDownPos.Y;
  S := 0;
  case Align of
      alLeft: S := FControl.Width + FSplit;
     alRight: S := FControl.Width - FSplit;
       alTop: S := FControl.Height + FSplit;
    alBottom: S := FControl.Height - FSplit;
  end;
  FNewSize := S;
  if S < FMinSize then
    FNewSize := FMinSize
  else
    if S > FMaxSize then
      FNewSize := FMaxSize;
  if S <> FNewSize then
  begin
    if Align in [alRight, alBottom] then
      S := S - FNewSize
    else
      S := FNewSize - S;
    Inc(FSplit, S);
  end;
end;

procedure TDefineSplitter.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Assigned(FControl) then
  begin
    DrawLine;
    UpdateSize(X, Y);
    DrawLine;
  end;
end;

procedure TDefineSplitter.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Assigned(FControl) then
  begin
    DrawLine;
    case Align of
      alLeft: FControl.Width := FNewSize;
      alTop: FControl.Height := FNewSize;
      alRight:
        begin
          Parent.DisableAlign;
          try
            FControl.Left := FControl.Left + (FControl.Width - FNewSize);
            FControl.Width := FNewSize;
          finally
            Parent.EnableAlign;
          end;
        end;
      alBottom:
        begin
          Parent.DisableAlign;
          try
            FControl.Top := FControl.Top + (FControl.Height - FNewSize);
            FControl.Height := FNewSize;
          finally
            Parent.EnableAlign;
          end;
        end;
    end;
    StopSizing;
  end;
end;

procedure TDefineSplitter.FocusKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
     StopSizing
  else
    if Assigned(FOldKeyDown) then
       FOldKeyDown(Sender, Key, Shift);
end;

procedure TDefineSplitter.StopSizing;
begin
  if Assigned(FControl) then
  begin
    if FLineVisible then DrawLine;
    FControl := nil;
    ReleaseLineDC;
    if Assigned(FActiveControl) then
    begin
      TDefineHack(FActiveControl).OnKeyDown := FOldKeyDown;
      FActiveControl := nil;
    end;
  end;
  if Assigned(FOnMoved) then
    FOnMoved(Self);
end;

procedure TDefineSplitter.CMEnter(var Message: TMessage);
begin
  if FStatus <> ssIn then
  begin
     FStatus := ssIn;
     Invalidate;
  end;
end;

procedure TDefineSplitter.CMExit(var Message: TMessage);
begin
  if FStatus <> ssOut then
  begin
    FStatus := ssOut;
    Invalidate;
  end;
end;

procedure TDefineSplitter.SetColors (Index: Integer; Value: TColor);
begin
  case Index of
    0: FFocusedColor := Value;
    1: FBorderColor := Value;
  end;
  Invalidate;
end;

procedure TDefineSplitter.CMSysColorChange (var Message: TMessage);
begin
  inherited;
  if (ParentColor) and (Parent <> nil) then
     Color := TForm(Parent).Color;
  Invalidate;
end;

procedure TDefineSplitter.CMParentColorChanged (var Message: TWMNoParams);
begin
  inherited;
  if (ParentColor) and (Parent <> nil) then
     Color := TForm(Parent).Color;
  Invalidate;
end;

{ TDefineMask }

constructor TDefineMask.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMaskState := [];
  FMaskBlank := DefaultBlank;
end;

procedure TDefineMask.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if not FSettingCursor then inherited KeyDown(Key, Shift);
  if IsMasked and (Key <> 0) and not (ssAlt in Shift) then
  begin
    if (Key = VK_LEFT) or(Key = VK_RIGHT) then
    begin
      ArrowKeys(Key, Shift);
      if not ((ssShift in Shift) or (ssCtrl in Shift)) then
        Key := 0;
      Exit;
    end
    else if (Key = VK_UP) or(Key = VK_DOWN) then
    begin
      Key := 0;
      Exit;
    end
    else if (Key = VK_HOME) or(Key = VK_END) then
    begin
      HomeEndKeys(Key, Shift);
      Key := 0;
      Exit;
    end
    else if ((Key = VK_DELETE) and not (ssShift in Shift)) or
      (Key = VK_BACK) then
    begin
      if EditCanModify then
        DeleteKeys(Key);
      Key := 0;
      Exit;
    end;
    CheckCursor;
  end;
end;

procedure TDefineMask.KeyUp(var Key: Word; Shift: TShiftState);
begin
  if not FSettingCursor then inherited KeyUp(Key, Shift);
  if IsMasked and (Key <> 0) then
  begin
    if ((Key = VK_LEFT) or(Key = VK_RIGHT)) and (ssCtrl in Shift) then
      CheckCursor;
  end;
end;

procedure TDefineMask.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if IsMasked and (Key <> #0) and not (Char(Key) in [^V, ^X, ^C]) then
  begin
    CharKeys(Key);
    Key := #0;
  end;
end;

procedure TDefineMask.WMLButtonDown(var Message: TWMLButtonDown);
begin
  inherited;
  FBtnDownX := Message.XPos;
end;

procedure TDefineMask.WMLButtonUp(var Message: TWMLButtonUp);
var
  SelStart, SelStop : Integer;
begin
  inherited;
  if (IsMasked) then
  begin
    GetSel(SelStart, SelStop);
    FCaretPos := SelStart;
    if (SelStart <> SelStop) and (Message.XPos > FBtnDownX) then
      FCaretPos := SelStop;
    CheckCursor;
  end;
end;

procedure TDefineMask.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  if (IsMasked) then
    CheckCursor;
end;

procedure TDefineMask.SetEditText(const Value: string);
begin
  if GetEditText <> Value then
  begin
    SetTextBuf(PChar(Value));
    CheckCursor;
  end;
end;

function TDefineMask.GetEditText: string;
begin
  Result := inherited Text;
end;

function TDefineMask.GetTextLen: Integer;
begin
  Result := Length(Text);
end;

function TDefineMask.GetText: TMaskedText;
begin
  if not IsMasked then
    Result := inherited Text
  else
  begin
    Result := RemoveEditFormat(EditText);
    if FMaskSave then
      Result := AddEditFormat(Result, False);
  end;
end;

procedure TDefineMask.SetText(const Value: TMaskedText);
var
  OldText: string;
  Pos: Integer;
begin
  if not IsMasked then
    inherited Text := Value
  else
  begin
    OldText := Value;
    if FMaskSave then
      OldText := PadInputLiterals(EditMask, OldText, FMaskBlank)
    else
      OldText := AddEditFormat(OldText, True);
    if not (msDBSetText in FMaskState) and
      (csDesigning in ComponentState) and
      not (csLoading in ComponentState) and
      not Validate(OldText, Pos) then
          raise DefineError.Create(SMaskErr);
    EditText := OldText;
  end;
end;

procedure TDefineMask.WMCut(var Message: TMessage);
begin
  if not (IsMasked) then
    inherited
  else
  begin
    CopyToClipboard;
    DeleteKeys(VK_DELETE);
  end;
end;

procedure TDefineMask.WMPaste(var Message: TMessage);
var
  Value: string;
  Str: string;
  SelStart, SelStop : Integer;
begin
  if not (IsMasked) or ReadOnly then
    inherited
  else
  begin
    Clipboard.Open;
    Value := Clipboard.AsText;
    Clipboard.Close;

    GetSel(SelStart, SelStop);
    Str := EditText;
    DeleteSelection(Str, SelStart, SelStop - SelStart);
    EditText := Str;
    SelStart := InputString(Str, Value, SelStart);
    EditText := Str;
    SetCursor(SelStart);
  end;
end;

function TDefineMask.GetMasked: Boolean;
begin
  Result := EditMask <> '';
end;

function TDefineMask.GetMaxChars: Integer;
begin
  if IsMasked then
    Result := FMaxChars
  else
    Result := inherited GetTextLen;
end;

procedure TDefineMask.ReformatText(const NewMask: string);
var
  OldText: string;
begin
  OldText := RemoveEditFormat(EditText);
  FEditMask := NewMask;
  FMaxChars  := MaskOffsetToOffset(EditMask, Length(NewMask));
  FMaskSave  := MaskGetMaskSave(NewMask);
  FMaskBlank := MaskGetMaskBlank(NewMask);
  OldText := AddEditFormat(OldText, True);
  EditText := OldText;
end;

procedure TDefineMask.SetEditMask(const Value: TEditMask);
var
  SelStart, SelStop: Integer;
begin
  if Value <> EditMask then
  begin
    if (csDesigning in ComponentState) and (Value <> '') and
      not (csLoading in ComponentState) then
      EditText := '';
    if HandleAllocated then GetSel(SelStart, SelStop);
    ReformatText(Value);
    Exclude(FMaskState, msMasked);
    if EditMask <> '' then Include(FMaskState, msMasked);
    inherited MaxLength := 0;
    if IsMasked and (FMaxChars > 0) then
      inherited MaxLength := FMaxChars;
    if HandleAllocated and (GetFocus = Handle) and
       not (csDesigning in ComponentState) then
      SetCursor(SelStart);
  end;
end;

function TDefineMask.GetMaxLength: Integer;
begin
  Result := inherited MaxLength;
end;

procedure TDefineMask.SetMaxLength(Value: Integer);
begin
  if not IsMasked then
    inherited MaxLength := Value
  else
    inherited MaxLength := FMaxChars;
end;

procedure TDefineMask.GetSel(var SelStart: Integer; var SelStop: Integer);
begin
  SendMessage(Handle, EM_GETSEL, Integer(@SelStart), Integer(@SelStop));
end;

procedure TDefineMask.SetSel(SelStart: Integer; SelStop: Integer);
begin
  SendMessage(Handle, EM_SETSEL, SelStart, SelStop);
end;

procedure TDefineMask.SetCursor(Pos: Integer);
const
  ArrowKey: array[Boolean] of Word = (VK_LEFT, VK_RIGHT);
var
  SelStart, SelStop: Integer;
  KeyState: TKeyboardState;
  NewKeyState: TKeyboardState;
  I: Integer;
begin
  if (Pos >= 1) and (ByteType(EditText, Pos) = mbLeadByte) then Dec(Pos);
  SelStart := Pos;
  if (IsMasked) then
  begin
    if SelStart < 0 then
      SelStart := 0;
    SelStop  := SelStart + 1;
    if (Length(EditText) > SelStop) and (EditText[SelStop] in LeadBytes) then
      Inc(SelStop);
    if SelStart >= FMaxChars then
    begin
      SelStart := FMaxChars;
      SelStop  := SelStart;
    end;

    SetSel(SelStop, SelStop);
    
    if SelStart <> SelStop then
    begin
      GetKeyboardState(KeyState);
      for I := Low(NewKeyState) to High(NewKeyState) do
        NewKeyState[I] := 0;
      NewKeyState [VK_SHIFT] := $81;
      NewKeyState [ArrowKey[UseRightToLeftAlignment]] := $81;
      SetKeyboardState(NewKeyState);
      FSettingCursor := True;
      try
        SendMessage(Handle, WM_KEYDOWN, ArrowKey[UseRightToLeftAlignment], 1);
        SendMessage(Handle, WM_KEYUP, ArrowKey[UseRightToLeftAlignment], 1);
      finally
        FSettingCursor := False;
      end;
      SetKeyboardState(KeyState);
    end;
    FCaretPos := SelStart;
  end
  else
  begin
    if SelStart < 0 then
      SelStart := 0;
    if SelStart >= Length(EditText) then
      SelStart := Length(EditText);
    SetSel(SelStart, SelStart);
  end;
end;

procedure TDefineMask.CheckCursor;
var
  SelStart, SelStop: Integer;
begin
  if not HandleAllocated then  Exit;
  if (IsMasked) then
  begin
    GetSel(SelStart, SelStop);
    if SelStart = SelStop then
      SetCursor(SelStart);
  end;
end;

procedure TDefineMask.Clear;
begin
  Text := '';
end;

function TDefineMask.EditCanModify: Boolean;
begin
  Result := True;
end;

procedure TDefineMask.Reset;
begin
  if Modified then
  begin
    EditText := FOldValue;
    Modified := False;
  end;
end;

function TDefineMask.CharKeys(var CharCode: Char): Boolean;
var
  SelStart, SelStop : Integer;
  Txt: string;
  CharMsg: TMsg;
begin
  Result := False;
  if Word(CharCode) = VK_ESCAPE then
  begin
    Reset;
    Exit;
  end;
  if not EditCanModify or ReadOnly then Exit;
  if (Word(CharCode) = VK_BACK) then Exit;
  if (Word(CharCode) = VK_RETURN) then
  begin
    ValidateEdit;
    Exit;
  end;

  GetSel(SelStart, SelStop);
  if (SelStop - SelStart) > 1 then
  begin
    DeleteKeys(VK_DELETE);
    SelStart := GetNextEditChar(SelStart);
    SetCursor(SelStart);
  end;

  if (CharCode in LeadBytes) then
    if PeekMessage(CharMsg, Handle, WM_CHAR, WM_CHAR, PM_REMOVE) then
      if CharMsg.Message = WM_Quit then
        PostQuitMessage(CharMsg.wparam);
  Result := InputChar(CharCode, SelStart);
  if Result then
  begin
    if (CharCode in LeadBytes) then
    begin
      Txt := CharCode + Char(CharMsg.wParam);
      SetSel(SelStart, SelStart + 2);
    end
    else
      Txt := CharCode;
    SendMessage(Handle, EM_REPLACESEL, 0, LongInt(PChar(Txt)));
    GetSel(SelStart, SelStop);
    CursorInc(SelStart, 0);
  end;
end;

procedure TDefineMask.ArrowKeys(CharCode: Word; Shift: TShiftState);
var
  SelStart, SelStop : Integer;
begin
  if (ssCtrl in Shift) then Exit;
  GetSel(SelStart, SelStop);
  if (ssShift in Shift) then
  begin
    if (CharCode = VK_RIGHT) then
    begin
      Inc(FCaretPos);
      if (SelStop = SelStart + 1) then
      begin
        SetSel(SelStart, SelStop);  {reset caret to end of string}
        Inc(FCaretPos);
      end;
      if FCaretPos > FMaxChars then FCaretPos := FMaxChars;
    end
    else  {if (CharCode = VK_LEFT) then}
    begin
      Dec(FCaretPos);
      if (SelStop = SelStart + 2) and
        (FCaretPos > SelStart) then
      begin
        SetSel(SelStart + 1, SelStart + 1);  {reset caret to show up at start}
        Dec(FCaretPos);
      end;
      if FCaretPos < 0 then FCaretPos := 0;
    end;
  end
  else
  begin
    if (SelStop - SelStart) > 1 then
    begin
      if ((SelStop - SelStart) = 2) and (EditText[SelStart+1] in LeadBytes) then
      begin
        if (CharCode = VK_LEFT) then
          CursorDec(SelStart)
        else
          CursorInc(SelStart, 2);
        Exit;
      end;
      if SelStop = FCaretPos then
        Dec(FCaretPos);
      SetCursor(FCaretPos);
    end
    else if (CharCode = VK_LEFT) then
      CursorDec(SelStart)
    else   { if (CharCode = VK_RIGHT) then  }
    begin
      if SelStop = SelStart then
        SetCursor(SelStart)
      else
        if EditText[SelStart+1] in LeadBytes then
          CursorInc(SelStart, 2)
        else
          CursorInc(SelStart, 1);
    end;
  end;
end;

procedure TDefineMask.CursorInc(CursorPos: Integer; Incr: Integer);
var
  NuPos: Integer;
begin
  NuPos := CursorPos + Incr;
  NuPos := GetNextEditChar(NuPos);
  if IsLiteralChar(EditMask, nuPos) then
    NuPos := CursorPos;
  SetCursor(NuPos);
end;


procedure TDefineMask.CursorDec(CursorPos: Integer);
var
  nuPos: Integer;
begin
  nuPos := CursorPos;
  Dec(nuPos);
  nuPos := GetPriorEditChar(nuPos);
  SetCursor(NuPos);
end;

function TDefineMask.GetFirstEditChar: Integer;
begin
  Result := 0;
  if IsMasked then
    Result := GetNextEditChar(0);
end;

function TDefineMask.GetLastEditChar: Integer;
begin
  Result := GetMaxChars;
  if IsMasked then
    Result := GetPriorEditChar(Result - 1);
end;

function TDefineMask.GetNextEditChar(Offset: Integer): Integer;
begin
  Result := Offset;
  while(Result < FMaxChars) and (IsLiteralChar(EditMask, Result)) do
    Inc(Result);
end;

function TDefineMask.GetPriorEditChar(Offset: Integer): Integer;
begin
  Result := Offset;
  while(Result >= 0) and (IsLiteralChar(EditMask, Result)) do
    Dec(Result);
  if Result < 0 then
    Result := GetNextEditChar(Result);
end;

procedure TDefineMask.HomeEndKeys(CharCode: Word; Shift: TShiftState);
var
  SelStart, SelStop : Integer;
begin
  GetSel(SelStart, SelStop);
  if (CharCode = VK_HOME) then
  begin
    if (ssShift in Shift) then
    begin
      if (SelStart <> FCaretPos) and (SelStop <> (SelStart + 1)) then
        SelStop := SelStart + 1;
      SetSel(0, SelStop);
      CheckCursor;
    end
    else
      SetCursor(0);
    FCaretPos := 0;
  end
  else
  begin
    if (ssShift in Shift) then
    begin
      if (SelStop <> FCaretPos) and (SelStop <> (SelStart + 1)) then
        SelStart := SelStop - 1;
      SetSel(SelStart, FMaxChars);
      CheckCursor;
    end
    else
      SetCursor(FMaxChars);
    FCaretPos := FMaxChars;
  end;
end;

procedure TDefineMask.DeleteKeys(CharCode: Word);
var
  SelStart, SelStop : Integer;
  NuSelStart: Integer;
  Str: string;
begin
  if ReadOnly then Exit;
  GetSel(SelStart, SelStop);
  if ((SelStop - SelStart) <= 1) and (CharCode = VK_BACK) then
  begin
    NuSelStart := SelStart;
    CursorDec(SelStart);
    GetSel(SelStart, SelStop);
    if SelStart = NuSelStart then Exit;
  end;

  if (SelStop - SelStart) < 1 then Exit;

  Str := EditText;
  DeleteSelection(Str, SelStart, SelStop - SelStart);
  Str := Copy(Str, SelStart+1, SelStop - SelStart);
  SendMessage(Handle, EM_REPLACESEL, 0, LongInt(PChar(Str)));
  if (SelStop - SelStart) <> 1 then
  begin
    SelStart := GetNextEditChar(SelStart);
    SetCursor(SelStart);
  end
  else begin
    GetSel(SelStart, SelStop);
    SetCursor(SelStart - 1);
  end;
end;

procedure TDefineMask.CMEnter(var Message: TCMEnter);
begin
  if IsMasked and not (csDesigning in ComponentState) then
  begin
    if not (msReEnter in FMaskState) then
    begin
      FOldValue := EditText;
      inherited;
    end;
    Exclude(FMaskState, msReEnter);
    CheckCursor;
  end
  else
    inherited;
end;

procedure TDefineMask.CMTextChanged(var Message: TMessage);
var
  SelStart, SelStop : Integer;
  Temp: Integer;
begin
  inherited;
  FOldValue := EditText;
  if HandleAllocated then
  begin
    GetSel(SelStart, SelStop);
    Temp := GetNextEditChar(SelStart);
    if Temp <> SelStart then
      SetCursor(Temp);
  end;
end;

procedure TDefineMask.CMWantSpecialKey(var Message: TCMWantSpecialKey);
begin
  inherited;
  if (Message.CharCode = VK_ESCAPE) and IsMasked and Modified then
    Message.Result := 1;
end;

procedure TDefineMask.CMExit(var Message: TCMExit);
begin
  if IsMasked and not (csDesigning in ComponentState) then
  begin
    ValidateEdit;
    CheckCursor;
  end;
  inherited;
end;

procedure TDefineMask.ValidateEdit;
var
  Str: string;
  Pos: Integer;
begin
  Str := EditText;
  if IsMasked and Modified then
  begin
    if not Validate(Str, Pos) then
    begin
      if not (csDesigning in ComponentState) then
      begin
        Include(FMaskState, msReEnter);
        SetFocus;
      end;
      SetCursor(Pos);
      ValidateError;
    end;
  end;
end;

procedure TDefineMask.ValidateError;
begin
  MessageBeep(0);
  raise DefineError.Create(SMaskEditErr);
end;

function TDefineMask.AddEditFormat(const Value: string; Active: Boolean): string;
begin
  if not Active then
    Result := MaskDoFormatText(EditMask, Value, ' ')
  else
    Result := MaskDoFormatText(EditMask, Value, FMaskBlank);
end;

function TDefineMask.RemoveEditFormat(const Value: string): string;
var
  I: Integer;
  OldLen: Integer;
  Offset, MaskOffset: Integer;
  CType: TMaskCharType;
  Dir: TMaskDirectives;
begin
  Offset := 1;
  Result := Value;
  for MaskOffset := 1 to Length(EditMask) do
  begin
    CType := MaskGetCharType(EditMask, MaskOffset);

    if CType in [mcLiteral, mcIntlLiteral] then
      Result := Copy(Result, 1, Offset - 1) +
        Copy(Result, Offset + 1, Length(Result) - Offset);
    if CType in [mcMask, mcMaskOpt] then Inc(Offset);
  end;

  Dir := MaskGetCurrentDirectives(EditMask, 1);
  if mdReverseDir in Dir then
  begin
    Offset := 1;
    for I := 1 to Length(Result) do
    begin
      if Result[I] = FMaskBlank then
        Inc(Offset)
      else
        break;
    end;
    if Offset <> 1 then
      Result := Copy(Result, Offset, Length(Result) - Offset + 1);
  end
  else begin
    OldLen := Length(Result);
    for I := 1 to OldLen do
    begin
      if Result[OldLen - I + 1] = FMaskBlank then
        SetLength(Result, Length(Result) - 1)
      else Break;
    end;
  end;
  if FMaskBlank <> ' ' then
  begin
    OldLen := Length(Result);
    for I := 1 to OldLen do
    begin
      if Result[I] = FMaskBlank then
        Result[I] := ' ';
      if I > OldLen then Break;
    end;
  end;
end;

function TDefineMask.InputChar(var NewChar: Char; Offset: Integer): Boolean;
var
  MaskOffset: Integer;
  CType: TMaskCharType;
  InChar: Char;
begin
  Result := True;
  if EditMask <> '' then
  begin
    Result := False;
    MaskOffset := OffsetToMaskOffset(EditMask, Offset);
    if MaskOffset >= 0 then
    begin
      CType := MaskGetCharType(EditMask, MaskOffset);
      InChar := NewChar;
      Result := DoInputChar(NewChar, MaskOffset);
      if not Result and (CType in [mcMask, mcMaskOpt]) then
      begin
        MaskOffset := FindLiteralChar (MaskOffset, InChar);
        if MaskOffset > 0 then
        begin
          MaskOffset := MaskOffsetToOffset(EditMask, MaskOffset);
          SetCursor (MaskOffset);
          Exit;
        end;
      end;
    end;
  end;
  if not Result then
    MessageBeep(0)
end;

function TDefineMask.DoInputChar(var NewChar: Char; MaskOffset: Integer): Boolean;
var
  Dir: TMaskDirectives;
  Str: string;
  CType: TMaskCharType;

  function IsKatakana(const Chr: Byte): Boolean;
  begin
    Result := (SysLocale.PriLangID = LANG_JAPANESE) and (Chr in [$A1..$DF]);
  end;

  function TestChar(NewChar: Char): Boolean;
  var
    Offset: Integer;
  begin
    Offset := MaskOffsetToOffset(EditMask, MaskOffset);
    Result := not ((MaskOffset < Length(EditMask)) and
               (UpCase(EditMask[MaskOffset]) = UpCase(EditMask[MaskOffset+1]))) or
               (ByteType(EditText, Offset) = mbTrailByte) or
               (ByteType(EditText, Offset+1) = mbLeadByte);
  end;

begin
  Result := True;
  CType := MaskGetCharType(EditMask, MaskOffset);
  if CType in [mcLiteral, mcIntlLiteral] then
    NewChar := MaskIntlLiteralToChar(EditMask[MaskOffset])
  else
  begin
    Dir := MaskGetCurrentDirectives(EditMask, MaskOffset);
    case EditMask[MaskOffset] of
      mMskNumeric, mMskNumericOpt:
        begin
          if not ((NewChar >= '0') and (NewChar <= '9')) then
            Result := False;
        end;
      mMskNumSymOpt:
        begin
          if not (((NewChar >= '0') and (NewChar <= '9')) or
                 (NewChar = ' ') or(NewChar = '+') or(NewChar = '-')) then
            Result := False;
        end;
      mMskAscii, mMskAsciiOpt:
        begin
          if (NewChar in LeadBytes) and TestChar(NewChar) then
          begin
            Result := False;
            Exit;
          end;
          if IsCharAlpha(NewChar) then
          begin
            Str := ' ';
            Str[1] := NewChar;
            if (mdUpperCase in Dir)  then
              Str := AnsiUpperCase(Str)
            else if mdLowerCase in Dir then
              Str := AnsiLowerCase(Str);
            NewChar := Str[1];
          end;
        end;
      mMskAlpha, mMskAlphaOpt, mMskAlphaNum, mMskAlphaNumOpt:
        begin
          if (NewChar in LeadBytes) then
          begin
            if TestChar(NewChar) then
              Result := False;
            Exit;
          end;
          Str := ' ';
          Str[1] := NewChar;
          if IsKatakana(Byte(NewChar)) then
          begin
              NewChar := Str[1];
              Exit;
          end;
          if not IsCharAlpha(NewChar) then
          begin
            Result := False;
            if ((EditMask[MaskOffset] = mMskAlphaNum) or
                (EditMask[MaskOffset] = mMskAlphaNumOpt)) and
                (IsCharAlphaNumeric(NewChar)) then
              Result := True;
          end
          else if mdUpperCase in Dir then
            Str := AnsiUpperCase(Str)
          else if mdLowerCase in Dir then
            Str := AnsiLowerCase(Str);
          NewChar := Str[1];
        end;
    end;
  end;
end;

function TDefineMask.Validate(const Value: string; var Pos: Integer): Boolean;
var
  Offset, MaskOffset: Integer;
  CType: TMaskCharType;
begin
  Result := True;
  Offset := 1;
  for MaskOffset := 1 to Length(EditMask) do
  begin
    CType := MaskGetCharType(EditMask, MaskOffset);

    if CType in [mcLiteral, mcIntlLiteral, mcMaskOpt] then
      Inc(Offset)
    else if (CType = mcMask) and (Value <> '') then
    begin
      if (Value [Offset] = FMaskBlank) or
        ((Value [Offset] = ' ') and (EditMask[MaskOffset] <> mMskAscii)) then
      begin
        Result := False;
        Pos := Offset - 1;
        Exit;
      end;
      Inc(Offset);
    end;
  end;
end;

function TDefineMask.DeleteSelection(var Value: string; Offset: Integer;
  Len: Integer): Boolean;
var
  EndDel: Integer;
  StrOffset, MaskOffset, Temp: Integer;
  CType: TMaskCharType;
begin
  Result := True;
  if Len = 0 then Exit;

  StrOffset := Offset + 1;
  EndDel := StrOffset + Len;
  Temp := OffsetToMaskOffset(EditMask, Offset);
  if Temp < 0 then  Exit;
  for MaskOffset := Temp to Length(EditMask) do
  begin
    CType := MaskGetCharType(EditMask, MaskOffset);
    if CType in [mcLiteral, mcIntlLiteral] then
      Inc(StrOffset)
    else if CType in [mcMask, mcMaskOpt] then
    begin
      Value[StrOffset] := FMaskBlank;
      Inc(StrOffset);
    end;
    if StrOffset >= EndDel then Break;
  end;
end;

function TDefineMask.InputString(var Value: string; const NewValue: string;
  Offset: Integer): Integer;
var
  NewOffset, MaskOffset, Temp: Integer;
  CType: TMaskCharType;
  NewVal: string;
  NewChar: Char;
begin
  Result := Offset;
  if NewValue = '' then Exit;
  { replace chars with new chars, except literals }
  NewOffset := 1;
  NewVal := NewValue;
  Temp := OffsetToMaskOffset(EditMask, Offset);
  if Temp < 0 then  Exit;
  MaskOffset := Temp;
  While MaskOffset <= Length(EditMask) do
  begin
    CType := MaskGetCharType(EditMask, MaskOffset);
    if CType in [mcLiteral, mcIntlLiteral, mcMask, mcMaskOpt] then
    begin
      NewChar := NewVal[NewOffset];
      if not (DoInputChar(NewChar, MaskOffset)) then
      begin
        if (NewChar in LeadBytes) then
          NewVal[NewOffset + 1] := FMaskBlank;
        NewChar := FMaskBlank;
      end;
        { if pasted text does not contain a literal in the right place,
          insert one }
      if not ((CType in [mcLiteral, mcIntlLiteral]) and
        (NewChar <> NewVal[NewOffset])) then
      begin
        NewVal[NewOffset] := NewChar;
        if (NewChar in LeadBytes) then
        begin
          Inc(NewOffset);
          Inc(MaskOffset);
        end;
      end
      else
        NewVal := Copy(NewVal, 1, NewOffset-1) + NewChar +
          Copy(NewVal, NewOffset, Length (NewVal));
      Inc(NewOffset);
    end;
    if (NewOffset + Offset) > FMaxChars then Break;
    if (NewOffset) > Length(NewVal) then Break;
    Inc(MaskOffset);
  end;

  if (Offset + Length(NewVal)) < FMaxChars then
  begin
    if ByteType(Value, OffSet + Length(NewVal) + 1) = mbTrailByte then
    begin
      NewVal := NewVal + FMaskBlank;
      Inc(NewOffset);
    end;
    Value := Copy(Value, 1, Offset) + NewVal +
      Copy(Value, OffSet + Length(NewVal) + 1,
        FMaxChars -(Offset + Length(NewVal)));
  end
  else
  begin
    Temp := Offset;
    if (ByteType(NewVal, FMaxChars - Offset) = mbLeadByte) then
      Inc(Temp);
    Value := Copy(Value, 1, Offset) +
             Copy(NewVal, 1, FMaxChars - Temp);
  end;
  Result := NewOffset + Offset - 1;
end;

function TDefineMask.FindLiteralChar(MaskOffset: Integer; InChar: Char): Integer;
var
  CType: TMaskCharType;
  LitChar: Char;
begin
  Result := -1;
  while MaskOffset < Length(EditMask) do
  begin
    Inc(MaskOffset);
    CType := MaskGetCharType(EditMask, MaskOffset);
    if CType in [mcLiteral, mcIntlLiteral] then
    begin
      LitChar := EditMask[MaskOffset];
      if CType = mcIntlLiteral then
        LitChar := MaskIntlLiteralToChar(LitChar);
      if LitChar = InChar then
        Result := MaskOffset;
      Exit;
    end;
  end;
end;   

{ TDefineAnimation }
constructor TDefineAnimation.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAnimation   := TBitmap.Create;
  ControlStyle := ControlStyle + [csOpaque];
  SetBounds(0, 0, 60, 60);
  FTransColor  := clFuchsia;
  FBorderColor := DefaultBorderColor;
  FBorder      := false;
  FTransparent := false;
  FActive      := False;
  FLoop        := True;
  FInterval    := 100; // 1 Second
  FFrameWidth  := 30;
  FFrames      := 1;
  FFrame       := 0;
end;

destructor TDefineAnimation.Destroy;
begin
  FAnimation.Free;       
  inherited Destroy;
end;

procedure TDefineAnimation.Paint;
var
  X, Y, Pos, W, H: Integer;
  SrcRect, DestRect: TRect;
  memGlyph: TBitmap;
begin
 W := FAnimation.Width div FFrames;
 H := FAnimation.Height div FFrames;
 case FAnimationLayout of
    alAcross:
      begin
        X   := (Width - W) div 2;
        Y   := (Height - FAnimation.Height) div 2;
        Pos := W * FFrame;
        DestRect := Rect(X, Y, X + W, Y + FAnimation.Height);
        SrcRect  := Rect(Pos, 0, Pos + W, FAnimation.Height);
      end;
    alDown:
      begin
        X   := (Width - FFrameWidth) div 2;
        Y   := (Height - H) div 2;
        Pos := H * FFrame;
        DestRect := Rect(X, Y, X + FFrameWidth, Y + H);
        SrcRect  := Rect(0, Pos, FFrameWidth, Pos + FFrameWidth);
      end;
 end;
 memGlyph := TBitmap.Create;
 try
  memGlyph.Height := Height;
  memGlyph.Width  := Width;
  with memGlyph.Canvas do
  begin
   Brush.Style := bsClear;
   Brush.Color := Color;
   FillRect(ClipRect);
   if FTransparent then begin
      DrawParentImage(self, memGlyph.Canvas);
      Brush.Style := bsClear;
      Brush.Color := FTransColor; 
      BrushCopy(DestRect, FAnimation, SrcRect, FTransColor);
   end else begin
      CopyRect(DestRect, FAnimation.Canvas, SrcRect);
   end;
   if (csDesigning in ComponentState) and (not FBorder) then
   begin
      Pen.Style   := psDot;
      Pen.Color   := clBlack;
      Brush.Style := bsClear;
      Rectangle(ClipRect);
   end else if FBorder then begin
      DrawButtonBorder(memGlyph.Canvas, ClipRect, FBorderColor, 1);
   end;
  end;
  Canvas.CopyRect(ClientRect, memGlyph.Canvas, ClientRect);
 finally
  memGlyph.Free;
 end;
end;

procedure TDefineAnimation.SetAnimation(Value: TBitmap);
begin
  if Value <> FAnimation then
  begin
    FAnimation.Assign(Value);
    if not FAnimation.Empty then
    begin
      if FAnimation.Width > FAnimation.Height then
         FAnimationLayout := alAcross
      else
         FAnimationLayout := alDown;
      case FAnimationLayout of
        alAcross:
          if FAnimation.Width mod FAnimation.Height = 0 then
            FFrames := FAnimation.Width div FAnimation.Height;
        alDown:
          if FAnimation.Height mod FAnimation.Width = 0 then
            FFrames := FAnimation.Height div FAnimation.Width;
      end;
      FFrame := 1;
      case FAnimationLayout of
        alAcross:
          FFrameWidth := FAnimation.Width div FFrames;
        alDown:
          FFrameWidth := FAnimation.Height div FFrames;
      end;
      FTransColor := FAnimation.Canvas.Pixels[0, FAnimation.Height - 1];
    end;
    Invalidate;
  end;
end;

procedure TDefineAnimation.SetFrames(Value: Integer);
begin
  if Value <> FFrames then
  begin
    FFrames := Value;
    Invalidate;
  end;
end;

procedure TDefineAnimation.SetFrameWidth(Value: Integer);
begin
  if Value <> FFrameWidth then
  begin
    FFrameWidth := Value;
    Invalidate;
  end;
end;

procedure TDefineAnimation.SetFrame(Value: Integer);
var
  Temp: Integer;
begin
  if Value < 0 then
     Temp := FFrames - 1
  else
     Temp := Value mod FFrames;
  if Temp <> FFrame then
  begin
    FFrame := Temp;
    if Assigned(FFrameChange) then
    begin
      FFrameChange(Self,FFrame);
    end;
    Invalidate;
  end;
end;

procedure TDefineAnimation.SetActive(Value: Boolean);
begin
  if Value <> FActive then
  begin
    FActive := Value;
    if not Value then
    begin
      FTimer.Free;
      FTimer := nil;
    end
    else
      if FInterval > 0 then
      begin
        FTimer := TTimer.Create(Self);
        FTimer.Interval := FInterval;
        FTimer.OnTimer := DoTimer;
      end;
  end;
end;

procedure TDefineAnimation.SetTransparent(Value: Boolean);
begin
  if Value <> FTransparent then
  begin
     FTransparent := Value;
     Invalidate;
  end;
end;

procedure TDefineAnimation.SetLoop(Value: Boolean);
begin
  if Value <> FLoop then
  begin
    FLoop := Value;
    Invalidate;
  end;
end;

procedure TDefineAnimation.SetReverse(Value: Boolean);
begin
  if Value <> FReverse then
  begin
     FReverse := Value;
     Invalidate;
  end;
end;

procedure TDefineAnimation.SetInterval(Value: Integer);
begin
  if Value <> FInterval then
  begin
    FInterval := Value;
    if FActive then
       FTimer.Interval := Value;
    Invalidate;
  end;
end;

procedure TDefineAnimation.SetBorder(Value: Boolean);
begin
  if Value <> FBorder then
  begin
    FBorder := Value;
    Invalidate;
  end;
end;

procedure TDefineAnimation.SetColors (Index: Integer; Value: TColor);
begin
  case Index of
    0: FTransColor := Value;
    1: FBorderColor := Value;
  end;
  Invalidate;
end;

procedure TDefineAnimation.CMSysColorChange (var Message: TMessage);
begin
  inherited;
  if (ParentColor)and(Parent<>nil) then
  begin
    ParentColor := True;
    Color := TForm(Parent).Color;
  end;
  Invalidate;
end;

procedure TDefineAnimation.CMParentColorChanged (var Message: TWMNoParams);
begin
  inherited;
  if (ParentColor)and(Parent<>nil) then
  begin
    ParentColor := True;
    Color := TForm(Parent).Color;
  end;
  Invalidate;
end;

procedure TDefineAnimation.WMSize (var Message: TWMSize);
begin
  inherited;
  Invalidate;
end;

procedure TDefineAnimation.DoTimer(Sender: TObject);
  procedure ChkStop;
  begin
    if not FLoop then
    begin
      FActive := False;
      FTimer.Free;
      FTimer := nil;
    end;
  end;
begin
  if FReverse then
  begin
    Frame := Frame - 1;
    if FFrame = 0 then ChkStop;
  end
  else
  begin
    Frame := Frame + 1;
    if FFrame = Frames - 1 then ChkStop;
  end;
end;

procedure TDefineAnimation.SetAnimationLayout(const Value: TAnimationLayout);
begin
  FAnimationLayout := Value;
  Invalidate;
end;

{ TFlatHint }
constructor TFlatHint.Create (AOwner: TComponent);
begin
  inherited Create(AOwner);
  FHintFont := TFont.Create;
  if not (csDesigning in ComponentState) then
  begin
    HintWindowClass := TFlatHintWindow;
    with Application do
    begin
      ShowHint   := not ShowHint;
      ShowHint   := not ShowHint;
      OnShowHint := GetHintInfo;
      HintShortPause := 25;
      HintPause      := 500;
      HintHidePause  := 5000;
    end;
  end;
  FBackgroundColor      := clWhite;
  FBorderColor          := clBlack;
  FArrowBackgroundColor := $0053D2FF;
  FArrowColor           := clBlack;
  FHintWidth            := 200;
end;

destructor TFlatHint.Destroy;
begin
  FHintFont.Free;
  inherited Destroy;
end;

procedure TFlatHint.SetColors (Index: Integer; Value: TColor);
begin
  case Index of
    0: FBackgroundColor      := Value;
    1: FBorderColor          := Value;
    2: FArrowBackgroundColor := Value;
    3: FArrowColor           := Value;
  end;
end;

procedure TFlatHint.SetHintFont (Value: TFont);
begin
  FHintFont.Assign(Value);
end;

procedure TFlatHint.GetHintInfo (var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
begin
  if Assigned(FOnShowHint) then
     FOnShowHint(HintStr, CanShow, HintInfo);
end;

{ TFlatHintWindow }

function TFlatHintWindow.FindFlatHint: TFlatHint;
var
  curInx: Integer;
begin
  Result := nil;

  with Application.MainForm do
    for curInx := 0 to ComponentCount - 1 do
      if Components[curInx] is TFlatHint then
      begin
        Result := TFlatHint(Components[curInx]);
        Break;
      end;
end;

procedure TFlatHintWindow.CreateParams (var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style - WS_BORDER;
end;

procedure TFlatHintWindow.Paint;
var
  ArrowRect, TextRect: TRect;
begin
  // Set the Rect's
  case FArrowPos of
    NW, SW:
      begin
        ArrowRect := Rect(ClientRect.Left + 1, ClientRect.Top + 1, ClientRect.Left + 15, ClientRect.Bottom - 1);
        TextRect  := Rect(ClientRect.Left + 15, ClientRect.Top + 1, ClientRect.Right - 1, ClientRect.Bottom - 1);
      end;
    NE, SE:
      begin
        ArrowRect := Rect(ClientRect.Right - 15, ClientRect.Top + 1, ClientRect.Right - 1, ClientRect.Bottom - 1);
        TextRect  := Rect(ClientRect.Left + 1, ClientRect.Top + 1, ClientRect.Right - 15, ClientRect.Bottom - 1);
      end;
  end;

  // DrawBackground
  canvas.brush.color := FHint.FArrowBackgroundColor;
  canvas.FillRect(ArrowRect);
  canvas.brush.color := FHint.FBackgroundColor;
  canvas.FillRect(TextRect);

  // DrawBorder
  canvas.Brush.Color := FHint.FBorderColor;
  canvas.FrameRect(ClientRect);

  // DrawArrow
  case FArrowPos of
    NW: FArrowPoint := Point(ArrowRect.Left + 2, ArrowRect.Top + 2);
    NE: FArrowPoint := Point(ArrowRect.Right - 3, ArrowRect.Top + 2);
    SW: FArrowPoint := Point(ArrowRect.Left + 2, ArrowRect.Bottom - 3);
    SE: FArrowPoint := Point(ArrowRect.Right - 3, ArrowRect.Bottom - 3);
  end;
  canvas.Pen.Color := FHint.FArrowColor;
  case FArrowPos of
    NW: canvas.Polyline([Point(FArrowPoint.x,     FArrowPoint.y),     Point(FArrowPoint.x, FArrowPoint.y + 6),
                         Point(FArrowPoint.x + 1, FArrowPoint.y + 6), Point(FArrowPoint.x + 1, FArrowPoint.y),
                         Point(FArrowPoint.x + 6, FArrowPoint.y),     Point(FArrowPoint.x + 6, FArrowPoint.y + 1),
                         Point(FArrowPoint.x + 2, FArrowPoint.y + 1), Point(FArrowPoint.x + 2, FArrowPoint.y + 4),
                         Point(FArrowPoint.x + 5, FArrowPoint.y + 7), Point(FArrowPoint.x + 6, FArrowPoint.y + 7),
                         Point(FArrowPoint.x + 3, FArrowPoint.y + 4), Point(FArrowPoint.x + 3, FArrowPoint.y + 3),
                         Point(FArrowPoint.x + 6, FArrowPoint.y + 6), Point(FArrowPoint.x + 7, FArrowPoint.y + 6),
                         Point(FArrowPoint.x + 3, FArrowPoint.y + 2), Point(FArrowPoint.x + 4, FArrowPoint.y + 2),
                         Point(FArrowPoint.x + 7, FArrowPoint.y + 5), Point(FArrowPoint.x + 7, FArrowPoint.y + 6)]);
    NE: canvas.Polyline([Point(FArrowPoint.x,     FArrowPoint.y),     Point(FArrowPoint.x, FArrowPoint.y + 6),
                         Point(FArrowPoint.x - 1, FArrowPoint.y + 6), Point(FArrowPoint.x - 1, FArrowPoint.y),
                         Point(FArrowPoint.x - 6, FArrowPoint.y),     Point(FArrowPoint.x - 6, FArrowPoint.y + 1),
                         Point(FArrowPoint.x - 2, FArrowPoint.y + 1), Point(FArrowPoint.x - 2, FArrowPoint.y + 4),
                         Point(FArrowPoint.x - 5, FArrowPoint.y + 7), Point(FArrowPoint.x - 6, FArrowPoint.y + 7),
                         Point(FArrowPoint.x - 3, FArrowPoint.y + 4), Point(FArrowPoint.x - 3, FArrowPoint.y + 3),
                         Point(FArrowPoint.x - 6, FArrowPoint.y + 6), Point(FArrowPoint.x - 7, FArrowPoint.y + 6),
                         Point(FArrowPoint.x - 3, FArrowPoint.y + 2), Point(FArrowPoint.x - 4, FArrowPoint.y + 2),
                         Point(FArrowPoint.x - 7, FArrowPoint.y + 5), Point(FArrowPoint.x - 7, FArrowPoint.y + 6)]);
    SW: canvas.Polyline([Point(FArrowPoint.x,     FArrowPoint.y),     Point(FArrowPoint.x, FArrowPoint.y - 6),
                         Point(FArrowPoint.x + 1, FArrowPoint.y - 6), Point(FArrowPoint.x + 1, FArrowPoint.y),
                         Point(FArrowPoint.x + 6, FArrowPoint.y),     Point(FArrowPoint.x + 6, FArrowPoint.y - 1),
                         Point(FArrowPoint.x + 2, FArrowPoint.y - 1), Point(FArrowPoint.x + 2, FArrowPoint.y - 4),
                         Point(FArrowPoint.x + 5, FArrowPoint.y - 7), Point(FArrowPoint.x + 6, FArrowPoint.y - 7),
                         Point(FArrowPoint.x + 3, FArrowPoint.y - 4), Point(FArrowPoint.x + 3, FArrowPoint.y - 3),
                         Point(FArrowPoint.x + 6, FArrowPoint.y - 6), Point(FArrowPoint.x + 7, FArrowPoint.y - 6),
                         Point(FArrowPoint.x + 3, FArrowPoint.y - 2), Point(FArrowPoint.x + 4, FArrowPoint.y - 2),
                         Point(FArrowPoint.x + 7, FArrowPoint.y - 5), Point(FArrowPoint.x + 7, FArrowPoint.y - 6)]);
    SE: canvas.Polyline([Point(FArrowPoint.x,     FArrowPoint.y),     Point(FArrowPoint.x, FArrowPoint.y - 6),
                         Point(FArrowPoint.x - 1, FArrowPoint.y - 6), Point(FArrowPoint.x - 1, FArrowPoint.y),
                         Point(FArrowPoint.x - 6, FArrowPoint.y),     Point(FArrowPoint.x - 6, FArrowPoint.y - 1),
                         Point(FArrowPoint.x - 2, FArrowPoint.y - 1), Point(FArrowPoint.x - 2, FArrowPoint.y - 4),
                         Point(FArrowPoint.x - 5, FArrowPoint.y - 7), Point(FArrowPoint.x - 6, FArrowPoint.y - 7),
                         Point(FArrowPoint.x - 3, FArrowPoint.y - 4), Point(FArrowPoint.x - 3, FArrowPoint.y - 3),
                         Point(FArrowPoint.x - 6, FArrowPoint.y - 6), Point(FArrowPoint.x - 7, FArrowPoint.y - 6),
                         Point(FArrowPoint.x - 3, FArrowPoint.y - 2), Point(FArrowPoint.x - 4, FArrowPoint.y - 2),
                         Point(FArrowPoint.x - 7, FArrowPoint.y - 5), Point(FArrowPoint.x - 7, FArrowPoint.y - 6)]);
  end;

  // DrawHintText
  canvas.brush.Style := bsClear;
  InflateRect(TextRect, -3, -1);
  {$IFDEF DFS_COMPILER_4_UP}
  if BidiMode = bdRightToLeft then
    DrawText(canvas.handle, PChar(Caption), Length(Caption), TextRect, DT_RIGHT or DT_WORDBREAK or DT_NOPREFIX)
  else
    DrawText(canvas.handle, PChar(Caption), Length(Caption), TextRect, DT_WORDBREAK or DT_NOPREFIX);
  {$ELSE}
  DrawText(canvas.handle, PChar(Caption), Length(Caption), TextRect, DT_WORDBREAK or DT_NOPREFIX);
  {$ENDIF}
end;

procedure TFlatHintWindow.ActivateHint (HintRect: TRect; const AHint: string);
var
  curWidth: Byte;
  Pnt: TPoint;
  HintHeight, HintWidth: Integer;
  NordWest, NordEast, SouthWest, SouthEast: TRect;
begin
  Caption := AHint;
  FHint   := FindFlatHint;

  if FHint <> nil then
    Canvas.Font.Assign(FHint.Font);

  // Calculate width and height
  HintRect.Right := HintRect.Left + FHint.MaxWidth - 22;

  {$IFDEF DFS_COMPILER_4_UP}
  if BidiMode = bdRightToLeft then
    DrawText(Canvas.Handle, @AHint[1], Length(AHint), HintRect, DT_RIGHT or DT_CALCRECT or DT_WORDBREAK or DT_NOPREFIX)
  else
    DrawText(Canvas.Handle, @AHint[1], Length(AHint), HintRect, DT_CALCRECT or DT_WORDBREAK or DT_NOPREFIX);
  {$ELSE}
  DrawText(Canvas.Handle, @AHint[1], Length(AHint), HintRect, DT_CALCRECT or DT_WORDBREAK or DT_NOPREFIX);
  {$ENDIF}


  DrawText(Canvas.Handle, @AHint[1], Length(AHint), HintRect, DT_CALCRECT or DT_WORDBREAK or DT_NOPREFIX);
  Inc(HintRect.Right, 22);
  Inc(HintRect.Bottom, 6);

  // Divide the screen in 4 pices
  NordWest :=  Rect(0, 0, Screen.Width div 2, Screen.Height div 2);
  NordEast :=  Rect(Screen.Width div 2, 0, Screen.Width, Screen.Height div 2);
  SouthWest := Rect(0, Screen.Height div 2, Screen.Width div 2, Screen.Height);
  SouthEast := Rect(Screen.Width div 2, Screen.Height div 2, Screen.Width, Screen.Height);

  GetCursorPos(Pnt);

  if PtInRect(NordWest, Pnt) then
    FArrowPos := NW
  else
    if PtInRect(NordEast, Pnt) then
      FArrowPos := NE
    else
      if PtInRect(SouthWest, Pnt) then
        FArrowPos := SW
      else
        FArrowPos := SE;

  // Calculate the position of the hint
  if FArrowPos = NW then
    curWidth := 12
  else
    curWidth := 5;

  HintHeight := HintRect.Bottom - HintRect.Top;
  HintWidth  := HintRect.Right - HintRect.Left;

  case FArrowPos of
    NW: HintRect := Rect(Pnt.x + curWidth, Pnt.y + curWidth, Pnt.x + HintWidth + curWidth, Pnt.y + HintHeight + curWidth);
    NE: HintRect := Rect(Pnt.x - HintWidth - curWidth, Pnt.y + curWidth, Pnt.x - curWidth, Pnt.y + HintHeight + curWidth);
    SW: HintRect := Rect(Pnt.x + curWidth, Pnt.y - HintHeight - curWidth, Pnt.x + HintWidth + curWidth, Pnt.y - curWidth);
    SE: HintRect := Rect(Pnt.x - HintWidth - curWidth, Pnt.y - HintHeight - curWidth, Pnt.x - curWidth, Pnt.y - curWidth);
  end;

  BoundsRect := HintRect;

  Pnt := ClientToScreen(Point(0, 0));

  SetWindowPos(Handle, HWND_TOPMOST, Pnt.X, Pnt.Y, 0, 0, SWP_SHOWWINDOW or SWP_NOACTIVATE or SWP_NOSIZE);
end;

{ TDefineImage }

constructor TDefineImage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  FBitmap := TBitmap.Create;
  FBitmap.OnChange := PictureChanged;
  FBitmap.OnProgress := Progress;
  Height := 105;
  Width := 105;
end;

destructor TDefineImage.Destroy;
begin
  FBitmap.Free;
  inherited Destroy;
end;

function TDefineImage.GetPalette: HPALETTE;
begin
  Result := 0;
  if FBitmap <> nil then
	Result := FBitmap.Palette;
end;

function TDefineImage.DestRect: TRect;
var
  w, h, cw, ch: Integer;
  xyaspect: Double;
begin
  w  := Bitmap.Width;
  h  := Bitmap.Height;
  cw := ClientWidth;
  ch := ClientHeight;
  if Stretch or (Proportional and ((w > cw) or (h > ch))) then
  begin
	if Proportional and (w > 0) and (h > 0) then
	begin
      xyaspect := w / h;
      if w > h then
      begin
        w := cw;
        h := Trunc(cw / xyaspect);
        if h > ch then  // woops, too big
        begin
          h := ch;
          w := Trunc(ch * xyaspect);
        end;
      end
      else
      begin
        h := ch;
        w := Trunc(ch * xyaspect);
        if w > cw then  // woops, too big
        begin
          w := cw;
          h := Trunc(cw / xyaspect);
        end;
      end;
    end
    else
    begin
      w := cw;
      h := ch;
    end;
  end;

  with Result do
  begin
    Left := 0;
    Top := 0;
    Right := w;
    Bottom := h;
  end;

  if Center then
	OffsetRect(Result, (cw - w) div 2, (ch - h) div 2);
end;

procedure TDefineImage.Paint;
var
  Save: Boolean;
begin
  if csDesigning in ComponentState then
	with inherited Canvas do
	begin
	  Pen.Style   := psDash;
	  Brush.Style := bsClear;
	  Rectangle(0, 0, Width, Height);
	end;
  Save     := FDrawing;
  FDrawing := True;
  try
	with inherited Canvas do
  begin
     StretchDraw(DestRect, Bitmap);
  end;
  finally
	FDrawing := Save;
  end;
end;

function TDefineImage.DoPaletteChange: Boolean;
var
  ParentForm: TCustomForm;
  Tmp: TGraphic;
begin
  Result := False;
  Tmp    := Bitmap;
  if Visible and (not (csLoading in ComponentState)) and (Tmp <> nil) and
	(Tmp.PaletteModified) then
  begin
	if (Tmp.Palette = 0) then
	  Tmp.PaletteModified := False
	else
	begin
	  ParentForm := GetParentForm(Self);
	  if Assigned(ParentForm) and ParentForm.Active and Parentform.HandleAllocated then
	  begin
		if FDrawing then
		  ParentForm.Perform(wm_QueryNewPalette, 0, 0)
		else
		  PostMessage(ParentForm.Handle, wm_QueryNewPalette, 0, 0);
		Result := True;
		Tmp.PaletteModified := False;
	  end;
	end;
  end;
end;

procedure TDefineImage.Progress(Sender: TObject; Stage: TProgressStage;
  PercentDone: Byte; RedrawNow: Boolean; const R: TRect; const Msg: string);
begin
  if FIncrementalDisplay and RedrawNow then
  begin
	if DoPaletteChange then Update
	else Paint;
  end;
  if Assigned(FOnProgress) then FOnProgress(Sender, Stage, PercentDone, RedrawNow, R, Msg);
end;

function TDefineImage.GetCanvas: TCanvas;
var
  fBit: TBitmap;
begin
  if Bitmap = nil then
  begin
	fBit := TBitmap.Create;
	try
	  fBit.Width    := Width;
	  fBit.Height   := Height;
	  fBit          := Bitmap;
	finally
	  fBit.Free;
	end;
  end;
  if Bitmap is TBitmap then
	   Result := TBitmap(Bitmap).Canvas
  else
	raise EInvalidOperation.Create(SImageCanvasNeedsBitmap);
end;

procedure TDefineImage.SetCenter(Value: Boolean);
begin
  if FCenter <> Value then
  begin
	FCenter := Value;
	PictureChanged(Self);
  end;
end;

procedure TDefineImage.SetPicture(Value: TBitmap);
begin
  FBitmap.Assign(Value);
end;

procedure TDefineImage.SetStretch(Value: Boolean);
begin
  if Value <> FStretch then
  begin
	FStretch := Value;
	PictureChanged(Self);
  end;
end;

procedure TDefineImage.SetTransparent(Value: Boolean);
begin
  if Value <> FTransparent then
  begin
	 FTransparent := Value;
	 PictureChanged(Self);
  end;
end;

procedure TDefineImage.SetProportional(Value: Boolean);
begin
  if FProportional <> Value then
  begin
	FProportional := Value;
	PictureChanged(Self);
  end;
end;

procedure TDefineImage.PictureChanged(Sender: TObject);
var
  G: TGraphic;
  D : TRect;
begin
  if AutoSize and (Bitmap.Width > 0) and (Bitmap.Height > 0) then
	SetBounds(Left, Top, Bitmap.Width, Bitmap.Height);
  G := Bitmap;
  if G <> nil then
  begin
	if not ((G is TMetaFile) or (G is TIcon)) then
	  G.Transparent := FTransparent;
  D := DestRect;
	if (not G.Transparent) and (D.Left <= 0) and (D.Top <= 0) and
	   (D.Right >= Width) and (D.Bottom >= Height) then
	  ControlStyle := ControlStyle + [csOpaque]
	else  // picture might not cover entire clientrect
	  ControlStyle := ControlStyle - [csOpaque];
	if DoPaletteChange and FDrawing then Update;
  end
  else ControlStyle := ControlStyle - [csOpaque];
  if not FDrawing then Invalidate;
end;

function TDefineImage.CanAutoSize(var NewWidth, NewHeight: Integer): Boolean;
begin
  Result := True;
  if not (csDesigning in ComponentState) or (Bitmap.Width > 0) and
    (Bitmap.Height > 0) then
  begin
    if Align in [alNone, alLeft, alRight] then
       NewWidth := Bitmap.Width;
    if Align in [alNone, alTop, alBottom] then
       NewHeight := Bitmap.Height;
  end;
end;

{ TDefineTimer }

constructor TDefineTimer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FEnabled := True;
  FInterval := 50;
{$IFDEF MSWINDOWS}
  FHandle := Classes.AllocateHWnd(WndProc);
{$ENDIF}
{$IFDEF LINUX}
  FHandle := WinUtils.AllocateHWnd(WndProc);
{$ENDIF}
end;

destructor TDefineTimer.Destroy;
begin
  FEnabled := False;
  UpdateTimer;
{$IFDEF MSWINDOWS}
  Classes.DeallocateHWnd(FHandle);
{$ENDIF}
{$IFDEF LINUX}
  WinUtils.DeallocateHWnd(FHandle);
{$ENDIF}
  inherited Destroy;
end;

procedure TDefineTimer.WndProc(var Msg: TMessage);
begin
  with Msg do
    if Msg = WM_TIMER then
      try
        Timer;
      except
        Application.HandleException(Self);
      end
    else
      Result := DefWindowProc(FHandle, Msg, wParam, lParam);
end;

procedure TDefineTimer.UpdateTimer;
begin
  KillTimer(FHandle, 1);
  if (FInterval <> 0) and FEnabled and Assigned(FOnTimer) then
    if SetTimer(FHandle, 1, FInterval, nil) = 0 then
      raise EOutOfResources.Create(SNoTimers);
end;

procedure TDefineTimer.SetEnabled(Value: Boolean);
begin
  if Value <> FEnabled then
  begin
    FEnabled := Value;
    UpdateTimer;
  end;
end;

procedure TDefineTimer.SetInterval(Value: Cardinal);
begin
  if Value <> FInterval then
  begin
    FInterval := Value;
    UpdateTimer;
  end;
end;

procedure TDefineTimer.SetOnTimer(Value: TNotifyEvent);
begin
  FOnTimer := Value;
  UpdateTimer;
end;

procedure TDefineTimer.Timer;
begin
  if Assigned(FOnTimer) then FOnTimer(Self);
end;

{ TDefineWater }
const
  RAND_MAX = $7FFF;

constructor TDefineWater.Create(AOwner: TComponent);
begin
  FBitmap    := TBitmap.Create;
  FWater     := TDefineWatet.Create;
  FItems     := TStringList.Create;
  inherited Create(AOwner);
  FDamping   := csDefDamping;
  FPlayState := true;
  OnTimer    := Play;
end;

destructor TDefineWater.Destroy;
begin
  FItems.Free;
  FWater.Free;
  FBitmap.Free;
  inherited Destroy;
end;

procedure TDefineWater.OnMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  FWater.Blob(x,y,1,5000);
end;

procedure TDefineWater.SetDamping(Value: TWaterDamping);
begin
  if (Value >= Low(TWaterDamping)) and (Value <= High(TWaterDamping)) then
  begin
    FDamping       := Value;
    FWater.Damping := Value;
  end;
end;

procedure TDefineWater.InitiateWater;
begin
  FBitmap.Assign(FImage.Bitmap);
  FImage.OnMouseMove := OnMouseMove;
  with FImage do
  begin
   Bitmap.FreeImage;
   Bitmap.Width  := FBitmap.Width;
   Bitmap.Height := FBitmap.Height;
  end;
  FWater.SetSize(FBitmap);
  FState     := FBitmap.Height;
  FPlayState := false;
end;

procedure TDefineWater.Play;
var
  TitleValue:String;
  Inx,Cur: Integer;
begin
  if (FImage <> nil)and(not(csDesigning in ComponentState)) then
  begin
  if FPlayState then
     InitiateWater;
  if Random(8)= 1 then
     FWater.Blob(-1,-1,Random(1)+1,Random(500)+50);
  FWater.Render(Bitmap,FImage.Bitmap);
  FState:=FState-1;
  if FState<-100 then
     FState:=FImage.height+10;
  with FImage.Canvas do
    begin
      Brush.Style:=bsClear;
      Cur := FState;
      for inx:=0 to FItems.Count - 1 do
      begin
       TitleValue := FItems.Strings[inx];
       GetTitleParam(FParam, TitleValue);
       Font.Name  := FParam.Name;
       Font.Size  := FParam.Size;
       Font.Style := FParam.Style;
       Font.Pitch := FParam.Pitch;
       if FParam.Draw3D then
       begin
          Font.Color := 0;
          TextOut((FImage.Width - TextWidth(TitleValue))div 2+1,Cur+1,TitleValue);
       end;
       Font.Color := FParam.Color;
       TextOut((FImage.Width - TextWidth(TitleValue))div 2,Cur,TitleValue);
       Cur := Cur+TextHeight('H')+FParam.Row;
      end;
      if FItems.Count <= 0 then
      begin
         TextOut((FImage.Width - TextWidth(''))div 2,Cur,'');
      end;
    end;
  end;
end;

procedure TDefineWater.SetItems(const Value: TStringList);
begin
  FItems.Assign(Value);
end;

end.
