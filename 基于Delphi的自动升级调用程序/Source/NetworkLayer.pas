
{*************************************************************************}
{ 单元描述: 网络操作分离层 基类                                           }
{ 修改日期: 2005-01-18                                                    }
{*************************************************************************}

unit NetworkLayer;

interface

uses
  Classes, SysUtils;

type

  TPeerAddress = record
    Ip: string;
    Port: Integer;
  end;

  TStartEvent = procedure (Sender: TObject; Size: Int64) of object;
  TProgressEvent = procedure (Sender: TObject; Max, Pos: Int64) of object;
  
{ TUdpClient }

  TUdpClient = class(TObject)
  public
    procedure SendBuffer(const Host: string; Port: Integer;
      const Buffer; Size: Integer; SendTimes: Integer = 1); virtual; abstract;
  end;

{ TUdpServer }

  TUdpDataRecvEvent = procedure(Sender: TObject; AData: TStream;
    const FromAddr: TPeerAddress) of object;

  TUdpServer = class(TObject)
  protected
    FOnDataReceived: TUdpDataRecvEvent;
    function GetActive: Boolean; virtual; abstract;
    function GetBindPort: Integer; virtual; abstract;
    function GetThreadedEvent: Boolean; virtual; abstract;
    procedure SetActive(Value: Boolean); virtual; abstract;
    procedure SetBindPort(Value: Integer); virtual; abstract;
    procedure SetThreadedEvent(Value: Boolean); virtual; abstract;
  public
    procedure SendBuffer(const Host: string; Port: Integer;
      const Buffer; Size: Integer; SendTimes: Integer = 1); virtual; abstract;
    property Active: Boolean read GetActive write SetActive;
    property BindPort: Integer read GetBindPort write SetBindPort;
    property ThreadedEvent: Boolean read GetThreadedEvent write SetThreadedEvent;
    property OnDataReceived: TUdpDataRecvEvent read FOnDataReceived write FOnDataReceived;
  end;

{ TTcpConnection }

  TTcpConnectonClass = class of TTcpConnection;

  TTcpConnection = class(TObject)
  protected
    FOwner: TObject;   // TTcpClient/TTcpServer
    function GetConnected: Boolean; virtual; abstract;
    function GetPeerAddr: TPeerAddress; virtual; abstract;
    function GetReadTimeout: Integer; virtual; abstract;
    function GetInnerObject: TObject; virtual; abstract;
    procedure SetReadTimeout(Value: Integer); virtual; abstract;
    procedure SetInnerObject(AObject: TObject); virtual; abstract;
    property InnerObject: TObject read GetInnerObject write SetInnerObject;
  public
    constructor Create(AOwner: TObject); virtual;
    destructor Destroy; override;

    procedure Disconnect; virtual; abstract;
    procedure SendBuffer(const Buffer; Size: Integer); virtual; abstract;
    procedure RecvBuffer(var Buffer; Size: Integer); virtual; abstract;

    property Owner: TObject read FOwner;
    property Connected: Boolean read GetConnected;
    property PeerAddr: TPeerAddress read GetPeerAddr;
    property ReadTimeout: Integer read GetReadTimeout write SetReadTimeout;
  end;

{ TTcpClient }

  TTcpClient = class(TObject)
  protected
    FConnection: TTcpConnection;
    function GetConnected: Boolean; virtual;
    function GetTcpConnectionClass: TTcpConnectonClass; virtual; abstract;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Connect(const Host: string; Port: Integer); virtual; abstract;
    procedure Disconnect;
    procedure SendBuffer(const Buffer; Size: Integer);
    procedure RecvBuffer(var Buffer; Size: Integer);
    
    property Connection: TTcpConnection read FConnection;
    property Connected: Boolean read GetConnected;
  end;

