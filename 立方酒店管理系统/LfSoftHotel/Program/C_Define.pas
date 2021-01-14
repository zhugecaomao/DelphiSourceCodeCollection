{立方酒店管理系统 v1.0
 Copyright by CubicSoft
 program by ls.
 Date:20020301-20020601
 20020627 加入注释
}
unit C_Define;

interface
uses
  ComCtrls, DB, DBTables, SysUtils, DateUtils, Windows, Forms, Classes, Graphics,
  DBGrids, DBGridEh;

type

  //当前操作员
  TDynamicArray = array of string;

  //信息导出
  TXxdc = record
    AKfbh: string[5];
    ADdrq: string[8];
    ALdrq: string[8];
    AKrxm: string[8];
    AXb  : string[2];
    ACsny: string[8];
    AMz  : string[10];
    AJg  : string[10];
    AGzdw: string[30];
    AZy  : string[10];
    AJtdz: string[30];
    AZjlx: string[10];
    AZjhm: string[30];
  end;

  //押金信息
  TYjxx = record
    AYjbh : string;
    AFkfs : string;
    AXykbh: string;
    AXyk  : string;
    AKhbh : string;
    AKhmc : string;
    AYfje : Currency;
    AYjhh : Integer;
  end;

  //团队信息
  TTdxx = record
    AKrbh: string;
    AKrxm: string;
    AZdbh: string;
    AYjbh: string;
    AZdlb: string;
    AZdhh: Integer;
  end;

  //客房信息
  TKFXX = record
    AKfbh: string;
    AKrxm: string;
    AZdbh: string;
    AKrbh: string;
    AYjbh: string;
    AKfbz: string;
    AKrlx: string;
    AFkfs: string;
    AZdlb: string;
    ASjfj: Currency;
    AXfje: Currency;
    ABqj : Integer;
    ADtfj: Currency;
    ADhf : Currency;
    ADdrq: TDateTime;
    ADdsj: TDateTime;
    AYfrq: TDateTime;
    AYfsj: TDateTime;
    AZdhh: Integer;
  end;

  //客房信息数组
  TKfxxArray = array of TKFXX;

  //操作员
  TCZY = record
    CzyBh : string;
    CzyXm : string;
  end;

  //记录
  TRecInfo = record
    ABh : string;
    AMc : string;
  end;

  //消费项目
  TXFXM = record
    AXfbh : string;
    AXmmc : string;
  end;

  //消费信息
  TXfxx = record
    AZdbh : string;
    AXfje : Currency;
    AYjje : Currency;
  end;

  //散客结帐信息
  TJZXX = record
    AJzfh : TDynamicArray;
    AJzrq : TDateTime;
    AJzsj : TDateTime;
    AJzfs : string;
    AXykbh: string;
    AKhbh : string;
    AKfbh : string;
    AKrbh : string;
    AYjbh : string;//20020822 edit by ls.
    AYjtf : Boolean;
  end;

  //团队结帐信息
  TTdJzxx = record
    AKrbh : string;
    AKrxm : string;
    AZdbh : string;
    AYjbh : string;
    AJzrq : TDateTime;
    AJzsj : TDateTime;
    AJzfs : string;
    AXykbh:string;
    AKhbh : string;
  end;

  //应收款结帐信息
  TYskJzxx = record
    AKhbh : string;
    AJzrq : TDateTime;
    AJzsj : TDateTime;
    AJzfs : string;
    AXykbh: string;
  end;

  //贵宾卡余额结帐信息
  TGbkJzxx = record
    AKcje : Currency;
    AJzfs : string;
    AXykbh: string;
    AKhbh : string;
  end;

  //打印结构
  TPrintStru = record
    AFs      : Integer;
    ATitle   : string;
    ASub     : string;
    ADataSet : TDataSet;
    AColumns : TStringList;
    AFields  : TStringList;
    APosition: TStringList;
  end;

