
{*************************************************************************}
{ 单元描述: 网络操作层的实现 (INDY 版)                                    }
{ 修改日期: 2005-01-18                                                    }
{*************************************************************************}

unit NetworkIndy;

interface

uses
  Windows, SysUtils, Classes, Dialogs, Types, Forms, SyncObjs,
  WinSock, Math, IdStack, IdComponent, IdSocks, IdUDPClient, IdUDPServer,
  IdTCPConnection, IdTCPClient, IdTCPServer, IdSocketHandle, IdException,
  IdHTTP, IdFTP, IdFTPCommon, IdResourceStrings, IdSimpleServer,
  IdIOHandlerSocket, NetworkLayer;

type

{ Exceptions }

  EIdFtpNotSupportResume = class(EIdException);

{ TIndyUdpClient }

  TIndyUdpClient = class(TUdpClient)
  private
    FIdUdpClient: TIdUDPClient;
  public
    constructor Create;
    destructor Destroy; override;
    procedure SendBuffer(const Host: string; Port: Integer;
      const Buffer; Size: Integer; SendTimes: Integer = 1); override;
  end;
  
{ TIndyUdpServer }

  TIndyUdpServer = class(TUdpServer)
  private
    FIdUdpServer: TIdUDPServer;
    
    procedure IdUDPServerUDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
  protected
    function GetActive: Boolean; override;
    function GetBindPort: Integer; override;
    function GetThreadedEvent: Boolean; override;
    procedure SetActive(Value: Boolean); override;
    procedure SetBindPort(Value: Integer); override;
    procedure SetThreadedEvent(Value: Boolean); override;
  public
    constructor Create;
    destructor Destroy; override;
    procedure SendBuffer(const Host: string; Port: Integer;
      const Buffer; Size: Integer; SendTimes: Integer = 1); override;
  end;

{ TIndyTcpConnection }

  TIndyTcpConnection = class(TTcpConnection)
  private
    FConnection: TIdTCPConnection;
  protected
    function GetConnected: Boolean; override;
    function GetPeerAddr: TPeerAddress; override;
    function GetReadTimeout: Integer; override;
    function GetInnerObject: TObject; override;
    procedure SetReadTimeout(Value: Integer); override;
    procedure SetInnerObject(AObject: TObject); override;
  public
    procedure Disconnect; override;
    procedure SendBuffer(const Buffer; Size: Integer); override;
    procedure RecvBuffer(var Buffer; Size: Integer); override;
  end;

{ TIndyTcpClient }

  TIndyTcpClient = class(TTcpClient)
  protected
    function GetConnected: Boolean; override;
    function GetTCPConnectionClass: TTCPConnectonClass; override;
    function GetTcpClient: TIdTCPClient;
    property TcpClient: TIdTCPClient read GetTcpClient;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Connect(const Host: string; Port: Integer); override;
  end;

{ TIndyTcpServer }

  TIndyTcpServer = class(TTcpServer)
  private
    FTcpServer: TIdTCPServer;
    procedure IdTCPServerExecute(AThread: TIdPeerThread);
    procedure IdTCPServerDisconnect(AThread: TIdPeerThread);
  protected
    function GetActive: Boolean; override;
    function GetBindPort: Integer; override;
    procedure SetActive(Value: Boolean); override;
    procedure SetBindPort(Value: Integer); override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