{ TTcpServer }

  TServerThreadEvent = procedure(AThread: TThread; AConnection: TTcpConnection) of object;

  TTcpServer = class(TObject)
  protected
    FOnConnect: TServerThreadEvent;
    FOnDisconnect: TServerThreadEvent;
    
    function GetActive: Boolean; virtual; abstract;
    function GetBindPort: Integer; virtual; abstract;
    procedure SetActive(Value: Boolean); virtual; abstract;
    procedure SetBindPort(Value: Integer); virtual; abstract;
  public
    property Active: Boolean read GetActive write SetActive;
    property BindPort: Integer read GetBindPort write SetBindPort;

    property OnConnect: TServerThreadEvent read FOnConnect write FOnConnect;
    property OnDisconnect: TServerThreadEvent read FOnDisconnect write FOnDisconnect;
  end;

{ THttpProxyParams }

  THttpProxyParams = class(TPersistent)
  private
    FHost: string;
    FPort: Integer;
    FUserName: string;
    FPassword: string;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    property Host: string read FHost write FHost;
    property Port: Integer read FPort write FPort;
    property UserName: string read FUserName write FUserName;
    property Password: string read FPassword write FPassword;
  end;

{ THttpRequest }

  THttpRequest = class(TPersistent)
  private
    FAccept: string;
    FAcceptCharSet: string;
    FAcceptEncoding: string;
    FAcceptLanguage: string;
    FFrom: string;
    FUserName: string;
    FPassword: string;
    FReferer: string;
    FUserAgent: string;
    FHost: string;
    FProxyConnection: string;
    FContentRangeStart: Cardinal;
    FContentRangeEnd: Cardinal;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  published
    property Accept: string read FAccept write FAccept;
    property AcceptCharSet: string read FAcceptCharSet write FAcceptCharSet;
    property AcceptEncoding: string read FAcceptEncoding write FAcceptEncoding;
    property AcceptLanguage: string read FAcceptLanguage write FAcceptLanguage;
    property From: string read FFrom write FFrom;
    property UserName: string read FUserName write FUserName;
    property Password: string read FPassword write FPassword;
    property Referer: string read FReferer write FReferer;
    property UserAgent: string read FUserAgent write FUserAgent;
    property Host: string read FHost write FHost;
    property ProxyConnection: string read FProxyConnection write FProxyConnection;
    property ContentRangeStart: Cardinal read FContentRangeStart write FContentRangeStart;
    property ContentRangeEnd: Cardinal read FContentRangeEnd write FContentRangeEnd;
  end;

{ THttpClient }

  THttpClient = class(TObject)
  private
    FProxyParams: THttpProxyParams;
    FRequest: THttpRequest;
  protected
    FOnStart: TStartEvent;
    FOnDone: TNotifyEvent;
    FOnProgress: TProgressEvent;
  
    procedure SetProxyParams(const Value: THttpProxyParams); virtual;
    procedure SetRequest(const Value: THttpRequest); virtual;
    procedure DoStartEvent(Size: Integer); virtual;
    procedure DoDoneEvent; virtual;
    procedure DoProgressEvent(Max, Pos: Integer); virtual;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Get(URL: string; const ResponseContent: TStream); overload; virtual; abstract;
    function Get(URL: string): string; overload;
    procedure Trace(URL: string; const ResponseContent: TStream); overload; virtual; abstract;
    function Trace(URL: string): string; overload;
    procedure Head(URL: string); virtual; abstract;
    procedure Post(URL: string; const Source, ResponseContent: TStream); overload; virtual; abstract;
    function Post(URL: string; const Source: TStream): string; overload;
    procedure Put(URL: string; const Source, ResponseContent: TStream); overload; virtual; abstract;
    function Put(URL: string; const Source: TStream): string; overload;
    procedure Stop; virtual; abstract;

    property ProxyParams: THttpProxyParams read FProxyParams write SetProxyParams;
    property Request: THttpRequest read FRequest write SetRequest;
    property OnStart: TStartEvent read FOnStart write FOnStart;
    property OnProgress: TProgressEvent read FOnProgress write FOnProgress;
    property OnDone: TNotifyEvent read FOnDone write FOnDone;
  end;

