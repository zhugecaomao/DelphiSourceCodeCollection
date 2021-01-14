unit FlatCode;

interface

uses windows, Messages, SysUtils, Classes, Graphics, Controls, FlatUtils;

type
  TFlatLines     = (ltWhite,ltBlack, ltblack_half);
  //定义条形码类型
  TFlatColeType  =(Code25IL, Code25IT, Code25Mx, Code39,
                   Code39Ext, Code128A, Code128B, Code128C,
                   Code93, Code93Ext, CodeMSI, PostNet, Codabar,
                   EAN8, EAN13, EAN128A, EAN128B, EAN128C,
                   UPC_A, UPC_EODD, UPC_EVEN, UPC_S2, UPC_S5);
  TFlatRotation =(raNone,ra090,ra180,ra270);


  TFlatModules = array[0..3] of ShortInt;
  { TFlatBarcode }
  TFlatBarcode = class(TVersionControl)
   private
    fText           : string;
    FModul          : integer;
    FRatio          : double;
    FCodeType       : TFlatColeType;
    FRotateType     : TFlatRotation;
    fBarHeight      : Integer;
    fBorderWidth    : Byte;
    fBarColor       : TColor;
    fBarTop         : Byte;

    fTypName        : String;
    fColor          : TColor;
    FShowText       : boolean;
    FCheckSum       : boolean;
    fCheckOdd       : Boolean;
    fTransparent    : boolean;
    fAutoSize       : Boolean;
    procedure SetModul(const Value:Integer);
    procedure SetRotateType(const Value: TFlatRotation);
    procedure SetRatio(const Value: double);
    procedure SetCodeType(const Value: TFlatColeType);
    procedure SetText(const Value: string);
    procedure SetBarHeight(const Value: Integer);
    procedure SetBorderWidth(const Value: Byte);
    procedure SetBarColor(const Value: TColor);
    procedure SetBarTop(const Value: Byte);
    procedure SetColor(const Value: TColor);
    procedure FontChange(sender : TObject);
    procedure SetBools(Index: Integer; Value: Boolean);
   protected
    fBitmap: TBitmap;
    function Code_25ILeaved  : string;
    function Code_25ITrial   : string;
    function Code_25Matrix   : string;
    function Code_39         : string;
    function Code_128        : string;
    function Code_93         : string;
    function Code_MSI        : string;
    function Code_PostNet    : string;
    function Code_CodaBar    : string;
    function Code_EAN8       : string;
    function Code_EAN13      : string;
    function Code_UPC_A      : string;
    function Code_UPC_EODD   : string;
    function Code_UPC_EVEN   : string;
    function Code_Supp5      : string;
    function Code_Supp2      : string;
    Function MakeData        : string;
    function MakeBarText     : String;
    function GetTypName      : String;
    function GetProLine      : Integer;
    function DoCheckSumming(const Data: string;OddCheck:Boolean=True): string;
    function GetCheckLen(CodeType: TFlatColeType; Data: String): String;
    function SetLen(pI:byte): string;
    function ClearNotText(Value: String): String;
    function MakeModules : TFlatModules;

    procedure DrawBarcode;
    procedure OneBarProps(Data: Char; var Width: Integer; var lt: TFlatLines);
    procedure GetABCED(var a, b, c, d, orgin: TPoint; xadd, Width, Height: Integer);
    procedure DrawEAN13Text(Canvas: TCanvas; width,wBorder: Integer);
    procedure DrawEAN8Text(Canvas: TCanvas; width, wBorder: Integer);
    procedure DrawUPC_AText(Canvas: TCanvas; width, wBorder: Integer);
    procedure DrawUPC_EText(Canvas: TCanvas; width, wBorder: Integer);
    property Data      : String read MakeData;
    property BarText   : String read MakeBarText;
    property Modules   : TFlatModules read MakeModules;
    property ProLine   : Integer read GetProLine;
    procedure Paint; override;
    procedure WMSize (var Message: TWMSize); message WM_SIZE;
   public
    constructor Create(Owner:TComponent); override;
    destructor destroy;override;
    property Bitmap: TBitmap read fBitmap;
   published
    property BarCode: String  read GetTypName write fTypName;
    property Rotate: TFlatRotation read FRotateType write SetRotateType;
    property Modul: Integer read fModul write SetModul;
    property Ratio: double read fRatio write SetRatio;
    property CodeType: TFlatColeType read FCodeType write SetCodeType default EAN13;
    property Text: string  read fText write SetText;
    property LineHeight: Integer read fBarHeight write SetBarHeight;
    property BorderWidth: Byte read fBorderWidth write SetBorderWidth;
    property LineTop: Byte read fBarTop write SetBarTop;
    property Color: TColor read FColor write SetColor default clWhite;
    property LineColor: TColor read fBarColor write SetBarColor default clBlack;
    property AutoSize: Boolean index 0 read fAutoSize write SetBools default True;
    property Checksum: boolean index 1 read FCheckSum write SetBools default FALSE;
    property CheckOdd: Boolean index 2 read fCheckOdd write SetBools default true;
    property ShowText: boolean index 3 read FShowText write SetBools default True;
    property Transparent: boolean index 4 read fTransparent write SetBools default false;
    property ShowHint;
    property ParentFont;
    property Font;
    property Height;
    property Width;
    property Top;
    property Left;
    property OnClick;
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

implementation

type
  TCode93 = record
     c : char;
     data : array[0..5] of char;
  end;

  TCode39 = record
     c : char;
     data : array[0..9] of char;
     chk: shortint;
  end;

  TCode128 = record
     a, b : char;
     c : string[2];
     data : string[6];
  end;

  TCodabar = record
     c : char;
     data : array[0..6] of char;
  end;

  TBCData = record
     Name:string;        { Name of Barcode }
     num :Boolean;       { numeric data only }
  end;

