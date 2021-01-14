unit UnitNewMMS;

interface

uses
  Classes, IdTCPClient, Windows, SysUtils, StdCtrls, Unit2;

type
  TDownloadStates = (S_New, S_Ready, S_Run, S_Complete, S_Error);

  TFileHeadInfo = Record
    FileHeadSize:   Cardinal;
    FileSize:       Cardinal;
    MaxPacketLen:   Cardinal;
    MinPacketLen:   Cardinal;
    TotalPacketNum: Int64;
  end;

  TMMSThread = class(TThread)
  private
    gCmdSequenceNO: Cardinal;
    gDefaultPacketHeadLen: Cardinal;
    gDefaultCmdLen: Cardinal;
    gDefultCommand: string;
    SourceFileName: string;
    hFile: Cardinal;
    
    gPacketLen: Cardinal;
    gFileHeadSize: Cardinal;

    gRetryNum: Integer;
    gMaxRetryNum: Integer;
     bHasGetFileHead : Boolean;

    IdTCPClient1: TIdTCPClient;
    function  ReadCmdNO(): Byte;
    function  WriteCmdNO(CmdNO: Byte): Boolean;
    function  GetPacketInfo(sBuffer: string; var PacketInfo: TFileHeadInfo): Boolean;
    procedure ReadASFHead(var sBuffer: string);
    function  ReadASFPacket(var sBuffer: string; cBufLen: Cardinal): Byte;

    procedure DownLoad;

  protected
    procedure Execute; override;
  public
    States          : TDownloadStates;
    bTerminate      : Boolean;

    gStartPacket    : Cardinal;
    gEndPacket      : Cardinal;
    
    FileHeadInfo    : TFileHeadInfo;
    Progress        : Cardinal;
    procedure SetDownloadSection(iStartPacket, iEndPacket: Cardinal;
                                 iPacketLen: Integer;
                                 iFileHeadSize: Integer);
    constructor Create(sHost: string;
                       iPort: Integer;
                       SourceFile: string;
                       hDestFile: Cardinal;
                       iMaxRetryNum: Integer=5;
                       bIsIniThread: Boolean=False);
    destructor  Destroy; override;
  end;
  PMMSThread = ^TMMSThread;

implementation

{ TMMSThread }

constructor TMMSThread.Create(sHost: string;
                              iPort: Integer;
                              SourceFile: string;
                              hDestFile: Cardinal;
                              iMaxRetryNum: Integer;
                              bIsIniThread: Boolean);
begin
  inherited Create(False);

  IdTCPClient1 := TIdTCPClient.Create(NIL);
  IdTCPClient1.Host := sHost;
  IdTCPClient1.Port := iPort;

  SourceFileName := SourceFile;
  hFile          := hDestFile;
  States         := S_New;

  if bIsIniThread then States := S_Ready;
  bHasGetFileHead := not bIsIniThread;
    
  if iMaxRetryNum<1 then gMaxRetryNum := 1
  else gMaxRetryNum := iMaxRetryNum;
  bTerminate := False;

  gRetryNum      := 0;
  Progress       := 0;
  gStartPacket   := 1;
  gEndPacket     := 0;
  gCmdSequenceNO := 0;
  gDefaultPacketHeadLen := 8;
  gDefaultCmdLen := 48;
  gDefultCommand := #$01+#$00+#$00+#$00+ //最后一位不确定
                    #$CE+#$FA+#$0B+#$B0+
                    #$A0+#$00+#$00+#$00+ //command 的长度
                    #$4D+#$4D+#$53+#$20+
                    #$14+#$00+#$00+#$00+ //command 的8字节长度
                    #$00+#$00+#$00+#$00+ //sequence number
                    #$00+#$00+#$00+#$00+#$00+#$00+#$00+#$00+ //Unknow
                    #$12+#$00+#$00+#$00+ //command 的8字节长度
                    #$01+#$00+           //command
                    #$03+#$00;           //to server
                    
end;

