{立方酒店管理系统 v1.0
 Copyright by CubicSoft
 program by ls.
 Date:20020301-20020601
 20020627 加入注释
}
unit C_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, C_Define, IniFiles, XPMenu, DBTables, ImgList, ExtCtrls,
  DB, DBGrids, Series, Grids, TeEngine, TeeProcs, Chart, ComCtrls,
  StdCtrls, Buttons, DateUtils, Hint;

type

  //团队信息
  TTdInfo = record
    ATdxx: TTdxx;
    AXfje: Currency;
    AYfje: Currency;
  end;
  
  //客房状态
  TKfzt = record
    AKfbh: string;
    AKfzt: string;
    AKrbh: string;
    AKrxm: string;
    AZdbh: string;
    AYjbh: string;
    ASjfj: Currency;
    AColor:TColor;
    AImage:Integer;
    AYdbz: string;
    ACjbz: string;
    ADdts: string;
  end;
  //预定会场
  TYdhc = record
    AYdbh: string;
    AKrbh: string;
    AKrxm: string;
    ASyrq: TDateTime;
    ASjdm: string;
    AHcdm: string;
    AHcmc: string;
    AHczj: Currency;
    ARzbz: Boolean;
    AJsbz: string;
    ASjgq: Boolean;
    AColor: TColor;
    AImage: Integer;
  end;
  //预定餐饮
  TYdcy = record
    AYdbh: string;
    AKrbh: string;
    AKrxm: string;
    ASyrq: TDateTime;
    ASjdm: string;
    ACtbh: string;
    ACtmc: string;
    AXfje: Currency;
    ARzbz: Boolean;
    AJsbz: string;
    ASjgq: Boolean;
    AYcbz: string;
    AColor: TColor;
    AImage: Integer;
  end;
  //预定客房
  TYdkf = record
    AYdbh: string;
    AKrbh: string;
    AKrxm: string;
    ADdrq: TDateTime;
    ADdsj: TDateTime;
    ALdrq: TDateTime;
    ALdsj: TDateTime;
    AKfbh: string;
    AXfje: Currency;
    ARzbz: Boolean;
    AJsbz: string;
    AYdbz: string;
    ASjgq: Boolean;
    AColor: TColor;
    AImage: Integer;
  end;

  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    A1: TMenuItem;
    B1: TMenuItem;
    C1: TMenuItem;
    D1: TMenuItem;
    E1: TMenuItem;
    F1: TMenuItem;
    G1: TMenuItem;
    H1: TMenuItem;
    I1: TMenuItem;
    G11: TMenuItem;
    G1101: TMenuItem;
    G1102: TMenuItem;
    G1103: TMenuItem;
    G1104: TMenuItem;
    G1106: TMenuItem;
    G1107: TMenuItem;
    G1109: TMenuItem;
    G1110: TMenuItem;
    G1108: TMenuItem;
    G1105: TMenuItem;
    G1111: TMenuItem;
    G12: TMenuItem;
    G13: TMenuItem;
    G14: TMenuItem;
    N1: TMenuItem;
    G19: TMenuItem;
    G20: TMenuItem;
    N2: TMenuItem;
    G18: TMenuItem;
    G21: TMenuItem;
    G22: TMenuItem;
    H11: TMenuItem;
    H12: TMenuItem;
    N3: TMenuItem;
    H13: TMenuItem;
    A11: TMenuItem;
    N5: TMenuItem;
    A18: TMenuItem;
    G15: TMenuItem;
    G17: TMenuItem;
    B11: TMenuItem;
    B111: TMenuItem;
    B112: TMenuItem;
    B113: TMenuItem;
    B12: TMenuItem;
    B13: TMenuItem;
    B15: TMenuItem;
    N14: TMenuItem;
    B16: TMenuItem;
    N17: TMenuItem;
    N20: TMenuItem;
    B21: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N16: TMenuItem;
    N18: TMenuItem;
    N21: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N31: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N37: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    N53: TMenuItem;
    N57: TMenuItem;
    N59: TMenuItem;
    N60: TMenuItem;
    N67: TMenuItem;
    B20: TMenuItem;
    N68: TMenuItem;
    N30: TMenuItem;
    N32: TMenuItem;
    N69: TMenuItem;
    N70: TMenuItem;
    N71: TMenuItem;
    N72: TMenuItem;
    N73: TMenuItem;
    N74: TMenuItem;
    N75: TMenuItem;
    N76: TMenuItem;
    N77: TMenuItem;
    N78: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N9: TMenuItem;
    N85: TMenuItem;
    N86: TMenuItem;
    N87: TMenuItem;
    N88: TMenuItem;
    N89: TMenuItem;
    N91: TMenuItem;
    N93: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N80: TMenuItem;
    N81: TMenuItem;
    N15: TMenuItem;
    SaveDialog1: TSaveDialog;
    N36: TMenuItem;
    N38: TMenuItem;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    menuNbdj: TMenuItem;
    menuWbdj: TMenuItem;
    menuMfdj: TMenuItem;
    menuTddj: TMenuItem;
    MenuItem1: TMenuItem;
    menuXxxg: TMenuItem;
    menuDhfj: TMenuItem;
    menuYksy: TMenuItem;
    menuJz: TMenuItem;
    MenuItem2: TMenuItem;
    menuCyxf: TMenuItem;
    MenuItem3: TMenuItem;
    menuOkf: TMenuItem;
    menuWxf: TMenuItem;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    tblKfzt: TTable;
    qryTd: TQuery;
    qryYdhc: TQuery;
    qryYdcy: TQuery;
    qryYdkf: TQuery;
    dsXxbd: TDataSource;
    dsKfzt: TDataSource;
    dsQryTd: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    lblTdmc1: TStaticText;
    lblTdmc2: TStaticText;
    lblTdmc3: TStaticText;
    lblTdmc4: TStaticText;
    lblTdmc5: TStaticText;
    lblTdmc6: TStaticText;
    lblTdmc7: TStaticText;
    lblTdmc8: TStaticText;
    lblTdmc9: TStaticText;
    lblTdmc10: TStaticText;
    TabSheet3: TTabSheet;
    TabSheet5: TTabSheet;
    Panel4: TPanel;
    btnTdbd: TBitBtn;
    btnTdtf: TBitBtn;
    btnTdjz: TBitBtn;
    btnTdbj: TBitBtn;
    btnTdbg: TBitBtn;
    btnTdyx: TBitBtn;
    btnTdyf: TBitBtn;
    btnTdjd: TBitBtn;
    btnTzcx: TBitBtn;
    btnTdqx: TBitBtn;
    lblTime: TStaticText;
    btnRefresh: TBitBtn;
    btnFtsm: TBitBtn;
    btnFtdh: TBitBtn;
    qryKfzt: TQuery;
    tblCtdm: TTable;
    qryCyTdMaster: TQuery;
    dsCyTdMaster: TDataSource;
    btnYdRefresh: TBitBtn;
    BitBtn17: TBitBtn;
    TabSheet10: TTabSheet;
    Panel10: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    btnYdcysk: TBitBtn;
    btnYdcytd: TBitBtn;
    dtpCyyd: TDateTimePicker;
    btnYdcylb: TBitBtn;
    TabSheet11: TTabSheet;
    Panel3: TPanel;
    btnPrev: TSpeedButton;
    btnNext: TSpeedButton;
    dtpYdrq: TDateTimePicker;
    btnYdkfsk: TBitBtn;
    btnYdkftd: TBitBtn;
    TabSheet12: TTabSheet;
    Chart2: TChart;
    Series2: TBarSeries;
    Panel6: TPanel;
    DBGrid1: TDBGrid;
    Panel5: TPanel;
    Panel11: TPanel;
    Chart1: TChart;
    DBGrid3: TDBGrid;
    Panel12: TPanel;
    Series1: TBarSeries;
    btnXxbd: TBitBtn;
    btnKrlb: TBitBtn;
    btnFjbg: TBitBtn;
    btnDtbqj: TBitBtn;
    Panel13: TPanel;
    sgdYdcy: TStringGrid;
    Panel15: TPanel;
    btnKfydlb: TBitBtn;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    DBGrid2: TDBGrid;
    Panel19: TPanel;
    sgdYdkf: TStringGrid;
    Panel21: TPanel;
    sgdYdhc: TStringGrid;
    menuZk: TMenuItem;
    N19: TMenuItem;
    sgdKfzt: TStringGrid;
    qryCyTdMasterD_YDBH: TStringField;
    qryCyTdMasterD_CTBH: TStringField;
    qryCyTdMasterD_CTMC: TStringField;
    qryCyTdMasterD_KRBH: TStringField;
    qryCyTdMasterD_KRXM: TStringField;
    qryCyTdMasterD_YDRQ: TDateTimeField;
    qryCyTdMasterD_SYRQ: TDateTimeField;
    qryCyTdMasterD_SYSJ: TDateTimeField;
    qryCyTdMasterD_SJDM: TStringField;
    qryCyTdMasterD_YCBZ: TStringField;
    qryCyTdMasterD_YCLX: TIntegerField;
    qryCyTdMasterD_RS: TIntegerField;
    qryCyTdMasterD_XFSL: TFloatField;
    qryCyTdMasterD_XFJE: TFloatField;
    qryCyTdMasterD_YDBZ: TStringField;
    qryCyTdMasterD_RZBZ: TStringField;
    qryCyTdMasterD_KTBZ: TStringField;
    qryCyTdMasterD_JSBZ: TStringField;
    qryCyTdMasterD_BZ: TBlobField;
    qryCyTdMasterD_CZYXM: TStringField;
    Panel23: TPanel;
    DBGrid4: TDBGrid;
    qryKfxx: TQuery;
    qryXxbd: TQuery;
    N54: TMenuItem;
    N55: TMenuItem;
    N56: TMenuItem;
    N58: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N50: TMenuItem;
    N61: TMenuItem;
    N62: TMenuItem;
    N63: TMenuItem;
    N64: TMenuItem;
    Panel9: TPanel;
    btnYdhc: TBitBtn;
    btnHcjs: TBitBtn;
    btnYdhccx: TBitBtn;
    N65: TMenuItem;
    N66: TMenuItem;
    qryKfxxD_KFBH: TStringField;
    qryKfxxD_SJFJ: TFloatField;
    qryKfxxD_KRXM: TStringField;
    qryKfxxD_DDRQ: TDateTimeField;
    qryKfxxD_DDSJ: TDateTimeField;
    qryKfxxD_BJS: TIntegerField;
    qryKfxxD_QJS: TIntegerField;
    qryKfxxD_JJFJ: TFloatField;
    qryKfxxD_XB: TStringField;
    qryKfxxD_NZTS: TIntegerField;
    qryTd1: TQuery;
    lblPjfj: TStaticText;
    N79: TMenuItem;
    N82: TMenuItem;
    ColorDialog1: TColorDialog;
    N83: TMenuItem;
    N84: TMenuItem;
    N90: TMenuItem;
    N92: TMenuItem;
    CheckBox1: TCheckBox;
    N94: TMenuItem;
    AiHint1: TAiHint;
    qryKfxxD_JTDZ: TStringField;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    N95: TMenuItem;
    N96: TMenuItem;
    N97: TMenuItem;
    N98: TMenuItem;
    N99: TMenuItem;
    N100: TMenuItem;
    procedure G1101Click(Sender: TObject);
    procedure G1102Click(Sender: TObject);
    procedure G1103Click(Sender: TObject);
    procedure G1104Click(Sender: TObject);
    procedure G1105Click(Sender: TObject);
    procedure G1106Click(Sender: TObject);
    procedure G1107Click(Sender: TObject);
    procedure G1108Click(Sender: TObject);
    procedure G1109Click(Sender: TObject);
    procedure G1110Click(Sender: TObject);
    procedure G1111Click(Sender: TObject);
    procedure G12Click(Sender: TObject);
    procedure G13Click(Sender: TObject);
    procedure G14Click(Sender: TObject);
    procedure G18Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure A11Click(Sender: TObject);
    procedure G15Click(Sender: TObject);
    procedure G17Click(Sender: TObject);
    procedure B111Click(Sender: TObject);
    procedure B16Click(Sender: TObject);
    procedure B112Click(Sender: TObject);
    procedure B12Click(Sender: TObject);
    procedure B113Click(Sender: TObject);
    procedure B13Click(Sender: TObject);
    procedure B15Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N68Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N69Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure N71Click(Sender: TObject);
    procedure N72Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
    procedure N73Click(Sender: TObject);
    procedure N74Click(Sender: TObject);
    procedure B20Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N67Click(Sender: TObject);
    procedure N66Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N59Click(Sender: TObject);
    procedure N60Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N53Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N70Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
    procedure N46Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure N75Click(Sender: TObject);
    procedure N78Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N77Click(Sender: TObject);
    procedure N85Click(Sender: TObject);
    procedure N86Click(Sender: TObject);
    procedure N87Click(Sender: TObject);
    procedure N88Click(Sender: TObject);
    procedure A18Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N81Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure N57Click(Sender: TObject);
    procedure N80Click(Sender: TObject);
    procedure H13Click(Sender: TObject);
    procedure G19Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure G21Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure G22Click(Sender: TObject);
    procedure N52Click(Sender: TObject);
    procedure B21Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure H11Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure menuNbdjClick(Sender: TObject);
    procedure menuXxxgClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure menuWbdjClick(Sender: TObject);
    procedure menuTddjClick(Sender: TObject);
    procedure menuDhfjClick(Sender: TObject);
    procedure menuCyxfClick(Sender: TObject);
    procedure menuYksyClick(Sender: TObject);
    procedure menuJzClick(Sender: TObject);
    procedure menuOkfClick(Sender: TObject);
    procedure menuWxfClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnFtdhClick(Sender: TObject);
    procedure btnTdbdClick(Sender: TObject);
    procedure btnTdtfClick(Sender: TObject);
    procedure btnTdjzClick(Sender: TObject);
    procedure btnTdbjClick(Sender: TObject);
    procedure btnTdbgClick(Sender: TObject);
    procedure btnTdyxClick(Sender: TObject);
    procedure btnTdyfClick(Sender: TObject);
    procedure btnTdjdClick(Sender: TObject);
    procedure tblKfztD_KFZTGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure sgdKfztDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgdKfztSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure menuMfdjClick(Sender: TObject);
    procedure btnTzcxClick(Sender: TObject);
    procedure btnTdqxClick(Sender: TObject);
    procedure btnFtsmClick(Sender: TObject);
    procedure sgdKfztDblClick(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure btnYdRefreshClick(Sender: TObject);
    procedure sgdYdhcDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgdYdhcDblClick(Sender: TObject);
    procedure sgdYdhcSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgdYdcyDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgdYdcySelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgdYdcyDblClick(Sender: TObject);
    procedure btnHcjsClick(Sender: TObject);
    procedure sgdYdkfDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgdYdkfDblClick(Sender: TObject);
    procedure sgdYdkfSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BitBtn17Click(Sender: TObject);
    procedure sgdKfztMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dtpYdrqChange(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPrevClick(Sender: TObject);
    procedure dtpCyydChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure qryCyTdMasterD_RZBZGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure btnYdcylbClick(Sender: TObject);
    procedure btnKfydlbClick(Sender: TObject);
    procedure menuZkClick(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure btnYdhccxClick(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure N54Click(Sender: TObject);
    procedure N55Click(Sender: TObject);
    procedure N56Click(Sender: TObject);
    procedure N58Click(Sender: TObject);
    procedure N50Click(Sender: TObject);
    procedure N63Click(Sender: TObject);
    procedure N64Click(Sender: TObject);
    procedure N65Click(Sender: TObject);
    procedure sgdKfztKeyPress(Sender: TObject; var Key: Char);
    procedure N79Click(Sender: TObject);
    procedure N82Click(Sender: TObject);
    procedure OnZdlr(Sender: TObject);
    procedure OnChageColor(Sender: TObject);
    procedure N92Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N94Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure N95Click(Sender: TObject);
    procedure OnZdlrcx(Sender: TObject);
    procedure OnFykjzcx(Sender: TObject);
    procedure OnHcjscx(Sender: TObject);
    procedure OnLyb(Sender: TObject);
  private
    { Private declarations }
    FKfNum: Integer;
    FHcNum: Integer;
    FCyNum: Integer;
    FTdNum: Integer;
    FYdkfNum: Integer;

    FSelect  : Integer;
    FHcSelect: Integer;
    FCySelect: Integer;
    FKfSelect: Integer;

    FSjdm : string;
    
    FKfzt  : array of TKfzt;
    FYdhc  : array of TYdhc;
    FYdcy  : array of TYdcy;
    FYdkf  : array of TYdkf;
    FTdInfo: array of TTdInfo;

    procedure MainInit;
    procedure KfztInit;
    procedure DbfInit;
    procedure ShowKfzt;
    procedure ShowJzkfzt;
    //procedure ShowYjxf;
    procedure ShowRzl;
    procedure GetTdInfo;
    procedure RefreshKfzt;
    procedure ShowOneKfzt(const AKfbh: string);

    function IsYdkf(const AKfbh: string): Boolean;
    //function IsYjcj(const AKfbh: string): Boolean;

    function FindKfbhId(const AKfbh: string): Integer;

    function CaculateHcX(const AHcmc: string): Integer;
    function CaculateHcY(const ASyrq: string): Integer;
    function CheckTd(const AKrbh: string): Boolean;
  public
    { Public declarations }
    procedure Ftdh;
    procedure ShowYdhc;
    procedure ShowYdcy(const aSjdm: string);
    procedure ShowYdkf;

  end;

const
  ColNum   = 21;//客房状态列
  //ColNum   = 23;//客房状态列  新苑宾馆
  HcColNum = 5; //会场状态列
  CyColNum = 11; //餐饮状态列
  KfColNum = 21; //预定客房状态列

  KxColor  = clGreen;
  YdColor  = clYellow;
  QrColor  = clRed;
  GqColor  = clGray;
  JzColor  = clRed;

var
  MainForm: TMainForm;

implementation

uses C_Xtdy,
     C_Ygda,
     C_Khda,
     C_Hmd,
     C_Ydxx,
     C_YdxxSel,
     C_Kfdy,
     C_Xmdy,
     C_Nbjd,
     C_Xxxg,
     C_Wbjd,
     C_Tdjd,
     C_Mfjd,
     C_Sktf,
     C_Tdsel,
     C_Tdbd,
     C_Krcx,
     C_Zdcx,
     C_ZdcxTd,
     C_Yksy,
     C_Sjz,
     C_Bjyj,
     C_Skjz,
     C_Zd,
     C_Tdtf,
     C_Tdjz,
     C_Tdzd,
     C_Rsmx,
     C_Dqsh,
     C_Yxjz,
     C_YxjzTd,
     C_Yjsh,
     C_Bgrbb,
     C_YskYj,
     C_KhdaSel,
     C_Khyszz,
     C_Khxfmx,
     C_Fjbg,
     C_FykJz,
     C_Lkysk,
     C_Khjzmx,
     C_Cwjs,
     C_CwjsBrow,
     C_Lctj,
     C_Bqjtj,
     C_Yskzd,
     C_Wjzjz,
     C_Skyjbg,
     C_Kfrbb,
     C_Dtbqj,
     C_Jzfltj,
     C_Fykcx,
     C_Ldkrcx,
     C_LDkr,
     C_Tdyfcx,
     C_Ydhc,
     C_Xtsz,
     C_Ydcysk,
     C_Ydcytd,
     C_Ydkfsk,
     C_Ydkftd,
     C_Krly,
     C_Dhhm,
     C_Lcsk,
     C_Hbsk,
     C_Ygkf,
     C_About,
     C_Klsz,
     C_Password,
     C_HotelData,
     C_DhfBrow,
     C_Skqx,
     C_BakData,
     C_Ftdh,
     C_Ftsm,
     C_Ydsm,
     C_Wait,
     C_Ydcycx,
     C_Ydkfcx,
     C_XfxmBrow,
     C_Ydhccx,
     C_Ygjz, C_Ysklr, C_Yjcx, C_Yskcx, C_Dhfcx, C_Zdlrcx, C_Fykjzcx,
  C_Hcjscx, C_LybBrow;

{$R *.dfm}

function TMainForm.FindKfbhId(const AKfbh: string): Integer;
var
  i : Integer;
begin
  Result := -1;
  for i := 0 to FKfNum - 1 do
    if FKfzt[i].AKfbh = AKfbh then
    begin
      Result := i;
      Break;
    end;
end;

//检查团队是否存在
function TMainForm.CheckTd(const AKrbh: string): Boolean;
begin
  Result := False;
  qryTd.DisableControls;
  try
    qryTd.Close;
    qryTd.Open;
    if qryTd.Locate('D_KRBH',AKrbh,[]) then
      Result := True;
  finally
    qryTd.EnableControls;
  end;
end;

//楼层定义
procedure TMainForm.G1101Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'系统') then Exit;
  Xtdy(tagLC);
end;

//房型定义
procedure TMainForm.G1102Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'系统') then Exit;
  Xtdy(tagFX);
end;

//地区定义
procedure TMainForm.G1103Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'系统') then Exit;
  Xtdy(tagDQ);
end;

//国别定义
procedure TMainForm.G1104Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'系统') then Exit;
  Xtdy(tagGB);