const
  //错误代码
  eKeyViol              = 9729;
  eRequiredFieldMissing = 9732;
  eForeignKey           = 9733;
  eDetailsExist         = 9734;

  //最大床位数
  MAX_CWS  = 4;

  //半全价
  BQJ_ZC   = 0;
  BQJ_BJ   = 1;
  BQJ_QJ   = 2;

  //客房当天标志
  KFBZ_DT  = '1';
  KFBZ_FT  = '2';

  //客房状态
  KFZT_BF  = 'F';
  KFZT_BC  = 'C';
  KFZT_OK  = 'O';
  KFZT_WX  = 'R';
  KFZT_ZK  = 'D';
  KFZT_MF  = 'M';
  KFZT_KM  = 'U';
  KFZT_TD  = 'T';

  //押金备注
  YJBZ_YJ  = '预交';
  YJBZ_BJ  = '补交';
  YJBZ_TF  = '退付';
  YJBZ_BG  = '变更';

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

  //编号前缀
  PREV_YDBH= 'Y';
  PREV_YJBH= 'J';
  PREV_KRBH= 'K';
  PREV_ZDBH= 'Z';
  PREV_JZBH= 'B';

  //是否入帐
  RZ_YES   = '2';
  RZ_NO    = '1';

  //是否结帐
  JZ_YES   = '2';
  JZ_NO    = '1';
  JZ_YX    = '3';

  //是否结算
  JS_YES   = '2';
  JS_NO    = '1';
  JS_WJ    = '3';//未结帐结算

  //付款方式
  FKFS_RMB = '人民币';
  FKFS_XYK = '信用卡';
  FKFS_ZP  = '支票';
  FKFS_JZ  = '记帐';

  //结帐方式
  JZFS_RMB = '人民币';
  JZFS_XYK = '信用卡';
  JZFS_ZP  = '支票';
  JZFS_JZ  = '记帐';
  JZFS_GSK = '挂散客';
  JZFS_GTD = '挂团队';
  JZFS_WJZ = '未结帐';
  JZFS_ZD  = '招待';
  JZFS_GBK = '贵宾卡';

  //客人类型
  KRLX_NB  = 'N';
  KRLX_WB  = 'W';
  KRLX_TD  = 'T';
  KRLX_MF  = 'M';
  KRLX_YD  = 'Y';//20020704 edit by ls. 预定客人信息

  //性别
  XB_MAN   = '男';
  XB_WOMAN = '女';

  //消费项目
  XMBH_FJ  = '00001';
  XMBH_CF  = '00002';
  XMBH_HCF = '00003';
  XMBH_DHF = '00004';
  XMBH_YJK = '00005';
  XMBH_EWF = '00006';

  //系统管理员编号
  SYSTEM_BH= '00000';

  //帐单类别
  ZDLB_YK  = 'Y';
  ZDLB_TD  = 'T';
  ZDLB_SYS = 'S';
  ZDLB_FYK = 'F';
  ZDLB_MF  = 'M';

  //结帐类型
  JZLX_YK  = 'Y';//寓客
  JZLX_FYK = 'F';//非寓客
  JZLX_YSK = 'K';//应收款
  JZLX_YJK = 'J';//预交款
  //JZLX_CT  = 'C';//总台收回餐费

  //结帐备注

  //时间代码
  Morning = '早上';
  Noon    = '中午';
  Night   = '晚上';

  //预定餐饮
  YDCY_SK = 'P';
  YDCY_TD = 'T';

  //预定客房
  YDKF_SK = 'P';
  YDKF_TD = 'T';

  //财务结算类型
  JSLX_CWSJ = 'W';//上交财务
  JSLX_CTSJ = 'T';//餐厅上交
  JSLX_YJSJ = 'Y';//预交款上交

  //预交款收回类型
  YJLX_KH = 'K';//客户预交款
  YJLX_YX = 'J';//预先结帐
  YJLX_GB = 'G';//贵宾卡预交款
  YJLX_SJ = 'S';//总台上交预交款

  //预交款备注
  YJBZ_KH = '客户预交款';
  YJBZ_YX = '预先结帐';
  YJBZ_GB = '贵宾卡预交款';
  YJBZ_SJ = '预交款上交';

  //打印方式
  PRN_Portrait = 0;
  PRN_LandScape= 1;

  //系统配置文件
  INI_FILENAME = 'LFHOTEL.ini';

