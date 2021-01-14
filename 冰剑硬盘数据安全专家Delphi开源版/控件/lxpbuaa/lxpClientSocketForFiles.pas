unit lxpClientSocketForFiles;

interface

uses
  Windows, Messages, SysUtils, Classes, ScktComp;

type
  TClientSocketStatus =
    procedure (
      Sender: TObject;
      Status: Word;
      CurrentFilesLength: Integer;
      FileIndex: Integer
      ) of object;
  TlxpClientSocketForFiles = class(TClientsocket)
  private
    FSavePath: String;
    FFilesName: TStrings;
    FFilesLength: Integer;
    FOnSocketStatus: TClientSocketStatus;
    procedure SetSavePath(const Value: String);
  protected
    procedure DoActivate(Value: Boolean); override;
  public
    property FilesName: TStrings read FFilesName write FFilesName;
    property FilesLength: Integer read FFilesLength write FFilesLength;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property SavePath: String read FSavePath write SetSavePath;
    property OnSocketStatus: TClientSocketStatus read FOnSocketStatus write FOnSocketStatus;
  end;

procedure Register;

implementation

uses ClientThread, FunAndProc;

procedure Register;
begin
  RegisterComponents('lxpbuaa', [TlxpClientSocketForFiles]);
end;

{ TlxpClientSocketForFiles }

constructor TlxpClientSocketForFiles.Create(AOwner: TComponent);
begin
  inherited;
  FFilesName := TStringList.Create;
  ClientType := ctBlocking;
  Port := DefaultPort;
end;

destructor TlxpClientSocketForFiles.Destroy;
begin
  FreeAndNil(FFilesName);
  inherited;
end;

procedure TlxpClientSocketForFiles.DoActivate(Value: Boolean);
var
  ClientThread: TClientThread;
begin
  inherited;
  if Value then
  begin
    ClientThread := TClientThread.Create(True, Self, FSavePath);
    ClientThread.FreeOnTerminate := True;
    ClientThread.Resume;
  end;
end;

procedure TlxpClientSocketForFiles.SetSavePath(const Value: String);
begin
  if (Value = '') or DirectoryExists(Value) then
    FSavePath := Value
  else
    MessageBox(0, PChar('路径：' + Value + '不存在。'), '提示', MB_ICONINFORMATION+MB_OK)
end;

end.