end;

//民族定义
procedure TMainForm.G1105Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'系统') then Exit;
  Xtdy(tagMZ);
end;

//证件定义
procedure TMainForm.G1106Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'系统') then Exit;
  Xtdy(tagZJ);
end;

//签证定义
procedure TMainForm.G1107Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'系统') then Exit;
  Xtdy(tagQZ);
end;

//客户分类
procedure TMainForm.G1108Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'系统') then Exit;
  Xtdy(tagFL);
end;

//餐厅定义???
procedure TMainForm.G1109Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'系统') then Exit;
  Xtdy(tagCT);
end;

//会场定义
procedure TMainForm.G1110Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'系统') then Exit;
  Xtdy(tagHC);
end;

//信用卡定义
procedure TMainForm.G1111Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'系统') then Exit;
  Xtdy(tagXYK);
end;

//部门定义
procedure TMainForm.G12Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'系统') then Exit;
  Xtdy(tagBM);
end;

//员工档案
procedure TMainForm.G13Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'系统') then Exit;
  Ygda;
end;

//客户档案
procedure TMainForm.G14Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'系统') then Exit;
  Khda;
end;

//黑名单
procedure TMainForm.G18Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'系统') then Exit;
  Hmd;
end;

//数据库初始化
procedure TMainForm.DbfInit;
begin
  with HotelData.tblUserdata do
  begin
    if Active then Active := False;
    TableName := 'YGDA';
    Open;
    if not FindKey([SYSTEM_BH]) then
    begin
      Insert;
      FieldByName('D_YGBH').AsString := SYSTEM_BH;
      FieldByName('D_YGXM').AsString := 'SYSTEM';
      FieldByName('D_BMBH').AsString := '00000'; 
      FieldByName('D_DM').AsString   := 'sys';
      Post;
    end;
    Close;
  end;

  with HotelData.tblXMDM do
  begin
    try
      try
        Open;
      except
        On E:Exception do
        begin
          ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                      +#13#10
                      +'错误信息:'
                      +E.Message);
          raise;
        end;
      end;
      if not FindKey([XMBH_FJ]) then
      begin
        Insert;
        FieldByName('D_XMBH').AsString := XMBH_FJ;
        FieldByName('D_XMMC').AsString := '房金';
        FieldByName('D_XFBZ').AsString   := 'S';
        FieldByName('D_DM').AsString   := 'fj';
        Post;
      end;
      if not FindKey([XMBH_CF]) then
      begin
        Insert;
        FieldByName('D_XMBH').AsString := XMBH_CF;
        FieldByName('D_XMMC').AsString := '餐费';
        FieldByName('D_XFBZ').AsString   := 'S';
        FieldByName('D_DM').AsString   := 'cf';
        Post;
      end;
      if not FindKey([XMBH_HCF]) then
      begin
        Insert;
        FieldByName('D_XMBH').AsString := XMBH_HCF;
        FieldByName('D_XMMC').AsString := '会场费';
        FieldByName('D_XFBZ').AsString   := 'S';
        FieldByName('D_DM').AsString   := 'hcf';
        Post;
      end;
      if not FindKey([XMBH_DHF]) then
      begin
        Insert;
        FieldByName('D_XMBH').AsString := XMBH_DHF;
        FieldByName('D_XMMC').AsString := '电话费';
        FieldByName('D_XFBZ').AsString   := 'S';
        FieldByName('D_DM').AsString   := 'dhf';
        Post;
      end;
      if not FindKey([XMBH_YJK]) then
      begin
        Insert;
        FieldByName('D_XMBH').AsString := XMBH_YJK;
        FieldByName('D_XMMC').AsString := '预交款';
        FieldByName('D_XFBZ').AsString   := 'S';
        FieldByName('D_DM').AsString   := 'jk';
        Post;
      end;
      if not FindKey([XMBH_EWF]) then
      begin
        Insert;
        FieldByName('D_XMBH').AsString := XMBH_EWF;
        FieldByName('D_XMMC').AsString := '额外费';
        FieldByName('D_XFBZ').AsString   := 'S';
        FieldByName('D_DM').AsString   := 'ewf';
        Post;
      end;

    finally
      Close;
    end;
  end;
end;

//系统初始化
procedure TMainForm.MainInit;
var
  IniFile: TIniFile;
begin

  //初始化结帐员
  JZY.CzyBh := '';
  JZY.CzyXm := '';
  DQCZY := CZY;
  DQJZY := JZY;
  
  IniFile := TIniFile.Create(APP_DIR+'\'+INI_FILENAME);
  try
    //获取全局变量
    //房态盘变量
    IS_SHOWIMAGE := IniFile.ReadBool('BOOLEAN','SHOWIMAGE',False);
    IS_SHOWDDTS  := IniFile.ReadBool('BOOLEAN','SHOWDDTS',False);
    HOTEL_NAME   := IniFile.ReadString('HOTEL','HOTELNAME','常州立方软件公司');
    COLOR_OK     := IniFile.ReadInteger('COLOR','COLOROK',cl3DLight);
    COLOR_BF     := IniFile.ReadInteger('COLOR','COLORBF',clMoneyGreen);
    COLOR_TD     := IniFile.ReadInteger('COLOR','COLORTD',clSkyBlue);
    COLOR_MF     := IniFile.ReadInteger('COLOR','COLORMF',clYellow);
    COLOR_WX     := IniFile.ReadInteger('COLOR','COLORWX',clRed);
    COLOR_ZK     := IniFile.ReadInteger('COLOR','COLORZK',clGray);
    COLOR_ZT     := IniFile.ReadInteger('COLOR','COLORZT',clWhite);
    COLOR_BJ     := IniFile.ReadInteger('COLOR','COLORBJ',clFuchsia);

    COLOR_CYBJ := IniFile.ReadInteger('COLOR','COLORCYBJ',clFuchsia);
    COLOR_CYZT := IniFile.ReadInteger('COLOR','COLORCYZT',clBlack);
    COLOR_CYYD := IniFile.ReadInteger('COLOR','COLORCYYD',clYellow);
    COLOR_CYQR := IniFile.ReadInteger('COLOR','COLORCYQR',clRed);

    COLOR_HCBJ := IniFile.ReadInteger('COLOR','COLORHCBJ',clFuchsia);
    COLOR_HCZT := IniFile.ReadInteger('COLOR','COLORHCZT',clBlack);
    COLOR_HCYD := IniFile.ReadInteger('COLOR','COLORHCYD',clYellow);
    COLOR_HCQR := IniFile.ReadInteger('COLOR','COLORHCQR',clRed);

    COLOR_TD1    := IniFile.ReadInteger('COLOR','COLORTD1',clYellow);
    COLOR_TD2    := IniFile.ReadInteger('COLOR','COLORTD2',clOlive);
    COLOR_TD3    := IniFile.ReadInteger('COLOR','COLORTD3',clSkyBlue);
    COLOR_TD4    := IniFile.ReadInteger('COLOR','COLORTD4',clTeal);
    COLOR_TD5    := IniFile.ReadInteger('COLOR','COLORTD5',clPurple);
    COLOR_TD6    := IniFile.ReadInteger('COLOR','COLORTD6',clGradientActiveCaption);
    COLOR_TD7    := IniFile.ReadInteger('COLOR','COLORTD7',clMaroon);
    COLOR_TD8    := IniFile.ReadInteger('COLOR','COLORTD8',clBlue);
    COLOR_TD9    := IniFile.ReadInteger('COLOR','COLORTD9',clFuchsia);
    COLOR_TD10    := IniFile.ReadInteger('COLOR','COLORTD10',clGreen);

  lblTdmc1.Color := COLOR_TD1;
  lblTdmc2.Color := COLOR_TD2;
  lblTdmc3.Color := COLOR_TD3;
  lblTdmc4.Color := COLOR_TD4;
  lblTdmc5.Color := COLOR_TD5;
  lblTdmc6.Color := COLOR_TD6;
  lblTdmc7.Color := COLOR_TD7;
  lblTdmc8.Color := COLOR_TD8;
  lblTdmc9.Color := COLOR_TD9;
  lblTdmc10.Color := COLOR_TD10;

    //电话计费路径
    JF_DIR       := IniFile.ReadString('HOTEL','JF_DIR','');

    //IC卡读写器的串口号
    PORTNUM      := IniFile.ReadInteger('PORT','ICPORTNUM',0);

    //本机器是否允许夜间审核
    IS_YJSH      := IniFile.ReadBool('BOOLEAN','YJSH',False);
    IS_EMPTYDHF  := IniFile.ReadBool('BOOLEAN','DHF',False);
    //数据库备份路径
    DBF_DIR      := IniFile.ReadString('HOTEL','DBF_DIR',APP_DIR+'Database');
    BAK_DIR      := IniFile.ReadString('HOTEL','BAK_DIR','');

  finally
    IniFile.Free;
  end;

  //lblTitle.Caption := HOTEL_NAME;
  //lblTitleB.Caption:= HOTEL_NAME;
  FSjdm := '全部';
  Caption := HOTEL_NAME;
  sgdKfzt.Color := COLOR_BJ;
  sgdKfzt.Font.Color := COLOR_ZT;
  //帮助文件
  Application.HelpFile := APP_DIR+'Lfhotel.hlp';

  DbfInit;
  KfztInit;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  //系统初始化
  MainInit;
end;

//预定信息
procedure TMainForm.A11Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'预定') then Exit;
  Ydxx;
