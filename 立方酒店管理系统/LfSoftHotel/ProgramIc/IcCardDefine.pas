unit IcCardDefine;

interface

uses
  SysUtils, Classes, DB, DBTables, StdCtrls, DBCtrls, ComCtrls, Forms, Windows;

type
  TCard_Stru = record
    CardId : array[0..5] of Char;
    CardJe : array[0..3] of Char;
  end;
  TCzy = record
    CzyBh: string;
    CzyXm: string;
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
  //编号前缀
  PREV_YDBH= 'Y';
  PREV_YJBH= 'J';
  PREV_KRBH= 'K';
  PREV_ZDBH= 'Z';
  PREV_JZBH= 'B';

  //消费项目
  XMBH_FJ  = '00001';
  XMBH_CF  = '00002';
  XMBH_HCF = '00003';
  XMBH_DHF = '00004';
  XMBH_YJK = '00005';
  XMBH_EWF = '00006';
  
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

  //结帐类型
  JZLX_YK  = 'Y';//寓客
  JZLX_FYK = 'F';//非寓客
  JZLX_YSK = 'K';//应收款
  JZLX_YJK = 'J';//预交款

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
  IcDev : Longint;
  OutBuf: PChar;
  InBuf : string;
  CardInfo : TCard_Stru;
  pCardInfo: ^TCard_Stru;
  CZY : TCzy;
  APP_DIR: string;
  PORTNUM : Integer;
  
procedure InitStatus(CommPort: Integer);
procedure ExitComm;
function IsCardExists: Boolean;
function CheckPass: Boolean;
procedure ICDown;
function AddDH(DH: string) : string;
procedure ShowWarning(AMessage: string);
procedure ShowInfo(AMessage: string);
function GetMc(const AMc: string): string;

implementation

uses drv_unit;

function GetMc(const AMc: string): string;
var
  p: Integer;
begin
  p := Pos('|',AMc);
  Result := Copy(AMc,p+1,Length(AMc)-p);
end;

procedure ShowWarning(AMessage: string);
begin
  Application.MessageBox(PChar(AMessage),'警告',MB_OK);
end;

procedure ShowInfo(AMessage: string);
begin
  Application.MessageBox(PChar(AMessage),'提示',MB_OK);
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


procedure ICDown;
var
  st: SmallInt;
begin
  st := IC_Down(IcDev);
  if st<>0 then
    raise Exception.Create('下电失败！');
end;

function CheckPass: Boolean;
var
  st: SmallInt;
begin
  InBuf := 'FFFFFF';
  st := IC_CheckPass_4442hex(IcDev,PChar(InBuf));
  if st <> 0 then
    Result := False
  else
    Result := True;
end;

procedure InitStatus(CommPort: Integer);
var
  st: SmallInt;
begin
  IcDev := IC_InitComm(CommPort);
  if IcDev < 0 then
    raise Exception.Create('初始化串口失败！');
  st := IC_Status(IcDev);
  if st < 0 then
    raise Exception.Create('读写器存在错误！');
  if st <> 1 then
  begin
    st := IC_InitType(IcDev,16); //4442
    if st <> 0 then
      raise Exception.Create('IC卡类型错误！');
  end;
end;

function IsCardExists: Boolean;
var
  st: SmallInt;
begin
  st := IC_Status(IcDev);
  if st < 0 then
    raise Exception.Create('读写器存在错误！');
  if st = 1 then
    Result := False
  else
    Result := True;
end;

procedure ExitComm;
begin
  IC_ExitComm(IcDev);
end;

end.
