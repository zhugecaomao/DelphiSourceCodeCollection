unit Unitthzh;

interface

uses
  Classes,winsock,sysutils,windows;   //注意引用类型

type
  ipdns = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

uses Unitzcser;

function GetIP(Name:string) : string;
type
  TaPInAddr = array [0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe :PHostEnt;
  pptr : PaPInAddr;
  I : Integer;
  GInitData : TWSADATA;
begin
  WSAStartup($101, GInitData);
  Result := '';
  phe :=GetHostByName(pchar(Name)); //返回一个指向主机信息结构的指针
  pptr := PaPInAddr(Phe^.h_addr_list); //强制转换
  result:=StrPas(inet_ntoa(pptr^[0]^));//返回一个点分形式的字符串IP地址
  WSACleanup;
end;

function GetDomainName(Ip:string):string;
var 
  pH:PHostent;
  data:twsadata;
  ii:dword;  //即ii 为LongWord类型
begin
  WSAStartup($101, Data);
  ii:=inet_addr(pchar(ip)); // 返回一个适合Internet的数字化地址
  pH:=gethostbyaddr(@ii,sizeof(ii),PF_INET);//返回一个指向主机信息结构的指针
  if (ph<>nil) then
  result:=pH.h_name //返回该结构的主机名
  else
  result:='';
  WSACleanup();
end;
procedure ipdns.Execute;
var
  i:integer;
  str:string;
  flag:boolean;
begin
  str:=frmzcser.ipstr;
  flag:=false;
  for i:=1 to length(str) do
  begin
    if ((str[i]>'9') or (str[i]<'0')) and (str[i]<>'.') then
    begin//是IP则要换成dns
      frmzcser.ipstr:=GetIp(str);
      flag:=true;
    end;
    if flag then break;//完成DNS->IP的转化
  end;
    if not flag then
    begin //是IP，则完成IP->DNS的转化
        frmzcser.ipstr:=GetDomainName(str);
    end;
end;

end.
 