end;

//客房定义
procedure TMainForm.G15Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'系统') then Exit;
  Kfdy;
end;

//消费项目定义
procedure TMainForm.G17Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'系统') then Exit;
  Xmdy;
end;

//内宾接待
procedure TMainForm.B111Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'接待') then Exit;
  Nbjd;
end;


//信息修改
procedure TMainForm.B16Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'接待') then Exit;
  Xxxg;
end;

//外宾接待
procedure TMainForm.B112Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'接待') then Exit;
  Wbjd;
end;

//团队接待
procedure TMainForm.B12Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'接待') then Exit;
  Tdjd;
end;

//免费接待
procedure TMainForm.B113Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'接待') then Exit;
  Mfjd;
end;

//客人调房
procedure TMainForm.B13Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'接待') then Exit;
  Sktf;
end;

//团队补登
procedure TMainForm.B15Click(Sender: TObject);
var
  AKrbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'接待') then Exit;
  AKrbh := TdSel;
  if AKrbh<>'' then
    Tdbd(AKrbh);
end;

//客人查询
procedure TMainForm.N31Click(Sender: TObject);
begin
//  if not HotelData.CheckYgqx(CZY.CzyBh,'客人查询') then Exit;
  if not HotelData.CheckYgqx(CZY.CzyBh,'查询') then Exit;
  Krcx;
end;

//散客帐单查询
procedure TMainForm.N18Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'查询') then Exit;
  Zdcx;
end;

//团队帐单查询
procedure TMainForm.N68Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'查询') then Exit;
  Zdcxtd;
end;


//世界钟
procedure TMainForm.N37Click(Sender: TObject);
begin
//  if not HotelData.CheckYgqx(CZY.CzyBh,'查询') then Exit;
  Sjz;
end;

//散客补交押金
procedure TMainForm.N30Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;
  Bjyj;
end;

//团队补交押金
procedure TMainForm.N69Click(Sender: TObject);
var
  AKrbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;
  AKrbh := TdSel;
  if AKrbh<>'' then
    BjyjTd(AKrbh);
end;

//散客结帐
procedure TMainForm.N4Click(Sender: TObject);
//var
  //AJzxx: TJZXX;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;
  Skjz;
  ShowJzkfzt;
  //AJzxx := Skjz;
  //if AJzxx.AJzfs <> '' then
    //Zd(AJzxx);
end;

//团队退房
procedure TMainForm.N6Click(Sender: TObject);
var
  AKrbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;
  AKrbh := TdSel;
  if AKrbh<>'' then
    Tdtf(AKrbh);
end;

//团队结帐
procedure TMainForm.N7Click(Sender: TObject);
var
  AKrbh: string;
  AJzxx: TTdJzxx;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;
  AKrbh := TdSel;
  if AKrbh<>'' then
  begin
    AJzxx := Tdjz(AKrbh);
    if AJzxx.AJzfs<>'' then
      Tdzd(AJzxx);
  end;
end;

//客户应收总帐
procedure TMainForm.N44Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'查询') then Exit;
  Khyszz;
end;

//散客预先结帐
procedure TMainForm.N71Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;
  Yxjz;
end;

//团队预先结帐
procedure TMainForm.N72Click(Sender: TObject);
var
  AKrbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;
  AKrbh := TdSel;
  if AKrbh<>'' then YxjzTd(AKrbh);
end;

//夜间审核
procedure TMainForm.N39Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'夜审') then Exit;

  if not IS_YJSH then
  begin
    ShowInfo('本机器不允许夜间审核！');
    Exit;
  end;

  if (Time>EnCodeTime(23,0,0,0))and(Time<EnCodeTime(23,59,59,59)) then
    Yjsh
  else
  begin
    if Confirm('现在不是夜审时间，夜审的时间是：23：00-24：00，你是否强制夜审?') then
      Yjsh;
  end;
end;

//宾馆日报表
procedure TMainForm.N47Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'报表') then Exit;
  Bgrbb(0);
end;

//客户预交款
procedure TMainForm.N73Click(Sender: TObject);
var
  AKhbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;
  AKhbh := KhdaSel;
  if AKhbh<>'' then
    YskYj(AKhbh);
end;


//应收款结帐
procedure TMainForm.N74Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;
  Yskzd;
end;

//房价变更
procedure TMainForm.B20Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'房价变更') then Exit;
  Fjbg;
end;

//非寓客结帐
procedure TMainForm.N10Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;
  Fykjz;
end;

//零客应收款
procedure TMainForm.N67Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'报表') then Exit;
  Lkysk;
end;

//客户应收款录入
procedure TMainForm.N66Click(Sender: TObject);
var
  AKhbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;
  AKhbh := KhdaSel;
  if AKhbh<>'' then
    Ysklr(AKhbh);
end;

//餐厅上交
procedure TMainForm.N40Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'餐厅上交') then Exit;
  Cwjs(JSLX_CTSJ);
end;

//财务结单
procedure TMainForm.N41Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'财务结单') then Exit;
  Cwjs(JSLX_CWSJ);
end;

//餐厅上交报表
procedure TMainForm.N59Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'报表') then Exit;
  CwjsBrow(JSLX_CTSJ);
end;

//财务结单报表
procedure TMainForm.N60Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'报表') then Exit;
  CwjsBrow(JSLX_CWSJ);
end;

//楼层统计
procedure TMainForm.N51Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'报表') then Exit;
  Lctj;
end;

//半全价统计
procedure TMainForm.N53Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'报表') then Exit;
  Bqjtj;
end;

//零客未结
procedure TMainForm.N12Click(Sender: TObject);
var
  AJzxx: TJZXX;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;
  AJzxx := Wjzjz;
  if AJzxx.AJzfs<>'' then
    WjzZd(AJzxx);
end;

//散客押金变更
procedure TMainForm.N32Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;
  Skyjbg;
end;

//团队押金变更
procedure TMainForm.N70Click(Sender: TObject);
var
  AKrbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;
  AKrbh := TdSel;
  if AKrbh<>'' then
    Tdyjbg(AKrbh);
end;


//宾馆历史营业报表
procedure TMainForm.N48Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'报表') then Exit;
  Bgrbb(1);
end;

//客房日报表
procedure TMainForm.N46Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'报表') then Exit;
  Kfrbb;
end;

//当天半全价
procedure TMainForm.N61Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'查询') then Exit;
  Khjzmx;
end;

//结帐分类报表
procedure TMainForm.N75Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'报表') then Exit;
  Jzfltj;
end;

//非寓客消费查询
procedure TMainForm.N78Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'报表') then Exit;
  FYkcx;
end;


//离店客人查询
procedure TMainForm.N27Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'查询') then Exit;
  Ldkr;
end;

//离店客人帐单
procedure TMainForm.N28Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'查询') then Exit;
  Ldkrcx;
end;

//团队用房查询
procedure TMainForm.N22Click(Sender: TObject);
var
  AKrbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'查询') then Exit;
  AKrbh := TdSel;
  if AKrbh<>'' then
    Tdyfcx(Akrbh);
end;

//团队取消房间
procedure TMainForm.N23Click(Sender: TObject);
var
  AKrbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'团队取消') then Exit;
  AKrbh := TdSel;
  if AKrbh<>'' then
    Tdqx(AKrbh);
end;

//餐饮管理系统
procedure TMainForm.N24Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'餐饮管理系统') then Exit;
  WinExec(PChar('LfHotelCt.exe '+CZY.CzyBh+' '+CZY.Czyxm),SW_SHOWNORMAL);
end;

//预定会场
procedure TMainForm.N9Click(Sender: TObject);
var
  AKrbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'预定') then Exit;
  AKrbh := YdxxSel;
  if AKrbh<>'' then
  begin
    YdhcNew(AKrbh);
    ShowYdhc;
  end;
end;

//系统设置
procedure TMainForm.N77Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'系统设置') then Exit;
  Xtsz;
end;

//散客预定餐饮
procedure TMainForm.N85Click(Sender: TObject);
var
  AKrbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'预定') then Exit;
  AKrbh := YdxxSel;
  if AKrbh<>'' then
  begin
    YdcyskNew(AKrbh);
    ShowYdcy(FSjdm);
  end;
end;

//团队预定餐饮
procedure TMainForm.N86Click(Sender: TObject);
var
  AKrbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'预定') then Exit;
  AKrbh := YdxxSel;
  if AKrbh<>'' then
  begin
    YdcytdNew(AKrbh);
    qryCyTdMaster.Close;
    qryCyTdMaster.Open;
  end;
end;

//散客预定客房
procedure TMainForm.N87Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'预定') then Exit;
  YdkfskNew;
  ShowYdkf;
end;

//团队预定客房
procedure TMainForm.N88Click(Sender: TObject);
var
  AKrbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'预定') then Exit;
  AKrbh := YdxxSel;
  if AKrbh<>'' then
  begin
    YdkftdNew(AKrbh);
    ShowYdkf;
  end;
end;

//预定清理
procedure TMainForm.A18Click(Sender: TObject);
var
  s: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'预定') then Exit;
  s := 'delete from YDHC where (D_SYRQ<:D)and(D_RZBZ="F")';
  with HotelData.qryUserData do
  begin
    if Active then Active := False;
    SQL.Clear;
    SQL.Add(s);
    Params[0].DataType := ftDate;
    Params[0].Value := Date;
    ExecSQL;
    Close;
  end;

  s := 'delete from YDCY where D_SYRQ<:D';
  with HotelData.qryUserData do
  begin
    if Active then Active := False;
    SQL.Clear;
    SQL.Add(s);
    Params[0].DataType := ftDate;
    Params[0].Value := Date;
    ExecSQL;
    Close;
  end;
  s := 'delete from YDKF where D_DDRQ<:D';
  with HotelData.qryUserData do
  begin
    if Active then Active := False;
    SQL.Clear;
    SQL.Add(s);
    Params[0].DataType := ftDate;
    Params[0].Value := Date;
    ExecSQL;
    Close;
  end;

  s := 'delete from YDXX '
      +'where (D_KRBH not in (select D_KRBH from YDHC))'
      +'and(D_KRBH not in (select D_KRBH from YDCY))'
      +'and(D_KRBH not in (select D_KRBH from YDKF))';
  with HotelData.qryUserData do
  begin
    if Active then Active := False;
    SQL.Clear;
    SQL.Add(s);
    ExecSQL;
    Close;
  end;
  ShowYdhc;
  ShowYdcy(FSjdm);
  ShowYdkf;
end;

//客人留言
procedure TMainForm.N33Click(Sender: TObject);
begin
//  if not HotelData.CheckYgqx(CZY.CzyBh,'查询') then Exit;
  Krly;
end;

//电话号码
procedure TMainForm.N81Click(Sender: TObject);
begin
//  if not HotelData.CheckYgqx(CZY.CzyBh,'查询') then Exit;
  Dhhm;
end;

//列车时刻
procedure TMainForm.N34Click(Sender: TObject);
begin
//  if not HotelData.CheckYgqx(CZY.CzyBh,'查询') then Exit;
  Lcsk;
end;

//航班时刻
procedure TMainForm.N35Click(Sender: TObject);
begin
//  if not HotelData.CheckYgqx(CZY.CzyBh,'查询') then Exit;
  Hbsk;
end;

//员工开房报表
procedure TMainForm.N57Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'报表') then Exit;
  Ygkf;
end;

//电话计费系统
procedure TMainForm.N80Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'电话计费系统') then Exit;
  WinExec('LfHotelJf.exe',SW_SHOWNORMAL);
end;

//关于
procedure TMainForm.H13Click(Sender: TObject);
begin
  About;
end;

//数据备份
procedure TMainForm.G19Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'系统') then Exit;
  BakDbfData;
end;

//贵宾卡管理系统
procedure TMainForm.N15Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'贵宾卡管理系统') then Exit;
  WinExec('LfHotelIc.exe',SW_SHOWNORMAL);
end;

//口令设置
procedure TMainForm.G21Click(Sender: TObject);
begin
  Klsz(CZY.CzyBh);
end;

//登录
procedure TMainForm.FormShow(Sender: TObject);
begin
  if not CzyDl then
    Application.Terminate;
  Caption := HOTEL_NAME + '（操作员：' + CZY.CzyXm+'）';
end;

//重新登录
procedure TMainForm.G22Click(Sender: TObject);
begin
  if not Czydl then
    Application.Terminate;
  Caption := HOTEL_NAME + '（操作员：' + CZY.CzyXm+'）';
end;

//电话费报表
procedure TMainForm.N52Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'报表') then Exit;
  DhfBrow;
end;

//信息导出
procedure TMainForm.B21Click(Sender: TObject);
var
  F: TextFile;
  s: string;