{ TIndyHttpClient }

  TIndyHttpClient = class(THttpClient)
  private
    FHttpClient: TIdHTTP;
    FDataSize: Integer;
    FSuccess: Boolean;
    
    procedure IdHTTPWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdHTTPWork(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
  protected
    procedure SetProxyParams(const Value: THTTPProxyParams); override;
    procedure SetRequest(const Value: THTTPRequest); override;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Get(URL: string; const ResponseContent: TStream); override;
    procedure Trace(URL: string; const ResponseContent: TStream); override;
    procedure Head(URL: string); override;
    procedure Post(URL: string; const Source, ResponseContent: TStream); override;
    procedure Put(URL: string; const Source, ResponseContent: TStream); override;
    procedure Stop; override;
  end;

{ TExIdFTP }

  TExIdFTP = class(TIdFTP)
  protected
    procedure InternalGet(const ACommand: string; ADest: TStream;
      StartPos, Length: Integer);
  public
    procedure Get(const ASourceFile: string; ADest: TStream;
      StartPos, Length: Integer); overload;
  end;

{ TIndyFtpClient }

  TIndyFtpClient = class(TFtpClient)
  private
    FFtpClient: TExIdFTP;
    FDataSize: Integer;

    procedure FtpClientWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure FtpClientWork(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
  protected
    function GetHost: string; override;
    function GetUserName: string; override;
    function GetPassword: string; override;
    function GetPort: Integer; override;
    function GetPassive: Boolean; override;
    function GetTransferType: TFTPTransferType; override;
    function GetResumeSupported: Boolean; override;
    procedure SetHost(const Value: string); override;
    procedure SetUserName(const Value: string); override;
    procedure SetPassword(const Value: string); override;
    procedure SetPort(Value: Integer); override;
    procedure SetPassive(Value: Boolean); override;
    procedure SetTransferType(Value: TFTPTransferType); override;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Connect(AutoLogin: Boolean = True; const ATimeout: Integer = -1); override;
    procedure Login; override;
    procedure Account(AInfo: string); override;
    procedure Abort; override;
    procedure Allocate(AAllocateBytes: Integer); override;
    procedure ChangeDir(const ADirName: string); override;
    procedure ChangeDirUp; override;
    procedure Delete(const AFilename: string); override;
    procedure Get(const URL: string; Stream: TStream; StartPos, Length: Integer); override;
    procedure Put(const Source: TStream; const DestFile: string = ''; const Append: Boolean = False); overload; override;
    procedure Put(const SourceFile: string; const DestFile: string = ''; const Append: Boolean = False); overload; override;
    procedure List(Dest: TStrings; const Specifier: string = ''; const Details: Boolean = True); override;
    procedure MakeDir(const DirName: string); override;
    procedure RemoveDir(const DirName: string); override;
    procedure Rename(const SourceFile, DestFile: string); override;
    function GetFileSize(const FileName: string): Integer; override;
    function RetrieveCurrentDir: string; override;
    procedure Noop; override;
    procedure Quit; override;
    procedure Disconnect; override;
  end;

{ TIncyMiscRoutines }

  TIndyMiscRoutines = class(TMiscRoutines)
  public
    function GetLocalIpList: TStrings; override;
    function GetLocalIp: string; override;
  end;

{ TIndyNetworkFactory }

  TIndyNetworkFactory = class(TNetworkFactory)
  public
    class function CreateUdpClient: TUdpClient; override;
    class function CreateUdpServer: TUdpServer; override;
    class function CreateTcpClient: TTcpClient; override;
    class function CreateTcpServer: TTcpServer; override;
    class function CreateHttpClient: THttpClient; override;
    class function CreateFtpClient: TFtpClient; override;
    class function CreateMiscRoutines: TMiscRoutines; override;
  end;

implementation

resourcestring
  SNotSupportResume = 'Resume not supported';

{ TIndyUdpClient }

constructor TIndyUdpClient.Create;
begin
  inherited;
  FIdUdpClient := TIdUDPClient.Create(nil);
end;

destructor TIndyUdpClient.Destroy;
begin
  FIdUdpClient.Free;
  inherited;
end;

procedure TIndyUdpClient.SendBuffer(const Host: string; Port: Integer;
  const Buffer; Size: Integer; SendTimes: Integer);
var
  I: Integer;
begin
  for I := 1 to SendTimes do
    FIdUdpClient.SendBuffer(Host, Port, (@Buffer)^, Size);
end;

{ TIndyUdpServer }

constructor TIndyUdpServer.Create;
begin
  inherited;
  FIdUdpServer := TIdUDPServer.Create(nil);
  FIdUdpServer.OnUDPRead := IdUDPServerUDPRead;
  FIdUdpServer.ThreadedEvent := False;
end;

destructor TIndyUdpServer.Destroy;
begin
  FIdUdpServer.Free;
  inherited;
end;

procedure TIndyUdpServer.IdUDPServerUDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
begin
  if Assigned(FOnDataReceived) then
    FOnDataReceived(Self, AData, PeerAddress(ABinding.PeerIp, ABinding.PeerPort));
end;

function TIndyUdpServer.GetActive: Boolean;
begin
  Result := FIdUdpServer.Active;
end;

function TIndyUdpServer.GetBindPort: Integer;
begin
  Result := FIdUdpServer.DefaultPort;
end;

function TIndyUdpServer.GetThreadedEvent: Boolean;
begin
  Result := FIdUdpServer.ThreadedEvent;
end;

procedure TIndyUdpServer.SetActive(Value: Boolean);
begin
  FIdUdpServer.Active := Value;
end;

procedure TIndyUdpServer.SetBindPort(Value: Integer);
begin
  FIdUdpServer.DefaultPort := Value;
end;

procedure TIndyUdpServer.SetThreadedEvent(Value: Boolean);
begin
  FIdUdpServer.ThreadedEvent := Value;
end;

procedure TIndyUdpServer.SendBuffer(const Host: string; Port: Integer;
  const Buffer; Size: Integer; SendTimes: Integer);
var
  I: Integer;
begin
  for I := 1 to SendTimes do
    FIdUdpServer.SendBuffer(Host, Port, (@Buffer)^, Size);
end;

{ TIndyTcpConnection }

function TIndyTcpConnection.GetConnected: Boolean;
begin
  Result := FConnection.Connected;
end;

function TIndyTcpConnection.GetPeerAddr: TPeerAddress;
begin
  with FConnection.Socket do
    Result := PeerAddress(Binding.PeerIp, Binding.PeerPort);
end;

function TIndyTcpConnection.GetReadTimeout: Integer;
begin
  Result := FConnection.ReadTimeout;
end;

function TIndyTcpConnection.GetInnerObject: TObject;
begin
  Result := FConnection;
end;

procedure TIndyTcpConnection.SetReadTimeout(Value: Integer);
begin
  FConnection.ReadTimeout := Value;
end;

procedure TIndyTcpConnection.SetInnerObject(AObject: TObject);
begin
  FConnection := (AObject as TIdTCPConnection);
end;

procedure TIndyTcpConnection.Disconnect;
begin
  FConnection.Disconnect;
end;

procedure TIndyTcpConnection.SendBuffer(const Buffer; Size: Integer);
begin
  FConnection.WriteBuffer(Buffer, Size);
end;

procedure TIndyTcpConnection.RecvBuffer(var Buffer; Size: Integer);
begin
  FConnection.ReadBuffer(Buffer, Size);
end;

{ TIndyTcpClient }

constructor TIndyTcpClient.Create;
begin
  inherited;
  TIndyTcpConnection(FConnection).InnerObject := TIdTCPClient.Create(nil);
end;

destructor TIndyTcpClient.Destroy;
begin
  TIndyTcpConnection(FConnection).InnerObject.Free;
  TIndyTcpConnection(FConnection).InnerObject := nil;
  inherited;
end;

function TIndyTcpClient.GetConnected: Boolean;
begin
  Result := GetTcpClient.Connected;
end;

function TIndyTcpClient.GetTCPConnectionClass: TTCPConnectonClass;
begin
  Result := TIndyTcpConnection;
end;

function TIndyTcpClient.GetTcpClient: TIdTCPClient;
begin
  Result := TIdTCPClient(TIndyTcpConnection(FConnection).InnerObject);
end;

procedure TIndyTcpClient.Connect(const Host: string; Port: Integer);
var
  TCPClient: TIdTCPClient;
begin
  TCPClient := GetTcpClient;
  TCPClient.Disconnect;
  TCPClient.Host := Host;
  TCPClient.Port := Port;
  TCPClient.Connect;
end;

{ TIndyTcpServer }

constructor TIndyTcpServer.Create;
begin
  inherited;
  FTcpServer := TIdTCPServer.Create(nil);
  FTcpServer.OnExecute := IdTCPServerExecute;
  FTcpServer.OnDisconnect := IdTCPServerDisconnect;
end;

destructor TIndyTcpServer.Destroy;
begin
  FTcpServer.Free;
  inherited;
end;

procedure TIndyTcpServer.IdTCPServerExecute(AThread: TIdPeerThread);
var
  Connection: TIndyTcpConnection;
begin
  if Assigned(FOnConnect) then
  begin
    Connection := TIndyTcpConnection.Create(Self);
    try
      Connection.InnerObject := AThread.Connection;
      FOnConnect(AThread, Connection);
    finally
      Connection.Free;
    end;
  end;
end;

procedure TIndyTcpServer.IdTCPServerDisconnect(AThread: TIdPeerThread);
var
  Connection: TIndyTcpConnection;
begin
  if Assigned(FOnDisconnect) then
  begin
    Connection := TIndyTcpConnection.Create(Self);
    try
      Connection.InnerObject := AThread.Connection;
      FOnDisconnect(AThread, Connection);
    finally
      Connection.Free;
    end;
  end;
end;

function TIndyTcpServer.GetActive: Boolean;
begin
  Result := FTcpServer.Active;
end;

function TIndyTcpServer.GetBindPort: Integer;
begin
  Result := FTcpServer.DefaultPort;
end;

procedure TIndyTcpServer.SetActive(Value: Boolean);
begin
  FTcpServer.Active := Value;
end;

procedure TIndyTcpServer.SetBindPort(Value: Integer);
begin
  FTcpServer.DefaultPort := Value;
end;

{ TIndyHttpClient }

constructor TIndyHttpClient.Create;
begin
  inherited;
  FHttpClient := TIdHTTP.Create(nil);
  FHttpClient.HandleRedirects := True;
  FHttpClient.OnWorkBegin := IdHTTPWorkBegin;
  FHttpClient.OnWork := IdHTTPWork;
end;

destructor TIndyHttpClient.Destroy;
begin
  FHttpClient.Free;
  inherited;
end;

procedure TIndyHttpClient.IdHTTPWorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
  if FHttpClient.ResponseCode in [200, 206] then
  begin
    FSuccess := True;
    FDataSize := AWorkCountMax;
    DoStartEvent(FDataSize);
  end;
end;

procedure TIndyHttpClient.IdHTTPWork(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
  if FSuccess then
    DoProgressEvent(FDataSize, AWorkCount);
end;

procedure TIndyHttpClient.SetProxyParams(const Value: THTTPProxyParams);
begin
  inherited;
  FHttpClient.ProxyParams.ProxyServer := Value.Host;
  FHttpClient.ProxyParams.ProxyPort := Value.Port;
  FHttpClient.ProxyParams.ProxyUsername := Value.UserName;
  FHttpClient.ProxyParams.ProxyPassword := Value.Password;
end;

procedure TIndyHttpClient.SetRequest(const Value: THTTPRequest);
begin
  inherited;
  FHttpClient.Request.Accept := Value.Accept;
  FHttpClient.Request.AcceptCharSet := Value.AcceptCharSet;
  FHttpClient.Request.AcceptEncoding := Value.AcceptEncoding;
  FHttpClient.Request.AcceptLanguage := Value.AcceptLanguage;
  FHttpClient.Request.From := Value.From;
  FHttpClient.Request.Username := Value.UserName;
  FHttpClient.Request.Password := Value.Password;
  FHttpClient.Request.Referer := Value.Referer;
  FHttpClient.Request.UserAgent := Value.UserAgent;
  FHttpClient.Request.Host := Value.Host;
  FHttpClient.Request.ProxyConnection := Value.ProxyConnection;
  FHttpClient.Request.ContentRangeStart := Value.ContentRangeStart;
  FHttpClient.Request.ContentRangeEnd := Value.ContentRangeEnd;
end;

procedure TIndyHttpClient.Get(URL: string; const ResponseContent: TStream);
begin
  FSuccess := False;
  SetRequest(Request);
  FHttpClient.Get(URL, ResponseContent);
  DoDoneEvent;
end;

procedure TIndyHttpClient.Trace(URL: string; const ResponseContent: TStream);
begin
  FSuccess := False;
  SetRequest(Request);
  FHttpClient.Trace(URL, ResponseContent);
end;

procedure TIndyHttpClient.Head(URL: string);
begin
  FSuccess := False;
  SetRequest(Request);
  FHttpClient.Head(URL);
end;

procedure TIndyHttpClient.Post(URL: string; const Source,
  ResponseContent: TStream);
begin
  FSuccess := False;
  SetRequest(Request);
  FHttpClient.Post(URL, Source, ResponseContent)
end;

procedure TIndyHttpClient.Put(URL: string; const Source,
  ResponseContent: TStream);
begin
  FSuccess := False;
  SetRequest(Request);
  FHttpClient.Put(URL, Source, responseContent);
end;

procedure TIndyHttpClient.Stop;
begin
  FHttpClient.Disconnect;
end;

{ TExIdFTP }

procedure TExIdFTP.InternalGet(const ACommand: string; ADest: TStream;
  StartPos, Length: Integer);
var
  LIp: string;
  LPort: Integer;
  LResponse: Integer;
begin
  DoStatus(ftpTransfer, [RSFTPStatusStartTransfer]);
  try
    if FPassive then
    begin
      SendPassive(LIp, LPort);
      FDataChannel := TIdTCPClient.Create(nil);
      try
        with (FDataChannel as TIdTCPClient) do
        begin
          if (IOHandler is TIdIOHandlerSocket) and (Self.IOHandler is
            TIdIOHandlerSocket) then
          begin
            TIdIOHandlerSocket(IOHandler).SocksInfo.Assign(TIdIOHandlerSocket(Self.IOHandler).SocksInfo);
          end;
          InitDataChannel;
          Host := LIp;
          Port := LPort;
          Connect;
          try
            if StartPos > 0 then
            begin
              Self.SendCmd('REST ' + IntToStr(StartPos), [350]);  {Do not tranlsate}
            end;
            Self.WriteLn(ACommand);
            Self.GetResponse([125, 150, 154]);
            if Length = 0 then
              ReadStream(ADest, -1, True)
            else
              ReadStream(ADest, Length, False);
          finally
            Disconnect;
          end;
        end;
      finally FreeAndNil(FDataChannel);
      end;
    end else
    begin
      FDataChannel := TIdSimpleServer.Create(nil);
      try
        with TIdSimpleServer(FDataChannel) do
        begin
          InitDataChannel;
          BoundIp := (Self.IOHandler as TIdIOHandlerSocket).Binding.Ip;
          BeginListen;
          SendPort(Binding);
          if StartPos > 0 then
          begin
            Self.SendCmd('REST ' + IntToStr(StartPos), [350]);  {Do not translate}
          end;
          Self.SendCmd(ACommand, [125, 150, 154]);
          Listen;
          if Length = 0 then
            ReadStream(ADest, -1, True)
          else
            ReadStream(ADest, Length, False);
        end;
      finally
        FreeAndNil(FDataChannel);
      end;
    end;
  finally
    DoStatus(ftpReady, [RSFTPStatusDoneTransfer]);
  end;
  // ToDo: Change that to properly handle response code (not just success or except)
  // 226 = download successful, 225 = Abort successful}
  LResponse := GetResponse([225, 226, 250, 426, 450]);
  if (LResponse = 426) or (LResponse = 450) then
  begin
    GetResponse([226, 225]);
    DoStatus(ftpAborted, [RSFTPStatusAbortTransfer]);
  end;
end;

procedure TExIdFTP.Get(const ASourceFile: string; ADest: TStream;
  StartPos, Length: Integer);
var
  FileSize: Integer;
  Resume: Boolean;
begin
  FileSize := Size(ASourceFile);
  if FileSize > 0 then
  begin
    if StartPos < 0 then StartPos := 0;
    if StartPos > FileSize then StartPos := FileSize;
    if Length < 0 then Length := 0;
    if Length >= FileSize - StartPos then Length := 0;

    Resume := (StartPos > 0) and CanResume;
    if not Resume and (StartPos > 0) then
      raise EIdFtpNotSupportResume.Create(SNotSupportResume);

    InternalGet('RETR ' + ASourceFile, ADest, StartPos, Length); {Do not translate}
    DoAfterGet(ADest);
  end else
  begin
  end;
end;

{ TIndyFtpClient }

constructor TIndyFtpClient.Create;
begin
  inherited;
  FFtpClient := TExIdFTP.Create(nil);
  FFtpClient.OnWorkBegin := FtpClientWorkBegin;
  FFtpClient.OnWork := FtpClientWork;
end;

destructor TIndyFtpClient.Destroy;
begin
  FFtpClient.Free;
  inherited;
end;

procedure TIndyFtpClient.FtpClientWorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
  DoStartEvent(FDataSize);
end;

procedure TIndyFtpClient.FtpClientWork(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
  DoProgressEvent(FDataSize, AWorkCount);
end;

function TIndyFtpClient.GetHost: string;
begin
  Result := FFtpClient.Host;
end;

function TIndyFtpClient.GetUserName: string;
begin
  Result := FFtpClient.Username;
end;

function TIndyFtpClient.GetPassword: string;
begin
  Result := FFtpClient.Password;
end;

function TIndyFtpClient.GetPort: Integer;
begin
  Result := FFtpClient.Port;
end;

function TIndyFtpClient.GetPassive: Boolean;
begin
  Result := FFtpClient.Passive;
end;

function TIndyFtpClient.GetTransferType: TFTPTransferType;
begin
  Result := TFTPTransferType(FFtpClient.TransferType);
end;

function TIndyFtpClient.GetResumeSupported: Boolean;
begin
  Result := FFtpClient.ResumeSupported;
end;

procedure TIndyFtpClient.SetHost(const Value: string);
begin
  FFtpClient.Host := Value;
end;

procedure TIndyFtpClient.SetUserName(const Value: string);
begin
  FFtpClient.Username := Value;
end;

procedure TIndyFtpClient.SetPassword(const Value: string);
begin
  FFtpClient.Password := Value;
end;

procedure TIndyFtpClient.SetPort(Value: Integer);
begin
  FFtpClient.Port := Value;
end;

procedure TIndyFtpClient.SetPassive(Value: Boolean);
begin
  FFtpClient.Passive := Value;
end;

procedure TIndyFtpClient.SetTransferType(Value: TFTPTransferType);
begin
  FFtpClient.TransferType := TIdFTPTransferType(Value);
end;

procedure TIndyFtpClient.Connect(AutoLogin: Boolean = True; const ATimeout: Integer = -1);
begin
  FFtpClient.Connect(AutoLogin, ATimeout);
end;

procedure TIndyFtpClient.Login;
begin
  FFtpClient.Login;
end;

procedure TIndyFtpClient.Account(AInfo: string);
begin
  FFtpClient.Account(AInfo);
end;

procedure TIndyFtpClient.Abort;
begin
  FFtpClient.Abort;
end;

procedure TIndyFtpClient.Allocate(AAllocateBytes: Integer);
begin
  FFtpClient.Allocate(AAllocateBytes);
end;

procedure TIndyFtpClient.ChangeDir(const ADirName: string);
begin
  FFtpClient.ChangeDir(ADirName);
end;

procedure TIndyFtpClient.ChangeDirUp;
begin
  FFtpClient.ChangeDirUp;
end;

procedure TIndyFtpClient.Delete(const AFilename: string);
begin
  FFtpClient.Delete(AFileName);
end;

procedure TIndyFtpClient.Get(const URL: string; Stream: TStream; StartPos, Length: Integer);
begin
  FDataSize := GetFileSize(URL);
  FFtpClient.Get(URL, Stream, StartPos, Length);
  DoDoneEvent;
end;

procedure TIndyFtpClient.Put(const Source: TStream; const DestFile: string = ''; const Append: Boolean = False);
begin
  FFtpClient.Put(Source, DestFile, Append);
end;

procedure TIndyFtpClient.Put(const SourceFile: string; const DestFile: string = ''; const Append: Boolean = False);
begin
  FFtpClient.Put(SourceFile, DestFile, Append);
end;

procedure TIndyFtpClient.List(Dest: TStrings; const Specifier: string = ''; const Details: Boolean = True);
begin
  FFtpClient.List(Dest, Specifier, Details);
end;

procedure TIndyFtpClient.MakeDir(const DirName: string);
begin
  FFtpClient.MakeDir(DirName);
end;

procedure TIndyFtpClient.RemoveDir(const DirName: string);
begin
  FFtpClient.RemoveDir(DirName);
end;

procedure TIndyFtpClient.Rename(const SourceFile, DestFile: string);
begin
  FFtpClient.Rename(SourceFile, DestFile);
end;

function TIndyFtpClient.GetFileSize(const FileName: string): Integer;
begin
  Result := FFtpClient.Size(FileName);
end;

function TIndyFtpClient.RetrieveCurrentDir: string;
begin
  Result := FFtpClient.RetrieveCurrentDir;
end;

procedure TIndyFtpClient.Noop;
begin
  FFtpClient.Noop;
end;

procedure TIndyFtpClient.Quit;
begin
  FFtpClient.Quit;
end;

procedure TIndyFtpClient.Disconnect;
begin
  FFtpClient.Disconnect;
end;

{ TIndyMiscRoutines }

function TIndyMiscRoutines.GetLocalIpList: TStrings;
begin
  Result := GStack.LocalAddresses;
end;

function TIndyMiscRoutines.GetLocalIp: string;
begin
  Result := GStack.LocalAddress;
end;

{ TIndyNetworkFactory }

class function TIndyNetworkFactory.CreateUdpClient: TUdpClient;
begin
  Result := TIndyUdpClient.Create;
end;

class function TIndyNetworkFactory.CreateUdpServer: TUdpServer;
begin
  Result := TIndyUdpServer.Create;
end;

class function TIndyNetworkFactory.CreateTcpClient: TTcpClient;
begin
  Result := TIndyTcpClient.Create;
end;

class function TIndyNetworkFactory.CreateTcpServer: TTcpServer;
begin
  Result := TIndyTcpServer.Create;
end;

class function TIndyNetworkFactory.CreateHttpClient: THttpClient;
begin
  Result := TIndyHttpClient.Create;
end;

class function TIndyNetworkFactory.CreateFtpClient: TFtpClient;
begin
  Result := TIndyFtpClient.Create;
end;

class function TIndyNetworkFactory.CreateMiscRoutines: TMiscRoutines;
begin
  Result := TIndyMiscRoutines.Create;
end;

initialization
  NetworkFactory := TIndyNetworkFactory.Create;

finalization
  NetworkFactory.Free;

end.