{ TFtpClient }

  TFTPTransferType = (fttASCII, fttBinary);

  TFtpClient = class(TObject)
  protected
    FOnStart: TStartEvent;
    FOnDone: TNotifyEvent;
    FOnProgress: TProgressEvent;

    function GetHost: string; virtual; abstract;
    function GetUserName: string; virtual; abstract;
    function GetPassword: string; virtual; abstract;
    function GetPort: Integer; virtual; abstract;
    function GetPassive: Boolean; virtual; abstract;
    function GetTransferType: TFTPTransferType; virtual; abstract;
    function GetResumeSupported: Boolean; virtual; abstract;
    procedure SetHost(const Value: string); virtual; abstract;
    procedure SetUserName(const Value: string); virtual; abstract;
    procedure SetPassword(const Value: string); virtual; abstract;
    procedure SetPort(Value: Integer); virtual; abstract;
    procedure SetPassive(Value: Boolean); virtual; abstract;
    procedure SetTransferType(Value: TFTPTransferType); virtual; abstract;

    procedure DoStartEvent(Size: Integer); virtual;
    procedure DoDoneEvent; virtual;
    procedure DoProgressEvent(Max, Pos: Integer); virtual;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Connect(AutoLogin: Boolean = True; const ATimeout: Integer = -1); virtual; abstract;
    procedure Login; virtual; abstract;
    procedure Account(AInfo: String); virtual; abstract;
    procedure Abort; virtual; abstract;
    procedure Allocate(AAllocateBytes: Integer); virtual; abstract;
    procedure ChangeDir(const ADirName: string); virtual; abstract;
    procedure ChangeDirUp; virtual; abstract;
    procedure Delete(const AFilename: string); virtual; abstract;
    procedure Get(const URL: string; Stream: TStream; StartPos, Length: Integer); virtual; abstract;
    procedure Put(const Source: TStream; const DestFile: string = ''; const Append: Boolean = False); overload; virtual; abstract;
    procedure Put(const SourceFile: string; const DestFile: string = ''; const Append: Boolean = False); overload; virtual; abstract;
    procedure List(Dest: TStrings; const Specifier: string = ''; const Details: Boolean = True); virtual; abstract;
    procedure MakeDir(const DirName: string); virtual; abstract;
    procedure RemoveDir(const DirName: string); virtual; abstract;
    procedure Rename(const SourceFile, DestFile: string); virtual; abstract;
    function GetFileSize(const FileName: string): Integer; virtual; abstract;
    function RetrieveCurrentDir: string; virtual; abstract;
    procedure Noop; virtual; abstract;
    procedure Quit; virtual; abstract;
    procedure Disconnect; virtual; abstract;

    property Host: string read GetHost write SetHost;
    property UserName: string read GetUserName write SetUserName;
    property Password: string read GetPassword write SetPassword;
    property Port: Integer read GetPort write SetPort;
    property Passive: Boolean read GetPassive write SetPassive;
    property ResumeSupported: Boolean read GetResumeSupported;
    property TransferType: TFTPTransferType read GetTransferType write SetTransferType;

    property OnStart: TStartEvent read FOnStart write FOnStart;
    property OnProgress: TProgressEvent read FOnProgress write FOnProgress;
    property OnDone: TNotifyEvent read FOnDone write FOnDone;
  end;

{ TMiscRoutines }

  TMiscRoutines = class(TObject)
  public
    function GetLocalIpList: TStrings; virtual; abstract;
    function GetLocalIp: string; virtual; abstract;
  end;

