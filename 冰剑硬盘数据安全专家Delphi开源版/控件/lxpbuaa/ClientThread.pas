unit ClientThread;

interface

uses
  Classes, ScktComp, lxpClientSocketForFiles;

type
  TClientThread = class(TThread)
  private
    CltSocket: TlxpClientSocketForFiles;
    FilesName: TStrings;
    FilesStrm: Array of TFileStream;
    FilesLength: Array of Integer;
    CurrReadSize{/B}: Integer;
    Fileth, AllFilesLength, FileCurrLength, AllFileCurrLength: Integer;
    ParentDir: String;
    Status: Word;
    //1：开始读
    //2：正在读
    //3：完毕
    procedure SetStatus(AStatus: Word);
    procedure ReturnStatus;
    procedure Init(LengthText: String);
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean; ClientSocket: TlxpClientSocketForFiles; AParentDir: String);overload;
    destructor Destroy; override;
  end;

implementation

uses SysUtils, FunAndProc;


constructor TClientThread.Create(CreateSuspended: Boolean; ClientSocket: TlxpClientSocketForFiles; AParentDir: String);
begin
  ParentDir := AParentDir;
  inherited Create(CreateSuspended);
  CltSocket := ClientSocket;
end;

destructor TClientThread.Destroy;
var
  I: Integer;
begin
  CltSocket.Close;
  for I := Low(FilesStrm) to High(FilesStrm) do
    FreeAndNil(FilesStrm[I]);
  FreeAndNil(FilesName);
  inherited;
end;

procedure TClientThread.Execute;
var
  pStream: TWinSocketStream;
  ReadBuffer: Pointer;
  ReadText, TaskName, SendText: String;
  Start, FileReading: Boolean;
const
  ReadLen = 4*1024;
begin
  Start := False;
  FileReading := False;
  pStream := TWinSocketStream.Create(CltSocket.Socket, 60000);
  try
    while (not Terminated) and CltSocket.Active do
    begin

      if not Start then
      begin
        SendText := KEY_Clt[1];
        pStream.Write(SendText[1], Length(SendText));
        Start := True;
      end;

      ReadBuffer := AllocMem(ReadLen);
      if pStream.WaitForData(6000) then
      begin
        CurrReadSize := pStream.Read(ReadBuffer^, ReadLen);
        if FileReading then
        begin
          Inc(FileCurrLength, FilesStrm[Fileth].Write(ReadBuffer^, CurrReadSize));
          Inc(AllFileCurrLength, CurrReadSize);
          SetStatus(2);
          if FileCurrLength >= FilesLength[Fileth] then
          begin
            Inc(Fileth);
            FileCurrLength := 0;
          end;
          if Fileth = FilesName.Count then
          begin
            SendText := KEY_Clt[4];
            pStream.Write(SendText[1], Length(SendText));
            SetStatus(3);
            Terminate;
          end else
          begin
            SendText := KEY_Clt[3];
            pStream.Write(SendText[1], Length(SendText));
          end;
        end else
        begin
          ReadText := PChar(ReadBuffer);
          TaskName := Copy(ReadText, 1, Length(KEY_Srv[1]));
          if TaskName = KEY_Srv[1] then   //文件名
          begin
            Delete(ReadText, 1, Length(KEY_Srv[1]));
            FilesName := TStringList.Create;
            FilesName.Assign(StringToStrings(FilesNameSepStr, ReadText));
            SendText := KEY_Clt[2];
            pStream.Write(SendText[1], Length(SendText));
          end else if TaskName = KEY_Srv[2] then  //文件长度
          begin
            Delete(ReadText, 1, Length(KEY_Srv[1]));
            Init(ReadText);
            SendText := KEY_Clt[3];
            pStream.Write(SendText[1], Length(SendText));
            FileReading := True;
            SetStatus(1);
          end;
        end;
      end;
      FreeMem(ReadBuffer);
    end;
  finally
    pStream.Free;
    CltSocket.Close;
  end;
end;

procedure TClientThread.Init(LengthText: String);
var
  I: Integer;
  Lengths: TStrings;
begin
  SetLength(FilesStrm, FilesName.Count);
  SetLength(FilesLength, FilesName.Count);
  Lengths := StringToStrings(FilesLengthSepStr, LengthText);
  Fileth := 0;
  FileCurrLength := 0;
  AllFilesLength := 0;
  AllFileCurrLength := 0;
  for I := 0 to FilesName.Count-1 do
  begin
    FilesName[I] := ParentDir + '\' + FilesName[I];
    FilesStrm[I] := TFileStream.Create(FilesName[I], fmCreate);
    FilesLength[I] := StrToInt(Lengths[I]);
    Inc(AllFilesLength, FilesLength[I]);
  end;
  FreeAndNil(Lengths);
end;


procedure TClientThread.ReturnStatus;
begin
  if Status = 1 then
    CltSocket.FilesLength := AllFilesLength;
  if Assigned(CltSocket.OnSocketStatus) then
    CltSocket.OnSocketStatus(CltSocket, Status, AllFileCurrLength, Fileth);
end;

procedure TClientThread.SetStatus(AStatus: Word);
begin
  Status := AStatus;
  Synchronize(ReturnStatus);
end;

end.