begin

  if SaveDialog1.Execute then
  begin
  WaitForm := TWaitForm.Create(Application);
  try
    WaitForm.FTitle := '正在信息导出';
    WaitForm.Show;
    WaitForm.Update;

    AssignFile(F,SaveDialog1.FileName);
    ReWrite(F);
    s := '';
    with HotelData.tblXxdc do
    begin
      try
        Open;
      except
        On E:Exception do
        begin
          ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                      +#13#10
                      +'错误信息:'
                      +E.Message);
          raise;
        end;
      end;

      //事务启动
      HotelData.DatabaseUser.StartTransaction;

      try
        First;
        while not Eof do
        begin
          s := '';
          s := s + '"' +FieldByName('D_KRXM').AsString+ '"'+Chr(9);
          s := s + '"' +FieldByName('D_XB').AsString +  '"'+Chr(9);
          s := s + '"' +FieldByName('D_MZ').AsString +  '"'+Chr(9);
          s := s + '"' +FieldByName('D_CSNY').AsString +'"'+Chr(9);
          s := s + '"' +FieldByName('D_ZJLX').AsString +'"'+Chr(9);
          s := s + '"' +FieldByName('D_ZJHM').AsString +'"'+Chr(9);
          s := s + '"' +FieldByName('D_GZDW').AsString +'"'+Chr(9);
          s := s + '"' +FieldByName('D_JTDZ').AsString +'"'+Chr(9);
          s := s + '"' +FieldByName('D_DDRQ').AsString +'0800"'+Chr(9);
          s := s + '"' +FieldByName('D_KFBH').AsString +'"'+Chr(9);
          s := s + '"' +FieldByName('D_ZY').AsString +'"'+Chr(13);
          WriteLn(F,s);
          Next;
        end;
        HotelData.ExecSql('delete from XXDC where D_LDRQ<>""');
        //事务提交
        HotelData.DatabaseUser.Commit;
      except
        //事务回滚
        HotelData.DatabaseUser.Rollback;
        raise;
      end;

      Close;
    end;
    CloseFile(F);
  finally
    WaitForm.Hide;
    WaitForm.Free;
  end;
  ShowMessage('信息导出完成!');
  end;
end;

//散客取消房间
procedure TMainForm.N38Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'散客取消') then Exit;
  Skqx;
end;

//帮助
procedure TMainForm.H11Click(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTENTS,0);
end;

//客房状态初始化
procedure TMainForm.KfztInit;
begin
  PageControl1.ActivePageIndex := 0;
  dtpYdrq.Date := Date;
  dtpCyyd.Date := Date;
  
  try
    tblKfzt.Open;
    qryXxbd.Open;
    qryTd.Open;
    qryYdhc.Close;
    qryYdhc.SQL.Clear;
    qryYdhc.SQL.Add('select * from YDHC where (D_SYRQ>=:RQ)and(D_JSBZ="1") order by D_SYRQ,D_SYSJ');
    qryYdhc.ParamByName('RQ').AsDate := Date;
    qryYdhc.Open;
    qryYdcy.Open;
    qryYdkf.Open;
    qryCyTdMaster.Open;

  except
    On E:Exception do
    begin
      ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                  +#13#10
                  +'错误信息:'
                  +E.Message);
      raise;
    end;
  end;

  ShowKfzt;
  ShowRzl;
  ShowYdhc;
  ShowYdcy(FSjdm);
  ShowYdkf;
end;

//获取团队信息 包含消费、押金等
procedure TMainForm.GetTdInfo;
var
  I     : Integer;
  //ADtfj : Currency;
  s     : string;
  //AKfxx : TKfxx;
begin
  //团队信息刷新
  with qryTd1 do
  begin
    Close;
    SQL.Clear;
    s := 'select * from krxx where (d_krlx="T") and (d_krbh in (select d_krbh from kfzt))';
    SQL.Add(s);
    Open;
    FTdNum := RecordCount;
    SetLength(FTdInfo,FTdNum);

    i := 0;
    First;
    while not Eof do
    begin
      FTdInfo[i].ATdxx := HotelData.GetTdxx(FieldByName('D_KRBH').AsString);
      //ADtfj := 0;

      {FTdInfo[i].AYfje := HotelData.SumJe('select sum(D_YFJE) from KRYJ where (D_YJBH="'
                               +FTdInfo[i].ATdxx.AYjbh+'")and(D_FKFS="'+FKFS_RMB+'")');

      FTdInfo[i].AXfje := HotelData.SumJe('select sum(D_XFJE) from KRZD where (D_ZDBH="'
                               +FTdInfo[i].ATdxx.AZdbh+'")and(D_JZBZ<>"'+JZ_YX+'")and(D_HH<>0)') + ADtfj;
      }
      Next;
      Inc(i);
    end;
  end;

      //太慢
      {
      if qryKfzt.Active then qryKfzt.Active := False;
      qryKfzt.ParamByName('KRBH').AsString := FTdInfo[i].ATdxx.AKrbh;


      try
        qryKfzt.Open;
      except
        On E:Exception do
        begin
          ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                      +#13#10
                      +'错误信息:'
                      +E.Message);
          raise;
        end;
      end;

      qryKfzt.First;
      while not qryKfzt.Eof do
      begin
        AKfxx := HotelData.GetKfxx(qryKfzt.FieldByName('D_KFBH').AsString);
        //获取当天房价
        ADtfj := ADtfj + GetDtfj(AKfxx.ADdsj,Time,AKfxx.AKfbz,AKfxx.ASjfj);
        qryKfzt.Next;
      end;
      qryKfzt.Close;
      }
end;

//当天是否有预定客房
function TMainForm.IsYdkf(const AKfbh: string): Boolean;
begin
  Result := False;
  if qryYdkf.Locate('D_KFBH',AKfbh,[]) then
    if qryYdkf.FieldByName('D_DDRQ').AsString=DateToStr(Date) then
      Result := True;
end;
{
//判断散客押金催交
function TMainForm.IsYjcj(const AKfbh: string): Boolean;
var
  AKfxx : TKfxx;
  ADtfj,AYfje,AXfje : Currency;
begin
  Result:= False;
  AKfxx := HotelData.GetKfxx(AKfbh);
  ADtfj := GetDtfj(AKfxx.ADdsj,Time,AKfxx.AKfbz,AKfxx.ASjfj);

  AYfje := HotelData.SumJe('select sum(D_YFJE) from KRYJ where (D_YJBH="'
                           +AKfxx.AYjbh+'")and(D_FKFS="'+FKFS_RMB+'")');
  AXfje := HotelData.SumJe('select sum(D_XFJE) from KRZD where (D_ZDBH="'
                           +AKfxx.AZdbh+'")and(D_HH<>0)');
  if (AYfje<>0)and((AXfje+ADtfj)>(AYfje-100)) then
    Result := True;
end;
}
//刷新客房状态
procedure TMainForm.RefreshKfzt;
begin
  WaitForm := TWaitForm.Create(Application);
  try
    WaitForm.FTitle := '刷新客房房态';
    WaitForm.Show;
    WaitForm.Update;
    ShowKfzt;
    ShowRzl;
  finally
    WaitForm.Hide;
    WaitForm.Free;
  end;
end;

//显示单个客房状态
procedure TMainForm.ShowOneKfzt(const AKfbh: string);
var
  i,j : Integer;
begin
  tblKfzt.Refresh;
  if tblKfzt.Locate('D_KFBH',AKfbh,[]) then
  begin
    i := FindKfbhId(AKfbh);
    if i<0 then raise Exception.Create('刷新房态发生错误！请重新运行程序。');
    FKfzt[i].AKfbh := tblKfzt.FieldbyName('D_KFBH').AsString;
    FKfzt[i].AKfzt := tblKfzt.FieldByName('D_KFZT').AsString;
    FKfzt[i].AKrbh := tblKfzt.FieldByName('D_KRBH').AsString;
    FKfzt[i].AKrxm := tblKfzt.FieldByName('D_KRXM').AsString;
    FKfzt[i].ASjfj := tblKfzt.FieldByName('D_SJFJ').AsCurrency;
    FKfzt[i].AYjbh := tblKfzt.FieldByName('D_YJBH').AsString;

    //判断是否被预定
    {if IsYdkf(FKfzt[i].AKfbh) then
      FKfzt[i].AYdbz := '★'
    else
      FKfzt[i].AYdbz := '';}

    if tblKfzt.FieldByName('D_KFZT').AsString=KFZT_OK then
    begin
      FKfzt[i].AColor := COLOR_OK;
      FKfzt[i].AImage := 0;
      FKfzt[i].ACjbz  := '';
    end;

    if tblKfzt.FieldByName('D_KFZT').AsString=KFZT_BF then
    begin
      FKfzt[i].AColor := COLOR_BF;
      FKfzt[i].AImage := 1;
      {if IsYjcj(FKfzt[i].AKfbh) then
        FKfzt[i].ACjbz := '￥'
      else
        FKfzt[i].ACjbz := '';}
    end;

    if tblKfzt.FieldByName('D_KFZT').AsString=KFZT_TD then
    begin
      FKfzt[i].AColor := COLOR_TD;
      FKfzt[i].AImage := 2;
      for j:=0 to FTdNum - 1 do
        if FTdInfo[j].ATdxx.AKrxm = FKfzt[i].AKrxm then
        begin
          FKfzt[i].AColor := (MainForm.FindComponent('lblTdmc'+IntToStr(j+1)) as TStaticText).Color;
          {if (FTdInfo[j].AYfje<>0)and(FTdInfo[j].AXfje>(FTdInfo[j].AYfje-100)) then
            FKfzt[i].ACjbz := '￥'
          else
            FKfzt[i].ACjbz := '';}
          Break;
        end;
    end;

    if tblKfzt.FieldByName('D_KFZT').AsString=KFZT_WX then
    begin
      FKfzt[i].AColor := COLOR_WX;
      FKfzt[i].AImage := 3;
      FKfzt[i].ACjbz  := '';
    end;

    if tblKfzt.FieldByName('D_KFZT').AsString=KFZT_ZK then
    begin
      FKfzt[i].AColor := COLOR_ZK;
      FKfzt[i].AImage := 5;
      FKfzt[i].ACjbz  := '';
    end;

    if tblKfzt.FieldByName('D_KFZT').AsString=KFZT_MF then
    begin
      FKfzt[i].AColor := COLOR_MF;
      FKfzt[i].AImage := 4;
      FKfzt[i].ACjbz  := '';
    end;

    sgdKfzt.Refresh;
    ShowRzl;
    qryKfxx.Close;
    qryKfxx.Open;
  end;
end;

//显示结帐客房状态
procedure TMainForm.ShowJzkfzt;
var
  i : Integer;
begin
  tblKfzt.Refresh;
  tblKfzt.First;
  while not tblKfzt.Eof do
  begin
    if tblKfzt.FieldByName('D_KFZT').AsString = KFZT_ZK then
    begin
      i := FindKfbhId(tblKfzt.FieldByName('D_KFBH').AsString);
    if i<0 then raise Exception.Create('刷新房态发生错误！请重新运行程序。');
    FKfzt[i].AKfbh := tblKfzt.FieldbyName('D_KFBH').AsString;
    FKfzt[i].AKfzt := tblKfzt.FieldByName('D_KFZT').AsString;
    FKfzt[i].AKrbh := tblKfzt.FieldByName('D_KRBH').AsString;
    FKfzt[i].AKrxm := tblKfzt.FieldByName('D_KRXM').AsString;
    FKfzt[i].ASjfj := tblKfzt.FieldByName('D_SJFJ').AsCurrency;
    FKfzt[i].AYjbh := tblKfzt.FieldByName('D_YJBH').AsString;
    FKfzt[i].AColor := COLOR_ZK;
    FKfzt[i].AImage := 5;
    FKfzt[i].ACjbz  := '';

    //判断是否被预定
    if IsYdkf(FKfzt[i].AKfbh) then
      FKfzt[i].AYdbz := '★'
    else
      FKfzt[i].AYdbz := '';

    end;
    tblKfzt.Next;
  end;

    sgdKfzt.Refresh;
    ShowRzl;
    qryKfxx.Close;
    qryKfxx.Open;
end;

//显示所有客房状态
procedure TMainForm.ShowKfzt;
var
  i,j : Integer;
begin
  //刷新客房
  sgdKfzt.Color := COLOR_BJ;
  sgdKfzt.Font.Color := COLOR_ZT;
  
  tblKfzt.Refresh;
  qryKfxx.Close;
  qryKfxx.Open;
  //获取团队信息
  qryTd.Close;
  qryTd.Open;
  //获取团队信息
  GetTdInfo;

  //团队信息刷新
  for i:=1 to 10 do
    (MainForm.FindComponent('lblTdmc'+IntToStr(i)) as TStaticText).Caption := '';

  //显示团队信息
  for i:=0 to FTdNum - 1 do
    (MainForm.FindComponent('lblTdmc'+IntToStr(i+1)) as TStaticText).Caption := FTdInfo[i].ATdxx.AKrxm;

  FKfNum := tblKfzt.RecordCount;//客房总数
  SetLength(FKfzt,FKfNum);
  //edit by ls. 20020823
  //sgdKfzt.ColCount := ColNum;
  //sgdKfzt.RowCount := (FKfNum div ColNum) + 1;

  sgdKfzt.ColCount := (FKfNum div ColNum)*2 + 1;
  sgdKfzt.RowCount := ColNum;

  tblKfzt.First;
  i := 0;

  while not tblKfzt.Eof do
  begin
    FKfzt[i].AKfbh := tblKfzt.FieldbyName('D_KFBH').AsString;
    FKfzt[i].AKfzt := tblKfzt.FieldByName('D_KFZT').AsString;
    FKfzt[i].AKrbh := tblKfzt.FieldByName('D_KRBH').AsString;
    FKfzt[i].AKrxm := tblKfzt.FieldByName('D_KRXM').AsString;
    FKfzt[i].ASjfj := tblKfzt.FieldByName('D_SJFJ').AsCurrency;
    FKfzt[i].AYjbh := tblKfzt.FieldByName('D_YJBH').AsString;

    //判断是否被预定
    {if IsYdkf(FKfzt[i].AKfbh) then
      FKfzt[i].AYdbz := '★'
    else
      FKfzt[i].AYdbz := '';}
    FKfzt[i].AYdbz := '';
    if IS_SHOWDDTS then
      FKfzt[i].ADdts := HotelData.GetDdts(FKfzt[i].AKfbh)
    else
      FKfzt[i].ADdts := '';
    
    if tblKfzt.FieldByName('D_KFZT').AsString=KFZT_OK then
    begin
      FKfzt[i].AColor := COLOR_OK;
      FKfzt[i].AImage := 0;
      FKfzt[i].ACjbz  := '';
    end;

    if tblKfzt.FieldByName('D_KFZT').AsString=KFZT_BF then
    begin
      FKfzt[i].AColor := COLOR_BF;
      FKfzt[i].AImage := 1;
      {if IsYjcj(FKfzt[i].AKfbh) then
        FKfzt[i].ACjbz := '￥'
      else
        FKfzt[i].ACjbz := '';}
    end;

    if tblKfzt.FieldByName('D_KFZT').AsString=KFZT_TD then
    begin
      FKfzt[i].AColor := COLOR_TD;
      FKfzt[i].AImage := 2;
      for j:=0 to FTdNum - 1 do
        if FTdInfo[j].ATdxx.AKrxm = FKfzt[i].AKrxm then
        begin
          FKfzt[i].AColor := (MainForm.FindComponent('lblTdmc'+IntToStr(j+1)) as TStaticText).Color;
          {if (FTdInfo[j].AYfje<>0)and(FTdInfo[j].AXfje>(FTdInfo[j].AYfje-100)) then
            FKfzt[i].ACjbz := '￥'
          else
            FKfzt[i].ACjbz := '';}
          Break;
        end;
      end;

    if tblKfzt.FieldByName('D_KFZT').AsString=KFZT_WX then
    begin
      FKfzt[i].AColor := COLOR_WX;
      FKfzt[i].AImage := 3;
      FKfzt[i].ACjbz  := '';
    end;

    if tblKfzt.FieldByName('D_KFZT').AsString=KFZT_ZK then
    begin
      FKfzt[i].AColor := COLOR_ZK;
      FKfzt[i].AImage := 5;
      FKfzt[i].ACjbz  := '';
    end;

    if tblKfzt.FieldByName('D_KFZT').AsString=KFZT_MF then
    begin
      FKfzt[i].AColor := COLOR_MF;
      FKfzt[i].AImage := 4;
      FKfzt[i].ACjbz  := '';
    end;

    Inc(i);
    tblKfzt.Next;
  end;

  sgdKfzt.Refresh;
  qryXxbd.Close;
  qryXxbd.Open;
