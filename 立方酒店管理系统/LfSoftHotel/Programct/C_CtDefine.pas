unit C_CtDefine;

interface
uses
  Graphics, ComCtrls, DB, DBTables, SysUtils, DateUtils, Windows, Forms, Classes,
  DBGrids;
const
  //餐厅消费项目
  XMBH_SP = '00001';
  XMBH_JS = '00002';
  XMBH_XY = '00003';
  XMBH_CJ = '00004';
  XMBH_FWF= '00005';
  
  XMBH_FJ  = '00001';
  XMBH_CF  = '00002';
  XMBH_HCF = '00003';
  XMBH_DHF = '00004';
  XMBH_YJK = '00005';
  XMBH_EWF = '00006';

  //菜单编号系统定义
  CDBH_BZ = '00000'; //标准菜
  CDMC_BZ = '标准菜';
  //餐厅类别
  CTLB_CT = '餐厅';
  CTLB_TH = '台号';
  //餐厅状态
  CTZT_OK = 'O';
  CTZT_USE= 'U';
  CTZT_JZ = 'J';
  //时间代码
  Morning = '早上';
  Noon    = '中午';
  Night   = '晚上';
  //定餐类别
  DCLB_YC = 'C';
  DCLB_QT = 'Q';
  //是否结帐
  JZ_YES   = '2';
  JZ_NO    = '1';
  JZ_YX    = '3';

  //是否结算
  JS_YES   = '2';
  JS_NO    = '1';
  JS_WJ    = '3';//未结帐结算
  //
  //编号前缀
  PREV_YDBH= 'Y';
  PREV_YJBH= 'J';
  PREV_KRBH= 'K';
  PREV_ZDBH= 'Z';
  PREV_JZBH= 'B';
  PREV_DCBH = 'D';

  //帐单类别
  ZDLB_YK  = 'Y';
  ZDLB_TD  = 'T';
  ZDLB_SYS = 'S';
  ZDLB_FYK = 'F';
  ZDLB_MF  = 'M';

  //帐单备注
  ZDBZ_SK  = '散客';
  ZDBZ_TD  = '团队';
  ZDBZ_JZ  = '记帐';
  ZDBZ_GZ  = '挂帐';
  ZDBZ_WJZ = '未结帐';
  ZDBZ_SYS = '额外费';
  ZDBZ_FYK = '非寓客';
  ZDBZ_YX  = '预先结';

  //结帐备注
  JZBZ_SK  = '散客结';
  JZBZ_TD  = '团队结';
  JZBZ_GSK = '挂散客';
  JZBZ_GTD = '挂团队';
  JZBZ_FYK = '非寓客';
  JZBZ_WJZ = '未结帐';
  JZBZ_JZ  = '记  帐';
  JZBZ_GBK = '贵宾卡';
  JZBZ_YX  = '预先结';
  JZBZ_YJK = '预交款';
  JZBZ_YSK = '应收款';
  
  //结帐方式
  JZFS_RMB = '人民币';
  JZFS_XYK = '信用卡';
  JZFS_ZP  = '支票';
  JZFS_JZ  = '记帐';
  JZFS_GSK = '挂散客';
  JZFS_GTD = '挂团队';
  JZFS_ZD  = '招待';
  JZFS_GBK = '贵宾卡';
  JZFS_WJZ = '未结帐';

  //结帐类型
  JZLX_YK  = 'Y';//寓客
  JZLX_FYK = 'F';//非寓客
  JZLX_YSK = 'K';//应收款
  JZLX_YJK = 'J';//预交款
  
  //客房状态
  KFZT_BF  = 'F';
  KFZT_BC  = 'C';
  KFZT_OK  = 'O';
  KFZT_WX  = 'R';
  KFZT_ZK  = 'D';
  KFZT_MF  = 'M';
  KFZT_KM  = 'U';
  KFZT_TD  = 'T';

  //预定餐饮
  YDCY_SK = 'P';
  YDCY_TD = 'T';


  //打印方式
  PRN_Portrait = 0;
  PRN_LandScape= 1;

  //系统配置文件
  INI_FILENAME = 'LFHOTEL.ini';
  
type

  TCZY = record
    CzyBh : string;
    CzyXm : string;
  end;

  TPrintStru = record
    AFs      : Integer;
    ATitle   : string;
    ASub     : string;
    ADataSet : TDataSet;
    AColumns : TStringList;
    AFields  : TStringList;
    APosition: TStringList;
  end;

  TCtzt = record
    ACtbh: string;
    ACtmc: string;
    ACtzt: string;
    ADcbh: string;
    AKrxm: string;
    AKrsl: Integer;
    AXfrq: TDateTime;
    AXfsj: TDateTime;
    AJzrq: TDateTime;
    AJzsj: TDateTime;
    AXfje: Currency;
    AColor: TColor;
    AImage: Integer;
    AYdbz : string;
    ASjdm : string;
  end;

  TCtzts = array of TCtzt;
  
  TDcmx = record
    ACdbh: string;
    ACdmc: string;
    AXfsl: Double;
    AThsl: Double;
    ADj  : Currency;
    AXmbh: string;
  end;

  //贵宾卡余额结帐信息
  TGbkJzxx = record
    AKcje : Currency;
    AJzfs : string;
    AXykbh: string;
    AKhbh : string;
  end;
  
var
  CZY: TCZY;
  PORTNUM: Integer;
  APP_DIR: string;
  IS_YDXS: Boolean;