{ TNetworkFactory }

  TNetworkFactory = class(TObject)
  public
    class function CreateUdpClient: TUdpClient; virtual; abstract;
    class function CreateUdpServer: TUdpServer; virtual; abstract;
    class function CreateTcpClient: TTcpClient; virtual; abstract;
    class function CreateTcpServer: TTcpServer; virtual; abstract;
    class function CreateHttpClient: THttpClient; virtual; abstract;
    class function CreateFtpClient: TFtpClient; virtual; abstract;
    class function CreateMiscRoutines: TMiscRoutines; virtual; abstract;
  end;

var
  NetworkFactory: TNetworkFactory;

function PeerAddress(const Ip: string; Port: Integer): TPeerAddress;
function IpToString(Ip: Integer): string;
function StringToIp(const S: string): Integer;

implementation

{ Misc }

//-----------------------------------------------------------------------------
// 描述: 返回TPeerAddress
//-----------------------------------------------------------------------------
function PeerAddress(const Ip: string; Port: Integer): TPeerAddress;
begin
  Result.Ip := Ip;
  Result.Port := Port;
end;

//-----------------------------------------------------------------------------
// 描述: 整型IP (主机字节顺序) -> DotDot形式
//-----------------------------------------------------------------------------
function IpToString(Ip: Integer): string;
type
  TIntegerRec = packed record
    b1, b2, b3, b4: Byte;
  end;
begin
  with TIntegerRec(Ip) do
  begin
    Result := IntToStr(b4) + '.' + IntToStr(b3) + '.' +
      IntToStr(b2) + '.' + IntToStr(b1);
  end;
end;

//-----------------------------------------------------------------------------
// 描述: DotDot形式 -> 整型IP (主机字节顺序)
//-----------------------------------------------------------------------------
function StringToIp(const S: string): Integer;
type
  TIntegerRec = packed record
    b1, b2, b3, b4: Byte;
  end;

  function Fetch(var AInput: string): String;
  var
    I: Integer;
  begin
    I := Pos('.', AInput);
    if I = 0 then
    begin
      Result := AInput;
      AInput := '';
    end else
    begin
      Result := Copy(AInput, 1, I - 1);
      AInput := Copy(AInput, I + 1, MaxInt);
    end;
  end;

var
  IPStr: string;
begin
  IPStr := S;
  with TIntegerRec(Result) do
  begin
    b4 := Byte(StrToIntDef(Fetch(IPStr), 0));
    b3 := Byte(StrToIntDef(Fetch(IPStr), 0));
    b2 := Byte(StrToIntDef(Fetch(IPStr), 0));
    b1 := Byte(StrToIntDef(Fetch(IPStr), 0));
  end;
end;

{ TTcpConnection }

constructor TTcpConnection.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
end;

destructor TTcpConnection.Destroy;
begin
  if InnerObject <> nil then
    Disconnect;
  inherited;
end;

{ TTcpClient }

constructor TTcpClient.Create;
begin
  inherited;
  FConnection := GetTcpConnectionClass.Create(Self);
end;

destructor TTcpClient.Destroy;
begin
  FConnection.Free;
  inherited;
end;

function TTcpClient.GetConnected: Boolean;
begin
  Result := FConnection.Connected;
end;

procedure TTcpClient.Disconnect;
begin
  FConnection.Disconnect;
end;

procedure TTcpClient.SendBuffer(const Buffer; Size: Integer);
begin
  FConnection.SendBuffer(Buffer, Size);
end;

procedure TTcpClient.RecvBuffer(var Buffer; Size: Integer);
begin
  FConnection.RecvBuffer(Buffer, Size);
end;

{ THttpProxyParams }

procedure THttpProxyParams.AssignTo(Dest: TPersistent);
begin
  if Dest is THttpProxyParams then
  begin
    THttpProxyParams(Dest).FHost := FHost;
    THttpProxyParams(Dest).FPort := FPort;
    THttpProxyParams(Dest).FUserName := FUserName;
    THttpProxyParams(Dest).FPassword := FPassword;
  end else
    inherited;
end;

{ THttpRequest }