end;

//入住率图表显示
procedure TMainForm.ShowRzl;
var
  AOk,ABf,ATd,AWx,AMf,AZk: Integer;
  ACzs,ACzl              : Double;
  s                      : string;
  APjfj,AJjfj            : Currency;
begin
  //AOk := 0;ABf := 0;ATd := 0;AWx := 0;AMf := 0;AZk := 0;
  s := 'select count(*) from KFZT where D_KFZT="'+KFZT_OK+'"';
  AOk := HotelData.SumCount(s);
  s := 'select count(*) from KFZT where D_KFZT="'+KFZT_BF+'"';
  ABf := HotelData.SumCount(s);
  s := 'select count(*) from KFZT where D_KFZT="'+KFZT_TD+'"';
  ATd := HotelData.SumCount(s);
  s := 'select count(*) from KFZT where D_KFZT="'+KFZT_WX+'"';
  AWx := HotelData.SumCount(s);
  s := 'select count(*) from KFZT where D_KFZT="'+KFZT_MF+'"';
  AMf := HotelData.SumCount(s);
  s := 'select count(*) from KFZT where D_KFZT="'+KFZT_ZK+'"';
  AZk := HotelData.SumCount(s);

  ACZS := 0;
  APJFJ := 0;
  with tblKfzt do
  begin
    DisableControls;
    First;
    while not Eof do
    begin
      if (tblKfzt.FieldByName('D_KFZT').AsString=KFZT_BF)or
         (tblKfzt.FieldByName('D_KFZT').AsString=KFZT_TD)or
         (tblKfzt.FieldByName('D_KFZT').AsString=KFZT_MF) then
      begin
        if tblKfzt.FieldByName('D_KFBZ').AsString = KFBZ_DT then
        begin
          ACzs := ACzs + 1;
          APjfj := APjfj + tblKfzt.FieldByName('D_SJFJ').AsCurrency;
        end
        else
        begin
          if (Time>EnCodeTime(12,0,0,0))
          and(Time<=EnCodeTime(18,0,0,0))
          and(TIme<EnCodeTime(23,0,0,0)) then
            begin
              ACzs := ACzs+0.5;
              APjfj:= APjfj + tblKfzt.FieldByName('D_SJFJ').AsCurrency*0.5;
            end
          else if (Time>EnCodeTime(18,0,0,0))and(Time<EnCodeTime(23,0,0,0)) then
            begin
              ACzs := ACzs+1;
              APjfj:= APjfj + tblKfzt.FieldByName('D_SJFJ').AsCurrency;
            end;
        end;
      end;
      Next;
    end;

    EnableControls;
  end;
    {ACzs := ACzs
          + HotelData.SumCount('select sum(D_QJS) from KFZT')
          + HotelData.SumCount('select sum(D_BJS) from KFZT')*0.5;

    AJjfj := HotelData.SumJe('select sum(D_JJFJ) from KFZT');}
    ACzs := ACzs
          + HotelData.SumCount('select sum(D_QJS) from BQJ')
          + HotelData.SumCount('select sum(D_BJS) from BQJ')*0.5;

    AJjfj := HotelData.SumJe('select sum(D_JJFJ) from BQJ');

  if (AOk+ABf+ATd+AMf+AZk)=0 then ACzl := 0
  else
    ACzl := ACzs/141;//(AOk+ABf+ATd+AMf+AZk);
  if ACzs=0 then APjfj := 0
  else
    APjfj := (APjfj+AJjfj)/ACzs;
  lblPjfj.Caption := '均价：'+FormatFloat('#.##',APjfj);
  with Series1 do
  begin
    Clear;
    AddBar(AOk,'空房',COLOR_OK);
    AddBar(ABf,'散客',COLOR_BF);
    AddBar(ATd,'团队',COLOR_TD);
    AddBar(AWx,'维修',COLOR_WX);
    AddBar(AMf,'免费',COLOR_MF);
    AddBar(AZk,'脏空',COLOR_ZK);
  end;

  with Series2 do
  begin
    Clear;
    {if (AOk+ABf+ATd+AMf+AZk)=0 then ACzl := 0
    else
      ACzl := (ABf+ATd+AMf)/(AOk+ABf+ATd+AMf+AZk);
    AddBar(AOk+ABf+ATd+AMf+AZk,'客房总数',clBlue);
    AddBar(ABf+ATd+AMf,'出租数',clGreen);}
    AddBar(ACzl*100,'出租率%',clRed)
  end;

end;


procedure TMainForm.PopupMenu1Popup(Sender: TObject);
var
  Enable: Boolean;
  AKfzt : string;
begin
  Enable := False;

  menuNbdj.Enabled := Enable;
  menuWbdj.Enabled := Enable;
  menuMfdj.Enabled := Enable;
  menuTddj.Enabled := Enable;
  menuXxxg.Enabled := Enable;
  menuCyxf.Enabled := Enable;
  menuDhfj.Enabled := Enable;
  menuYksy.Enabled := Enable;
  menuJz.Enabled   := Enable;
  menuOkf.Enabled  := Enable;
  menuWxf.Enabled  := Enable;

  if FSelect >= FKfNum then Exit;

  AKfzt := tblKfzt.FieldByName('D_KFZT').AsString;
  
  //AKfzt := FKfzt[FSelect].AKfzt;

  if (AKfzt<>KFZT_WX)and(AKfzt<>KFZT_MF)and(AKfzt<>KFZT_ZK) then
  begin
    Enable := AKfzt<> KFZT_OK;
    menuNbdj.Enabled := not Enable;
    menuWbdj.Enabled := not Enable;
    menuMfdj.Enabled := not Enable;
    menuTddj.Enabled := not Enable;
    menuXxxg.Enabled := Enable;
    menuDhfj.Enabled := Enable;
    menuYksy.Enabled := Enable;
    menuCyxf.Enabled := Enable;
    menuJz.Enabled   := Enable and (AKfzt<>KFZT_TD);
  end;

  if AKfzt=KFZT_OK then menuWxf.Enabled := True;

  if  (AKfzt=KFZT_ZK)
    or(AKfzt=KFZT_WX)
    or(AKfzt=KFZT_MF) then
      menuOkf.Enabled := True;

end;

//内宾接待
procedure TMainForm.menuNbdjClick(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'接待') then Exit;
  NbjdEnter(tblKfzt.FieldByName('D_KFBH').AsString);
  //刷新
  if NbjdForm.ModalResult <> mrOK then
  begin
    ShowOneKfzt(tblKfzt.FieldByName('D_KFBH').AsString);
    //RefreshKfzt;
  end;
end;

//信息修改
procedure TMainForm.menuXxxgClick(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'接待') then Exit;
  XxxgEnter(tblKfzt.FieldByName('D_KRBH').AsString);
end;

//房态刷新
procedure TMainForm.btnRefreshClick(Sender: TObject);
begin
  RefreshKfzt;
end;

//外宾接待
procedure TMainForm.menuWbdjClick(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'接待') then Exit;
  WbjdEnter(tblKfzt.FieldByName('D_KFBH').AsString);
  if WbjdForm.ModalResult <> mrOK then
  begin
    ShowOneKfzt(tblKfzt.FieldByName('D_KFBH').AsString);
    //RefreshKfzt;
  end;
end;

//团队接待
procedure TMainForm.menuTddjClick(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'接待') then Exit;
  Tdjd;
  if TdjdForm.ModalResult <> mrOK then
    RefreshKfzt;
end;

//调换房间
procedure TMainForm.menuDhfjClick(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'接待') then Exit;
  SktfEnter(tblKfzt.FieldByName('D_KFBH').AsString);
  if SktfForm.ModalResult <> mrOK then
    RefreshKfzt;
end;

//帐单查询
procedure TMainForm.menuCyxfClick(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'查询') then Exit;
  if tblKfzt.FieldByName('D_KFZT').AsString=KFZT_BF then
    ZdcxEnter(tblKfzt.FieldByName('D_KFBH').AsString);
  if tblKfzt.FieldByName('D_KFZT').AsString=KFZT_TD then
    ZdcxtdEnter(tblKfzt.FieldByName('D_KRBH').AsString);
end;

//寓客收银
procedure TMainForm.menuYksyClick(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;
  YksyEnter(tblKfzt.FieldByName('D_KFBH').AsString);
end;

//散客结帐
procedure TMainForm.menuJzClick(Sender: TObject);
//var
  //AJzxx: TJZXX;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;
  SkjzEnter(tblKfzt.FieldByName('D_KFBH').AsString);
  ShowJzkfzt;
  //AJzxx := SkjzEnter(tblKfzt.FieldByName('D_KFBH').AsString);
  //if AJzxx.AJzfs<>'' then
  //begin
    //Zd(AJzxx);
    //if ZdForm.ModalResult <> mrOK then
      //ShowJzkfzt;
  //end;
end;

//设置OK房
procedure TMainForm.menuOkfClick(Sender: TObject);
begin
//  if not HotelData.CheckYgqx(CZY.CzyBh,'房态变更') then Exit;

  //如果是免费房
  if tblKfzt.FieldByName('D_KFZT').AsString = KFZT_MF then
  begin
    //20020627 edit by ls.
    //HotelData.EmptyData('select * from KRXX where D_KRBH="'+tblKfzt.FieldByName('D_KRBH').AsString+'"');
    HotelData.EmptyData('delete from KRXX where D_KRBH="'+tblKfzt.FieldByName('D_KRBH').AsString+'"');
    tblKfzt.Edit;
    tblKfzt.FieldByName('D_KRBH').AsString := '';
    tblKfzt.FieldByName('D_KRXM').AsString := '';
    tblKfzt.Post;
  end;

  HotelData.SetKfzt(tblKfzt.FieldByName('D_KFBH').AsString,KFZT_OK);
  ShowOneKfzt(tblKfzt.FieldByName('D_KFBH').AsString);
  //RefreshKfzt;

end;

//设置维修房
procedure TMainForm.menuWxfClick(Sender: TObject);
begin
//  if not HotelData.CheckYgqx(CZY.CzyBh,'房态变更') then Exit;

  HotelData.SetKfzt(tblKfzt.FieldByName('D_KFBH').AsString,KFZT_WX);
  ShowOneKfzt(tblKfzt.FieldByName('D_KFBH').AsString);
  //RefreshKfzt;
end;

//显示时间
procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('yyyymmdd hh:nn:ss',Now);
end;

//房态导航
procedure TMainForm.btnFtdhClick(Sender: TObject);
begin
  FtdhForm.Show;
end;

//房态导航函数
procedure TMainForm.Ftdh;
begin
  RefreshKfzt;
end;

//团队补登
procedure TMainForm.btnTdbdClick(Sender: TObject);
var
  AKrbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'接待') then Exit;

  AKrbh := qryTd.FieldByName('D_KRBH').AsString;
  if not CheckTd(AKrbh) then
  begin
    ShowWarning('该团队不存在！请刷新房态。');
    Exit;
  end;
  if AKrbh<>'' then
  begin
    Tdbd(AKrbh);
    if TdbdForm.ModalResult <> mrOK then
      RefreshKfzt;
  end;
end;

//团队退房
procedure TMainForm.btnTdtfClick(Sender: TObject);
var
  AKrbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;

  AKrbh := qryTd.FieldByName('D_KRBH').AsString;
  if not CheckTd(AKrbh) then
  begin
    ShowWarning('该团队不存在！请刷新房态。');
    Exit;
  end;
  
  if AKrbh<>'' then
  begin
    Tdtf(AKrbh);
    if TdtfForm.ModalResult <> mrOK then
      RefreshKfzt;
  end;
end;

//团队结帐
procedure TMainForm.btnTdjzClick(Sender: TObject);
var
  AKrbh: string;
  AJzxx: TTdJzxx;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;

  AKrbh := qryTd.FieldByName('D_KRBH').AsString;
  
  if not CheckTd(AKrbh) then
  begin
    ShowWarning('该团队不存在！请刷新房态。');
    Exit;
  end;

  if AKrbh<>'' then
  begin
    AJzxx := Tdjz(AKrbh);
    if AJzxx.AJzfs<>'' then
    begin
      Tdzd(AJzxx);
      if TdzdForm.ModalResult <> mrOK then
        RefreshKfzt;
    end;
  end;
end;

