// ****************************************************************************
// * An Outlook style sidebar component for Delphi.
// ****************************************************************************
// * Copyright 2002, Bitvadász Kft. Hungary . All Rights Reserved.
// ****************************************************************************
// * Feel free to contact me if you have any questions, comments or suggestions
// * at support@maxcomponents.net
// ****************************************************************************
// * Web page: www.maxcomponents.net
// ****************************************************************************
// * Date last modified: 11.10.2002
// ****************************************************************************
// * TmxOutlookBarPro v2.13
// ****************************************************************************
// * Description:
// *
// * The TmxOutlookBarPro 100% native VCL  component with many added features to
// * support the look, feel, and behavior introduced in Microsoft  Office 97,
// * 2000, and new Internet Explorer. It has got many features  including
// * scrolling headers, icon  highlighting and positioning, small and large
// * icons,gradient and bitmap Backgrounds. The header sections and buttons
// * can be  added, deleted and  moved  at design time. The  header tabs can
// * have individual  font,  alignment,  tabcolor,  glyph, tiled Background
// * images. And many many more posibilities.
// *
// * This component is an advanced version of original TmxOutlookBar, but
// * please note that this release is not compible to the old one.
// *
// ****************************************************************************

Unit mxOutlookBarPro;

Interface

// *************************************************************************************
// ** List of used units
// *************************************************************************************

{$I MAX.INC}

Uses Windows,
  Classes,
  Graphics,
  SysUtils,
  Controls,
  Messages,
  Forms,
  CommCtrl,
  Stdctrls,
  Buttons,
  Menus,
  Extctrls,
  ActnList,
  Imglist,
  ActiveX,
  Consts;

Const
  mxOutlookVersion = $020D; // ** 2.13 **
  SubRelease = '';
  DefaultHeaderHeight = 22;
  DefaultExplorerAddon = 12;

  // the OutlookBar's own clipboard formats,
  CFSTR_MXOUTLOOKBARPRO = 'mxOutlookBarPro Resource';
  CFSTR_MXOUTLOOKBARPROREFERENCE = 'mxOutlookBarPro Reference';

Const
  mxStreamData = 1;
  ButtonStreamData = 2;

Const
  CloseTimer = 1;
  ScrollTimer = 2;
  ChangeTimer = 3;
  ButtonTimer = 4;
  AlertTimer = 5;

Resourcestring

  sDuplicatedHeaderName = 'This bar already contains header with name %s'#10#13'Please type another one to continue.';
  sDuplicatedButtonName = 'This header already contains button with name %s'#10#13'Please type another one to continue.';
  SEtcInvalidItem = 'FormatEtcList: Invalid item index.';

Type
  TStreamDataHeader = Record
    DataType: Integer;
    DataSize: Integer;
  End;

  TBaseStreamDataBody = Packed Record
    HeaderIndex: Integer;
    ButtonIndex: Integer;
  End;

  TBaseStreamData = Packed Record
    Header: TStreamDataHeader;
    Body: TBaseStreamDataBody;
  End;

  mxNavigatorException = Exception;

  TmxHeaderScrollType = (
    stNone,
    stLinear,
    stAccelerated );

  TmxBitmapCopy = (
    bcMergeCopy,
    bcMergePaint,
    bcSrcCopy,
    bcSrcErase,
    bcSrcPaint );

  TmxBackgroundStyle = (
    btBitmap,
    btGradient,
    btSolid,
    btTileBitmap,
    btTransparent );

  TmxGradientDirection = (
    gdNormal,
    gdInverse
    );

  TmxGradientStyle = (
    gtCornerTopLeft,
    gtCornerTopRight,
    gtCornerBottomRight,
    gtCornerBottomLeft,
    gtDiagonalRising,
    gtDiagonalFalling,
    gtEllipse,
    gtPyramid,
    gtVerticalToCenter,
    gtHorizontalToCenter,
    gtLeftToRight,
    gtTopToBottom );

  TmxVerticalAlignment = (
    vaTopJustify,
    vaCenter,
    vaBottomJustify );

  TmxViewStyle = (
    vsExplorerBar,
    vsOutlook );

  TmxButtonStyle = (
    bsLarge,
    bsSmall );

  TmxButtonView = (
    bvBig,
    bvExplorer,
    bvNormal,
    bvToolBox,
    bvWindows2000,
    bvWindowsXP );

  TmxButtonState = (
    hbsUp,
    hbsDown,
    hbsFocused,
    hbsDisabled );

  TmxButtonKind = (
    bkButton,
    bkLabel,
    bkCheckBox,
    bkPushButton,
    bkRadioButton );

  TmxGlyphLayout = (
    glGlyphLeft,
    glGlyphRight,
    glGlyphCenter );

  TmxHeaderOption = (
    hoActivateOnSelect,
    hoAlwaysFlat,
    hoButtonDown,
    hoCustomSettings,
    hoDrawBorder,
    hoDrawCaptionBorder,
    hoDrawDisabledButton,
    hoDrawDownButton,
    hoDrawFocusedButton,
    hoFocusDisabled,
    hoNoCaption,
    hoReadOnlyCaption,
    hoRoundedHeader,
    hoShowSelectedImage,
    hoShowStatusButton,
    hoUseHighlightFont );

  TmxHeaderOptions = Set Of TmxHeaderOption;

  TmxCaptionStyle = (
    csButtonStyle,
    csCustomDraw
    );

  TmxExplorerMethod = (
    emStandard,
    emCloseUp
    );

  TmxBarOption = (
    boAcceptOLEDrop,
    boActivateToolBoxScroller,
    boAlwaysFlatScroller,
    boAutoScroll,
    boAutoChangeHeader,
    boChangeToDisabled,
    boExplorerBorder,
    boFocusOnMouseEnter,
    boHeaderFrame,
    boInternalDrop,
    hoShowFocusRect
    );

  TmxBarOptions = Set Of TmxBarOption;

  TmxHeaderState = (
    hsOpened,
    hsClosed
    );

  TmxBorderStyle = (
    mxNone,
    mxFlat,
    mxFocusedFlat,
    mxSolid,
    mxSingle,
    mxButton,
    mxDefault,
    mxFlatButton,
    mxFlatButtonDown,
    mxSpeedUp );

  TmxButtonOption = (
    boAutoWidthLabel,
    boCustomFont,
    boCustomStyle,
    boCustomView,
    boUnderlineFont,
    boReadOnlyCaption
    );

  TmxButtonOptions = Set Of TmxButtonOption;

  TmxScrollView = (
    ssNormal,
    ssExpress,
    ssToolBox
    );

  TmxPreSet = (
    psOutlook,
    psFlatOutlook,
    psOutlookExpress,
    psOffice,
    psOfficeXP,
    psOffice2000,
    psToolBox,
    psFlatToolBox,
    psExplorerBar,
    psExplorerBarXP,
    psExplorerBar2000
    );

  // Modes to determine drop position further
  TmxDropMode = (
    dmNowhere,
    dmButton
    );

  TmxOutlookBarStates = Set Of (
    tsDragPending,
    tsDragging,
    tsClearPending
    );

  PCardinal = ^Cardinal;

  TmxHitPosition = (
    hpUnknown,
    hpAbove,
    hpInsert,
    hpBelow
    );

  TmxHitType = (
    xhtNowhere,
    xhtHeaderButton,
    xhtHeaderBackground,
    xhtButton
    );

  TmxGlyphPosition = (
    gpTopLeft,
    gpTopRight,
    gpBottomLeft,
    gpBottomRight,
    gpCenter
    );

Var
  CF_OUTLOOKBARPRO,
    CF_OUTLOOKBARPROREFERENCE: Word;

  StandardOLEFormat: TFormatEtc = (
    cfFormat: 0;
    ptd: Nil;
    dwAspect: DVASPECT_CONTENT;
    lindex: - 1;
    tymed: TYMED_HGLOBAL
    );

// ************************************************************************
// ************************************************************************
// ************************************************************************

Type

  TmxButton = Class;
  TmxButtons = Class;
  TmxHeader = Class;
  TmxHeaders = Class;
  TmxOutlookBarPro = Class;

  PmxReference = ^TmxReference;
  TmxReference = Record
    Process: Cardinal;
    Bar: TmxOutlookBarPro;
  End;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxEventDrawHeaderButtons = Procedure( Sender: TObject; ACanvas: TCanvas; ARect: TRect; ActiveIndex: Integer ) Of Object;
  TmxEventDrawButton = Procedure( Sender: TObject; ACanvas: TCanvas; ARect: TRect; AState: TmxButtonState ) Of Object;
  TmxEventDrawStatusButton = Procedure( Sender: TObject; ACanvas: TCanvas; ARect: TRect; AState: TmxHeaderState ) Of Object;
  TmxEventDrawHeader = Procedure( Sender: TObject; ACanvas: TCanvas; ARect: TRect ) Of Object;
  TmxEventHeaderChange = Procedure( Sender: TObject; OldIndex, NewIndex: Integer ) Of Object;
  TmxEventCanChangeHeader = Procedure( Sender: TObject; NewHeader: TmxHeader; Var CanChange: Boolean ) Of Object;
  TmxEventChangeViewStyle = Procedure( Sender: TObject; OldStyle, NewStyle: TmxViewStyle; Var CanChange: Boolean ) Of Object;
  TmxEventCheckScroll = Procedure( Sender: TObject; Var ScrollUpNeed, ScrollDownNeed, Automatic: Boolean ) Of Object;
  TmxEventBeforeDrawCommandButton = Procedure( Sender: TObject; ACanvas: TCanvas; Var AButtonRect: TRect; Var AFocusRect: TRect; Var AImageRect: TRect; Var ALabelRect: TRect ) Of Object;
  TmxEventDrawCommandButton = Procedure( Sender: TObject; ACanvas: TCanvas; AView: TmxButtonView; AState: TmxButtonState; AImageRect: TRect; ALabelRect: TRect ) Of Object;
  TmxEventAfterDrawCommandButton = Procedure( Sender: TObject; ACanvas: TCanvas; AImageRect: TRect; ALabelRect: TRect ) Of Object;
  TmxEventAfterChangeStyle = Procedure( Sender: TObject; NewStyle: TmxPreSet ) Of Object;
  TmxEventDragAllowed = Procedure( Sender: TmxOutlookBarPro; Button: TmxButton; Var Allowed: Boolean ) Of Object;
  TmxEventDragOver = Procedure( Sender: TmxOutlookBarPro; Source: TObject; Shift: TShiftState; State: TDragState; Pt: TPoint; Mode: TmxDropMode; Var Effect: Integer; Var Accept: Boolean ) Of Object;
  TmxEventDragEnter = Procedure( Sender: TmxOutlookBarPro; DataObject: IDataObject; Source: TObject; Shift: TShiftState; State: TDragState; Pt: TPoint; Mode: TmxDropMode; Var Effect: Integer; Var Accept: Boolean ) Of Object;
  TmxEventDragDrop = Procedure( Sender: TmxOutlookBarPro; Source: TObject; DataObject: IDataObject; Const Formats: Array Of Word; Shift: TShiftState; Pt: TPoint; Var Effect: Integer; Mode: TmxDropMode ) Of Object;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxFormatEtcArray = Array Of TFormatEtc;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxFormatEtcList = Class
  Private

    FList: TmxFormatEtcArray;

    Function Get( Index: Integer ): TFormatEtc;
    Procedure Put( Index: Integer; Item: TFormatEtc );
    Function GetCount: Integer;

  Public

    Function Add( Item: TFormatEtc ): Integer;
    Procedure Clear;
    Procedure Delete( Index: Integer );
    Function Clone: TmxFormatEtcList;

    Property Count: Integer Read GetCount;
    Property Items[ Index: Integer ]: TFormatEtc Read Get Write Put;

  End;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxEnumFormatEtc = Class( TInterfacedObject, IEnumFormatEtc )
  Protected

    FFormatEtcList: TmxFormatEtcList;
    FCurrentIndex: Integer;

  Public

    Constructor Create( FormatEtcList: TmxFormatEtcList );
    Destructor Destroy; Override;

    Function Next( Celt: Integer; Out Elt; PCeltFetched: PLongint ): HResult; Stdcall;
    Function Skip( Celt: Integer ): HResult; Stdcall;
    Function Reset: HResult; Stdcall;
    Function Clone( Out Enum: IEnumFormatEtc ): HResult; Stdcall;

  End;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxDragDropManager = Class( TInterfacedObject, IDataObject, IDropSource, IDropTarget )
  Private

    FFormatEtcList: TmxFormatEtcList;
    FOwner, FDragSource: TmxOutlookBarPro;

  Public

    // TObject implementation
    Constructor Create( AOwner: TmxOutlookBarPro ); Virtual;
    Destructor Destroy; Override;

    // IUnknown
    // implement this method to get notified of interface releases (others are implemented in TInterfacedObject)
    Function _Release: Integer; Stdcall;

    // IDataObject implementation
    Function DAdvise( Const FormatEtc: TFormatEtc; advf: Integer; Const advSink: IAdviseSink; Out dwConnection: Integer ): HResult; Stdcall;
    Function DUnadvise( dwConnection: Integer ): HResult; Stdcall;
    Function EnumDAdvise( Out enumAdvise: IEnumStatData ): HResult; Stdcall;
    Function EnumFormatEtc( Direction: Integer; Out EnumFormatEtc: IEnumFormatEtc ): HResult; Stdcall;
    Function GetCanonicalFormatEtc( Const FormatEtc: TFormatEtc; Out FormatEtcOut: TFormatEtc ): HResult; Stdcall;
    Function GetData( Const FormatEtcIn: TFormatEtc; Out Medium: TStgMedium ): HResult; Stdcall;
    Function GetDataHere( Const FormatEtc: TFormatEtc; Out Medium: TStgMedium ): HResult; Stdcall;
    Function QueryGetData( Const FormatEtc: TFormatEtc ): HResult; Stdcall;
    Function RenderData( FormatEtc: TFormatEtc; Var StgMedium: TStgMedium ): HResult; Virtual;
    Function SetData( Const FormatEtc: TFormatEtc; Var Medium: TStgMedium; DoRelease: BOOL ): HResult; Stdcall;

    // IDropSource implementation
    Function GiveFeedback( Effect: Integer ): HResult; Stdcall;
    Function QueryContinueDrag( EscapePressed: BOOL; KeyState: Integer ): HResult; Stdcall;

    // IDropTarget implementation
    Function DragEnter( Const DataObject: IDataObject; KeyState: Integer; Pt: TPoint; Var Effect: Integer ): HResult; Stdcall;
    Function DragOver( KeyState: Integer; Pt: TPoint; Var Effect: Integer ): HResult; Stdcall;
    Function DragLeave: HResult; Stdcall;
    Function Drop( Const DataObject: IDataObject; KeyState: Integer; Pt: TPoint; Var Effect: Integer ): HResult; Stdcall;

    // TmxDropManager implementation
    Property DragSource: TmxOutlookBarPro Read FDragSource;

    Function GetDataSourceTree( DataObject: IDataObject ): TmxOutlookBarPro;
    Procedure SetOLEFormats;
  End;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxButtonActionLink = Class( TControlActionLink )
  Protected

    FClient: TmxButton;

    Procedure AssignClient( AClient: TObject ); Override;
    Function IsCaptionLinked: Boolean; Override;
    Function IsEnabledLinked: Boolean; Override;
    Function IsHelpContextLinked: Boolean; Override;
    Function IsHintLinked: Boolean; Override;
    Function IsImageIndexLinked: Boolean; Override;
    Function IsVisibleLinked: Boolean; Override;
    Function IsOnExecuteLinked: Boolean; Override;
    Procedure SetCaption( Const AValue: String ); Override;
    Procedure SetEnabled( AValue: Boolean ); Override;
    Procedure SetHelpContext( AValue: THelpContext ); Override;
    Procedure SetHint( Const AValue: String ); Override;
    Procedure SetImageIndex( AValue: Integer ); Override;
    Procedure SetVisible( AValue: Boolean ); Override;
    Procedure SetOnExecute( AValue: TNotifyEvent ); Override;
  End;

  TmxButtonActionLinkClass = Class Of TmxButtonActionLink;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxBorder = Class( TPersistent )
  Private

    FRect: TRect;
    FSeparator: Word;

    FOnChangeParameter: TNotifyEvent;

    Procedure SetData( Index: Integer; AValue: Word );
    Function GetData( Index: Integer ): Word;

  Protected

    Procedure Change; Dynamic;

  Public

    Property GetAsRect: TRect Read FRect;

    Constructor Create; Virtual;

    Procedure Assign( Source: TPersistent ); Override;
    Procedure AssignTo( Destination: TPersistent ); Override;

  Published

    Property Bottom: Word Index 2 Read GetData Write SetData Default 0;
    Property Left: Word Index 3 Read GetData Write SetData Default 0;
    Property Right: Word Index 4 Read GetData Write SetData Default 0;
    Property Separator: Word Index 5 Read GetData Write SetData Default 0;
    Property Top: Word Index 1 Read GetData Write SetData Default 0;

    Property OnChangeParameter: TNotifyEvent Read FOnChangeParameter Write FOnChangeParameter;

  End;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxButtonImages = Class( TPersistent )
  Private

    FHot: TCustomImageList;
    FHotChangeLink: TChangeLink;
    FHotSmall: TCustomImageList;
    FHotSmallChangeLink: TChangeLink;

    FDisabled: TCustomImageList;
    FDisabledChangeLink: TChangeLink;
    FDisabledSmall: TCustomImageList;
    FDisabledSmallChangeLink: TChangeLink;

    FNormal: TCustomImageList;
    FNormalChangeLink: TChangeLink;
    FSmall: TCustomImageList;
    FSmallChangeLink: TChangeLink;

    FOwnerComponent: TComponent;

    FOnChangeParameter: TNotifyEvent;

    Procedure SetImages( Index: Integer; AValue: TCustomImageList );
    Procedure ImageListChange( Sender: TObject );

  Protected

    Procedure Change; Dynamic;

  Public

    Constructor Create( AOwner: TComponent ); Virtual;
    Destructor Destroy; Override;

    Procedure Assign( Source: TPersistent ); Override;
    Procedure AssignTo( Destination: TPersistent ); Override;

  Published

    Property Hot: TCustomImageList Index 2 Read FHot Write SetImages;
    Property HotSmall: TCustomImageList Index 4 Read FHotSmall Write SetImages;
    Property Normal: TCustomImageList Index 1 Read FNormal Write SetImages;
    Property Small: TCustomImageList Index 3 Read FSmall Write SetImages;
    Property Disabled: TCustomImageList Index 5 Read FDisabled Write SetImages;
    Property DisabledSmall: TCustomImageList Index 6 Read FDisabledSmall Write SetImages;

    Property OnChangeParameter: TNotifyEvent Read FOnChangeParameter Write FOnChangeParameter;

  End;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxHeaderImages = Class( TPersistent )
  Private

    FHot: TCustomImageList;
    FHotChangeLink: TChangeLink;
    FNormal: TCustomImageList;
    FNormalChangeLink: TChangeLink;
    FOwnerComponent: TComponent;

    FOnChangeParameter: TNotifyEvent;

    Procedure SetImages( Index: Integer; AValue: TCustomImageList );
    Procedure ImageListChange( Sender: TObject );

  Protected

    Procedure Change; Dynamic;

  Public

    Constructor Create( AOwner: TComponent ); Virtual;
    Destructor Destroy; Override;

    Procedure Assign( Source: TPersistent ); Override;
    Procedure AssignTo( Destination: TPersistent ); Override;

  Published

    Property Hot: TCustomImageList Index 2 Read FHot Write SetImages;
    Property Normal: TCustomImageList Index 1 Read FNormal Write SetImages;

    Property OnChangeParameter: TNotifyEvent Read FOnChangeParameter Write FOnChangeParameter;

  End;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxGradient = Class( TPersistent )
  Private

    FOldRect: TRect;
    FDirection: TmxGradientDirection;
    FBeginColor: TColor;
    FEndColor: TColor;
    FGradientStyle: TmxGradientStyle;
    FColorTable: Array[ 0..255 ] Of Longint;
    FBitmap: TBitmap;

    FOnChangeParameter: TNotifyEvent;

    Procedure SetColor( Index: Integer; AValue: TColor );
    Procedure SetGradientStyle( AValue: TmxGradientStyle );
    Procedure SetDirection( AValue: TmxGradientDirection );

    Procedure InternalDrawGradient( ACanvas: TCanvas; X, Y, Width, Height: Integer );

  Protected

    Procedure LoadColors;
    Procedure Change; Dynamic;

  Public

    Property GradientBitmap: TBitmap Read FBitmap;

    Constructor Create; Virtual;
    Destructor Destroy; Override;

    Procedure DrawGradient( ACanvas: TCanvas; ARect: TRect ); Virtual;

    Procedure Assign( Source: TPersistent ); Override;
    Procedure AssignTo( Destination: TPersistent ); Override;

  Published

    Property BeginColor: TColor Index 1 Read FBeginColor Write SetColor Default clBlack;
    Property DrawStyle: TmxGradientStyle Read FGradientStyle Write SetGradientStyle Default gtLeftToRight;
    Property Direction: TmxGradientDirection Read FDirection Write SetDirection Default gdNormal;
    Property EndColor: TColor Index 2 Read FEndColor Write SetColor Default clBlue;

    Property OnChangeParameter: TNotifyEvent Read FOnChangeParameter Write FOnChangeParameter;

  End;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxCustomBackground = Class( TPersistent )
  Private

    FBackgroundBitmap: TBitmap;
    FAlphaBlend: Byte;
    FBitmapCopy: TmxBitmapCopy;
    FBackgroundStyle: TmxBackgroundStyle;
    FColor: TColor;
    FDrawing: Boolean;
    FGradient: TmxGradient;
    FGrayscale: Boolean;

    FOnChangeParameter: TNotifyEvent;

    Procedure SetBackgroundBitmap( AValue: TBitmap );
    Procedure SetBitmapCopy( AValue: TmxBitmapCopy );
    Procedure SetAlphaBlend( AValue: Byte );
    Procedure SetBackgroundStyle( AValue: TmxBackgroundStyle );
    Procedure SetColor( AValue: TColor );
    Procedure SetGrayscale( AValue: Boolean );
    Procedure SetOnChangeParameter( AValue: TNotifyEvent );

  Protected

    Procedure DrawSolidBackground( ACanvas: TCanvas; ARect: TRect ); Virtual;
    Procedure DrawBitmapBackground( ACanvas: TCanvas; ARect: TRect; Tiled: Boolean ); Virtual;
    Procedure AlphaBlendBackground( DrawBitmap: TBitmap; Const ARect: TRect ); Virtual;
    Procedure ConvertToGrayScale( DrawBitmap: TBitmap; ARect: TRect ); Virtual;

    Procedure Change; Dynamic;

    Property AlphaBlend: Byte Read FAlphaBlend Write SetAlphaBlend Default 0;
    Property Bitmap: TBitmap Read FBackgroundBitmap Write SetBackgroundBitmap;
    Property BitmapCopy: TmxBitmapCopy Read FBitmapCopy Write SetBitmapCopy Default bcSrcCopy;
    Property Color: TColor Read FColor Write SetColor Default clBtnFace;
    Property Gradient: TmxGradient Read FGradient Write FGradient;
    Property Grayscale: Boolean Read FGrayscale Write SetGrayscale Default False;
    Property Style: TmxBackgroundStyle Read FBackgroundStyle Write SetBackgroundStyle Default btSolid;

  Public

    Constructor Create; Virtual;
    Destructor Destroy; Override;

    Procedure DrawBackground( DrawBitmap: TBitmap; ARect: TRect ); Virtual;

    Procedure Assign( Source: TPersistent ); Override;
    Procedure AssignTo( Destination: TPersistent ); Override;

    Property OnChangeParameter: TNotifyEvent Read FOnChangeParameter Write SetOnChangeParameter;

  End;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxBackground = Class( TmxCustomBackground )
  Published

    Property AlphaBlend;
    Property Bitmap;
    Property BitmapCopy;
    Property Color;
    Property Gradient;
    Property Grayscale;
    Property Style;

    Property OnChangeParameter;

  End;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxButtonBackground = Class( TmxBackground )
  Public

    Constructor Create; Override;

  End;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxGlyph = Class( TPersistent )
  Private

    FPosition: TmxGlyphPosition;
    FBitmap: TBitmap;
    FDrawing: Boolean;
    FTransparent: Boolean;
    FVisible: Boolean;

    FOnChangeParameter: TNotifyEvent;

    Procedure SetTransparent( AValue: Boolean );
    Procedure SetVisible( AValue: Boolean );
    Procedure SetPosition( AValue: TmxGlyphPosition );
    Procedure SetBitmap( AValue: TBitmap );
    Procedure SetOnChangeParameter( AValue: TNotifyEvent );

  Protected

    Procedure Change; Virtual;

  Public

    Constructor Create; Virtual;
    Destructor Destroy; Override;

    Procedure DrawGlyph( DrawBitmap: TBitmap; ARect: TRect );

    Procedure Assign( Source: TPersistent ); Override;
    Procedure AssignTo( Destination: TPersistent ); Override;

  Published

    Property Position: TmxGlyphPosition Read FPosition Write SetPosition Default gpBottomRight;
    Property Bitmap: TBitmap Read FBitmap Write SetBitmap;
    Property Transparent: Boolean Read FTransparent Write SetTransparent Default True;
    Property Visible: Boolean Read FVisible Write SetVisible Default True;

    Property OnChangeParameter: TNotifyEvent Read FOnChangeParameter Write SetOnChangeParameter;

  End;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxStatusButton = Class( TPersistent )
  Private

    FArrowColor: TColor;
    FBackground: TColor;
    FBorderColor: TColor;
    FTransparent: Boolean;

    FOnChangeParameter: TNotifyEvent;

    Procedure SetTransparent( AValue: Boolean );
    Procedure SetColor( Index: Integer; AValue: TColor );
    Function GetColor( Index: Integer ): TColor;

  Protected

    Procedure Change; Dynamic;

  Public

    Constructor Create; Virtual;

    Procedure Assign( Source: TPersistent ); Override;
    Procedure AssignTo( Destination: TPersistent ); Override;

  Published

    Property ArrowColor: TColor Index 1 Read GetColor Write SetColor;
    Property Background: TColor Index 2 Read GetColor Write SetColor;
    Property BorderColor: TColor Index 3 Read GetColor Write SetColor;
    Property Transparent: Boolean Read FTransparent Write SetTransparent Default False;

    Property OnChangeParameter: TNotifyEvent Read FOnChangeParameter Write FOnChangeParameter;

  End;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxXPColors = Class( TPersistent )
  Private

    FBorderColor: TColor;
    FBackground: TColor;
    FPressedBackground: TColor;
    FShadowColor: TColor;
    FUseShadow: Boolean;

    FOnChange: TNotifyEvent;

    Procedure SetBorderColor( AValue: TColor );
    Procedure SetShadowColor( AValue: TColor );
    Procedure SetBackground( AValue: TColor );
    Procedure SetPressedBackground( AValue: TColor );
    Procedure SetUseShadow( AValue: Boolean );

  Protected

    Procedure Change; Dynamic;

  Public

    Constructor Create; Virtual;
    Property OnChange: TNotifyEvent Read FOnChange Write FOnChange;

    Procedure SetToDefault;

    Procedure Assign( Source: TPersistent ); Override;
    Procedure AssignTo( Destination: TPersistent ); Override;

  Published

    Property BorderColor: TColor Read FBorderColor Write SetBorderColor;
    Property Background: TColor Read FBackground Write SetBackground;
    Property PressedBackground: TColor Read FPressedBackground Write SetPressedBackground;
    Property UseShadow: Boolean Read FUseShadow Write SetUseShadow;
    Property ShadowColor: TColor Read FShadowColor Write SetShadowColor;

  End;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxBarSettings = Class( TPersistent )
  Private

    FAlignment: TAlignment;
    FButtonFont: TFont;
    FButtonHighlightFont: TFont;
    FButtonDistance: Integer;
    FPicLabDistance: Integer;
    FButtonSizes: Array[ 1..3 ] Of Integer;
    FButtonUp: TmxButtonBackground;
    FButtonDown: TmxButtonBackground;
    FButtonFocused: TmxButtonBackground;
    FButtonDisabled: TmxButtonBackground;
    FButtonStyle: TmxButtonStyle;
    FButtonView: TmxButtonView;
    FCaptionStyle: TmxCaptionStyle;
    FCaptionPen: TPen;
    FColor: TColor;
    FExplorerAddOn: Word;
    FFont: TFont;
    FGlyphTop: Integer;
    FHeight: Integer;
    FHeaderPen: TPen;
    FHighlightFont: TFont;
    FKeySupport: Boolean;
    FLayout: TmxGlyphLayout;
    FStatusButton: TmxStatusButton;
    FXPColors: TmxXPColors;

    FOnChangeParameter: TNotifyEvent;

    Procedure SetColor( AValue: TColor );
    Procedure SetAlignment( AValue: TAlignment );
    Procedure SetLayout( AValue: TmxGlyphLayout );
    Procedure SetHeight( AValue: Integer );
    Procedure SetFont( AValue: TFont );
    Procedure SetHighlightFont( AValue: TFont );
    Procedure SetButtonFont( AValue: TFont );
    Procedure SetButtonHighlightFont( AValue: TFont );
    Procedure SetCaptionPen( AValue: TPen );
    Procedure SetHeaderPen( AValue: TPen );
    Procedure SetExplorerAddOn( AValue: Word );
    Procedure SetCaptionStyle( AValue: TmxCaptionStyle );
    Procedure PropertyChanged( Sender: TObject );
    Function GetBackground( Index: Integer ): TmxButtonBackground;
    Procedure SetBackground( Index: Integer; AValue: TmxButtonBackground );
    Procedure SetStatusButton( AValue: TmxStatusButton );
    Procedure SetButtonSize( Index: Integer; AValue: Integer );
    Function GetButtonSize( Index: Integer ): Integer;
    Procedure SetButtonDistance( AValue: Integer );
    Procedure SetButtonStyle( AValue: TmxButtonStyle );
    Procedure SetButtonView( AValue: TmxButtonView );
    Procedure SetPicLabDistance( AValue: Integer );
    Procedure SetGlyphTop( AValue: Integer );
    Procedure SetKeySupport( AValue: Boolean );

  Protected

    Procedure Change; Dynamic;

  Public

    Constructor Create; Virtual;
    Destructor Destroy; Override;

    Procedure Assign( Source: TPersistent ); Override;
    Procedure AssignTo( Destination: TPersistent ); Override;

  Published

    Property Alignment: TAlignment Read FAlignment Write SetAlignment Default taCenter;
    Property ButtonUp: TmxButtonBackground Index 1 Read GetBackground Write SetBackground;
    Property ButtonDown: TmxButtonBackground Index 2 Read GetBackground Write SetBackground;
    Property ButtonFocused: TmxButtonBackground Index 3 Read GetBackground Write SetBackground;
    Property ButtonDisabled: TmxButtonBackground Index 4 Read GetBackground Write SetBackground;
    Property ButtonFont: TFont Read FButtonFont Write SetButtonFont;
    Property ButtonHighlightFont: TFont Read FButtonHighlightFont Write SetButtonHighlightFont;
    Property ButtonStyle: TmxButtonStyle Read FButtonStyle Write SetButtonStyle;
    Property ButtonView: TmxButtonView Read FButtonView Write SetButtonView;
    Property CaptionStyle: TmxCaptionStyle Read FCaptionStyle Write SetCaptionStyle Default csButtonStyle;
    Property CaptionPen: TPen Read FCaptionPen Write SetCaptionPen;
    Property Color: TColor Read FColor Write SetColor Default clbtnFace;
    Property Distance: Integer Read FButtonDistance Write SetButtonDistance Default 2;
    Property ExplorerAddOn: Word Read FExplorerAddOn Write SetExplorerAddOn;
    Property Font: TFont Read FFont Write SetFont;
    Property GlyphTop: Integer Read FGlyphTop Write SetGlyphTop Default 10;
    Property HeaderPen: TPen Read FHeaderPen Write SetHeaderPen;
    Property HighlightFont: TFont Read FHighlightFont Write SetHighlightFont;
    Property Height: Integer Read FHeight Write SetHeight;
    Property KeySupport: Boolean Read FKeySupport Write SetKeySupport Default True;
    Property Layout: TmxGlyphLayout Read FLayout Write SetLayout Default glGlyphLeft;
    Property LargeWidth: Integer Index 1 Read GetButtonSize Write SetButtonSize;
    Property LargeHeight: Integer Index 2 Read GetButtonSize Write SetButtonSize;
    Property PicLabDistance: Integer Read FPicLabDistance Write SetPicLabDistance;
    Property StatusButton: TmxStatusButton Read FStatusButton Write SetStatusButton;
    Property SmallHeight: Integer Index 3 Read GetButtonSize Write SetButtonSize;
    Property XPColors: TmxXPColors Read FXPColors Write FXPColors;

    Property OnChangeParameter: TNotifyEvent Read FOnChangeParameter Write FOnChangeParameter;

  End;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxHeader = Class( TCollectionItem )
  Private

    FFirstVisibleButton: Integer;
    FLastVisibleButton: Integer;
    FFirstButtonTop: Word;
    FButtons: TmxButtons;
    FBackground: TmxBackground;
    FGlyph: TmxGlyph;
    FBiDiMode: TBiDiMode;
    FButtonImages: TmxButtonImages;
    FButtonRect: TRect;
    FBodyRect: TRect;
    FCaption: String;
{$WARNINGS OFF}
    FData: Pointer;
{$WARNINGS ON}
    FEnabled: Boolean;
    FHeaderOptions: TmxHeaderOptions;
    FHeaderState: TmxHeaderState;
    FImageIndex: TImageIndex;
    FIndex: Integer;
    FMargin: Word;
    FName: String;
    FPopupMenu: TPopupMenu;
    FSpacing: Word;
    FState: TmxButtonState;
    FGradientRect: TRect;
    FTextRect: TRect;
    FTag: Longint;
    FTransparent: Boolean;
    FOriginalImage: TBitmap;
    FSettings: TmxBarSettings;
    FVisible: Boolean;
    FParentBar: TmxOutlookBarPro;
    FAllowSelected: Boolean;
    FSelectedIndex: Integer;

    FOnChange: TNotifyEvent;
    FOnChangeParameter: TNotifyEvent;
    FOnDrawStatusButton: TmxEventDrawStatusButton;
    FOnDrawHeaderButton: TmxEventDrawHeader;
    FOnDrawHeaderBody: TmxEventDrawHeader;
    FOnAfterDrawHeaderButton: TmxEventDrawHeader;
    FOnAfterDrawHeaderBody: TmxEventDrawHeader;
    FOnCheckScroll: TmxEventCheckScroll;

    Procedure SetEnabled( AValue: Boolean );
    Procedure SetCaption( AValue: String );
    Function GetHeaderIndex: Integer;
    Procedure SetHeaderIndex( AValue: Integer );
    Procedure SetChangeParameter( AValue: TNotifyEvent );
    Procedure SetVisible( AValue: Boolean );
    Procedure SetTransparent( AValue: Boolean );
    Procedure SetHeaderOptions( AValue: TmxHeaderOptions );
    Procedure SetImageIndex( AValue: TImageIndex );
    Procedure SetMargin( AValue: Word );
    Procedure SetSpacing( AValue: Word );
    Procedure SetBiDiMode( AValue: TBiDiMode ); Virtual;
    Function UseRightToLeftAlignment: Boolean; Dynamic;
    Function UseRightToLeftReading: Boolean;
    Function DrawTextBiDiModeFlagsReadingOnly: Longint;
    Procedure SetHeaderImage;
    Function GetHeaderImageList: TCustomImageList;
{$WARNINGS OFF}
    Procedure SetData( AValue: Pointer );
{$WARNINGS ON}
    Function GetBodyRect: TRect;
    Procedure ChangeParameter;
    Procedure SetHeaderState( AValue: TmxHeaderState );
    Function GetParentBar: TmxOutlookBarPro;
    Function GetEnabled: Boolean;
    Function GetOpened: Boolean;
    Procedure SetOpened( AValue: Boolean );
    Procedure SetButtons( AValue: TmxButtons );
    Function GetButtons: TmxButtons;
    Function GetButton( Index: Integer ): TmxButton;
    Function GetButtonCount: Integer;
    Function GetVisibleButtonCount: Integer;
    Function GetEnabledButtonCount: Integer;
    Procedure SetFirstButtonTop( AValue: Word );
    Procedure SetAllowSelected( AValue: Boolean );
    Procedure SetSelectedIndex( AValue: Integer );

    Procedure DoButtonScrollUp;
    Procedure DoButtonScrollDown;

    Function IsUpButtonNeed: Boolean;
    Function IsDownButtonNeed: Boolean;

    Function GetFirstVisibleButton: TmxButton;
    Function GetLastVisibleButton: TmxButton;

    Function HasAlertedButton: Boolean;
    Procedure SetState( AState: TmxButtonState );

    Procedure SetRadioButton( AButton: TmxButton );

  Protected

    Function GetDisplayName: String; Override;
    Procedure SetDisplayName( Const AValue: String ); Override;

    Procedure Change; Dynamic;

    Function DrawTextBiDiModeFlags( Flags: Longint ): Longint;
    Function GetSettings: TmxBarSettings;
    Function GetHeight: Integer;
    Function GetExplorerAddon: Integer;

    Procedure CalcHeaderLayout( Canvas: TCanvas; Client: TRect; Const Offset: TPoint; Const Caption: String; Alignment: TAlignment; Layout: TmxGlyphLayout; Margin, Spacing: Word; Var GlyphPos: TPoint; Var TextBounds, StatusRect: TRect; BiDiFlags: Longint ); Virtual;
    Procedure DrawHeaderGlyph( Canvas: TCanvas; Const GlyphPos: TPoint; State: TmxButtonState; Transparent: Boolean ); Virtual;
    Procedure DrawHeaderText( Canvas: TCanvas; Const Caption: String; TextBounds: TRect; State: TmxButtonState; BiDiFlags: Longint ); Virtual;
    Function DrawHeaderFace( Canvas: TCanvas; Const Client: TRect; Const Offset: TPoint; Const Caption: String; Alignment: TAlignment; Layout: TmxGlyphLayout; Margin, Spacing: Word; State: TmxButtonState; Transparent: Boolean; BiDiFlags: LongInt ): TRect; Virtual;
    Procedure DrawStatusButton( Canvas: TCanvas; Const Client: TRect );
    Procedure DrawHeaderButtons( DrawBitmap: TBitmap; Const ARect: TRect ); Virtual;

    Procedure DoAfterDrawHeaderBody( ACanvas: TCanvas; ARect: TRect ); Virtual;
    Procedure DoAfterDrawHeaderButton( ACanvas: TCanvas; ARect: TRect ); Virtual;

    Function CalculateBodyHeight( ARect: TRect ): Integer; Virtual;

  Public

    Property IsEnabled: Boolean Read GetEnabled; // *** Checks it from the parent ***
    Property ButtonRect: TRect Read FButtonRect;
    Property BodyRect: TRect Read GetBodyRect;
{$WARNINGS OFF}
    Property Data: Pointer Read FData Write SetData;
{$WARNINGS ON}
    Property ParentBar: TmxOutlookBarPro Read GetParentBar;

    Property ButtonCount: Integer Read GetButtonCount;
    Property VisibleHeaderCount: Integer Read GetVisibleButtonCount;
    Property EnabledHeaderCount: Integer Read GetEnabledButtonCount;

    Function CreateButton: Longint;
    Function AddButton: TmxButton;
    Procedure RemoveButton( AButton: TmxButton );
    Procedure DeleteButton( AButtonIndex: Integer );
    Procedure ClearButtons;

    Property Button[ Index: Integer ]: TmxButton Read GetButton;
    Function ButtonByIndex( Index: Integer ): TmxButton;
    Function ButtonByName( Name: String ): TmxButton;
    Function ButtonIndexByName( Name: String ): Integer;

    Constructor Create( ACollection: TCollection ); Override;
    Destructor Destroy; Override;

    Procedure BeginUpdate; Virtual;
    Procedure EndUpdate; Virtual;

    Procedure Assign( Source: TPersistent ); Override;
    Procedure AssignTo( Destination: TPersistent ); Override;

    Procedure DrawHeaderButton( DrawBitmap: TBitmap; Var ARect: TRect; ActiveIndex: Integer );
    Procedure DrawHeaderBody( DrawBitmap: TBitmap; Var ARect: TRect; ActiveIndex, ScrollOffset: Integer );

    Procedure RenameButton( AButton: TmxButton );
    Procedure RenameButtonByIndex( AButtonIndex: Integer );

  Published

    Property AllowSelected: Boolean Read FAllowSelected Write SetAllowSelected Default False;
    Property Background: TmxBackground Read FBackground Write FBackground;
    Property Glyph: TmxGlyph Read FGlyph Write FGlyph;
    Property Images: TmxButtonImages Read FButtonImages Write FButtonImages;
    Property Buttons: TmxButtons Read GetButtons Write SetButtons;
    Property BiDiMode: TBiDiMode Read FBiDiMode Write SetBiDiMode;
    Property Caption: String Read FCaption Write SetCaption;
    Property Enabled: Boolean Read FEnabled Write SetEnabled Default True;
    Property FirstButtonTop: Word Read FFirstButtonTop Write SetFirstButtonTop;
    Property HeaderIndex: Integer Read GetHeaderIndex Write SetHeaderIndex Default -1;
    Property HeaderState: TmxHeaderState Read FHeaderState Write SetHeaderState Default hsOpened;
    Property Settings: TmxBarSettings Read FSettings Write FSettings;
    Property ImageIndex: TImageIndex Read FImageIndex Write SetImageIndex Default -1;
    Property Margin: Word Read FMargin Write SetMargin Default 4;
    Property Name: String Read GetDisplayName Write SetDisplayName;
    Property Options: TmxHeaderOptions Read FHeaderOptions Write SetHeaderOptions;
    Property Opened: Boolean Read GetOpened Write SetOpened;
    Property PopupMenu: TPopupMenu Read FPopupMenu Write FPopupMenu;
    Property Tag: Longint Read FTag Write FTag Default 0;
    Property Transparent: Boolean Read FTransparent Write SetTransparent Default False;
    Property SelectedIndex: Integer Read FSelectedIndex Write SetSelectedIndex Default -1;
    Property Spacing: Word Read FSpacing Write SetSpacing Default 2;
    Property Visible: Boolean Read FVisible Write SetVisible Default True;

    Property OnChange: TNotifyEvent Read FOnChange Write FOnChange;
    Property OnChangeParameter: TNotifyEvent Read FOnChangeParameter Write SetChangeParameter;
    Property OnCheckScroll: TmxEventCheckScroll Read FOnCheckScroll Write FOnCheckScroll;
    Property OnDrawHeaderButton: TmxEventDrawHeader Read FOnDrawHeaderButton Write FOnDrawHeaderButton;
    Property OnDrawStatusButton: TmxEventDrawStatusButton Read FOnDrawStatusButton Write FOnDrawStatusButton;
    Property OnDrawHeaderBody: TmxEventDrawHeader Read FOnDrawHeaderBody Write FOnDrawHeaderBody;
    Property OnAfterDrawHeaderButton: TmxEventDrawHeader Read FOnAfterDrawHeaderButton Write FOnAfterDrawHeaderButton;
    Property OnAfterDrawHeaderBody: TmxEventDrawHeader Read FOnAfterDrawHeaderBody Write FOnAfterDrawHeaderBody;

  End;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxHeaders = Class( TCollection )
  Private

    FOutlookBarPro: TmxOutlookBarPro;

    Function GetHeaderItem( Index: Integer ): TmxHeader;
    Procedure SetHeaderItem( Index: Integer; AValue: TmxHeader );

  Protected

    Function GetAttrCount: Integer; Override;
    Function GetAttr( Index: Integer ): String; Override;
    Function GetItemAttr( Index, ItemIndex: Integer ): String; Override;
    Procedure SetItemName( Item: TCollectionItem ); Override;
    Procedure Update( Item: TCollectionItem ); Override;
    Function GetOwner: TPersistent; Override;

  Public

    Constructor Create( AOutlookBarPro: TmxOutlookBarPro; ItemClass: TCollectionItemClass );

    Function Add: TmxHeader;
    Property OutlookBarPro: TmxOutlookBarPro Read FOutlookBarPro;
    Property Headers[ Index: Integer ]: TmxHeader Read GetHeaderItem Write SetHeaderItem; Default;

  End;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxCloseButton = Class( TPersistent )
  Private

    FCloseHeader: TmxHeader;
    FCloseRect: TRect;
    FCloseState: TmxButtonState;

    FOnClose: TNotifyEvent;

    Procedure SetVisible( AValue: Boolean );
    Function GetVisible: Boolean;
    Procedure SetTransparent( AValue: Boolean );
    Function GetTransparent: Boolean;
    Procedure SetCaption( AValue: String );
    Function GetCaption: String;
    Procedure SetFont( AValue: TFont );
    Function GetFont: TFont;
    Procedure SetHeight( AValue: Integer );
    Function GetHeight: Integer;
    Function GetMargin: Word;
    Procedure SetMargin( AValue: Word );
    Function GetImageIndex: Integer;
    Procedure SetImageIndex( AValue: Integer );

  Public

    Property CloseRect: TRect Read FCloseRect;
    Property CloseState: TmxButtonState Read FCloseState;
    Property CloseHeader: TmxHeader Read FCloseHeader;

    Constructor Create( AOwner: TmxOutlookBarPro ); Virtual;
    Destructor Destroy; Override;

    Procedure Assign( Source: TPersistent ); Override;
    Procedure AssignTo( Destination: TPersistent ); Override;

  Published

    Property Caption: String Read GetCaption Write SetCaption;
    Property Font: TFont Read GetFont Write SetFont;
    Property Height: Integer Read GetHeight Write SetHeight;
    Property ImageIndex: Integer Read GetImageIndex Write SetImageIndex;
    Property Margin: Word Read GetMargin Write SetMargin;
    Property Transparent: Boolean Read GetTransparent Write SetTransparent;
    Property Visible: Boolean Read GetVisible Write SetVisible Default False;

    Property OnClose: TNotifyEvent Read FOnClose Write FOnClose;
  End;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxButton = Class( TCollectionItem )
  Private

    FAllowGrayed: Boolean;
    FPaintGrayed: Boolean;
    FChecked: Boolean;
    FMargin: Integer;
    FButtonKind: TmxButtonKind;
    FFlashing: Boolean;
    FAlerted: Boolean;
    FAutoSize: Boolean;
    FAlignment: TAlignment;
    FActionLink: TControlActionLink;
    FButtonStyle: TmxButtonStyle;
    FButtonView: TmxButtonView;
    FButtonRect: TRect;
    FCheckBoxRect: TRect;
    FBiDiMode: TBiDiMode;
    FImageRect: TRect;
    FFocusRect: TRect;
    FLabelRect: TRect;
    FDragDropHitStatus: TmxHitPosition;
    FCaption: String;
    FCursor: TCursor;
    FColor: TColor;
{$WARNINGS OFF}
    FData: Pointer;
{$WARNINGS ON}
    FEnabled: Boolean;
    FFont: TFont;
    FHighlightFont: TFont;
    FHelpContext: THelpContext;
    FHeight: Word;
    FHint: String;
    FImageList: TCustomImageList;
    FImageIndex: TImageIndex;
    FName: String;
    FParentBiDiMode: Boolean;
    FShowAccelChar: Boolean;
    FTag: Longint;
    FTransparent: Boolean;
    FState: TmxButtonState;
    FOptions: TmxButtonOptions;
    FUserString: String;
    FVisible: Boolean;
    FWidth: Word;
    FWordWrap: Boolean;
    FPopupMenu: TPopupMenu;
    FCheckState: TCheckBoxState;

    FOnClick: TNotifyEvent;
    FOnBeforeDrawButton: TmxEventBeforeDrawCommandButton;
    FOnDrawButton: TmxEventDrawCommandButton;
    FOnAfterDrawButton: TmxEventAfterDrawCommandButton;
    FOnChangeParameter: TNotifyEvent;

    Procedure SetChangeParameter( AValue: TNotifyEvent );
    Property OnChangeParameter: TNotifyEvent Read FOnChangeParameter Write SetChangeParameter;

    Procedure SetTransparent( AValue: Boolean );
    Procedure SetHint( AValue: String );
    Procedure SetHelpContext( AValue: THelpContext );
    Procedure SetImageIndex( AValue: TImageIndex );
    Procedure SetEnabled( AValue: Boolean );
    Procedure SetVisible( AValue: Boolean );
{$WARNINGS OFF}
    Procedure SetData( AValue: Pointer );
{$WARNINGS ON}
    Function GetAction: TBasicAction;
    Procedure SetAction( AValue: TBasicAction );
    Procedure SetCaption( AValue: String );
    Procedure DoActionChange( Sender: TObject );
    Procedure ChangeParameter;
    Function GetButtonIndex: Integer;
    Procedure SetButtonIndex( AValue: Integer );
    Procedure SetButtonStyle( AValue: TmxButtonStyle );
    Procedure SetButtonView( AValue: TmxButtonView );
    Procedure SetAutoSize( AValue: Boolean );
    Procedure SetColor( AValue: TColor );
    Procedure SetFont( AValue: TFont );
    Procedure SetHighlightFont( AValue: TFont );
    Procedure SetHeight( AValue: Word );
    Procedure SetWidth( AValue: Word );
    Procedure SetOptions( AValue: TmxButtonOptions );
    Procedure SetWordWrap( AValue: Boolean );
    Procedure SetAlignment( AValue: TAlignment );
    Procedure SetBiDiMode( AValue: TBiDiMode ); Virtual;
    Procedure SetShowAccelChar( AValue: Boolean );
    Procedure SetParentBiDiMode( AValue: Boolean ); Virtual;
    Procedure SetButtonKind( AValue: TmxButtonKind );
    Procedure SetMargin( AValue: Integer );
    Procedure SetCheckState( AValue: TCheckBoxState );
    Procedure SetChecked( AValue: Boolean );

    Function GetButtonImageList: TCustomImageList;
    Function GetSettings: TmxBarSettings;
    Function GetStyle: TmxButtonStyle;
    Function GetView: TmxButtonView;
    Procedure CalculateButtonRect( Var ButtonRect: TRect; Var ImageRect: TRect; Var FocusRect: TRect; Var LabelRect: TRect );
    Function CalculateImagePositon( ButtonRect: TRect ): TRect;
    Function CalculateSmallImagePositon( ButtonRect: TRect ): TRect;

    Function GetFont( FocusEnabled: Boolean ): TFont;
    Function IsBiDiModeStored: Boolean;
    Procedure DoClick; Virtual;
    Function GetHeaderIndex: Integer;
    Function GetHeader: TmxHeader;
    Function IsTheFirstButton: Boolean;
    Function IsTheLastButton: Boolean;

  Protected

    Property ActionLink: TControlActionLink Read FActionLink Write FActionLink;

    Function GetDisplayName: String; Override;
    Procedure SetDisplayName( Const AValue: String ); Override;

    Procedure ActionChange( Sender: TObject; CheckDefaults: Boolean ); Virtual;
    Function GetActionLinkClass: TControlActionLinkClass; Virtual;

    Procedure DrawCaption( ACanvas: TCanvas; Pushed: Boolean; Underline: Boolean ); Virtual;
    Procedure DrawCheckStyle( ACanvas: TCanvas ); Virtual;
    Procedure DrawFocusRect( ACanvas: TCanvas; Var ARect: TRect; AButtonState: TmxButtonState ); Virtual;
    Procedure DrawXPFocusRect( ACanvas: TCanvas; Var ARect: TRect; AButtonState: TmxButtonState ); Virtual;
    Procedure DrawImageRect( ACanvas: TCanvas; Var ARect: TRect; Pushed: Boolean ); Virtual;
    Procedure DrawXPImageRect( ACanvas: TCanvas; Var ARect: TRect; Pushed: Boolean ); Virtual;
    Procedure Draw( DrawBitmap: TBitmap; Var ARect: TRect; MaxBottom: Integer; Calcsize: Boolean ); Virtual;

    Procedure DoBeforeDrawButton( ACanvas: TCanvas; Var AButtonRect: TRect; Var AFocusRect: TRect; Var AImageRect: TRect; Var ALabelRect: TRect ); Virtual;
    Procedure DoDrawButton( ACanvas: TCanvas; AView: TmxButtonView; AState: TmxButtonState; AImageRect: TRect; ALabelRect: TRect ); Virtual;
    Procedure DoAfterDrawButton( ACanvas: TCanvas; AImageRect: TRect; ALabelRect: TRect ); Virtual;

  Public

    Property HitStatus: TmxHitPosition Read FDragDropHitStatus;
    Property IsFirstButton: Boolean Read IsTheFirstButton;
    Property IsLastButton: Boolean Read IsTheLastButton;
    Property HeaderIndex: Integer Read GetHeaderIndex;
    Property ButtonRect: TRect Read FButtonRect;
    Property LabelRect: TRect Read FLabelRect;

{$WARNINGS OFF}
    Property Data: Pointer Read FData Write SetData;
{$WARNINGS ON}

    Function UseRightToLeftReading: Boolean;
    Function DrawTextBiDiModeFlags( Flags: Longint ): Longint;
    Function UseRightToLeftAlignment: Boolean;
    Function DrawTextBiDiModeFlagsReadingOnly: Longint;

    Constructor Create( ACollection: TCollection ); Override;
    Destructor Destroy; Override;

    Procedure Assign( Source: TPersistent ); Override;
    Procedure AssignTo( Destination: TPersistent ); Override;

    Procedure Alert;
    Procedure StopAlert;

  Published

    Property Action: TBasicAction Read GetAction Write SetAction;
    Property AutoSize: Boolean Read FAutoSize Write SetAutoSize;
    Property Alignment: TAlignment Read FAlignment Write SetAlignment Default taCenter;
    Property AllowGrayed: Boolean Read FAllowGrayed Write FAllowGrayed;
    Property ButtonIndex: Integer Read GetButtonIndex Write SetButtonIndex;
    Property ButtonKind: TmxButtonKind Read FButtonKind Write SetButtonKind Default bkButton;
    Property ButtonStyle: TmxButtonStyle Read FButtonStyle Write SetButtonStyle;
    Property ButtonView: TmxButtonView Read FButtonView Write SetButtonView;
    Property BiDiMode: TBiDiMode Read FBiDiMode Write SetBiDiMode Stored IsBiDiModeStored;
    Property Checked: Boolean Read FChecked Write SetChecked;
    Property Caption: String Read FCaption Write SetCaption;
    Property Color: TColor Read FColor Write SetColor;
    Property Cursor: TCursor Read FCursor Write FCursor Default crDefault;
    Property CheckState: TCheckBoxState Read FCheckState Write SetCheckState;
    Property Enabled: Boolean Read FEnabled Write SetEnabled;
    Property Font: TFont Read FFont Write SetFont;
    Property HighlightFont: TFont Read FHighlightFont Write SetHighlightFont;
    Property HelpContext: THelpContext Read FHelpContext Write SetHelpContext;
    Property Height: Word Read FHeight Write SetHeight Default 20;
    Property Hint: String Read FHint Write SetHint;
    Property ImageIndex: TImageIndex Read FImageIndex Write SetImageIndex;
    Property Margin: Integer Read FMargin Write SetMargin Default 4;
    Property Name: String Read GetDisplayName Write SetDisplayName;
    Property PopupMenu: TPopupMenu Read FPopupMenu Write FPopupMenu;
    Property ShowAccelChar: Boolean Read FShowAccelChar Write SetShowAccelChar Default True;
    Property ParentBiDiMode: Boolean Read FParentBiDiMode Write SetParentBiDiMode Default True;
    Property Tag: Longint Read FTag Write FTag Default 0;
    Property Transparent: Boolean Read FTransparent Write SetTransparent;
    Property Options: TmxButtonOptions Read FOptions Write SetOptions;
    Property UserString: String Read FUserString Write FUserString;
    Property Visible: Boolean Read FVisible Write SetVisible;
    Property Width: Word Read FWidth Write SetWidth Default 20;
    Property WordWrap: Boolean Read FWordWrap Write SetWordWrap Default False;

    Property OnClick: TNotifyEvent Read FOnClick Write FOnClick;
    Property OnBeforeDrawButton: TmxEventBeforeDrawCommandButton Read FOnBeforeDrawButton Write FOnBeforeDrawButton;
    Property OnDrawButton: TmxEventDrawCommandButton Read FOnDrawButton Write FOnDrawButton;
    Property OnAfterDrawButton: TmxEventAfterDrawCommandButton Read FOnAfterDrawButton Write FOnAfterDrawButton;
  End;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxButtons = Class( TCollection )
  Private

    FOwner: TmxHeader;
    FOutlookBarPro: TmxOutlookBarPro;

    Function GetButtonItem( Index: Integer ): TmxButton;
    Procedure SetButtonItem( Index: Integer; AValue: TmxButton );

  Protected

    Function GetAttrCount: Integer; Override;
    Function GetAttr( Index: Integer ): String; Override;
    Function GetItemAttr( Index, ItemIndex: Integer ): String; Override;
    Procedure SetItemName( Item: TCollectionItem ); Override;
    Procedure Update( Item: TCollectionItem ); Override;
    Function GetOwner: TPersistent; Override;

  Public

    Constructor Create( AOutlookBarPro: TmxOutlookBarPro; AHeader: TmxHeader; ItemClass: TCollectionItemClass );

    Function Add: TmxButton;
    Property OutlookBarPro: TmxOutlookBarPro Read FOutlookBarPro;
    Property Header: TmxHeader Read FOwner;
    Property Buttons[ Index: Integer ]: TmxButton Read GetButtonItem Write SetButtonItem; Default;

  End;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxInplaceEdit = Class( TCustomEdit )
  Private

    FAlignment: TAlignment;
    FActivate: Boolean;
    FBorderColor: TColor;
    FFlat: Boolean;
    FShowBorder: Boolean;
    FMouseInHeader: boolean;
    FWordWrap: Boolean;

    Procedure WMNCPaint( Var Message: TMessage ); Message WM_NCPAINT;
    Procedure CMMouseEnter( Var Message: TMessage ); Message CM_MOUSEENTER;
    Procedure CMMouseLeave( Var Message: TMessage ); Message CM_MOUSELEAVE;
    Procedure WMSetFocus( Var Message: TWMSetFocus ); Message WM_SETFOCUS;
    Procedure WMKillFocus( Var Message: TWMKillFocus ); Message WM_KILLFOCUS;
    Procedure WMSize( Var Message: TWMSize ); Message WM_SIZE;

    Procedure DrawComponentBorder( AColor: TColor; ABorder: TColor; AStyle: TmxBorderStyle; ACanvas: TCanvas; ARect: TRect );

    Procedure SetFont( AValue: TFont );
    Function GetFont: TFont;
    Procedure SetBorderColor( AValue: TColor );
    Procedure SetFlat( AValue: Boolean );
    Procedure SetShowBorder( AValue: Boolean );
    Procedure SetWordWrap( AValue: Boolean );
    Procedure SetAlignment( AValue: TAlignment );

  Protected

    Procedure CreateParams( Var Params: TCreateParams ); Override;
    Procedure SetControlBorder;
    Procedure InvalidateControl;

  Public

    Constructor Create( AOwner: TComponent ); Override;

    Procedure Assign( Source: TPersistent ); Override;
    Procedure AssignTo( Destination: TPersistent ); Override;

  Published

    Property Alignment: TAlignment Read FAlignment Write SetAlignment Default taLeftJustify;
    Property Activate: Boolean Read FActivate Write FActivate;
    Property BorderColor: TColor Read FBorderColor Write SetBorderColor;
    Property Flat: Boolean Read FFlat Write SetFlat;
    Property ShowBorder: Boolean Read FShowBorder Write SetShowBorder;
    Property Font: TFont Read GetFont Write SetFont;
    Property WordWrap: Boolean Read FWordWrap Write SetWordWrap Default True;
    Property PopupMenu;
    Property OnContextPopup Stored False;

  End;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxInplaceEditor = Class( TPersistent )
  Private

    FHeaderEdit: Boolean;
    FEdit: TmxInplaceEdit;
    FEditingItem: TCollectionItem;
    FEditing: Boolean;
    FOnChange: TNotifyEvent;

    Procedure SetFont( AValue: TFont );
    Function GetFont: TFont;
    Function GetBorderColor: TColor;
    Procedure SetBorderColor( AValue: TColor );
    Function GetFlat: Boolean;
    Procedure SetFlat( AValue: Boolean );
    Procedure SetShowBorder( AValue: Boolean );
    Function GetShowBorder: Boolean;
    Procedure SetWordWrap( AValue: Boolean );
    Function GetWordWrap: Boolean;
    Procedure SetAlignment( AValue: TAlignment );
    Function GetAlignment: TAlignment;

    Procedure SetPopup( AValue: TPopupMenu );
    Function GetPopup: TPopupMenu;
    Procedure SetOnContextPopup( AValue: TContextPopupEvent );
    Function GetOnContextPopup: TContextPopupEvent;

    Procedure DoEndEdit( ACancel: Boolean );
    Procedure OnEditExit( Sender: TObject );
    Procedure DoEditKeyDown( Sender: TObject; Var Key: Word; Shift: TShiftState );

  Protected

    Procedure Change; Dynamic;
    Procedure DoProcessEditResults( ACancel: Boolean ); Virtual;

  Public

    Property Editing: Boolean Read FEditing;

    Constructor Create( AOwner: TmxOutlookBarPro ); Virtual;

    Procedure EditHeader( AHeader: TmxHeader );
    Procedure EditButton( AButton: TmxButton );

    Procedure Assign( Source: TPersistent ); Override;
    Procedure AssignTo( Destination: TPersistent ); Override;

  Published

    Property Alignment: TAlignment Read GetAlignment Write SetAlignment;
    Property BorderColor: TColor Read GetBorderColor Write SetBorderColor;
    Property Flat: Boolean Read GetFlat Write SetFlat;
    Property ShowBorder: Boolean Read GetShowBorder Write SetShowBorder;
    Property Font: TFont Read GetFont Write SetFont;
    Property WordWrap: Boolean Read GetWordWrap Write SetWordWrap;

    Property PopupMenu: TPopupMenu Read GetPopup Write SetPopup;
    Property OnContextPopup: TContextPopupEvent Read GetOnContextPopup Write SetOnContextPopup;

    Property OnChange: TNotifyEvent Read FOnChange Write FOnChange;

  End;

// ************************************************************************
// ************************************************************************
// ************************************************************************

  TmxOutlookBarPro = Class( TCustomControl )
  Private

    FAcceptedObject: Boolean;
    FLoaded: Boolean;
    FStopAlerting: Boolean;
    FAlertColor: TColor;
    FAlertedButton: TmxButton;
    FDropMarkColor: TColor;
    FLastDropMode: TmxDropMode;
    FDraggedButton: TmxButton;
    FDragThreshold: Integer;
    FDragStartPos: TPoint;
    FDragManager: TmxDragDropManager;
    FDragStates: TmxOutlookBarStates;
    FLastVCLDragTarget: TmxButton;
    FCurrentTargetButton: TmxButton;
    FCurrentTargetHeader: TmxHeader;
    FAutoScrollDelay: Cardinal;
    FAutoButtonScrollDelay: Cardinal;
    FAutoChangeDelay: Cardinal;
    FAlertInterval: Cardinal;

    FOnDragAllowed: TmxEventDragAllowed;
    FOnDragOver: TmxEventDragOver;
    FOnDragEnter: TmxEventDragEnter;
    FOnDragDrop: TmxEventDragDrop;

    FEachHeaderSelection: Boolean;
    FOffset: Integer;
    FScrollDown: Boolean;
    FScrollUpRect: TRect;
    FScrollUpState: TmxButtonState;
    FScrollDownRect: TRect;
    FScrollDownState: TmxButtonState;
    FButtonScrollUpRect: TRect;
    FButtonScrollUpState: TmxButtonState;
    FButtonScrollDownRect: TRect;
    FButtonScrollDownState: TmxButtonState;

    FSavedHeaderIndex: Integer;
    FActiveHeader: TmxHeader;
    FBackground: TmxBackground;
    FBevelInner: TPanelBevel;
    FBevelOuter: TPanelBevel;
    FBevelWidth: TBevelWidth;
    FBorder: TmxBorder;
    FBorderStyle: TBorderStyle;
    FCommonStyle: Boolean;
    FCloseButton: TmxCloseButton;
    FExplorerMethod: TmxExplorerMethod;
    FFlat: Boolean;
    FHeaders: TmxHeaders;
    FHeaderImages: TmxHeaderImages;
    FMouseInHeader: TmxHeader;
    FMouseInHeaderBody: TmxHeader;
    FMouseInButton: TmxButton;
    FProcessing: Boolean;
    FPainting: Boolean;
    FReCalcHeaderPositions: Boolean;
    FHeaderScrollType: TmxHeaderScrollType;
    FHeaderScrollValue: Byte;
    FHeaderScrollAcceleration: Byte;
    FSequence: Longint;
    FSettings: TmxBarSettings;
    FScrollChange: Word;
    FOptions: TmxBarOptions;
    FUpdating: Boolean;
    FUpdateCounter: Integer;
    FUpdatedHeaderIndex: Integer;
    FVersion: Integer;
    FViewStyle: TmxViewStyle;
    FEditor: TmxInplaceEditor;
    FReadyToPaint: Boolean;
    FScrollView: TmxScrollView;
    FScrollBoxSize: Word;
    FPreSet: TmxPreSet;

    FOnContextPopup: TContextPopupEvent;
    FOnEditorContextPopup: TContextPopupEvent;
    FOnChange: TmxEventHeaderChange;
    FOnCanChange: TmxEventCanChangeHeader;
    FOnChangeViewStyle: TmxEventChangeViewStyle;
    FOnDrawHeaderButtons: TmxEventDrawHeaderButtons;
    FOnAfterDrawHeaderButtons: TmxEventDrawHeaderButtons;
    FOnHide: TNotifyEvent;
    FOnShow: TNotifyEvent;
    FOnDrawCloseButton: TmxEventDrawButton;
    FOnAfterChangeStyle: TmxEventAfterChangeStyle;

    Procedure WMTimer( Var Message: TWMTimer ); Message WM_TIMER;
    Procedure WMLButtonDown( Var Message: TWMLButtonDown ); Message WM_LBUTTONDOWN;
    Procedure WMLButtonUp( Var Message: TWMLButtonUp ); Message WM_LBUTTONUP;
    Procedure WMNCDestroy( Var Message: TWMNCDestroy ); Message WM_NCDESTROY;
    Procedure WMSize( Var Message: TWMSize ); Message WM_SIZE;
    Procedure CMDesignHitTest( Var Msg: TCMDesignHitTest ); Message CM_DESIGNHITTEST;
    Procedure WMSetFocus( Var Message: TWMSetFocus ); Message WM_SETFOCUS;
    Procedure WMKillFocus( Var Message: TWMSetFocus ); Message WM_KILLFOCUS;
    Procedure CMBorderChanged( Var Message: TMessage ); Message CM_BORDERCHANGED;
    Procedure CMCtl3DChanged( Var Message: TMessage ); Message CM_CTL3DCHANGED;
    Procedure CMSysColorChange( Var Message: TMessage ); Message CM_SYSCOLORCHANGE;
    Procedure CMColorChanged( Var Message: TMessage ); Message CM_COLORCHANGED;
    Procedure CMEnabledChanged( Var Message: TMessage ); Message CM_ENABLEDCHANGED;
    Procedure CMFontChanged( Var Msg: TMessage ); Message CM_FONTCHANGED;
    Procedure CMTextChanged( Var Msg: TMessage ); Message CM_TEXTCHANGED;
    Procedure CMVisibleChanged( Var Message: TMessage ); Message CM_VISIBLECHANGED;
    Procedure CMDialogChar( Var Message: TCMDialogChar ); Message cm_DialogChar;
    Procedure CNNotify( Var Message: TWMNotify ); Message CN_NOTIFY;
    Procedure CMHintShow( Var Message: TMessage ); Message CM_HINTSHOW;
    Procedure CMDrag( Var Message: TCMDrag ); Message CM_DRAG;
    Procedure CMMouseWheel( Var Message: TCMMouseWheel ); Message CM_MOUSEWHEEL;
    Procedure WMContextMenu( Var Message: TWMContextMenu ); Message WM_CONTEXTMENU;

    Procedure SetBorderStyle( AValue: TBorderStyle );
    Procedure SetBevelInner( AValue: TPanelBevel );
    Procedure SetBevelOuter( AValue: TPanelBevel );
    Procedure SetBevelWidth( AValue: TBevelWidth );
    Procedure SetScrollView( AValue: TmxScrollView );
    Function GetHeaderCount: Integer;
    Function GetVisibleHeaderCount: Integer;
    Function GetEnabledHeaderCount: Integer;
    Procedure SetCommonStyle( AValue: Boolean );
    Procedure SetViewStyle( AValue: TmxViewStyle );
    Procedure SetFlat( AValue: Boolean );
    Procedure SetHeaderScrollType( AValue: TmxHeaderScrollType );
    Procedure SetHeaderScrollValue( AValue: Byte );
    Procedure SetHeaderScrollAcceleration( AValue: Byte );
    Procedure SetVersion( AValue: String );
    Function GetVersion: String;
    Function GetNextVisibleIndex( ActiveIndex: Integer ): Integer;
    Function GetActiveHeaderIndex: Integer;
    Procedure CheckImages( AImages: TmxButtonImages; AComponent: TComponent; Operation: TOperation );
    Procedure CheckHeaderImages( AImages: TmxHeaderImages; AComponent: TComponent; Operation: TOperation );
    Procedure PropertyChanged( Sender: TObject );
    Procedure ReadAlign( Reader: TReader );
    Procedure WriteAlign( Writer: TWriter );
    Procedure ReadIndex( Reader: TReader );
    Procedure WriteIndex( Writer: TWriter );
    Function GetOnDrawCloseHeader: TmxEventDrawHeader;
    Procedure SetOnDrawCloseHeader( AValue: TmxEventDrawHeader );
    Function GetOnAfterDrawCloseHeader: TmxEventDrawHeader;
    Procedure SetOnAfterDrawCloseHeader( AValue: TmxEventDrawHeader );
    Function GetOnClose: TNotifyEvent;
    Procedure SetOnClose( AValue: TNotifyEvent );
    Procedure SetExplorerMethod( AValue: TmxExplorerMethod );
    Procedure SetHeaders( AValue: TmxHeaders );
    Function GetHeaders: TmxHeaders;
    Function GetHeader( Index: Integer ): TmxHeader;
    Procedure SetOptions( AValue: TmxBarOptions );
    Procedure SetScrollChange( AValue: Word );
    Procedure DoScrollUp;
    Procedure DoScrollDown;
    Procedure SetInplaceEditor( AValue: TmxInplaceEditor );
    Procedure SetActiveHeader( ANewHeader: TmxHeader );
    Procedure SetScrollBoxSize( AValue: Word );
    Procedure SetBorderWidth( AValue: TBorderWidth );
    Function GetBorderWidth: TBorderWidth;
    Procedure SetPreSet( AValue: TmxPreSet );
    Procedure SetEachHeaderSelection( AValue: Boolean );
    Function ProcessOLEData( Source: TmxOutlookBarPro; DataObject: IDataObject; TargetButton: TmxButton; HitMode: TmxHitPosition; Var Effect: Integer ): Boolean;
    Procedure SetAlertedButton( AButton: TmxButton );
    Procedure SetAlertInterval( AValue: Cardinal );

    Function GetDragging: Boolean;
    Function DoDragEnter( Const DataObject: IDataObject; KeyState: Integer; Pt: TPoint; Var Effect: Integer ): HResult; Virtual;
    Function DoDragOver( Source: TObject; KeyState: Integer; DragState: TDragState; Pt: TPoint; Var Effect: Integer ): HResult; Virtual;
    Function DoDragDrop( Const DataObject: IDataObject; KeyState: Integer; Pt: TPoint; Var Effect: Integer ): HResult; Virtual;
    Procedure DoDragging( P: TPoint );
    Procedure DoDragLeave; Virtual;
    Function SuggestDropEffect( Source: TObject; Shift: TShiftState; Pt: TPoint; AllowedEffects: Integer ): Integer; Virtual;
    Function GetHitTestInfoAt( X, Y: Integer; Var HitInfo: TmxHitPosition ): TmxButton;
    Procedure StopTimer( ID: Integer );
    Function InvalidateButton( Button: TmxButton ): TRect; Virtual;
    Procedure FinishButtonHeader( Stream: TStream; StartPos, EndPos: Integer );
    Procedure WriteButton( Stream: TStream; AButton: TmxButton ); Virtual;
    Procedure WriteButtonToStream( Stream: TStream; AButton: TmxButton );
    Function GetButtonAt( X, Y: Integer ): TmxButton;
    Function GetHeaderAt( X, Y: Integer ): TmxHeader;
    Function GetButtonExactlyAt( X, Y: Integer ): TmxButton;
    Function GetHeaderButtonAt( X, Y: Integer ): TmxHeader;
    Procedure BeginDrag( Immediate: Boolean; Threshold: Integer = -1 ); Reintroduce;
    Procedure HandleMouseDown( Var Message: TWMMouse );
    Procedure HandleMouseUp( Var Message: TWMMouse );
    Procedure DoPaintDropMark( Canvas: TCanvas; R: TRect; DragDropHitStatus: TmxHitPosition ); Virtual;
    Procedure DoAutoScroll( X, Y: Integer ); Virtual;
    Procedure DoInvalidate;
    Procedure ProcessMouseLeave;

    Procedure EditorContext( Sender: TObject; MousePos: TPoint; Var Handled: Boolean );

    Procedure ConfigureOfficeBackground( Header: TmxHeader );
    Procedure ConfigureNormalBackground( BackColor: TColor; FirstTop: Integer; Header: TmxHeader );
    Procedure ConfigureExplorerBackground( BackColor: TColor; FirstTop: Integer; DrawBorder: Boolean; Header: TmxHeader );
    Procedure SetPresetHeader( AHeader: TmxHeader );

  Protected

    Procedure DoMyContextPopup( Sender: TObject; MousePos: TPoint; Var Handled: Boolean ); Dynamic;
    Procedure AdjustClientRect( Var Rect: TRect ); Override;
    Procedure CreateParams( Var Params: TCreateParams ); Override;
    Procedure Change; Dynamic;
    Procedure DefineProperties( Filer: TFiler ); Override;
    Procedure KeyDown( Var Key: Word; Shift: TShiftState ); Override;
    Procedure Notification( AComponent: TComponent; Operation: TOperation ); Override;
    Procedure MouseMove( Shift: TShiftState; X, Y: Integer ); Override;
    Procedure MouseDown( Button: TMouseButton; Shift: TShiftState; X, Y: Integer ); Override;
    Procedure MouseUp( Button: TMouseButton; Shift: TShiftState; X, Y: Integer ); Override;
    Procedure Paint; Override;

    Procedure WMEraseBkgnd( Var Message: TWMEraseBkgnd ); Message WM_ERASEBKGND;
    Procedure CMMouseEnter( Var Message: TMessage ); Message CM_MOUSEENTER;
    Procedure CMMouseLeave( Var Message: TMessage ); Message CM_MOUSELEAVE;

    Procedure Loaded; Override;
    Procedure CreateWnd; Override;

    // *** Handle Events ***

    Procedure DoChange( OldIndex, NewIndex: Integer ); Virtual;
    Procedure DoCanChange( NewHeader: TmxHeader; Var CanChange: Boolean ); Virtual;
    Function DoChangeViewStyle( Sender: TObject; OldStyle, NewStyle: TmxViewStyle ): Boolean; Virtual;
    Procedure DoDrawHeaderButtons( ACanvas: TCanvas; ARect: TRect; ActiveIndex: Integer ); Virtual;
    Procedure DoAfterDrawHeaderButtons( ACanvas: TCanvas; ARect: TRect; ActiveIndex: Integer ); Virtual;
    Procedure DoDrawCloseButton( ACanvas: TCanvas; ARect: TRect; State: TmxButtonState ); Virtual;
    Procedure DoShow; Virtual;
    Procedure DoHide; Virtual;
    Procedure DoClose; Virtual;
    Function DoBeforeDrag( AButton: TmxButton ): Boolean; Virtual;

    Procedure WndProc( Var Message: TMessage ); Override;

  Public

    Property ActiveHeaderIndex: Integer Read GetActiveHeaderIndex;
    Property MouseInControl: TmxHeader Read FMouseInHeader;
    Property HeaderCount: Integer Read GetHeaderCount;
    Property VisibleHeaderCount: Integer Read GetVisibleHeaderCount;
    Property EnabledHeaderCount: Integer Read GetEnabledHeaderCount;

    Constructor Create( AOwner: TComponent ); Override;
    Destructor Destroy; Override;

    Function CreateHeader: Longint;
    Function AddHeader: TmxHeader;
    Procedure RemoveHeader( AHeader: TmxHeader );
    Procedure DeleteHeader( AHeaderIndex: Integer );
    Procedure ClearHeaders;

    Property Header[ Index: Integer ]: TmxHeader Read GetHeader;
    Function HeaderByIndex( Index: Integer ): TmxHeader;
    Function HeaderByName( Name: String ): TmxHeader;
    Function HeaderIndexByName( Name: String ): Integer;

    Function CanFocus: Boolean; Override;

    Procedure BeginUpdate; Virtual;
    Procedure EndUpdate; Virtual;

    Function GetItemAt( X, Y: Integer; Var HeaderIndex, ButtonIndex: Integer ): TmxHitType;

    Function GetPrevHeader( AHeader: TmxHeader ): TmxHeader;
    Function GetNextHeader( AHeader: TmxHeader ): TmxHeader;

    Procedure CollapseAll;
    Procedure ExpandAll;

    Procedure RenameHeader( AHeader: TmxHeader );
    Procedure RenameHeaderByIndex( AHeaderIndex: Integer );

    Procedure LoadFromFile( Const FileName: String ); Virtual;
    Procedure LoadFromStream( Stream: TStream ); Virtual;
    Procedure SaveToFile( Const FileName: String ); Virtual;
    Procedure SaveToStream( Stream: TStream ); Virtual;

{$WARNINGS off}
    Property Dragging: Boolean Read GetDragging;
{$WARNINGS on}

    Function ProcessOuterDrop( DataObject: IDataObject; NewButton, TargetButton: TmxButton; Var Effect: Integer; HitMode: TmxHitPosition ): Boolean;
    Function ProcessDrop( DataObject: IDataObject; TargetButton: TmxButton; Var Effect: Integer; HitMode: TmxHitPosition ): Boolean;
    Property CurrentTargetButton: TmxButton Read FCurrentTargetButton;
    Property CurrentTargetHeader: TmxHeader Read FCurrentTargetHeader;

  Published

    Property AlertColor: TColor Read FAlertColor Write FAlertColor Default clRed;
    Property ActiveHeader: TmxHeader Read FActiveHeader Write SetActiveHeader Stored False;
    Property AutoButtonScrollDelay: Cardinal Read FAutoButtonScrollDelay Write FAutoButtonScrollDelay Default 600;
    Property AutoScrollDelay: Cardinal Read FAutoScrollDelay Write FAutoScrollDelay Default 500;
    Property AutoChangeDelay: Cardinal Read FAutoChangeDelay Write FAutoChangeDelay Default 100;
    Property AlertInterval: Cardinal Read FAlertInterval Write SetAlertInterval Default 500;
    Property Background: TmxBackground Read FBackground Write FBackground;
    Property BevelInner: TPanelBevel Read FBevelInner Write SetBevelInner Default bvNone;
    Property BevelOuter: TPanelBevel Read FBevelOuter Write SetBevelOuter Default bvRaised;
    Property BevelWidth: TBevelWidth Read FBevelWidth Write SetBevelWidth Default 1;
    Property Border: TmxBorder Read FBorder Write FBorder;
    Property BorderStyle: TBorderStyle Read FBorderStyle Write SetBorderStyle Default{$IFDEF Delphi6_Up}bsSingle{$ELSE}bsNone{$ENDIF};
    Property CommonStyle: Boolean Read FCommonStyle Write SetCommonStyle;
    Property CloseButton: TmxCloseButton Read FCloseButton Write FCloseButton;
    Property DropMarkColor: TColor Read FDropMarkColor Write FDropMarkColor Default clBlack;
    Property EachHeaderSelection: Boolean Read FEachHeaderSelection Write SetEachHeaderSelection Default False;
    Property ExplorerMethod: TmxExplorerMethod Read FExplorerMethod Write SetExplorerMethod Default emCloseUp;
    Property Flat: Boolean Read FFlat Write SetFlat Default True;
    Property Headers: TmxHeaders Read GetHeaders Write SetHeaders;
    Property HeaderImages: TmxHeaderImages Read FHeaderImages Write FHeaderImages;
    Property InplaceEditor: TmxInplaceEditor Read FEditor Write SetInplaceEditor;
    Property HeaderScrollAcceleration: Byte Read FHeaderScrollAcceleration Write SetHeaderScrollAcceleration Default 5;
    Property ScrollChange: Word Read FScrollChange Write SetScrollChange Default 50;
    Property HeaderScrollType: TmxHeaderScrollType Read FHeaderScrollType Write SetHeaderScrollType Default stAccelerated;
    Property HeaderScrollValue: Byte Read FHeaderScrollValue Write SetHeaderScrollValue Default 20;
    Property PreSet: TmxPreSet Read FPreSet Write SetPreSet Stored False Default psOutlook;
    Property ScrollBoxSize: Word Read FScrollBoxSize Write SetScrollBoxSize Default 15;
    Property Settings: TmxBarSettings Read FSettings Write FSettings;
    Property ScrollView: TmxScrollView Read FScrollView Write SetScrollView Default ssNormal;
    Property Options: TmxBarOptions Read FOptions Write SetOptions;
    Property Version: String Read GetVersion Write SetVersion;
    Property ViewStyle: TmxViewStyle Read FViewStyle Write SetViewStyle Default vsOutlook;

    Property OnDrawCloseHeader: TmxEventDrawHeader Read GetOnDrawCloseHeader Write SetOnDrawCloseHeader;
    Property OnAfterDrawCloseHeader: TmxEventDrawHeader Read GetOnAfterDrawCloseHeader Write SetOnAfterDrawCloseHeader;

    Property OnChange: TmxEventHeaderChange Read FOnChange Write FOnChange;
    Property OnCanChange: TmxEventCanChangeHeader Read FOnCanChange Write FOnCanChange;
    Property OnDrawCloseButton: TmxEventDrawButton Read FOnDrawCloseButton Write FOnDrawCloseButton;
    Property OnDrawHeaderButtons: TmxEventDrawHeaderButtons Read FOnDrawHeaderButtons Write FOnDrawHeaderButtons;
    Property OnAfterDrawHeaderButtons: TmxEventDrawHeaderButtons Read FOnAfterDrawHeaderButtons Write FOnAfterDrawHeaderButtons;
    Property OnChangeViewStyle: TmxEventChangeViewStyle Read FOnChangeViewStyle Write FOnChangeViewStyle;
    Property OnHide: TNotifyEvent Read FOnHide Write FOnHide;
    Property OnShow: TNotifyEvent Read FOnShow Write FOnShow;
    Property OnClose: TNotifyEvent Read GetOnClose Write SetOnClose;
    Property OnAfterChangeStyle: TmxEventAfterChangeStyle Read FOnAfterChangeStyle Write FOnAfterChangeStyle;

    Property OnContextPopup: TContextPopupEvent Read FOnContextPopup Write FOnContextPopup;
    Property OnEditorContextPopup: TContextPopupEvent Read FOnEditorContextPopup Write FOnEditorContextPopup;

    Property OnDragAllowed: TmxEventDragAllowed Read FOnDragAllowed Write FOnDragAllowed;
    Property OnDragOver: TmxEventDragOver Read FOnDragOver Write FOnDragOver;
    Property OnDragEnter: TmxEventDragEnter Read FOnDragEnter Write FOnDragEnter;
    Property OnDragDrop: TmxEventDragDrop Read FOnDragDrop Write FOnDragDrop;

    Property Align;
    Property Anchors;
    Property BorderWidth Read GetBorderWidth Write SetBorderWidth Default 0;
    Property Constraints;
    Property Ctl3D;
    Property Cursor;
    Property Enabled;
    Property PopupMenu;
    Property TabStop;
    Property TabOrder;
    Property Visible;
    Property OnClick;
    Property OnDblClick;
    Property DockSite;
    Property DragCursor;
    Property DragKind;
    Property DragMode;
    Property ShowHint;
    Property ParentShowHint;
    Property BiDiMode;
    Property ParentBiDiMode;
    Property OnDockDrop;
    Property OnEndDock;
    Property OnEndDrag;
    Property OnGetSiteInfo;
    Property OnStartDock;
    Property OnUnDock;
    Property OnCanResize;
    Property OnEnter;
    Property OnExit;
    Property OnKeyDown;
    Property OnKeyPress;
    Property OnKeyUp;
    Property OnMouseDown;
    Property OnMouseMove;
    Property OnMouseUp;
    Property OnMouseWheel;
    Property OnMouseWheelDown;
    Property OnMouseWheelUp;
    Property OnResize;
  End;

Implementation

Uses
  Dialogs;
Var
  Registered: Boolean;
  FAlphaBitmap: TBitmap;
Type
  TWinControlClass = Class( TWinControl );

Function Max( A, B: Integer ): Integer;
Begin
  If A > B Then Result := A Else Result := B;
End;

Procedure InitializeGlobalStructures;
Begin
  OleInitialize( Nil );

  // register the native and helper clipboard formats
  CF_OUTLOOKBARPRO := RegisterClipboardFormat( CFSTR_MXOUTLOOKBARPRO );
  CF_OUTLOOKBARPROREFERENCE := RegisterClipboardFormat( CFSTR_MXOUTLOOKBARPROREFERENCE );
End;

Procedure FinalizeGlobalStructures;
Begin
  OleUninitialize;
End;

Var
  ColorMatrix: Array[ 0..199 ] Of Array[ 0..255 ] Of Byte;

Procedure PrepareColorMatrix;
Var
  I, J: Integer;
Begin
  For I := 0 To 99 Do
    For J := 0 To 255 Do
    Begin
      ColorMatrix[ I * 2, J ] := ( J * ( 100 - I ) ) Div 100;
      ColorMatrix[ I * 2 + 1, J ] := ( J * I ) Div 100;
    End;
End;

Procedure AlphaBlendArea( DrawBitmap: TBitmap; Const ARect: TRect; Value: Byte; AColor: TColor );
Var
  Source, Destination: ^Cardinal;
  I, J: Integer;
  S, C, CBRB, CBG: Cardinal;
  MyRect: TRect;
Begin
  MyRect := ARect;
  If MyRect.Top > DrawBitmap.Height Then Exit;
  If MyRect.Bottom > DrawBitmap.Height Then MyRect.Bottom := DrawBitmap.Height;
  If MyRect.Left > DrawBitmap.Width Then Exit;
  If MyRect.Right > DrawBitmap.Width Then MyRect.Right := DrawBitmap.Width;

  If MyRect.Top < 0 Then MyRect.Top := 0;
  If MyRect.Left < 0 Then MyRect.Left := 0;

  FAlphaBitmap.Width := DrawBitmap.Width;
  FAlphaBitmap.Height := DrawBitmap.Height;

  FAlphaBitmap.Canvas.Brush.Style := bsClear;
  FAlphaBitmap.Canvas.Brush.Color := AColor;
  FAlphaBitmap.Canvas.FillRect( MyRect );

  For J := MyRect.Top To MyRect.Bottom - 1 Do
  Begin
    Source := FAlphaBitmap.ScanLine[ J ];
    Destination := DrawBitmap.ScanLine[ J ];

    Inc( Source, MyRect.Left );
    Inc( Destination, MyRect.Left );

    For I := MyRect.Left To MyRect.Right - 1 Do
    Begin
      S := Source^;

      If S <> Destination^ Then
      Begin
{$WARNINGS OFF}
        CBRB := ( Destination^ And $00FF00FF ) * ( 255 - Value );
        CBG := ( Destination^ And $0000FF00 ) * ( 255 - Value );
{$WARNINGS ON}
        C := ( ( S And $FF00FF ) * Value + CBRB ) And $FF00FF00 + ( ( S And $00FF00 ) * Value + CBG ) And $00FF0000;
        Destination^ := C Shr 8;
      End;

      Inc( Source );
      Inc( Destination );
    End;
  End;
End;

{TmxFormatEtcList}

Function TmxFormatEtcList.Get( Index: Integer ): TFormatEtc;
Begin
  If ( Index < 0 ) Or ( Index > High( FList ) ) Then
    Raise EListError.Create( SEtcInvalidItem ) Else
    Result := FList[ Index ];
End;

Procedure TmxFormatEtcList.Put( Index: Integer; Item: TFormatEtc );
Begin
  If ( Index < 0 ) Or ( Index > High( FList ) ) Then
    Raise EListError.Create( SEtcInvalidItem ) Else
    FList[ Index ] := Item;
End;

Function TmxFormatEtcList.GetCount: Integer;
Begin
  Result := Length( FList );
End;

Function TmxFormatEtcList.Add( Item: TFormatEtc ): Integer;
Begin
  Result := Length( FList );
  SetLength( FList, Result + 1 );
  FList[ Result ] := Item;
End;

Procedure TmxFormatEtcList.Clear;
Begin
  Flist := Nil;
End;

Function TmxFormatEtcList.Clone: TmxFormatEtcList;
Begin
  Result := TmxFormatEtcList.Create;
  If Length( FList ) > 0 Then
    Result.FList := Copy( FList, 0, Length( FList ) );
End;

Procedure TmxFormatEtcList.Delete( Index: Integer );
Begin
  If ( Index < 0 ) Or ( Index > High( FList ) ) Then
    Raise EListError.Create( SEtcInvalidItem ) Else
  Begin
    If Index < High( FList ) Then
      Move( FList[ Index + 1 ], FList[ Index ], ( High( FList ) - Index ) * SizeOf( TFormatEtc ) );
    SetLength( FList, High( FList ) );
  End;
End;

{TmxEnumFormatEtc}

Constructor TmxEnumFormatEtc.Create( FormatEtcList: TmxFormatEtcList );
Begin
  Inherited Create;
  FFormatEtcList := FormatEtcList;
End;

Destructor TmxEnumFormatEtc.Destroy;
Begin
  FFormatEtcList.Free;
  Inherited Destroy;
End;

Function TmxEnumFormatEtc.Next( Celt: Integer; Out Elt; PCeltFetched: PLongint ): HResult;
Var
  CopyCount: Integer;
Begin
  Result := S_FALSE;
  CopyCount := FFormatEtcList.Count - FCurrentIndex;
  If Celt < CopyCount Then CopyCount := Celt;
  If CopyCount > 0 Then
  Begin
    Move( FFormatEtcList.FList[ FCurrentIndex ], Elt, CopyCount * SizeOf( TFormatEtc ) );
    Inc( FCurrentIndex, CopyCount );
    Result := S_OK;
  End;
  If Assigned( PCeltFetched ) Then PCeltFetched^ := CopyCount;
End;

Function TmxEnumFormatEtc.Skip( Celt: Integer ): HResult;
Begin
  If ( FCurrentIndex + celt <= FFormatEtcList.Count ) Then
  Begin
    Inc( FCurrentIndex, celt );
    Result := S_Ok;
  End
  Else Result := S_FALSE;
End;

Function TmxEnumFormatEtc.Reset: HResult;
Begin
  FCurrentIndex := 0;
  Result := S_OK;
End;

Function TmxEnumFormatEtc.Clone( Out Enum: IEnumFormatEtc ): HResult;
Begin
  Result := S_OK;
  Try
    Enum := TmxEnumFormatEtc.Create( FFormatEtcList );
{$WARNINGS OFF}
    TmxEnumFormatEtc( Enum ).FCurrentIndex := FCurrentIndex;
{$WARNINGS ON}
  Except
    Result := E_FAIL;
  End;
End;

{TmxDragDropManager}

Constructor TmxDragDropManager.Create( AOwner: TmxOutlookBarPro );
Begin
  Inherited Create;
  FOwner := AOwner;
  FFormatEtcList := TmxFormatEtcList.Create;
End;

Destructor TmxDragDropManager.Destroy;
Begin
  FFormatEtcList.Free;
  FOwner.FDragManager := Nil;
  Inherited;
End;

Function TmxDragDropManager._Release: Integer;
Begin
  With FOwner Do
  Begin
    If Not ( csDestroying In ComponentState ) Then
    Begin
      Invalidate;
    End;
  End;

  Result := InterlockedDecrement( FRefCount );
  If Result = 0 Then Destroy;
End;

Function TmxDragDropManager.DAdvise( Const FormatEtc: TFormatEtc; advf: Integer; Const advSink: IAdviseSink; Out dwConnection: Integer ): HResult;
Begin
  Result := E_NOTIMPL;
End;

Function TmxDragDropManager.DragEnter( Const DataObject: IDataObject; KeyState: Integer; Pt: TPoint; Var Effect: Integer ): HResult;
Var
  Outter: Boolean;
Begin
  FDragSource := GetDataSourceTree( DataObject );
  Outter := Not Assigned( FDragSource );
{$WARNINGS OFF}
  If Not Outter Then Outter := @FDragSource = @FOwner;
{$WARNINGS ON}

  If Not Outter Then
  Begin
    If boInternalDrop In FOwner.Options Then
      Result := FOwner.DoDragEnter( DataObject, KeyState, Pt, Effect ) Else
      Result := E_ABORT;
  End
  Else
  Begin
    If boAcceptOLEDrop In FOwner.Options Then
      Result := FOwner.DoDragEnter( DataObject, KeyState, Pt, Effect ) Else
      Result := E_ABORT;
  End;
End;

Function TmxDragDropManager.DragLeave: HResult;
Begin
  FOwner.DoDragLeave;
  FDragSource := Nil;
  FOwner.DoInvalidate;
  Result := NOERROR;
End;

Function TmxDragDropManager.DragOver( KeyState: Integer; Pt: TPoint; Var Effect: Integer ): HResult;
Begin
  Result := FOwner.DoDragOver( FDragSource, KeyState, dsDragMove, Pt, Effect );
End;

Function TmxDragDropManager.Drop( Const DataObject: IDataObject; KeyState: Integer; Pt: TPoint; Var Effect: Integer ): HResult;
Begin
  Result := FOwner.DoDragDrop( DataObject, KeyState, Pt, Effect );
End;

Function TmxDragDropManager.DUnadvise( dwConnection: Integer ): HResult;
Begin
  Result := E_NOTIMPL;
End;

Function TmxDragDropManager.EnumDAdvise( Out enumAdvise: IEnumStatData ): HResult;
Begin
  Result := OLE_E_ADVISENOTSUPPORTED;
End;

Function TmxDragDropManager.EnumFormatEtc( Direction: Integer; Out EnumFormatEtc: IEnumFormatEtc ): HResult;
Begin
  Result := E_FAIL;

  If Direction = DATADIR_GET Then
  Begin
    EnumFormatEtc := TmxEnumFormatEtc.Create( FFormatEtcList.Clone );
    Result := S_OK;
  End
  Else EnumFormatEtc := Nil;

  If EnumFormatEtc = Nil Then Result := OLE_S_USEREG;
End;

Function TmxDragDropManager.GetCanonicalFormatEtc( Const FormatEtc: TFormatEtc; Out FormatEtcOut: TFormatEtc ): HResult;
Begin
  Result := DATA_S_SAMEFORMATETC;
End;

Function TmxDragDropManager.GetData( Const FormatEtcIn: TFormatEtc; Out Medium: TStgMedium ): HResult;
Var
  I: Integer;
Begin
  Try
    If FFormatEtcList.Count > 0 Then
      For I := 0 To FFormatEtcList.Count - 1 Do
        If ( FormatEtcIn.tymed And FFormatEtcList.Items[ I ].tymed <> 0 ) And
          ( FormatEtcIn.lindex = FFormatEtcList.Items[ I ].lindex ) And
          ( FormatEtcIn.dwAspect = FFormatEtcList.Items[ I ].dwAspect ) And
          ( FormatEtcIn.cfFormat = FFormatEtcList.Items[ I ].cfFormat ) Then
        Begin
          Result := RenderData( FormatEtcIn, Medium );
          Exit;
        End;
    Result := DV_E_FORMATETC;
  Except
    Medium.HGlobal := 0;
    Result := E_FAIL;
  End;
End;

Function TmxDragDropManager.GetDataHere( Const FormatEtc: TFormatEtc; Out Medium: TStgMedium ): HResult;
Begin
  Result := E_NOTIMPL;
End;

Function TmxDragDropManager.GiveFeedback( Effect: Integer ): HResult;
Begin
  Result := DRAGDROP_S_USEDEFAULTCURSORS;
End;

Function TmxDragDropManager.GetDataSourceTree( DataObject: IDataObject ): TmxOutlookBarPro;
Var
  Medium: TStgMedium;
  Data: PmxReference;
Begin
  Result := Nil;
  If Assigned( DataObject ) Then
  Begin
    StandardOLEFormat.cfFormat := CF_OUTLOOKBARPROREFERENCE;
    If DataObject.GetData( StandardOLEFormat, Medium ) = S_OK Then
    Begin
      Data := GlobalLock( Medium.hGlobal );

      Inc( PCardinal( Data ) );
      If Assigned( Data ) Then
      Begin
        If Data.Process = GetCurrentProcessID Then Result := Data.Bar;
        GlobalUnlock( Medium.hGlobal );
      End;
      ReleaseStgMedium( Medium );
    End;
  End;
End;

Function TmxDragDropManager.QueryContinueDrag( EscapePressed: BOOL; KeyState: Integer ): HResult;
Var
  RButton, LButton: Boolean;
  P: TPoint;
Begin
  LButton := ( KeyState And MK_LBUTTON ) <> 0;
  RButton := ( KeyState And MK_RBUTTON ) <> 0;

  If ( LButton And RButton ) Or EscapePressed Then
    Result := DRAGDROP_S_CANCEL Else
    If Not ( LButton Or RButton ) Then
      Result := DRAGDROP_S_DROP Else
      Result := S_OK;

  If Result = S_OK Then GetCursorPos( P );
End;

Function TmxDragDropManager.QueryGetData( Const FormatEtc: TFormatEtc ): HResult;
Const
  DVError: Array[ 0..3 ] Of HResult = ( DV_E_FORMATETC, DV_E_TYMED, DV_E_DVASPECT, DV_E_LINDEX );
Var
  I, J: Integer;
Begin
  J := 0;
  If FFormatEtcList.Count > 0 Then
    For I := 0 To FFormatEtcList.Count - 1 Do
      If FormatEtc.cfFormat = FFormatEtcList.Items[ I ].cfFormat Then
      Begin
        If ( FormatEtc.tymed And FFormatEtcList.Items[ I ].tymed ) <> 0 Then
        Begin
          If FormatEtc.dwAspect = FFormatEtcList.Items[ I ].dwAspect Then
          Begin
            If FormatEtc.lindex = FFormatEtcList.Items[ I ].lindex Then
            Begin
              Result := S_OK;
              Exit;
            End
            Else
              If J < 3 Then
                J := 3;
          End
          Else
            If J < 2 Then
              J := 2;
        End
        Else
          If J < 1 Then
            J := 1;
      End;

  Result := DVError[ J ];
End;

Function TmxDragDropManager.SetData( Const FormatEtc: TFormatEtc; Var Medium: TStgMedium; DoRelease: BOOL ): HResult;
Var
  I: Integer;
  AddData: Boolean;
Begin
  Result := E_FAIL;
  If Not DoRelease Then
  Begin
    AddData := True;
    If FFormatEtcList.Count > 0 Then
      For I := 0 To FFormatEtcList.Count - 1 Do
        If FFormatEtcList.Items[ I ].cfFormat = FormatEtc.cfFormat Then
        Begin
          AddData := False;
          FFormatEtcList.Items[ I ] := FormatEtc;
        End;

    If AddData Then FFormatEtcList.Add( FormatEtc );
  End;
End;

Function TmxDragDropManager.RenderData( FormatEtc: TFormatEtc; Var StgMedium: TStgMedium ): HResult;
Var
{$WARNINGS OFF}
  Data: PWideChar;
  StoreResSize: Boolean;
  ResPointer: Pointer;
{$WARNINGS ON}
  ResSize: Integer;
  Stream: TMemoryStream;
  RefInfo: TmxReference;
Begin
  Stream := Nil;
  Try
    Try
      StoreResSize := True;

      If FormatEtc.cfFormat = CF_OUTLOOKBARPRO Then
      Begin
        Stream := TMemoryStream.Create;
        FOwner.WriteButtonToStream( Stream, FOwner.FDraggedButton );
{$WARNINGS OFF}
        ResPointer := Stream.Memory;
{$WARNINGS ON}
        ResSize := Stream.Position;
      End
      Else
        If FormatEtc.cfFormat = CF_OUTLOOKBARPROREFERENCE Then
        Begin
          RefInfo.Process := GetCurrentProcessID;
          RefInfo.Bar := FOwner;
{$WARNINGS OFF}
          ResPointer := @RefInfo;
{$WARNINGS ON}
          ResSize := SizeOf( RefInfo );
        End
        Else
        Begin
{$WARNINGS OFF}
          ResPointer := Nil;
{$WARNINGS ON}
          ResSize := 0;
        End;

      // Allocate memory to hold the string
      If ResSize > 0 Then
      Begin
        If StoreResSize Then
          StgMedium.hGlobal := GlobalAlloc( GHND Or GMEM_SHARE, ResSize + SizeOf( Cardinal ) ) Else
          StgMedium.hGlobal := GlobalAlloc( GHND Or GMEM_SHARE, ResSize );

{$WARNINGS OFF}
        Data := GlobalLock( StgMedium.hGlobal );

        If StoreResSize Then
        Begin
          PCardinal( Data )^ := ResSize;
          Inc( PCardinal( Data ) );
        End;

        Move( ResPointer^, Data^, ResSize );
        GlobalUnlock( StgMedium.hGlobal );
        StgMedium.tymed := TYMED_HGLOBAL;
        StgMedium.unkForRelease := Nil;
{$WARNINGS ON}

        Result := S_OK;
      End
      Else Result := E_FAIL;
    Except
      Result := E_FAIL;
    End;
  Finally
    Stream.Free;
  End;
End;

Procedure TmxDragDropManager.SetOLEFormats;
Begin
  FFormatEtcList.Clear;

  StandardOLEFormat.cfFormat := CF_OUTLOOKBARPROREFERENCE;
  FFormatEtcList.Add( StandardOLEFormat );

  StandardOLEFormat.cfFormat := CF_OUTLOOKBARPRO;
  FFormatEtcList.Add( StandardOLEFormat );
End;

{TmxBorder}

Constructor TmxBorder.Create;
Begin
  Inherited Create;

  FRect.Left := 5;
  FRect.Top := 5;
  FRect.Right := 5;
  FRect.Bottom := 5;

  FSeparator := 5;
End;

Procedure TmxBorder.Assign( Source: TPersistent );
Begin
  If Source Is TmxBorder Then
  Begin
    FRect := TmxBorder( Source ).GetAsRect;
    FSeparator := TmxBorder( Source ).Separator;
    Change;
  End
  Else Inherited Assign( Source );
End;

Procedure TmxBorder.AssignTo( Destination: TPersistent );
Begin
  If Destination Is TmxBorder Then
  Begin
    TmxBorder( Destination ).Assign( Self );
  End
  Else Inherited AssignTo( Destination );
End;

Procedure TmxBorder.Change;
Begin
  If Assigned( FOnChangeParameter ) Then FOnChangeParameter( Self );
End;

Procedure TmxBorder.SetData( Index: Integer; AValue: Word );
Begin
  Case Index Of
    1: FRect.Top := AValue;
    2: FRect.Bottom := AValue;
    3: FRect.Left := AValue;
    4: FRect.Right := AValue;
    5: FSeparator := AValue;
  End;
  Change;
End;

Function TmxBorder.GetData( Index: Integer ): Word;
Begin
  Case Index Of
    1: Result := FRect.Top;
    2: Result := FRect.Bottom;
    3: Result := FRect.Left;
    4: Result := FRect.Right;
    5: Result := FSeparator;
  Else Result := 0;
  End;
End;

{TmxButtonImages}

Constructor TmxButtonImages.Create( AOwner: TComponent );
Begin
  Inherited Create;

  FOwnerComponent := AOwner;

  FDisabledChangeLink := TChangeLink.Create;
  FDisabledChangeLink.OnChange := ImageListChange;
  FDisabledSmallChangeLink := TChangeLink.Create;
  FDisabledSmallChangeLink.OnChange := ImageListChange;

  FNormalChangeLink := TChangeLink.Create;
  FNormalChangeLink.OnChange := ImageListChange;
  FSmallChangeLink := TChangeLink.Create;
  FSmallChangeLink.OnChange := ImageListChange;

  FHotChangeLink := TChangeLink.Create;
  FHotChangeLink.OnChange := ImageListChange;
  FHotSmallChangeLink := TChangeLink.Create;
  FHotSmallChangeLink.OnChange := ImageListChange;
End;

Destructor TmxButtonImages.Destroy;
Begin
  FNormalChangeLink.Free;
  FHotChangeLink.Free;
  FSmallChangeLink.Free;
  FHotSmallChangeLink.Free;
  FDisabledChangeLink.Free;
  FDisabledSmallChangeLink.Free;

  Inherited Destroy;
End;

Procedure TmxButtonImages.ImageListChange( Sender: TObject );
Begin
  Change;
End;

Procedure TmxButtonImages.Change;
Begin
  If Assigned( FOnChangeParameter ) Then FOnChangeParameter( Self );
End;

Procedure TmxButtonImages.SetImages( Index: Integer; AValue: TCustomImageList );
Begin
  Case Index Of
    1: If FNormal <> Nil Then FNormal.UnRegisterChanges( FNormalChangeLink );
    2: If FHot <> Nil Then FHot.UnRegisterChanges( FHotChangeLink );
    3: If FSmall <> Nil Then FSmall.UnRegisterChanges( FSmallChangeLink );
    4: If FHotSmall <> Nil Then FHotSmall.UnRegisterChanges( FHotSmallChangeLink );
    5: If FDisabled <> Nil Then FDisabled.UnRegisterChanges( FDisabledChangeLink );
    6: If FDisabledSmall <> Nil Then FDisabledSmall.UnRegisterChanges( FDisabledSmallChangeLink );
  End;

  Case Index Of
    1: FNormal := AValue;
    2: FHot := AValue;
    3: FSmall := AValue;
    4: FHotSmall := AValue;
    5: FDisabled := AValue;
    6: FDisabledSmall := AValue;
  End;

  Case Index Of
    1:
      Begin
        If FNormal <> Nil Then
        Begin
          FNormal.RegisterChanges( FNormalChangeLink );
        End;
        ImageListChange( FNormal );
      End;
    2:
      Begin
        If FHot <> Nil Then
        Begin
          FHot.RegisterChanges( FHotChangeLink );
        End;
        ImageListChange( FHot );
      End;
    3:
      Begin
        If FSmall <> Nil Then
        Begin
          FSmall.RegisterChanges( FSmallChangeLink );
        End;
        ImageListChange( FSmall );
      End;
    4:
      Begin
        If FHotSmall <> Nil Then
        Begin
          FHotSmall.RegisterChanges( FHotSmallChangeLink );
        End;
        ImageListChange( FHotSmall );
      End;
    5:
      Begin
        If FDisabled <> Nil Then
        Begin
          FDisabled.RegisterChanges( FDisabledChangeLink );
        End;
        ImageListChange( FDisabled );
      End;
    6:
      Begin
        If FDisabledSmall <> Nil Then
        Begin
          FDisabledSmall.RegisterChanges( FDisabledSmallChangeLink );
        End;
        ImageListChange( FDisabledSmall );
      End;
  End;
End;

Procedure TmxButtonImages.Assign( Source: TPersistent );
Begin
  If Source Is TmxButtonImages Then
  Begin
    Normal := TmxButtonImages( Source ).Normal;
    Hot := TmxButtonImages( Source ).Hot;
    Small := TmxButtonImages( Source ).Small;
    HotSmall := TmxButtonImages( Source ).HotSmall;
    Disabled := TmxButtonImages( Source ).Disabled;
    DisabledSmall := TmxButtonImages( Source ).DisabledSmall;

    Change;
  End
  Else Inherited Assign( Source );
End;

Procedure TmxButtonImages.AssignTo( Destination: TPersistent );
Begin
  If Destination Is TmxButtonImages Then
  Begin
    TmxButtonImages( Destination ).Assign( Self );
  End
  Else Inherited AssignTo( Destination );
End;

{TmxHeaderImages}

Constructor TmxHeaderImages.Create( AOwner: TComponent );
Begin
  Inherited Create;

  FOwnerComponent := AOwner;

  FNormalChangeLink := TChangeLink.Create;
  FNormalChangeLink.OnChange := ImageListChange;
  FHotChangeLink := TChangeLink.Create;
  FHotChangeLink.OnChange := ImageListChange;
End;

Destructor TmxHeaderImages.Destroy;
Begin
  FNormalChangeLink.Free;
  FHotChangeLink.Free;

  Inherited Destroy;
End;

Procedure TmxHeaderImages.ImageListChange( Sender: TObject );
Begin
  Change;
End;

Procedure TmxHeaderImages.Change;
Begin
  If Assigned( FOnChangeParameter ) Then FOnChangeParameter( Self );
End;

Procedure TmxHeaderImages.SetImages( Index: Integer; AValue: TCustomImageList );
Begin
  Case Index Of
    1: If FNormal <> Nil Then FNormal.UnRegisterChanges( FNormalChangeLink );
    2: If FHot <> Nil Then FHot.UnRegisterChanges( FHotChangeLink );
  End;

  Case Index Of
    1: FNormal := AValue;
    2: FHot := AValue;
  End;

  Case Index Of
    1:
      Begin
        If FNormal <> Nil Then
        Begin
          FNormal.RegisterChanges( FNormalChangeLink );
          FNormal.FreeNotification( FOwnerComponent );
        End;
        ImageListChange( FNormal );
      End;
    2:
      Begin
        If FHot <> Nil Then
        Begin
          FHot.RegisterChanges( FHotChangeLink );
          FHot.FreeNotification( FOwnerComponent );
        End;
        ImageListChange( FHot );
      End;
  End;
End;

Procedure TmxHeaderImages.Assign( Source: TPersistent );
Begin
  If Source Is TmxHeaderImages Then
  Begin
    FOwnerComponent := TmxHeaderImages( Source ).FOwnerComponent;

    Normal := TmxHeaderImages( Source ).Normal;
    Hot := TmxHeaderImages( Source ).Hot;

    Change;
  End
  Else Inherited Assign( Source );
End;

Procedure TmxHeaderImages.AssignTo( Destination: TPersistent );
Begin
  If Destination Is TmxHeaderImages Then
  Begin
    TmxHeaderImages( Destination ).Assign( Self );
  End
  Else Inherited AssignTo( Destination );
End;

{TmxGradient}

Constructor TmxGradient.Create;
Begin
  Inherited Create;

  FBeginColor := clBtnFace;
  FEndColor := clBlue;
  FGradientStyle := gtLeftToRight;
  FDirection := gdNormal;

  FOldRect := Bounds( 0, 0, 0, 0 );

  FBitmap := TBitmap.Create;
  FBitmap.PixelFormat := pf32bit;
  LoadColors;
End;

Destructor TmxGradient.Destroy;
Begin
  FBitmap.Free;
  FBitmap := Nil;
  Inherited Destroy;
End;

Procedure TmxGradient.SetGradientStyle( AValue: TmxGradientStyle );
Begin
  If FGradientStyle <> AValue Then
  Begin
    FGradientStyle := AValue;
    FOldRect := Bounds( 0, 0, 0, 0 );
    LoadColors;
    Change;
  End;
End;

Procedure TmxGradient.SetDirection( AValue: TmxGradientDirection );
Begin
  If FDirection <> AValue Then
  Begin
    FDirection := AValue;
    FOldRect := Bounds( 0, 0, 0, 0 );
    LoadColors;
    Change;
  End;
End;

Procedure TmxGradient.Assign( Source: TPersistent );
Begin
  If Source Is TmxGradient Then
  Begin
    FBeginColor := TmxGradient( Source ).BeginColor;
    FEndColor := TmxGradient( Source ).EndColor;
    FGradientStyle := TmxGradient( Source ).DrawStyle;
    FOldRect := Bounds( 0, 0, 0, 0 );
    LoadColors;
    Change;
  End
  Else Inherited Assign( Source );
End;

Procedure TmxGradient.AssignTo( Destination: TPersistent );
Begin
  If Destination Is TmxGradient Then
  Begin
    TmxGradient( Destination ).Assign( Self );
  End
  Else Inherited AssignTo( Destination );
End;

Procedure TmxGradient.SetColor( Index: Integer; AValue: TColor );
Begin
  Case Index Of
    1: If FBeginColor <> AValue Then FBeginColor := AValue;
    2: If FEndColor <> AValue Then FEndColor := AValue;
  End;

  FOldRect := Bounds( 0, 0, 0, 0 );
  LoadColors;
  Change;
End;

Procedure TmxGradient.Change;
Begin
  If Assigned( FOnChangeParameter ) Then FOnChangeParameter( Self );
End;

Procedure TmxGradient.LoadColors;
Var
  X, YR, YG, YB, SR, SG, SB, DR, DG, DB: Integer;
  FMyBeginColor, FMyEndColor: TColor;
Begin
  If FDirection = gdNormal Then
  Begin
    FMyBeginColor := FBeginColor;
    FMyEndColor := FEndColor;
  End
  Else
  Begin
    FMyBeginColor := FEndColor;
    FMyEndColor := FBeginColor;
  End;

  YR := GetRValue( FMyBeginColor );
  YG := GetGValue( FMyBeginColor );
  YB := GetBValue( FMyBeginColor );
  SR := YR;
  SG := YG;
  SB := YB;
  DR := GetRValue( FMyEndColor ) - SR;
  DG := GetGValue( FMyEndColor ) - SG;
  DB := GetBValue( FMyEndColor ) - SB;

  If FGradientStyle In [ gtVerticalToCenter, gtHorizontalToCenter ] Then
  Begin
    For X := 0 To 127 Do
    Begin
      FColorTable[ X ] := RGB( YR, YG, YB );
      YR := SR + Round( DR / 127 * X );
      YG := SG + Round( DG / 127 * X );
      YB := SB + Round( DB / 127 * X );
    End;

    YR := GetRValue( FMyEndColor );
    YG := GetGValue( FMyEndColor );
    YB := GetBValue( FMyEndColor );
    SR := YR;
    SG := YG;
    SB := YB;
    DR := GetRValue( FMyBeginColor ) - SR;
    DG := GetGValue( FMyBeginColor ) - SG;
    DB := GetBValue( FMyBeginColor ) - SB;

    For X := 128 To 255 Do
    Begin
      FColorTable[ X ] := RGB( YR, YG, YB );
      YR := SR + Round( DR / 127 * ( X - 127 ) );
      YG := SG + Round( DG / 127 * ( X - 127 ) );
      YB := SB + Round( DB / 127 * ( X - 127 ) );
    End;
  End
  Else
  Begin
    For X := 0 To 255 Do
    Begin
      FColorTable[ X ] := RGB( YR, YG, YB );
      YR := SR + Round( DR / 255 * X );
      YG := SG + Round( DG / 255 * X );
      YB := SB + Round( DB / 255 * X );
    End;
  End;
End;

Procedure TmxGradient.InternalDrawGradient( ACanvas: TCanvas; X, Y, Width, Height: Integer );
Var
  TempRect: TRect;
  TempStepV, TempStepH: Single;
  ColorCode, TempLeft, TempTop, TempHeight, TempWidth, ECount, i: integer;
  CornerPnts: Array[ 0..5 ] Of TPoint;
  DiagArray: Array[ 0..255, 0..3 ] Of TPoint;
Begin
  If ( FGradientStyle = gtEllipse ) Then
  Begin
    TempRect := Rect( X, Y, Width, Height );
    With ACanvas Do
    Begin
      Brush.Color := clSilver;
      FillRect( TempRect );
    End;
  End;

  If FGradientStyle In [ gtVerticalToCenter, gtHorizontalToCenter, gtLeftToRight, gtTopToBottom, gtCornerTopLeft, gtCornerTopRight, gtCornerBottomRight, gtCornerBottomLeft ] Then
  Begin
    TempStepH := Width / 255;
    TempStepV := Height / 255;
    TempHeight := Trunc( TempStepV + 1 );
    TempWidth := Trunc( TempStepH + 1 );

    With ACanvas Do
    Begin
      TempTop := X;
      TempLeft := Y;
      TempRect.Top := X;
      TempRect.Bottom := Height;
      TempRect.Left := Y;
      TempRect.Right := Width;
      If Not ( FGradientStyle In [ gtVerticalToCenter, gtHorizontalToCenter, gtTopToBottom, gtLeftToRight ] ) Then pen.Style := psclear;

      For ColorCode := 0 To 255 Do
      Begin
        Brush.Color := FColorTable[ ColorCode ];

        If FGradientStyle = gtTopToBottom Then
        Begin
          TempRect.Top := TempTop;
          TempRect.Bottom := TempTop + TempHeight;
        End
        Else If FGradientStyle = gtVerticalToCenter Then
        Begin
          TempRect.Top := TempTop;
          TempRect.Bottom := TempTop + TempHeight;
        End
        Else If FGradientStyle = gtLeftToRight Then
        Begin
          TempRect.Left := TempLeft;
          TempRect.Right := TempLeft + TempWidth;
        End
        Else If FGradientStyle = gtHorizontalToCenter Then
        Begin
          TempRect.Left := TempLeft;
          TempRect.Right := TempLeft + TempWidth;
        End
        Else If FGradientStyle = gtCornerTopLeft Then
        Begin
          TempTop := Trunc( TempStepV * ( 255 - ColorCode ) );
          TempLeft := Trunc( TempStepH * ( 255 - ColorCode ) );
          CornerPnts[ 0 ] := Point( 0, TempTop );
          CornerPnts[ 1 ] := Point( TempLeft, TempTop );
          CornerPnts[ 2 ] := Point( TempLeft, 0 );
          CornerPnts[ 3 ] := Point( TempLeft + TempWidth, 0 );
          CornerPnts[ 4 ] := Point( TempLeft + TempWidth, TempTop + TempHeight );
          CornerPnts[ 5 ] := Point( 0, TempTop + TempHeight );
        End
        Else If FGradientStyle = gtCornerTopRight Then
        Begin
          TempTop := Trunc( TempStepV * ( 255 - ColorCode ) );
          TempLeft := Trunc( TempStepH * ColorCode );
          CornerPnts[ 0 ] := Point( TempLeft + TempWidth, 0 );
          CornerPnts[ 1 ] := Point( TempLeft + TempWidth, TempTop );
          CornerPnts[ 2 ] := Point( Width, TempTop );
          CornerPnts[ 3 ] := Point( Width, TempTop + TempHeight );
          CornerPnts[ 4 ] := Point( TempLeft, TempTop + TempHeight );
          CornerPnts[ 5 ] := Point( TempLeft, 0 );
        End
        Else If FGradientStyle = gtCornerBottomRight Then
        Begin
          TempTop := Trunc( TempStepV * ColorCode );
          TempLeft := Trunc( TempStepH * ColorCode );
          CornerPnts[ 0 ] := Point( Width, TempTop + TempHeight );
          CornerPnts[ 1 ] := Point( TempLeft + TempWidth, TempTop + TempHeight );
          CornerPnts[ 2 ] := Point( TempLeft + TempWidth, Height );
          CornerPnts[ 3 ] := Point( TempLeft, Height );
          CornerPnts[ 4 ] := Point( TempLeft, TempTop );
          CornerPnts[ 5 ] := Point( Width, TempTop );
        End
        Else If FGradientStyle = gtCornerBottomLeft Then
        Begin
          TempTop := Trunc( TempStepV * ColorCode );
          TempLeft := Trunc( TempStepH * ( 255 - ColorCode ) );
          CornerPnts[ 0 ] := Point( TempLeft, Height );
          CornerPnts[ 1 ] := Point( TempLeft, TempTop + TempHeight );
          CornerPnts[ 2 ] := Point( 0, TempTop + TempHeight );
          CornerPnts[ 3 ] := Point( 0, TempTop );
          CornerPnts[ 4 ] := Point( TempLeft + TempWidth, TempTop );
          CornerPnts[ 5 ] := Point( TempLeft + TempWidth, Height );
        End;

        If FGradientStyle In [ gtVerticalToCenter, gtHorizontalToCenter, gtTopToBottom, gtLeftToRight ] Then
          FillRect( TempRect ) Else
          Polygon( CornerPnts );

        If FGradientStyle In [ gtTopToBottom, gtVerticalToCenter ] Then
          TempTop := Trunc( TempStepV * ColorCode ) Else
          If FGradientStyle In [ gtLeftToRight, gtHorizontalToCenter ] Then
            TempLeft := Trunc( TempStepH * ColorCode );
      End;
    End;
  End;

  If FGradientStyle In [ gtDiagonalFalling, gtDiagonalRising ] Then
  Begin
    TempStepH := Width / 127;
    TempStepV := Height / 127;
    TempHeight := Trunc( TempStepV + 1 );
    TempWidth := Trunc( TempStepH + 1 );

    If FGradientStyle = gtDiagonalFalling Then
    Begin
      For i := 0 To 127 Do
      Begin
        TempLeft := Trunc( TempStepH * i );
        Diagarray[ i, 0 ] := Point( TempLeft, 0 );
        Diagarray[ i, 1 ] := Point( TempLeft + TempWidth, 0 );
        Diagarray[ i + 128, 3 ] := Point( TempLeft, Height );
        Diagarray[ i + 128, 2 ] := Point( TempLeft + TempWidth, Height );
      End;
      For i := 0 To 127 Do
      Begin
        TempTop := Trunc( TempStepV * i );
        Diagarray[ i, 3 ] := Point( 0, TempTop );
        Diagarray[ i, 2 ] := Point( 0, TempTop + TempHeight );
        Diagarray[ i + 128, 0 ] := Point( Width, TempTop );
        Diagarray[ i + 128, 1 ] := Point( Width, TempTop + TempHeight );
      End;
    End
    Else
    Begin
      For i := 0 To 127 Do
      Begin
        TempLeft := Trunc( TempStepH * i );
        Diagarray[ i, 0 ] := Point( TempLeft, Height );
        Diagarray[ i, 1 ] := Point( TempLeft + TempWidth, Height );
        Diagarray[ i + 128, 3 ] := Point( TempLeft, 0 );
        Diagarray[ i + 128, 2 ] := Point( TempLeft + TempWidth, 0 );
      End;
      For i := 0 To 127 Do
      Begin
        TempTop := Trunc( TempStepV * ( 127 - i ) );
        Diagarray[ i, 3 ] := Point( 0, TempTop + TempHeight );
        Diagarray[ i, 2 ] := Point( 0, TempTop );
        Diagarray[ i + 128, 0 ] := Point( Width, TempTop + TempHeight );
        Diagarray[ i + 128, 1 ] := Point( Width, TempTop );
      End;
    End;

    With ACanvas Do
    Begin
      Pen.Style := psclear;
      For ColorCode := 0 To 255 Do
      Begin
        Brush.Color := FColorTable[ ColorCode ];
        Polygon( Diagarray[ ColorCode ] );
      End;
    End;
  End;

  If FGradientStyle = gtEllipse Then
  Begin
    With ACanvas Do
    Begin
      TempTop := 1;
      TempLeft := 1;
      Pen.Width := 1;
      Pen.Style := psclear;
      ECount := ( Width Div 2 ) - 2;
      TempStepV := Height / Width;
      TempStepH := 255 / ECount;
      i := 2;

      While i < ECount Do
      Begin
        ColorCode := trunc( TempStepH * i );
        Brush.Color := FColorTable[ ColorCode ];
        Ellipse( TempLeft, TempTop, Width - TempLeft, Height - TempTop );
        TempTop := Trunc( TempStepV * i );
        TempLeft := i;
        i := i + 1;
      End;
    End;
  End;

  If FGradientStyle = gtPyramid Then
  Begin
    With ACanvas Do
    Begin
      TempLeft := Width Div 2;
      TempTop := Height Div 2;
      Pen.Width := 1;
      Pen.Style := psSolid;
      ECount := Width + Height;
      TempStepH := 255 / ECount;
      i := 0;

      While i <= Width Do
      Begin
        ColorCode := trunc( TempStepH * i );
        Pen.Color := FColorTable[ ColorCode ];
        MoveTo( i, 0 );
        LineTo( TempLeft, TempTop );
        ColorCode := trunc( TempStepH * ( i + Height ) );
        Pen.Color := FColorTable[ ColorCode ];
        LineTo( i, Height );
        i := i + 1;
      End;

      i := 0;
      While i <= Height Do
      Begin
        ColorCode := trunc( TempStepH * ( i + Width ) );
        Pen.Color := FColorTable[ ColorCode ];
        MoveTo( Width, i );
        LineTo( TempLeft, TempTop );
        ColorCode := trunc( TempStepH * i );
        Pen.Color := FColorTable[ ColorCode ];
        LineTo( -1, i );
        i := i + 1;
      End;
    End;
  End;
End;

Procedure TmxGradient.DrawGradient( ACanvas: TCanvas; ARect: TRect );
Var
  BmpRect: TRect;
  Width, Height: Integer;
  OldWidth, OldHeight: Integer;
Begin
  Width := ARect.Right - ARect.Left;
  Height := ARect.Bottom - ARect.Top;
  OldWidth := FOldRect.Right - FOldRect.Left;
  OldHeight := FOldRect.Bottom - FOldRect.Top;

  If ( Width <> OldWidth ) Or ( Height <> OldHeight ) Then
  Begin
    FOldRect := ARect;
    FBitmap.Width := Width;
    FBitmap.Height := Height;
    InternalDrawGradient( FBitmap.Canvas, 0, 0, Width, Height );
  End;

  If ACanvas <> Nil Then
  Begin
    If FGradientStyle = gtEllipse Then
    Begin
      BmpRect := Rect( 0, 0, Width - 1, Height - 1 );
      With ACanvas Do
      Begin
        Brush.Style := bsClear;
        FillRect( BmpRect );
        BrushCopy( BmpRect, FBitmap, BmpRect, clSilver );
      End;
    End
    Else BitBlt( ACanvas.Handle, ARect.Left, ARect.Top, Width, Height, FBitmap.Canvas.Handle, 0, 0, SrcCopy );
  End;
End;

{TmxXPColors}

Constructor TmxXPColors.Create;
Begin
  Inherited Create;
  SetToDefault;
End;

Procedure TmxXPColors.SetToDefault;
Begin
  FBorderColor := clNavy;
  FShadowColor := clBlack;
  FBackground := TColor( $D8ACB0 );
  FPressedBackground := TColor( $C7879F );
  FUseShadow := True;
End;

Procedure TmxXPColors.SetBorderColor( AValue: TColor );
Begin
  If AValue <> FBorderColor Then
  Begin
    FBorderColor := AValue;
    Change;
  End;
End;

Procedure TmxXPColors.SetShadowColor( AValue: TColor );
Begin
  If AValue <> FShadowColor Then
  Begin
    FShadowColor := AValue;
    Change;
  End;
End;

Procedure TmxXPColors.SetBackground( AValue: TColor );
Begin
  If AValue <> FBackground Then
  Begin
    FBackground := AValue;
    Change;
  End;
End;

Procedure TmxXPColors.SetPressedBackground( AValue: TColor );
Begin
  If AValue <> FPressedBackground Then
  Begin
    FPressedBackground := AValue;
  End;
End;

Procedure TmxXPColors.Change;
Begin
  If Assigned( FOnChange ) Then FOnChange( Self );
End;

Procedure TmxXPColors.SetUseShadow( AValue: Boolean );
Begin
  If AValue <> FUseShadow Then
  Begin
    FUseShadow := AValue;
    Change;
  End;
End;

Procedure TmxXPColors.Assign( Source: TPersistent );
Begin
  If Source Is TmxBorder Then
  Begin
    FBorderColor := TmxXPColors( Source ).BorderColor;
    FBackground := TmxXPColors( Source ).Background;
    FUseShadow := TmxXPColors( Source ).UseShadow;
    FShadowColor := TmxXPColors( Source ).ShadowColor;

    Change;
  End
  Else Inherited Assign( Source );
End;

Procedure TmxXPColors.AssignTo( Destination: TPersistent );
Begin
  If Destination Is TmxXPColors Then
  Begin
    TmxXPColors( Destination ).Assign( Self );
  End
  Else Inherited AssignTo( Destination );
End;

{TmxStatusButton}

Constructor TmxStatusButton.Create;
Begin
  Inherited Create;

  FArrowColor := clBlack;
  FBackground := clWhite;
  FBorderColor := clGray;
  FTransparent := False;
End;

Procedure TmxStatusButton.Change;
Begin
  If Assigned( FOnChangeParameter ) Then FOnChangeParameter( Self );
End;

Procedure TmxStatusButton.Assign( Source: TPersistent );
Begin
  If Source Is TmxStatusButton Then
  Begin
    FArrowColor := TmxStatusButton( Source ).ArrowColor;
    FBackground := TmxStatusButton( Source ).Background;
    FBorderColor := TmxStatusButton( Source ).BorderColor;
    FTransparent := TmxStatusButton( Source ).Transparent;

    Change;
  End
  Else Inherited Assign( Source );
End;

Procedure TmxStatusButton.AssignTo( Destination: TPersistent );
Begin
  If Destination Is TmxStatusButton Then
  Begin
    TmxStatusButton( Destination ).Assign( Self );
  End
  Else Inherited AssignTo( Destination );
End;

Procedure TmxStatusButton.SetTransparent( AValue: Boolean );
Begin
  If FTransparent <> AValue Then
  Begin
    FTransparent := AValue;
    Change;
  End;
End;

Procedure TmxStatusButton.SetColor( Index: Integer; AValue: TColor );
Begin
  Case Index Of
    1: FArrowColor := AValue;
    2: FBackground := AValue;
    3: FBorderColor := AValue;
  End;
  Change;
End;

Function TmxStatusButton.GetColor( Index: Integer ): TColor;
Begin
  Case Index Of
    1: Result := FArrowColor;
    2: Result := FBackground;
    3: Result := FBorderColor;
  Else Result := clBtnFace;
  End;
End;

{TmxCustomBackground}

Constructor TmxCustomBackground.Create;
Begin
  Inherited Create;

  FAlphaBlend := 255;
  FBitmapCopy := bcSrcCopy;
  FBackgroundBitmap := TBitmap.Create;
  FBackgroundStyle := btSolid;
  FColor := clGray;

  FGradient := TmxGradient.Create;

  FGrayscale := False;
  FDrawing := False;
End;

Destructor TmxCustomBackground.Destroy;
Begin
  FGradient.Free;
  FBackgroundBitmap.Free;
  Inherited Destroy;
End;

Procedure TmxCustomBackground.SetBackgroundBitmap( AValue: TBitmap );
Begin
  FBackgroundBitmap.Assign( AValue );
  Change;
End;

Procedure TmxCustomBackground.SetBitmapCopy( AValue: TmxBitmapCopy );
Begin
  If FBitmapCopy <> AValue Then
  Begin
    FBitmapCopy := AValue;
    Change;
  End;
End;

Procedure TmxCustomBackground.SetAlphaBlend( AValue: Byte );
Begin
  If FAlphaBlend <> AValue Then
  Begin
    FAlphaBlend := AValue;
    Change;
  End;
End;

Procedure TmxCustomBackground.SetBackgroundStyle( AValue: TmxBackgroundStyle );
Begin
  If FBackgroundStyle <> AValue Then
  Begin
    FBackgroundStyle := AValue;
    Change;
  End;
End;

Procedure TmxCustomBackground.SetColor( AValue: TColor );
Begin
  If FColor <> AValue Then
  Begin
    FColor := AValue;
    Change;
  End;
End;

Procedure TmxCustomBackground.SetGrayscale( AValue: Boolean );
Begin
  If FGrayscale <> AValue Then
  Begin
    FGrayscale := AValue;
    Change;
  End;
End;

Procedure TmxCustomBackground.Change;
Begin
  If Assigned( FOnChangeParameter ) Then FOnChangeParameter( Self );
End;

Procedure TmxCustomBackground.DrawBitmapBackground( ACanvas: TCanvas; ARect: TRect; Tiled: Boolean );
Var
  X, Y, W, H: LongInt;
  BitmapCopy: DWORD;
  rgn: Hrgn;
Begin
  If FBackgroundBitmap.Empty Then Exit;

  W := FBackgroundBitmap.Width;
  H := FBackgroundBitmap.Height;
  Y := ARect.Top;

  rgn := CreateRectRgn( ARect.Left, ARect.Top, ARect.Right, ARect.Bottom );
  SelectClipRgn( ACanvas.Handle, rgn );

  Case FBitmapCopy Of
    bcMergeCopy: BitmapCopy := MergeCopy;
    bcMergePaint: BitmapCopy := MergePaint;
    bcSrcCopy: BitmapCopy := SrcCopy;
    bcSrcErase: BitmapCopy := SrcErase;
    bcSrcPaint: BitmapCopy := SrcPaint;
  Else BitmapCopy := SrcCopy;
  End;

  While Y < ARect.Bottom Do
  Begin
    X := ARect.Left;

    While X < ARect.Right Do
    Begin
      BitBlt( ACanvas.Handle, X, Y, W, H, FBackgroundBitmap.Canvas.Handle, 0, 0, BitmapCopy );
      If Not Tiled Then Break;
      Inc( X, W );
    End;

    If Not Tiled Then Break;
    Inc( Y, H );
  End;

  SelectClipRgn( ACanvas.handle, 0 );
  DeleteObject( rgn );
End;

Procedure TmxCustomBackground.DrawSolidBackground( ACanvas: TCanvas; ARect: TRect );
Begin
  ACanvas.Brush.Color := FColor;
  ACanvas.FillRect( ARect );
End;

Procedure TmxCustomBackground.SetOnChangeParameter( AValue: TNotifyEvent );
Begin
{$WARNINGS OFF}
  If @FOnChangeParameter <> @AValue Then
{$WARNINGS ON}
  Begin
    FOnChangeParameter := AValue;
    FGradient.OnChangeParameter := AValue;
  End;
End;

Procedure TmxCustomBackground.ConvertToGrayScale( DrawBitmap: TBitmap; ARect: TRect );
Var
  Line: PByteArray;
  Gray, X, Y: Integer;
Begin
  If Not FGrayscale Then Exit;

  For Y := ARect.Top To ARect.Bottom - 1 Do
  Begin
    Line := DrawBitmap.Scanline[ Y ];

    For X := ARect.Left To ARect.Right - 1 Do
    Begin
      Gray := ( Line[ X * 4 ] + Line[ X * 4 + 1 ] + Line[ X * 4 + 2 ] + Line[ X * 4 + 3 ] ) Div 4;

      Line[ X * 4 ] := Gray;
      Line[ X * 4 + 1 ] := Gray;
      Line[ X * 4 + 2 ] := Gray;
      Line[ X * 4 + 3 ] := Gray;
    End;
  End;
End;

Procedure TmxCustomBackground.AlphaBlendBackground( DrawBitmap: TBitmap; Const ARect: TRect );
Begin
  If FAlphaBlend = 255 Then Exit;
  AlphaBlendArea( DrawBitmap, ARect, ( 255 - FAlphaBlend ), FColor );
End;

Procedure TmxCustomBackground.DrawBackground( DrawBitmap: TBitmap; ARect: TRect );
Begin
  If FDrawing Then Exit;
  If ARect.Right - ARect.Left < 1 Then Exit;

  FDrawing := True;
  DrawBitmap.Canvas.Brush.Style := bsSolid;

  Case FBackgroundStyle Of
    btBitmap:
      Begin
        DrawSolidBackground( DrawBitmap.Canvas, ARect );
        DrawBitmapBackground( DrawBitmap.Canvas, ARect, False );
      End;
    btGradient:
      Begin
        DrawSolidBackground( DrawBitmap.Canvas, ARect );
        FGradient.DrawGradient( DrawBitmap.Canvas, ARect );
      End;
    btTileBitmap:
      Begin
        DrawSolidBackground( DrawBitmap.Canvas, ARect );
        DrawBitmapBackground( DrawBitmap.Canvas, ARect, True );
      End;
    btSolid: DrawSolidBackground( DrawBitmap.Canvas, ARect );
    btTransparent: ; // *** Do not need to do anything here ***
  End;

  AlphaBlendBackground( DrawBitmap, ARect );
  ConvertToGrayScale( DrawBitmap, ARect );

  FDrawing := False;
End;

Procedure TmxCustomBackground.Assign( Source: TPersistent );
Begin
  If Source Is TmxBackground Then
  Begin
    FAlphaBlend := TmxBackground( Source ).AlphaBlend;
    FBackgroundBitmap.Assign( TmxBackground( Source ).Bitmap );
    FBackgroundStyle := TmxBackground( Source ).Style;
    FBitmapCopy := TmxBackground( Source ).BitmapCopy;
    FColor := TmxBackground( Source ).Color;
    FGradient.Assign( TmxBackground( Source ).Gradient );
    FGrayscale := TmxBackground( Source ).Grayscale;

    Change;
  End
  Else Inherited Assign( Source );
End;

Procedure TmxCustomBackground.AssignTo( Destination: TPersistent );
Begin
  If Destination Is TmxBackground Then
  Begin
    TmxBackground( Destination ).Assign( Self );
  End
  Else Inherited AssignTo( Destination );
End;

{TmxButtonBackground}

Constructor TmxButtonBackground.Create;
Begin
  Inherited Create;
  FColor := clbtnFace;
End;

{TmxXPGlyph}

Constructor TmxGlyph.Create;
Begin
  Inherited Create;
  FPosition := gpBottomRight;
  FBitmap := TBitmap.Create;
  FDrawing := False;
  FTransparent := True;
  FVisible := True;
End;

Destructor TmxGlyph.Destroy;
Begin
  FBitmap.Free;
  Inherited Destroy;
End;

Procedure TmxGlyph.Assign( Source: TPersistent );
Begin
  If Source Is TmxGlyph Then
  Begin

    FPosition := TmxGlyph( Source ).Position;
    FBitmap.Assign( TmxGlyph( Source ).Bitmap );
    FTransparent := TmxGlyph( Source ).Transparent;
    FVisible := TmxGlyph( Source ).Visible;

    Change;
  End
  Else Inherited Assign( Source );
End;

Procedure TmxGlyph.AssignTo( Destination: TPersistent );
Begin
  If Destination Is TmxGlyph Then
  Begin
    TmxGlyph( Destination ).Assign( Self );
  End
  Else Inherited AssignTo( Destination );
End;

Procedure TmxGlyph.SetPosition( AValue: TmxGlyphPosition );
Begin
  If FPosition <> AValue Then
  Begin
    FPosition := AValue;
    Change;
  End;
End;

Procedure TmxGlyph.SetTransparent( AValue: Boolean );
Begin
  If FTransparent <> AValue Then
  Begin
    FTransparent := AValue;
    Change;
  End;
End;

Procedure TmxGlyph.SetVisible( AValue: Boolean );
Begin
  If FVisible <> AValue Then
  Begin
    FVisible := AValue;
    Change;
  End;
End;

Procedure TmxGlyph.SetBitmap( AValue: TBitmap );
Begin
  FBitmap.Assign( AValue );
  Change;
End;

Procedure TmxGlyph.SetOnChangeParameter( AValue: TNotifyEvent );
Begin
{$WARNINGS OFF}
  If @FOnChangeParameter <> @AValue Then
{$WARNINGS ON}
  Begin
    FOnChangeParameter := AValue;
  End;
End;

Procedure TmxGlyph.Change;
Begin
  If Assigned( FOnChangeParameter ) Then FOnChangeParameter( Self );
End;

Procedure TmxGlyph.DrawGlyph( DrawBitmap: TBitmap; ARect: TRect );
Var
  MyRect: TRect;
  IX, IY: Integer;
  rgn: HRgn;
Begin
  If Not Visible Then Exit;
  If FDrawing Then Exit;
  If ARect.Right - ARect.Left < 1 Then Exit;
  If Not Assigned( FBitmap ) Then Exit;

  FDrawing := True;
  DrawBitmap.Canvas.Brush.Style := bsSolid;

  rgn := CreateRectRgn( ARect.Left, ARect.Top, ARect.Right, ARect.Bottom );
  SelectClipRgn( DrawBitmap.Canvas.Handle, rgn );

  // *** Set up the MyRect record ***

  IX := Bitmap.Width;
  IY := Bitmap.Height;

  MyRect := ARect;

  Case FPosition Of
    gpTopLeft:
      Begin
        MyRect.Right := MyRect.Left + IX;
        MyRect.Bottom := MyRect.Top + IY;
      End;
    gpTopRight:
      Begin
        MyRect.Left := MyRect.Right - IX;
        MyRect.Bottom := MyRect.Top + IY;
      End;
    gpBottomLeft:
      Begin
        MyRect.Right := MyRect.Left + IX;
        MyRect.Top := MyRect.Bottom - IY;
      End;
    gpBottomRight:
      Begin
        MyRect.Left := MyRect.Right - IX;
        MyRect.Top := MyRect.Bottom - IY;
      End;
    gpCenter:
      Begin
        MyRect.Left := MyRect.Left + ( ( MyRect.Right - MyRect.Left - IX ) Div 2 );
        MyRect.Right := MyRect.Left + IX;
        MyRect.Top := MyRect.Top + ( ( MyRect.Bottom - MyRect.Top - IY ) Div 2 );
        MyRect.Bottom := MyRect.Top + IY;
      End;
  End;

  FBitmap.TransparentMode := tmAuto;
  FBitmap.Transparent := FTransparent;

  DrawBitmap.Canvas.Draw( MyRect.Left, MyRect.Top, FBitmap );

  SelectClipRgn( DrawBitmap.Canvas.handle, 0 );
  DeleteObject( rgn );

  FDrawing := False;
End;

{TmxBarSettings}

Constructor TmxBarSettings.Create;
Begin
  Inherited Create;

  FHeight := DefaultHeaderHeight;
  FExplorerAddOn := DefaultExplorerAddOn;
  FLayout := glGlyphLeft;
  FAlignment := taCenter;
  FFont := TFont.Create;
  FFont.OnChange := PropertyChanged;
  FHighlightFont := TFont.Create;
  FHighlightFont.OnChange := PropertyChanged;
  FColor := clbtnFace;

  FCaptionPen := TPen.Create;
  FCaptionPen.OnChange := PropertyChanged;

  FHeaderPen := TPen.Create;
  FHeaderPen.OnChange := PropertyChanged;

  FCaptionStyle := csButtonStyle;

  FButtonUp := TmxButtonBackground.Create;
  FButtonUp.OnChangeParameter := PropertyChanged;

  FButtonDown := TmxButtonBackground.Create;
  FButtonDown.OnChangeParameter := PropertyChanged;

  FButtonFocused := TmxButtonBackground.Create;
  FButtonFocused.OnChangeParameter := PropertyChanged;

  FButtonDisabled := TmxButtonBackground.Create;
  FButtonDisabled.OnChangeParameter := PropertyChanged;

  FStatusButton := TmxStatusButton.Create;
  FStatusButton.OnChangeParameter := PropertyChanged;

  FXPColors := TmxXPColors.Create;
  FXPColors.OnChange := PropertyChanged;

  FButtonSizes[ 1 ] := 60;
  FButtonSizes[ 2 ] := 60;
  FButtonSizes[ 3 ] := 20;

  FButtonDistance := 2;

  FButtonStyle := bsLarge;
  FButtonView := bvNormal;

  FButtonFont := TFont.Create;
  FButtonFont.OnChange := PropertyChanged;
  FButtonHighlightFont := TFont.Create;
  FButtonHighlightFont.OnChange := PropertyChanged;

  FPicLabDistance := 8;
  FGlyphTop := 10;

  FKeySupport := True;
End;

Destructor TmxBarSettings.Destroy;
Begin
  FButtonHighlightFont.Free;
  FButtonFont.Free;
  FXPColors.Free;
  FStatusButton.Free;
  FCaptionPen.Free;
  FHeaderPen.Free;
  FFont.Free;
  FHighlightFont.Free;
  FButtonUp.Free;
  FButtonDown.Free;
  FButtonDisabled.Free;

  Inherited Destroy;
End;

Procedure TmxBarSettings.SetHeight( AValue: Integer );
Begin
  If FHeight <> AValue Then
  Begin
    FHeight := AValue;
    Change;
  End;
End;

Procedure TmxBarSettings.SetExplorerAddOn( AValue: Word );
Begin
  If FExplorerAddOn <> AValue Then
  Begin
    FExplorerAddOn := AValue;
    Change;
  End;
End;

Procedure TmxBarSettings.SetGlyphTop( AValue: Integer );
Begin
  If FGlyphTop <> AValue Then
  Begin
    FGlyphTop := AValue;
    Change;
  End;
End;

Procedure TmxBarSettings.SetKeySupport( AValue: Boolean );
Begin
  If FKeySupport <> AValue Then
  Begin
    FKeySupport := AValue;
    Change;
  End;
End;

Procedure TmxBarSettings.SetCaptionStyle( AValue: TmxCaptionStyle );
Begin
  If FCaptionStyle <> AValue Then
  Begin
    FCaptionStyle := AValue;
    Change;
  End;
End;

Procedure TmxBarSettings.SetStatusButton( AValue: TmxStatusButton );
Begin
  FStatusButton.Assign( AValue );
End;

Procedure TmxBarSettings.SetFont( AValue: TFont );
Begin
  FFont.Assign( AValue );
  Change;
End;

Procedure TmxBarSettings.SetHighlightFont( AValue: TFont );
Begin
  FHighlightFont.Assign( AValue );
  Change;
End;

Procedure TmxBarSettings.SetButtonFont( AValue: TFont );
Begin
  FButtonFont.Assign( AValue );
  Change;
End;

Procedure TmxBarSettings.SetButtonHighlightFont( AValue: TFont );
Begin
  FButtonHighlightFont.Assign( AValue );
  Change;
End;

Procedure TmxBarSettings.SetCaptionPen( AValue: TPen );
Begin
  FCaptionPen.Assign( AValue );
End;

Procedure TmxBarSettings.SetHeaderPen( AValue: TPen );
Begin
  FHeaderPen.Assign( AValue );
End;

Procedure TmxBarSettings.PropertyChanged( Sender: TObject );
Begin
  Change;
End;

Function TmxBarSettings.GetBackground( Index: Integer ): TmxButtonBackground;
Begin
  Case Index Of
    1: Result := FButtonUp;
    2: Result := FButtonDown;
    3: Result := FButtonFocused;
    4: Result := FButtonDisabled;
  Else
    Result := Nil;
  End;
End;

Procedure TmxBarSettings.SetBackground( Index: Integer; AValue: TmxButtonBackground );
Begin
  Case Index Of
    1: FButtonUp.Assign( AValue );
    2: FButtonDown.Assign( AValue );
    3: FButtonFocused.Assign( AValue );
    4: FButtonDisabled.Assign( AValue );
  End;
End;

Procedure TmxBarSettings.SetButtonSize( Index: Integer; AValue: Integer );
Begin
  If Not ( Index In [ 1..3 ] ) Then Exit;

  If FButtonSizes[ Index ] <> AValue Then
  Begin
    FButtonSizes[ Index ] := AValue;
    Change;
  End;
End;

Function TmxBarSettings.GetButtonSize( Index: Integer ): Integer;
Begin
  Result := -1;
  If Not ( Index In [ 1..3 ] ) Then Exit;
  Result := FButtonSizes[ Index ];
End;

Procedure TmxBarSettings.SetButtonDistance( AValue: Integer );
Begin
  If FButtonDistance <> AValue Then
  Begin
    FButtonDistance := AValue;
    Change;
  End;
End;

Procedure TmxBarSettings.SetButtonStyle( AValue: TmxButtonStyle );
Begin
  If FButtonStyle <> AValue Then
  Begin
    FButtonStyle := AValue;
    Change;
  End;
End;

Procedure TmxBarSettings.SetButtonView( AValue: TmxButtonView );
Begin
  If FButtonView <> AValue Then
  Begin
    FButtonView := AValue;
    Change;
  End;
End;

Procedure TmxBarSettings.SetPicLabDistance( AValue: Integer );
Begin
  If FPicLabDistance <> AValue Then
  Begin
    FPicLabDistance := AValue;
    Change;
  End;
End;

Procedure TmxBarSettings.SetLayout( AValue: TmxGlyphLayout );
Begin
  If FLayout <> AValue Then
  Begin
    FLayout := AValue;
    Change;
  End;
End;

Procedure TmxBarSettings.SetAlignment( AValue: TAlignment );
Begin
  If FAlignment <> AValue Then
  Begin
    FAlignment := AValue;
    Change;
  End;
End;

Procedure TmxBarSettings.SetColor( AValue: TColor );
Begin
  If FColor <> AValue Then
  Begin
    FColor := AValue;
    Change;
  End;
End;

Procedure TmxBarSettings.Change;
Begin
  If Assigned( FOnChangeParameter ) Then FOnChangeParameter( Self );
End;

Procedure TmxBarSettings.Assign( Source: TPersistent );
Begin
  If Source Is TmxBarSettings Then
  Begin
    FAlignment := TmxBarSettings( Source ).Alignment;
    FColor := TmxBarSettings( Source ).Color;
    FFont.Assign( TmxBarSettings( Source ).Font );
    FHighlightFont.Assign( TmxBarSettings( Source ).HighlightFont );
    FHeight := TmxBarSettings( Source ).Height;
    FLayout := TmxBarSettings( Source ).Layout;
    FHeaderPen.Assign( TmxBarSettings( Source ).HeaderPen );
    FCaptionPen.Assign( TmxBarSettings( Source ).CaptionPen );
    FCaptionStyle := TmxBarSettings( Source ).CaptionStyle;
    FExplorerAddOn := TmxBarSettings( Source ).ExplorerAddOn;
    FStatusButton.Assign( TmxBarSettings( Source ).StatusButton );
    FButtonUp.Assign( TmxBarSettings( Source ).ButtonUp );
    FButtonDown.Assign( TmxBarSettings( Source ).ButtonDown );
    FButtonFocused.Assign( TmxBarSettings( Source ).ButtonFocused );
    FButtonDisabled.Assign( TmxBarSettings( Source ).ButtonDisabled );
    FXPColors.Assign( TmxBarSettings( Source ).XPColors );
    FButtonSizes := TmxBarSettings( Source ).FButtonSizes;
    FButtonDistance := TmxBarSettings( Source ).Distance;
    FButtonStyle := TmxBarSettings( Source ).ButtonStyle;
    FButtonView := TmxBarSettings( Source ).ButtonView;
    FPicLabDistance := TmxBarSettings( Source ).PicLabDistance;
    FGlyphTop := TmxBarSettings( Source ).GlyphTop;
    FButtonFont.Assign( TmxBarSettings( Source ).ButtonFont );
    FButtonHighlightFont.Assign( TmxBarSettings( Source ).ButtonHighlightFont );

    Change;
  End
  Else Inherited Assign( Source );
End;

Procedure TmxBarSettings.AssignTo( Destination: TPersistent );
Begin
  If Destination Is TmxBarSettings Then
  Begin
    TmxBarSettings( Destination ).Assign( Self );
  End
  Else Inherited AssignTo( Destination );
End;

{TmxInplaceEdit}

Constructor TmxInplaceEdit.Create( AOwner: TComponent );
Begin
  Inherited Create( AOwner );

  FAlignment := taLeftJustify;
  FActivate := False;
  FFlat := TRUE;
  FShowBorder := TRUE;
  FMouseInHeader := False;
  FBorderColor := clBtnShadow;
  FWordWrap := True;
End;

Procedure TmxInplaceEdit.CreateParams( Var Params: TCreateParams );
Const
  Alignments: Array[ TAlignment ] Of Longint = ( ES_LEFT, ES_RIGHT, ES_CENTER );
  WordWraps: Array[ Boolean ] Of LongInt = ( 0, ES_AUTOHSCROLL );
Begin
  Inherited CreateParams( Params );
{$WARNINGS OFF}
  Params.Style := Params.Style And ( Not WordWraps[ FWordWrap ] ) Or ES_MULTILINE Or Alignments[ FAlignment ];
{$WARNINGS ON}
End;

Procedure TmxInplaceEdit.Assign( Source: TPersistent );
Begin
  If Source Is TmxInplaceEdit Then
  Begin
    Font.Assign( TmxInplaceEdit( Source ).Font );
    FFlat := TmxInplaceEdit( Source ).Flat;
    FBorderColor := TmxInplaceEdit( Source ).BorderColor;
    FShowBorder := TmxInplaceEdit( Source ).ShowBorder;

    Change;
  End
  Else Inherited Assign( Source );
End;

Procedure TmxInplaceEdit.DrawComponentBorder( AColor: TColor; ABorder: TColor; AStyle: TmxBorderStyle; ACanvas: TCanvas; ARect: TRect );
Begin
  Case AStyle Of
    mxDefault:
      Begin
        ACanvas.Pen.Style := psSolid;
        ACanvas.Brush.Style := bsClear;
        ACanvas.Pen.Color := AColor;
        DrawEdge( ACanvas.Handle, ARect, EDGE_SUNKEN, BF_RECT );
      End;
    mxFlat:
      Begin
        ACanvas.Brush.Style := bsClear;
        ACanvas.Pen.Style := psSolid;
        ACanvas.Pen.Color := ABorder;
        ACanvas.Rectangle( ARect.Left, ARect.Top, ARect.Right, ARect.Bottom );
      End;
    mxFocusedFlat:
      Begin
        DrawEdge( ACanvas.Handle, ARect, BDR_SUNKENOUTER, BF_RECT );
        InflateRect( ARect, -1, -1 );
        ACanvas.Pen.Style := psSolid;
        ACanvas.Pen.Color := clBtnFace;
        ACanvas.Rectangle( ARect.Left, ARect.Top, ARect.Right, ARect.Bottom );
      End;
    mxSolid:
      Begin
        ACanvas.Brush.Style := bsClear;
        ACanvas.Pen.Style := psSolid;
        ACanvas.Pen.Color := AColor;
        ACanvas.Rectangle( ARect.Left, ARect.Top, ARect.Right, ARect.Bottom );
        InflateRect( ARect, -1, -1 );
        ACanvas.Rectangle( ARect.Left, ARect.Top, ARect.Right, ARect.Bottom );
      End;
    mxSingle:
      Begin
        ACanvas.Brush.Style := bsClear;
        ACanvas.Pen.Style := psSolid;
        ACanvas.Pen.Color := clWindowFrame;
        ACanvas.Rectangle( ARect.Left, ARect.Top, ARect.Right, ARect.Bottom );
      End;
    mxButton:
      Begin
        DrawEdge( ACanvas.Handle, ARect, BDR_RAISEDINNER, BF_RECT );
        InflateRect( ARect, -1, -1 );
        ACanvas.Pen.Style := psSolid;
        ACanvas.Pen.Color := clBtnFace;
        ACanvas.Rectangle( ARect.Left, ARect.Top, ARect.Right, ARect.Bottom );
      End;
    mxFlatButton:
      Begin
        DrawEdge( ACanvas.Handle, ARect, EDGE_RAISED, BF_RECT );
      End;
    mxFlatButtonDown:
      Begin
        ACanvas.Brush.Style := bsClear;
        ACanvas.Pen.Style := psSolid;
        ACanvas.Pen.Color := clWindowFrame;
        ACanvas.Rectangle( ARect.Left, ARect.Top, ARect.Right, ARect.Bottom );
        InflateRect( ARect, -1, -1 );
        ACanvas.Pen.Color := clBtnShadow;
        ACanvas.Rectangle( ARect.Left, ARect.Top, ARect.Right, ARect.Bottom );
      End;
    mxSpeedUp:
      Begin
        ACanvas.Brush.Style := bsClear;
        ACanvas.Pen.Style := psSolid;
        ACanvas.Pen.Color := clWindowFrame;
        ACanvas.Rectangle( ARect.Left, ARect.Top, ARect.Right, ARect.Bottom );
        ACanvas.Pen.Color := clBtnHighlight;
        ACanvas.Rectangle( ARect.Left, ARect.Top, ARect.Right - 1, ARect.Bottom - 1 );
        InflateRect( ARect, -1, -1 );
        ACanvas.Pen.Color := clBtnFace;
        ACanvas.Rectangle( ARect.Left, ARect.Top, ARect.Right, ARect.Bottom );
        InflateRect( ARect, -1, -1 );
        ACanvas.Pen.Color := clBtnShadow;
        ACanvas.MoveTo( ARect.Left - 1, ARect.Bottom );
        ACanvas.LineTo( ARect.Right, ARect.Bottom );
        ACanvas.LineTo( ARect.Right, ARect.Top - 2 );
      End;
  End;
End;

Procedure TmxInplaceEdit.SetFlat( AValue: Boolean );
Begin
  If FFlat <> AValue Then
  Begin
    FFlat := AValue;
    If csLoading In ComponentState Then Exit;
    InvalidateControl;
  End;
End;

Procedure TmxInplaceEdit.SetShowBorder( AValue: Boolean );
Begin
  If FShowBorder <> AValue Then
  Begin
    FShowBorder := AValue;
    If csLoading In ComponentState Then Exit;
    InvalidateControl;
  End;
End;

Procedure TmxInplaceEdit.SetWordWrap( AValue: Boolean );
Begin
  If AValue <> FWordWrap Then
  Begin
    FWordWrap := AValue;
    ReCreateWnd;
  End;
End;

Procedure TmxInplaceEdit.SetAlignment( AValue: TAlignment );
Begin
  If FAlignment <> AValue Then
  Begin
    FAlignment := AValue;
    RecreateWnd;
  End;
End;

Procedure TmxInplaceEdit.InvalidateControl;
Var
  R: TRect;
Begin
  R := Rect( 0, 0, Width, Height );
{$WARNINGS OFF}
  RedrawWindow( Handle, @R, 0, rdw_Invalidate Or rdw_Frame );
{$WARNINGS ON}
End;

Procedure TmxInplaceEdit.WMNCPaint( Var Message: TMessage );
Begin
  Inherited;
  SetControlBorder;
  Message.Result := 0;
End;

Procedure TmxInplaceEdit.SetControlBorder;
Var
  R: TRect;
  Canvas: TCanvas;
Begin
  R := Rect( 0, 0, Width, Height );
  Canvas := TCanvas.Create;
  Try
    Canvas.Handle := GetWindowDC( Handle );
    Canvas.Pen.Style := psSolid;
    Canvas.Pen.Color := Color;
    Canvas.Brush.Style := bsClear;
    Canvas.Rectangle( 0, 0, Width, Height );
    Canvas.Rectangle( 1, 1, Width - 1, Height - 1 );

    If FFlat Then
    Begin
      If FShowBorder Then
        DrawComponentBorder( Color, FBorderColor, mxFlat, Canvas, R ) Else
        DrawComponentBorder( Color, FBorderColor, mxSolid, Canvas, R );
    End
    Else
      DrawComponentBorder( Color, FBorderColor, mxDefault, Canvas, R );
  Finally
    ReleaseDC( Handle, Canvas.Handle );
    Canvas.Free;
  End;
End;

Procedure TmxInplaceEdit.CMMouseEnter( Var Message: TMessage );
Begin
  Inherited;
  FMouseInHeader := True;
  If FFlat And FActivate Then InvalidateControl;
End;

Procedure TmxInplaceEdit.CMMouseLeave( Var Message: TMessage );
Begin
  Inherited;
  FMouseInHeader := False;
  If FFlat And FActivate Then InvalidateControl;
End;

Procedure TmxInplaceEdit.WMSize( Var Message: TWMSize );
Begin
  Inherited;
  InvalidateControl;
End;

Procedure TmxInplaceEdit.WMSetFocus( Var Message: TWMSetFocus );
Begin
  Inherited;
  InvalidateControl;
End;

Procedure TmxInplaceEdit.WMKillFocus( Var Message: TWMKillFocus );
Begin
  Inherited;
  InvalidateControl;
End;

Procedure TmxInplaceEdit.SetBorderColor( AValue: TColor );
Begin
  If FBorderColor <> AValue Then
  Begin
    FBorderColor := AValue;
    If FFlat Then InvalidateControl;
  End;
End;

Procedure TmxInplaceEdit.AssignTo( Destination: TPersistent );
Begin
  If Destination Is TmxInplaceEdit Then
  Begin
    TmxInplaceEdit( Destination ).Assign( Self );
  End
  Else Inherited AssignTo( Destination );
End;

Procedure TmxInplaceEdit.SetFont( AValue: TFont );
Begin
  Font.Assign( AValue );
  Change;
End;

Function TmxInplaceEdit.GetFont: TFont;
Begin
  Result := Inherited Font;
End;

{TmxInplaceEditor}

Constructor TmxInplaceEditor.Create( AOwner: TmxOutlookBarPro );
Begin
  Inherited Create;

  FEdit := TmxInplaceEdit.Create( AOwner );
  FEdit.Parent := AOwner;
  FEdit.Visible := False;
  FEdit.Top := -1000;
  FEdit.OnExit := OnEditExit;
  FEdit.OnKeyDown := DoEditKeyDown;
  FEdit.AutoSize := False;

  FEditing := False;
End;

Procedure TmxInplaceEditor.Change;
Begin
  If Assigned( FOnChange ) Then FOnChange( Self );
End;

Procedure TmxInplaceEditor.Assign( Source: TPersistent );
Begin
  If Source Is TmxInplaceEditor Then
  Begin
    FEdit.Assign( TmxInplaceEditor( Source ).FEdit );
    Change;
  End
  Else Inherited Assign( Source );
End;

Procedure TmxInplaceEditor.SetFlat( AValue: Boolean );
Begin
  FEdit.Flat := AValue;
End;

Procedure TmxInplaceEditor.SetShowBorder( AValue: Boolean );
Begin
  FEdit.ShowBorder := AValue;
End;

Function TmxInplaceEditor.GetShowBorder: Boolean;
Begin
  Result := FEdit.ShowBorder;
End;

Function TmxInplaceEditor.GetFlat: Boolean;
Begin
  Result := FEdit.Flat;
End;

Procedure TmxInplaceEditor.SetWordWrap( AValue: Boolean );
Begin
  FEdit.WordWrap := AValue;
End;

Function TmxInplaceEditor.GetWordWrap: Boolean;
Begin
  Result := FEdit.WordWrap;
End;

Procedure TmxInplaceEditor.SetAlignment( AValue: TAlignment );
Begin
  FEdit.Alignment := AValue;
End;

Function TmxInplaceEditor.GetAlignment: TAlignment;
Begin
  Result := FEdit.Alignment;
End;

Procedure TmxInplaceEditor.SetPopup( AValue: TPopupMenu );
Begin
  FEdit.PopupMenu := AValue;
End;

Function TmxInplaceEditor.GetPopup: TPopupMenu;
Begin
  Result := FEdit.PopupMenu;
End;

Procedure TmxInplaceEditor.SetOnContextPopup( AValue: TContextPopupEvent );
Begin
  FEdit.OnContextPopup := AValue;
End;

Function TmxInplaceEditor.GetOnContextPopup: TContextPopupEvent;
Begin
  Result := FEdit.OnContextPopup;
End;

Procedure TmxInplaceEditor.SetBorderColor( AValue: TColor );
Begin
  FEdit.BorderColor := AValue;
End;

Function TmxInplaceEditor.GetBorderColor: TColor;
Begin
  Result := FEdit.BorderColor;
End;

Procedure TmxInplaceEditor.AssignTo( Destination: TPersistent );
Begin
  If Destination Is TmxInplaceEditor Then
  Begin
    TmxInplaceEditor( Destination ).Assign( Self );
  End
  Else Inherited AssignTo( Destination );
End;

Procedure TmxInplaceEditor.SetFont( AValue: TFont );
Begin
  FEdit.Font.Assign( AValue );
End;

Function TmxInplaceEditor.GetFont: TFont;
Begin
  Result := FEdit.Font;
End;

Procedure TmxInplaceEditor.DoProcessEditResults( ACancel: Boolean );
Begin
  If ( FEditingItem <> Nil ) And ( Not ACancel ) Then
  Begin
    If FHeaderEdit Then
      TmxHeader( FEditingItem ).Caption := FEdit.Text Else
      TmxButton( FEditingItem ).Caption := FEdit.Text;

    Change;
  End;
End;

Procedure TmxInplaceEditor.DoEndEdit( ACancel: Boolean );
Begin
  If FEditing Then
  Begin
    FEditing := False;
    FEdit.Top := -1000; // *** Move it to invisible area ***
    DoProcessEditResults( ACancel );
    FEdit.Visible := False;
    FEditingItem := Nil;
  End;
End;

Procedure TmxInplaceEditor.DoEditKeyDown( Sender: TObject; Var Key: Word; Shift: TShiftState );
Begin
  If Shift = [ ] Then
  Begin
    If Key = VK_Return Then
    Begin
      DoEndEdit( False );
      Key := 0;
    End;
    If Key = VK_Escape Then
    Begin
      DoEndEdit( True );
      Key := 0;
    End;
  End;
End;

Procedure TmxInplaceEditor.OnEditExit( Sender: TObject );
Begin
  If FEditing Then DoEndEdit( False );
End;

Procedure TmxInplaceEditor.EditHeader( AHeader: TmxHeader );
Begin
  If hoReadOnlyCaption In AHeader.Options Then Exit;
  If FEditing Then DoEndEdit( True );
  FEditingItem := AHeader;
  FHeaderEdit := True;

  With FEdit Do
  Begin
    Text := AHeader.Caption;
    Modified := False;
    SelStart := 0;
    SelLength := Length( Text );
    Height := Max( Height, AHeader.ButtonRect.Bottom - AHeader.ButtonRect.Top );
    BoundsRect := AHeader.ButtonRect;
    Visible := True;
    SetFocus;
  End;

  FEditing := True;
End;

Procedure TmxInplaceEditor.EditButton( AButton: TmxButton );
Begin
  If boReadOnlyCaption In AButton.Options Then Exit;
  If FEditing Then DoEndEdit( True );
  FEditingItem := AButton;
  FHeaderEdit := False;

  With FEdit Do
  Begin
    Text := AButton.Caption;
    Modified := False;
    SelStart := 0;
    SelLength := Length( Text );
    Height := Max( Height, AButton.LabelRect.Bottom - AButton.LabelRect.Top );
    BoundsRect := AButton.LabelRect;
    Visible := True;
    SetFocus;
  End;

  FEditing := True;
End;

{TmxHeader}

Constructor TmxHeader.Create( ACollection: TCollection );
Begin
  Inherited Create( ACollection );

  FEnabled := True;
  FVisible := True;
  FIndex := -1;
  FImageIndex := -1;

  FHeaderOptions := [
    hoButtonDown,
    hoUseHighlightFont,
    hoDrawCaptionBorder,
    hoShowStatusButton,
    hoDrawDisabledButton,
    hoDrawDownButton,
    hoDrawFocusedButton ];

  FAllowSelected := False;
  FSelectedIndex := -1;

  FButtonImages := TmxButtonImages.Create( Nil );
  FSettings := TmxBarSettings.Create;
  FBackground := TmxBackground.Create;
  FGlyph := TmxGlyph.Create;

  FBackground.Color := clGray;

  FButtonRect := Bounds( 0, 0, 0, 0 );
  FBodyRect := Bounds( 0, 0, 0, 0 );

  FOriginalImage := TBitmap.Create;
  FParentBar := Nil;

  FMargin := 4;
  FSpacing := 2;

{$WARNINGS OFF}
  FData := Nil;
{$WARNINGS ON}
  FTag := 0;
  FHeaderState := hsOpened;

  FFirstVisibleButton := 0;
  FFirstButtonTop := 10;

  SetState( hbsUp );

  If Assigned( ACollection ) Then
  Begin
    FButtons := TmxButtons.Create( TmxHeaders( ACollection ).OutlookBarPro, Self, TmxButton );
    OnChangeParameter := TmxHeaders( ACollection ).OutlookBarPro.PropertyChanged;
  End
  Else FButtons := Nil;
End;

Destructor TmxHeader.Destroy;
Begin
  If Assigned( ParentBar ) Then
    If ParentBar.ActiveHeader = Self Then ParentBar.ActiveHeader := Nil;

  If Assigned( FButtons ) Then
  Begin
    ClearButtons;
    FButtons.Free;
  End;

{$WARNINGS OFF}
  FData := Nil;
{$WARNINGS ON}
  FBackground.Free;
  FGlyph.Free;
  FSettings.Free;
  FButtonImages.Free;
  FOriginalImage.Free;

  Inherited Destroy;
End;

Procedure TmxHeader.SetChangeParameter( AValue: TNotifyEvent );
Begin
{$WARNINGS OFF}
  If @OnChangeParameter <> @AValue Then
{$WARNINGS ON}
  Begin
    FOnChangeParameter := AValue;
    FButtonImages.OnChangeParameter := AValue;
    FSettings.OnChangeParameter := AValue;
    FBackground.OnChangeParameter := AValue;
    FGlyph.OnChangeParameter := AValue;
  End;
End;

Function TmxHeader.DrawTextBiDiModeFlags( Flags: Longint ): Longint;
Begin
  Result := Flags;
    { do not change center alignment }

  If UseRightToLeftAlignment Then
    If Result And DT_RIGHT = DT_RIGHT Then
      Result := Result And Not DT_RIGHT { removing DT_RIGHT, makes it DT_LEFT }
    Else If Not ( Result And DT_CENTER = DT_CENTER ) Then
      Result := Result Or DT_RIGHT;
  Result := Result Or DrawTextBiDiModeFlagsReadingOnly;
End;

Function TmxHeader.UseRightToLeftReading: Boolean;
Begin
  Result := SysLocale.MiddleEast And ( BiDiMode <> bdLeftToRight );
End;

Function TmxHeader.UseRightToLeftAlignment: Boolean;
Begin
  Result := SysLocale.MiddleEast And ( BiDiMode = bdRightToLeft );
End;

Function TmxHeader.DrawTextBiDiModeFlagsReadingOnly: Longint;
Begin
  If UseRightToLeftReading Then
    Result := DT_RTLREADING Else
    Result := 0;
End;

Procedure TmxHeader.SetBiDiMode( AValue: TBiDiMode );
Begin
  If FBiDiMode <> AValue Then
  Begin
    FBiDiMode := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxHeader.SetEnabled( AValue: Boolean );
Begin
  If FEnabled <> AValue Then
  Begin
    FEnabled := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxHeader.SetCaption( AValue: String );
Begin
  If FCaption <> AValue Then
  Begin
    FCaption := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxHeader.SetVisible( AValue: Boolean );
Begin
  If FVisible <> AValue Then
  Begin
    FVisible := AValue;

    If Not FVisible Then
    Begin
      If Assigned( ParentBar ) Then
        If GetParentBar.FActiveHeader = Self Then GetParentBar.FActiveHeader := Nil;
    End;

    ChangeParameter;
  End;
End;

Procedure TmxHeader.SetTransparent( AValue: Boolean );
Begin
  If FTransparent <> AValue Then
  Begin
    FTransparent := AValue;
    ChangeParameter;
  End;
End;

Function TmxHeader.GetDisplayName: String;
Begin
  Result := FName;
End;

Procedure TmxHeader.SetDisplayName( Const AValue: String );
Var
  I: Integer;
  Item: TmxHeader;
Begin
  If AnsiCompareText( AValue, FName ) <> 0 Then
  Begin
    If Collection <> Nil Then
      For I := 0 To Collection.Count - 1 Do
      Begin
        Item := TmxHeaders( Collection ).Headers[ I ];
        If ( Item <> Self ) And ( Item Is TmxHeader ) And
          ( AnsiCompareText( AValue, Item.Name ) = 0 ) Then
          Raise Exception.Create( Format( sDuplicatedHeaderName, [ AValue ] ) );
      End;
    FName := AValue;
    Changed( False );
  End;
End;

Procedure TmxHeader.Change;
Begin
  If Assigned( FOnChange ) Then FOnChange( Self );
End;

Procedure TmxHeader.ChangeParameter;
Begin
  If Assigned( FOnChangeParameter ) Then FOnChangeParameter( Self );
End;

Procedure TmxHeader.SetHeaderIndex( AValue: Integer );
Begin
  If Index <> AValue Then
  Begin
    If AValue > Collection.Count - 1 Then
      Index := Collection.Count - 1 Else
      Index := AValue;
    If Assigned( ParentBar ) Then ParentBar.DoInvalidate;
  End;
End;

Function TmxHeader.GetHeaderIndex: Integer;
Begin
  Result := Index;
End;

Procedure TmxHeader.SetHeaderOptions( AValue: TmxHeaderOptions );
Begin
  If FHeaderOptions <> AValue Then
  Begin
    FHeaderOptions := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxHeader.SetImageIndex( AValue: TImageIndex );
Begin
  If FImageIndex <> AValue Then
  Begin
    FImageIndex := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxHeader.SetMargin( AValue: Word );
Begin
  If FMargin <> AValue Then
  Begin
    FMargin := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxHeader.SetSpacing( AValue: Word );
Begin
  If FSpacing <> AValue Then
  Begin
    FSpacing := AValue;
    ChangeParameter;
  End;
End;

Function TmxHeader.GetSettings: TmxBarSettings;
Begin
  If ( ParentBar.CommonStyle ) And ( Not ( hoCustomSettings In FHeaderOptions ) ) Then
    Result := ParentBar.Settings Else
    Result := Settings;
End;

Function TmxHeader.GetExplorerAddon: Integer;
Begin
  Result := 0;
  If hoCustomSettings In FHeaderOptions Then
  Begin
    If ParentBar.ViewStyle = vsExplorerBar Then
      Result := Settings.ExplorerAddOn;
  End
  Else
  Begin
    If ParentBar.ViewStyle = vsExplorerBar Then
      Result := GetSettings.ExplorerAddOn;
  End;
End;

Function TmxHeader.GetHeight: Integer;
Begin
  If hoCustomSettings In FHeaderOptions Then
    Result := Settings.Height Else
    Result := GetSettings.Height;
End;

Procedure TmxHeader.SetHeaderImage;
Var
  ImageList: TCustomImageList;
Begin
  FOriginalImage.Height := 0;
  FOriginalImage.Width := 0;

  ImageList := GetHeaderImageList;
  If ImageList <> Nil Then
  Begin
    If ( ImageIndex <= ImageList.Count - 1 ) And ( ImageIndex >= 0 ) Then
    Begin
      FOriginalImage.Width := ImageList.Width;
      FOriginalImage.Height := ImageList.Height;
      ImageList.Draw( FOriginalImage.Canvas, 0, 0, ImageIndex, FState = hbsDisabled );
    End;
  End;
End;

Function TmxHeader.GetHeaderImageList: TCustomImageList;
Var
  AState: TmxButtonState;
Begin
  Result := Nil;

  With ParentBar Do
  Begin
    AState := FState;
    If ( hoShowSelectedImage In FHeaderOptions ) And ( ParentBar.ActiveHeaderIndex = HeaderIndex ) Then
      AState := hbsFocused;

    If AState In [ hbsDown, hbsFocused ] Then
    Begin
      If Assigned( FHeaderImages.Hot ) Then
      Begin
        If FHeaderImages.Hot.Count - 1 >= ImageIndex Then Result := FHeaderImages.Hot;
      End
      Else
        If Assigned( FHeaderImages.Normal ) Then
        Begin
          If FHeaderImages.Normal.Count - 1 >= ImageIndex Then Result := FHeaderImages.Normal;
        End;
    End
    Else
    Begin
      If Assigned( FHeaderImages.Normal ) Then
      Begin
        If FHeaderImages.Normal.Count - 1 >= ImageIndex Then Result := FHeaderImages.Normal;
      End
    End;
  End;
End;

{$WARNINGS OFF}

Procedure TmxHeader.SetData( AValue: Pointer );
Begin
  FData := AValue;
End;
{$WARNINGS ON}

Function TmxHeader.GetBodyRect: TRect;
Begin
  If ParentBar.ViewStyle <> vsExplorerBar Then
  Begin
    If ParentBar.ActiveHeaderIndex = HeaderIndex Then
      Result := FBodyRect Else
      Result := Bounds( 0, 0, 0, 0 );
  End
  Else Result := FBodyRect;
End;

Procedure TmxHeader.DrawHeaderGlyph( Canvas: TCanvas; Const GlyphPos: TPoint; State: TmxButtonState; Transparent: Boolean );
Begin
  If ( FOriginalImage.Width > 0 ) And ( FOriginalImage.Height > 0 ) Then
    With GlyphPos Do ImageList_DrawEx( GetHeaderImageList.Handle, ImageIndex, Canvas.Handle, X, Y, 0, 0, clNone, clNone, ILD_Transparent );
End;

Procedure TmxHeader.DrawHeaderText( Canvas: TCanvas; Const Caption: String; TextBounds: TRect; State: TmxButtonState; BiDiFlags: LongInt );
Begin
  With Canvas Do
  Begin
    Brush.Style := bsClear;
{$WARNINGS OFF}
    If State = hbsDisabled Then
    Begin
      OffsetRect( TextBounds, 1, 1 );
      Font.Color := clBtnHighlight;
      DrawText( Handle, PChar( Caption ), Length( Caption ), TextBounds, DT_CENTER Or DT_VCENTER Or DT_END_ELLIPSIS Or BiDiFlags );
      OffsetRect( TextBounds, -1, -1 );
      Font.Color := clBtnShadow;
      DrawText( Handle, PChar( Caption ), Length( Caption ), TextBounds, DT_CENTER Or DT_VCENTER Or DT_END_ELLIPSIS Or BiDiFlags );
    End
    Else DrawText( Handle, PChar( Caption ), Length( Caption ), TextBounds, DT_CENTER Or DT_VCENTER Or DT_END_ELLIPSIS Or BiDiFlags );
{$WARNINGS ON}
  End;
End;

Procedure TmxHeader.DrawStatusButton( Canvas: TCanvas; Const Client: TRect );
Var
  X, Y: Integer;
  StatusButton: TmxStatusButton;
Begin
  If Assigned( FOnDrawStatusButton ) Then FOnDrawStatusButton( Self, Canvas, Client, HeaderState ) Else
  Begin
    With Canvas Do
    Begin
      StatusButton := GetSettings.StatusButton;
      Brush.Color := StatusButton.Background;

      If StatusButton.Transparent Then
        Brush.Style := bsClear Else
        Brush.Style := bsSolid;

      Pen.Color := StatusButton.BorderColor;
      Pen.Mode := pmCopy;
      Pen.Style := psSolid;
      Pen.Width := 2;
      Ellipse( Client );

      Pen.Color := StatusButton.ArrowColor;
      Pen.Style := psSolid;
      Pen.Mode := pmCopy;
      Pen.Width := 1;

      X := Client.Left;
      Y := Client.Top;

      If FHeaderState = hsOpened Then
      Begin
        MoveTo( X + 9, Y + 4 );
        LineTo( X + 6, Y + 7 );
        MoveTo( X + 7, Y + 7 );
        LineTo( X + 9, Y + 5 );

        MoveTo( X + 9, Y + 4 );
        LineTo( X + 12, Y + 7 );
        MoveTo( X + 11, Y + 7 );
        LineTo( X + 9, Y + 5 );

        // *** It draws the arrow incorrectly ?????? :(( ***
        Pixels[ X + 9, Y + 5 ] := Pen.Color;
        Pixels[ X + 6, Y + 7 ] := Pen.Color;
        Pixels[ X + 12, Y + 7 ] := Pen.Color;

        // ** 2nd arrow ***

        MoveTo( X + 9, Y + 9 );
        LineTo( X + 6, Y + 12 );
        MoveTo( X + 7, Y + 12 );
        LineTo( X + 9, Y + 10 );

        MoveTo( X + 9, Y + 9 );
        LineTo( X + 12, Y + 12 );
        MoveTo( X + 11, Y + 12 );
        LineTo( X + 9, Y + 10 );

        // *** It draws the arrow incorrectly ?????? :(( ***
        Pixels[ X + 9, Y + 10 ] := Pen.Color;
        Pixels[ X + 6, Y + 12 ] := Pen.Color;
        Pixels[ X + 12, Y + 12 ] := Pen.Color;
      End
      Else
      Begin
        MoveTo( X + 9, Y + 8 );
        LineTo( X + 6, Y + 5 );
        MoveTo( X + 7, Y + 5 );
        LineTo( X + 9, Y + 7 );

        MoveTo( X + 9, Y + 8 );
        LineTo( X + 12, Y + 5 );
        MoveTo( X + 11, Y + 5 );
        LineTo( X + 9, Y + 7 );

        // *** It draws the arrow incorrectly ?????? :(( ***
        Pixels[ X + 9, Y + 7 ] := Pen.Color;
        Pixels[ X + 6, Y + 5 ] := Pen.Color;
        Pixels[ X + 12, Y + 5 ] := Pen.Color;

        // ** 2nd arrow ***

        MoveTo( X + 9, Y + 13 );
        LineTo( X + 6, Y + 10 );
        MoveTo( X + 7, Y + 10 );
        LineTo( X + 9, Y + 12 );

        MoveTo( X + 9, Y + 13 );
        LineTo( X + 12, Y + 10 );
        MoveTo( X + 11, Y + 10 );
        LineTo( X + 9, Y + 12 );

              // *** It draws the arrow incorrectly ?????? :(( ***
        Pixels[ X + 9, Y + 12 ] := Pen.Color;
        Pixels[ X + 6, Y + 10 ] := Pen.Color;
        Pixels[ X + 12, Y + 10 ] := Pen.Color;
      End
    End;
  End;
End;

Procedure TmxHeader.CalcHeaderLayout( Canvas: TCanvas; Client: TRect; Const Offset: TPoint; Const Caption: String; Alignment: TAlignment; Layout: TmxGlyphLayout; Margin, Spacing: Word; Var GlyphPos: TPoint; Var TextBounds, StatusRect: TRect; BiDiFlags: Longint );
Var
  TextPos: TPoint;
  ClientSize, GlyphSize, TextSize: TPoint;
  _Client: TRect;
Begin
  If ( BiDiFlags And DT_RIGHT ) = DT_RIGHT Then
    If Layout = glGlyphLeft Then
      Layout := glGlyphRight Else
      If Layout = glGlyphRight Then Layout := glGlyphLeft;

     // *** Calculate status button position ***
  _Client := Client;
  _Client.Top := _Client.Top + GetExplorerAddon;
     // *** Calculating size of client area ***
  ClientSize := Point( _Client.Right - _Client.Left, _Client.Bottom - _Client.Top );

  If ( ParentBar.ViewStyle = vsExplorerBar ) And ( ParentBar.ExplorerMethod = emCloseUp ) And ( hoShowStatusButton In FHeaderOptions ) And ( ClientSize.Y > 20 ) And ( ClientSize.X > 22 ) Then
  Begin
    StatusRect := _Client;
    Dec( StatusRect.Right, 4 );
    StatusRect.Left := StatusRect.Right - 18;
    StatusRect.Top := _Client.Top + ( ClientSize.Y - 18 ) Div 2;
    StatusRect.Bottom := StatusRect.Top + 18;
    Client.Right := StatusRect.Left - 1;
  End
  Else StatusRect := Bounds( -1000, -1000, 0, 0 );

     // *** Calculate component positions ***
  _Client := Client;
     // *** RecCalculating size of client area ***
  ClientSize := Point( Client.Right - Client.Left, _Client.Bottom - Client.Top );

     // *** Set header glyph image ***
  SetHeaderImage;
  GlyphSize := Point( FOriginalImage.Width, FOriginalImage.Height );

     // *** Set header glyph image vertical position ***
  GlyphPos.Y := ( ClientSize.Y - GlyphSize.Y + 1 ) Div 2;
  If ( GlyphPos.Y + GlyphSize.Y ) > ClientSize.Y Then GlyphSize.Y := 0;

     // *** If header has not got any glyph the spacing AValue does not need ***
  If ( GlyphSize.X = 0 ) Or ( GlyphSize.Y = 0 ) Then Spacing := 0;

     // *** Set horizontal glyph position ***

  If ( GlyphSize.X > 0 ) And ( GlyphSize.Y > 0 ) Then
  Begin
    Case Layout Of
      glGlyphLeft:
        Begin
          GlyphPos.X := Margin;
          If ( GlyphPos.X + GlyphSize.X ) > ClientSize.X Then
            GlyphPos.X := -10000 Else
            _Client.Left := _Client.Left + ( GlyphPos.X + GlyphSize.X ) + Spacing;
        End;
      glGlyphRight:
        Begin
          GlyphPos.X := ClientSize.X - Margin - GlyphSize.X;

          If ( GlyphPos.X < 0 ) Then
            GlyphPos.X := -10000 Else
            If Alignment = taRightJustify Then
              _Client.Right := GlyphPos.X - Spacing;
        End;
      glGlyphCenter:
        Begin
          GlyphPos.X := ( ClientSize.X - GlyphSize.X + 1 ) Div 2;

          If ( GlyphPos.X + GlyphSize.X ) > ClientSize.X Then
            GlyphPos.X := -10000 Else
        End;
    End;
  End;

     // *** Calculating Text position ***

  If Length( Caption ) > 0 Then
  Begin
    TextBounds := Rect( 0, 0, _Client.Right - _Client.Left - Margin - Spacing, 0 );
{$WARNINGS OFF}
    DrawText( Canvas.Handle, PChar( Caption ), Length( Caption ), TextBounds, DT_CALCRECT Or DT_END_ELLIPSIS Or BiDiFlags );
{$WARNINGS ON}
    TextSize := Point( TextBounds.Right - TextBounds.Left, TextBounds.Bottom - TextBounds.Top );
  End
  Else
  Begin
    TextBounds := Rect( 0, 0, 0, 0 );
    TextSize := Point( 0, 0 );
  End;

     // *** Set text vertical position ***
  TextPos.Y := ( ClientSize.Y - TextSize.Y + 1 ) Div 2;
  If TextSize.Y > ClientSize.Y Then TextPos.Y := -10000;

  Case Alignment Of
    taLeftJustify: TextPos.X := Margin;
    taRightJustify: TextPos.X := ClientSize.X - TextSize.X - Margin;
    taCenter: TextPos.X := ( ( Client.Right - Client.Left ) - TextSize.X + 1 ) Div 2;
  End;

  If ( GlyphSize.X > 0 ) And ( GlyphSize.Y > 0 ) Then
    Case Layout Of
      glGlyphLeft:
        Begin
          If Alignment = taLeftJustify Then
            TextPos.X := GlyphPos.X + GlyphSize.X + Spacing;
        End;
      glGlyphRight:
        Begin
          If Alignment = taRightJustify Then
            TextPos.X := GlyphPos.X - Spacing - TextSize.X;
        End;
    End;

     // *** Check text position ***

  Case Alignment Of
    taLeftJustify: If ( TextPos.X + TextSize.X ) > ClientSize.X Then TextPos.X := -10000;
    taRightJustify: If TextPos.X < 0 Then TextPos.X := -10000;
    taCenter: If ( TextPos.X + TextSize.X ) > ClientSize.X Then TextPos.X := -10000;
  End;

     // *** Adjusting positions to Client rect ***

  With GlyphPos Do
  Begin
    Inc( X, Client.Left + Offset.X );
    Inc( Y, Client.Top + Offset.Y );
  End;

     // *** Adjust Position by Explorer Addon AValue ***

     //Inc( GlyphPos.Y, GetExplorerAddon Div 2 );
  Inc( TextPos.Y, GetExplorerAddon Div 2 );
  If TextPos.Y + TextSize.Y > ClientSize.Y Then TextPos.Y := -10000;

     // *** Modify Caption Position ***

  OffsetRect( TextBounds, TextPos.X + Client.Left + Offset.X, TextPos.Y + Client.Top + Offset.X );
  FTextRect := TextBounds;
End;

Function TmxHeader.DrawHeaderFace( Canvas: TCanvas; Const Client: TRect; Const Offset: TPoint; Const Caption: String; Alignment: TAlignment; Layout: TmxGlyphLayout; Margin, Spacing: Word; State: TmxButtonState; Transparent: Boolean; BiDiFlags: LongInt ): TRect;
Var
  GlyphPos: TPoint;
  StatusRect: TRect;
Begin
  CalcHeaderLayout( Canvas, Client, Offset, Caption, Alignment, Layout, Margin, Spacing, GlyphPos, Result, StatusRect, BiDiFlags );
  DrawHeaderGlyph( Canvas, GlyphPos, State, Transparent );
  DrawHeaderText( Canvas, Caption, Result, State, BiDiFlags );
  DrawStatusButton( Canvas, StatusRect );
End;

Procedure TmxHeader.DrawHeaderButton( DrawBitmap: TBitmap; Var ARect: TRect; ActiveIndex: Integer );
Const
  DownStyles: Array[ Boolean ] Of Integer = ( EDGE_RAISED, EDGE_SUNKEN );
  FlatDownStyles: Array[ Boolean ] Of Integer = ( BDR_RAISEDINNER, BDR_SUNKENOUTER );
Var
  rgn: Hrgn;
  X, Y: Integer;
  Offset: TPoint;
  AFillRect: TRect;
  FlatStyle: Boolean;
  HeaderSettings: TmxBarSettings;
  Modifier: Integer;
Begin
  // *** Draw header button at the top of header ***

  rgn := 0;

  If hoNoCaption In FHeaderOptions Then
  Begin
    InflateRect( ARect, 1, 1 );
    ARect.Bottom := ARect.Top;
    FButtonRect := ARect;
    Exit;
  End;

  HeaderSettings := GetSettings;

  FButtonRect := ARect;
  AFillRect := FButtonRect;
  Inc( AFillRect.Top, GetExplorerAddon );

  // *** Create clip rect ***

  With DrawBitmap.Canvas Do
  Begin
    Brush.Style := bsSolid;
    Brush.Color := HeaderSettings.Color;

    Pen.Style := psSolid;
    Pen.Color := clBtnFace;

    If Assigned( FOnDrawHeaderButton ) Then FOnDrawHeaderButton( Self, DrawBitmap.Canvas, FButtonRect ) Else
    Begin
      If ( hoRoundedHeader In FHeaderOptions ) And ( ParentBar.ViewStyle = vsExplorerBar ) Then
      Begin
        With AFillRect Do
        Begin
          rgn := CreateRoundRectRgn( Left, Top, Right + 1, Bottom * 2, 4, 4 );
          SelectClipRgn( DrawBitmap.Canvas.Handle, rgn );
        End;
      End;

      If Not IsEnabled Then SetState( hbsDisabled ) Else
        If FState = hbsDisabled Then SetState( hbsUp );

      If ( FState In [ hbsFocused ] ) And ( hoUseHighlightFont In FHeaderOptions ) Then
        DrawBitmap.Canvas.Font.Assign( HeaderSettings.HighlightFont ) Else
        DrawBitmap.Canvas.Font.Assign( HeaderSettings.Font );

      FlatStyle := ( ParentBar.Flat ) Or ( hoAlwaysFlat In FHeaderOptions );
      If ( FState In [ hbsFocused ] ) And ( FlatStyle ) Then FlatStyle := Not ( hoActivateOnSelect In FHeaderOptions );

      Case HeaderSettings.CaptionStyle Of
        csButtonStyle:
          Begin
            If Not Transparent Then FillRect( AFillRect );

            If FlatStyle Then
            Begin
              If hoButtonDown In FHeaderOptions Then
                DrawEdge( DrawBitmap.Canvas.Handle, AFillRect, FlatDownStyles[ FState In [ hbsDown ] ], BF_RECT Or BF_SOFT ) Else
                DrawEdge( DrawBitmap.Canvas.Handle, AFillRect, FlatDownStyles[ False ], BF_RECT Or BF_SOFT );
            End
            Else
            Begin
              If hoButtonDown In FHeaderOptions Then
                DrawEdge( DrawBitmap.Canvas.Handle, AFillRect, DownStyles[ FState In [ hbsDown ] ], BF_RECT Or BF_SOFT ) Else
                DrawEdge( DrawBitmap.Canvas.Handle, AFillRect, DownStyles[ False ], BF_RECT Or BF_SOFT );
            End;
          End;
        csCustomDraw:
          Begin
            Case FState Of
              hbsUp:
                Begin
                  HeaderSettings.FButtonUp.Gradient.FOldRect := FGradientRect;
                  HeaderSettings.FButtonUp.DrawBackground( DrawBitmap, AFillRect );
                End;
              hbsDown:
                If hoDrawDownButton In FHeaderOptions Then
                Begin
                  HeaderSettings.FButtonDown.Gradient.FOldRect := FGradientRect;
                  HeaderSettings.FButtonDown.DrawBackground( DrawBitmap, AFillRect );
                End
                Else
                Begin
                  HeaderSettings.FButtonUp.Gradient.FOldRect := FGradientRect;
                  HeaderSettings.FButtonUp.DrawBackground( DrawBitmap, AFillRect );
                End;
              hbsFocused:
                If hoDrawFocusedButton In FHeaderOptions Then
                Begin
                  HeaderSettings.FButtonFocused.Gradient.FOldRect := FGradientRect;
                  HeaderSettings.FButtonFocused.DrawBackground( DrawBitmap, AFillRect );
                End
                Else
                Begin
                  HeaderSettings.FButtonUp.Gradient.FOldRect := FGradientRect;
                  HeaderSettings.FButtonUp.DrawBackground( DrawBitmap, AFillRect );
                End;
              hbsDisabled:
                If hoDrawDisabledButton In FHeaderOptions Then
                Begin
                  HeaderSettings.FButtonDisabled.Gradient.FOldRect := FGradientRect;
                  HeaderSettings.FButtonDisabled.DrawBackground( DrawBitmap, AFillRect );
                End
                Else
                Begin
                  HeaderSettings.FButtonUp.Gradient.FOldRect := FGradientRect;
                  HeaderSettings.FButtonUp.DrawBackground( DrawBitmap, AFillRect );
                End;
            End;

            If ( hoDrawCaptionBorder In FHeaderOptions ) And ( HeaderSettings.CaptionPen.Width <> 0 ) Then
            Begin
              DrawBitmap.Canvas.Pen.Assign( HeaderSettings.CaptionPen );
              Modifier := -HeaderSettings.CaptionPen.Width;
              InflateRect( AFillRect, Modifier Div 2, Modifier Div 2 );
              If Modifier Mod 2 = 0 Then
              Begin
                Inc( AFillRect.Right );
                Inc( AFillRect.Bottom );
              End;

              DrawBitmap.Canvas.Brush.Style := bsClear;
              DrawBitmap.Canvas.Rectangle( AFillRect );

              If ( hoRoundedHeader In FHeaderOptions ) And ( ParentBar.ViewStyle = vsExplorerBar ) Then
              Begin
                // *** We use this solution, because the Arc does not give acceptable result
                With DrawBitmap.Canvas Do
                Begin
                  X := AFillRect.Left;
                  Y := AFillRect.Top;
                  Pixels[ X + 1, Y + 2 ] := Pen.Color;
                  Pixels[ X + 1, Y + 1 ] := Pen.Color;
                  Pixels[ X + 2, Y + 1 ] := Pen.Color;

                  X := AFillRect.Right - 1;
                  Y := AFillRect.Top;
                  Pixels[ X - 2, Y + 1 ] := Pen.Color;
                  Pixels[ X - 1, Y + 1 ] := Pen.Color;
                  Pixels[ X - 1, Y + 2 ] := Pen.Color;
                End;
              End;
            End;
          End;
      End;

      InflateRect( ARect, -1, -1 );

      If FState In [ hbsDown ] Then
      Begin
        Offset.X := 1;
        Offset.Y := 1;
      End
      Else
      Begin
        Offset.X := 0;
        Offset.Y := 0;
      End;

      If Not ( hoButtonDown In FHeaderOptions ) Then
      Begin
        Offset.X := 0;
        Offset.Y := 0;
      End;

      If ( hoRoundedHeader In FHeaderOptions ) And ( ParentBar.ViewStyle = vsExplorerBar ) Then
      Begin
        SelectClipRgn( DrawBitmap.Canvas.handle, 0 );
        DeleteObject( rgn );
      End;

      DrawHeaderFace( DrawBitmap.Canvas, FButtonRect, Offset, Caption, HeaderSettings.Alignment, HeaderSettings.Layout, FMargin, FSpacing, FState, FTransparent, DrawTextBiDiModeFlags( 0 ) );
    End;

    DoAfterDrawHeaderButton( DrawBitmap.Canvas, FButtonRect );
  End;
End;

Function TmxHeader.GetParentBar: TmxOutlookBarPro;
Begin
  If Assigned( Collection ) Then
    Result := TmxHeaders( Collection ).OutlookBarPro Else
    Result := FParentBar;
End;

Procedure TmxHeader.DrawHeaderBody( DrawBitmap: TBitmap; Var ARect: TRect; ActiveIndex, ScrollOffset: Integer );
Var
  HeaderSettings: TmxBarSettings;
  Modifier: Integer;
  NeedBorder: Boolean;
Begin
  If ParentBar.FReCalcHeaderPositions Then FBodyRect := Bounds( 0, 0, 0, 0 );
  If ARect.Top > ARect.Bottom Then Exit;
  If ARect.Right - ARect.Left < 1 Then Exit;
  If ParentBar.FReCalcHeaderPositions Then FBodyRect := ARect;

  If Assigned( FOnDrawHeaderBody ) Then FOnDrawHeaderBody( Self, DrawBitmap.Canvas, ARect ) Else
    FBackground.DrawBackground( DrawBitmap, ARect );

  FGlyph.DrawGlyph( DrawBitmap, ARect );

  // *** Draw Border ***

  HeaderSettings := GetSettings;

  NeedBorder := ( hoDrawBorder In FHeaderOptions ) And ( HeaderSettings.HeaderPen.Width <> 0 );
  If NeedBorder Then
  Begin
    If boHeaderFrame In ParentBar.Options Then
      NeedBorder := ParentBar.ViewStyle = vsExplorerBar;
  End;

  If NeedBorder Then
  Begin
    DrawBitmap.Canvas.Pen.Assign( HeaderSettings.HeaderPen );

    Modifier := -HeaderSettings.HeaderPen.Width;
    InflateRect( ARect, Modifier Div 2, Modifier Div 2 );

    If Modifier Mod 2 = 0 Then
    Begin
      Inc( ARect.Right );
      Inc( ARect.Bottom );
    End;

    // *** If there are two same lines next to eachother
    // *** we do not need the second one
    // *** It will be nice :))

    If ( HeaderSettings.CaptionStyle = csCustomDraw ) And
      ( HeaderSettings.CaptionPen.Color = HeaderSettings.HeaderPen.Color ) And
      ( HeaderSettings.CaptionPen.Style = HeaderSettings.HeaderPen.Style ) And
      ( HeaderSettings.CaptionPen.Mode = HeaderSettings.HeaderPen.Mode ) Then
    Begin
      Dec( ARect.Top );
    End;

     // *** Now let's draw it ***

    DrawBitmap.Canvas.Brush.Style := bsClear;
    DrawBitmap.Canvas.Rectangle( ARect );
  End;

  DoAfterDrawHeaderBody( DrawBitmap.Canvas, ARect );
  DrawHeaderButtons( DrawBitmap, ARect );
End;

Procedure TmxHeader.DoAfterDrawHeaderButton( ACanvas: TCanvas; ARect: TRect );
Begin
  If Assigned( FOnAfterDrawHeaderButton ) Then
    FOnAfterDrawHeaderButton( Self, ACanvas, ARect );
End;

Procedure TmxHeader.DoAfterDrawHeaderBody( ACanvas: TCanvas; ARect: TRect );
Begin
  If Assigned( FOnAfterDrawHeaderBody ) Then
    FOnAfterDrawHeaderBody( Self, ACanvas, ARect );
End;

Function TmxHeader.GetEnabled: Boolean;
Begin
  Result := True;
  If Assigned( ParentBar ) Then Result := ParentBar.Enabled;
  If Result Then Result := Enabled;
End;

Procedure TmxHeader.SetHeaderState( AValue: TmxHeaderState );
Var
  I: Integer;
Begin
  If FHeaderState <> AValue Then
  Begin
    FHeaderState := AValue;

    FButtonRect := Bounds( 0, 0, 0, 0 );
    FBodyRect := Bounds( 0, 0, 0, 0 );

    For I := 0 To ButtonCount - 1 Do
    Begin
      Buttons[ I ].FButtonRect := Bounds( 0, 0, 0, 0 );
      Buttons[ I ].FImageRect := Bounds( 0, 0, 0, 0 );
      Buttons[ I ].FLabelRect := Bounds( 0, 0, 0, 0 );
      Buttons[ I ].FFocusRect := Bounds( 0, 0, 0, 0 );
    End;

    If Assigned( ParentBar ) Then
      If ParentBar.ViewStyle = vsExplorerBar Then
        ChangeParameter;
  End;
End;

Function TmxHeader.GetOpened: Boolean;
Begin
  Result := FHeaderState = hsOpened;
End;

Procedure TmxHeader.SetOpened( AValue: Boolean );
Const
  Status: Array[ Boolean ] Of TmxHeaderState = ( hsClosed, hsOpened );
Begin
  If GetOpened <> AValue Then SetHeaderState( Status[ AValue ] );
End;

Function TmxHeader.CalculateBodyHeight( ARect: TRect ): Integer;
Var
  I: Integer;
  MyRect: TRect;
Begin
  Result := 0;
  If ( Not Opened ) Or ( ButtonCount = 0 ) Then Exit;

  MyRect := Bounds( ARect.Left, FirstButtonTop, ARect.Right - ARect.Left, 0 );
  For I := 0 To ButtonCount - 1 Do
    If Buttons[ I ].Visible Then Buttons[ I ].Draw( Nil, MyRect, 0, True );

  If MyRect.Top = FirstButtonTop Then
    //Result := 0 Else
    Result := GetSettings.Distance Else
    If GetSettings.Distance <= GetSettings.HeaderPen.Width Then
      Result := MyRect.Top + ( GetSettings.HeaderPen.Width + 1 ) * 2 Else
      Result := MyRect.Top + ( GetSettings.Distance * 2 );
End;

Function TmxHeader.GetButtons: TmxButtons;
Begin
  Result := FButtons;
End;

Procedure TmxHeader.SetButtons( AValue: TmxButtons );
Begin
  FButtons.Assign( AValue );
End;

Function TmxHeader.GetButton( Index: Integer ): TmxButton;
Begin
  Result := Nil;
  If Not Assigned( FButtons ) Then Exit;
  If Index > FButtons.Count Then Exit;
  Result := FButtons[ Index ];
End;

Function TmxHeader.GetButtonCount: Integer;
Begin
  If Assigned( FButtons ) Then
    Result := FButtons.Count Else
    Result := 0;
End;

Function TmxHeader.GetEnabledButtonCount: Integer;
Var
  I: Integer;
Begin
  Result := 0;
  For I := 0 To ButtonCount - 1 Do
    If ButtonByIndex( I ).Enabled Then Inc( Result );
End;

Procedure TmxHeader.SetFirstButtonTop( AValue: Word );
Begin
  If FFirstButtonTop <> AValue Then
  Begin
    FFirstButtonTop := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxHeader.SetAllowSelected( AValue: Boolean );
Begin
  If FAllowSelected <> AValue Then
  Begin
    FAllowSelected := AValue;
    FSelectedIndex := -1;
    ChangeParameter;
  End;
End;

Procedure TmxHeader.SetSelectedIndex( AValue: Integer );
Var
  I: Integer;
Begin
  If Not FAllowSelected Then AValue := -1;
  If AValue < -1 Then AValue := -1;
  If AValue > ButtonCount - 1 Then AValue := ButtonCount - 1;

  If Assigned( Collection ) Then
  Begin
    If Not TmxHeaders( Collection ).OutlookBarPro.EachHeaderSelection Then
    Begin
      For I := 0 To TmxHeaders( Collection ).Count - 1 Do
      Begin
        TmxHeaders( Collection ).GetHeaderItem( I ).FSelectedIndex := -1;
      End;
    End;
  End;

  If FSelectedIndex <> AValue Then
  Begin
    FSelectedIndex := AValue;
    ChangeParameter;
  End;
End;

Function TmxHeader.GetVisibleButtonCount: Integer;
Var
  I: Integer;
Begin
  Result := 0;
  For I := 0 To ButtonCount - 1 Do
    If ButtonByIndex( I ).Visible Then Inc( Result );
End;

Function TmxHeader.ButtonByIndex( Index: Integer ): TmxButton;
Begin
  Result := Nil;
  If Index > ButtonCount - 1 Then Exit;
  If Index >= 0 Then Result := FButtons[ Index ];
End;

Function TmxHeader.ButtonIndexByName( Name: String ): Integer;
Var
  I: Integer;
Begin
  Result := -1;

  // *** This solution is so important. Do not modify it. ***
  For I := 0 To ButtonCount - 1 Do
  Begin
    If AnsiCompareText( FButtons[ I ].Name, Name ) = 0 Then
    Begin
      Result := I;
      Break;
    End;
  End;
End;

Function TmxHeader.ButtonByName( Name: String ): TmxButton;
Begin
  Result := ButtonByIndex( ButtonIndexByName( Name ) );
End;

Function TmxHeader.AddButton: TmxButton;
Begin
  If Not Assigned( FButtons ) Then
    Result := Nil Else
    Result := FButtons.Add;
End;

Function TmxHeader.CreateButton: Longint;
Begin
  Result := ButtonIndexByName( AddButton.Name );
End;

Procedure TmxHeader.RemoveButton( AButton: TmxButton );
Begin
  If AButton.FAlerted Then AButton.StopAlert;
  If Assigned( AButton ) Then FButtons.Delete( AButton.Index );
End;

Procedure TmxHeader.DeleteButton( AButtonIndex: Integer );
Begin
  RemoveButton( ButtonByIndex( AButtonIndex ) );
End;

Procedure TmxHeader.ClearButtons;
Var
  I: Integer;
Begin
  If Not Assigned( FButtons ) Then Exit;
  For I := ButtonCount - 1 Downto 0 Do DeleteButton( I );
End;

Procedure TmxHeader.BeginUpdate;
Begin
  FParentBar.BeginUpdate;
End;

Procedure TmxHeader.EndUpdate;
Begin
  FParentBar.EndUpdate;
End;

Procedure TmxHeader.Assign( Source: TPersistent );
Begin
  If Source Is TmxHeader Then
  Begin
    FBackground.Assign( TmxHeader( Source ).Background );
    FButtonImages.Assign( TmxHeader( Source ).Images );
    FBiDiMode := TmxHeader( Source ).FBiDiMode;
    FCaption := TmxHeader( Source ).Caption;
    FEnabled := TmxHeader( Source ).Enabled;
    FHeaderState := TmxHeader( Source ).HeaderState;
    FSettings.Assign( TmxHeader( Source ).Settings );
    FImageIndex := TmxHeader( Source ).ImageIndex;
    FMargin := TmxHeader( Source ).Margin;
    FHeaderOptions := TmxHeader( Source ).Options;
    FTransparent := TmxHeader( Source ).Transparent;
    FSpacing := TmxHeader( Source ).Spacing;
    FVisible := TmxHeader( Source ).Visible;

    Change;
  End
  Else Inherited Assign( Source );
End;

Procedure TmxHeader.AssignTo( Destination: TPersistent );
Begin
  If Destination Is TmxHeader Then
  Begin
    TmxHeader( Destination ).Assign( Self );
  End
  Else Inherited AssignTo( Destination );
End;

Procedure TmxHeader.RenameButton( AButton: TmxButton );
Begin
  If AButton <> Nil Then ParentBar.InplaceEditor.EditButton( AButton );
End;

Procedure TmxHeader.RenameButtonByIndex( AButtonIndex: Integer );
Begin
  RenameButton( ButtonByIndex( AButtonIndex ) );
End;

Procedure TmxHeader.DoButtonScrollUp;
Begin
  If Not IsUpButtonNeed Then Exit;
  Dec( FFirstVisibleButton );
  If FFirstVisibleButton < 0 Then FFirstVisibleButton := 0;
End;

Procedure TmxHeader.DoButtonScrollDown;
Begin
  If Not IsDownButtonNeed Then Exit;
  Inc( FFirstVisibleButton );
  If FFirstVisibleButton > ButtonCount - 1 Then FFirstVisibleButton := ButtonCount - 1;
  If FFirstVisibleButton < 0 Then FFirstVisibleButton := 0;
End;

Function TmxHeader.IsUpButtonNeed: Boolean;
Begin
  Result := FFirstVisibleButton > 0;
End;

Function TmxHeader.IsDownButtonNeed: Boolean;
Begin
  Result := FLastVisibleButton < ButtonCount - 1;
End;

Function TmxHeader.GetFirstVisibleButton: TmxButton;
Var
  I: Integer;
Begin
  Result := Nil;
  For I := 0 To ButtonCount - 1 Do
  Begin
    If ButtonByIndex( I ).Visible Then
    Begin
      Result := ButtonByIndex( I );
      Break;
    End;
  End;
End;

Function TmxHeader.GetLastVisibleButton: TmxButton;
Var
  I: Integer;
Begin
  Result := Nil;
  For I := ButtonCount - 1 Downto 0 Do
  Begin
    If ButtonByIndex( I ).Visible Then
    Begin
      Result := ButtonByIndex( I );
      Break;
    End;
  End;
End;

Function TmxHeader.HasAlertedButton: Boolean;
Begin
  Result := False;
  If Assigned( TmxHeaders( Collection ).OutlookBarPro.FAlertedButton ) Then
    Result := TmxHeaders( Collection ).OutlookBarPro.FAlertedButton.HeaderIndex = HeaderIndex;
End;

Procedure TmxHeader.SetState( AState: TmxButtonState );
Begin
  If FState <> AState Then
  Begin
    FState := AState;
    FGradientRect := Bounds( 0, 0, 0, 0 );
  End;
End;

Procedure TmxHeader.SetRadioButton( AButton: TmxButton );
Var
  I: Integer;
Begin
  ParentBar.BeginUpdate;
  For I := 0 To ButtonCount - 1 Do Buttons[ I ].Checked := False;
  AButton.Checked := True;
  ParentBar.EndUpdate;
End;

Procedure TmxHeader.DrawHeaderButtons( DrawBitmap: TBitmap; Const ARect: TRect );
Var
  I: Integer;
  MyRect: TRect;
  NeedToDraw: Boolean;
Begin
  MyRect := ARect;
  Inc( MyRect.Top, FFirstButtonTop );

  FLastVisibleButton := -1;
  NeedToDraw := True;

  For I := FFirstVisibleButton To ButtonCount - 1 Do
  Begin
    If Not ( csDesigning In ParentBar.ComponentState ) Then
    Begin
      If Not Buttons[ I ].Visible Then
      Begin
        Buttons[ I ].FButtonRect := Bounds( -1000, -1000, 0, 0 );
        Buttons[ I ].FImageRect := Bounds( -1000, -1000, 0, 0 );
        Buttons[ I ].FLabelRect := Bounds( -1000, -1000, 0, 0 );
        Buttons[ I ].FFocusRect := Bounds( -1000, -1000, 0, 0 );
        Continue;
      End;
    End;

    If NeedToDraw Then
    Begin
      Buttons[ I ].Draw( DrawBitmap, MyRect, ARect.Bottom, False );
    End
    Else
    Begin
      Buttons[ I ].FButtonRect := Bounds( -1000, -1000, 0, 0 );
      Buttons[ I ].FImageRect := Bounds( -1000, -1000, 0, 0 );
      Buttons[ I ].FLabelRect := Bounds( -1000, -1000, 0, 0 );
      Buttons[ I ].FFocusRect := Bounds( -1000, -1000, 0, 0 );
    End;

    If MyRect.Top > ARect.Bottom Then
    Begin
      FLastVisibleButton := I - 1;

      Buttons[ I ].FButtonRect := Bounds( -1000, -1000, 0, 0 );
      Buttons[ I ].FImageRect := Bounds( -1000, -1000, 0, 0 );
      Buttons[ I ].FLabelRect := Bounds( -1000, -1000, 0, 0 );
      Buttons[ I ].FFocusRect := Bounds( -1000, -1000, 0, 0 );

      NeedToDraw := FALSE;
    End;
  End;

  If FLastVisibleButton = -1 Then FLastVisibleButton := ButtonCount - 1;
End;

{TmxHeaders}

Constructor TmxHeaders.Create( AOutlookBarPro: TmxOutlookBarPro; ItemClass: TCollectionItemClass );
Begin
  Inherited Create( ItemClass );
  FOutlookBarPro := AOutlookBarPro;
End;

Function TmxHeaders.GetOwner: TPersistent;
Begin
  Result := FOutlookBarPro;
End;

Function TmxHeaders.Add: TmxHeader;
Begin
  Result := TmxHeader( Inherited Add );
  Result.OnChangeParameter := FOutlookBarPro.PropertyChanged;
End;

Function TmxHeaders.GetHeaderItem( Index: Integer ): TmxHeader;
Begin
  Result := TmxHeader( Inherited Items[ Index ] );
End;

Function TmxHeaders.GetAttrCount: Integer;
Begin
  Result := 1;
End;

Function TmxHeaders.GetAttr( Index: Integer ): String;
Begin
  Case Index Of
    0: Result := 'Name';
  Else
    Result := '';
  End;
End;

Function TmxHeaders.GetItemAttr( Index, ItemIndex: Integer ): String;
Begin
  Case Index Of
    0: Result := Headers[ ItemIndex ].Name;
  Else
    Result := '';
  End;
End;

Procedure TmxHeaders.SetHeaderItem( Index: Integer; AValue: TmxHeader );
Begin
  Items[ Index ].Assign( AValue );
End;

Procedure TmxHeaders.SetItemName( Item: TCollectionItem );
Var
  I, J: Integer;
  ItemName: String;
  CurItem: TmxHeader;
Begin
  J := 1;
  While True Do
  Begin
    ItemName := Format( 'mxHeader%d', [ J ] );
    I := 0;
    While I < Count Do
    Begin
      CurItem := Items[ I ] As TmxHeader;
      If ( CurItem <> Item ) And ( CompareText( CurItem.Name, ItemName ) = 0 ) Then
      Begin
        Inc( J );
        Break;
      End;
      Inc( I );
    End;
    If I >= Count Then
    Begin
      ( Item As TmxHeader ).Name := ItemName;
      Break;
    End;
  End;
End;

// *************************************************************************************
// ** TmxHeaders.Update, 7/19/01 2:14:55 PM
// *************************************************************************************

Procedure TmxHeaders.Update( Item: TCollectionItem );
Begin
  If FOutlookBarPro.ActiveHeader = TmxHeader( Item ) Then
    FOutlookBarPro.ActiveHeader := Nil;

  FOutlookBarPro.DoInvalidate;
End;

{TmxCloseButton}

Constructor TmxCloseButton.Create( AOwner: TmxOutlookBarPro );
Begin
  Inherited Create;

  FCloseHeader := TmxHeader.Create( Nil );
  FCloseHeader.FParentBar := AOwner;
  FCloseHeader.OnChangeParameter := AOwner.PropertyChanged;
  FCloseHeader.FHeaderOptions := [ hoCustomSettings, hoAlwaysFlat ];
  FCloseHeader.Settings.FExplorerAddOn := 0;
  FCloseHeader.Settings.FAlignment := taLeftJustify;
  FCloseHeader.FCaption := 'Favorites';
  FCloseHeader.FVisible := False;
  FCloseState := hbsUp;
End;

Destructor TmxCloseButton.Destroy;
Begin
  FCloseHeader.Free;

  Inherited Destroy;
End;

Procedure TmxCloseButton.SetVisible( AValue: Boolean );
Begin
  If GetVisible <> AValue Then
  Begin
    FCloseHeader.Visible := AValue;
    FCloseHeader.ParentBar.DoInvalidate;
  End;
End;

Procedure TmxCloseButton.SetCaption( AValue: String );
Begin
  If GetCaption <> AValue Then
  Begin
    FCloseHeader.Caption := AValue;
    FCloseHeader.ParentBar.DoInvalidate;
  End;
End;

Function TmxCloseButton.GetVisible: Boolean;
Begin
  Result := FCloseHeader.Visible;
End;

Procedure TmxCloseButton.SetTransparent( AValue: Boolean );
Begin
  If GetTransparent <> AValue Then
  Begin
    FCloseHeader.Transparent := AValue;
    FCloseHeader.ParentBar.DoInvalidate;
  End;
End;

Function TmxCloseButton.GetTransparent: Boolean;
Begin
  Result := FCloseHeader.Transparent;
End;

Function TmxCloseButton.GetCaption: String;
Begin
  Result := FCloseHeader.Caption;
End;

Procedure TmxCloseButton.SetFont( AValue: TFont );
Begin
  FCloseHeader.Settings.Font.Assign( AValue );
  FCloseHeader.ParentBar.DoInvalidate;
End;

Function TmxCloseButton.GetFont: TFont;
Begin
  Result := FCloseHeader.Settings.Font;
End;

Function TmxCloseButton.GetHeight: Integer;
Begin
  Result := FCloseHeader.Settings.Height;
End;

Procedure TmxCloseButton.SetHeight( AValue: Integer );
Begin
  If FCloseHeader.Settings.Height <> AValue Then
  Begin
    FCloseHeader.Settings.Height := AValue;
    FCloseHeader.ParentBar.DoInvalidate;
  End;
End;

Function TmxCloseButton.GetMargin: Word;
Begin
  Result := FCloseHeader.Margin;
End;

Procedure TmxCloseButton.SetMargin( AValue: Word );
Begin
  If GetMargin <> AValue Then
  Begin
    FCloseHeader.Margin := AValue;
    FCloseHeader.ParentBar.DoInvalidate;
  End;
End;

Function TmxCloseButton.GetImageIndex: Integer;
Begin
  Result := FCloseHeader.ImageIndex;
End;

Procedure TmxCloseButton.SetImageIndex( AValue: Integer );
Begin
  If GetImageIndex <> AValue Then
  Begin
    FCloseHeader.ImageIndex := AValue;
    FCloseHeader.ParentBar.DoInvalidate;
  End;
End;

Procedure TmxCloseButton.Assign( Source: TPersistent );
Begin
  If Source Is TmxCloseButton Then
  Begin
    FCloseHeader.ParentBar.BeginUpdate;

    Caption := TmxCloseButton( Source ).Caption;
    Font.Assign( TmxCloseButton( Source ).Font );
    Height := TmxCloseButton( Source ).Height;
    ImageIndex := TmxCloseButton( Source ).ImageIndex;
    Margin := TmxCloseButton( Source ).Margin;
    Transparent := TmxCloseButton( Source ).Transparent;
    Visible := TmxCloseButton( Source ).Visible;

    FCloseHeader.ParentBar.EndUpdate;
  End
  Else Inherited Assign( Source );
End;

Procedure TmxCloseButton.AssignTo( Destination: TPersistent );
Begin
  If Destination Is TmxCloseButton Then
  Begin
    TmxCloseButton( Destination ).Assign( Self );
  End
  Else Inherited AssignTo( Destination );
End;

{TmxButtonActionLink}

Procedure TmxButtonActionLink.AssignClient( AClient: TObject );
Begin
  FClient := AClient As TmxButton;
End;

Function TmxButtonActionLink.IsCaptionLinked: Boolean;
Begin
  Result := FClient.Caption = ( Action As TCustomAction ).Caption;
End;

Function TmxButtonActionLink.IsImageIndexLinked: Boolean;
Begin
  Result := FClient.ImageIndex = ( Action As TCustomAction ).ImageIndex;
End;

Function TmxButtonActionLink.IsEnabledLinked: Boolean;
Begin
  Result := FClient.Enabled = ( Action As TCustomAction ).Enabled;
End;

Function TmxButtonActionLink.IsHelpContextLinked: Boolean;
Begin
  Result := FClient.HelpContext = ( Action As TCustomAction ).HelpContext;
End;

Function TmxButtonActionLink.IsHintLinked: Boolean;
Begin
  Result := FClient.Hint = ( Action As TCustomAction ).Hint;
End;

Function TmxButtonActionLink.IsVisibleLinked: Boolean;
Begin
  Result := FClient.Visible = ( Action As TCustomAction ).Visible;
End;

Function TmxButtonActionLink.IsOnExecuteLinked: Boolean;
Begin
{$WARNINGS OFF}
  Result := @FClient.OnClick = @Action.OnExecute;
{$WARNINGS ON}
End;

Procedure TmxButtonActionLink.SetCaption( Const AValue: String );
Begin
  If IsCaptionLinked Then FClient.Caption := AValue;
End;

Procedure TmxButtonActionLink.SetEnabled( AValue: Boolean );
Begin
  If IsEnabledLinked Then FClient.Enabled := AValue;
End;

Procedure TmxButtonActionLink.SetHelpContext( AValue: THelpContext );
Begin
  If IsHelpContextLinked Then FClient.HelpContext := AValue;
End;

Procedure TmxButtonActionLink.SetHint( Const AValue: String );
Begin
  If IsHintLinked Then FClient.Hint := AValue;
End;

Procedure TmxButtonActionLink.SetImageIndex( AValue: Integer );
Begin
  If IsImageIndexLinked Then FClient.ImageIndex := AValue;
End;

Procedure TmxButtonActionLink.SetVisible( AValue: Boolean );
Begin
  If IsVisibleLinked Then FClient.Visible := AValue;
End;

Procedure TmxButtonActionLink.SetOnExecute( AValue: TNotifyEvent );
Begin
  If IsOnExecuteLinked Then FClient.OnClick := AValue;
End;

{TmxButton}

Constructor TmxButton.Create( ACollection: TCollection );
Begin
  Inherited Create( ACollection );

  FUserString := '';
  FPaintGrayed := False;
  FAllowGrayed := False;
  FAutoSize := True;
  FAlignment := taCenter;
  FAlerted := False;
  FButtonStyle := bsLarge;
  FButtonView := bvNormal;
  FColor := clBtnFace;
  FCursor := crDefault;
  FFont := TFont.Create;
  FFont.OnChange := OnChangeParameter;
  FHighlightFont := TFont.Create;
  FHighlightFont.OnChange := OnChangeParameter;
  FHeight := 20;
  FWidth := 20;
{$WARNINGS OFF}
  FData := Nil;
{$WARNINGS ON}
  FEnabled := True;
  FVisible := True;
  FImageIndex := -1;
  FHint := '';
  FCaption := '';
  FHelpContext := 0;
  FTag := 0;
  FTransparent := True;
  FShowAccelChar := True;
  FOptions := [ boAutoWidthLabel, boUnderlineFont ];
  FState := hbsUp;
  FWordWrap := False;
  FButtonKind := bkButton;
  FMargin := 4;
  FCheckState := cbUnchecked;
  FChecked := False;

  If Assigned( ACollection ) Then
    OnChangeParameter := TmxButtons( ACollection ).OutlookBarPro.PropertyChanged;
End;

Destructor TmxButton.Destroy;
Begin
{$WARNINGS OFF}
  FData := Nil;
{$WARNINGS ON}
  FFont.Free;
  FHighlightFont.Free;
  FActionLink.Free;
  FActionLink := Nil;

  Inherited Destroy;
End;

Procedure TmxButton.Assign( Source: TPersistent );
Begin
  If Source Is TmxButton Then
  Begin
    Action := TmxButton( Source ).Action;
    Alignment := TmxButton( Source ).Alignment;
    AutoSize := TmxButton( Source ).AutoSize;
    BiDiMode := TmxButton( Source ).BiDiMode;
    ButtonStyle := TmxButton( Source ).ButtonStyle;
    ButtonView := TmxButton( Source ).ButtonView;
    Caption := TmxButton( Source ).Caption;
    Color := TmxButton( Source ).Color;
    Cursor := TmxButton( Source ).Cursor;
    Enabled := TmxButton( Source ).Enabled;
    Font.Assign( TmxButton( Source ).Font );
    Height := TmxButton( Source ).Height;
    HelpContext := TmxButton( Source ).HelpContext;
    HighlightFont.Assign( TmxButton( Source ).HighlightFont );
    Hint := TmxButton( Source ).Hint;
    ImageIndex := TmxButton( Source ).ImageIndex;
    Options := TmxButton( Source ).Options;
    ParentBiDiMode := TmxButton( Source ).ParentBiDiMode;
    ShowAccelChar := TmxButton( Source ).ShowAccelChar;
    Tag := TmxButton( Source ).Tag;
    Transparent := TmxButton( Source ).Transparent;
    Visible := TmxButton( Source ).Visible;
    Width := TmxButton( Source ).Width;
    WordWrap := TmxButton( Source ).WordWrap;

    OnAfterDrawButton := TmxButton( Source ).OnAfterDrawButton;
    OnBeforeDrawButton := TmxButton( Source ).OnBeforeDrawButton;
    OnClick := TmxButton( Source ).OnClick;
    OnDrawButton := TmxButton( Source ).OnDrawButton;

    ChangeParameter;
  End
  Else Inherited Assign( Source );
End;

Procedure TmxButton.AssignTo( Destination: TPersistent );
Begin
  If Destination Is TmxButton Then
  Begin
    TmxButton( Destination ).Assign( Self );
  End
  Else Inherited AssignTo( Destination );
End;

Procedure TmxButton.SetButtonIndex( AValue: Integer );
Begin
  If Index <> AValue Then
  Begin
    If AValue > Collection.Count - 1 Then
      Index := Collection.Count - 1 Else
      Index := AValue;
    ChangeParameter;
  End;
End;

Function TmxButton.GetButtonIndex: Integer;
Begin
  Result := Index;
End;

{$WARNINGS OFF}

Procedure TmxButton.SetData( AValue: Pointer );
Begin
  FData := AValue;
End;
{$WARNINGS ON}

Procedure TmxButton.SetVisible( AValue: Boolean );
Begin
  If FVisible <> AValue Then
  Begin
    FVisible := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxButton.SetColor( AValue: TColor );
Begin
  If FColor <> AValue Then
  Begin
    FColor := AValue;
    If Not Transparent Then ChangeParameter;
  End;
End;

Procedure TmxButton.SetFont( AValue: TFont );
Begin
  FFont.Assign( AValue );
  ChangeParameter;
End;

Procedure TmxButton.SetHighlightFont( AValue: TFont );
Begin
  FHighlightFont.Assign( AValue );
  ChangeParameter;
End;

Procedure TmxButton.SetHeight( AValue: Word );
Begin
  If FHeight <> AValue Then
  Begin
    FHeight := AValue;
    If Not AutoSize Then ChangeParameter;
  End;
End;

Procedure TmxButton.SetWidth( AValue: Word );
Begin
  If FWidth <> AValue Then
  Begin
    FWidth := AValue;
    If Not AutoSize Then ChangeParameter;
  End;
End;

Procedure TmxButton.SetButtonKind( AValue: TmxButtonKind );
Begin
  If FButtonKind <> AValue Then
  Begin
    FButtonKind := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxButton.SetMargin( AValue: Integer );
Begin
  If FMargin <> AValue Then
  Begin
    FMargin := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxButton.SetCheckState( AValue: TCheckBoxState );
Begin
  If FCheckState <> AValue Then
  Begin
    FCheckState := AValue;
    If FCheckState = cbChecked Then FChecked := True;
    If FCheckState = cbUnChecked Then FChecked := False;
    ChangeParameter;
  End;
End;

Procedure TmxButton.SetChecked( AValue: boolean );
Begin
  If FChecked <> AValue Then
  Begin
    FChecked := AValue;
    If FChecked Then
      SetCheckState( cbChecked ) Else
      SetCheckState( cbUnChecked );
    ChangeParameter;
  End;
End;

Procedure TmxButton.SetOptions( AValue: TmxButtonOptions );
Begin
  If FOptions <> AValue Then
  Begin
    FOptions := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxButton.SetWordWrap( AValue: Boolean );
Begin
  If FWordWrap <> AValue Then
  Begin
    FWordWrap := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxButton.SetAlignment( AValue: TAlignment );
Begin
  If FAlignment <> AValue Then
  Begin
    FAlignment := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxButton.SetShowAccelChar( AValue: Boolean );
Begin
  If FShowAccelChar <> AValue Then
  Begin
    FShowAccelChar := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxButton.SetParentBiDiMode( AValue: Boolean );
Begin
  If FParentBiDiMode <> AValue Then
  Begin
    FParentBiDiMode := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxButton.SetBiDiMode( AValue: TBiDiMode );
Begin
  If FBiDiMode <> AValue Then
  Begin
    FBiDiMode := AValue;
    FParentBiDiMode := False;
    ChangeParameter;
  End;
End;

Procedure TmxButton.SetHint( AValue: String );
Begin
  If FHint <> AValue Then
  Begin
    FHint := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxButton.SetTransparent( AValue: Boolean );
Begin
  If FTransparent <> AValue Then
  Begin
    FTransparent := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxButton.SetHelpContext( AValue: THelpContext );
Begin
  If FHelpContext <> AValue Then
  Begin
    FHelpContext := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxButton.SetImageIndex( AValue: TImageIndex );
Begin
  If FImageIndex <> AValue Then
  Begin
    FImageIndex := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxButton.SetEnabled( AValue: Boolean );
Begin
  If FEnabled <> AValue Then
  Begin
    FEnabled := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxButton.SetChangeParameter( AValue: TNotifyEvent );
Begin
{$WARNINGS OFF}
  If @OnChangeParameter <> @AValue Then
  Begin
    FOnChangeParameter := AValue;
  End;
{$WARNINGS ON}
End;

Function TmxButton.GetAction: TBasicAction;
Begin
  If ActionLink <> Nil Then
    Result := ActionLink.Action Else
    Result := Nil;
End;

Procedure TmxButton.SetCaption( AValue: String );
Begin
  If FCaption <> AValue Then
  Begin
    FCaption := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxButton.SetButtonStyle( AValue: TmxButtonStyle );
Begin
  If FButtonStyle <> AValue Then
  Begin
    FButtonStyle := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxButton.SetButtonView( AValue: TmxButtonView );
Begin
  If FButtonView <> AValue Then
  Begin
    FButtonView := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxButton.SetAutoSize( AValue: Boolean );
Begin
  If FAutoSize <> AValue Then
  Begin
    FAutoSize := AValue;
    ChangeParameter;
  End;
End;

Procedure TmxButton.SetAction( AValue: TBasicAction );
Begin
  If AValue = Nil Then
  Begin
    If Assigned( ActionLink ) Then ActionLink.Free;
    ActionLink := Nil;
  End
  Else
  Begin
    If ActionLink = Nil Then ActionLink := GetActionLinkClass.Create( Self );
    ActionLink.Action := AValue;
    ActionLink.OnChange := DoActionChange;

    If Assigned( Collection ) Then
      ActionChange( AValue, Not TmxButtons( Collection ).FOutlookBarPro.FLoaded ) Else
      ActionChange( AValue, False );
  End;
End;

Procedure TmxButton.DoActionChange( Sender: TObject );
Begin
  If Sender = Action Then ActionChange( Sender, False );
End;

Function TmxButton.GetDisplayName: String;
Begin
  Result := FName;
End;

Procedure TmxButton.SetDisplayName( Const AValue: String );
Var
  I: Integer;
  Item: TmxButton;
Begin
  If AnsiCompareText( AValue, FName ) <> 0 Then
  Begin
    If Collection <> Nil Then
      For I := 0 To Collection.Count - 1 Do
      Begin
        Item := TmxButtons( Collection ).Buttons[ I ];
        If ( Item <> Self ) And ( Item Is TmxButton ) And
          ( AnsiCompareText( AValue, Item.Name ) = 0 ) Then
          Raise Exception.Create( Format( sDuplicatedButtonName, [ AValue ] ) );
      End;
    FName := AValue;
    Changed( False );
  End;
End;

Procedure TmxButton.ChangeParameter;
Begin
  If Assigned( FOnChangeParameter ) Then FOnChangeParameter( Self );
End;

Procedure TmxButton.ActionChange( Sender: TObject; CheckDefaults: Boolean );
Begin
  If Action Is TCustomAction Then
    With TCustomAction( Sender ) Do
    Begin
      If Not CheckDefaults Or ( Self.Caption = '' ) Or ( Self.Caption = Self.Name ) Then Self.Caption := Caption;
      If Not CheckDefaults Or ( Self.Enabled = True ) Then Self.Enabled := Enabled;
      If Not CheckDefaults Or ( Self.HelpContext = 0 ) Then Self.HelpContext := HelpContext;
      If Not CheckDefaults Or ( Self.Hint = '' ) Then Self.Hint := Hint;
      If Not CheckDefaults Or ( Self.ImageIndex = -1 ) Then Self.ImageIndex := ImageIndex;
      If Not CheckDefaults Or ( Self.Visible = True ) Then Self.Visible := Visible;
      If Not CheckDefaults Or Not Assigned( Self.OnClick ) Then Self.OnClick := OnExecute;
    End;
End;

Function TmxButton.GetActionLinkClass: TControlActionLinkClass;
Begin
  Result := TmxButtonActionLink;
End;

Function TmxButton.GetSettings: TmxBarSettings;
Begin
  Result := TmxButtons( Collection ).Header.GetSettings;
End;

Function TmxButton.GetView: TmxButtonView;
Begin
  If boCustomView In FOptions Then
    Result := ButtonView Else
    Result := GetSettings.ButtonView;
End;

Function TmxButton.GetStyle: TmxButtonStyle;
Begin
  If boCustomStyle In FOptions Then
    Result := ButtonStyle Else
    Result := GetSettings.ButtonStyle;
End;

Function TmxButton.GetButtonImageList: TCustomImageList;
Var
  AState: TmxButtonState;
Begin
  Result := Nil;

  AState := FState;
  If Not Enabled Then AState := hbsDisabled;

  With TmxButtons( Collection ).Header Do
  Begin
    Case GetStyle Of
      bsLarge:
        Begin
          If ( AState In [ hbsFocused, hbsDown ] ) Then
          Begin
            If Assigned( FButtonImages.Hot ) Then
            Begin
              If FButtonImages.Hot.Count - 1 >= Self.ImageIndex Then Result := FButtonImages.Hot;
            End
            Else
              If Assigned( FButtonImages.Normal ) Then
              Begin
                If FButtonImages.Normal.Count - 1 >= Self.ImageIndex Then Result := FButtonImages.Normal;
              End;
          End
          Else
          Begin
            If AState In [ hbsDisabled ] Then
            Begin
              If Assigned( FButtonImages.Disabled ) Then
              Begin
                If FButtonImages.Disabled.Count - 1 >= Self.ImageIndex Then Result := FButtonImages.Disabled;
              End
              Else
                If Assigned( FButtonImages.Normal ) Then
                Begin
                  If FButtonImages.Normal.Count - 1 >= Self.ImageIndex Then Result := FButtonImages.Normal;
                End;
            End
            Else
              If Assigned( FButtonImages.Normal ) Then
              Begin
                If FButtonImages.Normal.Count - 1 >= Self.ImageIndex Then Result := FButtonImages.Normal;
              End
          End;
        End;
      bsSmall:
        Begin
          If AState In [ hbsDown, hbsFocused ] Then
          Begin
            If Assigned( FButtonImages.HotSmall ) Then
            Begin
              If FButtonImages.HotSmall.Count - 1 >= Self.ImageIndex Then Result := FButtonImages.HotSmall;
            End
            Else
              If Assigned( FButtonImages.Small ) Then
              Begin
                If FButtonImages.Small.Count - 1 >= Self.ImageIndex Then Result := FButtonImages.Small;
              End;
          End
          Else
          Begin
            If AState In [ hbsDisabled ] Then
            Begin
              If Assigned( FButtonImages.DisabledSmall ) Then
              Begin
                If FButtonImages.DisabledSmall.Count - 1 >= Self.ImageIndex Then Result := FButtonImages.DisabledSmall;
              End
              Else
                If Assigned( FButtonImages.Small ) Then
                Begin
                  If FButtonImages.Small.Count - 1 >= Self.ImageIndex Then Result := FButtonImages.Small;
                End;
            End
            Else
              If Assigned( FButtonImages.Small ) Then
              Begin
                If FButtonImages.Small.Count - 1 >= Self.ImageIndex Then Result := FButtonImages.Small;
              End
          End;
        End;
    End;
  End;
End;

Function TmxButton.CalculateImagePositon( ButtonRect: TRect ): TRect;
Var
  SizeDifference: Integer;
Begin
  Result := ButtonRect;
  Inc( Result.Top, GetSettings.GlyphTop );
  Result.Bottom := Result.Top + FImageList.Height;
  SizeDifference := ( ( ButtonRect.Right - ButtonRect.Left ) - FImageList.Width ) Div 2;
  Inc( Result.Left, SizeDifference );
  Dec( Result.Right, SizeDifference );
End;

Function TmxButton.CalculateSmallImagePositon( ButtonRect: TRect ): TRect;
Var
  SizeDifference: Integer;
Begin
  Result := ButtonRect;
  Inc( Result.Left, 4 );
  Result.Right := Result.Left + FImageList.Width;
  SizeDifference := ( ( ButtonRect.Bottom - ButtonRect.Top ) - FImageList.Height ) Div 2;
  Inc( Result.Top, SizeDifference );
  Dec( Result.Bottom, SizeDifference );
End;

Procedure TmxButton.CalculateButtonRect( Var ButtonRect: TRect; Var ImageRect: TRect; Var FocusRect: TRect; Var LabelRect: TRect );
Var
  AStyle: TmxButtonStyle;
  AView: TmxButtonView;
  OriginalWidth: Integer;
  TempRect: TRect;
  MyWidth: Integer;
  MyHeight: Integer;
Begin
  OriginalWidth := ButtonRect.Right - ButtonRect.Left;

  Inc( ButtonRect.Left );
  Dec( ButtonRect.Right );

  // *** Top position is ready ***
  // *** Set the left and right size ***

  Case FButtonKind Of

    bkCheckBox, bkPushButton, bkRadioButton, bkLabel:
      Begin
        MyWidth := Width;
        If ( MyWidth > OriginalWidth ) Or ( boAutoWidthLabel In FOptions ) Then MyWidth := OriginalWidth;
        MyWidth := MyWidth - ( 2 * Margin );
        MyHeight := Height;

        ButtonRect.Left := ButtonRect.Left + Margin;
        ButtonRect.Right := ButtonRect.Left + MyWidth;
        ButtonRect.Bottom := ButtonRect.Top + MyHeight;

        LabelRect := ButtonRect;
        ImageRect := Bounds( -1000, -1000, 0, 0 );
        FocusRect := Bounds( -1000, -1000, 0, 0 );
      End;
    bkButton:
      Begin
        AStyle := GetStyle;
        AView := GetView;

        Case AStyle Of
          bsLarge:
            Begin
              // *** Calculate margins ***

              ButtonRect.Left := ButtonRect.Left + Margin;
              ButtonRect.Right := ButtonRect.Right - Margin;

              // *** AutoSized Buttons ***
              If Not AutoSize Then
              Begin
                MyWidth := Width;
                If MyWidth > OriginalWidth Then MyWidth := OriginalWidth;
                MyHeight := Height;
              End
              Else
              Begin
                MyWidth := GetSettings.LargeWidth;
                MyHeight := GetSettings.LargeHeight;
              End;

              Case AView Of
                bvNormal, bvWindowsXP, bvExplorer:
                  Begin
                    ButtonRect.Left := ButtonRect.Left + ( ( ButtonRect.Right - ButtonRect.Left ) - MyWidth ) Div 2;
                    ButtonRect.Right := ButtonRect.Left + MyWidth;

                    If MyWidth > OriginalWidth Then
                    Begin
                      ButtonRect.Left := -1000;
                      ButtonRect.Right := -1000;
                    End
                    Else ButtonRect.Bottom := ButtonRect.Top + MyHeight;

                    FImageList := GetButtonImageList;
                    If Assigned( FImageList ) Then
                    Begin
                      ImageRect := CalculateImagePositon( ButtonRect );

                      If ( ImageRect.Right - ImageRect.Left < ButtonRect.Right - ButtonRect.Left ) Or
                        ( ImageRect.Bottom - ImageRect.Top < ButtonRect.Bottom - ButtonRect.Top ) Then
                      Begin
                        FocusRect := ImageRect;
                        InflateRect( FocusRect, 2, 2 );
                      End
                      Else
                      Begin
                        ImageRect := Bounds( -1000, -1000, 0, 0 );
                        FocusRect := ButtonRect;
                      End;
                    End
                    Else
                    Begin
                      ImageRect := Bounds( -1000, -1000, 0, 0 );
                      FocusRect := ButtonRect;
                    End;

                    If ImageIndex = -1 Then
                    Begin
                      ImageRect := Bounds( -1000, -1000, 0, 0 );
                      FocusRect := ButtonRect;
                    End;

                    InflateRect( FocusRect, 1, 1 );
                  End;
                bvBig:
                  Begin
                    ButtonRect.Left := ButtonRect.Left + ( ( ButtonRect.Right - ButtonRect.Left ) - MyWidth ) Div 2;
                    ButtonRect.Right := ButtonRect.Left + MyWidth;

                    If MyWidth > OriginalWidth Then
                    Begin
                      ButtonRect.Left := -1000;
                      ButtonRect.Right := -1000;
                    End
                    Else ButtonRect.Bottom := ButtonRect.Top + MyHeight;

                    FImageList := GetButtonImageList;
                    If Assigned( FImageList ) Then
                    Begin
                      ImageRect := CalculateImagePositon( ButtonRect );

                      If ( ImageRect.Right - ImageRect.Left > ButtonRect.Right - ButtonRect.Left ) Or
                        ( ImageRect.Bottom - ImageRect.Top > ButtonRect.Bottom - ButtonRect.Top ) Then
                      Begin
                        ImageRect := Bounds( -1000, -1000, 0, 0 );
                      End;
                    End
                    Else ImageRect := Bounds( -1000, -1000, 0, 0 );

                    If ImageIndex = -1 Then
                    Begin
                      ImageRect := Bounds( -1000, -1000, 0, 0 );
                    End;

                    FocusRect := ButtonRect;
                    InflateRect( FocusRect, 1, 1 );
                  End;
                bvToolBox, bvWindows2000:
                  Begin
                    If MyWidth > OriginalWidth Then
                    Begin
                      ButtonRect.Left := -1000;
                      ButtonRect.Right := -1000;
                    End
                    Else ButtonRect.Bottom := ButtonRect.Top + MyHeight;

                    FImageList := GetButtonImageList;
                    If Assigned( FImageList ) Then
                    Begin
                      ImageRect := CalculateImagePositon( ButtonRect );
                      Inc( ImageRect.Top, 2 );

                      If ( ImageRect.Right - ImageRect.Left > ButtonRect.Right - ButtonRect.Left ) Or
                        ( ImageRect.Bottom - ImageRect.Top > ButtonRect.Bottom - ButtonRect.Top ) Then
                      Begin
                        ImageRect := Bounds( -1000, -1000, 0, 0 );
                      End;
                    End
                    Else ImageRect := Bounds( -1000, -1000, 0, 0 );

                    If ImageIndex = -1 Then
                    Begin
                      ImageRect := Bounds( -1000, -1000, 0, 0 );
                    End;

                    FocusRect := ButtonRect;
                  End;
              End;

              // ** Label rect calculation ***

              TempRect := ButtonRect;
              If ImageRect.Bottom <> -1000 Then TempRect.Top := ImageRect.Bottom;
              Inc( TempRect.Top, GetSettings.PicLabDistance + 1 );
              Inc( TempRect.Left );
              //Dec( TempRect.Bottom, GetSettings.PicLabDistance + 1 );
              //Dec( TempRect.Right );

              LabelRect := TempRect;
            End;
          bsSmall:
            Begin
              // *** AutoSized Buttons ***
{$HINTS OFF}
              If Not AutoSize Then
              Begin
                //MyWidth := Width;
                MyHeight := Height;
              End
              Else
              Begin
                //MyWidth := Width;
                MyHeight := GetSettings.SmallHeight;
              End;
{$HINTS ON}

              // *** Calculate margins ***

              ButtonRect.Left := ButtonRect.Left + Margin;
              ButtonRect.Right := ButtonRect.Right - Margin;

              Case AView Of
                bvBig, bvNormal, bvWindowsXP, bvExplorer:
                  Begin
                    ButtonRect.Bottom := ButtonRect.Top + MyHeight;
                    FocusRect := ButtonRect;
                    InflateRect( FocusRect, 1, 1 );
                  End;
                bvToolBox, bvWindows2000:
                  Begin
                    ButtonRect.Bottom := ButtonRect.Top + MyHeight;
                    FocusRect := ButtonRect;
                  End;
              End;

              If ImageIndex <> -1 Then
              Begin
                FImageList := GetButtonImageList;
                If Assigned( FImageList ) Then
                Begin
                  ImageRect := CalculateSmallImagePositon( ButtonRect );

                  If ( ImageRect.Right - ImageRect.Left > ButtonRect.Right - ButtonRect.Left ) Or
                    ( ImageRect.Bottom - ImageRect.Top > ButtonRect.Bottom - ButtonRect.Top ) Then
                  Begin
                    ImageRect := Bounds( -1000, -1000, 0, 0 );
                  End
                  Else If AView In [ bvNormal, bvWindowsXP, bvExplorer ] Then
                  Begin
                    FocusRect := ImageRect;
                    InflateRect( FocusRect, 2, 2 );
                  End;
                End
                Else ImageRect := Bounds( -1000, -1000, 0, 0 );
              End
              Else ImageRect := Bounds( -1000, -1000, 0, 0 );

              // ** Label rect calculation ***

              TempRect := ButtonRect;
              If ImageRect.Right <> -1000 Then TempRect.Left := ImageRect.Right;
              Inc( TempRect.Left, GetSettings.PicLabDistance + 1 );
              Inc( TempRect.Top );
              //Dec( TempRect.Right, GetSettings.PicLabDistance + 1 );
              //Dec( TempRect.Bottom );

              LabelRect := TempRect;
            End;
        End;
      End;
  End;
End;

Procedure TmxButton.DrawImageRect( ACanvas: TCanvas; Var ARect: TRect; Pushed: Boolean );
Begin
  If ( FImageList <> Nil ) And ( FImageIndex >= 0 ) Then
  Begin
    FImageList.ImageType := itImage;

    If Not Enabled Then Pushed := False;

    If Pushed Then
      FImageList.Draw( ACanvas, FImageRect.Left + 1, FImageRect.Top + 1, FImageIndex ) Else
      FImageList.Draw( ACanvas, FImageRect.Left, FImageRect.Top, FImageIndex );
  End;
End;

Procedure TmxButton.DrawFocusRect( ACanvas: TCanvas; Var ARect: TRect; AButtonState: TmxButtonState );
Begin
  If FButtonKind <> bkButton Then Exit;

  If ( ( hoFocusDisabled In TmxButtons( Collection ).Header.Options ) And ( Not Enabled ) ) Or ( Enabled ) Then
  Begin
    If AButtonState In [ hbsDown ] Then
      DrawEdge( ACanvas.Handle, ARect, BDR_SUNKENINNER, BF_RECT ) Else
      If AButtonState In [ hbsFocused ] Then
        DrawEdge( ACanvas.Handle, ARect, BDR_RAISEDOUTER, BF_RECT ) Else
        DrawEdge( ACanvas.Handle, ARect, BDR_SUNKENINNER, BF_FLAT );
  End;
End;

Procedure TmxButton.DrawXPFocusRect( ACanvas: TCanvas; Var ARect: TRect; AButtonState: TmxButtonState );
Begin
  If FButtonKind <> bkButton Then Exit;

  If Not ( AButtonState In [ hbsDown, hbsFocused ] ) Then Exit;

  If ( ( hoFocusDisabled In TmxButtons( Collection ).Header.Options ) And ( Not Enabled ) ) Or ( Enabled ) Then
  Begin
    ACanvas.Brush.Color := GetSettings.XPColors.BorderColor;
    ACanvas.FrameRect( ARect );

    If AButtonState = hbsDown Then
      ACanvas.Brush.Color := GetSettings.XPColors.PressedBackground Else
      ACanvas.Brush.Color := GetSettings.XPColors.Background;

    Inc( ARect.Left );
    Inc( ARect.Top );
    Dec( ARect.Right );
    Dec( ARect.Bottom );

    ACanvas.FillRect( ARect );
  End;
End;

Procedure TmxButton.DrawXPImageRect( ACanvas: TCanvas; Var ARect: TRect; Pushed: Boolean );
Var
  _BrushColor: TColor;
  _BrushType: TBrushStyle;
  ShadowBitmap: TBitmap;
Begin
  If ( FImageList <> Nil ) And ( FImageIndex >= 0 ) Then
  Begin
    If Not Pushed Then
    Begin
      _BrushColor := ACanvas.Brush.Color;
      _BrushType := ACanvas.Brush.Style;

      If GetSettings.XPColors.UseShadow Then
      Begin
        ACanvas.Brush.Color := GetSettings.XPColors.ShadowColor;
        ACanvas.Brush.Style := bsSolid;

        ShadowBitmap := TBitmap.Create;
        ShadowBitmap.Width := FImageList.Width;
        ShadowBitmap.Height := FImageList.Height;

        FImageList.ImageType := itMask;
        FImageList.Draw( ShadowBitmap.Canvas, 0, 0, FImageIndex );

        DrawState( ACanvas.Handle, ACanvas.Brush.Handle, Nil,
          Integer( ShadowBitmap.Handle ),
          0,
          ARect.Left + 1,
          ARect.Top + 1,
          0,
          0,
          DST_BITMAP Or DSS_MONO );

        ShadowBitmap.Free;
      End;

      FImageList.ImageType := itImage;
      FImageList.Draw( ACanvas, ARect.Left, ARect.Top, FImageIndex );

      ACanvas.Brush.Color := _BrushColor;
      ACanvas.Brush.Style := _BrushType;
    End
    Else
    Begin
      FImageList.ImageType := itImage;
      FImageList.Draw( ACanvas, ARect.Left + 1, ARect.Top + 1, FImageIndex );
    End;
  End;
End;

Function TmxButton.UseRightToLeftAlignment: Boolean;
Begin
  Result := SysLocale.MiddleEast And ( BiDiMode = bdRightToLeft );
End;

Function TmxButton.IsBiDiModeStored: Boolean;
Begin
  Result := Not ParentBiDiMode;
End;

Function TmxButton.UseRightToLeftReading: Boolean;
Begin
  Result := SysLocale.MiddleEast And ( BiDiMode <> bdLeftToRight );
End;

Function TmxButton.DrawTextBiDiModeFlagsReadingOnly: Longint;
Begin
  If UseRightToLeftReading Then
    Result := DT_RTLREADING Else
    Result := 0;
End;

Function TmxButton.DrawTextBiDiModeFlags( Flags: Longint ): Longint;
Begin
  Result := Flags;
    { do not change center alignment }
  If UseRightToLeftAlignment Then
    If Result And DT_RIGHT = DT_RIGHT Then
      Result := Result And Not DT_RIGHT { removing DT_RIGHT, makes it DT_LEFT }
    Else If Not ( Result And DT_CENTER = DT_CENTER ) Then
      Result := Result Or DT_RIGHT;
  Result := Result Or DrawTextBiDiModeFlagsReadingOnly;
End;

Function TmxButton.GetFont( FocusEnabled: Boolean ): TFont;
Begin
  If Not ( boCustomFont In FOptions ) Then
  Begin
    If FState = hbsUp Then
      Result := GetSettings.ButtonFont Else
    Begin
      If FocusEnabled Then
        Result := GetSettings.ButtonHighlightFont Else
        Result := GetSettings.ButtonFont;
    End;
  End
  Else
  Begin
    If FState = hbsUp Then
      Result := Font Else
    Begin
      If FocusEnabled Then
        Result := HighlightFont Else
        Result := Font;
    End;
  End;
End;

Procedure TmxButton.DrawCheckStyle( ACanvas: TCanvas );
Begin
  ACanvas.Brush.Style := bsClear;

  FCheckBoxRect := FLabelRect;
  If FAlignment In [ taLeftJustify, taCenter ] Then
  Begin
    FCheckBoxRect.Right := FCheckBoxRect.Left + 13;
    FLabelRect.Left := FCheckBoxRect.Right + 3;
  End
  Else
  Begin
    FCheckBoxRect.Left := FCheckBoxRect.Right - 13;
    FLabelRect.Right := FCheckBoxRect.Left - 3;
  End;

  FCheckBoxRect.Top := FCheckBoxRect.Top + ( FCheckBoxRect.Bottom - FCheckBoxRect.Top - 13 ) Div 2;
  FCheckBoxRect.Bottom := FCheckBoxRect.Top + 13;

  With ACanvas Do
  Begin
    Case FButtonKind Of
      bkCheckBox:
        Begin
          If FPaintGrayed Then
          Begin
            If Checked Then
              DrawFrameControl( Handle, FCheckBoxRect, DFC_Button, DFCS_ButtonCheck Or DFCS_Checked Or DFCS_Inactive ) Else
              DrawFrameControl( Handle, FCheckBoxRect, DFC_Button, DFCS_ButtonCheck Or DFCS_Inactive );
            Exit;
          End;

          If FCheckState = cbUnchecked Then
            DrawFrameControl( Handle, FCheckBoxRect, DFC_Button, DFCS_ButtonCheck );
          If FCheckState = cbChecked Then
            DrawFrameControl( Handle, FCheckBoxRect, DFC_Button, DFCS_ButtonCheck Or DFCS_Checked );
          If FCheckState = cbGrayed Then
            DrawFrameControl( Handle, FCheckBoxRect, DFC_Button, DFCS_ButtonCheck Or DFCS_Checked Or DFCS_Inactive );
        End;

      bkRadioButton:
        Begin
          If FPaintGrayed Then
          Begin
            If Checked Then
              DrawFrameControl( Handle, FCheckBoxRect, DFC_Button, DFCS_ButtonRadio Or DFCS_Checked Or DFCS_Inactive ) Else
              DrawFrameControl( Handle, FCheckBoxRect, DFC_Button, DFCS_ButtonRadio Or DFCS_Inactive );
            Exit;
          End;

          If FCheckState = cbUnchecked Then
            DrawFrameControl( Handle, FCheckBoxRect, DFC_Button, DFCS_ButtonRadio );
          If FCheckState = cbChecked Then
            DrawFrameControl( Handle, FCheckBoxRect, DFC_Button, DFCS_ButtonRadio Or DFCS_Checked );
          If FCheckState = cbGrayed Then
            DrawFrameControl( Handle, FCheckBoxRect, DFC_Button, DFCS_ButtonRadio Or DFCS_Checked Or DFCS_Inactive );
        End;

      bkPushButton:
        Begin
          If FPaintGrayed Then
          Begin
            If Checked Then
              DrawFrameControl( Handle, FCheckBoxRect, DFC_Button, DFCS_ButtonPush Or DFCS_Checked Or DFCS_Inactive ) Else
              DrawFrameControl( Handle, FCheckBoxRect, DFC_Button, DFCS_ButtonPush Or DFCS_Flat );
            Exit;
          End;

          If FCheckState = cbUnchecked Then
            DrawFrameControl( Handle, FCheckBoxRect, DFC_Button, DFCS_ButtonPush );
          If FCheckState = cbChecked Then
            DrawFrameControl( Handle, FCheckBoxRect, DFC_Button, DFCS_ButtonPush Or DFCS_Pushed );
          If FCheckState = cbGrayed Then
            DrawFrameControl( Handle, FCheckBoxRect, DFC_Button, DFCS_ButtonPush Or DFCS_Checked Or DFCS_Flat );
        End;
    End;
  End;
End;

Procedure TmxButton.DrawCaption( ACanvas: TCanvas; Pushed: Boolean; Underline: Boolean );
Const
  Alignments: Array[ TAlignment ] Of Word = ( DT_LEFT, DT_RIGHT, DT_CENTER );
  WordWraps: Array[ Boolean ] Of Word = ( 0, DT_WORDBREAK );
Var
  Flags: Longint;
  PaintRect: TRect;
  FinalRect: TRect;
  Text: String;
  X: Integer;
Begin
  If FButtonKind In [ bkCheckBox, bkPushButton, bkRadioButton ] Then
    DrawCheckStyle( ACanvas );

  If ( Not Enabled ) Or ( FButtonKind <> bkButton ) Then
  Begin
    Pushed := False;
    Underline := False;
  End;

  Text := FCaption;
  ACanvas.Font.Assign( GetFont( FButtonKind = bkButton ) );

  If Underline Then ACanvas.Font.Style := ACanvas.Font.Style + [ fsUnderline ];

  ACanvas.Brush.Style := bsClear;

  Flags :=
    DT_EXPANDTABS Or
    WordWraps[ FWordWrap ] Or
    DT_END_ELLIPSIS Or
    DT_VCENTER;

  If ( GetStyle = bsLarge ) Or ( FButtonKind = bkLabel ) Then
    Flags := Flags Or Alignments[ FAlignment ] Else
    Flags := Flags Or DT_LEFT;

  If ( ( Text = '' ) Or FShowAccelChar And ( Text[ 1 ] = '&' ) And ( Text[ 2 ] = #0 ) ) Then Text := Text + ' ';
  If Not FShowAccelChar Then Flags := Flags Or DT_NOPREFIX;

  Flags := DrawTextBiDiModeFlags( Flags );

  PaintRect := FLabelRect;
  FinalRect := FLabelRect;

{$WARNINGS OFF}
  DrawText( ACanvas.Handle, PChar( Text ), Length( Text ), PaintRect, Flags Or DT_CALCRECT );
{$WARNINGS ON}

  If ( GetStyle = bsLarge ) And ( FButtonKind = bkButton ) Then
  Begin
    //FinalRect.Left := PaintRect.Left + ( ( FLabelRect.Right - FLabelRect.Left ) - ( PaintRect.Right - PaintRect.Left ) ) Div 2;
    //FinalRect.Right := PaintRect.Right + ( ( FLabelRect.Right - FLabelRect.Left ) - ( PaintRect.Right - PaintRect.Left ) ) Div 2;
  End;

  X := ( ( FLabelRect.Bottom - FLabelRect.Top ) - ( PaintRect.Bottom - PaintRect.Top ) ) Div 2;
  If X > 0 Then
  Begin
    FinalRect.Top := PaintRect.Top + X;
    FinalRect.Bottom := PaintRect.Bottom + X;
  End;

  If Not Enabled Then
  Begin
    OffsetRect( FinalRect, 1, 1 );
    ACanvas.Font.Color := clBtnHighlight;
{$WARNINGS OFF}
    DrawText( ACanvas.Handle, PChar( Text ), Length( Text ), FinalRect, Flags );
{$WARNINGS ON}
    OffsetRect( FinalRect, -1, -1 );
    ACanvas.Font.Color := clBtnShadow;
{$WARNINGS OFF}
    DrawText( ACanvas.Handle, PChar( Text ), Length( Text ), FinalRect, Flags );
{$WARNINGS ON}
  End
  Else
  Begin
    If Pushed Then
    Begin
      Inc( FinalRect.Top );
      Inc( FinalRect.Left );
      Inc( FinalRect.Bottom );
      Inc( FinalRect.Right );
    End;

{$WARNINGS OFF}
    DrawText( ACanvas.Handle, PChar( Text ), Length( Text ), FinalRect, Flags );
{$WARNINGS ON}
  End;

  FLabelRect := FinalRect;
  InflateRect( FLabelRect, 0, 4 );
End;

Procedure TmxButton.DoBeforeDrawButton( ACanvas: TCanvas; Var AButtonRect: TRect; Var AFocusRect: TRect; Var AImageRect: TRect; Var ALabelRect: TRect );
Begin
  If Assigned( FOnBeforeDrawButton ) Then
    FOnBeforeDrawButton( Self, ACanvas, FButtonRect, FFocusRect, FImageRect, FLabelRect );
End;

Procedure TmxButton.DoDrawButton( ACanvas: TCanvas; AView: TmxButtonView; AState: TmxButtonState; AImageRect: TRect; ALabelRect: TRect );
Begin
  If Assigned( FOnDrawButton ) Then
    FOnDrawButton( Self, ACanvas, AView, AState, FImageRect, FLabelRect );
End;

Procedure TmxButton.DoAfterDrawButton( ACanvas: TCanvas; AImageRect: TRect; ALabelRect: TRect );
Begin
  If Assigned( FOnAfterDrawButton ) Then
    FOnAfterDrawButton( Self, ACanvas, FImageRect, FLabelRect );
End;

Procedure TmxButton.Draw( DrawBitmap: TBitmap; Var ARect: TRect; MaxBottom: Integer; Calcsize: Boolean );
Var
  _MyState: TmxButtonState;

Begin
  If Not Visible Then Exit;
  FButtonRect := ARect;
  CalculateButtonRect( FButtonRect, FImageRect, FFocusRect, FLabelRect );

  // *** Draw the button ***

  If Not Calcsize Then // *** If it is nil we just calculate the height ***
  Begin
    If MaxBottom > FButtonRect.Bottom Then
    Begin
      If Not Transparent Then
      Begin
        DrawBitmap.Canvas.Brush.Color := FColor;
        DrawBitmap.Canvas.FillRect( FButtonRect );
      End;

      DoBeforeDrawButton( DrawBitmap.Canvas, FButtonRect, FFocusRect, FImageRect, FLabelRect );

      _MyState := FState;
      If Assigned( Collection ) Then
      Begin
        If ButtonIndex = TmxButtons( Collection ).Header.SelectedIndex Then _MyState := hbsDown;
      End;

      Case GetView Of
        bvNormal:
          Begin
            If Assigned( FOnDrawButton ) Then
              DoDrawButton( DrawBitmap.Canvas, bvNormal, _MyState, FImageRect, FLabelRect ) Else
            Begin
              DrawFocusRect( DrawBitmap.Canvas, FFocusRect, _MyState );
              DrawImageRect( DrawBitmap.Canvas, FImageRect, _MyState In [ hbsDown ] );
              DrawCaption( DrawBitmap.Canvas, False, False );
            End;
          End;
        bvToolBox:
          Begin
            If Assigned( FOnDrawButton ) Then
              DoDrawButton( DrawBitmap.Canvas, bvToolBox, _MyState, FImageRect, FLabelRect ) Else
            Begin
              DrawFocusRect( DrawBitmap.Canvas, FFocusRect, _MyState );
              DrawImageRect( DrawBitmap.Canvas, FImageRect, _MyState In [ hbsDown ] );
              DrawCaption( DrawBitmap.Canvas, _MyState In [ hbsDown ], False );
            End;
          End;
        bvBig:
          Begin
            If Assigned( FOnDrawButton ) Then
              DoDrawButton( DrawBitmap.Canvas, bvBig, _MyState, FImageRect, FLabelRect ) Else
            Begin
              DrawFocusRect( DrawBitmap.Canvas, FFocusRect, _MyState );
              DrawImageRect( DrawBitmap.Canvas, FImageRect, _MyState In [ hbsDown ] );
              DrawCaption( DrawBitmap.Canvas, _MyState In [ hbsDown ], False );
            End;
          End;
        bvExplorer:
          Begin
            If Assigned( FOnDrawButton ) Then
              DoDrawButton( DrawBitmap.Canvas, bvExplorer, _MyState, FImageRect, FLabelRect ) Else
            Begin
              DrawImageRect( DrawBitmap.Canvas, FImageRect, _MyState In [ hbsDown ] );
              DrawCaption( DrawBitmap.Canvas, False, _MyState In [ hbsDown, hbsFocused ] );
            End;
          End;
        bvWindowsXP:
          Begin
            If Assigned( FOnDrawButton ) Then
              DoDrawButton( DrawBitmap.Canvas, bvWindowsXP, _MyState, FImageRect, FLabelRect ) Else
            Begin
              DrawXPFocusRect( DrawBitmap.Canvas, FFocusRect, _MyState );
              DrawXPImageRect( DrawBitmap.Canvas, FImageRect, _MyState In [ hbsDown ] );
              DrawCaption( DrawBitmap.Canvas, False, False );
            End;
          End;
        bvWindows2000:
          Begin
            If Assigned( FOnDrawButton ) Then
              DoDrawButton( DrawBitmap.Canvas, bvWindows2000, _MyState, FImageRect, FLabelRect ) Else
            Begin
              DrawXPFocusRect( DrawBitmap.Canvas, FFocusRect, _MyState );
              DrawXPImageRect( DrawBitmap.Canvas, FImageRect, _MyState In [ hbsDown ] );
              DrawCaption( DrawBitmap.Canvas, _MyState In [ hbsDown ], False );
            End;
          End;
      End;
      DoAfterDrawButton( DrawBitmap.Canvas, FImageRect, FLabelRect );

      // *** Alter ***
      If ( FFlashing ) And ( _MyState = hbsUp ) Then
      Begin
        AlphaBlendArea( DrawBitmap, FButtonRect, 50, TmxButtons( Collection ).OutlookBarPro.AlertColor );
      End;
    End;
  End;

  // *** Adjust ARect ***

  If ( ARect.Top < FButtonRect.Bottom ) Then
    ARect.Top := FButtonRect.Bottom + GetSettings.FButtonDistance;
End;

Procedure TmxButton.DoClick;
Begin
  If Not Enabled Then Exit;

  StopAlert;

  { Call OnClick if assigned and not equal to associated action's OnExecute.
    If associated action's OnExecute assigned then call it, otherwise, call OnClick. }
{$WARNINGS OFF}
  If Assigned( FOnClick ) And ( Action <> Nil ) And ( @FOnClick <> @Action.OnExecute ) Then
    FOnClick( Self )
  Else If ( ActionLink <> Nil ) Then
    ActionLink.Execute
  Else If Assigned( FOnClick ) Then
    FOnClick( Self );
{$WARNINGS ON}
End;

Function TmxButton.GetHeaderIndex: Integer;
Begin
  Result := TmxButtons( Collection ).Header.HeaderIndex;
End;

Function TmxButton.GetHeader: TmxHeader;
Begin
  Result := TmxButtons( Collection ).Header;
End;

Function TmxButton.IsTheFirstButton: Boolean;
Begin
  Result := TmxButtons( Collection ).Header.GetFirstVisibleButton = Self;
End;

Function TmxButton.IsTheLastButton: Boolean;
Begin
  Result := TmxButtons( Collection ).Header.GetLastVisibleButton = Self;
End;

Procedure TmxButton.Alert;
Begin
  TmxButtons( Collection ).OutlookBarPro.SetAlertedButton( Self );
End;

Procedure TmxButton.StopAlert;
Begin
  If FAlerted Then
    TmxButtons( Collection ).OutlookBarPro.SetAlertedButton( Nil );
End;

{TmxButtons}

Constructor TmxButtons.Create( AOutlookBarPro: TmxOutlookBarPro; AHeader: TmxHeader; ItemClass: TCollectionItemClass );
Begin
  Inherited Create( ItemClass );
  FOutlookBarPro := AOutlookBarPro;
  FOwner := AHeader;
End;

Function TmxButtons.GetOwner: TPersistent;
Begin
  Result := FOwner;
End;

Function TmxButtons.Add: TmxButton;
Begin
  Result := TmxButton( Inherited Add );
  Result.OnChangeParameter := FOutlookBarPro.PropertyChanged;
End;

Function TmxButtons.GetButtonItem( Index: Integer ): TmxButton;
Begin
  Result := TmxButton( Inherited Items[ Index ] );
End;

Function TmxButtons.GetAttrCount: Integer;
Begin
  Result := 1;
End;

Function TmxButtons.GetAttr( Index: Integer ): String;
Begin
  Case Index Of
    0: Result := 'Name';
  Else
    Result := '';
  End;
End;

Function TmxButtons.GetItemAttr( Index, ItemIndex: Integer ): String;
Begin
  Case Index Of
    0: Result := Buttons[ ItemIndex ].Name;
  Else
    Result := '';
  End;
End;

Procedure TmxButtons.SetButtonItem( Index: Integer; AValue: TmxButton );
Begin
  Items[ Index ].Assign( AValue );
End;

Procedure TmxButtons.SetItemName( Item: TCollectionItem );
Var
  I, J: Integer;
  ItemName: String;
  CurItem: TmxButton;
Begin
  J := 1;
  While True Do
  Begin
    ItemName := Format( 'mxButton%d', [ J ] );
    I := 0;
    While I < Count Do
    Begin
      CurItem := Items[ I ] As TmxButton;
      If ( CurItem <> Item ) And ( CompareText( CurItem.Name, ItemName ) = 0 ) Then
      Begin
        Inc( J );
        Break;
      End;
      Inc( I );
    End;
    If I >= Count Then
    Begin
      ( Item As TmxButton ).Name := ItemName;
      Break;
    End;
  End;
End;

Procedure TmxButtons.Update( Item: TCollectionItem );
Begin
     //FOutlookBarPro.Invalidate;
End;

{TmxOutlookBarPro}

Constructor TmxOutlookBarPro.Create( AOwner: TComponent );
Begin
  Inherited Create( AOwner );

  ControlStyle := [ csCaptureMouse, csClickEvents, csOpaque ];

  Align := alLeft;
  Color := clbtnFace;
  TabStop := True;
  Width := 120;
  FSequence := 0;
  FActiveHeader := Nil;
  FCommonStyle := True;

  BorderWidth := 0;
  FBorderStyle := bsNone;

  FBevelInner := bvNone;
  FBevelOuter := bvLowered;
  FBevelWidth := 1;

  FVersion := mxOutlookVersion;

  FHeaders := TmxHeaders.Create( Self, TmxHeader );

  FBackground := TmxBackground.Create;
  FBackground.OnChangeParameter := PropertyChanged;

  FSettings := TmxBarSettings.Create;
  FSettings.OnChangeParameter := PropertyChanged;

  FHeaderImages := TmxHeaderImages.Create( AOwner );
  FHeaderImages.OnChangeParameter := PropertyChanged;

  FBorder := TmxBorder.Create;
  FBorder.OnChangeParameter := PropertyChanged;

  FUpdating := False;
  FUpdateCounter := 0;
  FReCalcHeaderPositions := True;

  FViewStyle := vsOutlook;
  FFlat := True;

  FMouseInHeader := Nil;
  FMouseInHeaderBody := Nil;
  FProcessing := False;
  FPainting := False;

  FHeaderScrollType := stAccelerated;
  FHeaderScrollValue := 20;
  FHeaderScrollAcceleration := 5;

  FCloseButton := TmxCloseButton.Create( Self );

  FExplorerMethod := emCloseUp;

  FOptions := [ boAcceptOLEDrop, boAutoScroll, boAutoChangeHeader, boFocusOnMouseEnter, boHeaderFrame, boInternalDrop ];
  FSavedHeaderIndex := -1;

  FOffset := 0;
  FScrollUpState := hbsUp;
  FScrollDownState := hbsUp;

  FScrollChange := 50;

  FEditor := TmxInplaceEditor.Create( Self );
  FEditor.OnContextPopup := EditorContext;

  FReadyToPaint := False;

  FButtonScrollDownState := hbsUp;
  FButtonScrollUpState := hbsUp;

  FScrollView := ssNormal;
  FScrollBoxSize := 15;

  FPreSet := psOutlook;
  FEachHeaderSelection := False;

  FDropMarkColor := clBlack;
  FAutoButtonScrollDelay := 600;
  FAutoScrollDelay := 500;
  FAutoChangeDelay := 100;
  FAlertInterval := 500;
  FAlertedButton := Nil;
  FStopAlerting := False;
  FAlertColor := clRed;

  FLoaded := False;

  If Not Registered Then
  Begin
    RegisterClasses( [
      TmxOutlookBarPro,
        TmxHeader,
        TmxInplaceEdit,
        TmxBackground,
        TmxBarSettings ] );

    Registered := True;
  End;
End;

Destructor TmxOutlookBarPro.Destroy;
Begin
  FActiveHeader := Nil;
  FMouseInHeader := Nil;
  FMouseInHeaderBody := Nil;

  FEditor.Free;

  FEditor.OnContextPopup := Nil;
  FCloseButton.Free;

  ClearHeaders;
  FreeAndNil( FHeaders );

  FBackground.OnChangeParameter := Nil;
  FBackground.Free;

  FHeaderImages.OnChangeParameter := Nil;
  FHeaderImages.Free;

  FBorder.OnChangeParameter := Nil;
  FBorder.Free;

  FSettings.OnChangeParameter := Nil;
  FSettings.Free;

  FPainting := True;
  FReadyToPaint := False;

  FAlertedButton := Nil;
  FLoaded := False;

  Inherited Destroy;
End;

Procedure TmxOutlookBarPro.SetVersion( AValue: String );
Begin
        // *** Does nothing ***
End;

Function TmxOutlookBarPro.GetVersion: String;
Begin
{$WARNINGS OFF}
  Result := Format( '%d.%d', [ Hi( FVersion ), Lo( FVersion ) ] ) + SubRelease;
{$WARNINGS ON}
End;

Procedure TmxOutlookBarPro.Loaded;
Begin
  Inherited Loaded;
  FActiveHeader := HeaderByIndex( FSavedHeaderIndex );
  FLoaded := True;
End;

Procedure TmxOutlookBarPro.CreateWnd;
Begin
  Inherited;

  If Not ( csDesigning In ComponentState ) Then
  Begin
    FDragManager := TmxDragDropManager.Create( Self );
    FDragManager.SetOLEFormats;
    FDragManager._AddRef;

    If ( boAcceptOLEDrop In FOptions ) Or ( boInternalDrop In FOptions ) Then RegisterDragDrop( Handle, FDragManager );
  End;
End;

Procedure TmxOutlookBarPro.CreateParams( Var Params: TCreateParams );
Const
  BorderStyles: Array[ TBorderStyle ] Of DWORD = ( 0, WS_BORDER );
Begin
  Inherited CreateParams( Params );

  With Params Do
  Begin
    Style := Style Or BorderStyles[ FBorderStyle ];
    If NewStyleControls And Ctl3D And ( FBorderStyle = bsSingle ) Then
    Begin
      Style := Style And Not WS_BORDER;
      ExStyle := ExStyle Or WS_EX_CLIENTEDGE;
    End;
    WindowClass.Style := WindowClass.Style And Not ( CS_HREDRAW Or CS_VREDRAW );
  End;
End;

Procedure TmxOutlookBarPro.ReadAlign( Reader: TReader );
Var
  S: String;
Begin
  S := Reader.ReadString;

  If S = 'alNone' Then Align := alNone Else
    If S = 'alTop' Then Align := alTop Else
      If S = 'alBottom' Then Align := alBottom Else
        If S = 'alLeft' Then Align := alLeft Else
          If S = 'alRight' Then Align := alRight Else
            If S = 'alClient' Then Align := alClient;
End;

Procedure TmxOutlookBarPro.WriteAlign( Writer: TWriter );
Begin
  Case Align Of
    alNone: Writer.WriteString( 'alNone' );
    alTop: Writer.WriteString( 'alTop' );
    alBottom: Writer.WriteString( 'alBottom' );
    alLeft: Writer.WriteString( 'alLeft' );
    alRight: Writer.WriteString( 'alRight' );
    alClient: Writer.WriteString( 'alClient' );
  End;
End;

Procedure TmxOutlookBarPro.ReadIndex( Reader: TReader );
Begin
  FSavedHeaderIndex := Reader.ReadInteger;
End;

Procedure TmxOutlookBarPro.WriteIndex( Writer: TWriter );
Begin
  Writer.WriteInteger( GetActiveHeaderIndex );
End;

Procedure TmxOutlookBarPro.DefineProperties( Filer: TFiler );
Begin
  Inherited DefineProperties( Filer );
  Filer.DefineProperty( 'AlignInfo', ReadAlign, WriteAlign, TRUE );
  Filer.DefineProperty( 'ActiveIndex', ReadIndex, WriteIndex, TRUE );
End;

Procedure TmxOutlookBarPro.WMEraseBkgnd( Var Message: TWMEraseBkgnd );
Begin
  Message.Result := 1;
End;

Procedure TmxOutlookBarPro.SetBorderStyle( AValue: TBorderStyle );
Begin
  If FBorderStyle <> AValue Then
  Begin
    FBorderStyle := AValue;
    RecreateWnd;
  End;
End;

Procedure TmxOutlookBarPro.SetBevelOuter( AValue: TPanelBevel );
Begin
  If FBevelOuter <> AValue Then
  Begin
    FBevelOuter := AValue;
    Change;
  End;
End;

Procedure TmxOutlookBarPro.SetBevelWidth( AValue: TBevelWidth );
Begin
  If FBevelWidth <> AValue Then
  Begin
    FBevelWidth := AValue;
    Change;
  End;
End;

Procedure TmxOutlookBarPro.SetScrollView( AValue: TmxScrollView );
Begin
  If FScrollView <> AValue Then
  Begin
    FScrollView := AValue;
    Change;
  End;
End;

Procedure TmxOutlookBarPro.SetBevelInner( AValue: TPanelBevel );
Begin
  If FBevelInner <> AValue Then
  Begin
    FBevelInner := AValue;
    Change;
  End;
End;

Procedure TmxOutlookBarPro.AdjustClientRect( Var Rect: TRect );
Var
  ABevelSize: Integer;
Begin
  Inherited AdjustClientRect( Rect );

  ABevelSize := 0;
  If BevelOuter <> bvNone Then Inc( ABevelSize, BevelWidth );
  If BevelInner <> bvNone Then Inc( ABevelSize, BevelWidth );
  InflateRect( Rect, -ABevelSize, -ABevelSize );
End;

Procedure TmxOutlookBarPro.Change;
Begin
  DoInvalidate;
End;

Procedure TmxOutlookBarPro.PropertyChanged( Sender: TObject );
Begin
  DoInvalidate;
End;

Procedure TmxOutlookBarPro.CMCtl3DChanged( Var Message: TMessage );
Begin
  If NewStyleControls And ( FBorderStyle = bsSingle ) Then RecreateWnd;
  Inherited;
End;

Procedure TmxOutlookBarPro.CMBorderChanged( Var Message: TMessage );
Begin
  DoInvalidate;
End;

Procedure TmxOutlookBarPro.WMSize( Var Message: TWMSize );
Begin
  DoInvalidate;
End;

Procedure TmxOutlookBarPro.WMNCDestroy( Var Message: TWMNCDestroy );
Begin
  If Not ( csDesigning In ComponentState ) And ( ( boAcceptOLEDrop In FOptions ) Or ( boInternalDrop In FOptions ) ) Then
  Begin
    RevokeDragDrop( Handle );
  End;

  If Assigned( FAlertedButton ) Then FAlertedButton.StopAlert;

  Inherited;
End;

Procedure TmxOutlookBarPro.CMSysColorChange( Var Message: TMessage );
Begin
  Inherited;
  If Not ( csLoading In ComponentState ) Then
  Begin
    Message.Msg := WM_SYSCOLORCHANGE;
    DefaultHandler( Message );
  End;
End;

Procedure TmxOutlookBarPro.CMEnabledChanged( Var Message: TMessage );
Begin
  Inherited;
  DoInvalidate;
End;

Procedure TmxOutlookBarPro.CMColorChanged( Var Message: TMessage );
Begin
  Inherited;
  RecreateWnd;
End;

Procedure TmxOutlookBarPro.RemoveHeader( AHeader: TmxHeader );
Begin
  If Assigned( AHeader ) Then FHeaders.Delete( AHeader.Index );
End;

Procedure TmxOutlookBarPro.DeleteHeader( AHeaderIndex: Integer );
Begin
  RemoveHeader( HeaderByIndex( AHeaderIndex ) );
End;

Procedure TmxOutlookBarPro.ClearHeaders;
Var
  I: Integer;
Begin
  BeginUpdate;
  For I := HeaderCount - 1 Downto 0 Do DeleteHeader( I );
  EndUpdate;
End;

Function TmxOutlookBarPro.GetHeaderCount: Integer;
Begin
  Result := FHeaders.Count;
End;

Function TmxOutlookBarPro.GetEnabledHeaderCount: Integer;
Var
  I: Integer;
Begin
  Result := 0;
  For I := 0 To HeaderCount - 1 Do
    If HeaderByIndex( I ).Enabled Then Inc( Result );
End;

Function TmxOutlookBarPro.GetVisibleHeaderCount: Integer;
Var
  I: Integer;
Begin
  Result := 0;
  For I := 0 To HeaderCount - 1 Do
    If HeaderByIndex( I ).Visible Then Inc( Result );
End;

Function TmxOutlookBarPro.HeaderByIndex( Index: Integer ): TmxHeader;
Begin
  Result := Nil;
  If Index > HeaderCount - 1 Then Exit;
  If Index >= 0 Then Result := FHeaders[ Index ];
End;

Function TmxOutlookBarPro.HeaderIndexByName( Name: String ): Integer;
Var
  I: Integer;
Begin
  Result := -1;

     // *** This solution is so important. Do not modify it. ***
  For I := 0 To HeaderCount - 1 Do
  Begin
    If AnsiCompareText( FHeaders[ I ].Name, Name ) = 0 Then
    Begin
      Result := I;
      Break;
    End;
  End;
End;

Function TmxOutlookBarPro.HeaderByName( Name: String ): TmxHeader;
Begin
  Result := HeaderByIndex( HeaderIndexByName( Name ) );
End;

Function TmxOutlookBarPro.AddHeader: TmxHeader;
Begin
  BeginUpdate;
  Result := FHeaders.Add;
  SetPresetHeader( Result );
  EndUpdate;
End;

Function TmxOutlookBarPro.CreateHeader: Longint;
Begin
  Result := HeaderIndexByName( AddHeader.Name );
End;

Procedure TmxOutlookBarPro.BeginUpdate;
Begin
  Inc( FUpdateCounter );
  FUpdating := True;
End;

Procedure TmxOutlookBarPro.EndUpdate;
Begin
  If FUpdating Then
  Begin
    Dec( FUpdateCounter );
    If FUpdateCounter = 0 Then
    Begin
      FUpdating := False;
      DoInvalidate;
    End;
  End;
End;

Procedure TmxOutlookBarPro.SetActiveHeader( ANewHeader: TmxHeader );
Var
  _ParentForm: TCustomForm;
  DesignTime: Boolean;
  CanChange: Boolean;
  OldIndex: Integer;
  NewIndex: Integer;
  X, I: Integer;
  Steps: Integer;
  TempHeader: TmxHeader;
  AccelerationValue: Integer;
  BreakNeed: Boolean;
  TopChecked: Boolean;
Begin
  DesignTime := csDesigning In ComponentState;

  If Assigned( ANewHeader ) And ( ( Not ANewHeader.Visible ) And ( Not DesignTime ) ) Then Exit;

  BeginUpdate;

  _ParentForm := GetParentForm( Self );

     // *** Can change header or not? ***

  CanChange := True;
  If ( Not DesignTime ) Then DoCanChange( ANewHeader, CanChange );

  If Assigned( ANewHeader ) And CanChange Then
  Begin
    If ANewHeader.IsEnabled Then
      CanChange := True Else
      CanChange := boChangeToDisabled In FOptions;

    If DesignTime Then CanChange := True;
  End;

  If Not CanChange Then
  Begin
    EndUpdate;
    Exit;
  End;

     // *** Call Bar Onchange Event ***

  If FActiveHeader = Nil Then OldIndex := -1 Else OldIndex := FActiveHeader.HeaderIndex;
  If ANewHeader = Nil Then NewIndex := -1 Else NewIndex := ANewHeader.HeaderIndex;

  If ( Not DesignTime ) And Assigned( FOnChange ) And ( Not ( csDestroying In ComponentState ) ) Then
    DoChange( OldIndex, NewIndex );

  // *** Do Scrolling ***

  If ( ViewStyle = vsExplorerBar ) And ( ExplorerMethod = emCloseUp ) Then
  Begin
    If Assigned( ANewHeader ) Then ANewHeader.Opened := Not ANewHeader.Opened;
    FReCalcHeaderPositions := True;
  End
  Else
  Begin
    FUpdatedHeaderIndex := -1;

    If ANewHeader <> FActiveHeader Then
      If Assigned( ANewHeader ) And Assigned( FActiveHeader ) Then
      Begin
        If ( FHeaderScrollType <> stNone ) And ( HeaderScrollValue > 0 ) Then
        Begin
          FUpdating := False;
          FReCalcHeaderPositions := False;

          Paint;
          ANewHeader.SetState( hbsFocused );
          Paint;

          If NewIndex < OldIndex Then // *** Scroll Down ***
          Begin
            ANewHeader.FBodyRect := ANewHeader.FButtonRect;
            ANewHeader.FBodyRect.Top := ANewHeader.FButtonRect.Bottom;
            ANewHeader.FBodyRect.Bottom := ANewHeader.FBodyRect.Top;

            ANewHeader.FBodyRect.Right := FActiveHeader.FBodyRect.Right;
            Steps := ( FActiveHeader.BodyRect.Bottom - FActiveHeader.BodyRect.Top ) Div FHeaderScrollValue;

            FUpdatedHeaderIndex := NewIndex;
            AccelerationValue := 1;

            For I := 0 To Steps Do
            Begin
              For X := NewIndex + 1 To OldIndex - 1 Do
              Begin
                TempHeader := HeaderByIndex( X );
                Inc( TempHeader.FButtonRect.Top, HeaderScrollValue * AccelerationValue );
                Inc( TempHeader.FButtonRect.Bottom, HeaderScrollValue * AccelerationValue );
              End;

              Inc( ANewHeader.FBodyRect.Bottom, HeaderScrollValue * AccelerationValue );
              Inc( FActiveHeader.FButtonRect.Top, HeaderScrollValue * AccelerationValue );
              Inc( FActiveHeader.FButtonRect.Bottom, HeaderScrollValue * AccelerationValue );
              Inc( FActiveHeader.FBodyRect.Top, HeaderScrollValue * AccelerationValue );

              If ( ViewStyle = vsOutlook ) And ( ScrollView = ssToolBox ) Then
              Begin
                Inc( FButtonScrollUpRect.Top, HeaderScrollValue * AccelerationValue );
                Inc( FButtonScrollUpRect.Bottom, HeaderScrollValue * AccelerationValue );
              End
              Else
              Begin
                FButtonScrollUpRect := Bounds( 0, 0, 0, 0 );
                FButtonScrollDownRect := Bounds( 0, 0, 0, 0 );
              End;

              If ( HeaderScrollValue < 10 ) And ( Not DesignTime ) Then Application.ProcessMessages;
              If FHeaderScrollType = stAccelerated Then Inc( AccelerationValue );

              If FActiveHeader.FButtonRect.Bottom > FActiveHeader.BodyRect.Bottom Then Break;

              Paint;
            End;
          End
          Else // *** Scroll Up ***
          Begin
            ANewHeader.FBodyRect := ANewHeader.FButtonRect;
            ANewHeader.FBodyRect.Top := ANewHeader.FBodyRect.Bottom - 1;

            ANewHeader.FBodyRect.Right := FActiveHeader.FBodyRect.Right;
            Steps := ( FActiveHeader.BodyRect.Bottom - FActiveHeader.BodyRect.Top ) Div FHeaderScrollValue;

            FUpdatedHeaderIndex := NewIndex;
            AccelerationValue := 1;
            BreakNeed := False;

            For I := 0 To Steps Do
            Begin
              TopChecked := False;

              For X := OldIndex + 1 To NewIndex - 1 Do
              Begin
                TempHeader := HeaderByIndex( X );
                Dec( TempHeader.FButtonRect.Top, HeaderScrollValue * AccelerationValue );
                Dec( TempHeader.FButtonRect.Bottom, HeaderScrollValue * AccelerationValue );

                If ( X = OldIndex + 1 ) And ( Not TopChecked ) Then
                Begin
                  BreakNeed := TempHeader.FButtonRect.Top < FActiveHeader.ButtonRect.Bottom + 1;
                  TopChecked := True;
                End;
              End;

              Dec( ANewHeader.FButtonRect.Top, HeaderScrollValue * AccelerationValue );
              Dec( ANewHeader.FButtonRect.Bottom, HeaderScrollValue * AccelerationValue );
              Dec( ANewHeader.FBodyRect.Top, HeaderScrollValue * AccelerationValue );
              Dec( FActiveHeader.FBodyRect.Bottom, HeaderScrollValue * AccelerationValue );

              If ( ViewStyle = vsOutlook ) And ( ScrollView = ssToolBox ) Then
              Begin
                Dec( FButtonScrollDownRect.Top, HeaderScrollValue * AccelerationValue );
                Dec( FButtonScrollDownRect.Bottom, HeaderScrollValue * AccelerationValue );
              End
              Else
              Begin
                FButtonScrollUpRect := Bounds( 0, 0, 0, 0 );
                FButtonScrollDownRect := Bounds( 0, 0, 0, 0 );
              End;

              If ( HeaderScrollValue < 10 ) And ( Not DesignTime ) Then Application.ProcessMessages;
              If FHeaderScrollType = stAccelerated Then Inc( AccelerationValue );

              If Not TopChecked Then BreakNeed := ANewHeader.FButtonRect.Top < FActiveHeader.ButtonRect.Bottom + 1;
              If BreakNeed Then Break;

              Paint;
            End;
          End;

          FUpdatedHeaderIndex := -1;
          FReCalcHeaderPositions := True;
          FUpdating := True;
        End;
      End;
  End;

     // *** Call Headers Onchange Events ***

  If Not DesignTime Then
  Begin
    If Assigned( ANewHeader ) Then ANewHeader.Change;
  End;

  FActiveHeader := ANewHeader;

  If DesignTime And ( _ParentForm <> Nil ) Then
    If ( _ParentForm.Designer <> Nil ) {And ( csLoading In ComponentState ) } Then
    Begin
      _ParentForm.Designer.Modified;
    End;

  If Assigned( FActiveHeader ) Then FActiveHeader.SetState( hbsFocused );

  EndUpdate;
End;

Procedure TmxOutlookBarPro.CMFontChanged( Var Msg: TMessage );
Begin
  Inherited;
  DoInvalidate;
End;

Procedure TmxOutlookBarPro.CMTextChanged( Var Msg: TMessage );
Begin
  Inherited;
  DoInvalidate;
End;

Procedure TmxOutlookBarPro.CMVisibleChanged( Var Message: TMessage );
Begin
  Inherited;
  If Visible Then DoShow Else DoHide;
  DoInvalidate;
End;

Procedure TmxOutlookBarPro.CheckImages( AImages: TmxButtonImages; AComponent: TComponent; Operation: TOperation );
Begin
  If ( Operation = opRemove ) And ( AImages <> Nil ) Then
  Begin
    If AComponent = AImages.Normal Then AImages.Normal := Nil;
    If AComponent = AImages.Small Then AImages.Small := Nil;
    If AComponent = AImages.Hot Then AImages.Hot := Nil;
    If AComponent = AImages.HotSmall Then AImages.HotSmall := Nil;
    If AComponent = AImages.Disabled Then AImages.Disabled := Nil;
    If AComponent = AImages.DisabledSmall Then AImages.DisabledSmall := Nil;
  End;
End;

Procedure TmxOutlookBarPro.CheckHeaderImages( AImages: TmxHeaderImages; AComponent: TComponent; Operation: TOperation );
Begin
  If ( Operation = opRemove ) And ( AImages <> Nil ) Then
  Begin
    If AComponent = AImages.Normal Then AImages.Normal := Nil;
    If AComponent = AImages.Hot Then AImages.Hot := Nil;
  End;
End;

Procedure TmxOutlookBarPro.Notification( AComponent: TComponent; Operation: TOperation );
Var
  I, X: Integer;
Begin
  Inherited Notification( AComponent, Operation );

  If Assigned( FHeaders ) Then
  Begin
    For I := 0 To HeaderCount - 1 Do
      CheckImages( HeaderByIndex( I ).Images, AComponent, Operation );
  End;
  CheckHeaderImages( HeaderImages, AComponent, Operation );

  If AComponent Is TPopupMenu Then
  Begin
    Case Operation Of
      opInsert:
        Begin
        End;
      opRemove:
        Begin
          If PopupMenu = AComponent Then PopupMenu := Nil;

          For I := 0 To HeaderCount - 1 Do
          Begin
            If Headers[ I ].FPopupMenu = AComponent Then Headers[ I ].FPopupMenu := Nil;

            For X := 0 To Headers[ I ].ButtonCount - 1 Do
            Begin
              If Headers[ I ].Buttons[ X ].FPopupMenu = AComponent Then
                Headers[ I ].Buttons[ X ].FPopupMenu := Nil;
            End;
          End;
        End;
    End;
  End;
End;

Function TmxOutlookBarPro.CanFocus: Boolean;
Begin
  Result := True;
End;

Procedure TmxOutlookBarPro.SetCommonStyle( AValue: Boolean );
Begin
  If FCommonStyle <> AValue Then
  Begin
    FCommonStyle := AValue;
    DoInvalidate;
  End;
End;

Procedure TmxOutlookBarPro.SetViewStyle( AValue: TmxViewStyle );
Begin
  If FViewStyle <> AValue Then
  Begin
    If DoChangeViewStyle( Self, FViewStyle, AValue ) Then
    Begin
      FOffset := 0;
      FViewStyle := AValue;
      RecreateWnd;
    End;
  End;
End;

Procedure TmxOutlookBarPro.SetScrollBoxSize( AValue: Word );
Begin
  If AValue <> FScrollBoxSize Then
  Begin
    FScrollBoxSize := AValue;
    DoInvalidate;
  End;
End;

Procedure TmxOutlookBarPro.SetBorderWidth( AValue: TBorderWidth );
Begin
  If AValue <> GetBorderWidth Then
  Begin
    Inherited BorderWidth := AValue;
    RecreateWnd;
  End;
End;

Function TmxOutlookBarPro.GetBorderWidth: TBorderWidth;
Begin
  Result := Inherited BorderWidth;
End;

Procedure TmxOutlookBarPro.SetEachHeaderSelection( AValue: Boolean );
Var
  I: Integer;
Begin
  If FEachHeaderSelection <> AValue Then
  Begin
    FEachHeaderSelection := AValue;
    For I := 0 To HeaderCount - 1 Do Headers[ I ].FSelectedIndex := -1;
    Change;
  End;
End;

Procedure TmxOutlookBarPro.SetFlat( AValue: Boolean );
Begin
  If AValue <> FFlat Then
  Begin
    FFlat := AValue;
    DoInvalidate;
  End;
End;

Procedure TmxOutlookBarPro.SetHeaderScrollType( AValue: TmxHeaderScrollType );
Begin
  If AValue <> FHeaderScrollType Then FHeaderScrollType := AValue;
End;

Procedure TmxOutlookBarPro.SetHeaderScrollValue( AValue: Byte );
Begin
  If AValue = 0 Then AValue := 1;
  If AValue <> FHeaderScrollValue Then FHeaderScrollValue := AValue;
End;

Procedure TmxOutlookBarPro.SetHeaderScrollAcceleration( AValue: Byte );
Begin
  If AValue = 0 Then AValue := 1;
  If AValue <> FHeaderScrollAcceleration Then FHeaderScrollAcceleration := AValue;
End;

Function TmxOutlookBarPro.GetNextVisibleIndex( ActiveIndex: Integer ): Integer;
Var
  X: Integer;
  TempHeader: TmxHeader;
Begin
  Result := -1;
  If ActiveIndex > HeaderCount - 1 Then Exit;
  For X := ActiveIndex + 1 To HeaderCount - 1 Do
  Begin
    TempHeader := HeaderByIndex( X );
    If TempHeader.Visible Then
    Begin
      Result := X;
      Break;
    End;
  End;
End;

Procedure TmxOutlookBarPro.DoClose;
Begin
  If Assigned( FCloseButton.FOnClose ) Then FCloseButton.FOnClose( Self );
End;

Function TmxOutlookBarPro.DoChangeViewStyle( Sender: TObject; OldStyle, NewStyle: TmxViewStyle ): Boolean;
Begin
  Result := True;
  If Assigned( FOnChangeViewStyle ) Then FOnChangeViewStyle( Self, OldStyle, NewStyle, Result );
End;

Procedure TmxOutlookBarPro.DoChange( OldIndex, NewIndex: Integer );
Begin
  If Assigned( FOnChange ) Then
  Begin
    FOnChange( Self, OldIndex, NewIndex );
  End;
End;

Procedure TmxOutlookBarPro.DoCanChange( NewHeader: TmxHeader; Var CanChange: Boolean );
Begin
  If Assigned( FOnCanChange ) Then FOnCanChange( Self, NewHeader, CanChange );
End;

Procedure TmxOutlookBarPro.DoDrawHeaderButtons( ACanvas: TCanvas; ARect: TRect; ActiveIndex: Integer );
Begin
  If Assigned( FOnDrawHeaderButtons ) Then FOnDrawHeaderButtons( Self, ACanvas, ARect, ActiveIndex );
End;

Procedure TmxOutlookBarPro.DoAfterDrawHeaderButtons( ACanvas: TCanvas; ARect: TRect; ActiveIndex: Integer );
Begin
  If Assigned( FOnAfterDrawHeaderButtons ) Then FOnAfterDrawHeaderButtons( Self, ACanvas, ARect, ActiveIndex );
End;

Procedure TmxOutlookBarPro.DoDrawCloseButton( ACanvas: TCanvas; ARect: TRect; State: TmxButtonState );
Begin
  If Assigned( FOnDrawCloseButton ) Then FOnDrawCloseButton( Self, ACanvas, ARect, State );
End;

Procedure TmxOutlookBarPro.DoShow;
Begin
  If Assigned( FOnShow ) Then FOnShow( Self );
End;

Procedure TmxOutlookBarPro.DoHide;
Begin
  If Assigned( FOnHide ) Then FOnHide( Self );
End;

Function TmxOutlookBarPro.GetActiveHeaderIndex: Integer;
Begin
  If Assigned( FActiveHeader ) Then
    Result := FActiveHeader.HeaderIndex Else
    Result := -1;
End;

Procedure TmxOutlookBarPro.CMMouseLeave( Var Message: TMessage );
Begin
  Inherited;
  ProcessMouseLeave;
End;

Procedure TmxOutlookBarPro.ProcessMouseLeave;
Begin
  If Assigned( FMouseInHeader ) Then FMouseInHeader.SetState( hbsUp );
  If Assigned( FMouseInHeaderBody ) Then FMouseInHeaderBody.SetState( hbsUp );
  If Assigned( FMouseInButton ) Then FMouseInButton.FState := hbsUp;
  FMouseInHeader := Nil;
  FMouseInHeaderBody := Nil;
  FMouseInButton := Nil;
  CloseButton.FCloseState := hbsUp;
  If Not ( csDesigning In ComponentState ) Then Screen.Cursor := crDefault;
  DoInvalidate;
End;

Procedure TmxOutlookBarPro.CMMouseEnter( Var Message: TMessage );
Begin
  Inherited;
  If Assigned( FMouseInHeader ) Then FMouseInHeader.SetState( hbsUp );
  If Assigned( FMouseInHeaderBody ) Then FMouseInHeaderBody.SetState( hbsUp );
  If Assigned( FMouseInButton ) Then FMouseInButton.FState := hbsUp;
  FMouseInHeader := Nil;
  FMouseInHeaderBody := Nil;
  FMouseInButton := Nil;
  CloseButton.FCloseState := hbsUp;

  If Not ( csDesigning In ComponentState ) Then
  Begin
    If Not FEditor.Editing Then
    Begin
      If boFocusOnMouseEnter In FOptions Then
        If Not Focused Then SetFocus;
    End;
  End;

  DoInvalidate;
End;

Procedure TmxOutlookBarPro.MouseMove( Shift: TShiftState; X, Y: Integer );
Var
  Z, I: Integer;
  TempHeader: TmxHeader;
  TempButton: TmxButton;
  CursorPos: TPoint;
  RePaintRect: TRect;
  _MouseInControl: TmxHeader;
  _MouseInButton: TmxButton;
  NeedToCheckHeaders: Boolean;
Begin
  If ( tsDragPending In FDragStates ) And ( ( Abs( FDragStartPos.X - X ) >= FDragThreshold ) Or
    ( Abs( FDragStartPos.Y - Y ) >= FDragThreshold ) ) Then
    DoDragging( FDragStartPos )
  Else
  Begin
    Inherited MouseMove( Shift, X, Y );

    If ( Not FProcessing ) And ( Not InplaceEditor.Editing ) Then
    Begin
      FProcessing := True;

      CursorPos.X := X;
      CursorPos.Y := Y;

      _MouseInControl := Nil;
      _MouseInButton := Nil;
      NeedToCheckHeaders := True;

      If ( PtInRect( FCloseButton.CloseRect, CursorPos ) ) Then
      Begin
        FCloseButton.FCloseState := hbsFocused;
        NeedToCheckHeaders := False;
{$WARNINGS OFF}
        InvalidateRect( Handle, @FCloseButton.CloseRect, False );
{$WARNINGS ON}
      End
      Else
      Begin
        If FCloseButton.CloseState = hbsFocused Then
        Begin
          FCloseButton.FCloseState := hbsUp;
          NeedToCheckHeaders := False;
{$WARNINGS OFF}
          InvalidateRect( Handle, @FCloseButton.CloseRect, False );
{$WARNINGS ON}
        End;
      End;

      If ( PtInRect( FScrollUpRect, CursorPos ) ) Then
      Begin
        If FScrollUpState <> hbsDown Then
        Begin
          FScrollUpState := hbsFocused;
          NeedToCheckHeaders := False;
{$WARNINGS OFF}
          InvalidateRect( Handle, @FScrollUpRect, False );
{$WARNINGS ON}
        End;
      End
      Else
      Begin
        If FScrollUpState = hbsFocused Then
        Begin
          FScrollUpState := hbsUp;
          NeedToCheckHeaders := False;
{$WARNINGS OFF}
          InvalidateRect( Handle, @FScrollUpRect, False );
{$WARNINGS ON}
        End;
      End;

      If ( PtInRect( FScrollDownRect, CursorPos ) ) Then
      Begin
        If FScrollDownState <> hbsDown Then
        Begin
          FScrollDownState := hbsFocused;
          NeedToCheckHeaders := False;
{$WARNINGS OFF}
          InvalidateRect( Handle, @FScrollDownRect, False );
{$WARNINGS ON}
        End;
      End
      Else
      Begin
        If FScrollDownState = hbsFocused Then
        Begin
          FScrollDownState := hbsUp;
          NeedToCheckHeaders := False;
{$WARNINGS OFF}
          InvalidateRect( Handle, @FScrollDownRect, False );
{$WARNINGS ON}
        End;
      End;

      // *** Button Scroller ***

      If ( PtInRect( FButtonScrollUpRect, CursorPos ) ) Then
      Begin
        If FButtonScrollUpState <> hbsDown Then
        Begin
          FButtonScrollUpState := hbsFocused;
          NeedToCheckHeaders := False;
{$WARNINGS OFF}
          InvalidateRect( Handle, @FButtonScrollUpRect, False );
{$WARNINGS ON}
        End;
      End
      Else
      Begin
        If FButtonScrollUpState = hbsFocused Then
        Begin
          FButtonScrollUpState := hbsUp;
          NeedToCheckHeaders := False;
{$WARNINGS OFF}
          InvalidateRect( Handle, @FButtonScrollUpRect, False );
{$WARNINGS ON}
        End;
      End;

      If ( PtInRect( FButtonScrollDownRect, CursorPos ) ) Then
      Begin
        If FButtonScrollDownState <> hbsDown Then
        Begin
          FButtonScrollDownState := hbsFocused;
          NeedToCheckHeaders := False;
{$WARNINGS OFF}
          InvalidateRect( Handle, @FButtonScrollDownRect, False );
{$WARNINGS ON}
        End;
      End
      Else
      Begin
        If FButtonScrollDownState = hbsFocused Then
        Begin
          FButtonScrollDownState := hbsUp;
          NeedToCheckHeaders := False;
{$WARNINGS OFF}
          InvalidateRect( Handle, @FButtonScrollDownRect, False );
{$WARNINGS ON}
        End;
      End;

      // *** Check headers ***

      If Not ( csDesigning In ComponentState ) Then Screen.Cursor := Cursor;

      If NeedToCheckHeaders Then
        For I := 0 To HeaderCount - 1 Do
        Begin
          TempHeader := Headers[ I ];

          If ( PtInRect( TempHeader.ButtonRect, CursorPos ) ) Then
            _MouseInControl := TempHeader;

          If ( PtInRect( TempHeader.BodyRect, CursorPos ) ) Then
          Begin
            FMouseInHeaderBody := TempHeader;

            For Z := 0 To FMouseInHeaderBody.ButtonCount - 1 Do
            Begin
              TempButton := FMouseInHeaderBody.Buttons[ Z ];
              If ( PtInRect( TempButton.ButtonRect, CursorPos ) ) Then
              Begin
                _MouseInButton := TempButton;
                If Not ( csDesigning In ComponentState ) Then Screen.Cursor := TempButton.Cursor;
              End
              Else TempButton.FState := hbsUp;
            End;

            Break;
          End;
        End;

      If FMouseInButton <> _MouseInButton Then
      Begin
        If Assigned( FMouseInButton ) Then
        Begin
          FMouseInButton.FPaintGrayed := False;
          FMouseInButton.FState := hbsUp;
          RePaintRect := FMouseInButton.ButtonRect;
          InflateRect( RePaintRect, 1, 1 );
{$WARNINGS OFF}
          InvalidateRect( Handle, @RePaintRect, False );
{$WARNINGS ON}
        End;

        If Assigned( _MouseInButton ) Then
        Begin
          _MouseInButton.FState := hbsFocused;
          _MouseInButton.FPaintGrayed := False;
          RePaintRect := _MouseInButton.ButtonRect;
          InflateRect( RePaintRect, 1, 1 );
{$WARNINGS OFF}
          InvalidateRect( Handle, @RePaintRect, False );
{$WARNINGS ON}
        End;

        FMouseInButton := _MouseInButton;

        If FCloseButton.FCloseState <> hbsUp Then
        Begin
          FCloseButton.FCloseState := hbsUp;
          RePaintRect := FCloseButton.CloseRect;
          InflateRect( RePaintRect, 1, 1 );
{$WARNINGS OFF}
          InvalidateRect( Handle, @RePaintRect, False );
{$WARNINGS ON}
        End;
      End;

      If FMouseInHeader <> _MouseInControl Then
      Begin
        If Assigned( FMouseInHeader ) Then
        Begin
          FMouseInHeader.SetState( hbsUp );
{$WARNINGS OFF}
          InvalidateRect( Handle, @FMouseInHeader.ButtonRect, False );
{$WARNINGS ON}
        End;
        If Assigned( _MouseInControl ) Then
        Begin
          _MouseInControl.SetState( hbsFocused );
{$WARNINGS OFF}
          InvalidateRect( Handle, @_MouseInControl.ButtonRect, False );
{$WARNINGS ON}
        End;

        FMouseInHeader := _MouseInControl;

        If FCloseButton.FCloseState <> hbsUp Then
        Begin
          FCloseButton.FCloseState := hbsUp;
{$WARNINGS OFF}
          InvalidateRect( Handle, @FCloseButton.CloseRect, False );
{$WARNINGS ON}
        End;
      End;

      FProcessing := False;
    End;
  End;
End;

Procedure TmxOutlookBarPro.MouseDown( Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
Var
  RePaintRect: TRect;
  Rect: TRect;
Begin
  Inherited MouseDown( Button, Shift, X, Y );
  If InplaceEditor.Editing Then Exit;

  Rect := Bounds( 0, 0, Width, Height );

  If Button = mbLeft Then
  Begin
    If PtInRect( FCloseButton.CloseRect, Point( X, Y ) ) Then
    Begin
      FCloseButton.FCloseState := hbsDown;
{$WARNINGS OFF}
      InvalidateRect( Handle, @FCloseButton.CloseRect, False );
{$WARNINGS ON}
    End
    Else If PtInRect( FScrollUpRect, Point( X, Y ) ) Then
    Begin
      FScrollUpState := hbsDown;
      SetTimer( Handle, ScrollTimer, FAutoScrollDelay, Nil );
{$WARNINGS OFF}
      InvalidateRect( Handle, @FScrollUpRect, False );
{$WARNINGS ON}
    End
    Else If PtInRect( FScrollDownRect, Point( X, Y ) ) Then
    Begin
      FScrollDownState := hbsDown;
      SetTimer( Handle, ScrollTimer, FAutoScrollDelay, Nil );
{$WARNINGS OFF}
      InvalidateRect( Handle, @FScrollDownRect, False );
{$WARNINGS ON}
    End
    Else If PtInRect( FButtonScrollUpRect, Point( X, Y ) ) Then
    Begin
      FButtonScrollUpState := hbsDown;
{$WARNINGS OFF}
      InvalidateRect( Handle, @FButtonScrollUpRect, False );
{$WARNINGS ON}
    End
    Else If PtInRect( FButtonScrollDownRect, Point( X, Y ) ) Then
    Begin
      FButtonScrollDownState := hbsDown;
{$WARNINGS OFF}
      InvalidateRect( Handle, @FButtonScrollDownRect, False );
{$WARNINGS ON}
    End
    Else If Assigned( FMouseInHeader ) Then
    Begin
      If PtInRect( FMouseInHeader.ButtonRect, Point( X, Y ) ) Then
      Begin
        FMouseInHeader.SetState( hbsDown );
{$WARNINGS OFF}
        InvalidateRect( Handle, @FMouseInHeader.ButtonRect, False );
{$WARNINGS ON}
      End
    End
    Else If Assigned( FMouseInButton ) Then
    Begin
      If PtInRect( FMouseInButton.ButtonRect, Point( X, Y ) ) Then
      Begin
        If FMouseInButton.Enabled Then
        Begin
          FMouseInButton.FState := hbsDown;
          FMouseInButton.FPaintGrayed := True;
          RePaintRect := FMouseInButton.ButtonRect;
          InflateRect( RePaintRect, 1, 1 );
{$WARNINGS OFF}
          InvalidateRect( Handle, @RePaintRect, False );
{$WARNINGS ON}
        End;
      End
    End;
  End;
End;

Procedure TmxOutlookBarPro.MouseUp( Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
Var
  RePaintRect: TRect;
Begin
  Inherited MouseUp( Button, Shift, X, Y );

  StopTimer( ScrollTimer );
  If InplaceEditor.Editing Then Exit;

  If Button = mbLeft Then
  Begin
    If FCloseButton.CloseState = hbsDown Then
      SetTimer( Handle, CloseTimer, 200, Nil )
    Else If FScrollUpState = hbsDown Then
    Begin
      DoScrollUp;
      FScrollUpState := hbsUp;
    End
    Else If FScrollDownState = hbsDown Then
    Begin
      DoScrollDown;
      FScrollDownState := hbsUp;
    End
    Else If FButtonScrollUpState = hbsDown Then
    Begin
      If Assigned( FActiveHeader ) Then
      Begin
        FActiveHeader.DoButtonScrollUp;
{$WARNINGS OFF}
        InvalidateRect( Handle, @FActiveHeader.FBodyRect, False );
        InvalidateRect( Handle, @FButtonScrollUpRect, False );
        InvalidateRect( Handle, @FButtonScrollDownRect, False );
{$WARNINGS ON}
      End;
      FButtonScrollUpState := hbsUp;
    End
    Else If FButtonScrollDownState = hbsDown Then
    Begin
      If Assigned( FActiveHeader ) Then
      Begin
        FActiveHeader.DoButtonScrollDown;
{$WARNINGS OFF}
        InvalidateRect( Handle, @FActiveHeader.FBodyRect, False );
        InvalidateRect( Handle, @FButtonScrollUpRect, False );
        InvalidateRect( Handle, @FButtonScrollDownRect, False );
{$WARNINGS ON}
      End;
      FButtonScrollDownState := hbsUp;
    End
    Else If Assigned( FMouseInHeader ) Then
    Begin
      If FMouseInHeader.FState = hbsDown Then SetActiveHeader( FMouseInHeader );
      Exit;
    End
    Else If Assigned( FMouseInButton ) Then
    Begin
      If FMouseInButton.FState = hbsDown Then
      Begin
        FMouseInButton.FPaintGrayed := False;

        If FMouseInButton.ButtonKind = bkRadioButton Then
        Begin
          FMouseInButton.GetHeader.SetRadioButton( FMouseInButton );
        End
        Else
        Begin
          If FMouseInButton.FAllowGrayed Then
          Begin
            If FMouseInButton.CheckState In [ cbUnChecked, cbChecked ] Then
              FMouseInButton.SetCheckState( cbGrayed ) Else
              If FMouseInButton.CheckState = cbUnChecked Then
                FMouseInButton.SetCheckState( cbUnChecked ) Else
                FMouseInButton.SetCheckState( cbChecked );
          End
          Else
          Begin
            If FMouseInButton.CheckState = cbChecked Then
              FMouseInButton.SetCheckState( cbUnChecked ) Else
              FMouseInButton.SetCheckState( cbChecked );
          End;
        End;

        FMouseInButton.FState := hbsUp;
        TmxButtons( FMouseInButton.Collection ).Header.SelectedIndex := FMouseInButton.ButtonIndex;
        RePaintRect := FMouseInButton.ButtonRect;
        InflateRect( RePaintRect, 1, 1 );
{$WARNINGS OFF}
        InvalidateRect( Handle, @RePaintRect, False );
{$WARNINGS ON}
        FMouseInButton.DoClick;
      End;
    End;
  End;
End;

Procedure TmxOutlookBarPro.CMDesignHitTest( Var Msg: TCMDesignHitTest );
Begin
  If ( Msg.Keys = 1 ) Then
  Begin
    If Assigned( FMouseInHeader ) Then
    Begin
      If PtInRect( FMouseInHeader.ButtonRect, Point( Msg.XPos, Msg.YPos ) ) Then
        If Assigned( FMouseInHeader ) Then SetActiveHeader( FMouseInHeader );
    End
    Else
      If PtInRect( FScrollUpRect, Point( Msg.XPos, Msg.YPos ) ) Then DoScrollUp Else
        If PtInRect( FScrollDownRect, Point( Msg.XPos, Msg.YPos ) ) Then DoScrollDown Else
        Begin
          If Assigned( FActiveHeader ) Then
          Begin
            If PtInRect( FButtonScrollUpRect, Point( Msg.XPos, Msg.YPos ) ) Then FActiveHeader.DoButtonScrollUp Else
              If PtInRect( FButtonScrollDownRect, Point( Msg.XPos, Msg.YPos ) ) Then FActiveHeader.DoButtonScrollDown;
          End;
        End;
  End
  Else MouseMove( [ ], Msg.XPos, Msg.YPos );
End;

Function TmxOutlookBarPro.GetPrevHeader( AHeader: TmxHeader ): TmxHeader;
Var
  I: Integer;
Begin
  Result := AHeader;
  If AHeader = Nil Then Exit;
  If AHeader.HeaderIndex = 0 Then Exit;

  For I := 0 To HeaderCount - 1 Do
  Begin
    If HeaderByIndex( I ).HeaderIndex = AHeader.HeaderIndex - 1 Then
    Begin
      If HeaderByIndex( I ).Visible Then
        Result := HeaderByIndex( I ) Else
        Result := GetPrevHeader( HeaderByIndex( I ) );
    End;
  End;
End;

Function TmxOutlookBarPro.GetNextHeader( AHeader: TmxHeader ): TmxHeader;
Var
  I: Integer;
Begin
  Result := AHeader;
  If AHeader = Nil Then Exit;
  If AHeader.HeaderIndex = GetHeaderCount Then Exit;

  For I := 0 To HeaderCount - 1 Do
  Begin
    If HeaderByIndex( I ).HeaderIndex = AHeader.HeaderIndex + 1 Then
    Begin
      If HeaderByIndex( I ).Visible Then
        Result := HeaderByIndex( I ) Else
        Result := GetNextHeader( HeaderByIndex( I ) );
    End;
  End;
End;

Procedure TmxOutlookBarPro.KeyDown( Var Key: Word; Shift: TShiftState );
Begin
  Inherited KeyDown( Key, Shift );

  If ( Key In [ VK_HOME, VK_END, VK_PRIOR, VK_NEXT ] ) Then
  Begin
    Case Key Of
      VK_HOME: SetActiveHeader( HeaderByIndex( 0 ) );
      VK_PRIOR: SetActiveHeader( GetPrevHeader( FActiveHeader ) );
      VK_NEXT: SetActiveHeader( GetNextHeader( FActiveHeader ) );
      VK_END:
        Begin
          If Not HeaderByIndex( HeaderCount - 1 ).Visible Then
            SetActiveHeader( GetPrevHeader( HeaderByIndex( HeaderCount - 1 ) ) ) Else
            SetActiveHeader( HeaderByIndex( HeaderCount - 1 ) );
        End;
    End;
  End;
End;

Procedure TmxOutlookBarPro.WMSetFocus( Var Message: TWMSetFocus );
Begin
  Inherited;
  Windows.SetFocus( TWinControl( Self ).Handle );
  DoInvalidate;
End;

Procedure TmxOutlookBarPro.WMKillFocus( Var Message: TWMSetFocus );
Begin
  DoInvalidate;
  Inherited;
End;

Function TmxOutlookBarPro.GetOnDrawCloseHeader: TmxEventDrawHeader;
Begin
  Result := FCloseButton.CloseHeader.OnDrawHeaderButton;
End;

Procedure TmxOutlookBarPro.SetOnDrawCloseHeader( AValue: TmxEventDrawHeader );
Begin
{$WARNINGS OFF}
  If @FCloseButton.CloseHeader.OnDrawHeaderButton <> @AValue Then
    FCloseButton.CloseHeader.OnDrawHeaderButton := AValue;
{$WARNINGS ON}
End;

Function TmxOutlookBarPro.GetOnAfterDrawCloseHeader: TmxEventDrawHeader;
Begin
  Result := FCloseButton.CloseHeader.OnAfterDrawHeaderButton;
End;

Procedure TmxOutlookBarPro.SetOnAfterDrawCloseHeader( AValue: TmxEventDrawHeader );
Begin
{$WARNINGS OFF}
  If @FCloseButton.CloseHeader.OnAfterDrawHeaderButton <> @AValue Then
    FCloseButton.CloseHeader.OnAfterDrawHeaderButton := AValue;
{$WARNINGS ON}
End;

Function TmxOutlookBarPro.GetOnClose: TNotifyEvent;
Begin
  Result := FCloseButton.OnClose;
End;

Procedure TmxOutlookBarPro.SetOnClose( AValue: TNotifyEvent );
Begin
{$WARNINGS OFF}
  If @FCloseButton.OnClose <> @AValue Then FCloseButton.OnClose := AValue;
{$WARNINGS ON}
End;

Procedure TmxOutlookBarPro.SetExplorerMethod( AValue: TmxExplorerMethod );
Var
  I: Integer;
Begin
  If FExplorerMethod <> AValue Then
  Begin
    FExplorerMethod := AValue;

    For I := 0 To HeaderCount - 1 Do
      HeaderByIndex( I ).FFirstVisibleButton := 0;

    If ( Not ( csLoading In ComponentState ) ) And ( HeaderCount > 0 ) Then
    Begin
      SetActiveHeader( GetHeader( 0 ) );
    End;

    DoInvalidate;
  End;
End;

Function TmxOutlookBarPro.GetHeaders: TmxHeaders;
Begin
  Result := FHeaders;
End;

Procedure TmxOutlookBarPro.SetHeaders( AValue: TmxHeaders );
Begin
  FHeaders.Assign( AValue );
End;

Function TmxOutlookBarPro.GetHeader( Index: Integer ): TmxHeader;
Begin
  Result := Nil;
  If Index > FHeaders.Count - 1 Then Exit;
  Result := FHeaders[ Index ];
End;

Procedure TmxOutlookBarPro.SetOptions( AValue: TmxBarOptions );
Var
  ToBeSet, ToBeCleared: TmxBarOptions;
Begin
  If FOptions <> AValue Then
  Begin
    ToBeSet := AValue - FOptions;
    ToBeCleared := FOptions - AValue;
    FOptions := AValue;

    If HandleAllocated Then
    Begin
      DoInvalidate;

      If Not ( csDesigning In ComponentState ) Then
      Begin
        If ( boAcceptOLEDrop In ToBeSet ) Or ( boInternalDrop In ToBeSet ) Then
        Begin
          HandleNeeded;
          RegisterDragDrop( Handle, FDragManager );
        End
        Else
          If HandleAllocated And
            ( ( boAcceptOLEDrop In ToBeCleared ) And ( Not ( boInternalDrop In FOptions ) ) ) Or
            ( ( boInternalDrop In ToBeCleared ) And ( Not ( boAcceptOLEDrop In FOptions ) ) ) Then RevokeDragDrop( Handle );
      End;
    End;

    DoInvalidate;
  End;
End;

Procedure TmxOutlookBarPro.SetScrollChange( AValue: Word );
Begin
  If FScrollChange <> AValue Then FScrollChange := AValue;
End;

Procedure TmxOutlookBarPro.CollapseAll;
Var
  I: Integer;
Begin
  For I := 0 To HeaderCount - 1 Do
    Headers[ I ].Opened := False;

  FOffset := 0;
End;

Procedure TmxOutlookBarPro.ExpandAll;
Var
  I: Integer;
Begin
  For I := 0 To HeaderCount - 1 Do
    Headers[ I ].Opened := True;

  FOffset := 0;
End;

Procedure TmxOutlookBarPro.DoScrollUp;
Var
  Rect: TRect;
Begin
  Dec( FOffset, FScrollChange );
  If FOffset < 0 Then FOffset := 0;
  Rect := Bounds( 0, 0, Width, Height );
{$WARNINGS OFF}
  InvalidateRect( Handle, @Rect, False );
{$WARNINGS ON}
End;

Procedure TmxOutlookBarPro.DoScrollDown;
Var
  Rect: TRect;
Begin
  Inc( FOffset, FScrollChange );
  Rect := Bounds( 0, 0, Width, Height );
{$WARNINGS OFF}
  InvalidateRect( Handle, @Rect, False );
{$WARNINGS ON}
End;

Procedure TmxOutlookBarPro.SetInplaceEditor( AValue: TmxInplaceEditor );
Begin
  FEditor.Assign( AValue );
End;

Procedure TmxOutlookBarPro.RenameHeader( AHeader: TmxHeader );
Begin
  If AHeader <> Nil Then InplaceEditor.EditHeader( AHeader );
End;

Procedure TmxOutlookBarPro.RenameHeaderByIndex( AHeaderIndex: Integer );
Begin
  RenameHeader( HeaderByIndex( AHeaderIndex ) );
End;

Procedure TmxOutlookBarPro.CNNotify( Var Message: TWMNotify );
Begin
  With Message Do
    Case NMHdr^.code Of
      LVN_GETINFOTIP: Application.ActivateHint( Mouse.CursorPos );
    End;
End;

Procedure TmxOutlookBarPro.CMHintShow( Var Message: TMessage );
Var
  InfoTip: String;
  ItemRect: TRect;
Begin
  If Assigned( FMouseInButton ) Then
  Begin
{$WARNINGS OFF}
    With TCMHintShow( Message ) Do
{$WARNINGS ON}
    Begin
      InfoTip := FMouseInButton.Hint;
      If InfoTip <> '' Then
      Begin
        ItemRect := FMouseInButton.FButtonRect;
        ItemRect.TopLeft := ClientToScreen( ItemRect.TopLeft );
        ItemRect.BottomRight := ClientToScreen( ItemRect.BottomRight );
        With HintInfo^ Do
        Begin
          HintInfo.CursorRect := ItemRect;
          HintInfo.HintStr := InfoTip;
          HintPos.Y := CursorRect.Top + GetSystemMetrics( SM_CYCURSOR );
          HintPos.X := CursorRect.Left + GetSystemMetrics( SM_CXCURSOR );
          HintInfo.HintMaxWidth := ClientWidth;
          Message.Result := 0;
        End;
      End
      Else Inherited;
    End;
  End
  Else Inherited;
End;

Procedure TmxOutlookBarPro.CMDialogChar( Var Message: TCMDialogChar );
Var
  AState, I, X: Integer;
  Accept: Boolean;
  AHeader: TmxHeader;
  AButton: TmxButton;
Begin
  If Not Settings.KeySupport Then
  Begin
    Inherited;
    Exit;
  End;

  With Message Do
  Begin
    Accept := False;

    If CanFocus Then
    Begin
      For I := 0 To HeaderCount - 1 Do
      Begin
        If Accept Then Break;

        AHeader := Headers[ I ];

        If AHeader.Settings.KeySupport Then
        Begin
          If IsAccel( CharCode, AHeader.Caption ) Then
          Begin
            ActiveHeader := AHeader;
            Accept := True;
            Break;
          End
          Else
          Begin
            If AHeader = FActiveHeader Then
            Begin
              For X := 0 To AHeader.ButtonCount - 1 Do
              Begin
                AButton := AHeader.Buttons[ X ];
                If IsAccel( CharCode, AButton.Caption ) Then
                Begin
                  If AButton.Enabled Then
                  Begin
                    If AButton.ButtonKind In [ bkCheckBox, bkPushButton ] Then
                    Begin
                      AState := Ord( AButton.FCheckState );
                      Inc( AState );
                      If ( AButton.AllowGrayed And ( AState = 3 ) ) Or ( Not AButton.AllowGrayed And ( AState = 2 ) ) Then AState := 0;
                      AButton.SetCheckState( TCheckBoxState( AState ) );
                    End;

                    If AButton.ButtonKind In [ bkRadioButton ] Then
                    Begin
                      AHeader.SetRadioButton( AButton );
                    End;
                  End;

                  AButton.DoClick;
                  Accept := True;
                  Break;
                End
              End;
            End;
          End;
        End;
      End;
    End;

    If Not Accept Then Inherited;
  End;
End;

Procedure TmxOutlookBarPro.Paint;
Const
  CloseDownStyles: Array[ 0..3 ] Of Integer = ( 0, BDR_SUNKENOUTER, BDR_RAISEDINNER, 0 );
  DownStyles: Array[ Boolean ] Of Integer = ( EDGE_RAISED, EDGE_SUNKEN );
  FlatDownStyles: Array[ Boolean ] Of Integer = ( BDR_RAISEDINNER, BDR_SUNKENOUTER );
Var
  ArrowColor: TColor;
  MyRect: TRect;
  I, X, Y, Z, G, Counter: Integer;
  LBitmap: TBitmap;
  AHeader: TmxHeader;
  TempHeader: TmxHeader;
  ActiveIndex: Integer;
  TempRect: TRect;
  AlertRect: TRect;
  HeaderButtonRect: TRect;
  ActiveHeaderRect: TRect;
  Separator: Word;
  ActiveBottom: Integer;
  WorkWithBorders: Boolean;
  UseCloseUpMethod: Boolean;
  FlatStyle: Boolean;
  FirstHeader: Boolean;
  NeedToDrawScrollButton: Boolean;
  NeedHeaderAlert: Boolean;
  rgn: Hrgn;

  DragRect: TRect;
  ARect: TRect;
  AdjustedRect: TRect;
  TopColor, BottomColor: TColor;

  Procedure AdjustColors( Bevel: TPanelBevel );
  Begin
    TopColor := clBtnHighlight;
    If Bevel = bvLowered Then TopColor := clBtnShadow;
    BottomColor := clBtnShadow;
    If Bevel = bvLowered Then BottomColor := clBtnHighlight;
  End;

  Procedure SetTransparentBackground( Control: TControl; ACanvas: TCanvas );
  Var
    DC: HDC;
    DCID: Integer;
    I: Integer;
    Rect_Control: TRect;
    Rect_Parent: TRect;
    Rect: TRect;
  Begin
    If ( Control = Nil ) Or ( Control.Parent = Nil ) Then Exit;
    DC := ACanvas.Handle;
    Control.Parent.ControlState := Control.Parent.ControlState + [ csPaintCopy ];
    Rect_Control := Bounds( Control.Left, Control.Top, Control.Width, Control.Height );

    DCID := SaveDC( DC );
    SetViewportOrgEx( DC, -Control.Left - BorderWidth, -Control.Top - BorderWidth, Nil );
    IntersectClipRect( DC, 0, 0, Control.Parent.ClientWidth, Control.Parent.ClientHeight );
    With TWinControlClass( Control.Parent ) Do
    Begin
      Perform( WM_ERASEBKGND, DC, 0 );
      PaintWindow( DC );
    End;
    RestoreDC( DC, DCID );

    If Not ( csDesigning In Control.ComponentState ) Then
      For I := 0 To Control.Parent.ControlCount - 1 Do
      Begin
        If ( Control.Parent.Controls[ I ] = Control ) Then Continue;

        Rect_Parent := Bounds( Left, Top, Width, Height );

        If ( Control.Parent.Controls[ I ] <> Nil ) And ( Control.Parent.Controls[ I ] Is TGraphicControl ) Then
        Begin
          If IntersectRect( Rect, Rect_Control, Rect_Parent ) And Visible Then
          Begin
            With TGraphicControl( Control.Parent.Controls[ I ] ) Do
            Begin
              ControlState := ControlState + [ csPaintCopy ];
              DCID := SaveDC( DC );
              Try
                SetViewportOrgEx( DC, Left - Control.Left - BorderWidth, Top - Control.Top - BorderWidth, Nil );
                IntersectClipRect( DC, 0, 0, Width, Height );
                Perform( WM_PAINT, DC, 0 );
              Finally
                RestoreDC( DC, DCID );
                ControlState := ControlState - [ csPaintCopy ];
              End;
            End;
          End;
        End;
      End;
    Control.Parent.ControlState := Control.Parent.ControlState - [ csPaintCopy ];
  End;

Begin
  If FUpdating Then Exit;
  If FPainting Then Exit;
  FPainting := True;

  ControlState := ControlState + [ csCustomPaint ];

  LBitmap := TBitmap.Create;
  LBitmap.PixelFormat := pf32bit;
  Try
    ARect := GetClientRect;
    AdjustedRect := ARect;
    AdjustClientRect( AdjustedRect );

    LBitmap.Width := Width;
    LBitmap.Height := Height;

    // *** Draw Background ***
    Color := FBackground.Color;
    FBackground.DrawBackground( LBitmap, AdjustedRect );
    If FBackground.Style = btTransparent Then SetTransparentBackground( Self, LBitmap.Canvas );

    // *** Draw Close Header ***

    If FCloseButton.Visible Then
    Begin
      HeaderButtonRect := AdjustedRect;
      HeaderButtonRect.Bottom := HeaderButtonRect.Top + FCloseButton.CloseHeader.GetHeight;
      FCloseButton.FCloseRect := HeaderButtonRect;
      AdjustedRect.Top := HeaderButtonRect.Bottom;
    End;

    If ( ViewStyle = vsExplorerBar ) And ( ExplorerMethod = emCloseUp ) Then
    Begin
      If FOffset > 0 Then
      Begin
        FScrollUpRect := AdjustedRect;
        FScrollUpRect.Bottom := FScrollUpRect.Top + 14;
      End;
    End
    Else FScrollUpRect := Bounds( -1000, -1000, 0, 0 );

    // ********************
    // *** Draw Headers ***
    // ********************

    // *** Adjust Draw Rect by Border ***

    WorkWithBorders :=
      ( ( boExplorerBorder In FOptions ) And ( FViewStyle = vsOutlook ) ) Or
      ( FViewStyle = vsExplorerBar );

    If WorkWithBorders Then
    Begin
      AdjustedRect.Top := AdjustedRect.Top + Border.Top;
      AdjustedRect.Bottom := AdjustedRect.Bottom - Border.Bottom;
      AdjustedRect.Left := AdjustedRect.Left + Border.Left;
      AdjustedRect.Right := AdjustedRect.Right - Border.Right;
    End;

    // *** Select active header ***

    If FActiveHeader = Nil Then ActiveIndex := -1 Else ActiveIndex := FActiveHeader.HeaderIndex;

    If WorkWithBorders Then
      Separator := Border.Separator Else
      Separator := 0;

    If Separator < 1 Then Separator := 1;

    Counter := 0;
    ActiveBottom := -100;
    UseCloseUpMethod := False;
    FirstHeader := True;

    For I := 0 To HeaderCount - 1 Do
    Begin
      AHeader := HeaderByIndex( I );
      If AHeader = Nil Then Raise mxNavigatorException.Create( 'Invalid Header' );

      // *** We do nothing with invisible headers ***
      If Not AHeader.Visible Then
      Begin
        AHeader.FButtonRect := Bounds( -1000, -1000, 0, 0 );
        AHeader.FBodyRect := Bounds( -1000, -1000, 0, 0 );
        Continue;
      End;

      Inc( Counter );
      UseCloseUpMethod := ( ViewStyle = vsExplorerBar ) And ( ExplorerMethod = emCloseUp );

      If Not UseCloseUpMethod Then
      Begin
        If ( AHeader.HeaderIndex = GetNextVisibleIndex( ActiveIndex ) ) And ( ActiveIndex <> -1 ) Then
        Begin
          AdjustedRect.Top := AdjustedRect.Bottom;

          For X := I To HeaderCount - 1 Do
          Begin
            TempHeader := HeaderByIndex( X );
            If ( Not TempHeader.Visible ) Or ( hoNoCaption In TempHeader.Options ) Then Continue;
            AdjustedRect.Top := AdjustedRect.Top - TempHeader.GetHeight - TempHeader.GetExplorerAddon;
          End;

          AdjustedRect.Top := AdjustedRect.Top - ( ( VisibleHeaderCount - Counter ) * ( Separator - 1 ) );
          ActiveHeaderRect.Bottom := AdjustedRect.Top - Separator + 1;
        End;
      End;

      HeaderButtonRect := AdjustedRect;

      // *** Adjust header button's rect ***
      HeaderButtonRect.Bottom := HeaderButtonRect.Top + AHeader.GetHeight + AHeader.GetExplorerAddon;

      // *** Modify header with if view style is vsToolBox ***
      If ( ViewStyle = vsOutlook ) And ( ScrollView = ssToolBox ) Then
      Begin
        If FReCalcHeaderPositions Then
        Begin
          If ( ActiveIndex = AHeader.HeaderIndex ) Then
          Begin
            FButtonScrollUpRect := HeaderButtonRect;
            HeaderButtonRect.Right := HeaderButtonRect.Right - AHeader.GetHeight - 2;
            FButtonScrollUpRect.Left := HeaderButtonRect.Right;
          End;

          If ( ActiveIndex + 1 = AHeader.HeaderIndex ) Then
          Begin
            FButtonScrollDownRect := HeaderButtonRect;
            HeaderButtonRect.Right := HeaderButtonRect.Right - AHeader.GetHeight - 2;
            FButtonScrollDownRect.Left := HeaderButtonRect.Right;
          End
          Else
          Begin
            If ( ( ActiveIndex = AHeader.HeaderIndex ) And ( AHeader = GetNextHeader( AHeader ) ) ) Then
            Begin
              FButtonScrollDownRect := FButtonScrollUpRect;
              FButtonScrollDownRect.Bottom := AdjustedRect.Bottom;
              FButtonScrollDownRect.Top := FButtonScrollDownRect.Bottom - ( FButtonScrollDownRect.Right - FButtonScrollDownRect.Left ) + 2;
            End;
          End;
        End;
      End;

      If ( ( ( ViewStyle = vsOutlook ) Or ( ( ViewStyle = vsExplorerBar ) And ( ExplorerMethod = emStandard ) ) ) And ( ScrollView In [ ssNormal, ssToolBox ] ) And ( FReCalcHeaderPositions ) And ( ActiveIndex = AHeader.HeaderIndex ) ) Then
      Begin
        If Not ( ( ViewStyle = vsOutlook ) And ( ScrollView In [ ssToolBox ] ) ) Then
        Begin
          FButtonScrollUpRect := HeaderButtonRect;
          FButtonScrollUpRect.Left := FButtonScrollUpRect.Right - FScrollBoxSize - 2;
          FButtonScrollUpRect.Right := FButtonScrollUpRect.Left + FScrollBoxSize;
          FButtonScrollUpRect.Top := FButtonScrollUpRect.Bottom + 2;
          FButtonScrollUpRect.Bottom := FButtonScrollUpRect.Top + FScrollBoxSize;

          FButtonScrollDownRect := FButtonScrollUpRect;
        End;
      End;

      If ( ( ViewStyle = vsOutlook ) Or ( ( ViewStyle = vsExplorerBar ) And ( ExplorerMethod = emStandard ) ) ) And ( ScrollView = ssExpress ) And ( FReCalcHeaderPositions ) And ( ActiveIndex = AHeader.HeaderIndex ) Then
      Begin
        FButtonScrollUpRect := HeaderButtonRect;
        FButtonScrollUpRect.Top := HeaderButtonRect.Bottom;
        FButtonScrollUpRect.Bottom := FButtonScrollUpRect.Top + FScrollBoxSize;

        FButtonScrollDownRect := HeaderButtonRect;
      End;

      // *** Check the left and right side limits ///

      If ( HeaderButtonRect.Left > HeaderButtonRect.Right ) Then
      Begin
        HeaderButtonRect.Left := -10000;
        HeaderButtonRect.Right := -10000;
      End;

      // *** Paint header button on canvas ***

      // *** Apply Offset AValue ***
      If ( ViewStyle = vsExplorerBar ) And ( ExplorerMethod = emCloseUp ) Then
      Begin
        If FirstHeader And ( FOffset > 0 ) Then
        Begin
          Dec( HeaderButtonRect.Top, FOffset );
          Dec( HeaderButtonRect.Bottom, FOffset );
          FirstHeader := False;
        End;
      End;

      If Not FReCalcHeaderPositions Then
        HeaderButtonRect := AHeader.ButtonRect;

      If ActiveBottom < HeaderButtonRect.Top Then
      Begin
        If Assigned( FOnDrawHeaderButtons ) Then
          DoDrawHeaderButtons( LBitmap.Canvas, HeaderButtonRect, ActiveIndex ) Else
          AHeader.DrawHeaderButton( LBitmap, HeaderButtonRect, ActiveIndex );

        DoAfterDrawHeaderButtons( LBitmap.Canvas, HeaderButtonRect, ActiveIndex );
      End
      Else AHeader.FButtonRect := HeaderButtonRect;

      If ( Not FReCalcHeaderPositions ) And ( FUpdatedHeaderIndex = AHeader.HeaderIndex ) Then
      Begin
        TempRect := AHeader.FBodyRect;
        AHeader.DrawHeaderBody( LBitmap, TempRect, ActiveIndex, 0 );
      End;

      If Not UseCloseUpMethod Then
      Begin
        If AHeader.HeaderIndex = ActiveIndex Then ActiveBottom := HeaderButtonRect.Bottom;

        // *** Save the rect of active header ***
        If AHeader.HeaderIndex = ActiveIndex Then
        Begin
          ActiveHeaderRect := AdjustedRect;
          ActiveHeaderRect.Top := HeaderButtonRect.Bottom + 1;
        End;

        // *** Adjust header's AdjustedRect ***
        AdjustedRect.Top := HeaderButtonRect.Bottom;
        Inc( AdjustedRect.Top, Separator );
      End
      Else
      Begin
        ActiveBottom := HeaderButtonRect.Bottom;
        // *** Save the rect of active header ***

        ActiveHeaderRect := AdjustedRect;
        ActiveHeaderRect.Top := HeaderButtonRect.Bottom + 1;
        ActiveHeaderRect.Bottom := ActiveHeaderRect.Top + AHeader.CalculateBodyHeight( ActiveHeaderRect );

        // *** The header is longer by Distance ***
        Dec( ActiveHeaderRect.Bottom, AHeader.GetSettings.Distance );
        Dec( ActiveBottom, AHeader.GetSettings.Distance );

        // *** Adjust header's AdjustedRect ***
        AdjustedRect.Top := ActiveHeaderRect.Bottom;
        Inc( AdjustedRect.Top, Separator );

        If AHeader.Opened Then
        Begin
          AHeader.DrawHeaderBody( LBitmap, ActiveHeaderRect, ActiveIndex, FOffset );

          If Assigned( FCurrentTargetButton ) Then
          Begin
            If FCurrentTargetButton.HeaderIndex = AHeader.HeaderIndex Then
            Begin
              DragRect := FCurrentTargetButton.ButtonRect;
              DragRect.Left := ActiveHeaderRect.Left;
              DragRect.Right := ActiveHeaderRect.Right;

              DoPaintDropMark( LBitmap.Canvas, DragRect, FCurrentTargetButton.FDragDropHitStatus );
            End;
          End
          Else
            If Assigned( FCurrentTargetHeader ) Then
            Begin
              If FCurrentTargetHeader.HeaderIndex = AHeader.HeaderIndex Then
              Begin
                DragRect := ActiveHeaderRect;
                DoPaintDropMark( LBitmap.Canvas, DragRect, hpAbove );
              End;
            End;

          FScrollDown := ActiveHeaderRect.Bottom + 5 > ARect.Bottom;
        End
        Else
        Begin
          FScrollDown := HeaderButtonRect.Bottom + 5 > ARect.Bottom;
          AHeader.FBodyRect := Bounds( 0, 0, 0, 0 );
        End;
      End;
    End;

    If Not UseCloseUpMethod Then
    Begin
      // *** Draw active headers Background ***
      If Not FReCalcHeaderPositions Then ActiveHeaderRect := FActiveHeader.BodyRect;

      If FActiveHeader <> Nil Then
      Begin
        FActiveHeader.DrawHeaderBody( LBitmap, ActiveHeaderRect, ActiveIndex, FOffset );

        If Assigned( FCurrentTargetButton ) Then
        Begin
          If FCurrentTargetButton.HeaderIndex = FActiveHeader.HeaderIndex Then
          Begin
            DragRect := FCurrentTargetButton.ButtonRect;
            DragRect.Left := ActiveHeaderRect.Left;
            DragRect.Right := ActiveHeaderRect.Right;

            DoPaintDropMark( LBitmap.Canvas, DragRect, FCurrentTargetButton.FDragDropHitStatus );
          End;
        End;
      End;

      If ( ( ViewStyle = vsOutlook ) Or ( ( ViewStyle = vsExplorerBar ) And ( ExplorerMethod = emStandard ) ) ) And ( ScrollView In [ ssNormal, ssToolBox ] ) And ( FReCalcHeaderPositions ) Then
      Begin
        If Not ( ( ViewStyle = vsOutlook ) And ( ScrollView In [ ssToolBox ] ) ) Then
        Begin
          FButtonScrollDownRect.Bottom := ActiveHeaderRect.Bottom - 2;
          FButtonScrollDownRect.Top := FButtonScrollDownRect.Bottom - FScrollBoxSize;
        End;
      End;

      If ( ( ViewStyle = vsOutlook ) Or ( ( ViewStyle = vsExplorerBar ) And ( ExplorerMethod = emStandard ) ) ) And ( ScrollView = ssExpress ) And ( FReCalcHeaderPositions ) Then
      Begin
        FButtonScrollDownRect.Bottom := ActiveHeaderRect.Bottom;
        FButtonScrollDownRect.Top := FButtonScrollDownRect.Bottom - FScrollBoxSize;
      End;
    End;

    // *** Draw Close Header ***

    If FCloseButton.Visible Then
    Begin
      HeaderButtonRect := FCloseButton.FCloseRect;
      FCloseButton.CloseHeader.DrawHeaderButton( LBitmap, HeaderButtonRect, -1 );

      HeaderButtonRect.Top := HeaderButtonRect.Top + 2;
      HeaderButtonRect.Bottom := HeaderButtonRect.Bottom - 2;
      HeaderButtonRect.Right := HeaderButtonRect.Right - 2;
      HeaderButtonRect.Left := HeaderButtonRect.Right - ( HeaderButtonRect.Bottom - HeaderButtonRect.Top );

      FCloseButton.FCloseRect := HeaderButtonRect;

      If FCloseButton.CloseHeader.FTextRect.Right < FCloseButton.CloseRect.Left Then
      Begin
        If Assigned( OnDrawCloseHeader ) Then DoDrawCloseButton( LBitmap.Canvas, HeaderButtonRect, FCloseButton.CloseState ) Else
        Begin
          With LBitmap.Canvas Do
          Begin
            DrawEdge( Handle, HeaderButtonRect, CloseDownStyles[ Integer( FCloseButton.CloseState ) ], BF_RECT );

            Pen.Mode := pmCopy;
            Pen.Style := psSolid;
            Pen.Color := clBlack;
            Pen.Width := 2;
            MoveTo( HeaderButtonRect.Left + 5, HeaderButtonRect.Top + 5 );
            LineTo( HeaderButtonRect.Right - 5, HeaderButtonRect.Bottom - 5 );
            MoveTo( HeaderButtonRect.Left + 5, HeaderButtonRect.Bottom - 5 );
            LineTo( HeaderButtonRect.Right - 5, HeaderButtonRect.Top + 5 );
          End;
        End;
      End
      Else FCloseButton.FCloseRect := Bounds( -1000, -1000, 0, 0 );

      AdjustedRect.Top := FCloseButton.CloseHeader.ButtonRect.Bottom;
    End;

    // *** Draw Scroll Buttons ***

    If ( ViewStyle = vsExplorerBar ) And ( ExplorerMethod = emCloseUp ) Then
    Begin
      AdjustedRect := ARect;
      AdjustClientRect( AdjustedRect );
      FScrollDownRect := AdjustedRect;
      FScrollDownRect.Top := FScrollDownRect.Bottom - 14;

      LBitmap.Canvas.Brush.Color := clBtnFace;
      LBitmap.Canvas.Brush.Style := bsSolid;

      If Not Enabled Then FScrollUpState := hbsDisabled Else
        If FScrollUpState = hbsDisabled Then FScrollUpState := hbsUp;

      If Not Enabled Then FScrollDownState := hbsDisabled Else
        If FScrollDownState = hbsDisabled Then FScrollDownState := hbsUp;

      If ( FOffset > 0 ) Then
      Begin
        FlatStyle := ( Flat ) Or ( boAlwaysFlatScroller In FOptions );
        If ( FScrollUpState In [ hbsFocused ] ) And ( FlatStyle ) Then FlatStyle := False;

        LBitmap.Canvas.FillRect( FScrollUpRect );

        If FlatStyle Then
          DrawEdge( LBitmap.Canvas.Handle, FScrollUpRect, FlatDownStyles[ FScrollUpState In [ hbsDown ] ], BF_RECT Or BF_SOFT ) Else
          DrawEdge( LBitmap.Canvas.Handle, FScrollUpRect, DownStyles[ FScrollUpState In [ hbsDown ] ], BF_RECT Or BF_SOFT );

        With LBitmap.Canvas Do
        Begin
          Pen.Color := clBlack;
          Pen.Style := psSolid;
          Pen.Mode := pmCopy;
          Pen.Width := 1;

          Y := FScrollUpRect.Left + ( FScrollUpRect.Right - FScrollUpRect.Left ) Div 2;
          Z := FScrollUpRect.Top + ( FScrollUpRect.Bottom - FScrollUpRect.Top ) Div 2;
          If FScrollUpState In [ hbsDown ] Then Inc( Y );
          Pixels[ Y, Z - 1 ] := clBlack;
          MoveTo( Y - 1, Z );
          LineTo( Y + 2, Z );
          MoveTo( Y - 2, Z + 1 );
          LineTo( Y + 3, Z + 1 );
        End;
      End
      Else FScrollUpRect := Bounds( -1000, -1000, 0, 0 );

      If FScrollDown Then
      Begin
        LBitmap.Canvas.FillRect( FScrollDownRect );

        FlatStyle := ( Flat ) Or ( boAlwaysFlatScroller In FOptions );
        If ( FScrollDownState In [ hbsFocused ] ) And ( FlatStyle ) Then FlatStyle := False;

        If FlatStyle Then
          DrawEdge( LBitmap.Canvas.Handle, FScrollDownRect, FlatDownStyles[ FScrollDownState In [ hbsDown ] ], BF_RECT Or BF_SOFT ) Else
          DrawEdge( LBitmap.Canvas.Handle, FScrollDownRect, DownStyles[ FScrollDownState In [ hbsDown ] ], BF_RECT Or BF_SOFT );

        With LBitmap.Canvas Do
        Begin
          Pen.Color := clBlack;
          Pen.Style := psSolid;
          Pen.Mode := pmCopy;
          Pen.Width := 1;

          Y := FScrollDownRect.Left + ( FScrollDownRect.Right - FScrollDownRect.Left ) Div 2;
          Z := FScrollDownRect.Top + ( FScrollDownRect.Bottom - FScrollDownRect.Top ) Div 2;
          If FScrollDownState In [ hbsDown ] Then Inc( Y );
          Pixels[ Y, Z + 1 ] := clBlack;
          MoveTo( Y - 1, Z );
          LineTo( Y + 2, Z );
          MoveTo( Y - 2, Z - 1 );
          LineTo( Y + 3, Z - 1 );
        End;
      End
      Else
      Begin
        FScrollDownRect := Bounds( -1000, -1000, 0, 0 );
        If FScrollDownState = hbsDown Then StopTimer( ScrollTimer );
      End;
    End
    Else // ** We need to draw the button scrollers ***
    Begin
      LBitmap.Canvas.Brush.Color := clBtnFace;
      LBitmap.Canvas.Brush.Style := bsSolid;

      // *** Scroll Up Button ***

      If Not Enabled Then FButtonScrollUpState := hbsDisabled;

      If Assigned( FActiveHeader ) Then
        NeedToDrawScrollButton := FActiveHeader.IsUpButtonNeed Else
        NeedToDrawScrollButton := False;

      If Not NeedToDrawScrollButton Then
        FButtonScrollUpState := hbsDisabled Else
        If FButtonScrollUpState = hbsDisabled Then FButtonScrollUpState := hbsUp;

      If ( ( ViewStyle = vsOutlook ) And ( ScrollView = ssToolBox ) ) Or ( NeedToDrawScrollButton ) Then
      Begin
        FlatStyle := Flat;
        If ( FButtonScrollUpState In [ hbsFocused ] ) And ( boActivateToolBoxScroller In FOptions ) And ( FlatStyle ) Then FlatStyle := False;

        LBitmap.Canvas.FillRect( FButtonScrollUpRect );

        If FlatStyle Then
          DrawEdge( LBitmap.Canvas.Handle, FButtonScrollUpRect, FlatDownStyles[ FButtonScrollUpState In [ hbsDown ] ], BF_RECT Or BF_SOFT ) Else
          DrawEdge( LBitmap.Canvas.Handle, FButtonScrollUpRect, DownStyles[ FButtonScrollUpState In [ hbsDown ] ], BF_RECT Or BF_SOFT );

        With LBitmap.Canvas Do
        Begin
          If FButtonScrollUpState = hbsDisabled Then
            ArrowColor := clBtnHighlight Else
            ArrowColor := clBlack;

          Pen.Color := ArrowColor;
          Pen.Style := psSolid;
          Pen.Mode := pmCopy;
          Pen.Width := 1;

          Y := FButtonScrollUpRect.Left + ( FButtonScrollUpRect.Right - FButtonScrollUpRect.Left ) Div 2;
          Z := FButtonScrollUpRect.Top + ( FButtonScrollUpRect.Bottom - FButtonScrollUpRect.Top ) Div 2;
          If FButtonScrollUpState In [ hbsDown ] Then Inc( Y );

          If FButtonScrollUpState = hbsDisabled Then Inc( Y );

          Pixels[ Y, Z - 1 ] := ArrowColor;
          MoveTo( Y - 1, Z );
          LineTo( Y + 2, Z );
          MoveTo( Y - 2, Z + 1 );
          LineTo( Y + 3, Z + 1 );

          If FButtonScrollUpState = hbsDisabled Then
          Begin
            ArrowColor := clBtnShadow;
            Pen.Color := ArrowColor;

            Dec( Y );
            Pixels[ Y, Z - 1 ] := ArrowColor;
            MoveTo( Y - 1, Z );
            LineTo( Y + 2, Z );
            MoveTo( Y - 2, Z + 1 );
            LineTo( Y + 3, Z + 1 );
          End;
        End;
      End
      Else FButtonScrollUpRect := Bounds( 0, 0, 0, 0 );

      // *** Scroll Down Button ***

      If Not Enabled Then FButtonScrollDownState := hbsDisabled;

      If Assigned( FActiveHeader ) Then
        NeedToDrawScrollButton := FActiveHeader.IsDownButtonNeed Else
        NeedToDrawScrollButton := False;

      If Not NeedToDrawScrollButton Then
        FButtonScrollDownState := hbsDisabled Else
        If FButtonScrollDownState = hbsDisabled Then FButtonScrollDownState := hbsUp;

      If ( ( ( ViewStyle = vsOutlook ) And ( ScrollView = ssToolBox ) ) Or ( NeedToDrawScrollButton ) ) And ( FButtonScrollDownRect.Top > FButtonScrollUpRect.Bottom - 1 ) Then
      Begin
        FlatStyle := Flat;
        If ( FButtonScrollDownState In [ hbsFocused ] ) And ( boActivateToolBoxScroller In FOptions ) And ( FlatStyle ) Then FlatStyle := False;

        LBitmap.Canvas.FillRect( FButtonScrollDownRect );

        If FlatStyle Then
          DrawEdge( LBitmap.Canvas.Handle, FButtonScrollDownRect, FlatDownStyles[ FButtonScrollDownState In [ hbsDown ] ], BF_RECT Or BF_SOFT ) Else
          DrawEdge( LBitmap.Canvas.Handle, FButtonScrollDownRect, DownStyles[ FButtonScrollDownState In [ hbsDown ] ], BF_RECT Or BF_SOFT );

        With LBitmap.Canvas Do
        Begin
          If FButtonScrollDownState = hbsDisabled Then
            ArrowColor := clBtnHighlight Else
            ArrowColor := clBlack;

          Pen.Color := ArrowColor;
          Pen.Style := psSolid;
          Pen.Mode := pmCopy;
          Pen.Width := 1;

          Y := FButtonScrollDownRect.Left + ( FButtonScrollDownRect.Right - FButtonScrollDownRect.Left ) Div 2;
          Z := FButtonScrollDownRect.Top + ( FButtonScrollDownRect.Bottom - FButtonScrollDownRect.Top ) Div 2;

          If FButtonScrollDownState In [ hbsDown ] Then Inc( Y );
          If FButtonScrollDownState = hbsDisabled Then Inc( Y );

          Pixels[ Y, Z + 1 ] := ArrowColor;
          MoveTo( Y - 1, Z );
          LineTo( Y + 2, Z );
          MoveTo( Y - 2, Z - 1 );
          LineTo( Y + 3, Z - 1 );

          If FButtonScrollDownState = hbsDisabled Then
          Begin
            ArrowColor := clBtnShadow;
            Pen.Color := ArrowColor;

            Dec( Y );
            Pixels[ Y, Z + 1 ] := ArrowColor;
            MoveTo( Y - 1, Z );
            LineTo( Y + 2, Z );
            MoveTo( Y - 2, Z - 1 );
            LineTo( Y + 3, Z - 1 );
          End;
        End;
      End
      Else FButtonScrollDownRect := Bounds( 0, 0, 0, 0 );
    End;

    // *** Draw alerted header ***

    If Assigned( FAlertedButton ) Then
      For I := 0 To HeaderCount - 1 Do
      Begin
        If ( HeaderByIndex( I ).HasAlertedButton ) And ( HeaderByIndex( I ).Visible ) Then
        Begin
          If ( FAlertedButton.FFlashing ) And ( FAlertedButton.FState = hbsUp ) Then
          Begin
            NeedHeaderAlert := True;

            If ( ViewStyle = vsOutlook ) Or ( ( ( ViewStyle = vsExplorerBar ) And ( ExplorerMethod = emStandard ) ) ) Then
            Begin
              If GetActiveHeaderIndex <> -1 Then
              Begin
                If GetActiveHeaderIndex = I Then NeedHeaderAlert := False;
              End;
            End
            Else
            Begin
              NeedHeaderAlert := Not HeaderByIndex( I ).Opened;
            End;

            AlertRect := HeaderByIndex( I ).ButtonRect;
            If ViewStyle = vsExplorerBar Then AlertRect.Top := AlertRect.Top + HeaderByIndex( I ).GetExplorerAddon;

            If NeedHeaderAlert Then
            Begin
              AlphaBlendArea( LBitmap, AlertRect, 50, FAlertColor );
            End;
          End;
        End;
      End;

    // *** Draw borders ***
    LBitmap.Canvas.Pen.Style := psSolid;
    LBitmap.Canvas.Pen.Mode := pmCopy;
    LBitmap.Canvas.Pen.Color := clWindowFrame;
    LBitmap.Canvas.Pen.Width := 1;

    LBitmap.Canvas.Brush.Color := clBtnFace;
    LBitmap.Canvas.Brush.Style := bsClear;

    If BevelOuter <> bvNone Then
    Begin
      AdjustColors( BevelOuter );
      Frame3D( LBitmap.Canvas, ARect, TopColor, BottomColor, BevelWidth );
    End;

    If BevelInner <> bvNone Then
    Begin
      AdjustColors( BevelInner );
      Frame3D( LBitmap.Canvas, ARect, TopColor, BottomColor, BevelWidth );
    End;

    // *** Draw Focus Rect ***

    If ( Focused ) And ( hoShowFocusRect In FOptions ) Then
    Begin
      InflateRect( ARect, -1, -1 );
      Canvas.Brush.Style := bsClear;
      Canvas.Pen.Style := psDot;
      LBitmap.Canvas.Pen.Color := clWindowFrame;
      LBitmap.Canvas.Brush.Color := clBtnFace;
      DrawFocusRect( LBitmap.Canvas.Handle, ARect );
    End;

    // *** Copy image to component's canvas ***
    Canvas.Draw( 0, 0, LBitmap );

  Finally
    LBitmap.Free;
  End;

  ControlState := ControlState - [ csCustomPaint ];
  FPainting := False;
End;

Procedure TmxOutlookBarPro.LoadFromFile( Const FileName: String );
Var
  Stream: TStream;
Begin
  Stream := TFileStream.Create( FileName, fmOpenRead Or fmShareDenyWrite );
  Try
    LoadFromStream( Stream );
  Finally
    Stream.Free;
  End;
End;

Procedure TmxOutlookBarPro.SaveToFile( Const FileName: String );
Var
  Stream: TStream;
Begin
  Stream := TFileStream.Create( FileName, fmCreate );
  Try
    SaveToStream( Stream );
  Finally
    Stream.Free;
  End;
End;

Procedure TmxOutlookBarPro.SaveToStream( Stream: TStream );
Var
  NameBackup: String;
Begin
  NameBackup := Name;
  Name := 'MXCOMPONENTSAVEDATA';
  Stream.WriteComponent( Self );
  Name := NameBackup;
End;

Procedure TmxOutlookBarPro.LoadFromStream( Stream: TStream );
Var
  NameBackup: String;
Begin
  BeginUpdate;
  Try
    NameBackup := Name;
    Stream.ReadComponent( Self );
    Name := NameBackup;
  Finally
    EndUpdate;
  End;
End;

Procedure TmxOutlookBarPro.ConfigureNormalBackground( BackColor: TColor; FirstTop: Integer; Header: TmxHeader );
Begin
  With Header Do
  Begin
    Background.Color := BackColor;
    Background.Style := btSolid;
    Background.Grayscale := False;

    FirstButtonTop := FirstTop;
    Margin := 4;
    Options := [ hoButtonDown ];
    Spacing := 2;
    Transparent := False;

    Glyph.Visible := False;
  End;
End;

Procedure TmxOutlookBarPro.ConfigureOfficeBackground( Header: TmxHeader );
Begin
  With Header Do
  Begin
    Background.Color := clSilver;
    Background.Style := btSolid;
    Background.Grayscale := False;

    FirstButtonTop := 10;
    Margin := 4;
    Options := [ hoActivateOnSelect, hoButtonDown ];
    Spacing := 2;
    Transparent := False;

    Glyph.Visible := False;
  End;
End;

Procedure TmxOutlookBarPro.ConfigureExplorerBackground( BackColor: TColor; FirstTop: Integer; DrawBorder: Boolean; Header: TmxHeader );
Begin
  With Header Do
  Begin
    Background.Color := BackColor;
    Background.Style := btSolid;
    Background.Grayscale := False;

    Background.Style := btTransparent;
    FirstButtonTop := FirstTop;
    Margin := 4;

    If DrawBorder Then
      Options := [ hoButtonDown, hoDrawBorder, hoDrawCaptionBorder, hoShowStatusButton, hoRoundedHeader ] Else
      Options := [ hoButtonDown, hoDrawBorder, hoShowStatusButton, hoRoundedHeader ];

    Spacing := 2;
    Transparent := False;

    Glyph.Visible := True;
  End;
End;

Procedure TmxOutlookBarPro.SetPresetHeader( AHeader: TmxHeader );
Begin
  If Not Assigned( AHeader ) Then Exit;

  Case FPreSet Of
    psOutlook: ConfigureNormalBackground( clGray, 10, AHeader );
    psFlatOutlook: ConfigureNormalBackground( clGray, 10, AHeader );
    psOutlookExpress: ConfigureNormalBackground( clGray, 10, AHeader );
    psOffice: ConfigureOfficeBackground( AHeader );
    psOfficeXP: ConfigureOfficeBackground( AHeader );
    psOffice2000: ConfigureOfficeBackground( AHeader );
    psToolBox: ConfigureNormalBackground( clSilver, 2, AHeader );
    psFlatToolBox: ConfigureNormalBackground( clSilver, 2, AHeader );
    psExplorerBar:
      Begin
        ConfigureExplorerBackground( $00AB8A76, 10, True, AHeader );

        With AHeader Do
        Begin
          Background.AlphaBlend := 70;
          Background.Style := btTransparent;
          Background.Color := clWhite;
        End;
      End;
    psExplorerBarXP:
      Begin
        ConfigureExplorerBackground( clWhite, 10, False, AHeader );

        With AHeader Do
        Begin
          Background.AlphaBlend := 50;
          Background.Style := btTransparent;
          Background.Color := clWhite;
        End;
      End;
    psExplorerBar2000:
      Begin
        ConfigureExplorerBackground( clNavy, 10, False, AHeader );

        With AHeader Do
        Begin
          Background.AlphaBlend := 150;
          Background.Style := btTransparent;
          Background.Color := clWhite;
        End;
      End;
  End;
End;

Procedure TmxOutlookBarPro.SetPreSet( AValue: TmxPreSet );
Var
  X: Integer;

  Procedure SetDefaultFont( AFont: TFont );
  Begin
    If Assigned( AFont ) Then
    Begin
      With AFont Do
      Begin
        Name := 'MS Sans Serif';
        Color := clWindowText;
        Size := 8;
        Style := [ ];
      End;
    End;
  End;

  Procedure SetExplorerFont( AFont: TFont );
  Begin
    If Assigned( AFont ) Then
    Begin
      With AFont Do
      Begin
        Name := 'MS Sans Serif';
        Color := clWhite;
        Size := 8;
        Style := [ ];
      End;
    End;
  End;

  Procedure SetNormal( BackColor, ButtonColor: TColor; FirstTop: Integer );
  Var
    I: Integer;
  Begin
    Background.Color := BackColor;
    Background.Style := btSolid;
    Background.Grayscale := False;
    BevelInner := bvLowered;
    BevelOuter := bvLowered;
    BevelWidth := 1;
    BorderStyle := bsNone;
    BorderWidth := 0;
    CommonStyle := True;
    Flat := False;
    ScrollBoxSize := 15;
    ScrollView := ssNormal;
    ViewStyle := vsOutlook;

    Options := Options - [ boActivateToolBoxScroller ];

    With Settings Do
    Begin
      Alignment := taCenter;
      ButtonStyle := bsLarge;
      ButtonView := bvNormal;
      CaptionStyle := csButtonStyle;
      Color := clBtnFace;
      Distance := 0;
      GlyphTop := 10;
      Height := 22;
      LargeWidth := 60;
      LargeHeight := 60;
      SmallHeight := 30;
      PicLabDistance := 1;

      SetDefaultFont( Font );
      SetDefaultFont( HighlightFont );
      SetDefaultFont( ButtonFont );
      ButtonFont.Color := ButtonColor;
      SetDefaultFont( ButtonHighlightFont );
      ButtonHighlightFont.Color := ButtonColor;
    End;

    For I := 0 To HeaderCount - 1 Do
    Begin
      ConfigureNormalBackground( BackColor, FirstTop, Headers[ I ] );
    End;
  End;

  Procedure SetOffice;
  Var
    I: Integer;
  Begin
    Background.Color := clSilver;
    Background.Style := btSolid;
    Background.Grayscale := False;
    BevelInner := bvNone;
    BevelOuter := bvLowered;
    BevelWidth := 1;
    BorderStyle := bsNone;
    BorderWidth := 0;
    CommonStyle := True;
    Flat := True;
    ScrollBoxSize := 15;
    ScrollView := ssNormal;
    ViewStyle := vsOutlook;

    Options := Options - [ boActivateToolBoxScroller ];

    With Settings Do
    Begin
      Alignment := taCenter;
      ButtonStyle := bsLarge;
      ButtonView := bvNormal;
      CaptionStyle := csButtonStyle;
      Color := clBtnFace;
      Distance := 0;
      GlyphTop := 10;
      Height := 22;
      LargeWidth := 60;
      LargeHeight := 60;
      SmallHeight := 30;
      PicLabDistance := 1;

      SetDefaultFont( Font );
      SetDefaultFont( HighlightFont );
      SetDefaultFont( ButtonFont );
      SetDefaultFont( ButtonHighlightFont );
    End;

    For I := 0 To HeaderCount - 1 Do
    Begin
      ConfigureOfficeBackground( Headers[ I ] );
    End;
  End;

  Procedure SetExplorer( BackColor, HeaderColor: TColor; FirstTop: Integer; DrawBorder, XPStyle: Boolean );
  Var
    I: Integer;
  Begin
    Background.Color := BackColor;
    Background.Style := btSolid;
    Background.Grayscale := False;
    BevelWidth := 1;
    BevelInner := bvNone;
    BevelOuter := bvLowered;
    Flat := True;
    BorderStyle := bsNone;
    BorderWidth := 0;
    CommonStyle := True;
    ViewStyle := vsExplorerBar;

    Options := Options - [ boExplorerBorder ];

    With Border Do
    Begin
      Left := 5;
      Top := 5;
      Right := 5;
      Bottom := 5;
      Separator := 5;
    End;

    With Settings Do
    Begin
      Alignment := taLeftJustify;
      ButtonStyle := bsLarge;
      ButtonView := bvExplorer;
      CaptionStyle := csCustomDraw;
      Color := clBtnFace;
      Distance := 0;
      GlyphTop := 10;
      Height := 25;
      LargeWidth := 60;
      LargeHeight := 60;
      SmallHeight := 30;
      PicLabDistance := 3;
      ExplorerAddOn := 15;

      With ButtonUp Do
      Begin
        Color := clbtnFace;
        Grayscale := False;
        Style := btSolid;
      End;

      With HeaderPen Do
      Begin
        Color := HeaderColor;
        Mode := pmCopy;
        Style := psSolid;
        Width := 1;
      End;

      With CaptionPen Do
      Begin
        Color := clBtnFace;
        Mode := pmCopy;
        Style := psSolid;
        Width := 1;
      End;

      With StatusButton Do
      Begin
        ArrowColor := clBlack;
        Transparent := True;
        BorderColor := clbtnFace;
      End;

      SetDefaultFont( ButtonFont );
      SetDefaultFont( ButtonHighlightFont );
      SetDefaultFont( Font );
      SetDefaultFont( HighlightFont );

      If XPStyle Then
      Begin
        SetExplorerFont( Font );
        SetExplorerFont( HighlightFont );
      End;

      Font.Style := [ fsBold ];
      HighlightFont.Style := [ fsBold ];
    End;

    For I := 0 To HeaderCount - 1 Do
    Begin
      ConfigureExplorerBackground( BackColor, FirstTop, DrawBorder, Headers[ I ] );
    End;
  End;

Begin
  BeginUpdate;

  FPreSet := AValue;

  Case FPreSet Of
    psOutlook:
      Begin
        SetNormal( clGray, clWhite, 10 );
      End;
    psFlatOutlook:
      Begin
        SetNormal( clGray, clWhite, 10 );
        BevelInner := bvNone;
        Flat := True;
      End;
    psOutlookExpress:
      Begin
        SetNormal( clGray, clWhite, 10 );
        BevelInner := bvNone;
        Flat := True;
        ScrollView := ssExpress;
        Settings.ButtonView := bvToolBox;
        Options := Options + [ boActivateToolBoxScroller ];
      End;
    psOffice:
      Begin
        SetOffice;
      End;
    psOfficeXP:
      Begin
        SetOffice;
        Settings.ButtonView := bvWindowsXP;
        Settings.XPColors.SetToDefault
      End;
    psOffice2000:
      Begin
        SetOffice;
        Settings.ButtonView := bvWindows2000;
        Settings.XPColors.SetToDefault
      End;
    psToolBox:
      Begin
        SetNormal( clSilver, clGray, 2 );
        Settings.Alignment := taLeftJustify;
        Settings.ButtonStyle := bsSmall;
        Settings.ButtonView := bvToolBox;
        Settings.SmallHeight := 25;
        Settings.Height := 19;
        ScrollView := ssToolBox;
      End;
    psFlatToolBox:
      Begin
        SetNormal( clSilver, clGray, 2 );
        BevelInner := bvNone;
        Flat := True;
        Settings.Alignment := taLeftJustify;
        Settings.ButtonStyle := bsSmall;
        Settings.ButtonView := bvToolBox;
        Settings.SmallHeight := 25;
        Settings.Height := 19;
        ScrollView := ssToolBox;
      End;
    psExplorerBar:
      Begin
        SetExplorer( $00AB8A76, clBtnFace, 10, True, False );

        Settings.ButtonStyle := bsSmall;
        Settings.ButtonView := bvNormal;

        For X := 0 To HeaderCount - 1 Do
        Begin
          With Headers[ X ] Do
          Begin
            Background.AlphaBlend := 70;
            Background.Style := btTransparent;
            Background.Color := clWhite;
          End;
        End;
      End;
    psExplorerBarXP:
      Begin
        SetExplorer( clWhite, clGray, 10, False, True );

        Background.AlphaBlend := 255;
        Background.Style := btGradient;
        Background.Gradient.BeginColor := $00E99F7B;
        Background.Gradient.EndColor := $00D67764;

        With Settings Do
        Begin
          ButtonStyle := bsSmall;
          ButtonView := bvExplorer;
          PicLabDistance := 3;

          With StatusButton Do
          Begin
            ArrowColor := $00FFF9D7;
            BorderColor := $00EA9361;
            Transparent := True;
          End;

          With ButtonUp Do
          Begin
            AlphaBlend := 255;
            Grayscale := False;
            Style := btSolid;
            Color := $00CC5E2E;
            Gradient.BeginColor := $009F4406;
            Gradient.EndColor := $00CC5E2E;
            Gradient.DrawStyle := gtLeftToRight;
          End;

          With ButtonDown Do
          Begin
            AlphaBlend := 255;
            Grayscale := False;
            Style := btSolid;
            Color := $009F4406;
            Gradient.BeginColor := $009F4406;
            Gradient.EndColor := $00CC5E2E;
            Gradient.DrawStyle := gtLeftToRight;
          End;

          With ButtonFocused Do
          Begin
            AlphaBlend := 255;
            Grayscale := False;
            Style := btSolid;
            Color := $009F4406;
            Gradient.BeginColor := $009F4406;
            Gradient.EndColor := $00CC5E2E;
            Gradient.DrawStyle := gtLeftToRight;
          End;

          With ButtonDisabled Do
          Begin
            AlphaBlend := 255;
            Grayscale := False;
            Style := btSolid;
            Color := $009F4406;
            Gradient.BeginColor := $009F4406;
            Gradient.EndColor := $00CC5E2E;
            Gradient.DrawStyle := gtLeftToRight;
          End;

        End;

        For X := 0 To HeaderCount - 1 Do
        Begin
          With Headers[ X ] Do
          Begin
            Background.AlphaBlend := 50;
            Background.Style := btTransparent;
            Background.Color := clWhite;
          End;
        End;
      End;
    psExplorerBar2000:
      Begin
        SetExplorer( clNavy, clWhite, 10, False, True );

        With Settings Do
        Begin
          ButtonStyle := bsSmall;
          ButtonView := bvWindows2000;
          XPColors.BorderColor := clWhite;
          ButtonFont.Color := clWhite;
          ButtonHighlightFont.Color := clWhite;
          HeaderPen.Color := clWhite;
          HeaderPen.Width := 2;
        End;

        For X := 0 To HeaderCount - 1 Do
        Begin
          With Headers[ X ] Do
          Begin
            Background.AlphaBlend := 150;
            Background.Style := btTransparent;
            Background.Color := clWhite;
          End;
        End;
      End;
  End;

  If Assigned( FOnAfterChangeStyle ) Then FOnAfterChangeStyle( Self, FPreSet );

  EndUpdate;
End;

Procedure TmxOutlookBarPro.FinishButtonHeader( Stream: TStream; StartPos, EndPos: Integer );
Var
  Size: Integer;
Begin
  Stream.Position := StartPos + SizeOf( Integer );
  Size := EndPos - StartPos - SizeOf( TStreamDataHeader );
  Stream.Write( Size, SizeOf( Size ) );
  Stream.Position := EndPos;
End;

Procedure TmxOutlookBarPro.WriteButton( Stream: TStream; AButton: TmxButton );
Var
  LastPosition: Integer;
  ButtonData: TBaseStreamData;
Begin
  With Stream Do
  Begin
    LastPosition := Position;

    ButtonData.Header.DataType := ButtonStreamData;
    ButtonData.Body.HeaderIndex := TmxButtons( AButton.Collection ).Header.HeaderIndex;
    ButtonData.Body.ButtonIndex := AButton.ButtonIndex;

    Write( ButtonData, SizeOf( ButtonData ) );
    FinishButtonHeader( Stream, LastPosition, Position );
  End;
End;

Procedure TmxOutlookBarPro.WriteButtonToStream( Stream: TStream; AButton: TmxButton );
Var
  LastPosition: Integer;
  Header: TStreamDataHeader;
Begin
  With Stream Do
  Begin
    LastPosition := Position;
    Header.DataType := mxStreamData;
    Write( Header, SizeOf( Header ) );
    WriteButton( Stream, AButton );
    FinishButtonHeader( Stream, LastPosition, Position );
  End;
End;

Function TmxOutlookBarPro.SuggestDropEffect( Source: TObject; Shift: TShiftState; Pt: TPoint; AllowedEffects: Integer ): Integer;
Begin
  Result := AllowedEffects;

  If Assigned( Source ) And ( Source = Self ) Then
    If ( AllowedEffects And DROPEFFECT_MOVE ) <> 0 Then
    Result := DROPEFFECT_MOVE Else Else
    If ( AllowedEffects And DROPEFFECT_COPY ) <> 0 Then Result := DROPEFFECT_COPY;

  If ssCtrl In Shift Then
  Begin
    If ssShift In Shift Then
    Begin
      If ( AllowedEffects And DROPEFFECT_LINK ) <> 0 Then
        Result := DROPEFFECT_LINK;
    End
    Else
    Begin
      If ( AllowedEffects And DROPEFFECT_COPY ) <> 0 Then
        Result := DROPEFFECT_COPY;
    End;
  End
  Else
  Begin
    If ssShift In Shift Then
    Begin
      If ( AllowedEffects And DROPEFFECT_MOVE ) <> 0 Then
        Result := DROPEFFECT_MOVE;
    End;
  End;
End;

Function TmxOutlookBarPro.DoDragEnter( Const DataObject: IDataObject; KeyState: Integer; Pt: TPoint; Var Effect: Integer ): HResult;
Var
  Shift: TShiftState;
  Accept: Boolean;
Begin
  Try
    Shift := KeysToShiftState( KeyState );
    Accept := True;
    Pt := ScreenToClient( Pt );
    Effect := SuggestDropEffect( FDragManager.FDragSource, Shift, Pt, Effect );

    If Assigned( FOnDragEnter ) Then
      FOnDragEnter( Self, DataObject, FDragManager.FDragSource, Shift, dsDragEnter, Pt, FLastDropMode, Effect, Accept );

    If Assigned( FOnDragOver ) Then
      FOnDragOver( Self, FDragManager.FDragSource, Shift, dsDragEnter, Pt, FLastDropMode, Effect, Accept );

    FAcceptedObject := Accept;

    If Not Accept Then Effect := DROPEFFECT_NONE;

    Result := NOERROR;
  Except
    Result := E_UNEXPECTED;
  End;
End;

Function TmxOutlookBarPro.DoDragOver( Source: TObject; KeyState: Integer; DragState: TDragState; Pt: TPoint; Var Effect: Integer ): HResult;
Var
  Shift: TShiftState;
  Accept: Boolean;
  Button: TmxButton;
  Header: TmxHeader;
  NewDropMode: TmxDropMode;
  HitInfo: TmxHitPosition;
Begin
  Try
    Shift := KeysToShiftState( KeyState );
    Accept := True;
    Pt := ScreenToClient( Pt );

    Button := GetHitTestInfoAt( Pt.X, Pt.Y, HitInfo );

    If Assigned( Button ) Then
      NewDropMode := dmButton Else
      NewDropMode := dmNowhere;

    If boAutoChangeHeader In FOptions Then
    Begin
      Header := GetHeaderAt( Pt.X, Pt.Y );

      If ( FCurrentTargetHeader <> Header ) And ( Header <> Nil ) Then
      Begin
        FCurrentTargetHeader := Header;
        SetTimer( Handle, ChangeTimer, FAutoChangeDelay, Nil );
      End;
    End;

    If boAutoScroll In FOptions Then DoAutoScroll( Pt.X, Pt.Y );

    If Button <> FCurrentTargetButton Then
    Begin
      If Assigned( FCurrentTargetButton ) Then DoInvalidate;
      FCurrentTargetButton := Button;
    End;

    FLastDropMode := NewDropMode;
    If Assigned( FCurrentTargetButton ) Then DoInvalidate;

    Effect := SuggestDropEffect( Source, Shift, Pt, Effect );

    If Assigned( FOnDragOver ) Then
      FOnDragOver( Self, Source, Shift, DragState, Pt, FLastDropMode, Effect, Accept );

    FAcceptedObject := Accept;

    If Not Accept Then Effect := DROPEFFECT_NONE;

    Result := NOERROR;

  Except
    Result := E_UNEXPECTED;
  End;
End;

Function TmxOutlookBarPro.InvalidateButton( Button: TmxButton ): TRect;
Begin
  If FUpdateCounter = 0 Then
  Begin
    Result := Button.ButtonRect;
{$WARNINGS OFF}
    InvalidateRect( Handle, @Result, False );
{$WARNINGS ON}
  End;
End;

Procedure TmxOutlookBarPro.DoDragLeave;
Var
  Accept: Boolean;
  Effect: Integer;
Begin
  If Assigned( FCurrentTargetButton ) Then
  Begin
    InvalidateButton( FCurrentTargetButton );
    FCurrentTargetButton := Nil;
    FCurrentTargetHeader := Nil;
  End;

  Effect := 0;
  If Assigned( FOnDragOver ) Then
    FOnDragOver( Self, Nil, [ ], dsDragLeave, Point( 0, 0 ), FLastDropMode, Effect, Accept );

  FAcceptedObject := Accept;
End;

Function TmxOutlookBarPro.DoDragDrop( Const DataObject: IDataObject; KeyState: Integer; Pt: TPoint; Var Effect: Integer ): HResult;
Var
  Shift: TShiftState;
  EnumFormat: IEnumFormatEtc;
  Fetched: Integer;
  OLEFormat: TFormatEtc;
  Handled: Boolean;
  Formats: Array Of Word;
Begin
  Formats := Nil;
  If Effect = DROPEFFECT_NONE Then Result := E_FAIL Else
  Begin
    Try
      Try
        Shift := KeysToShiftState( KeyState );
        Pt := ScreenToClient( Pt );
        Result := DataObject.EnumFormatEtc( DATADIR_GET, EnumFormat );

        If Failed( Result ) Then Abort;
        Result := EnumFormat.Reset;
        If Failed( Result ) Then Abort;

{$WARNINGS OFF}
        While EnumFormat.Next( 1, OLEFormat, @Fetched ) = S_OK Do
{$WARNINGS ON}
        Begin
          SetLength( Formats, Length( Formats ) + 1 );
          Formats[ High( Formats ) ] := OLEFormat.cfFormat;
        End;

        Effect := SuggestDropEffect( FDragManager.FDragSource, Shift, Pt, Effect );
        Handled := False;

        If ( boInternalDrop In FOptions ) Then
        Begin
          If CurrentTargetButton <> Nil Then
            Handled := ProcessDrop( DataObject, CurrentTargetButton, Effect, CurrentTargetButton.HitStatus ) Else
            Handled := ProcessDrop( DataObject, Nil, Effect, hpAbove );
        End;

        If Not Handled Then
        Begin
          If Assigned( FOnDragDrop ) Then
            FOnDragDrop( Self, FDragManager.FDragSource, DataObject, Formats, Shift, Pt, Effect, FLastDropMode ) Else
            Result := E_FAIL;
        End
        Else Result := E_FAIL;

      Finally
        If Assigned( FCurrentTargetButton ) Then
        Begin
          InvalidateButton( FCurrentTargetButton );
          FCurrentTargetButton := Nil;
          FCurrentTargetHeader := Nil;
        End;
      End;
    Except
      Result := E_UNEXPECTED;
    End;
  End;
End;

Function TmxOutlookBarPro.GetDragging: Boolean;
Begin
  Result := [ tsDragPending, tsDragging ] * FDragStates <> [ ];
End;

Procedure TmxOutlookBarPro.StopTimer( ID: Integer );
Begin
  KillTimer( Handle, ID );
End;

Function TmxOutlookBarPro.GetButtonAt( X, Y: Integer ): TmxButton;
Var
  H, B: Integer;
  CursorPos: TPoint;
  Header: TmxHeader;
  Button: TmxButton;
  VS: TmxViewStyle;
  Ok: Boolean;

  Function ModifyRect( ARect: TRect; AButton: TmxButton ): TRect;
  Begin
    Result := ARect;
    Result.Left := -1000;
    Result.Right := 20000;

    If VS = vsExplorerBar Then Exit;

    If AButton.IsFirstButton Then Result.Top := -10000;
    If AButton.IsLastButton Then Result.Bottom := 20000;
  End;

Begin
  Result := Nil;

  VS := ViewStyle;
  If VS = vsExplorerBar Then
    If ExplorerMethod = emStandard Then VS := vsOutlook;

  CursorPos.X := X;
  CursorPos.Y := Y;

  Ok := False;

  Case VS Of
    vsExplorerBar:
      Begin
        For H := 0 To HeaderCount - 1 Do
        Begin
          Header := Headers[ H ];

          If Header.Opened Then
          Begin
            For B := 0 To Header.ButtonCount - 1 Do
            Begin
              Button := Header.ButtonByIndex( B );
              If Button.Visible Then
              Begin
                If PtInRect( ModifyRect( Button.ButtonRect, Button ), CursorPos ) Then
                Begin
                  Result := Button;
                  OK := True;
                  Break;
                End;
              End;
            End;
          End;

          If OK Then Break;
        End;
      End;
    vsOutlook:
      Begin
        If Assigned( ActiveHeader ) Then
        Begin
          Header := ActiveHeader;
          For B := 0 To Header.ButtonCount - 1 Do
          Begin
            Button := Header.ButtonByIndex( B );
            If Button.Visible Then
            Begin
              If PtInRect( ModifyRect( Button.ButtonRect, Button ), CursorPos ) Then
              Begin
                Result := Button;
                Break;
              End;
            End;
          End;
        End;
      End;
  End;
End;

Function TmxOutlookBarPro.GetHeaderButtonAt( X, Y: Integer ): TmxHeader;
Var
  H: Integer;
  CursorPos: TPoint;
  Header: TmxHeader;
Begin
  Result := Nil;
  CursorPos.X := X;
  CursorPos.Y := Y;
  For H := 0 To HeaderCount - 1 Do
  Begin
    Header := Headers[ H ];
    If PtInRect( Header.ButtonRect, CursorPos ) Then
    Begin
      Result := Header;
      Break;
    End;
  End;
End;

Function TmxOutlookBarPro.GetButtonExactlyAt( X, Y: Integer ): TmxButton;
Var
  H, B: Integer;
  CursorPos: TPoint;
  Header: TmxHeader;
  Button: TmxButton;
  VS: TmxViewStyle;
  Ok: Boolean;
Begin
  Result := Nil;
  VS := ViewStyle;
  If VS = vsExplorerBar Then If ExplorerMethod = emStandard Then VS := vsOutlook;
  CursorPos.X := X;
  CursorPos.Y := Y;
  Ok := False;

  Case VS Of
    vsExplorerBar:
      Begin
        For H := 0 To HeaderCount - 1 Do
        Begin
          Header := Headers[ H ];
          If Header.Opened Then
          Begin
            For B := 0 To Header.ButtonCount - 1 Do
            Begin
              Button := Header.ButtonByIndex( B );
              If Button.Visible Then
              Begin
                If PtInRect( Button.ButtonRect, CursorPos ) Then
                Begin
                  Result := Button;
                  OK := True;
                  Break;
                End;
              End;
            End;
          End;
          If OK Then Break;
        End;
      End;
    vsOutlook:
      Begin
        If Assigned( ActiveHeader ) Then
        Begin
          Header := ActiveHeader;
          For B := 0 To Header.ButtonCount - 1 Do
          Begin
            Button := Header.ButtonByIndex( B );
            If Button.Visible Then
            Begin
              If PtInRect( Button.ButtonRect, CursorPos ) Then
              Begin
                Result := Button;
                Break;
              End;
            End;
          End;
        End;
      End;
  End;
End;

Function TmxOutlookBarPro.GetHeaderAt( X, Y: Integer ): TmxHeader;
Var
  H: Integer;
  CursorPos: TPoint;
  Header: TmxHeader;
Begin
  Result := Nil;

  CursorPos.X := X;
  CursorPos.Y := Y;

  For H := 0 To HeaderCount - 1 Do
  Begin
    Header := Headers[ H ];

    If ( PtInRect( Header.ButtonRect, CursorPos ) ) Or
      ( PtInRect( Header.BodyRect, CursorPos ) ) Then
    Begin
      Result := Header;
      Break;
    End;
  End;
End;

Function TmxOutlookBarPro.GetHitTestInfoAt( X, Y: Integer; Var HitInfo: TmxHitPosition ): TmxButton;
Var
  Limit: Integer;
Begin
  HitInfo := hpUnknown;

  Result := GetButtonAt( X, Y );

  If Result <> Nil Then
  Begin
    Limit := Result.ButtonRect.Top + ( ( Result.ButtonRect.Bottom - Result.ButtonRect.Top ) Div 2 );
    Result.FDragDropHitStatus := hpInsert;

    If Y < Limit Then
    Begin
      HitInfo := hpAbove;
      If Result.IsFirstButton Then Result.FDragDropHitStatus := hpAbove Else
        If Result.IsLastButton Then Result.FDragDropHitStatus := hpBelow;
    End
    Else
    Begin
      HitInfo := hpBelow;
      If Result.IsLastButton Then Result.FDragDropHitStatus := hpBelow;
    End;
  End;
End;

Procedure TmxOutlookBarPro.DoDragging( P: TPoint );
Var
  DragEffect, AllowedEffects: Integer;
  HotSpot: TPoint;
Begin
  FDraggedButton := FMouseInButton;
  If Assigned( FDraggedButton ) Then FDraggedButton.FState := hbsUp Else Exit;

  FCurrentTargetHeader := Nil;

  Try
    FDragStates := FDragStates + [ tsDragging ] - [ tsDragPending, tsClearPending ];
    HotSpot := P;
    P := ClientToScreen( HotSpot );
    FLastDropMode := dmButton;

    DragEffect := DROPEFFECT_NONE;
    AllowedEffects := DROPEFFECT_MOVE Or DROPEFFECT_COPY;

    Try
      FStopAlerting := True;
      ActiveX.DoDragDrop( FDragManager, FDragManager, AllowedEffects, DragEffect );
      FStopAlerting := False;
    Finally

      If DragEffect = DROPEFFECT_MOVE Then
      Begin
        BeginUpdate;
        Try
          TmxButtons( FDraggedButton.Collection ).Header.RemoveButton( FDraggedButton );
        Finally
          EndUpdate;
        End;
      End;

      Exclude( FDragStates, tsDragging );
    End;
  Finally
    FDraggedButton := Nil;
  End;
End;

Function TmxOutlookBarPro.GetItemAt( X, Y: Integer; Var HeaderIndex, ButtonIndex: Integer ): TmxHitType;
Var
  Btn: TmxButton;
  Hdr: TmxHeader;
Begin
  Result := xhtNowhere;

  HeaderIndex := -1;
  ButtonIndex := -1;
  Hdr := GetHeaderButtonAt( X, Y );

  If Hdr <> Nil Then
  Begin
    Result := xhtHeaderButton;
    HeaderIndex := Hdr.HeaderIndex
  End
  Else
  Begin
    Btn := GetButtonExactlyAt( X, Y );
    If Btn <> Nil Then
    Begin
      Result := xhtButton;
      HeaderIndex := Btn.HeaderIndex;
      ButtonIndex := Btn.ButtonIndex
    End
    Else
    Begin
      Hdr := GetHeaderAt( X, Y );
      If Hdr <> Nil Then
      Begin
        Result := xhtHeaderBackground;
        HeaderIndex := Hdr.HeaderIndex
      End
    End
  End
End;

Procedure TmxOutlookBarPro.BeginDrag( Immediate: Boolean; Threshold: Integer );
// reintroduced method to start OLE drag'n drop instead VCL drag'n drop
Begin
  If ( FDragStates * [ tsDragPending, tsDragging ] ) = [ ] Then
  Begin
    If Threshold < 0 Then
      FDragThreshold := Mouse.DragThreshold Else
      FDragThreshold := Threshold;

    If Immediate Then
      DoDragging( FDragStartPos ) Else
      Include( FDragStates, tsDragPending );
  End;
End;

Procedure TmxOutlookBarPro.CMMouseWheel( Var Message: TCMMouseWheel );
Var
  ScrollCount: Integer;
  Rect: TRect;
Begin
  Inherited;
  If ( Message.Result = 0 ) And ( Message.ShiftState = [ ] ) Then
  Begin
    With Message Do
    Begin
      Result := 1;
      ScrollCount := WheelDelta Div WHEEL_DELTA;

      If ( ViewStyle = vsExplorerBar ) And ( ExplorerMethod = emCloseUp ) Then
      Begin
        If ScrollCount > 0 Then
        Begin
          If ( FScrollUpRect.Top <> -1000 ) Then
          Begin
            Dec( FOffset, ScrollCount * Integer( FScrollChange ) );
            If FOffset < 0 Then FOffset := 0;
            Rect := Bounds( 0, 0, Width, Height );
{$WARNINGS OFF}
            InvalidateRect( Handle, @Rect, False );
{$WARNINGS ON}
          End;
        End
        Else
        Begin
          If ( FScrollDownRect.Top <> -1000 ) Then
          Begin
            Dec( FOffset, ScrollCount * Integer( FScrollChange ) );
            Rect := Bounds( 0, 0, Width, Height );
{$WARNINGS OFF}
            InvalidateRect( Handle, @Rect, False );
{$WARNINGS ON}
          End;
        End;
      End
      Else
      Begin
        If Assigned( ActiveHeader ) Then
        Begin
          If ScrollCount > 0 Then
          Begin
            If ActiveHeader.IsUpButtonNeed Then
            Begin
              ActiveHeader.DoButtonScrollUp;
              Rect := Bounds( 0, 0, Width, Height );
{$WARNINGS OFF}
              InvalidateRect( Handle, @Rect, False );
{$WARNINGS ON}
            End;
          End
          Else
          Begin
            If ActiveHeader.IsDownButtonNeed Then
            Begin
              ActiveHeader.DoButtonScrollDown;
              Rect := Bounds( 0, 0, Width, Height );
{$WARNINGS OFF}
              InvalidateRect( Handle, @Rect, False );
{$WARNINGS ON}
            End;
          End;
        End;
      End;
    End;
  End;
End;

Procedure TmxOutlookBarPro.CMDrag( Var Message: TCMDrag );
Var
  S: TObject;
  ShiftState: Integer;
  P: TPoint;
  DropEffect: Integer;
Begin
  With Message, DragRec^ Do
  Begin
    S := Source;
    If S Is TDragDockObject Then Inherited
    Else
      Case DragMessage Of
        dmDragEnter, dmDragLeave, dmDragMove:
          Begin
            ShiftState := 0;

            If GetKeyState( VK_SHIFT ) < 0 Then
              ShiftState := ShiftState Or MK_SHIFT;
            If GetKeyState( VK_CONTROL ) < 0 Then
              ShiftState := ShiftState Or MK_CONTROL;

            Result := DROPEFFECT_MOVE Or DROPEFFECT_COPY;
            DoDragOver( S, ShiftState, TDragState( DragMessage ), Pos, Result );
            FLastVCLDragTarget := FCurrentTargetButton;

            If ( DragMessage = dmDragLeave ) And Assigned( FCurrentTargetButton ) Then
            Begin
              InvalidateButton( FCurrentTargetButton );
              FCurrentTargetButton := Nil;
              FCurrentTargetHeader := Nil;
            End;
          End;

        dmDragDrop:
          Begin
            ShiftState := 0;
            If GetKeyState( VK_SHIFT ) < 0 Then
              ShiftState := ShiftState Or MK_SHIFT;
            If GetKeyState( VK_CONTROL ) < 0 Then
              ShiftState := ShiftState Or MK_CONTROL;

            If Assigned( FCurrentTargetButton ) Then
              InvalidateButton( FCurrentTargetButton );

            FCurrentTargetButton := FLastVCLDragTarget;
            P := Point( Pos.X, Pos.Y );
            P := ScreenToClient( P );
            DropEffect := DROPEFFECT_MOVE Or DROPEFFECT_COPY;

            If Assigned( FOnDragDrop ) Then
              FOnDragDrop( Self, S, Nil, [ ], KeysToShiftState( ShiftState ), P, DropEffect, FLastDropMode );

            If Assigned( FCurrentTargetButton ) Then
            Begin
              InvalidateButton( FCurrentTargetButton );
              FCurrentTargetButton := Nil;
              FCurrentTargetHeader := Nil;
            End;
          End;

        dmFindTarget:
          Begin
{$WARNINGS OFF}
            Result := Integer( ControlAtPos( ScreenToClient( Pos ), False ) );
            If Result = 0 Then Result := Integer( Self );
{$WARNINGS ON}
          End;
      End;
  End;
End;

Procedure TmxOutlookBarPro.WndProc( Var Message: TMessage );
Var
  Handled: Boolean;
Begin
  Handled := False;

  If Not ( csDesigning In ComponentState ) And ( ( Message.Msg = WM_LBUTTONDOWN ) Or ( Message.Msg = WM_LBUTTONDBLCLK ) ) Then
  Begin
    If ( DragMode = dmAutomatic ) And ( DragKind = dkDrag ) Then
    Begin
{$WARNINGS OFF}
      If IsControlMouseMsg( TWMMouse( Message ) ) Then Handled := True;
{$WARNINGS ON}
      If Not Handled Then
      Begin
        ControlState := ControlState + [ csLButtonDown ];
        Dispatch( Message ); // Overrides TControl's BeginDrag
        Handled := True;
      End;
    End;
  End;

  If Not Handled Then
  Begin
    If Not ( csDesigning In ComponentState ) Then
    Begin
      If ( Message.Msg In [ WM_NCLBUTTONDOWN, WM_NCRBUTTONDOWN, WM_NCMBUTTONDOWN ] ) And Not Focused Then
        SetFocus;
    End;
    Inherited;
  End;
End;

Function TmxOutlookBarPro.DoBeforeDrag( AButton: TmxButton ): Boolean;
Begin
  Result := True;
  If Assigned( FOnDragAllowed ) Then FOnDragAllowed( Self, AButton, Result );
End;

Procedure TmxOutlookBarPro.HandleMouseDown( Var Message: TWMMouse );
Var
  Button: TmxButton;
  ShiftState: TShiftState;
  HitInfo: TmxHitPosition;
  AutoDrag: Boolean;
  IsFocused: Boolean;
  IsHit: Boolean;
  ShiftEmpty: Boolean;
Begin
  Button := GetHitTestInfoAt( Message.XPos, Message.YPos, HitInfo );
  ShiftState := KeysToShiftState( Message.Keys ) * [ ssShift, ssCtrl ];
  AutoDrag := ( DragMode = dmAutomatic ) Or Dragging;
  If Assigned( Button ) Then AutoDrag := DoBeforeDrag( Button );
  IsFocused := Focused;
  IsHit := ( HitInfo <> hpUnknown ) And Assigned( Button );
  ShiftEmpty := ShiftState = [ ];

  If Not ( csDesigning In ComponentState ) Then
  Begin
    If Not IsFocused Then SetFocus;
  End;

  FDragStartPos := Point( Message.XPos, Message.YPos );

  If IsHit Then
  Begin
    If AutoDrag And ShiftEmpty Then BeginDrag( False );
  End;
End;

Procedure TmxOutlookBarPro.HandleMouseUp( Var Message: TWMMouse );
Begin
  FDragStates := FDragStates - [ tsDragPending, tsDragging, tsClearPending ];
End;

Procedure TmxOutlookBarPro.WMLButtonDown( Var Message: TWMLButtonDown );
Begin
  Inherited;
  HandleMouseDown( Message );
End;

Procedure TmxOutlookBarPro.WMLButtonUp( Var Message: TWMLButtonUp );
Begin
  HandleMouseUp( Message );
  Inherited;
End;

Procedure TmxOutlookBarPro.DoPaintDropMark( Canvas: TCanvas; R: TRect; DragDropHitStatus: TmxHitPosition );
Var
  SaveBrushColor: TColor;
  SavePenStyle: TPenStyle;
Begin
  If Not FAcceptedObject Then Exit;

  If FLastDropMode In [ dmButton ] Then
    With Canvas Do
    Begin
      SavePenStyle := Pen.Style;
      Pen.Style := psClear;
      SaveBrushColor := Brush.Color;
      Brush.Color := FDropMarkColor;

      Case DragDropHitStatus Of
        hpAbove:
          Polygon( [ Point( R.Left + 5, R.Top - 1 ),
            Point( R.Right - 5, R.Top - 1 ),
              Point( R.Right - 2, R.Top + 5 ),
              Point( R.Right - 2, R.Top - 2 ),
              Point( R.Left + 2, R.Top - 2 ),
              Point( R.Left + 2, R.Top + 5 )
              ] );
        hpInsert:
          Polygon( [ Point( R.Left + 5, R.Bottom + 1 ),
            Point( R.Right - 5, R.Bottom + 1 ),
              Point( R.Right - 2, R.Bottom - 4 ),
              Point( R.Right - 2, R.Bottom + 6 ),
              Point( R.Right - 5, R.Bottom + 2 ),
              Point( R.Left + 5, R.Bottom + 2 ),
              Point( R.Left + 2, R.Bottom + 6 ),
              Point( R.Left + 2, R.Bottom - 4 )
              ] );
        hpBelow:
          Polygon( [ Point( R.Left + 5, R.Bottom + 1 ),
            Point( R.Right - 5, R.Bottom + 1 ),
              Point( R.Right - 2, R.Bottom - 5 ),
              Point( R.Right - 2, R.Bottom + 2 ),
              Point( R.Left + 2, R.Bottom + 2 ),
              Point( R.Left + 2, R.Bottom - 5 )
              ] );
      End;

      Brush.Color := SaveBrushColor;
      Pen.Style := SavePenStyle;
    End;
End;

Procedure TmxOutlookBarPro.WMTimer( Var Message: TWMTimer );
Var
  VS: TmxViewStyle;
Begin
  With Message Do
  Begin
    Case TimerID Of
      AlertTimer:
        Begin
          If Assigned( FAlertedButton ) Then
          Begin
            If Not FStopAlerting Then
            Begin
              FAlertedButton.FFlashing := Not FAlertedButton.FFlashing;
              If Not Dragging Then DoInvalidate;
            End;
          End
          Else StopTimer( AlertTimer );
        End;
      CloseTimer:
        Begin
          StopTimer( CloseTimer );
          DoClose;
        End;
      ScrollTimer:
        Begin
          Application.CancelHint;

          If FScrollDownState = hbsDown Then DoScrollDown Else
            If FScrollUpState = hbsDown Then DoScrollUp Else
              StopTimer( ScrollTimer );
        End;
      ButtonTimer:
        Begin
          Application.CancelHint;
          If Assigned( FCurrentTargetHeader ) Then
          Begin
            If FButtonScrollDownState = hbsDown Then
            Begin
              FCurrentTargetHeader.DoButtonScrollDown;
              DoInValidate;
            End
            Else
              If FButtonScrollUpState = hbsDown Then
              Begin
                FCurrentTargetHeader.DoButtonScrollUp;
                DoInValidate;
              End
              Else StopTimer( ButtonTimer );
          End
          Else StopTimer( ButtonTimer );
        End;
      ChangeTimer:
        Begin
          Application.CancelHint;
          StopTimer( ChangeTimer );

          If Assigned( FCurrentTargetHeader ) Then
          Begin
            VS := ViewStyle;
            If VS = vsExplorerBar Then
              If ExplorerMethod = emStandard Then VS := vsOutlook;

            If VS = vsOutlook Then
            Begin
              If FCurrentTargetHeader <> ActiveHeader Then ActiveHeader := FCurrentTargetHeader;
            End
            Else
            Begin
              If Not FCurrentTargetHeader.Opened Then FCurrentTargetHeader.Opened := True;
            End;
          End;
        End;
    End;
  End;
End;

Procedure TmxOutlookBarPro.DoAutoScroll( X, Y: Integer );
Var
  CursorPos: TPoint;
  Changed: Boolean;
Begin
  Changed := False;
  CursorPos.X := X;
  CursorPos.Y := Y;

  If ( ( ViewStyle = vsExplorerBar ) And ( ExplorerMethod = emStandard ) ) Or ( ViewStyle = vsOutlook ) Then
  Begin
    If ( PtInRect( FButtonScrollUpRect, CursorPos ) ) Then
    Begin
      If FButtonScrollUpState <> hbsDown Then
      Begin
        FButtonScrollUpState := hbsDown;
        Changed := True;
      End;
    End
    Else
    Begin
      If FButtonScrollUpState <> hbsUp Then
      Begin
        FButtonScrollUpState := hbsUp;
      End;
    End;

    If ( PtInRect( FButtonScrollDownRect, CursorPos ) ) Then
    Begin
      If FButtonScrollDownState <> hbsDown Then
      Begin
        FButtonScrollDownState := hbsDown;
        Changed := True;
      End;
    End
    Else
    Begin
      If FButtonScrollDownState <> hbsUp Then
      Begin
        FButtonScrollDownState := hbsUp;
      End;
    End;

    If Changed Then
      SetTimer( Handle, ButtonTimer, FAutoButtonScrollDelay, Nil );
  End;

  If ( ViewStyle = vsExplorerBar ) And ( ExplorerMethod = emCloseUp ) Then
  Begin
    If ( PtInRect( FScrollUpRect, CursorPos ) ) Then
    Begin
      If FScrollUpState <> hbsDown Then
      Begin
        FScrollUpState := hbsDown;
        Changed := True;
      End;
    End
    Else
    Begin
      If FScrollUpState <> hbsUp Then
      Begin
        //StopTimer( ScrollTimer );
        FScrollUpState := hbsUp;
      End;
    End;

    If ( PtInRect( FScrollDownRect, CursorPos ) ) Then
    Begin
      If FScrollDownState <> hbsDown Then
      Begin
        FScrollDownState := hbsDown;
        Changed := True;
      End;
    End
    Else
    Begin
      If FScrollDownState <> hbsUp Then
      Begin
        //StopTimer( ScrollTimer );
        FScrollDownState := hbsUp;
      End;
    End;

    If Changed Then
      SetTimer( Handle, ScrollTimer, FAutoScrollDelay, Nil );
  End;
End;

Function TmxOutlookBarPro.ProcessOuterDrop( DataObject: IDataObject; NewButton, TargetButton: TmxButton; Var Effect: Integer; HitMode: TmxHitPosition ): Boolean;
Var
  MoveButton: Boolean;
Begin
  Result := False;

  If HitMode = hpUnknown Then Effect := DROPEFFECT_NONE Else
  Begin
    BeginUpdate;

    MoveButton := ( Effect And DROPEFFECT_MOVE ) <> 0;

    Try
      Try
        FDraggedButton := NewButton;

        If Assigned( NewButton ) Then
        Begin
          If Assigned( TargetButton ) Then
          Begin
            If TargetButton.HeaderIndex = NewButton.HeaderIndex Then
            Begin
              If MoveButton Then NewButton.ButtonIndex := TargetButton.ButtonIndex Else
              Begin
                Case HitMode Of
                  hpAbove: NewButton.ButtonIndex := TargetButton.ButtonIndex;
                  hpInsert, hpBelow: NewButton.ButtonIndex := TargetButton.ButtonIndex + 1;
                End;
              End;
            End
            Else
            Begin
              Case HitMode Of
                hpAbove: NewButton.ButtonIndex := TargetButton.ButtonIndex;
                hpInsert, hpBelow: NewButton.ButtonIndex := TargetButton.ButtonIndex + 1;
              End;
              If MoveButton Then Effect := DROPEFFECT_MOVE;
            End;
          End
          Else
          Begin
            If Assigned( FCurrentTargetHeader ) And ( FCurrentTargetHeader.ButtonCount = 0 ) Then
            Begin
              If MoveButton Then Effect := DROPEFFECT_MOVE;
            End
            Else Result := False;
          End;
        End;
      Except
        Effect := DROPEFFECT_NONE;
      End;
    Finally
      EndUpdate;
    End;
  End;
End;

Function TmxOutlookBarPro.ProcessDrop( DataObject: IDataObject; TargetButton: TmxButton; Var Effect: Integer; HitMode: TmxHitPosition ): Boolean;
Var
  Source: TmxOutlookBarPro;
Begin
  Result := False;

  If HitMode = hpUnknown Then Effect := DROPEFFECT_NONE Else
  Begin
    Source := FDragManager.GetDataSourceTree( DataObject );
    If Not Assigned( Source ) Then Exit;

    BeginUpdate;
    Source.BeginUpdate;
    Try
      Try
        Result := ProcessOLEData( Source, DataObject, TargetButton, HitMode, Effect );
      Except
        Effect := DROPEFFECT_NONE;
      End;
    Finally
      Source.EndUpdate;
      EndUpdate;
    End;
  End;
End;

Function TmxOutlookBarPro.ProcessOLEData( Source: TmxOutlookBarPro; DataObject: IDataObject; TargetButton: TmxButton; HitMode: TmxHitPosition; Var Effect: Integer ): Boolean;
Var
  Button, NewButton: TmxButton;
  MoveButton: Boolean;
Begin
  With StandardOLEFormat Do
  Begin
    cfFormat := CF_OUTLOOKBARPRO;
  End;

  MoveButton := ( Effect And DROPEFFECT_MOVE ) <> 0;
  Result := DataObject.QueryGetData( StandardOLEFormat ) = S_OK;
  Effect := DROPEFFECT_NONE;
  If Not Result Then Exit;

  BeginUpdate;
  Try
    Button := Source.FDraggedButton;

    If ( Source = Self ) And Assigned( Button ) Then
    Begin
      If Assigned( TargetButton ) Then
      Begin
        If TargetButton.HeaderIndex = Button.HeaderIndex Then
        Begin
          If MoveButton Then Button.ButtonIndex := TargetButton.ButtonIndex Else
          Begin
            Case HitMode Of
              hpAbove:
                Begin
                  NewButton := TmxButton( TmxButtons( TargetButton.Collection ).Insert( TargetButton.ButtonIndex ) );
                  NewButton.Assign( Button );
                End;
              hpInsert, hpBelow:
                Begin
                  NewButton := TmxButton( TmxButtons( TargetButton.Collection ).Insert( TargetButton.ButtonIndex + 1 ) );
                  NewButton.Assign( Button );
                End;
            End;
          End;
        End
        Else
        Begin
          Case HitMode Of
            hpAbove:
              Begin
                NewButton := TmxButton( TmxButtons( TargetButton.Collection ).Insert( TargetButton.ButtonIndex ) );
                NewButton.Assign( Button );
              End;
            hpInsert, hpBelow:
              Begin
                NewButton := TmxButton( TmxButtons( TargetButton.Collection ).Insert( TargetButton.ButtonIndex + 1 ) );
                NewButton.Assign( Button );
              End;
          End;
          If MoveButton Then Effect := DROPEFFECT_MOVE;
        End;
      End
      Else
      Begin
        If Assigned( FCurrentTargetHeader ) And ( FCurrentTargetHeader.ButtonCount = 0 ) Then
        Begin
          NewButton := FCurrentTargetHeader.AddButton;
          NewButton.Assign( Button );
          If MoveButton Then Effect := DROPEFFECT_MOVE;
        End
        Else Result := False;
      End;
    End
    Else Result := False;

  Finally
    EndUpdate;
  End;
End;

Procedure TmxOutlookBarPro.SetAlertInterval( AValue: Cardinal );
Begin
  If FAlertInterval <> AValue Then
  Begin
    FAlertInterval := AValue;

    If Assigned( FAlertedButton ) Then // ** We need to restart the timer ***
    Begin
      StopTimer( AlertTimer );
      SetTimer( Handle, AlertTimer, FAlertInterval, Nil );
    End;
  End;
End;

Procedure TmxOutlookBarPro.SetAlertedButton( AButton: TmxButton );
Begin
  If Assigned( FAlertedButton ) Then
  Begin
{$WARNINGS OFF}
    If @FAlertedButton <> @AButton Then
{$WARNINGS ON}
      FAlertedButton.FAlerted := False;
    FAlertedButton.FFlashing := False;
  End;

  FAlertedButton := AButton;

  If Assigned( FAlertedButton ) Then
  Begin
    FAlertedButton.FAlerted := True;
    FAlertedButton.FFlashing := False;
    SetTimer( Handle, AlertTimer, FAlertInterval, Nil );
  End
  Else StopTimer( AlertTimer );
End;

Procedure TmxOutlookBarPro.DoInvalidate;
Var
  Rect: TRect;
Begin
  If Not ( ( csDestroying In ComponentState ) Or ( csLoading In ComponentState ) ) Then
  Begin
    Rect := Bounds( 0, 0, Width, Height );
{$WARNINGS OFF}
    InvalidateRect( Handle, @Rect, False );
{$WARNINGS ON}
  End;
End;

Procedure TmxOutlookBarPro.DoMyContextPopup( Sender: TObject; MousePos: TPoint; Var Handled: Boolean );
Begin
  If Assigned( FOnContextPopup ) Then FOnContextPopup( Sender, MousePos, Handled );
End;

Procedure TmxOutlookBarPro.WMContextMenu( Var Message: TWMContextMenu );
Var
  Pt: TPoint;
  Handled: Boolean;
  ClientPoint: TPoint;
Begin
  If Message.Result <> 0 Then Exit;

  If csDesigning In ComponentState Then
  Begin
    Inherited;
    Exit;
  End;

  Pt := ScreenToClient( SmallPointToPoint( Message.Pos ) );
  ClientPoint.X := PT.X;
  ClientPoint.Y := PT.Y;
  ClientPoint := ClientToScreen( PT );

  // ***

  Handled := False;

  If Assigned( FMouseInButton ) Then
  Begin
    If ( PtInRect( FMouseInButton.ButtonRect, PT ) ) Then
    Begin
      DoMyContextPopup( FMouseInButton, PT, Handled );

      If ( Not Handled ) And ( Assigned( FMouseInButton.PopupMenu ) ) Then
      Begin
        If FMouseInButton.PopupMenu.AutoPopup Then
        Begin
          FMouseInButton.PopupMenu.Popup( ClientPoint.X, ClientPoint.Y );
          Handled := True;
        End;
      End;
    End;
  End;

  If Not Handled Then
  Begin
    If Assigned( FMouseInHeader ) Then
    Begin
      If ( PtInRect( FMouseInHeader.ButtonRect, PT ) ) Then
      Begin
        DoMyContextPopup( FMouseInHeader, PT, Handled );

        If ( Not Handled ) And ( Assigned( FMouseInHeader.PopupMenu ) ) Then
        Begin
          If FMouseInHeader.PopupMenu.AutoPopup Then
          Begin
            FMouseInHeader.PopupMenu.Popup( ClientPoint.X, ClientPoint.Y );
            Handled := True;
          End;
        End;
      End;
    End
    Else If Assigned( FMouseInHeaderBody ) Then
    Begin
      If ( PtInRect( FMouseInHeaderBody.BodyRect, PT ) ) Then
      Begin
        DoMyContextPopup( FMouseInHeaderBody, PT, Handled );

        If ( Not Handled ) And ( Assigned( FMouseInHeaderBody.PopupMenu ) ) Then
        Begin
          If FMouseInHeaderBody.PopupMenu.AutoPopup Then
          Begin
            FMouseInHeaderBody.PopupMenu.Popup( ClientPoint.X, ClientPoint.Y );
            Handled := True;
          End;
        End;
      End;
    End;
  End;

  If Not Handled Then
  Begin
    DoMyContextPopup( Self, PT, Handled );

    If Not Handled Then
    Begin
      If ( PopupMenu <> Nil ) And PopupMenu.AutoPopup Then
      Begin
        PopupMenu.Popup( ClientPoint.X, ClientPoint.Y );
        Handled := True;
      End;
    End;
  End;

  Message.Result := Ord( Handled );
  If Not Handled Then Inherited;
End;

Procedure TmxOutlookBarPro.EditorContext( Sender: TObject; MousePos: TPoint; Var Handled: Boolean );
Var
  Pt: TPoint;
Begin
  Handled := False;

  Pt := MousePos;
  Inc( PT.X, FEditor.FEdit.Left );
  Inc( PT.Y, FEditor.FEdit.Top );

  If Assigned( FOnEditorContextPopup ) Then
    FOnEditorContextPopup( FEditor, Pt, Handled );
End;

Initialization
  Registered := False;
  PrepareColorMatrix;
  InitializeGlobalStructures;

  //MessageDlg( 'This application uses TmxOutlookBarPro from' + #13 + #10 + 'www.maxcomponents.net' + #13 + #10 + 'email: support@maxcomponents.net', mtWarning, [ mbOK ], 0 );

  FAlphaBitmap := TBitmap.Create;
  FAlphaBitmap.PixelFormat := pf32bit;

Finalization

  FAlphaBitmap.Free;
  FinalizeGlobalStructures;

End.