var
  CZY : TCZY;
  JZY : TCZY;
  DQCZY : TCZY;
  DQJZY : TCZY;
  APP_DIR : string; //系统路径
  Database_Dir : string;//数据库路径
  SystemReportDir : string;
  //SKIN_COLOR : TColor;//皮肤颜色
  IS_SHOWIMAGE : Boolean; //房态盘显示图表
  IS_SHOWDDTS  : Boolean;
  HOTEL_NAME   : string;//宾馆名称
  FPrintMemo : string;
  COLOR_OK : TColor;
  COLOR_BF : TColor;
  COLOR_TD : TColor;
  COLOR_MF : TColor;
  COLOR_WX : TColor;
  COLOR_ZK : TColor;
  COLOR_ZT : TColor;
  COLOR_BJ : TColor;

  COLOR_CYBJ : TColor;
  COLOR_CYZT : TColor;
  COLOR_CYYD : TColor;
  COLOR_CYQR : TColor;

  COLOR_HCBJ : TColor;
  COLOR_HCZT : TColor;
  COLOR_HCYD : TColor;
  COLOR_HCQR : TColor;
  
  JF_DIR : string; //电话费计费路径
  PORTNUM: Integer;//段口号
  IS_YJSH: Boolean;//是否允许夜审
  DBF_DIR: string;//数据库源路径
  BAK_DIR: string;//数据库备份路径
  IS_EMPTYDHF : Boolean;//夜审时是否清空电话费
  COLOR_TD1 : TColor;
  COLOR_TD2 : TColor;
  COLOR_TD3 : TColor;
  COLOR_TD4 : TColor;
  COLOR_TD5 : TColor;
  COLOR_TD6 : TColor;
  COLOR_TD7 : TColor;
  COLOR_TD8 : TColor;
  COLOR_TD9 : TColor;
  COLOR_TD10 : TColor;
  
function CheckDdsj(ATime: TDateTime): Integer;
function CheckLdsj(ADTime,ALTime: TDateTime;AKfbz: string): Integer;
function GetDtfj(ADTime,ALTime: TDateTime;AKfbz: string;ASjfj: Currency): Currency;
procedure ShowWarning(AMessage: string);
procedure ShowInfo(AMessage: string);
function Confirm(AMessage: string): Boolean;
function AddDH(DH: string) : string;
function GetMc(const AMc: string): string;
function GetSjdm(ATime: TDateTime): string;
function GetSjdm1(ATime: TDateTime): string;

function DoCopyDir(sDirName,sToDirName: string) : Boolean;
function CopyDir(sDirName,sToDirName: string) : Boolean;
function DoRemoveDir(sDirName: string) : Boolean;
function DeleteDir(sDirName: string) : Boolean;

procedure PrintLb(APrintStru: TPrintStru;ADBGrid: TDBGrid);
procedure PrintLb1(APrintStru: TPrintStru;ADBGrid: TDBGridEh);

function GetPYIndexChar( hzchar:string):char;
function GetIndexStr(hzchar:Widestring):string;

implementation

uses C_Sysprint, C_HotelData;

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
        if Pos > 730 then
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

procedure PrintLb1(APrintStru: TPrintStru;ADBGrid: TDBGridEh);
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
        if Pos > 730 then
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

function DoCopyDir(sDirName,sToDirName: string) : Boolean;
var
  hFindFile    : Cardinal;
  t,tFile      : string;
  sCurDir      : string[255];
  FindFileData : WIN32_FIND_DATA;