destructor TMMSThread.Destroy;
begin
  if IdTCPClient1.Connected then IdTCPClient1.Disconnect;
  IdTCPClient1.Free;

  ShowDebugInfo('>>>>Disconnected !');
  inherited;
end;

procedure TMMSThread.SetDownloadSection(iStartPacket, iEndPacket: Cardinal;
                                        iPacketLen, iFileHeadSize: Integer);
begin
  gStartPacket  := iStartPacket;
  gEndPacket    := iEndPacket;
  gPacketLen    := iPacketLen;
  gFileHeadSize := iFileHeadSize; 

  gCmdSequenceNO := 0;
  gRetryNum      := 0;
  States         := S_Ready;
end;

procedure TMMSThread.Execute;
begin
  FreeOnTerminate := True;

  while not bTerminate do
  begin
    if (States=S_Ready) then
    begin
      if (gRetryNum<gMaxRetryNum) then
      begin
        Inc(gRetryNum);
        DownLoad;
      end else begin
        States := S_Error;
      end;
    end;
    Sleep(5000);
  end;

end;

function TMMSThread.GetPacketInfo(sBuffer: string; var PacketInfo: TFileHeadInfo): Boolean;
var
  iPos: Integer;
  sFileObjectGUID: string;
begin
  sFileObjectGUID := #$A1+#$DC+#$AB+#$8C+ #$47+#$A9+#$CF+#$11+
                     #$8E+#$E4+#$00+#$C0+ #$0C+#$20+#$53+#$65;
  Result := False;
  iPos := Pos(sFileObjectGUID, sBuffer);
  if (iPos>0) then
  begin
    Result := True;
    PacketInfo.FileHeadSize := Length(sBuffer);
//    CopyMemory(@(PacketInfo.FileSize), Pchar(@sBuffer[iPos+40]), 8);
    CopyMemory(@(PacketInfo.TotalPacketNum), Pchar(@sBuffer[iPos+56]), 8);
    CopyMemory(@(PacketInfo.MinPacketLen), Pchar(@sBuffer[iPos+92]), 4);
    CopyMemory(@(PacketInfo.MaxPacketLen), Pchar(@sBuffer[iPos+96]), 4);
    with PacketInfo do
    begin
      FileSize := FileHeadSize + TotalPacketNum*MinPacketLen;
    end;
  end;
end;