const
  StartA       = '211412';
  StartB       = '211214';
  StartC       = '211232';
  Stop         = '2331112';
  {Pattern for Barcode EAN Charset A} {L1   S1   L2   S2}
  BARCode_EAN_A:array['0'..'9'] of string =
              (('2605'), { 0 } ('1615'), { 1 }
               ('1516'), { 2 } ('0805'), { 3 }
               ('0526'), { 4 } ('0625'), { 5 }
               ('0508'), { 6 } ('0706'), { 7 }
               ('0607'), { 8 } ('2506'));{ 9 }
  BARCode_EAN_B:array['0'..'9'] of string =
              (('0517'), { 0 } ('0616'), { 1 }
               ('1606'), { 2 } ('0535'), { 3 }
               ('1705'), { 4 } ('0715'), { 5 }
               ('3505'), { 6 } ('1525'), { 7 }
               ('2515'), { 8 } ('1507'));{ 9 }
{Pattern for Barcode EAN Charset C}		 {S1   L1   S2   L2}
  BARCode_EAN_C:array['0'..'9'] of string =
              (('7150' ), { 0 }('6160' ), { 1 }
               ('6061' ), { 2 }('5350' ), { 3 }
               ('5071' ), { 4 }('5170' ), { 5 }
               ('5053' ), { 6 }('5251' ), { 7 }
               ('5152' ), { 8 }('7051' ));{ 9 }
  BARCode_ParityEAN13:array[0..9, 1..6] of char =
              (('A', 'A', 'A', 'A', 'A', 'A'), { 0 }
               ('A', 'A', 'B', 'A', 'B', 'B'), { 1 }
               ('A', 'A', 'B', 'B', 'A', 'B'), { 2 }
               ('A', 'A', 'B', 'B', 'B', 'A'), { 3 }
               ('A', 'B', 'A', 'A', 'B', 'B'), { 4 }
               ('A', 'B', 'B', 'A', 'A', 'B'), { 5 }
               ('A', 'B', 'B', 'B', 'A', 'A'), { 6 }
               ('A', 'B', 'A', 'B', 'A', 'B'), { 7 }
               ('A', 'B', 'A', 'B', 'B', 'A'), { 8 }
               ('A', 'B', 'B', 'A', 'B', 'A'));  { 9 }
  BARCode_UPC_E:array['0'..'9', 1..6] of char =
              (('E', 'E', 'E', 'O', 'O', 'O' ), { 0 }
               ('E', 'E', 'O', 'E', 'O', 'O' ), { 1 }
               ('E', 'E', 'O', 'O', 'E', 'O' ), { 2 }
               ('E', 'E', 'O', 'O', 'O', 'E' ), { 3 }
               ('E', 'O', 'E', 'E', 'O', 'O' ), { 4 }
               ('E', 'O', 'O', 'E', 'E', 'O' ), { 5 }
               ('E', 'O', 'O', 'O', 'E', 'E' ), { 6 }
               ('E', 'O', 'E', 'O', 'E', 'O' ), { 7 }
               ('E', 'O', 'E', 'O', 'O', 'E' ), { 8 }
               ('E', 'O', 'O', 'E', 'O', 'E' ));  { 9 }
  BARCode_PostNet:array['0'..'9'] of string[10] =
              (('5151A1A1A1'),{0}
               ('A1A1A15151'),{1}
               ('A1A151A151'),{2}
               ('A1A15151A1'),{3}
               ('A151A1A151'),{4}
               ('A151A151A1'),{5}
               ('A15151A1A1'),{6}
               ('51A1A1A151'),{7}
               ('51A1A151A1'),{8}
               ('51A151A1A1'));   {9}
  BARCode_MSI:array['0'..'9'] of string[8] =
              (('51515151'),{0}
               ('51515160'),{1}
               ('51516051'),{2}
               ('51516060'),{3}
               ('51605151'),{4}
               ('51605160'),{5}
               ('51606051'),{6}
               ('51606060'),{7}
               ('60515151'),{8}
               ('60515160'));{9}
  BARCode_25:array['0'..'9', 1..5] of char =
              (('0', '0', '1', '1', '0'),    // 0
               ('1', '0', '0', '0', '1'),    // 1
               ('0', '1', '0', '0', '1'),    // 2
               ('1', '1', '0', '0', '0'),    // 3
               ('0', '0', '1', '0', '1'),    // 4
               ('1', '0', '1', '0', '0'),    // 5
               ('0', '1', '1', '0', '0'),    // 6
               ('0', '0', '0', '1', '1'),    // 7
               ('1', '0', '0', '1', '0'),    // 8
               ('0', '1', '0', '1', '0'));   // 9
  BARCode_Codabar: array[0..19] of TCodabar =
              ((c:'1'; data:'5050615'),
               (c:'2'; data:'5051506'),
               (c:'3'; data:'6150505'),
               (c:'4'; data:'5060515'),
               (c:'5'; data:'6050515'),
               (c:'6'; data:'5150506'),
               (c:'7'; data:'5150605'),
               (c:'8'; data:'5160505'),
               (c:'9'; data:'6051505'),
               (c:'0'; data:'5050516'),
               (c:'-'; data:'5051605'),
               (c:'$'; data:'5061505'),
               (c:':'; data:'6050606'),
               (c:'/'; data:'6060506'),
               (c:'.'; data:'6060605'),
               (c:'+'; data:'5060606'),
               (c:'A'; data:'5061515'),
               (c:'B'; data:'5151506'), //'5151506'  '5061515'
               (c:'C'; data:'5051516'),
               (c:'D'; data:'5051615'));
  BARCode_39x : array[0..127] of string[2] =
              (('%U'), ('$A'), ('$B'), ('$C'), ('$D'), ('$E'), ('$F'), ('$G'),
               ('$H'), ('$I'), ('$J'), ('$K'), ('$L'), ('$M'), ('$N'), ('$O'),
               ('$P'), ('$Q'), ('$R'), ('$S'), ('$T'), ('$U'), ('$V'), ('$W'),
               ('$X'), ('$Y'), ('$Z'), ('%A'), ('%B'), ('%C'), ('%D'), ('%E'),
               (' ' ), ('/A'), ('/B'), ('/C'), ('/D'), ('/E'), ('/F'), ('/G'),
               ('/H'), ('/I'), ('/J'), ('/K'), ('/L'), ('/M'), ('/N'), ('/O'),
               ('0' ), ('1' ), ('2' ), ('3' ), ('4' ), ('5' ), ('6' ), ('7' ),
               ('8' ), ('9' ), ('/Z'), ('%F'), ('%G'), ('%H'), ('%I'), ('%J'),
               ('%V'), ('A' ), ('B' ), ('C' ), ('D' ), ('E' ), ('F' ), ('G' ),
               ('H' ), ('I' ), ('J' ), ('K' ), ('L' ), ('M' ), ('N' ), ('O' ),
               ('P' ), ('Q' ), ('R' ), ('S' ), ('T' ), ('U' ), ('V' ), ('W' ),
               ('X' ), ('Y' ), ('Z' ), ('%K'), ('%L'), ('%M'), ('%N'), ('%O'),
               ('%W'), ('+A'), ('+B'), ('+C'), ('+D'), ('+E'), ('+F'), ('+G'),
               ('+H'), ('+I'), ('+J'), ('+K'), ('+L'), ('+M'), ('+N'), ('+O'),
               ('+P'), ('+Q'), ('+R'), ('+S'), ('+T'), ('+U'), ('+V'), ('+W'),
               ('+X'), ('+Y'), ('+Z'), ('%P'), ('%Q'), ('%R'), ('%S'), ('%T'));
  BARCode_93x : array[0..127] of string[2] =
	            ((']U'), ('[A'), ('[B'), ('[C'), ('[D'), ('[E'), ('[F'), ('[G'),
               ('[H'), ('[I'), ('[J'), ('[K'), ('[L'), ('[M'), ('[N'), ('[O'),
               ('[P'), ('[Q'), ('[R'), ('[S'), ('[T'), ('[U'), ('[V'), ('[W'),
               ('[X'), ('[Y'), ('[Z'), (']A'), (']B'), (']C'), (']D'), (']E'),
               (' ' ), ('{A'), ('{B'), ('{C'), ('{D'), ('{E'), ('{F'), ('{G'),
               ('{H'), ('{I'), ('{J'), ('{K'), ('{L'), ('{M'), ('{N'), ('{O'),
               ('0' ), ('1' ), ('2' ), ('3' ), ('4' ), ('5' ), ('6' ), ('7' ),
               ('8' ), ('9' ), ('{Z'), (']F'), (']G'), (']H'), (']I'), (']J'),
               (']V'), ('A' ), ('B' ), ('C' ), ('D' ), ('E' ), ('F' ), ('G' ),
               ('H' ), ('I' ), ('J' ), ('K' ), ('L' ), ('M' ), ('N' ), ('O' ),
               ('P' ), ('Q' ), ('R' ), ('S' ), ('T' ), ('U' ), ('V' ), ('W' ),
               ('X' ), ('Y' ), ('Z' ), (']K'), (']L'), (']M'), (']N'), (']O'),
               (']W'), ('}A'), ('}B'), ('}C'), ('}D'), ('}E'), ('}F'), ('}G'),
               ('}H'), ('}I'), ('}J'), ('}K'), ('}L'), ('}M'), ('}N'), ('}O'),
               ('}P'), ('}Q'), ('}R'), ('}S'), ('}T'), ('}U'), ('}V'), ('}W'),
               ('}X'), ('}Y'), ('}Z'), (']P'), (']Q'), (']R'), (']S'), (']T'));
  BARCode_93: array[0..46] of TCode93 =
              ((c:'0'; data:'131112'),
               (c:'1'; data:'111213'),
               (c:'2'; data:'111312'),
               (c:'3'; data:'111411'),
               (c:'4'; data:'121113'),
               (c:'5'; data:'121212'),
               (c:'6'; data:'121311'),
               (c:'7'; data:'111114'),
               (c:'8'; data:'131211'),
               (c:'9'; data:'141111'),
               (c:'A'; data:'211113'),
               (c:'B'; data:'211212'),
               (c:'C'; data:'211311'),
               (c:'D'; data:'221112'),
               (c:'E'; data:'221211'),
               (c:'F'; data:'231111'),
               (c:'G'; data:'112113'),
               (c:'H'; data:'112212'),
               (c:'I'; data:'112311'),
               (c:'J'; data:'122112'),
               (c:'K'; data:'132111'),
               (c:'L'; data:'111123'),
               (c:'M'; data:'111222'),
               (c:'N'; data:'111321'),
               (c:'O'; data:'121122'),
               (c:'P'; data:'131121'),
               (c:'Q'; data:'212112'),
               (c:'R'; data:'212211'),
               (c:'S'; data:'211122'),
               (c:'T'; data:'211221'),
               (c:'U'; data:'221121'),
               (c:'V'; data:'222111'),
               (c:'W'; data:'112122'),
               (c:'X'; data:'112221'),
               (c:'Y'; data:'122121'),
               (c:'Z'; data:'123111'),
               (c:'-'; data:'121131'),
               (c:'.'; data:'311112'),
               (c:' '; data:'311211'),
               (c:'$'; data:'321111'),
               (c:'/'; data:'112131'),
               (c:'+'; data:'113121'),
               (c:'%'; data:'211131'),
               (c:'['; data:'121221'),   // only used for Extended Code 93
               (c:']'; data:'312111'),   // only used for Extended Code 93
               (c:'{'; data:'311121'),   // only used for Extended Code 93
               (c:'}'; data:'122211'));  // only used for Extended Code 93
  BARCode_39: array[0..43] of TCode39 =
              ((c:'0'; data:'505160605'; chk:0 ),
               (c:'1'; data:'605150506'; chk:1 ),
               (c:'2'; data:'506150506'; chk:2 ),
               (c:'3'; data:'606150505'; chk:3 ),
               (c:'4'; data:'505160506'; chk:4 ),
               (c:'5'; data:'605160505'; chk:5 ),
               (c:'6'; data:'506160505'; chk:6 ),
               (c:'7'; data:'505150606'; chk:7 ),
               (c:'8'; data:'605150605'; chk:8 ),
               (c:'9'; data:'506150605'; chk:9 ),
               (c:'A'; data:'605051506'; chk:10),
               (c:'B'; data:'506051506'; chk:11),
               (c:'C'; data:'606051505'; chk:12),
               (c:'D'; data:'505061506'; chk:13),
               (c:'E'; data:'605061505'; chk:14),
               (c:'F'; data:'506061505'; chk:15),
               (c:'G'; data:'505051606'; chk:16),
               (c:'H'; data:'605051605'; chk:17),
               (c:'I'; data:'506051600'; chk:18),
               (c:'J'; data:'505061605'; chk:19),
               (c:'K'; data:'605050516'; chk:20),
               (c:'L'; data:'506050516'; chk:21),
               (c:'M'; data:'606050515'; chk:22),
               (c:'N'; data:'505060516'; chk:23),
               (c:'O'; data:'605060515'; chk:24),
               (c:'P'; data:'506060515'; chk:25),
               (c:'Q'; data:'505050616'; chk:26),
               (c:'R'; data:'605050615'; chk:27),
               (c:'S'; data:'506050615'; chk:28),
               (c:'T'; data:'505060615'; chk:29),
               (c:'U'; data:'615050506'; chk:30),
               (c:'V'; data:'516050506'; chk:31),
               (c:'W'; data:'616050505'; chk:32),
               (c:'X'; data:'515060506'; chk:33),
               (c:'Y'; data:'615060505'; chk:34),
               (c:'Z'; data:'516060505'; chk:35),
               (c:'-'; data:'515050606'; chk:36),
               (c:'.'; data:'615050605'; chk:37),
               (c:' '; data:'516050605'; chk:38),
               (c:'*'; data:'515060605'; chk:0 ),
               (c:'$'; data:'515151505'; chk:39),
               (c:'/'; data:'515150515'; chk:40),
               (c:'+'; data:'515051515'; chk:41),
               (c:'%'; data:'505151515'; chk:42));
  BARCode_128: array[0..102] of TCode128 =
              ((a:' '; b:' '; c:'00'; data:'212222'; ),
               (a:'!'; b:'!'; c:'01'; data:'222122'; ),
               (a:'"'; b:'"'; c:'02'; data:'222221'; ),
               (a:'#'; b:'#'; c:'03'; data:'121223'; ),
               (a:'$'; b:'$'; c:'04'; data:'121322'; ),
               (a:'%'; b:'%'; c:'05'; data:'131222'; ),
               (a:'&'; b:'&'; c:'06'; data:'122213'; ),
               (a:'''';b:'''';c:'07'; data:'122312'; ),
               (a:'('; b:'('; c:'08'; data:'132212'; ),
               (a:')'; b:')'; c:'09'; data:'221213'; ),
               (a:'*'; b:'*'; c:'10'; data:'221312'; ),
               (a:'+'; b:'+'; c:'11'; data:'231212'; ),
               (a:'?'; b:'?'; c:'12'; data:'112232'; ),
               (a:'-'; b:'-'; c:'13'; data:'122132'; ),
               (a:'.'; b:'.'; c:'14'; data:'122231'; ),
               (a:'/'; b:'/'; c:'15'; data:'113222'; ),
               (a:'0'; b:'0'; c:'16'; data:'123122'; ),
               (a:'1'; b:'1'; c:'17'; data:'123221'; ),
               (a:'2'; b:'2'; c:'18'; data:'223211'; ),
               (a:'3'; b:'3'; c:'19'; data:'221132'; ),
               (a:'4'; b:'4'; c:'20'; data:'221231'; ),
               (a:'5'; b:'5'; c:'21'; data:'213212'; ),
               (a:'6'; b:'6'; c:'22'; data:'223112'; ),
               (a:'7'; b:'7'; c:'23'; data:'312131'; ),
               (a:'8'; b:'8'; c:'24'; data:'311222'; ),
               (a:'9'; b:'9'; c:'25'; data:'321122'; ),
               (a:':'; b:':'; c:'26'; data:'321221'; ),
               (a:';'; b:';'; c:'27'; data:'312212'; ),
               (a:'<'; b:'<'; c:'28'; data:'322112'; ),
               (a:'='; b:'='; c:'29'; data:'322211'; ),
               (a:'>'; b:'>'; c:'30'; data:'212123'; ),
               (a:'?'; b:'?'; c:'31'; data:'212321'; ),
               (a:'@'; b:'@'; c:'32'; data:'232121'; ),
               (a:'A'; b:'A'; c:'33'; data:'111323'; ),
               (a:'B'; b:'B'; c:'34'; data:'131123'; ),
               (a:'C'; b:'C'; c:'35'; data:'131321'; ),
               (a:'D'; b:'D'; c:'36'; data:'112313'; ),
               (a:'E'; b:'E'; c:'37'; data:'132113'; ),
               (a:'F'; b:'F'; c:'38'; data:'132311'; ),
               (a:'G'; b:'G'; c:'39'; data:'211313'; ),
               (a:'H'; b:'H'; c:'40'; data:'231113'; ),
               (a:'I'; b:'I'; c:'41'; data:'231311'; ),
               (a:'J'; b:'J'; c:'42'; data:'112133'; ),
               (a:'K'; b:'K'; c:'43'; data:'112331'; ),
               (a:'L'; b:'L'; c:'44'; data:'132131'; ),
               (a:'M'; b:'M'; c:'45'; data:'113123'; ),
               (a:'N'; b:'N'; c:'46'; data:'113321'; ),
               (a:'O'; b:'O'; c:'47'; data:'133121'; ),
               (a:'P'; b:'P'; c:'48'; data:'313121'; ),
               (a:'Q'; b:'Q'; c:'49'; data:'211331'; ),
               (a:'R'; b:'R'; c:'50'; data:'231131'; ),
               (a:'S'; b:'S'; c:'51'; data:'213113'; ),
               (a:'T'; b:'T'; c:'52'; data:'213311'; ),
               (a:'U'; b:'U'; c:'53'; data:'213131'; ),
               (a:'V'; b:'V'; c:'54'; data:'311123'; ),
               (a:'W'; b:'W'; c:'55'; data:'311321'; ),
               (a:'X'; b:'X'; c:'56'; data:'331121'; ),
               (a:'Y'; b:'Y'; c:'57'; data:'312113'; ),
               (a:'Z'; b:'Z'; c:'58'; data:'312311'; ),
               (a:'['; b:'['; c:'59'; data:'332111'; ),
               (a:'\'; b:'\'; c:'60'; data:'314111'; ),
               (a:']'; b:']'; c:'61'; data:'221411'; ),
               (a:'^'; b:'^'; c:'62'; data:'431111'; ),
               (a:'_'; b:'_'; c:'63'; data:'111224'; ),
               (a:' '; b:'`'; c:'64'; data:'111422'; ),
               (a:' '; b:'a'; c:'65'; data:'121124'; ),
               (a:' '; b:'b'; c:'66'; data:'121421'; ),
               (a:' '; b:'c'; c:'67'; data:'141122'; ),
               (a:' '; b:'d'; c:'68'; data:'141221'; ),
               (a:' '; b:'e'; c:'69'; data:'112214'; ),
               (a:' '; b:'f'; c:'70'; data:'112412'; ),
               (a:' '; b:'g'; c:'71'; data:'122114'; ),
               (a:' '; b:'h'; c:'72'; data:'122411'; ),
               (a:' '; b:'i'; c:'73'; data:'142112'; ),
               (a:' '; b:'j'; c:'74'; data:'142211'; ),
               (a:' '; b:'k'; c:'75'; data:'241211'; ),
               (a:' '; b:'l'; c:'76'; data:'221114'; ),
               (a:' '; b:'m'; c:'77'; data:'413111'; ),
               (a:' '; b:'n'; c:'78'; data:'241112'; ),
               (a:' '; b:'o'; c:'79'; data:'134111'; ),
               (a:' '; b:'p'; c:'80'; data:'111242'; ),
               (a:' '; b:'q'; c:'81'; data:'121142'; ),
               (a:' '; b:'r'; c:'82'; data:'121241'; ),
               (a:' '; b:'s'; c:'83'; data:'114212'; ),
               (a:' '; b:'t'; c:'84'; data:'124112'; ),
               (a:' '; b:'u'; c:'85'; data:'124211'; ),
               (a:' '; b:'v'; c:'86'; data:'411212'; ),
               (a:' '; b:'w'; c:'87'; data:'421112'; ),
               (a:' '; b:'x'; c:'88'; data:'421211'; ),
               (a:' '; b:'y'; c:'89'; data:'212141'; ),
               (a:' '; b:'z'; c:'90'; data:'214121'; ),
               (a:' '; b:'{'; c:'91'; data:'412121'; ),
               (a:' '; b:'|'; c:'92'; data:'111143'; ),
               (a:' '; b:'}'; c:'93'; data:'111341'; ),
               (a:' '; b:'~'; c:'94'; data:'131141'; ),
               (a:' '; b:' '; c:'95'; data:'114113'; ),
               (a:' '; b:' '; c:'96'; data:'114311'; ),
               (a:' '; b:' '; c:'97'; data:'411113'; ),
               (a:' '; b:' '; c:'98'; data:'411311'; ),
               (a:' '; b:' '; c:'99'; data:'113141'; ),
               (a:' '; b:' '; c:'  '; data:'114131'; ),
               (a:' '; b:' '; c:'  '; data:'311141'; ),
               (a:' '; b:' '; c:'  '; data:'411131'; ));

  BCData:array[Code25IL..UPC_S5] of TBCData =
        ((Name:'Code InterLeaved 2.5'; num:True),
	       (Name:'Code Industrial 2.5';  num:True),
	       (Name:'Code Matrix 2.5';      num:True),
	       (Name:'Code 39';              num:False),
	       (Name:'Code 39 Extended';     num:False),
	       (Name:'Code 128A';            num:False),
	       (Name:'Code 128B';            num:False),
	       (Name:'Code 128C';            num:True),
	       (Name:'Code 93';              num:False),
         (Name:'Code 93 Extended';     num:False),
	       (Name:'Code MSI';             num:True),
	       (Name:'Code PostNet';         num:True),
	       (Name:'Codabar';              num:False),
	       (Name:'EAN-8';                num:True),
	       (Name:'EAN-13';               num:True),
         (Name:'EAN-128A';             num:False),
	       (Name:'EAN-128B';             num:False),
	       (Name:'EAN-128C';             num:True),
	       (Name:'UPC-A';                num:True),
	       (Name:'UPC-EODD';             num:True),
	       (Name:'UPC-EVEN';             num:True),
	       (Name:'UPC-Supp2';            num:True),
	       (Name:'UPC-Supp5';            num:True));

{assist function}
function getSupp(Nr : String) : String;
var i,fak,sum : Integer;
		  tmp   : String;
begin
	sum := 0;
	tmp := copy(nr,1,Length(Nr)-1);
	fak := Length(tmp);
	for i:=1 to length(tmp) do
	begin
		if (fak mod 2) = 0 then
			sum := sum + (StrToInt(tmp[i])*9)
		else
			sum := sum + (StrToInt(tmp[i])*3);
		dec(fak);
	end;
	sum:=((sum mod 10) mod 10) mod 10;
	result := tmp+IntToStr(sum);
end;

{$ifndef WIN32}
function Trim(const S: string): string; export;
{ Removes leading and trailing whitespace from s}
var
  I, L: Integer;
begin
  L := Length(S);
  I := 1;
  while (I <= L) and (S[I] <= ' ') do Inc(I);
  if I > L then Result := '' else
  begin
	 while S[L] <= ' ' do Dec(L);
	 Result := Copy(S, I, L - I + 1);
  end;
end;
{$endif}

function Convert(s:string): string;
var i, v : integer;
    t : string;
begin
 t := '';
 for i:=1 to Length(s) do
 begin
  v := ord(s[i]) - 1;
  if odd(i) then
     Inc(v, 5);
  t := t + Chr(v);
 end;
 Convert := t;
end;

function Quersumme(x:integer):integer;
var sum:integer;
begin
 sum := 0;
 while x > 0 do
  begin
   sum := sum + (x mod 10);
   x := x div 10;
  end;
 result := sum;
end;

constructor TFlatBarcode.Create(Owner:TComponent);
begin
  fBitmap       := TBitmap.Create;
  inherited Create(owner);
  Font.OnChange := FontChange;
  Height       := 50;
  Width        := 100;
  fBarColor    := clBlack;
  fColor       := clWhite;
  fRotateType  := raNone;
  fAutoSize    := true;
  fRatio       := 2.0;
  fModul       := 1;
  fCodeType    := EAN13;
  fBarHeight   := 35;
  fBorderWidth := 5;
  fBarTop      := 5;
  fCheckSum    := FALSE;
  fShowText    := True;
  fTransparent := false;
  fCheckOdd    := true;
  fText        := '0123456789';
end;

destructor TFlatBarcode.destroy;
begin
  fBitmap.Free;
  inherited Destroy;
end;

function TFlatBarcode.SetLen(pI: byte): string;
begin
 Result := fText;
 while Length(Result) < pI do
       Result:=Result+'0';
end;

function TFlatBarcode.DoCheckSumming(const Data: string;OddCheck:Boolean=True): string;
var i,sum,s : Integer;
begin
  sum := 0;
  for i:=1 to Length(data) do
  begin
    s := StrToInt(Data[i]);
    if OddCheck then
     begin
      if odd(i) then
         sum := sum + s
      else
         sum := sum + s*3;
      end
    else
     begin
      if odd(i) then
         sum := sum + s*3
      else
         sum := sum + s;
     end;
  end;
  if (sum mod 10) = 0 then
      result := data+'0'
  else
      result := data+IntToStr(10-(sum mod 10));
end;

function  TFlatBarcode.GetCheckLen(CodeType:TFlatColeType;Data:String): string;
begin
 result := Data;
 case CodeType of
     EAN13:Begin
           if Length(Result)>12 then
              result := Copy(Result,1,12)
           else
              result := SetLen(12);
           result := DoCheckSumming(Result,fCheckOdd);
           end;
     EAN8:begin
           if Length(Result)>7 then
              result := Copy(Result,1,7)
           else
              result := SetLen(7);
           result := DoCheckSumming(result,fCheckOdd);
          end;
     UPC_A:begin
           if Length(Result)>11 then
              result := Copy(Result,1,11)
           else
              result := SetLen(11);
           result := DoCheckSumming(result,fCheckOdd);
           end;
     UPC_EODD,UPC_EVEN:
           begin
            if Length(Result)>6 then
               result := Copy(Result,1,6)
            else
               result := SetLen(6);
            result := DoCheckSumming(result,fCheckOdd);
           end;
     UPC_S2:
           begin
            if Length(Result)>2 then
               result := Copy(Result,1,2)
            else
               result := SetLen(2);
            result := getSupp(copy(Result,1,2)+'0');
           end;
     UPC_S5:
           begin
            if Length(Result)>5 then
               result := Copy(Result,1,5)
            else
               result := SetLen(5);
            result := getSupp(copy(Result,1,5)+'0');
           end;
    end;
end;

function  TFlatBarcode.ClearNotText(Value:String): string;
var inx:Integer;TempValue: string;
begin
    result := '';
    case CodeType of
      Code25IL, Code25IT, Code25Mx,
      CodeMSI, PostNet, EAN13, EAN8,
      UPC_A, UPC_EODD, UPC_EVEN, UPC_S2,
      Code128C,EAN128A,EAN128B,EAN128C,
      UPC_S5: begin
                TempValue := UpperCase(Value);
                for inx:=1 to Length(TempValue) do
                  if TempValue[Inx] in ['0'..'9'] then
                     result := result + TempValue[Inx];
                result := GetCheckLen(CodeType,result);
              end;
      Codabar:begin
                TempValue := UpperCase(Value);
                for inx:=1 to Length(TempValue) do
                  if TempValue[Inx] in ['0'..'9','A'..'B','-','$',':','/','.','+'] then
                     Result := result + TempValue[Inx];
              end;
      Code39, Code93:
              Begin
                result := UpperCase(Value);
              end;
      Code93Ext:
              Begin
                for inx:=0 to Length(Value) do
	         begin
	           if ord(Value[inx]) <= 127 then
		      result := result + BARCode_93x[ord(Value[inx])];
	         end;
              end;
      Code39Ext:
              begin
                for inx:=0 to Length(Value) do
                 begin
                   if ord(value[inx]) <= 127 then
                      result := result + BARCode_39x[ord(value[inx])];
                 end;
              end;
    else
      result := Value;
    end;
end;

function TFlatBarcode.MakeBarText: String;
begin
 result := ClearNotText(fText);
end;

function TFlatBarcode.Code_25ILeaved: string;
var i, j: integer;
    c : char;
begin
 result := result + '5050';   // Startcode
 for i:=1 to Length(BarText) div 2 do
  begin
   for j:= 1 to 5 do
    begin
     if BARCode_25[BarText[i*2-1], j] = '1' then
        c := '6'
     else
        c := '5';
     result := result + c;
     if BARCode_25[BarText[i*2], j] = '1' then
        c := '1'
     else
        c := '0';
     result := result + c;
    end;
  end;
 result := result + '605';    // Stopcode
end;

function TFlatBarcode.Code_25ITrial: string;
var i, j: integer;
begin
 result := result + '606050';   // Startcode
 for i:=1 to Length(BarText) do
  begin
   for j:= 1 to 5 do
    begin
    if BARCode_25[BarText[i], j] = '1' then
       result := result + '60'
    else
       result := result + '50';
    end;
  end;
 result := result + '605060';   // Stopcode
end;

function TFlatBarcode.Code_25Matrix: string;
var i, j: integer;c :char;
begin
 result := result + '705050';   // Startcode
 for i:=1 to Length(BarText) do
 begin
  for j:= 1 to 5 do
   begin
    if BARCode_25[BarText[i], j] = '1' then
       c := '1'
    else
       c := '0';
  if odd(j) then
     c := chr(ord(c)+5);
  result := result + c;
 end;
result := result + '0';   // L點ke zwischen den Zeichen
end;
result := result + '70505';   // Stopcode
end;

function TFlatBarcode.Code_39: string;
 function FindIdx(z:char):integer;
 var i:integer;
 begin
  for i:=0 to High(BARCode_39) do
   begin
    if z = BARCode_39[i].c then
     begin
       result := i;
       exit;
     end;
   end;
  result := -1;
 end;
var i, idx , checksum:integer;
begin
 checksum := 0;// Startcode
 result := BARCode_39[FindIdx('*')].data + '0';
 for i:=1 to Length(BarText) do
  begin
   idx := FindIdx(BarText[i]);
   if idx < 0 then
      continue;
   result := result + BARCode_39[idx].data + '0';
   Inc(checksum, BARCode_39[idx].chk);
  end;// Calculate Checksum Data
 if FCheckSum then
 begin
  checksum := checksum mod 43;
  for i:=0 to High(BARCode_39) do
   if checksum = BARCode_39[i].chk then
    begin
     result := result + BARCode_39[i].data + '0';
     break;
    end;
 end;// Stopcode
 result := result + BARCode_39[FindIdx('*')].data;
end;

{Code 128}
function TFlatBarcode.Code_128: string;
 function Find_Code128AB(c:char):integer;  // find Code 128 Codeset A or B
 var i:integer; v:char;
 begin
  for i:=0 to High(BARCode_128) do
   begin
    if FCodeType = Code128A then
       v := BARCode_128[i].a
    else
       v := BARCode_128[i].b;
    if c = v then
     begin
       result := i;
       exit;
     end;
   end;
  result := -1;
 end;
 function Find_Code128C(c:String):integer;  // find Code 128 Codeset C
 var i:integer;
 begin
  for i:=0 to High(BARCode_128) do
   begin
    if c = BARCode_128[i].C then
     begin
       result := i;
       exit;
     end;
   end;
  result := -1;
 end;
var i, idx , j: integer;
    startcode,Tmp: string;
    checksum : integer;
    codeword_pos : integer;
begin
 checksum := 103;
 case CodeType of
  Code128A,EAN128A: begin checksum := 103; startcode:= StartA; end;
  Code128B,EAN128B: begin checksum := 104; startcode:= StartB; end;
  Code128C,EAN128C: begin checksum := 105; startcode:= StartC; end;
 end;
 result := Convert(startcode);    // Startcode
 codeword_pos := 1;
 Tmp := BarText;
 case CodeType of
    EAN128A,
    EAN128B,
    EAN128C:
      begin
	result := result + Convert(BARCode_128[102].data);
	inc(checksum, 102*codeword_pos);
	Inc(codeword_pos);
	if FCheckSum then Tmp:=DoCheckSumming(Tmp);
      end;
 end;
 if (CodeType = Code128C) or (CodeType = EAN128C) then
  begin
    if ODD(Length(Tmp)) then //check Length(Tmp) for ODD or EVEN;//
       Tmp:='0'+Tmp;
    for i:=1 to (Length(Tmp) div 2) do
        begin
	  j:=(i-1)*2+1;
	  idx:=Find_Code128C(copy(Tmp,j,2));
	  if idx < 0 then
             idx := Find_Code128C('00');
	  result := result + Convert(BARCode_128[idx].data);
	  Inc(checksum, idx*codeword_pos);
	  Inc(codeword_pos);
        end;
   end
 else
  for i:=1 to Length(Tmp) do
   begin
    idx := Find_Code128AB(Tmp[i]);
    if idx < 0 then
       idx := Find_Code128AB(' ');
    result := result + Convert(BARCode_128[idx].data);
    Inc(checksum, idx*i);
   end;
 checksum := checksum mod 103;
 result := result + Convert(BARCode_128[checksum].data);
 result := result + Convert(Stop);      {Stopcode}
end;

function TFlatBarcode.Code_93: string;
 function Find_Code93(c:char):integer;// find Code 93
 var i:integer;
 begin
  for i:=0 to High(BARCode_93) do
   begin
    if c = BARCode_93[i].c then
     begin
      result := i;
      exit;
     end;
   end;
  result := -1;
 end;
var i, idx : integer;
    checkC, checkK,   // Checksums
    weightC, weightK : integer;
begin
 result := Convert('111141');
 for i:=1 to Length(BarText) do
  begin
   idx := Find_Code93(BarText[i]);
   if idx < 0 then
    raise Exception.CreateFmt('%s:Code93 bad Data <%s>', [self.ClassName,BarText]);
   result := result + Convert(BARCode_93[idx].data);
  end;
 checkC := 0;
 checkK := 0;
 weightC := 1;
 weightK := 2;
 for i:=Length(BarText) downto 1 do
  begin
   idx := Find_Code93(BarText[i]);
   Inc(checkC, idx*weightC);
   Inc(checkK, idx*weightK);
   Inc(weightC);
   if weightC > 20 then weightC := 1;
      Inc(weightK);
   if weightK > 15 then weightC := 1;
  end;
 Inc(checkK, checkC);
 checkC := checkC mod 47;
 checkK := checkK mod 47;
 result := result + Convert(BARCode_93[checkC].data) +
 Convert(BARCode_93[checkK].data);
 result := result + Convert('1111411');   // Stopcode
end;

function TFlatBarcode.Code_MSI: string;
var i,check_even, check_odd, checksum:integer;
begin
 result := '60';    // Startcode
 check_even := 0;
 check_odd  := 0;
 for i:=1 to Length(BarText) do
  begin
   if odd(i-1) then
      check_odd := check_odd*10+ord(BarText[i])
   else
      check_even := check_even+ord(BarText[i]);
   result := result + BARCode_MSI[BarText[i]];
  end;
 checksum := quersumme(check_odd*2) + check_even;
 checksum := checksum mod 10;
 if checksum > 0 then
    checksum := 10-checksum;
 result := result + BARCode_MSI[chr(ord('0')+checksum)];
 result := result + '515'; // Stopcode
end;

function TFlatBarcode.Code_PostNet: string;
var i:integer;
begin
 result := '51';
 for i:=1 to Length(BarText) do
  begin
   result := result + BARCode_PostNet[BarText[i]];
  end;
 result := result + '5';
end;

function TFlatBarcode.Code_CodaBar: string;
 function Find_Codabar(c:char):integer;
 var i:integer;
 begin
  for i:=0 to High(BARCode_Codabar) do
   begin
    if c = BARCode_Codabar[i].c then
     begin
      result := i;
      exit;
     end;
   end;
  result := -1;
 end;
var i, idx : integer;
begin
 result := BARCode_Codabar[Find_Codabar('A')].data + '0';
 for i:=1 to Length(BarText) do
  begin
   idx := Find_Codabar(BarText[i]);
   result := result + BARCode_Codabar[idx].data + '0';
  end;
 result := result + BARCode_Codabar[Find_Codabar('B')].data;
// result := result + BARCode_Codabar[Find_Codabar('A')].data;
end;

function TFlatBarcode.Code_EAN13: string;
var I, LK: integer;
    tmp : String;
begin
 LK := StrToInt(BarText[1]);
 tmp := copy(BarText,2,12);
 result := '505';{Startcode}
 for i:=1 to 6 do
  begin
   case BARCode_ParityEAN13[LK,i] of
    'A' : result := result + BARCode_EAN_A[tmp[i]];
    'B' : result := result + BARCode_EAN_B[tmp[i]] ;
    'C' : result := result + BARCode_EAN_C[tmp[i]] ;
   end;
 end;
 result := result + '05050';{Center Guard Pattern}
 for i:=7 to 12 do
     result := result + BARCode_EAN_C[tmp[i]] ;
 result := result + '505';{Stopcode}
end;

function TFlatBarcode.Code_EAN8: string;
var i : integer;
begin
 result := '505';{Startcode}
 for i:=1 to 4 do
     result := result + BARCode_EAN_A[BarText[i]] ;
 result := result + '05050';{Center Guard Pattern}
 for i:=5 to 8 do
     result := result + BARCode_EAN_C[BarText[i]] ;
 result := result + '505';{Stopcode}
end;

function TFlatBarcode.Code_Supp2: string;
var     i,j : integer;
        mS : String;
begin
	i:=StrToInt(Copy(BarText,1,2));
	case i mod 4 of
		3: mS:='EE';
		2: mS:='EO';
		1: mS:='OE';
		0: mS:='OO';
	end;
	result := '506';{Startcode}
	for i:=1 to 2 do
	begin
	  if mS[i]='E' then
	   begin
	     for j:= 1 to 4 do
                 result := result + BARCode_EAN_C[BarText[i],5-j];
	   end
	  else
	   begin
	     result := result + BARCode_EAN_A[BarText[i]];
	   end;
	  if i<2 then
             result:=result+'05'; // character delineator
	end;
end;

function TFlatBarcode.Code_Supp5: string;
var i,j : integer;
    c   : char;
begin
	c:=BarText[6];
	result := '506';{Startcode}
	for i:=1 to 5 do
	begin
	 if BARCode_UPC_E[c,(6-5)+i]='E' then
	  begin
	    for j:= 1 to 4 do result := result + BARCode_EAN_C[BarText[i],5-j];
	  end
	 else
	  begin
	    result := result + BARCode_EAN_A[BarText[i]];
	  end;
	 if i<5 then result:=result+'05'; // character delineator
	end;
end;

function TFlatBarcode.Code_UPC_A: string;
var	i : integer;
begin
	result := '505';{Startcode}
	for i:=1 to 6 do
	    result := result + BARCode_EAN_A[BarText[i]];
	result := result + '05050';{Trennzeichen}
	for i:=7 to 12 do
	    result := result + BARCode_EAN_C[BarText[i]];
	result := result + '505';{Stopcode}
end;

function TFlatBarcode.Code_UPC_EODD: string;
var     i,j : integer;
	c   : char;
begin
	c:=BarText[7];
	result := '505';{Startcode}
	for i:=1 to 6 do
	begin
	   if BARCode_UPC_E[c,i]='E' then
	   begin
	     for j:= 1 to 4 do
                 result := result + BARCode_EAN_C[BarText[i],5-j];
	   end
	   else
	   begin
	         result := result + BARCode_EAN_A[BarText[i]];
	   end;
	end;
	result := result + '0505';{Stopcode}
end;

function TFlatBarcode.Code_UPC_EVEN: string;
var     i,j : integer;
	c   : char;
begin
	c:=BarText[7];
	result := '505';{Startcode}
	for i:=1 to 6 do
	begin
	  if BARCode_UPC_E[c,i]='E' then
	   begin
	     result := result + BARCode_EAN_A[BarText[i]];
	   end
	 else
	   begin
	     for j:= 1 to 4 do
               result := result + BARCode_EAN_C[BarText[i],5-j];
	   end;
	end;
	result := result + '0505';{Stopcode}
end;

procedure TFlatBarcode.GetABCED(Var a,b,c,d,orgin:TPoint;xadd,Width,Height:Integer);
begin
 a.x := xadd;
 a.y := Orgin.y;//0

 b.x := xadd;
 b.y := Orgin.y+height;

 c.x := xadd+width-1;
 c.y := Orgin.y+height;

 d.x := xadd+width-1;
 d.y := Orgin.y;//0
end;

function TFlatBarcode.MakeData;
begin
 case CodeType of
  Code25IL      : result := Code_25ILeaved;
  Code25IT      : result := Code_25ITrial;
  Code25Mx      : result := Code_25Matrix;
  Code39,
  Code39Ext     : result := Code_39;
  Code93,
  Code93Ext     : result := Code_93;
  CodeMSI       : result := Code_MSI;
  PostNet       : result := Code_PostNet;
  CodaBar       : result := Code_CodaBar;
  EAN8          : Result := Code_EAN8;
  EAN13         : Result := Code_EAN13;
  UPC_A         : Result := Code_UPC_A;
  UPC_EODD      : Result := Code_UPC_EODD;
  UPC_EVEN      : Result := Code_UPC_EVEN;
  UPC_S2        : Result := Code_Supp2;
  UPC_S5        : Result := Code_Supp5;
 else
  result        := Code_128; //for Code128A,Code128B,Code128C;EAN128A,EAN128B,EAN128C
 end;
end;

function TFlatBarcode.MakeModules:TFlatModules;
begin
 case CodeType of
  Code25IL, Code25IT, Code39,
  Code39Ext, Codabar, EAN8, EAN13,
  UPC_A, UPC_EODD, UPC_EVEN, UPC_S2,
  UPC_S5:begin
                 if fRatio <> 2.0 then
                    fRatio := 2.0;
                end;
  Code25Mx :begin
                 if fRatio < 2.25 then
                    fRatio := 2.25;
                 if fRatio > 3.0  then
                    fRatio := 3.0;
           end;
  Code128A, Code128B, Code128C,
  EAN128A, EAN128B, EAN128C,
  Code93,Code93Ext, CodeMSI,
  PostNet:;
 end;
 Result[0] := fModul;
 Result[1] := Round(fModul*fRatio);
 Result[2] := Result[1] * 3 div 2;
 Result[3] := Result[1] * 2;
end;

{Print the Barcode data :0-3 white Line;5-8 black Line;A-D black Line (2/5 in Height)}
procedure TFlatBarcode.OneBarProps(Data:Char;Var Width:Integer;var lt:TFlatLines);
begin
 case data of
   '0': begin width := Modules[0]; lt := ltWhite; end;
   '1': begin width := Modules[1]; lt := ltWhite; end;
   '2': begin width := Modules[2]; lt := ltWhite; end;
   '3': begin width := Modules[3]; lt := ltWhite; end;

   '5': begin width := Modules[0]; lt := ltBlack; end;
   '6': begin width := Modules[1]; lt := ltBlack; end;
   '7': begin width := Modules[2]; lt := ltBlack; end;
   '8': begin width := Modules[3]; lt := ltBlack; end;

   'A': begin width := Modules[0]; lt := ltBlack_half; end;
   'B': begin width := Modules[1]; lt := ltBlack_half; end;
   'C': begin width := Modules[2]; lt := ltBlack_half; end;
   'D': begin width := Modules[3]; lt := ltBlack_half; end;
 end;
end;

procedure TFlatBarcode.DrawUPC_AText(Canvas:TCanvas;width,wBorder:Integer);
var x,y,tCenter:Integer;
    Rect:TRect;
    str:String;
begin
 with Canvas do
  begin
        x           := wBorder - TextWidth('1')-2;
        y           := fBarHeight+fBarTop-(TextHeight('A') div 2);
        str         := BarText[1];
        Rect.Left   := x;
        Rect.Top    := y;
        Rect.Right  := x+TextWidth(Str);
        Rect.Bottom := y+TextHeight(Str);
        TextRect(Rect,x,y,Str);
        Str         := Copy(BarText,2,5);
        x           := wBorder + ProLine;
        Rect.Left   := x;
        Rect.Top    := y;
        Rect.Right  := (width-ProLine) div 2;
        tCenter     := (Rect.Right + x - TextWidth(str)) div 2;
        TextRect(Rect,tCenter,y,Str);
        str         := Copy(BarText,7,5);
        x           := (Width + ProLine)div 2;
        Rect.Left   := x;
        Rect.Top    := y;
        Rect.Right  := width - wBorder - ProLine;
        tCenter     := (Rect.Right + x - TextWidth(str)) div 2;
        TextRect(Rect,tCenter,y,Str);
        str         := BarText[12];
        x           := Width - wBorder;
        Rect.Left   := x;
        Rect.Top    := y;
        Rect.Right  := width;
        tCenter     := (Rect.Right + x - TextWidth(str)) div 2;
        TextRect(Rect,tCenter,y,Str);
  end;
end;

procedure TFlatBarcode.DrawEAN8Text(Canvas:TCanvas;width,wBorder:Integer);
var x,y,tCenter:Integer;
    Rect:TRect;
    str:String;
begin
 with Canvas do
  begin
        y           := fBarHeight+fBarTop-(TextHeight('A') div 2);
        str         := copy(BarText,1,4);
        x           := wBorder + ProLine;
        Rect.Left   := x;
        Rect.Top    := y;
        Rect.Right  := (width-ProLine) div 2;
        Rect.Bottom := y+TextHeight(Str);
        tCenter     := (Rect.Right + x - TextWidth(str)) div 2;
        TextRect(Rect,tCenter,y,Str);
        str         := copy(BarText,5,4);
        x           := (Width + ProLine)div 2;
        Rect.Left   := x;
        Rect.Top    := y;
        Rect.Right  := width - wBorder - ProLine;
        tCenter     := (Rect.Right + x - TextWidth(str)) div 2;
        TextRect(Rect,tCenter,y,Str);
  end;
end;

procedure TFlatBarcode.DrawUPC_EText(Canvas:TCanvas;width,wBorder:Integer);
var x,y,tCenter:Integer;
    Rect:TRect;
    str:String;
begin
 with Canvas do
  begin
        y           := fBarHeight+fBarTop-(TextHeight('A') div 2);
        str         := copy(BarText,1,6);
        x           := wBorder + ProLine;
        Rect.Left   := x;
        Rect.Top    := y;
        Rect.Right  := width - wBorder - ProLine;
        Rect.Bottom := y+TextHeight(Str);
        tCenter     := (Rect.Right + x - TextWidth(str)) div 2;
        TextRect(Rect,tCenter,y,Str);
  end;
end;

procedure TFlatBarcode.DrawEAN13Text(Canvas:TCanvas;width,wBorder:Integer);
var x,y,tCenter:Integer;
    Rect:TRect;
    str:String;
begin
 with Canvas do
  begin
        x           := wBorder - TextWidth('1')-2;
        y           := fBarHeight+fBarTop-(TextHeight('A') div 2);
        str         := BarText[1];
        Rect.Left   := x;
        Rect.Top    := y;
        Rect.Right  := x+TextWidth(Str);
        Rect.Bottom := y+TextHeight(Str);
        TextRect(Rect,x,y,Str);
        Str         := Copy(BarText,2,6);
        x           := wBorder + ProLine;
        Rect.Left   := x;
        Rect.Top    := y;
        Rect.Right  := (width-ProLine) div 2;
        tCenter     := (Rect.Right + x - TextWidth(str)) div 2;
        TextRect(Rect,tCenter,y,Str);
        str         := Copy(BarText,8,6);
        x           := (Width + ProLine)div 2;
        Rect.Left   := x;
        Rect.Top    := y;
        Rect.Right  := width - wBorder - ProLine;
        tCenter     := (Rect.Right + x - TextWidth(str)) div 2;
        TextRect(Rect,tCenter,y,Str);
  end;
end;

procedure TFlatBarcode.DrawBarcode;
var tCenter,i,xadd, x, y:Integer;
    lt : TFlatLines;
    fwidth, fheight,wBorder:integer;
    a,b,c,d, orgin : TPoint;
    bmpMem:TBitmap;
    Rect:TRect;
    str:String;
begin
 bmpMem:= TBitmap.Create;
 try
 with bmpMem.Canvas do
 begin
  Font.Assign(self.Font);
  wBorder    := TextWidth('1')*2 + fBorderWidth div 2;
  case CodeType of
   EAN13,EAN8,UPC_A,UPC_EODD,UPC_EVEN:
     xadd    := wBorder
  else
     xadd    := fBorderWidth;
  end;
  orgin.x := xadd;//Left;
  orgin.y := fBarTop;//Top 0;
  bmpMem.Width   := xadd;
  bmpMem.Height  := fBarHeight+fBarTop;
  brush.Style := bsClear;
  Brush.Color := Color;
  FillRect(ClipRect);
  Pen.Width   := 1;
  for i:=1 to Length(data) do
   begin
    OneBarProps(Data[i],fWidth,lt);
    Pen.Color   := fBarColor;//clWhite;
    brush.Style := bsClear;
    Brush.Color := Color;
    if (lt = ltBlack) or (lt = ltBlack_half) then
        Brush.Color := fBarColor;//clBlack
    if lt = ltBlack_half then
       fheight := bmpMem.Height * 2 div 5
    else
       fheight := bmpMem.Height;
    GetABCED(a,b,c,d,orgin,xadd,fWidth,fHeight);
    Polygon([a,b,c,d]);
    xadd        := xadd + fwidth;
    bmpMem.Width   := xadd;
   end;//结束画直线
  Brush.Color := Color;
  Rect        := ClipRect;
  Rect.Bottom := fBarTop;
  FillRect(Rect);
  Rect        := ClipRect;
  Rect.Right  := fBorderWidth;
  FillRect(Rect);
  if fShowText then
   begin
     if (CodeType = EAN13)or(CodeType = EAN8)or
        (CodeType = UPC_A)or(CodeType = UPC_EODD)or
        (CodeType = UPC_EVEN) then
      begin
        bmpMem.Height     := bmpMem.Height + TextHeight('A') div 2;
        bmpMem.Width      := xadd + wBorder;
        case CodeType of
          EAN13  : DrawEAN13Text(bmpMem.Canvas,bmpMem.Width,wBorder);
          EAN8   : DrawEAN8Text(bmpMem.Canvas,bmpMem.Width,wBorder);
          UPC_A  : DrawUPC_AText(bmpMem.Canvas,bmpMem.Width,wBorder);
        else  //UPC_EODD,UPC_EVEN;
          DrawUPC_EText(bmpMem.Canvas,bmpMem.Width,wBorder);
        end;
      end
     else
      begin
       bmpMem.Height     := bmpMem.Height + TextHeight('A');
       bmpMem.Width      := xadd + fBorderWidth;
       if bmpMem.Width > TextWidth(BarText) then
          tCenter:=(bmpMem.width-TextWidth(BarText))div 2
       else
          tCenter:=0;
       case CodeType of
         Code93Ext,
         Code39Ext:Str := Copy(BarText,3,Length(BarText)-2);
       else
         Str := BarText;
       end;
       TextOut(tCenter, fBarHeight+fBarTop, Str);
      end;
   end
  else
   begin
     bmpMem.Width   := xadd + fBorderWidth;
     Rect        := ClipRect;
     Rect.Top    := Rect.Bottom - fBarTop;
     FillRect(Rect);
   end;  
   case fRotateType of
    raNone:fBitmap.Assign(bmpMem);
    ra270:begin
            fBitmap.width  := bmpMem.Height;
            fBitmap.Height := bmpMem.Width;
            for x:=0 to bmpMem.Height-1 do
               for y:=0 to bmpMem.Width-1 do
                   fBitmap.canvas.Pixels[(-x+bmpMem.Height),y]:=Pixels[y,x];
          end;
    ra180:begin
            fBitmap.width  := bmpMem.Width;
            fBitmap.Height := bmpMem.Height;
            for x:=0 to bmpMem.Height-1 do
               for y:=0 to bmpMem.Width-1 do
                   fBitmap.canvas.Pixels[(bmpMem.Width-y),(bmpMem.Height-x)]:=Pixels[y,x];
          end;
    ra090:begin
            fBitmap.width  := bmpMem.Height;
            fBitmap.Height := bmpMem.Width;
            for x:=0 to bmpMem.Height-1 do
               for y:=0 to bmpMem.Width-1 do
                   fBitmap.canvas.Pixels[x,(bmpMem.Width-y)]:=Pixels[y,x];

          end;
   end;
 end;
 finally
 bmpMem.free;
 end;
end;

{Print the Barcode data :0-3 white Line;5-8 black Line;A-D black Line (2/5 in Height)}
procedure TFlatBarcode.Paint;
begin
 DrawBarcode;
 inherited Paint;
 if AutoSize then
 begin
    Width  := fBitmap.Width;
    Height := fBitmap.Height;
 end;
 fBitmap.Transparent := fTransparent;
 if FTransparent then
 begin
    DrawparentImage(self, Canvas);
 end;
 Canvas.StretchDraw(ClientRect,fBitmap);
end;   

procedure TFlatBarcode.SetRotateType(const Value: TFlatRotation);
begin
 if FRotateType <> value then
  begin
    FRotateType := Value;
    Invalidate;
  end;
end;

function TFlatBarcode.GetTypName: String;
begin
 result := BCData[CodeType].Name;
end;

function TFlatBarcode.GetProLine: Integer;
var Inx,w:Integer;
    TempStr:String;
    lt : TFlatLines;
begin
 Result  := 0;
 TempStr := '505';
 for Inx := 1 to Length(TempStr) do
   begin
     OneBarProps(TempStr[Inx],w,lt);
     Inc(Result,W);
   end;
end;

procedure TFlatBarcode.SetText(const Value: string);
begin
 if fText <> Value then
  begin
    fText := Value;
    Invalidate;
  end;
end;

procedure TFlatBarcode.SetBarHeight(const Value: Integer);
begin
 if fBarHeight <> Value then
  begin
    fBarHeight := Value;
    Invalidate;
  end;
end;

procedure TFlatBarcode.SetBorderWidth(const Value: Byte);
begin
 if fBorderWidth <> Value then
 begin
  fBorderWidth := Value;
  Invalidate;
 end;
end;

procedure TFlatBarcode.SetBarColor(const Value: TColor);
begin
 if fBarColor <> Value then
  begin
   fBarColor := Value;
   Invalidate;
  end;
end;

procedure TFlatBarcode.SetRatio(const Value: double);
begin
 if FRatio <> Value then
  begin
    FRatio := Value;
    Invalidate;
  end;
end;

procedure TFlatBarcode.SetCodeType(const Value: TFlatColeType);
begin
 if FCodeType <> Value then
  begin
    FCodeType := Value;
    Invalidate;
  end;
end;

procedure TFlatBarcode.SetModul(const Value:Integer);
begin
 if (Value >= 1) and (Value  < 50) then
  begin
    fModul  := Value;
    Invalidate;
  end;
end;

procedure TFlatBarcode.SetBarTop(const Value: Byte);
begin
 if fBarTop <> Value then
  begin
    fBarTop := Value;
    Invalidate;
  end;
end;

procedure TFlatBarcode.SetColor(const Value: TColor);
begin
 if FColor <> Value then
 begin
    FColor := Value;
    Invalidate;
 end;
end;

procedure TFlatBarcode.FontChange(sender: TObject);
begin
  Invalidate;
end;

procedure TFlatBarcode.WMSize(var Message: TWMSize);
begin
  inherited;
  Invalidate;
end;

procedure TFlatBarcode.SetBools(Index: Integer; Value: Boolean);
begin
  case index of
   0: fAutoSize       := Value;
   1: FCheckSum       := Value;
   2: fCheckOdd       := Value;
   3: FShowText       := Value;
   4: fTransparent    := Value;
  end;
  invalidate;
end;

end.