//团队补交押金
procedure TMainForm.btnTdbjClick(Sender: TObject);
var
  AKrbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;

  AKrbh := qryTd.FieldByName('D_KRBH').AsString;

  if not CheckTd(AKrbh) then
  begin
    ShowWarning('该团队不存在！请刷新房态。');
    Exit;
  end;
  
  if AKrbh<>'' then
  begin
    Bjyjtd(AKrbh);
  end;
end;
//团队变更押金
procedure TMainForm.btnTdbgClick(Sender: TObject);
var
  AKrbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;

  AKrbh := qryTd.FieldByName('D_KRBH').AsString;

  if not CheckTd(AKrbh) then
  begin
    ShowWarning('该团队不存在！请刷新房态。');
    Exit;
  end;
  
  if AKrbh<>'' then
  begin
    Tdyjbg(AKrbh);
  end;
end;

//团队预先结帐
procedure TMainForm.btnTdyxClick(Sender: TObject);
var
  AKrbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;

  AKrbh := qryTd.FieldByName('D_KRBH').AsString;
  
  if not CheckTd(AKrbh) then
  begin
    ShowWarning('该团队不存在！请刷新房态。');
    Exit;
  end;

  if AKrbh<>'' then
  begin
    YxjzTd(AKrbh);
  end;
end;

//团队用房
procedure TMainForm.btnTdyfClick(Sender: TObject);
var
  AKrbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'查询') then Exit;

  AKrbh := qryTd.FieldByName('D_KRBH').AsString;

  if not CheckTd(AKrbh) then
  begin
    ShowWarning('该团队不存在！请刷新房态。');
    Exit;
  end;
  
  if AKrbh<>'' then
  begin
    Tdyfcx(AKrbh);
  end;
end;

//团队接待
procedure TMainForm.btnTdjdClick(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'接待') then Exit;
  Tdjd;
  if TdjdForm.ModalResult <> mrOK then
    RefreshKfzt;
end;


//团队信息修改
procedure TMainForm.tblKfztD_KFZTGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if DisplayText then
  begin
    if Sender.AsString=KFZT_BF then Text := '包房';
    if Sender.AsString=KFZT_TD then Text := '团队';
    if Sender.AsString=KFZT_MF then Text := '免费';
    if Sender.AsString=KFZT_WX then Text := '维修';
    if Sender.AsString=KFZT_OK then Text := '空房';
    if Sender.AsString=KFZT_ZK then Text := '脏空';
  end;
end;

//刷新客房时
procedure TMainForm.sgdKfztDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  i : Integer;
begin
  //edit by ls. 20020823
  //i := ARow*sgdKfzt.ColCount + ACol;
  if (ACol mod 2)=0 then
  begin
    i := (ACol div 2)*sgdKfzt.RowCount + ARow;
    if i<FKfNum then
    begin
      with sgdKfzt do
      begin
        Canvas.Brush.Color := FKfzt[i].AColor;
        Canvas.FillRect(Rect);
        Canvas.TextOut(Rect.Left,Rect.Top,FKfzt[i].AKfbh);
        //Canvas.TextOut(Rect.Left,Rect.Top+11,FKfzt[i].ACjbz+FKfzt[i].AYdbz);
        //Canvas.TextOut(Rect.Left+25,Rect.Top,FKfzt[i].ADdts);
        //20020627 edit by ls.
        {if FKfzt[i].ASjfj<>0 then
          Canvas.TextOut(Rect.Left,Rect.Top+13,CurrToStr(FKfzt[i].ASjfj)+'元');}
        {if (IS_SHOWIMAGE)and(FKfzt[i].AKfzt<>KFZT_OK) then
          ImageList1.Draw(Canvas,Rect.Left+16,Rect.Top+16,FKfzt[i].AImage);}
      end;
    end;
  end
  else
  begin
    with sgdKfzt do
    begin
      i := ((ACol-1) div 2)*sgdKfzt.RowCount + ARow;
      if i < FKfNum then
      begin
        //Canvas.Brush.Color := clWhite;
        //Canvas.FillRect(Rect);
        if IS_SHOWDDTS then
          Canvas.TextOut(Rect.Left,Rect.Top,FKfzt[i].ADdts);
        if (IS_SHOWIMAGE)and(FKfzt[i].AKfzt<>KFZT_OK) then
          ImageList1.Draw(Canvas,Rect.Left+16,Rect.Top,FKfzt[i].AImage);
    end;
    end;
  end;
end;

//当选择客房时
procedure TMainForm.sgdKfztSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  sgdKfzt.ShowHint := False;
  //edit by ls. 20020823
  //FSelect := ARow*sgdKfzt.ColCount + ACol;
  if (ACol mod 2)=0 then
    FSelect := (ACol div 2)*sgdKfzt.RowCount + ARow
  else
    FSelect := 9999;
  if FSelect < FKfnum then
  begin
    tblKfzt.Locate('D_KFBH',FKfzt[FSelect].AKfbh,[]);
    if qryKfxx.Locate('D_KFBH',FKfzt[FSelect].AKfbh,[]) then
    begin
    sgdKfzt.Hint :=  Format('房号:%10s',[qryKfxx.FieldByName('D_KFBH').AsString])+#13#10
                   + Format('姓名:%10s',[qryKfxx.FieldByName('D_KRXM').AsString])+#13#10
                   + Format('房价:%10s',[qryKfxx.FieldByName('D_SJFJ').AsString])+#13#10
                   + Format('性别:%10s',[qryKfxx.FieldByName('D_XB').AsString])+#13#10
                   //+ '家庭地址：' + qryKfxx.FieldByName('D_JTDZ').AsString+#13#10
                   + Format('日期:%10s',[qryKfxx.FieldByName('D_DDRQ').AsString]);
    sgdKfzt.ShowHint := True;
    end;
  end;
end;

//免费登记
procedure TMainForm.menuMfdjClick(Sender: TObject);
var
  AKfbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'接待') then Exit;
  AKfbh := tblKfzt.FieldByName('D_KFBH').AsString;
  MfjdEnter(AKfbh);
  if MfjdForm.ModalResult <> mrOK then
  begin
    ShowOneKfzt(tblKfzt.FieldByName('D_KFBH').AsString);
    //RefreshKfzt;
  end;
end;


//团帐查询
procedure TMainForm.btnTzcxClick(Sender: TObject);
var
  AKrbh: string;
begin
  AKrbh := qryTd.FieldByName('D_KRBH').AsString;

  if not CheckTd(AKrbh) then
  begin
    ShowWarning('该团队不存在！请刷新房态。');
    Exit;
  end;
  
  if AKrbh<>'' then
    ZdcxTdEnter(AKrbh);
end;

//团队取消客房
procedure TMainForm.btnTdqxClick(Sender: TObject);
var
  AKrbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'接待') then Exit;
  AKrbh := qryTd.FieldByName('D_KRBH').AsString;
  
  if not CheckTd(AKrbh) then
  begin
    ShowWarning('该团队不存在！请刷新房态。');
    Exit;
  end;

  if AKrbh<>'' then
    Tdqx(AKrbh);
end;

//房态说明
procedure TMainForm.btnFtsmClick(Sender: TObject);
begin
  Ftsm;
end;

