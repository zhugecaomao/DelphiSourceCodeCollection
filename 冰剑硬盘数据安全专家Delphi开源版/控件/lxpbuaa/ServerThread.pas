unit ServerThread;

interface

uses
  Classes, ScktComp, ComCtrls, lxpServerSocketForFiles;

type
  TServerThread = class(TServerClientThread)
  private
    WriteSizes{B}, Fileth: Integer;
    FilesName: TStrings;
    FilesStrm: Array of TFileStream;
    FilesLength: Array of Integer;
    AllFilesLength, FileCurrLength: Integer;
    FServerSocket: TlxpServerSocketForFiles;
    Status: Word;
    //1:线程启动
    //2:线程正常结束
    //3:线程错误
    procedure SetStatus(AStatus: Word);
    procedure ReturnStatus;
  protected
    procedure ClientExecute; override;
  public
    constructor Create(CreateSuspended: Boolean; ASocket: TServerClientWinSocket;
      AServerSocket: TlxpServerSocketForFiles; AFilesName: TStrings; AWriteSize: Integer);overload;
    destructor Destroy; override;
  end;


implementation

uses SysUtils, FunAndProc;

{ TServerThread }

procedure TServerThread.ClientExecute;
var
  pStream: TWinSocketStream;
  Buffer: Pointer;
  ReadText, SendText: String;
  I: Integer;
const
  ReadLen = 1024;
begin
  pStream := TWinSocketStream.Create(ClientSocket, 60000);
  try
    while (not Terminated) and ClientSocket.Connected do
    begin
      try
        Buffer := AllocMem(ReadLen);
        if pStream.WaitForData(6000) then
        begin
          pStream.Read(Buffer^, ReadLen);
          ReadText := PChar(Buffer);
          FreeMem(Buffer);
          //客户请求文件名
          if ReadText = KEY_Clt[1] then
          begin
            SetStatus(1);
            SendText := KEY_Srv[1] + StringsToString(FilesNameSepStr, FilesName, True);
            pStream.Write(SendText[1], Length(SendText)+1);
          end
          //客户请求文件长度
          else if ReadText = KEY_Clt[2]  then
          begin
            SendText := '';
            for I := Low(FilesStrm) to High(FilesStrm) do
              SendText := SendText + FilesLengthSepStr + IntToStr(FilesStrm[I].Size);
            Delete(SendText, 1, 1);
            SendText := KEY_Srv[2] + SendText;
            pStream.Write(SendText[1], Length(SendText)+1);
          end
          else if ReadText = KEY_Clt[3] then  //请求开始发送文件
          begin
            if FileCurrLength >= FilesLength[Fileth] then
            begin
              Inc(Fileth);
              FileCurrLength := 0;
            end;
            Buffer := AllocMem(WriteSizes);
            Inc(FileCurrLength, pStream.Write(Buffer^, FilesStrm[Fileth].Read(Buffer^, WriteSizes)));
            FreeMem(Buffer);
          end else if ReadText = KEY_Clt[4] then
          begin
            SetStatus(2);
            Terminate;
          end;
        end;
      except
        SetStatus(3);
        Terminate;
      end;
    end;
  finally
    ClientSocket.Close;
    pStream.Free;
  end;
end;       


constructor TServerThread.Create(CreateSuspended: Boolean;
  ASocket: TServerClientWinSocket; AServerSocket: TlxpServerSocketForFiles;
  AFilesName: TStrings; AWriteSize: Integer);
var
  I: Integer;
begin
  inherited Create(CreateSuspended, ASocket);
  FServerSocket := AServerSocket;
  FilesName := TStringList.Create;
  FilesName.Assign(AFilesName);
  WriteSizes := AWriteSize*1024;
  Fileth := 0;
  FileCurrLength := 0;   
  SetLength(FilesStrm, FilesName.Count);
  SetLength(FilesLength, FilesName.Count);
  AllFilesLength := 0;
  for I := 0 to FilesName.Count-1 do
  begin
    FilesStrm[I] := TFileStream.Create(FilesName[I], fmOpenRead or fmShareDenyNone);
    FilesLength[I] := FilesStrm[I].Size;
    Inc(AllFilesLength, FilesLength[I]);
  end;
end;


destructor TServerThread.Destroy;
var
  I: Integer;
begin
  for I := Low(FilesStrm) to High(FilesStrm) do
    FreeAndNil(FilesStrm[I]);
  FreeAndNil(FilesName);
  inherited;
end;

procedure TServerThread.SetStatus(AStatus: Word);
begin
  Status := AStatus;
  Synchronize(ReturnStatus);
end;

procedure TServerThread.ReturnStatus;
begin
  with FServerSocket do
  case Status of
    1:
      ActiveThreadsCount := ActiveThreadsCount + 1;
  else
    ActiveThreadsCount := ActiveThreadsCount - 1;
  end;
  if Assigned(FServerSocket.OnSocketStatus) then
    FServerSocket.OnSocketStatus(FServerSocket, ClientSocket, Status, Now);
end;



end.
