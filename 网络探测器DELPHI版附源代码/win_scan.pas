unit win_scan;

interface

uses
  Windows, Messages,Classes,winsock,sysutils;

type
  _SERVER_INFO_101=record
          sv101_platform_id:DWORD;
          sv101_name:LPWSTR;
          sv101_version_major:DWORD;
          sv101_version_minor:DWORD;
          sv101_type:DWORD;
          sv101_comment:LPWSTR;
   end;
  SERVER_INFO_101=_SERVER_INFO_101;
  PSERVER_INFO_101=^_SERVER_INFO_101;

type
  ESocketException   = class(Exception);
  TWSAStartup            = function (wVersionRequired: word;
                                       var WSData: TWSAData): Integer; stdcall;
  TOpenSocket            = function (af, Struct, protocol: Integer): TSocket; stdcall;
  TInet_addr             = function (cp: PChar): u_long; stdcall;
  Thtons                 = function (hostshort: u_short): u_short; stdcall;
  TConnect               = function (s: TSocket; var name: TSockAddr;
                                       namelen: Integer): Integer; stdcall;
  TCloseSocket           = function (s: TSocket): Integer; stdcall;
  TNetServerGetInfo      =function  (servername:LPWSTR;level:DWORD;
                                      VAR buf:PSERVER_INFO_101):Dword;stdcall;

  TWSACleanup            =function():integer;stdcall;
  Tscan = procedure(Sender: TObject; Error : Integer) of object;

  Tscan_port = class(TComponent)
  private
    Fhand_dll :     HModule;                    // Handle for mpr.dll
    Fnetapi_dll :     HModule;                    // Handle for netapi32.dll
    FOnScan     : Tscan;
    FAddress    : String;
    FPort       : String;
    Fsocket     :Tsocket;
    FGetServerInfo   :Boolean;

    FWSAStartup            : TWSAStartup;
    FOpenSocket            : TOpenSocket;
    FInet_addr             : TInet_addr;
    Fhtons                 : Thtons;
    FConnect               : TConnect;
    FCloseSocket           : TCloseSocket;
    FNetServerGetInfo      : TNetServerGetInfo;
    FWSACleanup           :TWSACleanup;
protected
  public
    constructor Create(Owner : TComponent); override;
    destructor  Destroy; override;
    procedure    scan;
  published
    property    Address     : String       read  FAddress write FAddress;
    property    Port        : String       read  FPort write FPort;
    property    GetServerInfo   : Boolean       read  FGetServerInfo write FGetServerInfo;

    property    OnScan    : Tscan   read  FOnScan write FOnScan;
  end;

procedure Register;

implementation

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
constructor Tscan_port.Create(Owner : TComponent);
var
 GInitData:TWSAData;
begin
    Inherited Create(Owner);

    FGetServerInfo:=false;
    Fhand_dll := LoadLibrary('wsock32.dll');
    if Fhand_dll = 0 then
        raise ESocketException.Create('Unable to register wsock32.dll');
    Fnetapi_dll := LoadLibrary('netapi32.dll');
    if Fnetapi_dll = 0 then
        raise ESocketException.Create('Unable to register netapi32.dll');

    @FWSAStartup  := GetProcAddress(Fhand_dll, 'WSAStartup');

    @FOpenSocket :=  GetProcAddress(Fhand_dll, 'socket');
    @FInet_addr :=   GetProcAddress(Fhand_dll, 'inet_addr');
    @Fhtons  :=      GetProcAddress(Fhand_dll, 'htons');
    @FConnect :=     GetProcAddress(Fhand_dll, 'connect');
    @FCloseSocket := GetProcAddress(Fhand_dll, 'closesocket');
    @FNetServerGetInfo:= GetProcAddress(Fnetapi_dll, 'netservergetinfo');
    @FWSACleanup  := GetProcAddress(Fhand_dll, 'WSACleanup');

    if (@FWSAStartup =nil) or(@Fhtons =nil) or (@FConnect =nil) or (@FWSACleanup =nil) or
       (@FOpenSocket =nil) or (@FInet_addr =nil)or (@FCloseSocket =nil) then
          raise ESocketException.Create('¼ÓÔØdllº¯Êý´íÎó!');

   if FWSAStartup($101,GInitData)<>0 then
      raise ESocketException.Create('³õÊ¼»¯SOCKETº¯ÊýÊ§°Ü!');
//   Fsocket:=FOpenSocket(AF_INET,SOCK_STREAM,IPPROTO_TCP);

end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
destructor Tscan_port.Destroy;
begin
    FWSACleanup;
    if Fhand_dll <> 0 then
        FreeLibrary(Fhand_dll);
    if Fnetapi_dll <> 0 then
        FreeLibrary(Fnetapi_dll);

    inherited Destroy;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure Tscan_port.scan ;
var
  serv_addr:tSockAddrIn;
  istate:integer;
  host:thostent;
begin
  Fsocket:=FOpenSocket(AF_INET,SOCK_STREAM,IPPROTO_TCP);

  serv_addr.sin_family:=AF_INET;
  serv_addr.sin_port:=Fhtons(strtoint(fport));
  serv_addr.sin_addr.S_addr:=FInet_addr(pchar(faddress));
  serv_addr.sin_zero:='';
  istate:=FConnect(fsocket,serv_addr,sizeof(serv_addr));
  FCloseSocket(fsocket);
  if Assigned(FOnScan) then
        FOnScan(Self,istate);
end;

procedure Register;
begin
    RegisterComponents('Standard', [Tscan_port]);
end;

end.