//双击客房
procedure TMainForm.sgdKfztDblClick(Sender: TObject);
begin
  if FSelect < FKfNum then
  begin
    //如果是OK房，则登记
    if tblKfzt.FieldByName('D_KFZT').AsString = KFZT_OK then
    //if FKfzt[FSelect].AKfzt=KFZT_OK then
    begin
      if not HotelData.CheckYgqx(CZY.CzyBh,'接待') then Exit;
      if FKfzt[FSelect].AYdbz <> '' then
        if not Confirm('该客房今天有客人预定，你是否仍要开房？') then Exit;
      NbjdEnter(tblKfzt.FieldByName('D_KFBH').AsString);
      RefreshKfzt;
      {if NbjdForm.ModalResult <> mrOK then
      begin
        ShowOneKfzt(tblKfzt.FieldByName('D_KFBH').AsString);
        //RefreshKfzt;
      end
      else
        RefreshKfzt;//edit by ls. 20020822 当连续录入时}
      Exit;
    end;

    //如果是散客
    if tblKfzt.FieldByName('D_KFZT').AsString = KFZT_BF then
    //if FKfzt[FSelect].AKfzt = KFZT_BF then
      ZdcxEnter(tblKfzt.FieldByName('D_KFBH').AsString);
      //20020630 edit by ls.
      //YjxfEnter(tblKfztD_KFBH.Value);

    //如果是团队
    if tblKfzt.FieldByName('D_KFZT').AsString = KFZT_TD then
    //if FKfzt[FSelect].AKfzt = KFZT_TD then
      ZdcxTdEnter(tblKfzt.FieldByName('D_KRBH').AsString);
      //YjxfEnter1(tblKfztD_KRBH.Value);
  end;
end;

//信息补登
procedure TMainForm.DBGrid3DblClick(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'接待') then Exit;
  if not qryXxbd.IsEmpty then
    XxxgEnter(qryXxbd.FieldByName('D_KRBH').AsString);
  qryXxbd.Close;
  qryXxbd.Open;
end;


//刷新预定餐饮
procedure TMainForm.ShowYdcy(const aSjdm: string);
var
  i: Integer;
begin
  sgdYdcy.Color := COLOR_CYBJ;
  sgdYdcy.Font.Color := COLOR_CYZT;
  qryYdcy.Close;
  qryYdcy.Open;

  //初始化餐厅
  tblCtdm.Open;
  FCyNum := tblCtdm.RecordCount; //预定数量
  SetLength(FYdcy,FCyNum);
  sgdYdcy.ColCount := CyColNum;
  sgdYdcy.RowCount := (FCyNum div CyColNum)+1;

  tblCtdm.First;
  i := 0;
  while not tblCtdm.Eof do
  begin
    FYdcy[i].AYdbh := '';
    FYdcy[i].AYcbz := '';
    FYdcy[i].AKrxm := '';
    FYdcy[i].ASjdm := '';
    FYdcy[i].ACtbh := tblCtdm.FieldbyName('D_CTBH').AsString;
    FYdcy[i].ACtmc := tblCtdm.FieldByName('D_CTMC').AsString;
    FYdcy[i].AColor:= COLOR_CYBJ;//KxColor;
    tblCtdm.Next;
    Inc(i);
  end;

  tblCtdm.Close;
  if aSjdm = '全部' then
    qryYdcy.Filter := 'D_SYRQ='''+DateToStr(dtpCyyd.Date)+'''';
  if aSjdm = '中午' then
    qryYdcy.Filter := 'D_SYRQ='''+DateToStr(dtpCyyd.Date)+''' and D_SJDM=''中午''';
  if aSjdm = '晚上' then
    qryYdcy.Filter := 'D_SYRQ='''+DateToStr(dtpCyyd.Date)+''' and D_SJDM=''晚上''';

  for i:=0 to FCyNum-1 do
  begin
    if qryYdcy.Locate('D_CTBH',FYdcy[i].ACtbh,[]) then
    begin
      FYdcy[i].AYdbh := qryYdcy.FieldByName('D_YDBH').AsString;
      FYdcy[i].AKrbh := qryYdcy.FieldByName('D_KRBH').AsString;
      FYdcy[i].AKrxm := qryYdcy.FieldByName('D_KRXM').AsString;
      FYdcy[i].ASyrq := qryYdcy.FieldByName('D_SYRQ').AsDateTime;
      FYdcy[i].ASjdm := qryYdcy.FieldByName('D_SJDM').AsString;
      //FYdcy[i].ACtbh := qryYdcy.FieldByName('D_CTBH').AsString;
      //FYdcy[i].ACtmc := qryYdcy.FieldByName('D_CTMC').AsString;
      FYdcy[i].AXfje := qryYdcy.FieldByName('D_XFJE').AsCurrency;
      FYdcy[i].ARzbz := qryYdcy.FieldByName('D_RZBZ').AsBoolean;
      FYdcy[i].AJsbz := qryYdcy.FieldByName('D_JSBZ').AsString;
      FYdcy[i].AYcbz := qryYdcy.FieldbyName('D_YCBZ').AsString;
      FYdcy[i].AColor := COLOR_CYYD;//YdColor;

      //如果过期
      if FYdcy[i].ASyrq < Date then FYdcy[i].ASjgq := True
      else FYdcy[i].ASjgq := False;
      if FYdcy[i].ASjgq then FYdcy[i].AColor := GqColor;

      //如果入帐确认
      if FYdcy[i].ARzbz then FYdcy[i].AColor := COLOR_CYQR;//QrColor;

      //如果结算
      if FYdcy[i].AJsbz = JS_YES then FYdcy[i].AColor := JzColor;

      FYdcy[i].AImage := 0;
      if FYdcy[i].ARzbz          then FYdcy[i].AImage := 1;
      if FYdcy[i].AJsbz = JS_YES then FYdcy[i].AImage := 2;
      if FYdcy[i].ASjgq          then FYdcy[i].AImage := 3;
    end;
  end;
  {
  qryYdcy.First;
  i := 0;
  while not qryYdcy.Eof do
  begin
    FYdcy[i].AYdbh := qryYdcy.FieldByName('D_YDBH').AsString;
    FYdcy[i].AKrbh := qryYdcy.FieldByName('D_KRBH').AsString;
    FYdcy[i].AKrxm := qryYdcy.FieldByName('D_KRXM').AsString;
    FYdcy[i].ASyrq := qryYdcy.FieldByName('D_SYRQ').AsDateTime;
    FYdcy[i].ASjdm := qryYdcy.FieldByName('D_SJDM').AsString;
    FYdcy[i].ACtbh := qryYdcy.FieldByName('D_CTBH').AsString;
    FYdcy[i].ACtmc := qryYdcy.FieldByName('D_CTMC').AsString;
    FYdcy[i].AXfje := qryYdcy.FieldByName('D_XFJE').AsCurrency;
    FYdcy[i].ARzbz := qryYdcy.FieldByName('D_RZBZ').AsBoolean;
    FYdcy[i].AJsbz := qryYdcy.FieldByName('D_JSBZ').AsString;
    FYdcy[i].AYcbz := qryYdcy.FieldbyName('D_YCBZ').AsString;
    FYdcy[i].AColor := cl3DLight;

    //如果过期
    if FYdcy[i].ASyrq < Date then FYdcy[i].ASjgq := True
    else FYdcy[i].ASjgq := False;
    if FYdcy[i].ASjgq then FYdcy[i].AColor := clYellow;

    //如果入帐确认
    if FYdcy[i].ARzbz then FYdcy[i].AColor := clGreen;

    //如果结算
    if FYdcy[i].AJsbz = JS_YES then FYdcy[i].AColor := clRed;

    FYdcy[i].AImage := 0;
    if FYdcy[i].ARzbz          then FYdcy[i].AImage := 1;
    if FYdcy[i].AJsbz = JS_YES then FYdcy[i].AImage := 2;
    if FYdcy[i].ASjgq          then FYdcy[i].AImage := 3;

    qryYdcy.Next;
    Inc(i);
  end;
  }
  sgdYdcy.Refresh;
end;

//刷新预定客房
procedure TMainForm.ShowYdkf;
var
  i: Integer;
begin

  qryYdkf.Close;
  qryYdkf.Open;

  FYdkfNum := FKfNum;
  SetLength(FYdkf,FYdkfNum);
  sgdYdkf.ColCount := KfColNum;
  sgdYdkf.RowCount := (FYdkfNum div KfColNum)+1;

  //初始化客房编号
  for i:=0 to FYdkfNum - 1 do
  begin
    FYdkf[i].AKfbh := FKfzt[i].AKfbh;
    FYdkf[i].AYdbh := '';
    FYdkf[i].AColor:= KxColor;
  end;

  qryYdkf.Filter := 'D_DDRQ='''+DateToStr(dtpYdrq.Date)+'''';

  for i:=0 to FYdkfNum - 1 do
  begin
    if qryYdkf.Locate('D_KFBH',FYdkf[i].AKfbh,[]) then
    begin
      FYdkf[i].AYdbh := qryYdkf.FieldByName('D_YDBH').AsString;
      FYdkf[i].AKrbh := qryYdkf.FieldByName('D_KRBH').AsString;
      FYdkf[i].AKrxm := qryYdkf.FieldByName('D_KRXM').AsString;
      FYdkf[i].ADdrq := qryYdkf.FieldByName('D_DDRQ').AsDateTime;
      FYdkf[i].ADdsj := qryYdkf.FieldByName('D_DDSJ').AsDateTime;
      FYdkf[i].ALdrq := qryYdkf.FieldByName('D_LDRQ').AsDateTime;
      FYdkf[i].ALdsj := qryYdkf.FieldByName('D_LDSJ').AsDateTime;
      //FYdkf[i].AKfbh := qryYdkf.FieldByName('D_KFBH').AsString;
      FYdkf[i].AXfje := qryYdkf.FieldByName('D_XFJE').AsCurrency;
      FYdkf[i].ARzbz := qryYdkf.FieldByName('D_RZBZ').AsBoolean;
      FYdkf[i].AJsbz := qryYdkf.FieldByName('D_JSBZ').AsString;
      FYdkf[i].AYdbz := qryYdkf.FieldByName('D_YDBZ').AsString;
      FYdkf[i].AColor := YdColor;


      //如果过期
      if FYdkf[i].ADdrq < Date then FYdkf[i].ASjgq := True
      else FYdkf[i].ASjgq := False;
      if FYdkf[i].ASjgq then FYdkf[i].AColor := GqColor;

      //如果确认
      if FYdkf[i].ARzbz then FYdkf[i].AColor := QrColor;

      //如果结算
      if FYdkf[i].AJsbz = JS_YES then FYdkf[i].AColor := JzColor;

      FYdkf[i].AImage := 0;
      if FYdkf[i].ARzbz          then FYdkf[i].AImage := 1;
      if FYdkf[i].AJsbz = JS_YES then FYdkf[i].AImage := 2;
      if FYdkf[i].ASjgq          then FYdkf[i].AImage := 3;

      end;
  end;


  {
  FYdkfNum := qryYdkf.RecordCount;//预定数量
  SetLength(FYdkf,FYdkfNum);
  sgdYdkf.ColCount := KfColNum;
  sgdYdkf.RowCount := (FYdkfNum div KfColNum)+1;

  qryYdkf.First;
  i := 0;
  while not qryYdkf.Eof do
  begin
    FYdkf[i].AYdbh := qryYdkf.FieldByName('D_YDBH').AsString;
    FYdkf[i].AKrbh := qryYdkf.FieldByName('D_KRBH').AsString;
    FYdkf[i].AKrxm := qryYdkf.FieldByName('D_KRXM').AsString;
    FYdkf[i].ADdrq := qryYdkf.FieldByName('D_DDRQ').AsDateTime;
    FYdkf[i].ADdsj := qryYdkf.FieldByName('D_DDSJ').AsDateTime;
    FYdkf[i].ALdrq := qryYdkf.FieldByName('D_LDRQ').AsDateTime;
    FYdkf[i].ALdsj := qryYdkf.FieldByName('D_LDSJ').AsDateTime;
    FYdkf[i].AKfbh := qryYdkf.FieldByName('D_KFBH').AsString;
    FYdkf[i].AXfje := qryYdkf.FieldByName('D_XFJE').AsCurrency;
    FYdkf[i].ARzbz := qryYdkf.FieldByName('D_RZBZ').AsBoolean;
    FYdkf[i].AJsbz := qryYdkf.FieldByName('D_JSBZ').AsString;
    FYdkf[i].AYdbz := qryYdkf.FieldByName('D_YDBZ').AsString;
    FYdkf[i].AColor := cl3DLight;

    //如果过期
    if FYdkf[i].ADdrq < Date then FYdkf[i].ASjgq := True
    else FYdkf[i].ASjgq := False;
    if FYdkf[i].ASjgq then FYdkf[i].AColor := clYellow;

    //如果确认
    if FYdkf[i].ARzbz then FYdkf[i].AColor := clGreen;

    //如果结算
    if FYdkf[i].AJsbz = JS_YES then FYdkf[i].AColor := clRed;

    FYdkf[i].AImage := 0;
    if FYdkf[i].ARzbz          then FYdkf[i].AImage := 1;
    if FYdkf[i].AJsbz = JS_YES then FYdkf[i].AImage := 2;
    if FYdkf[i].ASjgq          then FYdkf[i].AImage := 3;

    qryYdkf.Next;
    Inc(i);
  end;}
  sgdYdkf.Refresh;
end;

function TMainForm.CaculateHcX(const AHcmc: string): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i:=0 to sgdYdhc.ColCount - 1 do
    if sgdYdhc.Cells[i,0] = AHcmc then
    begin
      Result := i;
      Break;
    end;
end;

function TMainForm.CaculateHcY(const ASyrq: string): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i:=0 to sgdYdhc.RowCount - 1 do
    if sgdYdhc.Cells[0,i] = ASyrq then
    begin
      Result := i;
      Break;
    end;
end;

//刷新预定会场
procedure TMainForm.ShowYdhc;
var
  i,x,y: Integer;
  AColCount,ARowCount : Integer;
  s: string;
begin
  qryYdhc.Close;
  qryYdhc.Open;

  sgdYdhc.Color := COLOR_HCBJ;
  sgdYdhc.Font.Color := COLOR_HCZT;

  //清空
  for i:=0 to sgdYdhc.RowCount - 1 do
    sgdYdhc.Rows[i].Clear;

  //写抬头  x坐标
  sgdYdhc.Cells[0,0] := '日期/会场';
  //edit by ls. 20020829
  with HotelData.qryUserData do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from HCDM order by D_DM');
    Open;
    First;
    i := 1;
    while not Eof do
    begin
      sgdYdhc.Cells[i,0] := FieldByName('D_HCMC').AsString;
      Inc(i);
      Next;
    end;

    AColCount := RecordCount + 1;

    Close;
  end;

  //写日期 y坐标
  with HotelData.qryUserData do
  begin
    if Active then Active := False;
    s := 'select D_SYRQ from YDHC where (D_SYRQ>=:RQ)and(D_JSBZ="1") group by D_SYRQ';
    SQL.Clear;
    SQL.Add(s);
    ParamByName('RQ').AsDate := Date;
    try
      Open;
    except
      On E:Exception do
      begin
        ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                    +#13#10
                    +'错误信息:'
                    +E.Message);
        raise;
      end;
    end;
    First;
    i := 1;
    while not Eof do
    begin
      sgdYdhc.Cells[0,i]   := FormatDateTime('mm-dd',FieldByName('D_SYRQ').AsDateTime) + '上午';
      sgdYdhc.Cells[0,i+1] := FormatDateTime('mm-dd',FieldByName('D_SYRQ').AsDateTime) + '下午';
      sgdYdhc.Cells[0,i+2] := FormatDateTime('mm-dd',FieldByName('D_SYRQ').AsDateTime) + '晚上';
      sgdYdhc.Cells[0,i+3] := FormatDateTime('mm-dd',FieldByName('D_SYRQ').AsDateTime) + '全天';
      //Inc(i,4);
      Inc(i,5);
      Next;
    end;
    //ARowCount := RecordCount*4 + 1;
    ARowCount := RecordCount*5 + 1;
  end;

  sgdYdhc.ColCount := AColCount;
  sgdYdhc.RowCount := ARowCount;

  //添加
  FHcNum := AColCount*ARowCount;
  SetLength(FYdhc,FHcNum);

  //初始化
  for i:=0 to FHcNum-1 do
  begin
    FYdhc[i].AYdbh := '';
    FYdhc[i].AColor:= COLOR_HCBJ;//KxColor;
  end;

  qryYdhc.First;
  while not qryYdhc.Eof do
  begin
    x := CaculateHcX(qryYdhc.FieldByName('D_HCMC').AsString);
    y := CaculateHcY(FormatDateTime('mm-dd',qryYdhc.FieldByName('D_SYRQ').AsDateTime)+qryYdhc.FieldByName('D_SJDM').AsString);
    i := y*AColCount + x;

    FYdhc[i].AYdbh := qryYdhc.FieldByName('D_YDBH').AsString;
    FYdhc[i].AKrbh := qryYdhc.FieldByName('D_KRBH').AsString;
    FYdhc[i].AKrxm := qryYdhc.FieldByName('D_KRXM').AsString;
    FYdhc[i].ASyrq := qryYdhc.FieldByName('D_SYRQ').AsDateTime;
    FYdhc[i].ASjdm := qryYdhc.FieldByName('D_SJDM').AsString;
    FYdhc[i].AHcdm := qryYdhc.FieldByName('D_HCBH').AsString;
    FYdhc[i].AHcmc := qryYdhc.FieldByName('D_HCMC').AsString;
    FYdhc[i].AHczj := qryYdhc.FieldByName('D_HCZJ').AsCurrency;
    FYdhc[i].ARzbz := qryYdhc.FieldByName('D_RZBZ').AsBoolean;
    FYdhc[i].AJsbz := qryYdhc.FieldByName('D_JSBZ').AsString;
    FYdhc[i].AColor:= COLOR_HCYD;//YdColor;

    //如果过期
    if FYdhc[i].ASyrq < Date then FYdhc[i].ASjgq := True
    else FYdhc[i].ASjgq := False;
    if FYdhc[i].ASjgq then FYdhc[i].AColor := GqColor;

    //如果确认
    if FYdhc[i].ARzbz then FYdhc[i].AColor := COLOR_HCQR;//QrColor;

    //如果结算
    if FYdhc[i].AJsbz = JS_YES then FYdhc[i].AColor := JzColor;

    FYdhc[i].AImage := 0;
    if FYdhc[i].ARzbz          then FYdhc[i].AImage := 1;
    if FYdhc[i].ASjgq          then FYdhc[i].AImage := 3;
    if FYdhc[i].AJsbz = JS_YES then FYdhc[i].AImage := 2;

    qryYdhc.Next;
  end;
{  FHcNum := qryYdhc.RecordCount;//预定数量
  SetLength(FYdhc,FHcNum);
  sgdYdhc.ColCount := HcColNum;
  sgdYdhc.RowCount := (FHcNum div HcColNum)+1;

  qryYdhc.First;
  i := 0;
  while not qryYdhc.Eof do
  begin
    FYdhc[i].AYdbh := qryYdhc.FieldByName('D_YDBH').AsString;
    FYdhc[i].AKrbh := qryYdhc.FieldByName('D_KRBH').AsString;
    FYdhc[i].AKrxm := qryYdhc.FieldByName('D_KRXM').AsString;
    FYdhc[i].ASyrq := qryYdhc.FieldByName('D_SYRQ').AsDateTime;
    FYdhc[i].ASjdm := qryYdhc.FieldByName('D_SJDM').AsString;
    FYdhc[i].AHcdm := qryYdhc.FieldByName('D_HCBH').AsString;
    FYdhc[i].AHcmc := qryYdhc.FieldByName('D_HCMC').AsString;
    FYdhc[i].AHczj := qryYdhc.FieldByName('D_HCZJ').AsCurrency;
    FYdhc[i].ARzbz := qryYdhc.FieldByName('D_RZBZ').AsBoolean;
    FYdhc[i].AJsbz := qryYdhc.FieldByName('D_JSBZ').AsString;
    FYdhc[i].AColor := cl3DLight;

    //如果过期
    if FYdhc[i].ASyrq < Date then FYdhc[i].ASjgq := True
    else FYdhc[i].ASjgq := False;
    if FYdhc[i].ASjgq then FYdhc[i].AColor := clYellow;

    //如果确认
    if FYdhc[i].ARzbz then FYdhc[i].AColor := clGreen;

    //如果结算
    if FYdhc[i].AJsbz = JS_YES then FYdhc[i].AColor := clRed;

    FYdhc[i].AImage := 0;
    if FYdhc[i].ARzbz          then FYdhc[i].AImage := 1;
    if FYdhc[i].ASjgq          then FYdhc[i].AImage := 3;
    if FYdhc[i].AJsbz = JS_YES then FYdhc[i].AImage := 2;

    qryYdhc.Next;
    Inc(i);
  end;}
  sgdYdhc.Refresh;
end;


//预定刷新
procedure TMainForm.btnYdRefreshClick(Sender: TObject);
begin
  ShowYdhc;
  ShowYdcy(FSjdm);
  ShowYdkf;
end;

//预定会场
procedure TMainForm.sgdYdhcDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  i : Integer;
begin
  i := ARow*sgdYdhc.ColCount + ACol;

  if (i<FHcNum)and(FYdhc[i].AYdbh<>'') then
  begin
    with sgdYdhc do
    begin
      Canvas.Brush.Color := FYdhc[i].AColor;
      Canvas.FillRect(Rect);
      Canvas.TextOut(Rect.Left,Rect.Top,FYdhc[i].AKrxm);
      //ImageList3.Draw(Canvas,Rect.Left,Rect.Top+60,FYdhc[i].AImage);
    end;
  end;
end;

//预定信息
procedure TMainForm.sgdYdhcDblClick(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'预定') then Exit;
  if FHcSelect < FHcNum then
  begin
    if (not FYdhc[FHcSelect].ARzbz)and(FYdhc[FHcSelect].AJsbz=JS_NO) then
    begin
      YdhcEdit(FYdhc[FHcSelect].AKrbh,FYdhc[FHcSelect].AYdbh);
      ShowYdhc;
      Exit;
    end;
    if (FYdhc[FHcSelect].ARzbz)and(FYdhc[FHcSelect].AJsbz = JS_NO) then
    begin
      YdhcJs(FYdhc[FHcSelect].AKrbh,FYdhc[FHcSelect].AYdbh);
      ShowYdhc;
    end;
  end;
end;

procedure TMainForm.sgdYdhcSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  FHcSelect := ARow*sgdYDhc.ColCount + ACol;
end;

procedure TMainForm.sgdYdcyDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  i : Integer;
begin
  i := ARow*sgdYdcy.ColCount + ACol;
  if i<FCyNum then
  begin
    with sgdYdcy do
    begin
      Canvas.Brush.Color := FYdcy[i].AColor;
      Canvas.FillRect(Rect);
      //Canvas.TextOut(Rect.Left,Rect.Top,DateToStr(FYdcy[i].ASyrq)+FYdcy[i].ASjdm);
      Canvas.TextOut(Rect.Left,Rect.Top,FYdcy[i].ACtmc);
      Canvas.TextOut(Rect.Left,Rect.Top+12,FYdcy[i].AYcbz);
      Canvas.TextOut(Rect.Left,Rect.Top+24,FYdcy[i].ASjdm);
      //ImageList3.Draw(Canvas,Rect.Left,Rect.Top+60,FYdcy[i].AImage);
    end;
  end;
end;

procedure TMainForm.sgdYdcySelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  s : string;
begin
  sgdYdcy.ShowHint := False;
  FCySelect := ARow*sgdYdcy.ColCount + ACol;
  if FCySelect < FCyNum then
  begin
    s := FYdcy[FCySelect].AKrxm+#13#10+
         FYdcy[FCySelect].ACtmc+' '+FYdcy[FCySelect].ASjdm+#13#10+
         FYdcy[FCySelect].AYcbz;
    sgdYdcy.Hint := s;
    sgdYdcy.ShowHint := True;
  end;
end;

procedure TMainForm.sgdYdcyDblClick(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'预定') then Exit;
  if FCySelect < FCyNum then
  begin
    if FYdcy[FCySelect].AYdbh<>'' then
      YdcyskEdit(FYdcy[FCySelect].AKrbh,FYdcy[FCySelect].AYdbh);
    //else
      //YdcytdEdit(FYdcy[FCySelect].AKrbh,FYdcy[FCySelect].AYdbh);
    ShowYdcy(FSjdm);
  end;
end;

//会场结算
procedure TMainForm.btnHcjsClick(Sender: TObject);
begin
  {if not HotelData.CheckYgqx(CZY.CzyBh,'预定') then Exit;
  if (FHcSelect < FHcNum) then
  begin
    if (FYdhc[FHcSelect].ARzbz)and(FYdhc[FHcSelect].AJsbz = JS_NO) then
    begin
      YdhcJs(FYdhc[FHcSelect].AKrbh,FYdhc[FHcSelect].AYdbh);
      ShowYdhc;
    end;
  end;}
  YdhcjsEnter;
end;


//散客预定餐饮

//团队预定餐饮
procedure TMainForm.sgdYdkfDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  i : Integer;
begin
  i := ARow*sgdYdkf.ColCount + ACol;
  if (i<FYdkfNum) then
  begin
    with sgdYdkf do
    begin
      Canvas.Brush.Color := FYdkf[i].AColor;
      Canvas.FillRect(Rect);
      //Canvas.TextOut(Rect.Left,Rect.Top,DateToStr(FYdkf[i].ADdrq)+' '+FormatDateTime('hh:mm',FYdkf[i].ADdsj));
      //Canvas.TextOut(Rect.Left,Rect.Top+15,DateToStr(FYdkf[i].ALdrq)+' '+FormatDateTime('hh:mm',FYdkf[i].ALdsj));
      Canvas.TextOut(Rect.Left,Rect.Top,FYdkf[i].AKfbh);
      //Canvas.TextOut(Rect.Left,Rect.Top+45,FYdkf[i].AKrxm);
      //ImageList3.Draw(Canvas,Rect.Left,Rect.Top+60,FYdkf[i].AImage);
    end;
  end;
end;

procedure TMainForm.sgdYdkfDblClick(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'预定') then Exit;
  if FKfSelect < FYdkfNum then
  begin
    if FYdKf[FKfSelect].AYdbh<>'' then
    begin
      if FYdkf[FKfSelect].AYdbz = YDKF_SK then
        YdkfskEdit(FYdkf[FKfSelect].AYdbh)
      else
        YdkftdEdit(FYdkf[FKfSelect].AKrbh,FYdkf[FKfSelect].AYdbh);
    end;
    ShowYdkf;
  end;
end;

//散客预定客房
procedure TMainForm.sgdYdkfSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  FKfSelect := ARow*sgdYdkf.ColCount + ACol;
end;

//预定说明
procedure TMainForm.BitBtn17Click(Sender: TObject);
begin
  Ydsm;
end;

//按住shift键可以散客结帐
procedure TMainForm.sgdKfztMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
//var
  //AJzxx : TJzxx;
begin
  if (ssShift in Shift) then
    if FSelect < FKfNum then
    begin
      if FKfzt[FSelect].AKfzt <> KFZT_BF then Exit;
      if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;
      SkjzEnter(tblKfzt.FieldByName('D_KFBH').AsString);
      ShowJzkfzt;
      {AJzxx := SkjzEnter(tblKfzt.FieldByName('D_KFBH').AsString);
      if AJzxx.AJzfs<>'' then
      begin
        Zd(AJzxx);
        if ZdForm.ModalResult <> mrOK then
        begin
          ShowJzKfzt;
          //ShowOneKfzt(tblKfzt.FieldByName('D_KFBH').AsString);
          //RefreshKfzt;
        end;
      end;}
    end;
end;

procedure TMainForm.dtpYdrqChange(Sender: TObject);
begin
  ShowYdkf;
end;

procedure TMainForm.btnNextClick(Sender: TObject);
begin
  dtpYdrq.Date := IncDay(dtpYdrq.Date,1);
  ShowYdkf;
end;

procedure TMainForm.btnPrevClick(Sender: TObject);
begin
  dtpYdrq.Date := IncDay(dtpYdrq.Date,-1);
  ShowYdkf;
end;

procedure TMainForm.dtpCyydChange(Sender: TObject);
begin
  ShowYdcy(FSjdm);
end;

procedure TMainForm.SpeedButton2Click(Sender: TObject);
begin
  dtpCyyd.Date := IncDay(dtpCyyd.Date,1);
  ShowYdcy(FSjdm);
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
  dtpCyyd.Date := IncDay(dtpCyyd.Date,-1);
  ShowYdcy(FSjdm);
end;

procedure TMainForm.qryCyTdMasterD_RZBZGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if DisplayText then
  begin
    if Sender.AsBoolean then Text := '已确认'
    else Text := '';
  end;
end;

procedure TMainForm.DBGrid4DblClick(Sender: TObject);
begin
  YdcytdEdit(qryCyTdMasterD_KRBH.Value,qryCyTdMasterD_YDBH.Value);
  qryCyTdMaster.Close;
  qryCyTdMaster.Open;
end;

procedure TMainForm.btnYdcylbClick(Sender: TObject);
begin
  Ydcycx;
end;

procedure TMainForm.btnKfydlbClick(Sender: TObject);
begin
  Ydkfcx;
end;

procedure TMainForm.menuZkClick(Sender: TObject);
var
  s : string;
  i : Integer;
begin
  //if not HotelData.CheckYgqx(CZY.CzyBh,'房态变更') then Exit;
  s := 'update KFZT set D_KFZT = "'+KFZT_OK+'" where D_KFZT="'+KFZT_ZK+'"';
  HotelData.ExecSql(s);
  for i := 0 to FKfNum - 1 do
  begin
    if FKfzt[i].AKfzt = KFZT_ZK then
    begin
      FKfzt[i].AKfzt  := KFZT_OK;
      FKfzt[i].AColor := COLOR_OK;
      FKfzt[i].AImage := 5;
      FKfzt[i].ACjbz  := '';
    end;
  end;
  sgdKfzt.Refresh;
  ShowRzl;
  {with HotelData.qryUserData do
  begin
    s := 'update KFZT set D_KFZT = "'+KFZT_OK+'" where D_KFZT="'+KFZT_ZK+'"';
    Close;
    SQL.Clear;
    SQL.Add(s);
    Prepare;
    ExecSQL;
  end;}
  //RefreshKfzt;
  {tblKfzt.DisableControls;
  try
    tblKfzt.First;
    while not tblKfzt.Eof do
    begin
      if tblKfztD_KFZT.Value = KFZT_ZK then
        HotelData.SetKfzt(tblKfztD_KFBH.Value,KFZT_OK);
      tblKfzt.Next;
    end;
    RefreshKfzt;
  finally
    tblKfzt.EnableControls;
  end;}
end;

procedure TMainForm.N19Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'报表') then Exit;
  XfxmBrow;
end;

procedure TMainForm.btnYdhccxClick(Sender: TObject);
begin
  Ydhccx;
end;

procedure TMainForm.N42Click(Sender: TObject);
begin
end;

//当前收回
procedure TMainForm.N54Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'查询') then Exit;
  Dqsh;
end;

//日收明细
procedure TMainForm.N55Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'查询') then Exit;
  Rsmx;
end;

procedure TMainForm.N56Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'查询') then Exit;
  Dtbqj;
end;
//今日员工结帐
procedure TMainForm.N58Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'查询') then Exit;
  Ygjz;
end;

procedure TMainForm.N50Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'查询') then Exit;
  Khxfmx;
end;

procedure TMainForm.N63Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'预交款上交') then Exit;
  Cwjs(JSLX_YJSJ);
end;

procedure TMainForm.N64Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'报表') then Exit;
  CwjsBrow(JSLX_YJSJ);
end;

procedure TMainForm.N65Click(Sender: TObject);
begin
  if Confirm('你确认退出系统吗？') then
  begin
    Application.Terminate;
  end;
end;

procedure TMainForm.sgdKfztKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    sgdKfztDblClick(nil);
end;
//散客杂单录入
procedure TMainForm.N79Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;
  Yksy;
end;

procedure TMainForm.N82Click(Sender: TObject);
var
  AKrbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'结帐') then Exit;
  AKrbh := TdSel;
  if AKrbh<>'' then
    YksyTd(AKrbh);
end;

procedure TMainForm.OnZdlr(Sender: TObject);
var
  AKrbh: string;
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'接待') then Exit;
  AKrbh := qryTd.FieldByName('D_KRBH').AsString;

  if not CheckTd(AKrbh) then
  begin
    ShowWarning('该团队不存在！请刷新房态。');
    Exit;
  end;

  if AKrbh<>'' then
    YksyTd(AKrbh);

end;

procedure TMainForm.OnChageColor(Sender: TObject);
var
  aColor : TColor;
  i : Integer;
  IniFile: TIniFile;
begin
  if ColorDialog1.Execute then
  begin
    aColor := ColorDialog1.Color;
    (Sender as TStaticText).Color := aColor;
    i := (Sender as TStaticText).Tag;
    case (Sender as TStaticText).Tag of
      1: COLOR_TD1 := aColor;
      2: COLOR_TD2 := aColor;
      3: COLOR_TD3 := aColor;
      4: COLOR_TD4 := aColor;
      5: COLOR_TD5 := aColor;
      6: COLOR_TD6 := aColor;
      7: COLOR_TD7 := aColor;
      8: COLOR_TD8 := aColor;
      9: COLOR_TD9 := aColor;
      10: COLOR_TD10 := aColor;
    end;
  IniFile := TIniFile.Create(APP_DIR+'\'+INI_FILENAME);
  try
    IniFile.WriteInteger('COLOR','COLORTD'+IntToStr(i),aColor);
  finally
    IniFile.Free;
  end;

  end;
end;

procedure TMainForm.N92Click(Sender: TObject);
begin
  Yjcx;
end;

procedure TMainForm.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    qryTd.Close;
    qryTd.SQL.Clear;
    qryTd.SQL.Add('select * from KRXX where D_KRLX="T" order by D_DDRQ,D_DDSJ');
    qryTd.Open;
  end
  else
  begin
    qryTd.Close;
    qryTd.SQL.Clear;
    qryTd.SQL.Add('select * from krxx where (d_krlx="T") and (d_krbh in (select d_krbh from kfzt))');
    qryTd.Open;
  end;
end;

procedure TMainForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then btnRefreshClick(nil);
  if Key = VK_F3 then N56Click(nil);
  if Key = VK_F4 then N31Click(nil);
  if Key = VK_F5 then B111Click(nil);
  if Key = VK_F6 then N4Click(nil);
  if Key = VK_F10 then N24Click(nil);     
end;

procedure TMainForm.N94Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'查询') then Exit;
  Yskcx;
end;

procedure TMainForm.RadioButton1Click(Sender: TObject);
begin
  FSjdm := '全部';
  ShowYdcy(FSjdm);
end;

procedure TMainForm.RadioButton2Click(Sender: TObject);
begin
  FSjdm := '中午';
  ShowYdcy(FSjdm);
end;

procedure TMainForm.RadioButton3Click(Sender: TObject);
begin
  FSjdm := '晚上';
  ShowYdcy(FSjdm);
end;

procedure TMainForm.N95Click(Sender: TObject);
begin
  if not HotelData.CheckYgqx(CZY.CzyBh,'查询') then Exit;
  DhfCx;
end;

procedure TMainForm.OnZdlrcx(Sender: TObject);
begin
  Zdlrcx;
end;

procedure TMainForm.OnFykjzcx(Sender: TObject);
begin
  Fykjzcx;
end;

procedure TMainForm.OnHcjscx(Sender: TObject);
begin
  Hcjscx;
end;

procedure TMainForm.OnLyb(Sender: TObject);
begin
  LybBrow;
end;

end.