function GetSjdm(ATime: TDateTime): string;
function AddDH(DH: string) : string;
procedure ShowWarning(AMessage: string);
function Confirm(AMessage: string): Boolean;
function GetMc(const AMc: string): string;
procedure ShowInfo(AMessage: string);

procedure PrintLb(APrintStru: TPrintStru;ADBGrid: TDBGrid);
function GetPYIndexChar( hzchar:string):char;
function GetIndexStr(hzchar:Widestring):string;
function GetHh: string;

implementation

uses C_Sysprint;

function GetHh: string;
begin
  Result := IntToHex(Trunc(TimeStampToMSecs(DateTimeToTimeStamp(Now))),12);
end;

//产生汉字串的拼音开头大写字母（常用汉字，用时需确定是否产生大写字母）
//此函数嵌套了GetPYIndexChar()函数
function GetPYIndexChar( hzchar:string):char;
begin
  case WORD(hzchar[1]) shl 8 + WORD(hzchar[2]) of
    $B0A1..$B0C4 : result := 'A';
    $B0C5..$B2C0 : result := 'B';
    $B2C1..$B4ED : result := 'C';
    $B4EE..$B6E9 : result := 'D';
    $B6EA..$B7A1 : result := 'E';
    $B7A2..$B8C0 : result := 'F';
    $B8C1..$B9FD : result := 'G';
    $B9FE..$BBF6 : result := 'H';
    $BBF7..$BFA5 : result := 'J';
    $BFA6..$C0AB : result := 'K';
    $C0AC..$C2E7 : result := 'L';
    $C2E8..$C4C2 : result := 'M';
    $C4C3..$C5B5 : result := 'N';
    $C5B6..$C5BD : result := 'O';
    $C5BE..$C6D9 : result := 'P';
    $C6DA..$C8BA : result := 'Q';
    $C8BB..$C8F5 : result := 'R';
    $C8F6..$CBF9 : result := 'S';
    $CBFA..$CDD9 : result := 'T';
    $CDDA..$CEF3 : result := 'W';
    $CEF4..$D188 : result := 'X';
    $D1B9..$D4D0 : result := 'Y';
    $D4D1..$D7F9 : result := 'Z';
  else
    result := char(0);
  end;
end;

//GetPYIndexChar()函数
//产生汉字的拼音开头大写字母（常用汉字，用时需确定是否产生大写字母）
function GetIndexStr(hzchar:Widestring):string;
var
    i:      integer;
    tStr:   WideString;
begin
    for i := 1 to length(hzchar) do
    begin
        tStr := GetPYIndexChar(hzchar[i]);
        if tStr = #0 then
            result := result + UPPERCASE(hzchar[i])
        else
            result := result + LOWERCASE(tStr);
    end
end;

procedure PrintLb(APrintStru: TPrintStru;ADBGrid: TDBGrid);
var
  I,Pos     : Integer;
  AColumns  : TStringList;
  APosition : TStringList;
  AFields   : TStringList;
begin
  AColumns := TStringList.Create;
  try
    APosition := TStringList.Create;
    try
      AFields := TStringList.Create;
      try
        Pos := 10;
        for I:= 0 to ADBGrid.Columns.Count-1 do
        begin
          AColumns.Add(ADBGrid.Columns[I].Title.Caption);
          AFields.Add(ADBGrid.Columns[I].FieldName);
          APosition.Add(IntToStr(Pos));
          Pos := Pos + ADBGrid.Columns[i].Width;
        end;

        APrintStru.AColumns := AColumns;
        APrintStru.AFields  := AFields;
        APrintStru.APosition:= APosition;
        if Pos > 700 then
          APrintStru.AFs      := PRN_LandScape
        else
          APrintStru.AFs      := PRN_Portrait;
        SysPrint(APrintStru);
      finally
        AFields.Free;
      end;
    finally
      APosition.Free;
    end;
  finally
    AColumns.Free;
  end;
end;

procedure ShowInfo(AMessage: string);
begin
  Application.MessageBox(PChar(AMessage),'提示',MB_OK);
end;

function GetMc(const AMc: string): string;
var
  p: Integer;
begin
  p := Pos('|',AMc);
  Result := Copy(AMc,p+1,Length(AMc)-p);
end;


function GetSjdm(ATime: TDateTime): string;
begin
  if (ATime>EnCodeTime(5,0,0,0))and(ATime<EnCodeTime(10,0,0,0)) then
    Result := Morning
  else
  if (ATime>EnCodeTime(10,0,0,0))and(ATime<EnCodeTime(16,0,0,0)) then
    Result := Noon
  else
    Result := Night;
end;

function AddDH(DH: string) : string;
var
  d,s:string;
  n:integer;
begin
  d:= Copy(DH,2,8);
  s:= Copy(DH,10,3);
  n:= StrToInt(s)+1;
  if d <> FormatDateTime('yyyymmdd',Date) then
  begin
    d:= FormatDateTime('yyyymmdd',Date);
    n:= 1;
  end;
  if (n>0) and (n<10) then s:= '00';
  if (n>9) and (n<100) then s:= '0';
  if (n>99) and (n<1000) then s:= '';
  s:= s+IntToStr(n);
  Result:= d+s;
end;

procedure ShowWarning(AMessage: string);
begin
  Application.MessageBox(PChar(AMessage),'警告',MB_OK);
end;

function Confirm(AMessage: string): Boolean;
begin
  Result := Application.MessageBox(PChar(AMessage),'警告',MB_YESNO) = IDYES;
end;

end.
