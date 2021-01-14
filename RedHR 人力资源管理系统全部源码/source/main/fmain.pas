unit fmain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, Menus, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,Registry,shellapi,
  cxGridDBTableView, cxGrid, ExtCtrls, ToolWin, ActnMan, ActnCtrls, dxtree,
  dxdbtree, cxContainer, cxTextEdit, cxMaskEdit, cxButtonEdit, ImgList,
  cxImage, cxDBEdit, cxSSheet, StdCtrls, StdActns, ActnList, cxSSRes,cxSSTypes,inifiles,
  dxExEdtr, dxInspRw, dxDBInRw, dxInspct, dxDBInsp, dxCntner,
  cxGridBandedTableView, XPMan, OleCtrls, AgentObjects_TLB, OleCtnrs,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  dxPSTVLnk, dxPSdxDBTVLnk, dxPSBaseGridLnk, dxPScxSSLnk, DBCtrls,ComObj;

type                                                           
  TStyleValue = (svAlign, svFontName, svSize, svBold, svItalic, svUnderline, svStrikeOut);
  TStyleValueSet = set of TStyleValue;
  TMain = class(TForm)
    ADOconn: TADOConnection;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N20: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    staffinfo: TADOQuery;
    staffsource: TDataSource;
    PopupMenu1: TPopupMenu;
    N28: TMenuItem;
    N29: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    dele: TADOQuery;
    tmpquery: TADOQuery;
    Panel1: TPanel;
    dxDBTreeView1: TdxDBTreeView;
    Splitter1: TSplitter;
    BranchSource: TDataSource;
    branch: TADOTable;
    PopupMenu2: TPopupMenu;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    stafftable: TADOTable;
    Panel2: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Splitter2: TSplitter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet7: TTabSheet;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    stachposteditSource: TDataSource;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn9: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    PopupMenu3: TPopupMenu;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    ImageList1: TImageList;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    brancheditsource: TDataSource;
    cxGrid3DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid3DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid3DBTableView1DBColumn3: TcxGridDBColumn;
    r_staffbranchedit: TADOTable;
    PopupMenu4: TPopupMenu;
    N49: TMenuItem;
    N50: TMenuItem;
    N51: TMenuItem;
    tmpquery2: TADOQuery;
    stachpostedit: TADOTable;
    r_staffpost: TADOTable;
    r_staffpostSource: TDataSource;
    cxGrid4DBTableView1: TcxGridDBTableView;
    cxGrid4Level1: TcxGridLevel;
    cxGrid4: TcxGrid;
    Splitter3: TSplitter;
    cxGrid4DBTableView1DBColumn1: TcxGridDBColumn;
    r_staffpict: TADOTable;
    r_staffpictSource: TDataSource;
    PopupMenu5: TPopupMenu;
    N52: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    cxGrid5DBTableView1: TcxGridDBTableView;
    cxGrid5Level1: TcxGridLevel;
    cxGrid5: TcxGrid;
    cxGrid5DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid5DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid5DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid5DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid5DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid5DBTableView1DBColumn6: TcxGridDBColumn;
    r_staffpay: TADOTable;
    r_staffpaySource: TDataSource;
    N55: TMenuItem;
    N56: TMenuItem;
    N30: TMenuItem;
    N57: TMenuItem;
    PopupMenu6: TPopupMenu;
    N58: TMenuItem;
    N59: TMenuItem;
    TabSheet8: TTabSheet;
    cxSpreadSheetBook1: TcxSpreadSheetBook;
    N60: TMenuItem;
    sheetpopup: TPopupMenu;
    N61: TMenuItem;
    N62: TMenuItem;
    N63: TMenuItem;
    N64: TMenuItem;
    N65: TMenuItem;
    N110: TMenuItem;
    N67: TMenuItem;
    N68: TMenuItem;
    N69: TMenuItem;
    N70: TMenuItem;
    imgFormatting: TImageList;
    imgBordersImages: TImageList;
    imgStandart: TImageList;
    imgHistory: TImageList;
    cbMain: TControlBar;
    tbsStandart: TToolBar;
    tbsNew: TToolButton;
    tbsOpen: TToolButton;
    tbsSave: TToolButton;
    ToolButton20: TToolButton;
    tbsCut: TToolButton;
    tbsCopy: TToolButton;
    tbsPaste: TToolButton;
    tlbHistory: TToolBar;
    tbUndo: TToolButton;
    ToolButton21: TToolButton;
    alMain: TActionList;
    actNew: TAction;
    actDeleteCells: TAction;
    actOpenSpreadSheet: TAction;
    actSaveSpeadSheet: TAction;
    actInsertCells: TAction;
    actExit: TAction;
    actAutomaticCalc: TAction;
    actRecalcFormulas: TAction;
    actCut: TAction;
    actCopy: TAction;
    actPaste: TAction;
    actBeveledLookandFeel: TAction;
    actBufferedpaint: TAction;
    actShowcaptions: TAction;
    actShowgrid: TAction;
    actShowheaders: TAction;
    actShowformulas: TAction;
    actR1C1Referencestyle: TAction;
    actCells: TAction;
    actRow: TAction;
    actColumn: TAction;
    actSheet: TAction;
    actWindowClose: TWindowClose;
    actWindowCascade: TWindowCascade;
    actWindowTileHorizontal: TWindowTileHorizontal;
    actWindowTileVertical: TWindowTileVertical;
    actWindowMinimizeAll: TWindowMinimizeAll;
    actWindowArrange: TWindowArrange;
    actCellLeftAlign: TAction;
    actCellRightAlign: TAction;
    actCellCenterAlign: TAction;
    actBold: TAction;
    actItalic: TAction;
    actUnderline: TAction;
    actStrikeOut: TAction;
    actMergeCells: TAction;
    actSplitCells: TAction;
    actSortAscending: TAction;
    actSortDescending: TAction;
    actSum: TAction;
    actFont: TAction;
    actFontSize: TAction;
    actAverage: TAction;
    actCount: TAction;
    actMax: TAction;
    actMin: TAction;
    actFormatCells: TAction;
    actHideCells: TAction;
    actShowCells: TAction;
    actHideCol: TAction;
    actShowCol: TAction;
    actHideRow: TAction;
    actShowRow: TAction;
    actUndo: TAction;
    actRedo: TAction;
    SaveDialog1: TSaveDialog;
    cxGrid5DBTableView1DBColumn7: TcxGridDBColumn;
    pmBorders: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    N71: TMenuItem;
    N81: TMenuItem;
    N91: TMenuItem;
    N101: TMenuItem;
    N111: TMenuItem;
    N121: TMenuItem;
    pmSummary: TPopupMenu;
    Sum1: TMenuItem;
    Average1: TMenuItem;
    Count1: TMenuItem;
    Max1: TMenuItem;
    Min1: TMenuItem;
    N66: TMenuItem;
    N72: TMenuItem;
    N73: TMenuItem;
    N74: TMenuItem;
    N75: TMenuItem;
    N76: TMenuItem;
    N77: TMenuItem;
    N78: TMenuItem;
    N79: TMenuItem;
    N80: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton8: TToolButton;
    cxTextEdit1: TcxTextEdit;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton19: TToolButton;
    tbsFormatting: TToolBar;
    cbxFont: TComboBox;
    cbxSize: TComboBox;
    ToolButton15: TToolButton;
    tbLeftAlign: TToolButton;
    tbCenterAlign: TToolButton;
    tbRightAlign: TToolButton;
    ToolButton16: TToolButton;
    tbBold: TToolButton;
    tbItalic: TToolButton;
    tbUnderline: TToolButton;
    tbStrikeOut: TToolButton;
    ToolButton17: TToolButton;
    tbMerge: TToolButton;
    tgSplit: TToolButton;
    ToolButton18: TToolButton;
    tbSummary: TToolButton;
    tbBorderStyle: TToolButton;
    cxsave: TPopupMenu;
    N82: TMenuItem;
    N83: TMenuItem;
    tmpado: TADOTable;
    sheetopen: TPopupMenu;
    N84: TMenuItem;
    N85: TMenuItem;
    OpenDialog1: TOpenDialog;
    N86: TMenuItem;
    N87: TMenuItem;
    N88: TMenuItem;
    N89: TMenuItem;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet6: TTabSheet;
    N5: TMenuItem;
    N13: TMenuItem;
    N92: TMenuItem;
    N93: TMenuItem;
    N94: TMenuItem;
    N95: TMenuItem;
    N96: TMenuItem;
    N97: TMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    N10: TMenuItem;
    N12: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    TabSheet9: TTabSheet;
    cxGrid6: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Noset: TADOQuery;
    nosetdatasource: TDataSource;
    ToolButton5: TToolButton;
    N17: TMenuItem;
    N18: TMenuItem;
    PopupMenu7: TPopupMenu;
    N19: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N35: TMenuItem;
    N90: TMenuItem;
    N98: TMenuItem;
    N99: TMenuItem;
    N100: TMenuItem;
    N102: TMenuItem;
    N103: TMenuItem;
    N104: TMenuItem;
    N105: TMenuItem;
    N1: TMenuItem;
    N4: TMenuItem;
    Branchimage: TImageList;
    N6: TMenuItem;
    N107: TMenuItem;
    ColorBox1: TColorBox;
    ToolButton6: TToolButton;
    N108: TMenuItem;
    N109: TMenuItem;
    N112: TMenuItem;
    N113: TMenuItem;
    N114: TMenuItem;
    N115: TMenuItem;
    r_staffteach: TADOTable;
    r_staffteachDataSource: TDataSource;
    cxGrid7DBTableView1: TcxGridDBTableView;
    cxGrid7Level1: TcxGridLevel;
    cxGrid7: TcxGrid;
    r_staffteachid: TADOTable;
    r_staffteachidDataSource: TDataSource;
    cxGrid7DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid7DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid7DBTableView1DBColumn3: TcxGridDBColumn;
    PopupMenu8: TPopupMenu;
    N116: TMenuItem;
    N117: TMenuItem;
    N118: TMenuItem;
    r_staffteachidid: TAutoIncField;
    r_staffteachidstaffid: TIntegerField;
    r_staffteachidteachid: TIntegerField;
    r_staffteachidmemo: TMemoField;
    r_staffteachiddelrecy: TWideStringField;
    r_staffteachidteachresult: TWideStringField;
    N119: TMenuItem;
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    XPManifest1: TXPManifest;
    N120: TMenuItem;
    ColorDialog1: TColorDialog;
    cxGrid8DBTableView1: TcxGridDBTableView;
    cxGrid8Level1: TcxGridLevel;
    cxGrid8: TcxGrid;
    r_staffcontract: TADOTable;
    cxGrid8DBTableView1DBColumn1: TcxGridDBColumn;
    r_staffcontractDataSource: TDataSource;
    cxGrid8DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid8DBTableView1DBColumn3: TcxGridDBColumn;
    ToolButton7: TToolButton;
    PopupMenu9: TPopupMenu;
    N122: TMenuItem;
    N123: TMenuItem;
    N124: TMenuItem;
    N125: TMenuItem;
    N126: TMenuItem;
    N127: TMenuItem;
    N128: TMenuItem;
    N129: TMenuItem;
    N130: TMenuItem;
    N131: TMenuItem;
    N132: TMenuItem;
    N133: TMenuItem;
    N134: TMenuItem;
    Agent1: TAgent;
    N135: TMenuItem;
    N136: TMenuItem;
    N137: TMenuItem;
    cxGrid9DBTableView1: TcxGridDBTableView;
    cxGrid9Level1: TcxGridLevel;
    cxGrid9: TcxGrid;
    N139: TMenuItem;
    p_w_tools: TADOTable;
    p_w_toolsSource: TDataSource;
    cxGrid9DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid9DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid9DBTableView1DBColumn3: TcxGridDBColumn;
    w_tools: TADOTable;
    w_toolsSource: TDataSource;
    PopupMenu10: TPopupMenu;
    N140: TMenuItem;
    N141: TMenuItem;
    N142: TMenuItem;
    N143: TMenuItem;
    N138: TMenuItem;
    N11: TMenuItem;
    N144: TMenuItem;
    N145: TMenuItem;
    N146: TMenuItem;
    N147: TMenuItem;
    N148: TMenuItem;
    N149: TMenuItem;
    N150: TMenuItem;
    N151: TMenuItem;
    dxComponentPrinter1: TdxComponentPrinter;
    N152: TMenuItem;
    dxComponentPrinter1Link1: TdxSpreadSheetBookReportLink;
    N153: TMenuItem;
    N154: TMenuItem;
    N155: TMenuItem;
    N156: TMenuItem;
    N157: TMenuItem;
    N158: TMenuItem;
    N159: TMenuItem;
    N106: TMenuItem;
    N160: TMenuItem;
    N161: TMenuItem;
    DBImage1: TDBImage;
    N162: TMenuItem;
    TMenu: TPopupMenu;
    N163: TMenuItem;
    N164: TMenuItem;
    N165: TMenuItem;
    procedure cxSpreadBookSetSelection(Sender: TObject;
      ASheet: TcxSSBookSheet);
    procedure FormCreate(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure branchAfterInsert(DataSet: TDataSet);
    procedure N36Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure dxDBTreeView1Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGrid1DBTableView1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cxGrid1DBTableView1SelectionChanged(
      Sender: TcxCustomGridTableView);
    procedure N32Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N46Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
    procedure dxDBTreeView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N51Click(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure N54Click(Sender: TObject);
    procedure N52Click(Sender: TObject);
    procedure N56Click(Sender: TObject);
    procedure cxGrid5DBTableView1DblClick(Sender: TObject);
    procedure N58Click(Sender: TObject);
    procedure N60Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure N62Click(Sender: TObject);
    procedure N63Click(Sender: TObject);
    procedure N65Click(Sender: TObject);
    procedure N67Click(Sender: TObject);
    procedure N69Click(Sender: TObject);
    procedure N70Click(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actSaveSpeadSheetExecute(Sender: TObject);
    procedure actCutExecute(Sender: TObject);
    procedure actCopyExecute(Sender: TObject);
    procedure actPasteExecute(Sender: TObject);
    procedure tbUndoClick(Sender: TObject);
    procedure ToolButton21Click(Sender: TObject);
    procedure actCellLeftAlignExecute(Sender: TObject);
    procedure actCellCenterAlignExecute(Sender: TObject);
    procedure actCellRightAlignExecute(Sender: TObject);
    procedure cbxFontChange(Sender: TObject);
    procedure cbxSizeChange(Sender: TObject);
    procedure actBoldExecute(Sender: TObject);
    procedure actItalicExecute(Sender: TObject);
    procedure actUnderlineExecute(Sender: TObject);
    procedure actStrikeOutExecute(Sender: TObject);
    procedure actMergeCellsExecute(Sender: TObject);
    procedure actSplitCellsExecute(Sender: TObject);
    procedure actSortAscendingExecute(Sender: TObject);
    procedure tbBorderStyleClick(Sender: TObject);
    procedure MenuItem1DrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
    procedure MenuItem1MeasureItem(Sender: TObject; ACanvas: TCanvas;
      var Width, Height: Integer);
    procedure MenuItem1Click(Sender: TObject);
    procedure actSumExecute(Sender: TObject);
    procedure N73Click(Sender: TObject);
    procedure N74Click(Sender: TObject);
    procedure N72Click(Sender: TObject);
    procedure N77Click(Sender: TObject);
    procedure N78Click(Sender: TObject);
    procedure N79Click(Sender: TObject);
    procedure cxSpreadSheetBook1ActiveSheetChanging(
      Sender: TcxCustomSpreadSheetBook; const ActiveSheet: Integer;
      var CanSelect: Boolean);
    procedure N83Click(Sender: TObject);
    procedure cxGrid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure N85Click(Sender: TObject);
    procedure N84Click(Sender: TObject);
    procedure N86Click(Sender: TObject);
    procedure N87Click(Sender: TObject);
    procedure cxGrid1DBTableView1Editing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure cxGrid1DBTableView1EditChanged(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
    procedure N89Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure N3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N90Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N107Click(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure cxGrid1Click(Sender: TObject);
    procedure cxSpreadSheetBook1Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N113Click(Sender: TObject);
    procedure N115Click(Sender: TObject);
    procedure N118Click(Sender: TObject);
    procedure N116Click(Sender: TObject);
    procedure N119Click(Sender: TObject);
    procedure N120Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure cxGrid8DBTableView1DblClick(Sender: TObject);
    procedure N125Click(Sender: TObject);
    procedure N126Click(Sender: TObject);
    procedure N127Click(Sender: TObject);
    procedure N129Click(Sender: TObject);
    procedure N132Click(Sender: TObject);
    procedure N134Click(Sender: TObject);
    procedure N136Click(Sender: TObject);
    procedure N137Click(Sender: TObject);
    procedure N141Click(Sender: TObject);
    procedure N140Click(Sender: TObject);
    procedure N143Click(Sender: TObject);
    procedure N150Click(Sender: TObject);
    procedure N151Click(Sender: TObject);
    procedure N152Click(Sender: TObject);
    procedure N153Click(Sender: TObject);
    procedure N156Click(Sender: TObject);
    procedure N158Click(Sender: TObject);
    procedure N160Click(Sender: TObject);
    procedure N161Click(Sender: TObject);
    procedure DBImage1DblClick(Sender: TObject);
    procedure N162Click(Sender: TObject);
    procedure N165Click(Sender: TObject);
  private
    { Private declarations }
    FWinDir: String;
    Procedure LoadForm(Form:TForm); 
    Procedure SaveForm(Form:TForm);
    procedure SetCellText(ACol, ARow : Integer; AText : String);
    procedure SetTokenStyle(AToolButton: TToolButton; AStyleValue: TStyleValue; AFontStyle: TFontStyle);
  protected
    procedure SetStates;
    procedure CalculateSummary(AType: Byte);
    procedure SetCellsStyle(AValuesSet: TStyleValueSet; AAlign: TcxHorzTextAlign;
      AFontSize: Integer; const AFontName: string; AStyles: TFontStyles);
  public
    { Public declarations }
    systmpdate:string;//临时数据库文件
    showdel:string;
    tmpstaffid:string;
    demofile:string;
    showlogo:string;
    sqlstring:string;
    iflogin:string;
    maxint,minint:array[1..4] of integer;
    (*------定义INI文件读出的变理-------*)
    ReadStencil:array[1..17] of string; //读出的模版变量
    ReadDataControl:string; //工具栏之数据控制
    ReadSheet:string;      //工具栏之表格编辑
    ReadStyle:string;      //样式
    ReadSaveOut:string;    //退出时自动保存
    ReadAutoMessage:string;//退出时弹出对话框
    Readeidolon:string;//启动时显示精灵
    procedure ReadConfiguration;
    procedure NewSheet(const ASheetName: string = '');
    property WinDir: String read FWinDir;//读取系统文件夹
  end;

var
  Main: TMain;
  MyAgent: IAgentCtlCharacter;

implementation

uses addman, fzglx, Fbranch, Fpostedit, Fchangepost, Fcorpmessage,
  Frepstaffinfo, Fbranmessage, Fshowpic, Fspic, Fpayedit, Flogo,EncryptIt,
  Fmess, Flogin, cardin_form, Fconfig, Fchartbm, Fpaycalculate, Ftrain,
  Ftrainresult, Fcontract, Fsearch, Fweal, Fcutline, Fperson, Fpworks,
  Fstatools;

{$R *.dfm}
procedure Tmain.cxSpreadBookSetSelection(Sender: TObject;
  ASheet: TcxSSBookSheet);
begin
  try
    SetStates;
  finally
  end;
end;

procedure Tmain.SetStates;
var
  AStyle: TFontStyles;
begin
  with cxSpreadSheetBook1 do
  begin
    with ActiveSheet.GetCellObject(ActiveSheet.SelectionRect.Left,
      ActiveSheet.SelectionRect.Top) do
    try
      tbLeftAlign.Down := DisplayTextAlignment in [dtaLEFT, dtaFILL, dtaJUSTIFY];
      tbCenterAlign.Down := DisplayTextAlignment in [dtaCenter];
      tbRightAlign.Down := DisplayTextAlignment in [dtaRight];
      AStyle := Style.Font.Style;
      tbBold.Down := fsBold in AStyle;
      tbItalic.Down := fsItalic in AStyle;
      tbUnderline.Down := fsUnderline in AStyle;
      tbStrikeOut.Down := fsStrikeOut in AStyle;
      cbxFont.Text := Style.Font.Name;
      self.ColorBox1.Selected:=style.Brush.BackgroundColor;
      cbxSize.Text := IntToStr(Style.Font.Size);
    finally
      Free;
    end;
    actBeveledLookandFeel.Checked := PainterType = ptOfficeXPStyle;
    actBufferedpaint.Checked := BufferedPaint;
    actShowcaptions.Checked := ShowCaptionBar;
    actShowgrid.Checked := ShowGrid;
    actShowheaders.Checked := ShowHeaders;
    actShowformulas.Checked := ShowFormulas;
    actR1C1Referencestyle.Checked := R1C1ReferenceStyle;
    actAutomaticcalc.Checked := AutoRecalc;
  end;
end;

procedure Tmain.ReadConfiguration; //...读出INI文件内容
var ReadIni:tinifile;
Begin
  ReadIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  with ReadIni do
    begin
      self.ReadStencil[1]:= ReadString('Stencil', 'XM', 'XM');     
      self.ReadStencil[2]:= ReadString('Stencil', 'XB', 'XB');
      self.ReadStencil[3]:= ReadString('Stencil', 'YWM', 'YWM');
      self.ReadStencil[4]:= ReadString('Stencil', 'HF', 'HF');
      self.ReadStencil[5]:= ReadString('Stencil', 'SR', 'SR');
      self.ReadStencil[6]:= ReadString('Stencil', 'JG', 'JG');
      self.ReadStencil[7]:= ReadString('Stencil', 'MZ', 'MZ');
      self.ReadStencil[8]:= ReadString('Stencil', 'ZJ', 'ZJ');
      self.ReadStencil[9]:= ReadString('Stencil', 'HK', 'HK');
      self.ReadStencil[10]:= ReadString('Stencil', 'XL', 'XL');
      self.ReadStencil[11]:= ReadString('Stencil', 'BY', 'BY');
      self.ReadStencil[12]:= ReadString('Stencil', 'WY', 'WY');
      self.ReadStencil[13]:= ReadString('Stencil', 'CD', 'CD');
      self.ReadStencil[14]:= ReadString('Stencil', 'DH', 'DH');
      self.ReadStencil[15]:= ReadString('Stencil', 'JD', 'JD');
      self.ReadStencil[16]:= ReadString('Stencil', 'JR', 'JR');
      self.ReadStencil[17]:= ReadString('Stencil', 'DY', 'DY');
      self.ReadDataControl:= ReadString('ToolBar', 'DataControl', '1');
      self.ReadSheet:= ReadString('ToolBar', 'Sheet', '1');
      self.ReadStyle:= ReadString('Sheet', 'Style', '1');
      self.ReadSaveOut:= ReadString('System', 'SaveOut', '0');
      self.ReadAutoMessage:= ReadString('System', 'AutoMessage', '1');
      self.Readeidolon:= ReadString('System','eidolon','1');
    end;
  ReadIni.Free;
End;

Procedure TMain.LoadForm(Form:TForm);
Var 
  MyFormSettings:TRegistry; 
Begin 
  MyFormSettings:=TRegistry.Create; 
  Try
    MyFormSettings.OpenKey('\Software\'+ ExtractFileName(Application.Exename)+ '\WinPos', TRUE); 
    If MyFormSettings.ValueExists(Form.Name) Then 
    Begin 
      If (MyFormSettings.ReadInteger(Form.Name+'_ScrWidth')=Screen.Width) Or  (MyFormSettings.ReadInteger(Form.Name+'_ScrHeight')=Screen.Height) Then 
      Begin 
        Case MyFormSettings.ReadInteger(Form.Name+'_WindowState') Of 
          1:Form.WindowState:=wsNormal; 
          2:Form.WindowState:=wsMinimized; 
          3:Form.WindowState:=wsMaximized; 
        End; 
        if Form.WindowState<>wsMaximized then 
        begin 
          Form.Top:=MyFormSettings.ReadInteger(Form.Name+'_Top'); 
          Form.Left:=MyFormSettings.ReadInteger(Form.Name+'_Left'); 
          Form.Width:=MyFormSettings.ReadInteger(Form.Name+'_Width'); 
          Form.Height:=MyFormSettings.ReadInteger(Form.Name+'_Height') 
        end 
      End 
    End
  Finally 
    MyFormSettings.Free 
  End 
End; 

Procedure TMain.SaveForm(Form:TForm); 
Var 
  MyFormSettings:TRegistry; 
Begin 
  MyFormSettings:=TRegistry.Create; 
  Try 
    MyFormSettings.OpenKey( '\Software\'+ 
                       ExtractFileName(Application.Exename)+ 
                       '\WinPos', TRUE); 
    MyFormSettings.WriteInteger(Form.Name+'_ScrWidth',Screen.Width); 
    MyFormSettings.WriteInteger(Form.Name+'_ScrHeight',Screen.Height); 
    Case Form.WindowState Of 
      wsNormal:MyFormSettings.WriteInteger(Form.Name+'_WindowState',1); 
      wsMinimized:MyFormSettings.WriteInteger(Form.Name+'_WindowState',2); 
      wsMaximized:MyFormSettings.WriteInteger(Form.Name+'_WindowState',3) 
    End; 
    MyFormSettings.WriteInteger(Form.Name+'_Width',Form.Width); 
    MyFormSettings.WriteInteger(Form.Name+'_Height',Form.Height); 
    MyFormSettings.WriteInteger(Form.Name+'_Left',Form.Left); 
    MyFormSettings.WriteInteger(Form.Name+'_Top',Form.Top); 
    MyFormSettings.WriteBool(Form.Name,True) 
  Finally 
    MyFormSettings.Free 
  End
End;

//....在表格上建立文字
procedure TMain.SetCellText(ACol, ARow : Integer; AText : String);
begin
  with cxSpreadSheetBook1.ActiveSheet.GetCellObject(ACol,ARow) do
  begin
    try
      Text := AText;
    finally
      Free;
    end;
  end;
end;


//......建立新数据文件
procedure TMain.NewSheet(const ASheetName: string = '');
begin
  self.TabSheet8.TabVisible:=true;
  self.PageControl1.ActivePageIndex:=7;
  self.cxSpreadSheetBook1.PageCount:=1;
  self.cxSpreadSheetBook1.ActivePage:=0;
  self.cxSpreadSheetBook1.ActiveSheet.ClearAll;
  self.cxSpreadSheetBook1.ActiveSheet.SelectCell(0,0,false);
  with cxSpreadSheetBook1 do
    OnSetSelection := cxSpreadBookSetSelection;
end;


//........设定字体类型
procedure TMain.SetCellsStyle(AValuesSet: TStyleValueSet; AAlign: TcxHorzTextAlign;
  AFontSize: Integer; const AFontName: string; AStyles: TFontStyles);

  procedure SetValue(AFlag: TStyleValue; ANeedStyle: TFontStyle;
    var ASetStyles: TFontStyles);
  begin
    if AFlag in AValuesSet then
    begin
      if ANeedStyle in AStyles then
        Include(ASetStyles, ANeedStyle)
      else
        Exclude(ASetStyles, ANeedStyle);
    end;
  end;

var
  I, J: Integer;
  AStyle: TFontStyles;

begin
  with cxSpreadSheetBook1 do
  try
    BeginUpdate;
    with ActiveSheet do
    begin
      for I := SelectionRect.Left to SelectionRect.Right do
        for J := SelectionRect.Top to SelectionRect.Bottom do
        with GetCellObject(I, J) do
        try
          with Style do
          begin
            AStyle := Font.Style;
            if svFontName in AValuesSet then
              Font.Name := AFontName;
            if svSize in AValuesSet then
              Font.Size := AFontSize;
            if svAlign in AValuesSet then
              HorzTextAlign := AAlign;
            SetValue(svBold, fsBold, AStyle);
            SetValue(svItalic, fsItalic, AStyle);
            SetValue(svUnderline, fsUnderline, AStyle);
            SetValue(svStrikeOut, fsStrikeOut, AStyle);
            Font.Style := AStyle;
          end;
        finally
          Free;
        end;
    end;
  finally
    EndUpdate;
    UpdateControl;
  end;
end;

procedure TMain.SetTokenStyle(AToolButton: TToolButton; AStyleValue: TStyleValue; AFontStyle: TFontStyle);
begin
  if AToolButton.Down then
    SetCellsStyle([AStyleValue], haGeneral, 0, '', [AFontStyle])
  else
    SetCellsStyle([AStyleValue], haGeneral, 0, '', []);
end;

function cxTryStrToInt(const AString: string; var Value: Integer): Boolean;
var
  ErrCode: Integer;
  S: string;
begin
  S := Trim(AString);
  Val(S, Value, ErrCode);
  Result := ErrCode = 0;
  if not Result then Value := 0;
end;


procedure TMain.CalculateSummary(AType: Byte);

  function SelRect(const ARect: TRect): string;
  begin
    Result := cxSpreadSheetBook1.CellsNameByRef(cxSpreadSheetBook1.ActivePage, ARect, False);
  end;
var
  S: string;
  ARect: TRect;
  ACell: TcxssCellObject;
const
  AFunc: array[0..4] of string = (sxlfSum, sxlfAverage, sxlfCount, sxlfMax, sxlfMin);
begin
  with cxSpreadSheetBook1 do
  try
    ARect := SelectionRect;
    S := SelRect(ARect);
    ACell := ActiveSheet.GetCellObject(ARect.Right, ARect.Bottom + 1);
    try
      ACell.Text := '=' + AFunc[AType] + '(' + S + ')';
    finally
      ACell.Free;
    end;
  finally
    UpdateControl;
  end;
end;

function GetTempDirectory: String;
var
  TempDir: array[0..255] of Char;
begin
  GetTempPath(255, @TempDir);
  Result := StrPas(TempDir);
end;

//---------------------------------------------------------------------------//
procedure TMain.FormCreate(Sender: TObject);
  //..取出系统临时文件夹
var tmpstr:string;
    Names: Pchar;
    Size: integer;
begin
//  EncryptIt.EncryptFile('tmp.mdb','hrdata.dat',0611); // 加密
//  exit;
 Names := #0;//读出系统文件夹
  try
    GetMem( Names, MAX_PATH+1 );
    Size := GetWindowsDirectory(Names, MAX_PATH+1);
    FWinDir := StrPas(Names);   
  finally
    FreeMem( Names );
  end;
  //判断程式是否正确安装
  if FileExists(fwindir+'\system32\redhr.cnf')=false then
    begin
      MessageBox(handle,'程序运行失败，请确认您是否正确安装！','错误',MB_ICONERROR or MB_OK);
      try
        self.Free;
      except
      end;
      exit;
    end;
  //...以下正确执行
  self.iflogin:='N';
  tmpstr:=gettempdirectory;
  self.ReadConfiguration;
  //..解密数据库到临时文件
  try
  systmpdate:='tmp.tmp';
  EncryptIt.DecryptFile('hrdata.dat',tmpstr+systmpdate,0611);
  except
    MessageBox(handle,'程序运行失败，关闭本系统，并拷贝备份的数据库到程式目录！','错误',MB_ICONERROR or MB_OK);
  end;
  self.LoadForm(main);
  try
  //deletefile('hrdata.dat');
  self.ADOconn.ConnectionString:='';
  self.ADOconn.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;'
                                 +'Data Source='
                                 +tmpstr+systmpdate
                                 //+'tmp.mdb'
                                 +';Persist Security Info=False';
  self.ADOconn.Open;
  self.staffinfo.Open;        //基本信息
  self.branch.Open;
  self.showdel:='0';//不显示删除数据
  self.r_staffbranchedit.Open;    //部门变动
  self.r_staffpost.Open;   //职位类型
  self.stachpostedit.Open; //职位变动
  self.r_staffpict.Open;//图片
  self.r_staffpay.Open;//薪资福利
  self.r_staffteach.Open;//职工培训计划
  self.r_staffteachid.Open;//职工参加培训记录
  self.r_staffcontract.Open;//职工合同协议
  self.w_tools.Open;  //物品表
  self.p_w_tools.Open;    //领用表
  self.PageControl1.ActivePageIndex:=0;
  self.TabSheet8.tabVisible:=false;
  cbxFont.Items.Assign(Screen.Fonts);
  cbxFont.Text := '宋体';
  cbxSize.Text := '9';
  self.sqlstring:=self.staffinfo.SQL.Text;
  except
    MessageBox(handle,'程序运行失败，关闭本系统，并拷贝备份的数据库到程式目录！','错误',MB_ICONERROR or MB_OK);
  end;
  self.StatusBar1.Panels[1].Text:='就绪';
  with cxSpreadSheetBook1 do
    OnSetSelection := cxSpreadBookSetSelection;
end;

procedure TMain.N28Click(Sender: TObject);
begin
  main.tmpquery.Close;
  main.tmpquery.SQL.Clear;
  main.tmpquery.SQL.Add('select * from r_staffclasscode');
  main.tmpquery.Open;
  if self.tmpquery.RecordCount=0 then
    begin
      MessageBox(handle,'请先设置职工类型！','错误',MB_ICONERROR or MB_OK);
      exit;
    end;
  if self.branch.RecordCount=0 then
    begin
      MessageBox(handle,'没有部门数据暂无法建立职工档案！','错误',MB_ICONERROR or MB_OK);
      exit;
    end;
  faddman:=tfaddman.create(application);
  faddman.ADOTable1.Open;
  faddman.PageControl1.ActivePageIndex:=0;
  faddman.etype:=1;
  faddman.showmodal;
  self.staffinfo.Close;
  self.staffinfo.open;
  self.r_staffbranchedit.Close;
  self.r_staffbranchedit.Open;
end;

procedure TMain.branchAfterInsert(DataSet: TDataSet);
begin
  if varIsNull(branch.FindField('pid').Value) then begin
    if varIsNull(dxDBTreeView1.DBTreeNodes.MaxKeyFieldValue) then
      branch.FindField('pid').AsString:=''
    else branch.FindField('pid').Value := dxDBTreeView1.DBTreeNodes.MaxKeyFieldValue + 1;
  end;
  branch.FindField('color').AsInteger:=clWhite;
end;

procedure TMain.N36Click(Sender: TObject);
begin
  if self.dxDBTreeView1.Selected.Level=0 then
    begin
      MessageBox(handle,'最高级部门只能唯一！','提示',MB_ICONinformation or MB_OK);
      exit;   
    end;
  bran:=tbran.create(application);
  bran.etype:=1;
  bran.GroupBox2.Visible:=false;
  bran.GroupBox3.Visible:=false;
  bran.Height:=150;
  bran.Button1.Top:=80;
  bran.Button2.Top:=80;
  bran.GroupBox1.Caption:='部门名称';
  bran.showmodal;
end;

procedure TMain.N41Click(Sender: TObject);
begin
  self.dxDBTreeView1.Selected.EditText;
end;

procedure TMain.N39Click(Sender: TObject);
begin
  if self.branch.RecordCount=0 then exit;
  if self.dxDBTreeView1.Selected.Level=0 then
    begin
      MessageBox(handle,'最高级部门设置不可删除！','提示',MB_ICONinformation or MB_OK);
      exit;
    end;
  if Application.MessageBox('确认要删除这个部门设置吗？','提示',MB_ICONQUESTION or MB_YESNO )=IDYES then
    begin
      self.dxDBTreeView1.Selected.Delete;
      main.Branch.Close;
      main.branch.Open;
    end;
end;

procedure TMain.N37Click(Sender: TObject);
begin
  bran:=tbran.Create(application);
  bran.etype:=2;//增加分部
  bran.GroupBox2.Visible:=false;
  bran.GroupBox3.Visible:=false;
  bran.Height:=150;
  bran.Button1.Top:=80;
  bran.Button2.Top:=80;
  bran.GroupBox1.Caption:='分部名称';
  bran.ShowModal;
end;

procedure TMain.N29Click(Sender: TObject);
var tmpid:string;
begin
  if self.staffinfo.RecordCount=0 then exit;
  faddman:=tfaddman.create(application);
  main.tmpquery.Close;
  main.tmpquery.SQL.Clear;
  main.tmpquery.SQL.Add('select * from r_staffclasscode');
  main.tmpquery.Open;
  faddman.PageControl1.ActivePageIndex:=0;
  faddman.etype:=2;
  faddman.Edit12.Text:=self.staffinfo.FieldByName('staffid').AsString;
  faddman.Edit1.Text:=self.staffinfo.FieldByName('name').AsString;                     //姓名
  faddman.ComboBox1.Text:=self.staffinfo.FieldByName('sex').AsString;                  //性别
  faddman.Edit2.Text:=self.staffinfo.FieldByName('ename').AsString;                    //英文名
  faddman.Edit3.Text:=self.staffinfo.FieldByName('idnum').AsString;                    //身份证号码
  faddman.ComboBox2.Text:=self.staffinfo.FieldByName('ifmarriage').AsString;           //婚否
  faddman.DateTimePicker1.Date:=self.staffinfo.FieldByName('birthday').AsDateTime;     //生日
  faddman.ComboBox3.Text:=self.staffinfo.FieldByName('Nationality').AsString;          //民族
  faddman.Edit4.Text:=self.staffinfo.FieldByName('Nativeplace').AsString;              //籍贯
  faddman.Edit5.Text:=self.staffinfo.FieldByName('Residence').AsString;                //户口所在地
  faddman.ComboBox4.Text:=self.staffinfo.FieldByName('knowledge').AsString;            //学历
  faddman.Edit6.Text:=self.staffinfo.FieldByName('School').AsString;                   //毕业院校
  faddman.ComboBox5.Text:=self.staffinfo.FieldByName('forlang').AsString;              //外语语种
  faddman.ComboBox6.Text:=self.staffinfo.FieldByName('howforlang').AsString;           //熟练程度
  faddman.DateTimePicker2.Date:=self.staffinfo.FieldByName('intime').AsDateTime;       //入职日期
  faddman.Edit7.Text:=self.staffinfo.FieldByName('exigenceman').AsString;              //紧急联系人
  faddman.Edit8.Text:=self.staffinfo.FieldByName('exigencephone').AsString;            //紧急联系电话号码
  faddman.Edit9.Text:=self.staffinfo.FieldByName('Telephone').AsString;//联系电话
  faddman.Edit10.Text:=self.staffinfo.FieldByName('Address').AsString;//通讯地址
  faddman.Edit11.Text:=self.staffinfo.FieldByName('Email').AsString;//电子邮件
  //faddman.dxLookupTreeView1.Selected.Item[self.branch.FieldByName('id').AsInteger].Selected;
  faddman.dxLookupTreeView1.Text:=self.branch.fieldbyname('branchname').AsString;
  faddman.Memo1.Lines.Text:=self.staffinfo.FieldByName('imemo').AsVariant;//备注
  faddman.cxLookupComboBox1.EditValue:=self.staffinfo.FieldByName('classcodeID').AsInteger;//职工类别
  //..设变量部门变动
  faddman.bmchange:=self.branch.fieldbyname('id').AsInteger;
  faddman.bmname:=self.branch.fieldbyname('branchname').AsString;
  //..显示最后一次部门的变动日期
  tmpid:=self.staffinfo.fieldbyname('r_staffinfo.id').AsString;
  self.tmpquery2.Close;
  self.tmpquery2.SQL.Clear;
  self.tmpquery2.SQL.Add('select * from r_staffbranchedit where 1=1');
  self.tmpquery2.SQL.Add(' order by id desc');
  self.tmpquery2.Filtered:=false;
  self.tmpquery2.Filter:=format('staffid'+'='+'''%s''',[tmpid]);
  self.tmpquery2.Filtered:=true;
  self.tmpquery2.Open;
  faddman.DateTimePicker3.Date:=self.tmpquery2.fieldbyname('indate').AsDateTime;
  //..打开窗口
  faddman.showmodal;
  self.staffinfo.Close;
  self.staffinfo.open;
  self.r_staffbranchedit.Close;
  self.r_staffbranchedit.Open;
end;

procedure TMain.dxDBTreeView1Click(Sender: TObject);
var tmpid:string;
begin
  if self.ToolButton6.Down then
    begin
      try
        myagent.Show(0);
        myagent.Play('GetAttention');
        myagent.Speak('您所指的是部门树状图','');
        myagent.Play('LookLeft');
        myagent.Speak('点击鼠标右键，您可以增加和管理部门','');
        myagent.Play('LookLeft');
        myagent.Hide(0);
      except
      end;
      exit;
    end;
  tmpid:=self.branch.fieldbyname('id').AsString;
  self.staffinfo.Close;
  self.staffinfo.SQL.Text:=self.sqlstring;
  self.staffinfo.Filtered:=false;
  self.staffinfo.Filter:=format('branchid'+'='+'''%s''',[tmpid]);
  self.staffinfo.Filtered:=true;
  self.staffinfo.Open;
  self.N34.Checked:=false;
end;

procedure TMain.N34Click(Sender: TObject);
begin
  if self.N34.Checked=true then
    begin
      self.N34.Checked:=false;
      self.staffinfo.Close;
      self.staffinfo.SQL.Clear;
      self.staffinfo.SQL.Add('select * from r_staffinfo,r_staffclasscode where');
      self.staffinfo.SQL.Add(' r_staffinfo.delrecy='''+'0'+''' and r_staffinfo.classcodeID=r_staffclasscode.id');

      self.staffinfo.Open;
      self.showdel:='0';
    end
    else
    begin
      self.N34.Checked:=true;
      self.staffinfo.Close;
      self.staffinfo.SQL.Clear;
      self.staffinfo.SQL.Add('select * from r_staffinfo,r_staffclasscode where');
      self.staffinfo.SQL.Add(' r_staffinfo.classcodeID=r_staffclasscode.id');
      self.staffinfo.Open;
      self.showdel:='1';
    end;
end;

procedure TMain.N31Click(Sender: TObject);
var tmpid:string;
begin
  if self.staffinfo.RecordCount=0 then exit;
  if self.staffinfo.FieldByName('r_staffinfo.delrecy').AsString='1' then
    begin
        if Application.MessageBox('确认要删除所选择数据吗？','提示',MB_ICONwarning or MB_YESNO )=IDNO then exit;
          begin
            try
              tmpid:=self.staffinfo.fieldbyname('r_staffinfo.id').AsString;
              self.stafftable.Close;
              self.stafftable.Filtered:=false;
              self.stafftable.Filter:=format('id'+'='+'''%s''',[tmpid]);
              self.stafftable.Filtered:=true;
              self.stafftable.Open;
              self.stafftable.Delete;
              self.staffinfo.Close;
              self.staffinfo.Open;
            except
            end;
          end;
      exit;
    end;
  if Application.MessageBox('确认要删除所选择数据吗？','提示',MB_ICONwarning or MB_YESNO )=IDNO then exit;
    try
      tmpid:=self.staffinfo.fieldbyname('r_staffinfo.id').AsString;
      self.stafftable.Close;
      self.stafftable.Filtered:=false;
      self.stafftable.Filter:=format('id'+'='+'''%s''',[tmpid]);
      self.stafftable.Filtered:=true;
      self.stafftable.Open;
      self.stafftable.edit;
      self.stafftable.FieldByName('delrecy').AsString:='1';
      self.stafftable.Post;
      self.stafftable.Close;
      self.staffinfo.Close;
      self.staffinfo.Open;
      self.r_staffbranchedit.Close;
      self.r_staffbranchedit.Open;
    except
    end;
end;

procedure TMain.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var tmpid:string;
begin
  tmpid:=self.staffinfo.fieldbyname('r_staffinfo.id').AsString;
  if self.staffinfo.FieldByName('r_staffinfo.delrecy').AsString='1' then
    self.N32.Enabled:=true
    else
    self.N32.Enabled:=false;
  self.N60.OnClick(self);
  //---------------职位变动---------------//
  (*self.stachpostedit.Close;
  self.stachpostedit.Filtered:=false;
  self.stachpostedit.Filter:=format('staffid'+'='+'''%s''',[tmpid]);
  self.stachpostedit.Filtered:=true;
  self.stachpostedit.Open;  *)
  //--------------------------------------//
end;

procedure TMain.cxGrid1DBTableView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if self.ToolButton6.Down then
    begin
      try
        myagent.Show(0);
        myagent.Play('GetAttention');
        myagent.Speak('您所指的是职工基本信息列表'#13,'');
        myagent.Play('Lookright');
        myagent.Speak('在这里您可以增加和设置职工信息，并能让您及时了解，作出分析','');
        myagent.Play('Lookright');
        myagent.Hide(0);
      except
      end;
      exit;
    end;
  if self.staffinfo.FieldByName('r_staffinfo.delrecy').AsString='1' then
    self.N32.Enabled:=true
    else
    self.N32.Enabled:=false;
end;

procedure TMain.cxGrid1DBTableView1SelectionChanged(
  Sender: TcxCustomGridTableView);
begin
  if self.staffinfo.FieldByName('r_staffinfo.delrecy').AsString='1' then
    self.N32.Enabled:=true
    else
    self.N32.Enabled:=false;
end;

procedure TMain.N32Click(Sender: TObject);
var tmpid:string;
begin
  if Application.MessageBox('确认要恢复所选择的被删数据吗？','提示',MB_ICONinformation or MB_YESNO )=IDNO then exit;
  tmpid:=self.staffinfo.fieldbyname('r_staffinfo.id').AsString;
  self.stafftable.Close;
  self.stafftable.Filtered:=false;
  self.stafftable.Filter:=format('id'+'='+'''%s''',[tmpid]);
  self.stafftable.Filtered:=true;
  self.stafftable.Open;
  self.stafftable.edit;
  self.stafftable.FieldByName('delrecy').AsString:='0';
  self.stafftable.Post;
  self.stafftable.Close;
  self.staffinfo.Close;
  self.staffinfo.Open;
end;

procedure TMain.FormShow(Sender: TObject);
var xa,ya:longint;
    stra,strb:string;
begin
xa:=GetSystemMetrics(SM_CXSCREEN);
Str(xa,stra);
ya:=GetSystemMetrics(SM_CySCREEN);
Str(ya,strb);
  try
  self.dxDBTreeView1.OnClick(self);
  except
  end;
  self.dxDBTreeView1.FullExpand;
  self.dxDBTreeView1.SetFocus;
  self.TabSheet9.TabVisible:=false;
  if self.ReadDataControl='1' then
      self.ToolBar1.Visible:=true
    else
      self.ToolBar1.Visible:=false;
  if self.ReadSheet='1' then
      self.tbsFormatting.Visible:=true
    else
      self.tbsFormatting.Visible:=false;
  if self.ReadStyle='1' then
      self.cxSpreadSheetBook1.PainterType:=ptOffice97Style
    else
      self.cxSpreadSheetBook1.PainterType:=ptOfficeXPStyle;
  try
    Agent1.Characters.Load('myagent', ExtractFilePath(ParamStr(0))+'dot.acs');
    myagent:=Agent1.Characters.Character('myagent');
    myagent.Left:=strtoint(stra)-80;
    myagent.Top:=strtoint(strb)-80;
    myagent.MoveTo(100,500,100);
  except
  end;
  if self.Readeidolon='1' then
    begin
      self.N136.Checked:=true;
      try
        myagent.Show(0);
        myagent.Play('Wave');
        myagent.Speak('欢迎使用RedHr-Office'+#13,'');
        myagent.Play('LookLeft');
        myagent.Speak('今天是'+FormatDateTime('dddddd',now),'');
        myagent.Play('LookLeft');
        myagent.Hide(0);
      except
      end;
    end
    else
      self.N136.Checked:=false;
end;

procedure TMain.FormResize(Sender: TObject);
begin
  self.PageControl1.Height:=(self.Height-60) div 2;
end;

procedure TMain.N46Click(Sender: TObject);
begin
  postedit:=tpostedit.create(application);
  postedit.showmodal;
  self.r_staffpost.Refresh;
end;

procedure TMain.N42Click(Sender: TObject);
begin
  if self.staffinfo.RecordCount=0 then exit;
  self.PageControl1.ActivePageIndex:=0;
  changepost:=tchangepost.create(application);
  changepost.etype:=1;
  changepost.showmodal;
  self.stachpostedit.Close;
  self.stachpostedit.Open;
  self.r_staffpost.Close;
  self.r_staffpost.Open;
end;

procedure TMain.N45Click(Sender: TObject);
begin
  if self.staffinfo.RecordCount=0 then exit;
  if self.stachpostedit.Active=false then exit;
  if self.stachpostedit.RecordCount=0 then exit;
  if Application.MessageBox('确认要删除所选择的职位变动记录吗？','提示',MB_YESNO )=IDYES then
    begin
      self.stachpostedit.Delete;
      self.stachpostedit.Close;
      self.stachpostedit.Open;
    end;
end;

procedure TMain.N44Click(Sender: TObject);
var tmpid:string;
begin
  if self.staffinfo.RecordCount=0 then exit;
  if self.stachpostedit.Active=false then exit;
  if self.stachpostedit.RecordCount=0 then exit;
  changepost:=tchangepost.create(application);
  tmpid:=self.stachpostedit.fieldbyname('postid').AsString;
  changepost.etype:=2;
  changepost.Label1.Caption:='现职位';
  changepost.GroupBox1.Enabled:=false;
  changepost.dxLookupTreeView1.Enabled:=false;
  self.tmpquery.Close;
  self.tmpquery.SQL.Clear;
  self.tmpquery.SQL.Add('select * from r_staffpost');
  self.tmpquery.Filtered:=false;
  self.tmpquery.Filter:=format('id'+'='+'''%s''',[tmpid]);
  self.tmpquery.Filtered:=true;
  self.tmpquery.Open;
  changepost.dxLookupTreeView1.Text:=self.tmpquery.fieldbyname('postname').AsString;
  changepost.DateTimePicker1.Date:=self.stachpostedit.fieldbyname('postdate').AsDateTime;
  changepost.Memo1.Lines.Text:=self.stachpostedit.fieldbyname('memo').AsVariant;
  changepost.showmodal;
  self.stachpostedit.Close;
  self.stachpostedit.Open;
end;

procedure TMain.N20Click(Sender: TObject);
begin
  corpmessage:=tcorpmessage.create(application);
  corpmessage.showmodal;
end;

procedure TMain.N48Click(Sender: TObject);
var tmpid:string;
begin

      if self.staffinfo.RecordCount=0 then exit;
      tmpid:=self.staffinfo.fieldbyname('r_staffinfo.id').AsString;
      RepStaffinfo:=tRepStaffinfo.create(application);
      RepStaffinfo.ADOQuery2.Close;
      RepStaffinfo.ADOQuery2.SQL.Clear;
      RepStaffinfo.ADOQuery2.SQL.Add('select * from r_usercorp');
      RepStaffinfo.ADOQuery2.Open;
      RepStaffinfo.QRLabel2.Caption:=RepStaffinfo.ADOQuery2.fieldbyname('username').AsString+'员工资料卡';
      RepStaffinfo.QRLabel1.Caption:='联系电话：'+RepStaffinfo.ADOQuery2.fieldbyname('tel').AsString
                                  +'　　　传真号码：'+RepStaffinfo.ADOQuery2.fieldbyname('fax').AsString
                                  +'　　　通讯地址：'+RepStaffinfo.ADOQuery2.fieldbyname('add').AsString;
      RepStaffinfo.ADOQuery1.Close;
      RepStaffinfo.ADOQuery1.SQL.Clear;
      RepStaffinfo.ADOQuery1.SQL.Add('select * from r_staffinfo,r_staffclasscode,r_staffbranch where 1=1');
      RepStaffinfo.ADOQuery1.SQL.Add(' and r_staffinfo.classcodeID=r_staffclasscode.id');
      RepStaffinfo.ADOQuery1.SQL.Add(' and r_staffinfo.branchid=r_staffbranch.id');
      RepStaffinfo.ADOQuery1.Filtered:=false;
      RepStaffinfo.ADOQuery1.Filter:=format('r_staffinfo.id'+'='+'''%s''',[tmpid]);
      RepStaffinfo.ADOQuery1.Filtered:=true;
      RepStaffinfo.ADOQuery1.Open;
      RepStaffinfo.QuickRep1.Preview;

end;

procedure TMain.dxDBTreeView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var tmpid:string;
begin
  tmpid:=self.branch.fieldbyname('id').AsString;
  self.staffinfo.Close;
  self.staffinfo.SQL.Text:=self.sqlstring;
  self.staffinfo.Filtered:=false;
  self.staffinfo.Filter:=format('branchid'+'='+'''%s''',[tmpid]);
  self.staffinfo.Filtered:=true;
  self.staffinfo.Open;
end;

procedure TMain.N51Click(Sender: TObject);
begin
  if self.staffinfo.RecordCount=0 then exit;
  if self.r_staffbranchedit.Active=false then exit;
  if self.r_staffbranchedit.RecordCount=0 then exit;
  if Application.MessageBox('确认要删除所选择员工的部门变动记录吗？','提示',MB_YESNO )=IDYES then
    begin
      self.r_staffbranchedit.Delete;
      self.r_staffbranchedit.Close;
      self.r_staffbranchedit.Open;
    end;
end;

procedure TMain.N49Click(Sender: TObject);
begin
  if self.staffinfo.RecordCount=0 then exit;
  if self.r_staffbranchedit.Active=false then exit;
  if self.r_staffbranchedit.RecordCount=0 then exit;
  branmessage := tbranmessage.create(application);
  self.r_staffbranchedit.Edit;
  branmessage.showmodal;
  self.r_staffbranchedit.Close;
  self.r_staffbranchedit.Open;
end;

procedure TMain.N54Click(Sender: TObject);
begin
  if self.staffinfo.RecordCount=0 then exit;
  if self.r_staffpict.Active=false then exit;
  if self.r_staffpict.RecordCount=0 then exit;
  if Application.MessageBox('确认要删除所选择的图片资料吗？','提示',MB_YESNO )=IDYES then
    begin
      self.r_staffpict.Delete;
      self.r_staffpict.Close;
      self.r_staffpict.Open;
    end;
end;

procedure TMain.N52Click(Sender: TObject);
begin
  if self.staffinfo.RecordCount=0 then exit;
  showpic:=tshowpic.create(application);
  self.r_staffpict.Append;
  showpic.showmodal;
  self.r_staffpict.Close;
  self.r_staffpict.Open;
end;

procedure TMain.N56Click(Sender: TObject);
begin
  if self.staffinfo.RecordCount=0 then exit;
  payedit:=tpayedit.create(application);
  payedit.etype:=1;
  self.PageControl1.ActivePageIndex:=2;
  self.r_staffpay.Append;
  payedit.showmodal;
  self.r_staffpay.Close;
  self.r_staffpay.Open;
end;

procedure TMain.cxGrid5DBTableView1DblClick(Sender: TObject);
begin
  if self.staffinfo.RecordCount=0 then exit;
  payedit:=tpayedit.Create(application);
  self.r_staffpay.Edit;
  payedit.etype:=2;
  payedit.ShowModal;
  self.r_staffpay.Close;
  self.r_staffpay.Open;
end;

procedure TMain.N58Click(Sender: TObject);
begin
  if self.staffinfo.RecordCount=0 then exit;
  if self.r_staffpay.Active=false then exit;
  if self.r_staffpay.RecordCount=0 then exit;
  if Application.MessageBox('确认要删除所选择的薪资福利计算规则吗？','提示',MB_YESNO )=IDYES then
    begin
      self.r_staffpay.Delete;
      self.r_staffpay.Close;
      self.r_staffpay.Open;
    end;
end;

procedure TMain.N60Click(Sender: TObject);
var i,j,k:integer;
begin
 // if self.staffinfo.Active<>true then self.staffinfo.Active:=true;
  if self.staffinfo.RecordCount=0 then exit;
  //if self.N85.Checked=false then
  //  else
  //  begin
  //    if trim(self.demofile)='' then
  //      begin
  //        MessageBox(handle,'您未选择模版！','错误',MB_ICONERROR or MB_OK);
  //        exit;
  //      end;
  //  end;
  if self.demofile<>'' then
    begin
      try
        cxSpreadSheetBook1.LoadFromFile(self.demofile);
        self.tmpstaffid:=self.staffinfo.fieldbyname('r_staffinfo.id').AsString;
        self.cxSpreadSheetBook1.ActiveSheet.ReadOnly:=false;
        self.cxSpreadSheetBook1.ReadOnly:=false;
        //self.cxSpreadSheetBook1.PageCount:=1;
        //self.cxSpreadSheetBook1.ActivePage:=0;
        self.TabSheet8.tabVisible:=true;
        self.N67.Checked:=false;
        if self.N87.Checked=true then
          self.PageControl1.ActivePageIndex:=7;
        for k:=0 to self.cxSpreadSheetBook1.PageCount-1 do
          begin
            self.cxSpreadSheetBook1.ActivePage:=k;
            for i:=1 to self.cxSpreadSheetBook1.ActiveSheet.ColumnCount do
              begin
                for j:=1 to self.cxSpreadSheetBook1.ActiveSheet.RowCount do
                  begin
                    if cxSpreadSheetBook1.ActiveSheet.GetCellObject(i,j).Text=self.ReadStencil[1] then
                      SetCellText(i,j,self.staffinfo.fieldbyname('name').AsString);
                    if cxSpreadSheetBook1.ActiveSheet.GetCellObject(i,j).Text=self.ReadStencil[2] then
                      SetCellText(i,j,self.staffinfo.fieldbyname('sex').AsString);
                    if cxSpreadSheetBook1.ActiveSheet.GetCellObject(i,j).Text=self.ReadStencil[3] then
                      SetCellText(i,j,self.staffinfo.fieldbyname('ename').AsString);
                    if cxSpreadSheetBook1.ActiveSheet.GetCellObject(i,j).Text=self.ReadStencil[4] then
                      SetCellText(i,j,self.staffinfo.fieldbyname('ifmarriage').AsString);
                    if cxSpreadSheetBook1.ActiveSheet.GetCellObject(i,j).Text=self.ReadStencil[5] then
                      SetCellText(i,j,datetostr(strtodate(datetostr(self.staffinfo.fieldbyname('birthday').AsDateTime))));
                    if cxSpreadSheetBook1.ActiveSheet.GetCellObject(i,j).Text=self.ReadStencil[6] then
                      SetCellText(i,j,self.staffinfo.fieldbyname('Nativeplace').AsString);
                    if cxSpreadSheetBook1.ActiveSheet.GetCellObject(i,j).Text=self.ReadStencil[7] then
                      SetCellText(i,j,self.staffinfo.fieldbyname('Nationality').AsString);
                    if cxSpreadSheetBook1.ActiveSheet.GetCellObject(i,j).Text=self.ReadStencil[8] then
                      SetCellText(i,j,self.staffinfo.fieldbyname('idnum').AsString);
                    if cxSpreadSheetBook1.ActiveSheet.GetCellObject(i,j).Text=self.ReadStencil[9] then
                      SetCellText(i,j,self.staffinfo.fieldbyname('Residence').AsString);
                    if cxSpreadSheetBook1.ActiveSheet.GetCellObject(i,j).Text=self.ReadStencil[10] then
                      SetCellText(i,j,self.staffinfo.fieldbyname('knowledge').AsString);
                    if cxSpreadSheetBook1.ActiveSheet.GetCellObject(i,j).Text=self.ReadStencil[11] then
                      SetCellText(i,j,self.staffinfo.fieldbyname('School').AsString);
                    if cxSpreadSheetBook1.ActiveSheet.GetCellObject(i,j).Text=self.ReadStencil[12] then
                      SetCellText(i,j,self.staffinfo.fieldbyname('forlang').AsString);
                    if cxSpreadSheetBook1.ActiveSheet.GetCellObject(i,j).Text=self.ReadStencil[13] then
                      SetCellText(i,j,self.staffinfo.fieldbyname('howforlang').AsString);
                    if cxSpreadSheetBook1.ActiveSheet.GetCellObject(i,j).Text=self.ReadStencil[15] then
                      SetCellText(i,j,self.staffinfo.fieldbyname('exigenceman').AsString);
                    if cxSpreadSheetBook1.ActiveSheet.GetCellObject(i,j).Text=self.ReadStencil[14] then
                      SetCellText(i,j,self.staffinfo.fieldbyname('Telephone').AsString);
                    if cxSpreadSheetBook1.ActiveSheet.GetCellObject(i,j).Text=self.ReadStencil[16] then
                      SetCellText(i,j,self.staffinfo.fieldbyname('Address').AsString);
                    if cxSpreadSheetBook1.ActiveSheet.GetCellObject(i,j).Text=self.ReadStencil[17] then
                      SetCellText(i,j,self.staffinfo.fieldbyname('email').AsString);
                  end;
              end;
          end;
        self.cxSpreadSheetBook1.ActivePage:=0;
        exit;
      except
        MessageBox(handle,'打开模版失败，请重新载入！','错误',MB_ICONERROR or MB_OK);
        self.StatusBar1.Panels[2].Text:='';
      end;
    end;
  self.cxSpreadSheetBook1.ActiveSheet.ClearAll;
  self.tmpstaffid:=self.staffinfo.fieldbyname('r_staffinfo.id').AsString;
  self.cxSpreadSheetBook1.ActiveSheet.ReadOnly:=false;
  self.cxSpreadSheetBook1.ReadOnly:=false;
  self.cxSpreadSheetBook1.PageCount:=1;
  self.cxSpreadSheetBook1.ActivePage:=0;
  if self.TabSheet8.TabVisible=false then TabSheet8.tabVisible:=true;
  self.N67.Checked:=false;
  self.cxSpreadSheetBook1.DefaultStyle.Font.Name:='宋体';
  self.cxSpreadSheetBook1.DefaultStyle.Font.Size:=9;
  self.cxSpreadSheetBook1.BeginUpdate;

  (*    建立数据表    *)
  SetCellText(1,1,'姓　　名');
  SetCellText(2,1,self.staffinfo.fieldbyname('name').AsString);
  SetCellText(3,1,'性　　别');
  SetCellText(4,1,self.staffinfo.fieldbyname('sex').AsString);
  SetCellText(5,1,'英文名');                          
  SetCellText(6,1,self.staffinfo.fieldbyname('ename').AsString);
  SetCellText(1,2,'婚　　否');
  SetCellText(2,2,self.staffinfo.fieldbyname('ifmarriage').AsString);
  SetCellText(3,2,'出生日期');
  SetCellText(4,2,datetostr(strtodate(datetostr(self.staffinfo.fieldbyname('birthday').AsDateTime))));
  SetCellText(1,3,'籍　　贯');
  SetCellText(2,3,self.staffinfo.fieldbyname('Nativeplace').AsString);
  SetCellText(3,3,'民　　族');
  SetCellText(4,3,self.staffinfo.fieldbyname('Nationality').AsString);
  SetCellText(1,4,'身份证号码');
  SetCellText(2,4,self.staffinfo.fieldbyname('idnum').AsString);
  SetCellText(3,4,'户口所在地');
  SetCellText(4,4,self.staffinfo.fieldbyname('Residence').AsString);
  SetCellText(1,5,'学　　历');
  SetCellText(2,5,self.staffinfo.fieldbyname('knowledge').AsString);
  SetCellText(3,5,'毕业院校');
  SetCellText(4,5,self.staffinfo.fieldbyname('School').AsString);
  SetCellText(1,6,'外语语种');
  SetCellText(2,6,self.staffinfo.fieldbyname('forlang').AsString);
  SetCellText(3,6,'外语程度');
  SetCellText(4,6,self.staffinfo.fieldbyname('howforlang').AsString);
  SetCellText(1,7,'紧急联系人');
  SetCellText(2,7,self.staffinfo.fieldbyname('exigenceman').AsString);
  SetCellText(3,7,'紧急联系电话');
  SetCellText(4,7,self.staffinfo.fieldbyname('exigencephone').AsString);
  SetCellText(1,8,'联系电话');
  SetCellText(2,8,self.staffinfo.fieldbyname('Telephone').AsString);
  SetCellText(3,8,'联系地址');
  SetCellText(4,8,self.staffinfo.fieldbyname('Address').AsString);
  SetCellText(1,9,'电子信箱');
  SetCellText(2,9,self.staffinfo.fieldbyname('Email').AsString);
  self.cxSpreadSheetBook1.Recalc;
  self.cxSpreadSheetBook1.EndUpdate;
  //self.cxSpreadSheetBook1.ActiveSheet.SelectCell(0,0,false);
  if self.N87.Checked=true then
      self.PageControl1.ActivePageIndex:=7;
end;

procedure TMain.N61Click(Sender: TObject);
begin
  with cxSpreadSheetBook1.ActiveSheet do
    Copy(SelectionRect, True);
end;

procedure TMain.N62Click(Sender: TObject);
begin
  with cxSpreadSheetBook1.ActiveSheet do
    Copy(SelectionRect, False);
end;

procedure TMain.N63Click(Sender: TObject);
begin
  with cxSpreadSheetBook1.ActiveSheet do
    Paste(SelectionRect.TopLeft);
end;

procedure TMain.N65Click(Sender: TObject);
begin
  self.TabSheet8.TabVisible:=false;
end;

procedure TMain.N67Click(Sender: TObject);
begin
  if self.N67.Checked=true then
    begin
      self.cxSpreadSheetBook1.ReadOnly:=false;
      self.cxSpreadSheetBook1.ActiveSheet.ReadOnly:=false;
      self.N67.Checked:=false;
    end
    else
    begin
      self.cxSpreadSheetBook1.ReadOnly:=true;
      self.cxSpreadSheetBook1.ActiveSheet.ReadOnly:=true;
      self.N67.Checked:=true;
    end;
end;

procedure TMain.N69Click(Sender: TObject);
begin
  cxSpreadSheetBook1.History.Undo(1);
end;

procedure TMain.N70Click(Sender: TObject);
begin
  cxSpreadSheetBook1.History.redo(1);
end;

procedure TMain.Splitter1Moved(Sender: TObject);
begin
  if self.dxDBTreeView1.Width<1 then self.dxDBTreeView1.Width:=1;
end;

procedure TMain.actNewExecute(Sender: TObject);
begin
  NewSheet;
  self.StatusBar1.Panels[2].Text:='';
end;

procedure TMain.actSaveSpeadSheetExecute(Sender: TObject);
var
  AFileName: string;
begin
  self.SaveDialog1.DefaultExt:='*.xls';
  self.SaveDialog1.Filter:='Excel文件|*.xls';
  if SaveDialog1.Execute then
  begin
    AFileName := ChangeFileExt(SaveDialog1.FileName, '.xls');
    cxSpreadSheetBook1.SaveToFile(AFileName);
    self.StatusBar1.Panels[2].Text:='文件：'+afilename;
  end;
end;

procedure TMain.actCutExecute(Sender: TObject);
begin
  self.N61.OnClick(self);
end;

procedure TMain.actCopyExecute(Sender: TObject);
begin
  self.N62.OnClick(self);
end;

procedure TMain.actPasteExecute(Sender: TObject);
begin
  self.N63.OnClick(self);
end;

procedure TMain.tbUndoClick(Sender: TObject);
begin
  self.N69.OnClick(self);
end;

procedure TMain.ToolButton21Click(Sender: TObject);
begin
  self.N70.OnClick(self);
end;

procedure TMain.actCellLeftAlignExecute(Sender: TObject);
begin
  SetCellsStyle([svAlign], haLeft, 0, cbxFont.Text, []);
end;

procedure TMain.actCellCenterAlignExecute(Sender: TObject);
begin
  SetCellsStyle([svAlign], haCenter, 0, cbxFont.Text, []);
end;

procedure TMain.actCellRightAlignExecute(Sender: TObject);
begin
  SetCellsStyle([svAlign], haRight, 0, cbxFont.Text, []);
end;

procedure TMain.cbxFontChange(Sender: TObject);
begin
  SetCellsStyle([svFontName], haGeneral, 0, cbxFont.Text, []);
end;

procedure TMain.cbxSizeChange(Sender: TObject);
var
  ASize: Integer;
begin
  if cxTryStrToInt(cbxSize.Text, ASize) then
    SetCellsStyle([svSize], haGeneral, ASize, cbxFont.Text, []);
end;

procedure TMain.actBoldExecute(Sender: TObject);
begin
  SetTokenStyle(tbBold, svBold, fsBold);
end;

procedure TMain.actItalicExecute(Sender: TObject);
begin
  SetTokenStyle(tbItalic, svItalic, fsItalic);
end;

procedure TMain.actUnderlineExecute(Sender: TObject);
begin
  SetTokenStyle(tbUnderline, svUnderline, fsUnderline);
end;

procedure TMain.actStrikeOutExecute(Sender: TObject);
begin
  SetTokenStyle(tbStrikeOut, svStrikeOut, fsStrikeOut);
end;

procedure TMain.actMergeCellsExecute(Sender: TObject);
begin
  with cxSpreadSheetBook1.ActiveSheet do
    SetMergedState(SelectionRect, True);
end;

procedure TMain.actSplitCellsExecute(Sender: TObject);
begin
  with cxSpreadSheetBook1.ActiveSheet do
    SetMergedState(SelectionRect, False);
end;

procedure TMain.actSortAscendingExecute(Sender: TObject);
const
  ASortType: array[0..1] of TcxSortType = (stAscending, stDescending);
begin
  with cxSpreadSheetBook1.ActiveSheet do
    Sort(SelectionRect, [ASortType[TCustomAction(Sender).Tag]]);
end;

procedure TMain.tbBorderStyleClick(Sender: TObject);
var
  ARect: TRect;
begin
  ARect := tbBorderStyle.BoundsRect;
  ARect.TopLeft := tbsFormatting.ClientToScreen(ARect.TopLeft);
  ARect.BottomRight := tbsFormatting.ClientToScreen(ARect.BottomRight);
  tbBorderStyle.Down := True;
  pmBorders.Popup(ARect.Left, ARect.Bottom);
  tbBorderStyle.Down := False;
end;

procedure TMain.MenuItem1DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
  if Selected then
    ACanvas.Brush.Color := clHighLight
  else
    ACanvas.Brush.Color := clMenu;
  ACanvas.Brush.Style := bsSolid;
  ACanvas.FillRect(ARect);
  imgBordersImages.Draw(ACanvas, ARect.Left + 2, ARect.Top + 2, (Sender as TMenuItem).ImageIndex);
end;

procedure TMain.MenuItem1MeasureItem(Sender: TObject; ACanvas: TCanvas;
  var Width, Height: Integer);
begin
  Width := 14;
  Height := 24;
end;

procedure TMain.MenuItem1Click(Sender: TObject);
var
  ARect: TRect;
  AKey, I: Integer;
const
  AOutBorders: array[0..11, TcxSSEdgeBorder] of TcxSSEdgeLineStyle =
    ((lsDefault, lsDefault, lsDefault, lsDefault),
     (lsNone, lsNone, lsNone, lsDouble),
     (lsNone, lsThin, lsNone, lsThick),
     (lsNone, lsNone, lsNone, lsThin),
     (lsNone, lsNone, lsNone, lsThick),
     (lsThin, lsThin, lsThin, lsThin),
     (lsThin, lsNone, lsNone, lsNone),
     (lsNone, lsThin, lsNone, lsThin),
     (lsThin, lsThin, lsThin, lsThin),
     (lsNone, lsNone, lsThin, lsNone),
     (lsNone, lsThin, lsNone, lsDouble),
     (lsThick, lsThick, lsThick, lsThick));

  AInBorders: array[Boolean] of TcxSSEdgeLineStyle = (lsDefault, lsThin);

  procedure SetHorzStyle(ARow: Integer; AStyle: TcxSSEdgeLineStyle);
  var
    I: Integer;
  begin
    if AStyle <> lsNone then
    begin
      for I := ARect.Left to ARect.Right do
      begin
        with cxSpreadSheetBook1.ActiveSheet.GetCellObject(I, ARow) do
        try
          Style.Borders[eTop].Style := AStyle;
        finally
          Free;
        end;
      end;
    end;
  end;

  procedure SetVertStyle(ACol: Integer; AStyle: TcxSSEdgeLineStyle);
  var
    I: Integer;
  begin
    if AStyle <> lsNone then
    begin
      for I := ARect.Top to ARect.Bottom do
      begin
        with cxSpreadSheetBook1.ActiveSheet.GetCellObject(ACol, I) do
        try
          Style.Borders[eLeft].Style := AStyle;
        finally
          Free;
        end;
      end;
    end;
  end;

begin
  cxSpreadSheetBook1.BeginUpdate;
  try
    ARect := cxSpreadSheetBook1.ActiveSheet.SelectionRect;
    AKey := (Sender as TMenuItem).ImageIndex;
    SetVertStyle(ARect.Left, AOutBorders[AKey, eLeft]);
    SetHorzStyle(ARect.Top, AOutBorders[AKey, eTop]);
    SetVertStyle(ARect.Right + 1, AOutBorders[AKey, eRight]);
    SetHorzStyle(ARect.Bottom + 1, AOutBorders[AKey, eBottom]);
    for I := ARect.Top + 1 to ARect.Bottom do
      SetHorzStyle(I, AInBorders[AKey = 5]);
    for I := ARect.Left + 1 to ARect.Right do
      SetVertStyle(I, AInBorders[AKey = 5]);
  finally
    cxSpreadSheetBook1.EndUpdate;
    cxSpreadSheetBook1.UpdateControl;
  end;
end;

procedure TMain.actSumExecute(Sender: TObject);
begin
  CalculateSummary(TComponent(Sender).Tag);
end;

procedure TMain.N73Click(Sender: TObject);
begin
  with cxSpreadSheetBook1 do
    ActiveSheet.InsertCells(ActiveSheet.SelectionRect, msAllRow);
end;

procedure TMain.N74Click(Sender: TObject);
begin
  with cxSpreadSheetBook1 do
    ActiveSheet.InsertCells(ActiveSheet.SelectionRect, msAllCol);
end;

procedure TMain.N72Click(Sender: TObject);
begin
  cxspreadsheetbook1.AddSheetPage();
end;

procedure TMain.N77Click(Sender: TObject);
begin
  with cxspreadsheetbook1.ActiveSheet do
    begin
      InsertCells(SelectionRect, msShiftCol);
    end;
end;

procedure TMain.N78Click(Sender: TObject);
begin
  with cxspreadsheetbook1.ActiveSheet do
    begin
      InsertCells(SelectionRect, msShiftRow);
    end;
end;

procedure TMain.N79Click(Sender: TObject);
begin
  with cxspreadsheetbook1.ActiveSheet do
    begin
      InsertCells(SelectionRect, msAllRow);
    end;
end;

procedure TMain.cxSpreadSheetBook1ActiveSheetChanging(
  Sender: TcxCustomSpreadSheetBook; const ActiveSheet: Integer;
  var CanSelect: Boolean);
begin
  if self.cxSpreadSheetBook1.ActiveSheet.ReadOnly=true then
    self.N67.Checked:=false
    else
    self.N67.Checked:=true;
end;

procedure TMain.N83Click(Sender: TObject);
begin
  //...将数据表中内容存回至数据库中...
  if trim(self.tmpstaffid)='' then
    begin
      MessageBox(handle,'选择此项保存前请先读入数据库中数据至表格，并编辑！','错误',MB_ICONERROR or MB_OK);
      exit;
    end;
  if trim(self.cxSpreadSheetBook1.ActiveSheet.GetCellObject(1,0).text)='' then
    begin
      MessageBox(handle,'＂姓名＂选项错误！','错误',MB_ICONERROR or MB_OK);
      self.cxSpreadSheetBook1.ActiveSheet.SelectCell(1,0,true);
      exit;
    end;
  self.tmpado.TableName:='r_staffinfo';
  self.tmpado.IndexName:='ID';
  self.tmpado.Filtered:=false;
  self.tmpado.Filter:=format('id'+'='+'''%s''',[self.tmpstaffid]);
  self.tmpado.Filtered:=true;
  self.tmpado.Open;
  self.tmpado.Edit;
  self.tmpado.FieldByName('name').AsString:=self.cxSpreadSheetBook1.ActiveSheet.GetCellObject(1,0).text;
  self.tmpado.Post;
  self.tmpado.Close;
  //...........以下是刷新..........
  self.staffinfo.Close;
  self.staffinfo.Open;
end;

procedure TMain.cxGrid1DBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
  self.N60.OnClick(self);  
end;

procedure TMain.N85Click(Sender: TObject);
begin
  if self.N85.Checked=true then
    self.N85.Checked:=false
    else
    self.N85.Checked:=true;
end;

procedure TMain.N84Click(Sender: TObject);
begin
  if self.OpenDialog1.Execute then
    begin
      self.demofile:=self.OpenDialog1.FileName;
      self.cxSpreadSheetBook1.LoadFromFile(self.demofile);
      self.StatusBar1.Panels[2].Text:='应用模版：'+self.demofile;
    end;
end;

procedure TMain.N86Click(Sender: TObject);
begin
  self.demofile:='';
  self.StatusBar1.Panels[2].Text:='';
  self.cxSpreadSheetBook1.ActiveSheet.ClearAll;
  self.cxSpreadSheetBook1.PageCount:=1;
  self.cxSpreadSheetBook1.DefaultStyle.Font.Name:='宋体';
  self.cxSpreadSheetBook1.DefaultStyle.Font.Size:=9;
end;

procedure TMain.N87Click(Sender: TObject);
begin
  if self.N87.Checked=true then
      self.N87.Checked:=false
    else
      self.N87.Checked:=true;
end;

procedure TMain.cxGrid1DBTableView1Editing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  self.N60.OnClick(self);
end;

procedure TMain.cxGrid1DBTableView1EditChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
  self.N60.OnClick(self);
end;

procedure TMain.N89Click(Sender: TObject);
begin
  if self.OpenDialog1.Execute then
    begin
      try
      self.TabSheet8.TabVisible:=true;
      self.PageControl1.ActivePageIndex:=7;
      self.demofile:=self.OpenDialog1.FileName;
      self.cxSpreadSheetBook1.LoadFromFile(self.demofile);
      self.StatusBar1.Panels[2].Text:='文件：'+self.demofile;
      except
      end
    end;
end;

procedure TMain.N27Click(Sender: TObject);
begin
  logo:=tlogo.create(application);
  logo.showmodal;
end;

procedure TMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  //..取出系统临时文件夹
  function GetTempDirectory: String;
  var
    TempDir: array[0..255] of Char;
  begin
    GetTempPath(255, @TempDir);
    Result := StrPas(TempDir);
  end;
var tmpstr:string;
    CurCursor : TCursor;
    inini:tinifile;
begin
  if main.iflogin='N' then
    begin
      tmpstr:=gettempdirectory;
      self.ADOconn.Close;
      deletefile(tmpstr+systmpdate);
      exit;
    end;
  self.SaveForm(main);
  inIni:= TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  with inIni do
    begin
      if self.N136.Checked=true then
        begin
          WriteString('System', 'eidolon', '1');
        end
        else
        begin
          WriteString('System', 'eidolon', '0');
        end;
    end;
  inini.Free;
  if self.ReadAutoMessage<>'1' then
    begin
      if self.ReadSaveOut='1' then
        begin
          CurCursor := Screen.Cursor;
          Screen.Cursor := crHourGlass;
          tmpstr:=gettempdirectory;
          mess:=tmess.Create(application);
          mess.panel1.Caption:='正在保存数据，请稍後...';
          mess.Timer1.Enabled:=true;
          mess.panel1.Visible:=true;
          mess.Show;
          mess.Refresh;
          try
            self.ADOconn.Close;
            //..加密数据库
            EncryptIt.EncryptFile(tmpstr+systmpdate,ExtractFilePath(ParamStr(0)) + 'hrdata.dat',0611);
            deletefile(tmpstr+systmpdate);
          except
            Screen.Cursor := CurCursor;
            MessageBox(handle,'关闭程序出错！','错误',MB_ICONERROR or MB_OK);
          end;
          Screen.Cursor := CurCursor;          
        end;
      exit;
    end;
  case Application.MessageBox('将要退出RedHr-Office，是否保存修改？','提示',MB_ICONQUESTION or MB_YESNOCANCEL) of
    IDNO: //不保存
      begin
        try
          self.ADOconn.Close;
        except
        end;
          tmpstr:=gettempdirectory;
          deletefile(tmpstr+systmpdate);
          exit;
      end;
    IDCANCEL:  //取消,回到窗口
      BEGIN
        CanClose:=False;
      END;
    IDYES:     //确定并保存
      BEGIN
        CurCursor := Screen.Cursor;
        Screen.Cursor := crHourGlass;
        tmpstr:=gettempdirectory;
        mess:=tmess.Create(application);
        mess.panel1.Caption:='正在保存数据，请稍後...';
        mess.Timer1.Enabled:=true;
        mess.panel1.Visible:=true;
        mess.Show;
        mess.Refresh;
        self.SaveForm(main);
        try
          self.ADOconn.Close;
          //..加密数据库
          EncryptIt.EncryptFile(tmpstr+systmpdate,ExtractFilePath(ParamStr(0)) + 'hrdata.dat',0611);
          deletefile(tmpstr+systmpdate);
        except
          Screen.Cursor := CurCursor;
          MessageBox(handle,'关闭程序出错！','错误',MB_ICONERROR or MB_OK);
        end;
        Screen.Cursor := CurCursor;
      end;       
    end;
end;

procedure TMain.N2Click(Sender: TObject);
var
  AFileName: string;
begin
  self.SaveDialog1.DefaultExt:='*.dat';
  self.SaveDialog1.Filter:='数据库文件|*.dat';
  if SaveDialog1.Execute then
  begin
    AFileName := ChangeFileExt(SaveDialog1.FileName, '.dat');
    if FileExists(AFileName)=false then
    copyfile(pchar('hrdata.dat'), pchar(AFileName), false);    
  end;
end;

procedure TMain.N9Click(Sender: TObject);
begin
  zglx:=tzglx.create(application);
  zglx.showmodal;
end;

procedure TMain.N5Click(Sender: TObject);
begin
  try
    self.PrinterSetupDialog1.Execute;
  except
    MessageBox(handle,'您的操作系统没有设置打印机！','错误',MB_ICONERROR or MB_OK);
  end;
end;

procedure TMain.N25Click(Sender: TObject);
begin
ShellExecute(handle,nil,pchar('http://www.yoyour.com'),nil,nil,sw_shownormal);
end;

procedure TMain.ToolButton9Click(Sender: TObject);
begin
  self.staffinfo.Close;
  self.staffinfo.Filtered:=false;
  self.staffinfo.SQL.Clear;
  self.staffinfo.SQL.Add('select * from r_staffinfo,r_staffclasscode,r_staffbranch where r_staffinfo.delrecy='''+'0'+'''');
  self.staffinfo.SQL.Add(' and r_staffinfo.classcodeID=r_staffclasscode.id and r_staffinfo.branchid=r_staffbranch.id');
  self.staffinfo.SQL.Add(' and ( r_staffinfo.name like '''+'%'+self.cxTextEdit1.Text+'%'+'''');
  self.staffinfo.SQL.Add(' or r_staffinfo.staffid like '''+'%'+self.cxTextEdit1.Text+'%'+'''');
  self.staffinfo.SQL.Add(' or r_staffinfo.ifmarriage like '''+'%'+self.cxTextEdit1.Text+'%'+'''');
  self.staffinfo.SQL.Add(' or r_staffinfo.idnum like '''+'%'+self.cxTextEdit1.Text+'%'+'''');
  self.staffinfo.SQL.Add(' or r_staffinfo.sex like '''+'%'+self.cxTextEdit1.Text+'%'+'''');
  self.staffinfo.SQL.Add(' or r_staffinfo.Nationality like '''+'%'+self.cxTextEdit1.Text+'%'+'''');
  self.staffinfo.SQL.Add(' or r_staffinfo.Nativeplace like '''+'%'+self.cxTextEdit1.Text+'%'+'''');
  self.staffinfo.SQL.Add(' or r_staffinfo.Residence like '''+'%'+self.cxTextEdit1.Text+'%'+'''');
  self.staffinfo.SQL.Add(' or r_staffinfo.knowledge like '''+'%'+self.cxTextEdit1.Text+'%'+'''');
  self.staffinfo.SQL.Add(' or r_staffinfo.School like '''+'%'+self.cxTextEdit1.Text+'%'+'''');
  self.staffinfo.SQL.Add(' or r_staffinfo.forlang like '''+'%'+self.cxTextEdit1.Text+'%'+'''');
  self.staffinfo.SQL.Add(' or r_staffinfo.Address like '''+'%'+self.cxTextEdit1.Text+'%'+'''');
  self.staffinfo.SQL.Add(' or r_staffinfo.Telephone like '''+'%'+self.cxTextEdit1.Text+'%'+'''');
  self.staffinfo.SQL.Add(' or r_staffinfo.Email like '''+'%'+self.cxTextEdit1.Text+'%'+'''');
  self.staffinfo.SQL.Add(' or r_staffinfo.imemo like '''+'%'+self.cxTextEdit1.Text+'%'+'''');
  self.staffinfo.SQL.Add(' or r_staffinfo.ename like '''+'%'+self.cxTextEdit1.Text+'%'+'''');
  self.staffinfo.SQL.Add(' or r_staffinfo.intime like '''+'%'+self.cxTextEdit1.Text+'%'+'''');
  self.staffinfo.SQL.Add(' or r_staffinfo.birthday like '''+'%'+self.cxTextEdit1.Text+'%'+'''');
  self.staffinfo.SQL.Add(' or r_staffclasscode.classcodename like '''+'%'+self.cxTextEdit1.Text+'%'+'''');
  self.staffinfo.SQL.Add(' or r_staffclasscode.classcodememo like '''+'%'+self.cxTextEdit1.Text+'%'+'''');
  self.staffinfo.SQL.Add(' or r_staffbranch.branchname like '''+'%'+self.cxTextEdit1.Text+'%'+'''');
  self.staffinfo.SQL.Add(' or r_staffbranch.bmemo like '''+'%'+self.cxTextEdit1.Text+'%'+'''');
  self.staffinfo.SQL.Add(')');
  self.staffinfo.Open;
end;

procedure TMain.cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then { 判断是按执行键}
    begin
      self.ToolButton9.OnClick(self);
    end;
end;

procedure TMain.N3Click(Sender: TObject);
begin
  login:=tlogin.create(application);
  login.etype:=2;
  login.GroupBox1.Caption:='输入新口令';
  login.ADOTable1.Open;
  login.ADOTable1.Edit;
  login.showmodal;
end;

procedure TMain.FormActivate(Sender: TObject);
begin
  if self.iflogin='N' then
    begin
      login:=tlogin.create(application);
      login.etype:=1;
      login.ADOTable1.Open;
      login.showmodal;
    end;
end;

procedure TMain.N26Click(Sender: TObject);
begin
ShellExecute(handle,nil,pchar('help\help.chm'),nil,nil,sw_shownormal);
end;

procedure TMain.N14Click(Sender: TObject);
begin
  cardin:=tcardin.create(application);
  cardin.showmodal;
  if self.N16.Checked=true then
    begin
      self.Noset.Close;
      self.Noset.Open;
    end;
end;

procedure TMain.N16Click(Sender: TObject);
var tmpid:string;
begin
  if self.N16.Checked=false then
    begin
      tmpid:='-1';
      self.Noset.Close;
      self.Noset.Filtered:=false;
      self.Noset.SQL.Clear;
      self.Noset.SQL.Add('select * from r_staffinfo where delrecy='''+'0'+'''');
      self.Noset.Filtered:=false;
      self.Noset.Filter:=format('branchid'+'='+'''%s''',[tmpid]);
      self.Noset.Filtered:=true;
      self.Noset.Open;
      self.TabSheet9.TabVisible:=true;
      self.PageControl1.ActivePageIndex:=8;
      self.N16.Checked:=true;
    end
    else
    begin
      self.TabSheet9.TabVisible:=true;
      self.PageControl1.ActivePageIndex:=0;
      self.N16.Checked:=false;
      self.N107.OnClick(self);
    end;
end;

procedure TMain.cxGridDBTableView1DblClick(Sender: TObject);
begin
  if self.Noset.Active=false then exit;
  if self.Noset.RecordCount=0 then exit;
  main.tmpquery.Close;
  main.tmpquery.SQL.Clear;
  main.tmpquery.SQL.Add('select * from r_staffclasscode');
  main.tmpquery.Open;
  faddman:=tfaddman.create(application);
  faddman.PageControl1.ActivePageIndex:=0;
  faddman.etype:=3;
  faddman.Edit12.Text:=self.Noset.FieldByName('staffid').AsString;
  faddman.Edit1.Text:=self.Noset.FieldByName('name').AsString;                     //姓名
  faddman.ComboBox1.Text:=self.Noset.FieldByName('sex').AsString;                  //性别
  faddman.Edit2.Text:=self.Noset.FieldByName('ename').AsString;                    //英文名
  faddman.Edit3.Text:=self.Noset.FieldByName('idnum').AsString;                    //身份证号码
  faddman.DateTimePicker2.Date:=self.Noset.FieldByName('intime').AsDateTime;       //入职日期
  faddman.Edit9.Text:=self.Noset.FieldByName('Telephone').AsString;//联系电话
  faddman.Edit10.Text:=self.Noset.FieldByName('Address').AsString;//通讯地址
  faddman.Edit11.Text:=self.Noset.FieldByName('Email').AsString;//电子邮件
  //..打开窗口
  faddman.showmodal;
  self.staffinfo.Close;
  self.staffinfo.open;
  self.Noset.Close;
  self.Noset.open;
  self.r_staffbranchedit.Close;
  self.r_staffbranchedit.Open;
end;

procedure TMain.ToolButton5Click(Sender: TObject);
begin
  self.staffinfo.Close;
  self.staffinfo.Open;
  self.branch.Close;
  self.branch.Open;
  self.stachpostedit.Close;
  self.stachpostedit.Open;
  self.r_staffbranchedit.Close;
  self.r_staffbranchedit.Open;
  self.r_staffpost.Close;
  self.r_staffpost.Open;
  self.r_staffpict.Close;
  self.r_staffpict.Open;
  self.r_staffpay.Close;
  self.r_staffpay.Open;
end;

procedure TMain.N21Click(Sender: TObject);
begin
  if self.Noset.Active=false then exit;
  if self.Noset.RecordCount=0 then exit;
  if Application.MessageBox('确认要删除所选择的数据吗？','提示',MB_ICONQUESTION or MB_YESNO )=IDYES then
    begin
      self.Noset.Delete;
      self.Noset.Close;
      self.Noset.Open;
    end;
end;

procedure TMain.N90Click(Sender: TObject);
begin
  config:=tconfig.create(application);
  config.showmodal;
end;

procedure TMain.N1Click(Sender: TObject);
begin
  try
    WinExec('edithr.exe /?',SW_SHOWNORMAL);
  except
  end;
end;

procedure TMain.N4Click(Sender: TObject);
begin
  chartbm:=tchartbm.create(application);
  chartbm.showmodal;
end;

procedure TMain.N107Click(Sender: TObject);
begin
  if self.N107.Checked=false then
    begin
      self.Noset.Close;
      self.Noset.Filtered:=false;
      self.Noset.SQL.Clear;
      self.Noset.SQL.Add('select * from r_staffinfo where delrecy='''+'0'+'''');
      self.Noset.Open;
      self.TabSheet9.TabVisible:=true;
      self.PageControl1.ActivePageIndex:=8;
      self.N107.Checked:=true;
    end
    else
    begin
      self.TabSheet9.TabVisible:=true;
      self.PageControl1.ActivePageIndex:=0;
      self.N107.Checked:=false;
      self.n16.OnClick(self);
    end;
end;

procedure TMain.ColorBox1Change(Sender: TObject);
var i,j:integer;
begin
  with self.cxSpreadSheetBook1 do
    begin
      BeginUpdate;
        with ActiveSheet do
        begin
          for I := SelectionRect.Left to SelectionRect.Right do
            for J := SelectionRect.Top to SelectionRect.Bottom do
            with GetCellObject(I, J) do
              Style.Brush.BackgroundColor:=self.ColorBox1.Selected;
        end;
      EndUpdate;
      UpdateControl;
    end;
end;

procedure TMain.ToolButton6Click(Sender: TObject);
begin
  if self.ToolButton6.Down then
    screen.Cursor:=crhelp
    else
    screen.Cursor:=crdefault;
end;

procedure TMain.cxGrid1Click(Sender: TObject);
begin
  if self.ToolButton6.Down then
    begin
      ShellExecute(handle,nil,pchar('help\help.chm'),nil,nil,sw_shownormal);
      exit;
    end;
end;

procedure TMain.cxSpreadSheetBook1Click(Sender: TObject);
begin
  if self.ToolButton6.Down then
    begin
      ShellExecute(handle,nil,pchar('help\help.chm'),nil,nil,sw_shownormal);
      exit;
    end;
end;

procedure TMain.N7Click(Sender: TObject);
begin
  close
end;

procedure TMain.N113Click(Sender: TObject);
begin
  if self.r_staffpay.Active<>true then exit;
  if self.r_staffpay.RecordCount=0 then exit;
  if self.staffinfo.RecordCount=0 then exit;
  paycalculate:=tpaycalculate.create(application);
  paycalculate.showmodal;
end;

procedure TMain.N115Click(Sender: TObject);
begin
  train:=ttrain.create(application);
  train.showmodal;
end;

procedure TMain.N118Click(Sender: TObject);
begin
  if self.staffinfo.RecordCount=0 then exit;
  if self.r_staffteachid.Active=false then exit;
  if self.r_staffteachid.RecordCount=0 then exit;
  if Application.MessageBox('确认要删除所选择的数据吗？','提示',MB_ICONQUESTION or MB_YESNO )=IDYES then
    begin
      self.r_staffteachid.Delete;
      self.r_staffteachid.Close;
      self.r_staffteachid.Open;
    end;
end;

procedure TMain.N116Click(Sender: TObject);
begin
  if self.staffinfo.RecordCount=0 then exit;
  if self.r_staffteachid.Active=false then exit;
  //if self.r_staffteachid.RecordCount=0 then exit;
  if self.r_staffteach.RecordCount=0 then
    begin
      if Application.MessageBox('没有设置培训计划，是否现在设置？','提示',MB_ICONQUESTION or MB_YESNO )=IDYES then
        begin
          self.N115.OnClick(self);
        end;
     exit;
    end;
  trainresult:=ttrainresult.create(application);
  trainresult.showmodal;
end;

procedure TMain.N119Click(Sender: TObject);
begin
  if (main.r_staffteachid.State in dsEditModes) then
    main.r_staffteachid.Post;
  main.r_staffteachid.Close;
  main.r_staffteachid.Open;
end;

procedure TMain.N120Click(Sender: TObject);
var i,j:integer;
begin
  if self.ColorDialog1.Execute then
    begin
      with self.cxSpreadSheetBook1 do
        begin
          BeginUpdate;
            with ActiveSheet do
            begin
              for I := SelectionRect.Left to SelectionRect.Right do
                for J := SelectionRect.Top to SelectionRect.Bottom do
                with GetCellObject(I, J) do
                  Style.Brush.BackgroundColor:=self.ColorDialog1.Color;
            end;
          EndUpdate;
          UpdateControl;
        end;
      end;
end;

procedure TMain.ToolButton7Click(Sender: TObject);
begin
  if self.staffinfo.RecordCount=0 then exit;
  if self.r_staffcontract.Active<>true then exit;
  contract:=tcontract.create(application);
  main.r_staffcontract.Append;
  contract.showmodal;
end;

procedure TMain.cxGrid8DBTableView1DblClick(Sender: TObject);
begin
  if self.staffinfo.RecordCount=0 then exit;
  if self.r_staffcontract.RecordCount=0 then exit;
  contract:=tcontract.create(application);
  main.r_staffcontract.Edit;
  contract.showmodal;
end;

procedure TMain.N125Click(Sender: TObject);
begin
  if self.staffinfo.RecordCount=0 then exit;
  if self.r_staffcontract.Active=false then exit;
  if self.r_staffcontract.RecordCount=0 then exit;
  if Application.MessageBox('确认要删除所选择的数据吗？','提示',MB_ICONQUESTION or MB_YESNO )=IDYES then
    begin
      self.r_staffcontract.Delete;
      self.r_staffcontract.Close;
      self.r_staffcontract.Open;
    end;
end;

procedure TMain.N126Click(Sender: TObject);
begin
  search:=tsearch.create(application);
  search.showmodal;
end;

procedure TMain.N127Click(Sender: TObject);
begin
  if self.staffinfo.RecordCount=0 then exit;
  if self.r_staffpay.RecNo=-1 then
    begin
      MessageBox(handle,'无数据可套用！','错误',MB_ICONERROR or MB_OK);
      exit;
    end;
  weal:=tweal.create(application);
  weal.etype:=1;
  weal.showmodal;
end;

procedure TMain.N129Click(Sender: TObject);
begin
  if self.staffinfo.RecordCount=0 then exit;
  if self.r_staffcontract.RecNo=-1 then
    begin
      MessageBox(handle,'无数据可套用！','错误',MB_ICONERROR or MB_OK);
      exit;
    end;
  weal:=tweal.create(application);
  weal.etype:=2;
  weal.showmodal;
end;

procedure TMain.N132Click(Sender: TObject);
var tmpstr: string;
    i,j,k : integer;
begin
  i:=0;
  j:=i;
  k:=j;
  cutline:=tcutline.create(application);
  cutline.Chart1.Title.Text.Clear;
  cutline.Chart1.Title.Text.Add('职工学历图例');
  cutline.ADOQuery1.Close;
  cutline.ADOQuery1.SQL.Clear;
  cutline.ADOQuery1.SQL.Add('select * from r_staffinfo where delrecy='''+'0'+''' order by knowledge');
  cutline.ADOQuery1.Open;
  cutline.ADOQuery1.First;
  //先查询出有几种类型
  k:=k+1;
  tmpstr:=cutline.ADOQuery1.fieldbyname('knowledge').AsString;
  while not cutline.ADOQuery1.Eof do
    begin
      if cutline.ADOQuery1.fieldbyname('knowledge').AsString<>tmpstr then
        begin
          k:=k+1;
          tmpstr:=cutline.ADOQuery1.fieldbyname('knowledge').AsString;
        end;
      cutline.ADOQuery1.Next;
    end;
  //查询出每种的数量
  cutline.Series1.Add(k,cutline.ADOQuery1.fieldbyname('knowledge').AsString,clred);
  cutline.showmodal;
end;

procedure TMain.N134Click(Sender: TObject);
begin
  person:=tperson.create(application);
  person.showmodal;
end;

procedure TMain.N136Click(Sender: TObject);
begin
  self.N136.Checked:=not self.N136.Checked;
end;

procedure TMain.N137Click(Sender: TObject);
begin
  pworks:=tpworks.create(application);
  pworks.p_tools.Open;
  pworks.showmodal;
  self.w_tools.Close;
  self.w_tools.Open;
end;

procedure TMain.N141Click(Sender: TObject);
begin
  if self.staffinfo.RecNo=-1 then exit;
  if self.w_tools.RecordCount=0 then
    begin
      MessageBox(handle,'目前善未设置工作用品，请先设置！','提示',MB_ICONINFORMATION or MB_OK);
      exit;
    end;
  self.PageControl1.ActivePageIndex:=4;
  statools:=tstatools.create(application);
  self.p_w_tools.Append;
  statools.showmodal;
  self.p_w_tools.Close;
  self.p_w_tools.Open;
end;

procedure TMain.N140Click(Sender: TObject);
begin
  if self.p_w_tools.RecNo=-1 then exit;
  if Application.MessageBox('本次删除操作将不能恢复，是否继续？','提示',MB_ICONQUESTION or MB_YESNO )=IDYES then
    begin
      self.p_w_tools.Delete;
      self.p_w_tools.Close;
      self.p_w_tools.Open;
    end;
end;

procedure TMain.N143Click(Sender: TObject);
begin
  if self.p_w_tools.RecNo=-1 then exit;
  statools:=tstatools.create(application);
  self.p_w_tools.Edit;
  statools.showmodal;
end;

procedure TMain.N150Click(Sender: TObject);
var i,j:integer;
begin
  self.TabSheet8.tabVisible:=true;
  self.PageControl1.ActivePageIndex:=7;
  tbsnew.OnClick(self);
  self.tmpquery.Close;
  self.tmpquery.SQL.Clear;
  self.tmpquery.SQL.Add('select * from r_usercorp');
  self.tmpquery.Open;
  i:=1;
  j:=i;
  SetCellText(i,j,self.tmpquery.fieldbyname('username').AsString+' 员工通讯录列表');
  with self.cxSpreadSheetBook1.ActiveSheet do
    begin
      with GetCellObject(i, j).style do
        begin
          font.name:='黑体';
          font.Size:=20;
        end;
    end;
  i:=0;
  j:=j+1;
  self.tmpquery.Close;
  self.tmpquery.SQL.Clear;
  self.tmpquery.SQL.Add('select * from r_staffinfo,r_staffbranch,r_staffpost where r_staffinfo.delrecy<>'''+'1'+'''');
  self.tmpquery.SQL.Add(' and r_staffinfo.classcodeID=r_staffpost.id');
  self.tmpquery.SQL.Add(' and r_staffinfo.branchid=r_staffbranch.id');
  self.tmpquery.SQL.Add(' order by r_staffpost.id,r_staffbranch.id');
  self.tmpquery.Open;
  self.tmpquery.First;
  j:=j+1;
  SetCellText(0,j,'姓　　名');
  SetCellText(1,j,'所在部门');
  SetCellText(2,j,'职　　位');
  SetCellText(3,j,'联系电话');
  SetCellText(4,j,'通讯地址');
  for i:=0 to 4 do
    begin
      with self.cxSpreadSheetBook1.ActiveSheet do
        begin
          with GetCellObject(i, j).style do
            begin
              borders.Bottom.Style:=lsThin;
            end;
        end;
    end;
  i:=0;
  while not self.tmpquery.Eof do
    begin
      j:=j+1;
      SetCellText(i,j,self.tmpquery.fieldbyname('name').AsString);
      SetCellText(i+1,j,self.tmpquery.fieldbyname('branchname').AsString);
      SetCellText(i+2,j,self.tmpquery.fieldbyname('postname').AsString);
      SetCellText(i+3,j,self.tmpquery.fieldbyname('Telephone').AsString);
      SetCellText(i+4,j,self.tmpquery.fieldbyname('address').AsString);
      self.tmpquery.Next;
    end;
  self.tmpquery.Close;
end;

procedure TMain.N151Click(Sender: TObject);
begin
  self.cxGrid1DBTableView1.CopyToClipboard(false);
end;

procedure TMain.N152Click(Sender: TObject);
begin
dxComponentPrinter1.Preview(True,nil);
end;

procedure TMain.N153Click(Sender: TObject);
begin
  self.cxSpreadSheetBook1.DeleteSheet(self.cxSpreadSheetBook1.ActivePage);
end;

procedure TMain.N156Click(Sender: TObject);
begin
  self.cxSpreadSheetBook1.ActiveSheet.DeleteCells(self.cxSpreadSheetBook1.ActiveSheet.SelectionRect,msAllRow);
end;

procedure TMain.N158Click(Sender: TObject);
begin
  self.cxSpreadSheetBook1.ActiveSheet.DeleteCells(self.cxSpreadSheetBook1.ActiveSheet.SelectionRect,msAllcol);
end;

procedure TMain.N160Click(Sender: TObject);
begin
  self.SetCellText(self.cxSpreadSheetBook1.ActiveSheet.SelectionRect.Left,self.cxSpreadSheetBook1.ActiveSheet.SelectionRect.Top,Datetostr(Now));
end;

procedure TMain.N161Click(Sender: TObject);
begin
  self.tmpquery.Close;
  self.tmpquery.SQL.Clear;
  self.tmpquery.SQL.Add('select * from r_usercorp');
  self.tmpquery.Open;
  self.SetCellText(self.cxSpreadSheetBook1.ActiveSheet.SelectionRect.Left,self.cxSpreadSheetBook1.ActiveSheet.SelectionRect.Top,self.tmpquery.fieldbyname('username').AsString);
  self.tmpquery.Close;  
end;

procedure TMain.DBImage1DblClick(Sender: TObject);
begin
  spic:=tspic.create(application);
  spic.Image1.Picture:=self.DBImage1.Picture;
  spic.showmodal;
end;

procedure TMain.N162Click(Sender: TObject);
begin
  self.SaveDialog1.DefaultExt:='*.BMP';
  self.SaveDialog1.Filter:='位图文件|*.bmp';
  if SaveDialog1.Execute then
  begin
    self.DBImage1.Picture.SaveToFile( ChangeFileExt(SaveDialog1.FileName, '.bmp'));
  end;
end;

procedure TMain.N165Click(Sender: TObject);
var dao: OLEVariant;
    tmpstr:string;
begin
  tmpstr:=gettempdirectory;
  systmpdate:='tmp.tmp';
  dao := CreateOleObject('DAO.DBEngine.35');
  dao.CompactDatabase(tmpstr+systmpdate,tmpstr+systmpdate);
end;




end.