procedure TMMSThread.ReadASFHead(var sBuffer: string);
var
  sPacketHead: string;
  sTempBuffer: string;
  wPacketLen: Word;

  function IsEndOfHeader(sBuffer: string; Len: Word): Boolean;
  begin
    Result := False;
    if ( (sBuffer[Len]=#$01) and (sBuffer[Len-1]=#$01) ) then
    begin
      Result := True;
    end;
  end;
begin
  sBuffer := '';
  SetLength(sPacketHead, gDefaultPacketHeadLen);
  repeat
    ZeroMemory(Pchar(@sPacketHead[1]), gDefaultPacketHeadLen);
    IdTCPClient1.ReadBuffer(sPacketHead[1], gDefaultPacketHeadLen);
    CopyMemory(@wPacketLen, Pchar(@sPacketHead[7]), 2);

    wPacketLen := wPacketLen - gDefaultPacketHeadLen;
    SetLength(sTempBuffer, wPacketLen);
    ZeroMemory(Pchar(@sTempBuffer[1]), wPacketLen);
    IdTCPClient1.ReadBuffer(sTempBuffer[1], wPacketLen);
    sBuffer := sBuffer + sTempBuffer;
  until
    IsEndOfHeader(sTempBuffer, wPacketLen);
end;

function TMMSThread.ReadASFPacket(var sBuffer: string; cBufLen: Cardinal): Byte;
var
  sPacketHead: string;
  wPacketLen:  Word;
  cCMDLen: Cardinal;

  function IsMMSCmd(sPacketHeader: string): Boolean;
  begin
    Result := False;
    if ( (sPacketHeader[1] = #$01) and (sPacketHeader[2] = #$00) and (sPacketHeader[3] = #$00) and
         (sPacketHeader[5] = #$CE) and (sPacketHeader[6] = #$FA) and
         (sPacketHeader[7] = #$0B) and (sPacketHeader[8] = #$B0) ) then
    begin
      Result := True;
    end;
  end;
begin
  Result := $00;
  SetLength(sPacketHead, gDefaultPacketHeadLen);
  ZeroMemory(Pchar(@sPacketHead[1]), gDefaultPacketHeadLen);
  IdTCPClient1.ReadBuffer(sPacketHead[1], gDefaultPacketHeadLen);

  if not IsMMSCmd(sPacketHead) then
  begin
    CopyMemory(@wPacketLen, Pchar(@sPacketHead[7]), 2);
    wPacketLen := wPacketLen - gDefaultPacketHeadLen;
    SetLength(sBuffer, cBufLen);
    ZeroMemory(Pchar(@sBuffer[1]), cBufLen);
    IdTCPClient1.ReadBuffer(sBuffer[1], wPacketLen);
  end else begin
    ZeroMemory(Pchar(@sPacketHead[1]), gDefaultPacketHeadLen);
    IdTCPClient1.ReadBuffer(sPacketHead[1], gDefaultPacketHeadLen);
    CopyMemory(@cCMDLen, Pchar(@sPacketHead[1]), 4);
    SetLength(sBuffer, cCMDLen);
    ZeroMemory(Pchar(@sBuffer[1]), cCMDLen);
    IdTCPClient1.ReadBuffer(sBuffer[1], cCMDLen);
    Result := Byte(sBuffer[21]);
  end;
end;

function TMMSThread.ReadCmdNO: Byte;
var
  sBuffer, sBufInfo: string;
  cCmdlen: Cardinal;
begin
  try
    SetLength(sBuffer, gDefaultCmdLen);
    ZeroMemory(Pchar(@sBuffer[1]), gDefaultCmdLen);
    IdTCPClient1.ReadBuffer(sBuffer[1], gDefaultCmdLen);
    Result := Byte(sBuffer[37]);

    CopyMemory(@cCmdlen, Pchar(@sBuffer[9]), 4);
    cCmdlen := cCmdlen + 16 - gDefaultCmdLen;
    if cCmdlen>0 then
    begin
      SetLength(sBufInfo, cCmdlen);
      ZeroMemory(Pchar(@sBufInfo[1]), cCmdlen);
      IdTCPClient1.ReadBuffer(sBufInfo[1], cCmdlen);
    end;

    ShowDebugInfo('Recv ---> '+IntToHex(Result, 2));
  except on E: exception do
    ShowDebugInfo('Exception: '+E.Message);
  end;

  if not IdTCPClient1.Connected then
  begin
    States := S_Error;
    Result := $00;
  end;
end;

function TMMSThread.WriteCmdNO(CmdNO: Byte): Boolean;
var
  Command, TempCommand: string;
  i: Integer;
  CmdLen: Cardinal;
  sGUID: TGUID;

  function AddZeroToCommand(Cmd: string): string;
  var
    i: Integer;
  begin
    Result := '';
    for i:=1 to Length(Cmd) do
    begin
      Result := Result + Cmd[i] + #$00;
    end;
  end;
begin
  Result := True;
  case CmdNO of
    $01: begin
       CreateGUID(sGUID);
       TempCommand := #$1C+#$03+'NSPlayer/9.0.0.2980; '+GUIDToString(sGUID)+#$00+#$00+#$00;
       Command := AddZeroToCommand(TempCommand);
       Command := #$F0+#$F0+#$F0+#$F0+#$0B+#$00+#$04+#$00 + Command;
    end;

    $18: begin
       Command := #$F0+#$F0+#$F0+#$00+#$0B+#$00+#$04+#$00;
    end;

    $02: begin
       TempCommand := #$02+#$00+'\\'+IdTCPClient1.Socket.Binding.IP+'\TCP\'+
                      IntToStr(IdTCPClient1.Socket.Binding.Port)+#$00+'0';
       Command := AddZeroToCommand(TempCommand);

       for i:=1 to 8-(Length(Command) mod 8) do
       begin
         Command := #$00+Command;
       end;
       
       Command := #$F1+#$F0+#$F0+#$F0+#$FF+#$FF+#$FF+#$FF + Command;
    end;

    $05: begin
       TempCommand := Trim(SourceFileName)+#$00;
       Command := AddZeroToCommand(TempCommand);
       for i:=1 to 8-(Length(Command) mod 8) do
       begin
         Command := Command + #$00;
       end;

       Command := #$01+#$00+#$00+#$00+#$FF+#$FF+#$FF+#$FF+
                  #$00+#$00+#$00+#$00+#$00+#$00+#$00+#$00+Command;
    end;

    $15: begin
       Command := #$01+#$00+#$00+#$00+#$00+#$00+#$00+#$00+
                  #$00+#$00+#$00+#$00+
                  #$00+#$80+#$00+#$00+
                  #$FF+#$FF+#$FF+#$FF+
                  #$64+#$00+#$79+#$00+
                  #$00+#$00+#$00+#$00+ #$00+#$00+#$00+#$00+ #$00+#$00+#$00+#$00+
                  #$00+#$20+#$AC+#$40+
                  #$02+#$00+#$00+#$00+ #$00+#$00+#$00+#$00;
    end;

    $07: begin
       Command := #$01+#$00+#$00+#$00+#$F0+#$F0+#$01+#$00+
                  #$00+#$00+#$00+#$00+#$00+#$00+#$00+#$00+
                  #$FF+#$FF+#$FF+#$FF+#$00+#$00+#$00+#$00+
                  #$00+#$00+#$00+#$04+#$00+#$00+#$00+#$00;

       if (gStartPacket>0) then
       begin
         CopyMemory(PChar(@Command[21]), @gStartPacket, 4);
       end;  
    end;

    $1B: Begin
       Command := #$01+#$00+#$00+#$00+#$F0+#$F0+#$01+#$00;
    end;
    
  end;

  Command := gDefultCommand + Command;
  Command[37] := Char(CmdNO);
  
  CmdLen := Length(Command) - 16;
  CopyMemory(Pchar(@Command[9]),  @CmdLen, 4);
  CmdLen := CmdLen div 8;
  CopyMemory(PChar(@Command[17]), @CmdLen, 4);
  CmdLen := CmdLen - 2;
  CopyMemory(PChar(@Command[33]), @CmdLen, 4);
  
  CopyMemory(PChar(@Command[21]), @gCmdSequenceNO, 4);

  try
    IdTCPClient1.WriteBuffer(Command[1], Length(Command));
    Inc(gCmdSequenceNO);
    ShowDebugInfo('Send ---> '+IntToHex(CmdNO, 2));
  except on E: Exception do
    ShowDebugInfo('Exception: '+E.Message);
  end;

  if not IdTCPClient1.Connected then
  begin
    States := S_Error;
    Result := False;
  end;  
end;

procedure TMMSThread.DownLoad;
var
  CmdNO: Cardinal;
  cWritted: Cardinal;
  sBuffer, sFileBuffer: string;
  PacketFlag: Byte;
  iDistanceToMove: Cardinal;
begin
  if IdTCPClient1.Connected then IdTCPClient1.Disconnect;
  
  IdTCPClient1.Connect();
  if IdTCPClient1.Connected then
  begin
    ShowDebugInfo('>>>>Connectd OK!');
  end else begin
    ShowDebugInfo('>>>>Connectd Fail!');
    Exit;
  end;

  if not WriteCmdNO($01) then Exit;
  CmdNO := ReadCmdNO();
  if (CmdNO<>$01) then
  begin
    ShowDebugInfo('Error: Command = '+IntToHex(CmdNO, 2));
    Exit;
  end;

  if not WriteCmdNO($18) then Exit;
  CmdNO := ReadCmdNO();
  if (CmdNO<>$15) then
  begin
    ShowDebugInfo('Error: Command = '+IntToHex(CmdNO, 2));
    Exit;
  end;

  if not WriteCmdNO($02) then Exit;
  CmdNO := ReadCmdNO();
  if (CmdNO<>$02) then
  begin
    ShowDebugInfo('Error: Command = '+IntToHex(CmdNO, 2));
    Exit;
  end;

  if not WriteCmdNO($05) then Exit;
  CmdNO := ReadCmdNO();
  if (CmdNO<>$06) then
  begin
    ShowDebugInfo('Error: Command = '+IntToHex(CmdNO, 2));
    Exit;
  end;

  if not WriteCmdNO($15) then Exit;
  CmdNO := ReadCmdNO();
  if (CmdNO<>$11) then
  begin
    ShowDebugInfo('Error: Command = '+IntToHex(CmdNO, 2));
    Exit;
  end;

  ShowDebugInfo('Receive file header.');
  ReadASFHead(sBuffer);
  if (not bHasGetFileHead) then
  begin
    if GetPacketInfo(sBuffer, FileHeadInfo) then
    begin
      bHasGetFileHead := True;
      bTerminate      := True; 
      ShowDebugInfo('Packet number: '+  IntToStr(FileHeadInfo.TotalPacketNum));
      ShowDebugInfo('Packet maxlen: '+  IntToStr(FileHeadInfo.MaxPacketLen));
      ShowDebugInfo('Packet minlen: '+  IntToStr(FileHeadInfo.MinPacketLen));
    end else begin
      ShowDebugInfo('Error: ASF head.');
    end;
    States := S_Complete;
    Exit;
  end;

  if (gStartPacket = 0) then
  begin
    if (hFile > 0) then
    begin
      SetFilePointer(hFile, 0, NIL, FILE_BEGIN);
      WriteFile(hFile, sBuffer[1], Length(sBuffer), cWritted, NIL);
    end else begin
      ShowDebugInfo('Error: Invalid file handle.');
      Exit;
    end;
  end;

  if not WriteCmdNO($07) then Exit;
  CmdNO := ReadCmdNO();
  if (CmdNO = $21) then
  begin
    CmdNO := ReadCmdNO();
  end;
  if (CmdNO<>$05) then
  begin
    ShowDebugInfo('Error: Command = '+IntToHex(CmdNO, 2));
    Exit;
  end;

  States := S_Run; //标志开始下载文件

  ShowDebugInfo('Receive data');
  sFileBuffer := '';
  iDistanceToMove := gStartPacket;
  while (gStartPacket<=gEndPacket) do
  begin
    if bTerminate then Break;
    PacketFlag := ReadASFPacket(sBuffer, gPacketLen);
    case PacketFlag of
      $00: begin
         Inc(Progress);      
         Inc(gStartPacket);

         sFileBuffer := sFileBuffer + sBuffer;
         if (Length(sFileBuffer)>512000) then
         begin
           if (hFile > 0) then
           begin
             SetFilePointer(hFile, gFileHeadSize+(iDistanceToMove*gPacketLen), NIL, FILE_BEGIN);
             WriteFile(hFile, sFileBuffer[1], Length(sFileBuffer), cWritted, NIL);
             iDistanceToMove := gStartPacket;
             sFileBuffer := '';
           end else begin
             ShowDebugInfo('Error: Invalid file handle.');
             States := S_Error;
             Exit;
           end;
         end;
      end;

      $1B: begin
         ShowDebugInfo('Recv ---> 1B');
         if not WriteCmdNO($1B) then Break;
      end;

      $1E: begin
         Break;
      end;
    end;
  end;

  if (Length(sFileBuffer)>0) then
  begin
    SetFilePointer(hFile, gFileHeadSize+iDistanceToMove*gPacketLen, NIL, FILE_BEGIN);
    WriteFile(hFile, sFileBuffer[1], Length(sFileBuffer), cWritted, NIL);
    sFileBuffer := '';
  end;

  States := S_Complete; //标志下载任务完成

  if IdTCPClient1.Connected then IdTCPClient1.Disconnect; 
  ShowDebugInfo('Download Completely!');
end;

end.

