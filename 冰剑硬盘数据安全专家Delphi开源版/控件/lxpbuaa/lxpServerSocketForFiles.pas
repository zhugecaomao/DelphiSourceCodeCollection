unit lxpServerSocketForFiles;

interface

uses
  Windows, Messages, SysUtils, Classes, ScktComp;

type
  TServerSocketStatus =
    procedure (
      Sender: TObject;
      ClientSocket: TServerClientWinSocket;
      Status: Word;
      thisTime: TDateTime
    ) of object;
  TlxpServerSocketForFiles = class(TServerSocket)
  private
    FFilesName: TStrings;
    FActiveThreadsCount, FBufferSize: Integer;
    OldOnGetThread: TGetThreadEvent;
    FOnSocketStatus: TServerSocketStatus;
    procedure NewOnGetThread(Sender: TObject; ClientSocket: TServerClientWinSocket; var
 SocketThread: TServerClientThread);
    procedure SetFilesName(const Value: TStrings);
    procedure SetBufferSize(const Value: Integer);
  protected
    procedure Loaded; override;
  public
    property ActiveThreadsCount: Integer read FActiveThreadsCount write FActiveThreadsCount;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property FilesName: TStrings read FFilesName write SetFilesName;
    property BufferSize: Integer read FBufferSize write SetBufferSize;
    property OnSocketStatus: TServerSocketStatus read FOnSocketStatus write FOnSocketStatus;
  end;

procedure Register;

implementation

uses
  ServerThread, FunAndProc;

procedure Register;
begin
  RegisterComponents('lxpbuaa', [TlxpServerSocketForFiles]);
end;


{ TlxpServerSocketForFiles }

constructor TlxpServerSocketForFiles.Create(AOwner: TComponent);
begin
  inherited;
  FFilesName := TStringList.Create;
  FActiveThreadsCount := 0;
  FBufferSize := 3;
  ServerType := stThreadBlocking;
  Port := DefaultPort;
end;

destructor TlxpServerSocketForFiles.Destroy;
begin
  FreeAndNil(FFilesName);
  inherited;
end;

procedure TlxpServerSocketForFiles.Loaded;
begin
  inherited;
  OldOnGetThread := OnGetThread;
  OnGetThread := NewOnGetThread;
end;

procedure TlxpServerSocketForFiles.NewOnGetThread(Sender: TObject;
  ClientSocket: TServerClientWinSocket;
  var SocketThread: TServerClientThread);
begin
  if Assigned(OldOnGetThread) then
    OldOnGetThread(Sender, ClientSocket, SocketThread);
  if SocketThread = nil then
  begin
    SocketThread := TServerThread.Create(True, ClientSocket, Self, FFilesName, FBufferSize);
    SocketThread.FreeOnTerminate := True;
    SocketThread.Resume;   
  end;
end;

procedure TlxpServerSocketForFiles.SetBufferSize(const Value: Integer);
begin
  if FBufferSize <> Value then
  begin
    if not (Value in [1..4]) then
      MessageBox(0, 'BufferSize必须在1…4之间。', '提示', MB_ICONINFORMATION+MB_OK)
    else FBufferSize := Value;
  end;
end;

procedure TlxpServerSocketForFiles.SetFilesName(const Value: TStrings);
var
  I: Integer;
begin
  if Value.Count = 0 then FFilesName.Clear
  else
  begin
    for I := 0 to Value.Count-1 do
    if not FileExists(Value[I]) then
      MessageBox(0, PChar('文件：' + Value[I] + '不存在。'), '提示', MB_ICONINFORMATION+MB_OK)
    else
      FilesName.Assign(Value);
  end;
end;

end.