begin
  sCurDir := GetCurrentDir;
  ChDir(sDirName);
  hFindFile := FindFirstFile('*.*',FindFileData);
  if hFindFile <> INVALID_HANDLE_VALUE then
  begin
    if not DirectoryExists(sToDirName) then
      ForceDirectories(sToDirName);
    Repeat
      tFile := FindFileData.cFileName;
      if (tFile='.') or (tFile='..') then
        Continue;
      if FindFileData.dwFileAttributes=FILE_ATTRIBUTE_DIRECTORY then
      begin
        t := sToDirName + '\' + tFile;
        if not DirectoryExists(t) then
          ForceDirectories(t);
        if sDirName[Length(sDirName)]<>'\' then
          DoCopyDir(sDirName+'\'+tFile,t)
        else
          DoCopyDir(sDirName+tFile,sToDirName+tFile);
      end
      else
      begin
        t := sToDirName + '\' + tFile;
        CopyFile(PChar(tFile),PChar(t),False);
      end;
    until FindNextFile(hFindFile,FindFileData)=False;
    Windows.FindClose(hFindFile)
  end
  else
  begin
    ChDir(sCurDir);
    Result := False;
    Exit;
  end;
  ChDir(sCurDir);
  Result := True;
end;

function CopyDir(sDirName,sToDirName: string) : Boolean;
begin
  if Length(sDirName)<=0 then
  begin
    Result := False;
    Exit;
  end;
  Result := DoCopyDir(sDirName,sToDirName);
end;

function DoRemoveDir(sDirName: string) : Boolean;
var
  hFindFile : Cardinal;
  tFile     : string;
  sCurrDir  : string;
  bEmptyDir : Boolean;
  FindFileData : WIN32_FIND_DATA;
begin
  Result := True;
  bEmptyDir := True;
  sCurrDir  := GetCurrentDir;
  SetLength(sCurrDir,Length(sCurrDir));
  ChDir(sDirName);
  hFindFile := FindFirstFile('*.*',FindFileData);
  if hFindFile <> INVALID_HANDLE_VALUE then
  begin
    Repeat
      tFile := FindFileData.cFileName;
      if (tFile='.') or (tFile='..') then
      begin
        bEmptyDir := bEmptyDir and True;
        Continue;
      end;
      bEmptyDir := False;
      if FindFileData.dwFileAttributes=FILE_ATTRIBUTE_DIRECTORY then
      begin
        if sDirName[Length(sDirName)] <> '\' then
          DoRemoveDir(sDirName+'\'+tFile)
        else
          DoRemoveDir(sDirName+tFile);
        Result := RemoveDirectory(PChar(tFile));
      end
      else
      begin
        Result := DeleteFile(PChar(tFile));
      end;
    until FindNextFile(hFindFile,FindFileData)=False;
    Windows.FindClose(hFindFile);
  end
  else
  begin
    ChDir(sCurrDir);
    Result := False;
    Exit;
  end;
  if bEmptyDir then
  begin
    ChDir('..');
    RemoveDirectory(PChar(sDirName));
  end;
  ChDir(sCurrDir);
end;

function DeleteDir(sDirName: string) : Boolean;
begin
  if Length(sDirName)<=0 then
  begin
    Result := False;
    Exit;
  end;
  Result := DoRemoveDir(sDirName) and RemoveDir(sDirName);
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

function GetSjdm1(ATime: TDateTime): string;
begin
  if (ATime>EnCodeTime(7,0,0,0))and(ATime<EnCodeTime(12,0,0,0)) then
    Result := '上午'
  else
  if (ATime>EnCodeTime(12,0,0,0))and(ATime<EnCodeTime(18,0,0,0)) then
    Result := '下午'
  else
    Result := '晚上';
end;

function GetMc(const AMc: string): string;
var
  p: Integer;
begin
  p := Pos('|',AMc);
  //if p=0 then
    //Result := AMc
  //else
    Result := Copy(AMc,p+1,Length(AMc)-p);

end;

function CheckDdsj(ATime: TDateTime): Integer;
var
  HH,NN,SS: Word;
begin
  HotelData.GetYssj(HH,NN,SS);
  Result:= BQJ_ZC;

  if (ATime>EnCodeTime(HH,NN,SS,0))or(ATime<EnCodeTime(6,0,0,0)) then
      if (ATime>EnCodeTime(5,30,0,0))and(ATime<EnCodeTime(6,0,0,0)) then
        Result:= BQJ_BJ
      else
        Result:= BQJ_QJ;
end;

function CheckLdsj(ADTime,ALTime: TDateTime;AKfbz: string): Integer;
begin
  Result:= BQJ_ZC;
  if AKfbz=KFBZ_DT then
  begin
    if (ADTime<EnCodeTime(6,0,0,0))or(ADTime>EnCodeTime(23,0,0,0)) then
      Result:= BQJ_QJ
    else if (ADTime>=EnCodeTime(6,0,0,0))and(ALTime<=EnCodeTime(18,0,0,0)) then
      Result:= BQJ_BJ
    else
      Result:= BQJ_QJ;
  end;
  if AKfbz=KFBZ_FT then
  begin
    if (ALTime>EnCodeTime(12,0,0,0))and(ALTime<=EnCodeTime(18,0,0,0)) then
      Result:= BQJ_BJ
    else if ALTime>EnCodeTime(18,0,0,0) then
      Result:= BQJ_QJ;
  end;
end;

function GetDtfj(ADTime,ALTime: TDateTime;AKfbz: string;ASjfj: Currency): Currency;
var
  ABqj: Integer;
begin
  Result := 0;
  ABqj := CheckLdsj(ADTime,ALTime,AKfbz);
  case ABqj of
    BQJ_QJ: Result := ASjfj;
    BQJ_BJ: Result := ASjfj/2;
  end;
end;

procedure ShowWarning(AMessage: string);
begin
  Application.MessageBox(PChar(AMessage),'警告',MB_OK);
end;

procedure ShowInfo(AMessage: string);
begin
  Application.MessageBox(PChar(AMessage),'提示',MB_OK);
end;

function Confirm(AMessage: string): Boolean;
begin
  Result := Application.MessageBox(PChar(AMessage),'警告',MB_YESNO) = IDYES;
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

end.