procedure THttpRequest.AssignTo(Dest: TPersistent);
begin
  if Dest is THttpRequest then
  begin
    THttpRequest(Dest).FAccept := FAccept;
    THttpRequest(Dest).FAcceptCharSet := FAcceptCharSet;
    THttpRequest(Dest).FAcceptEncoding := FAcceptEncoding;
    THttpRequest(Dest).FAcceptLanguage := FAcceptLanguage;
    THttpRequest(Dest).FFrom := FFrom;
    THttpRequest(Dest).FUserName := FFrom;
    THttpRequest(Dest).FPassword := FPassword;
    THttpRequest(Dest).FReferer := FReferer;
    THttpRequest(Dest).FUserAgent := FUserAgent;
    THttpRequest(Dest).FHost := FHost;
    THttpRequest(Dest).FProxyConnection := FProxyConnection;
    THttpRequest(Dest).FContentRangeStart := FContentRangeStart;
    THttpRequest(Dest).FContentRangeEnd := FContentRangeEnd;
  end else
    inherited;
end;

{ THttpClient }

constructor THttpClient.Create;
begin
  inherited;
  FProxyParams := THttpProxyParams.Create;
  FRequest := THttpRequest.Create;
end;

destructor THttpClient.Destroy;
begin
  FProxyParams.Free;
  FRequest.Free;
  inherited;
end;

procedure THttpClient.SetProxyParams(const Value: THttpProxyParams);
begin
  FProxyParams.Assign(Value);
end;

procedure THttpClient.SetRequest(const Value: THttpRequest);
begin
  FRequest.Assign(Value);
end;

procedure THttpClient.DoStartEvent(Size: Integer);
begin
  if Assigned(FOnStart) then
    FOnStart(Self, Size);
end;

procedure THttpClient.DoDoneEvent;
begin
  if Assigned(FOnDone) then
    FOnDone(Self);
end;

procedure THttpClient.DoProgressEvent(Max, Pos: Integer);
begin
  Assert(Max >= 0);
  Assert(Pos <= Max);
  if Assigned(FOnProgress) then
    FOnProgress(Self, Max, Pos);
end;

function THttpClient.Get(URL: string): string;
var
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  try
    Get(URL, Stream);
  finally
    if Stream.Size > 0 then
    begin
      SetLength(Result, Stream.Size);
      Move(PChar(Stream.Memory)^, Result[1], Stream.Size);
    end;
    Stream.Free;
  end;
end;

function THttpClient.Trace(URL: string): string;
var
  Stream: TStringStream;
begin
  Stream := TStringStream.Create('');
  try
    Trace(URL, Stream);
    Result := Stream.DataString;
  finally
    Stream.Free;
  end;
end;

function THttpClient.Post(URL: string; const Source: TStream): string;
var
  LResponse: TStringStream;
begin
  LResponse := TStringStream.Create('');
  try
    Post(URL, Source, LResponse);
  finally
    Result := LResponse.DataString;
    LResponse.Free;
  end;
end;

function THttpClient.Put(URL: string; const Source: TStream): string;
var
  LResponse: TStringStream;
begin
  LResponse := TStringStream.Create('');
  try
    Post(URL, Source, LResponse);
  finally
    Result := LResponse.DataString;
    LResponse.Free;
  end;
end;

{ TFtpClient }

constructor TFtpClient.Create;
begin
  inherited;
end;

destructor TFtpClient.Destroy;
begin
  inherited;
end;

procedure TFtpClient.DoStartEvent(Size: Integer);
begin
  if Assigned(FOnStart) then
    FOnStart(Self, Size);
end;

procedure TFtpClient.DoDoneEvent;
begin
  if Assigned(FOnDone) then
    FOnDone(Self);
end;

procedure TFtpClient.DoProgressEvent(Max, Pos: Integer);
begin
  Assert(Max >= 0);
  Assert(Pos <= Max);
  if Assigned(FOnProgress) then
    FOnProgress(Self, Max, Pos);
end;

end.
