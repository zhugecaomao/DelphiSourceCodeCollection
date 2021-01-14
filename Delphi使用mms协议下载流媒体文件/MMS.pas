unit MMS;

interface

uses
  Classes, IdTCPClient, Windows, SysUtils, StdCtrls;

type
  TPacketInfo = Record
    MaxPacketLen: Cardinal;
    MinPacketLen: Cardinal;
    TotalPacketNum: Int64;
  end;

  TMMSThread = class(TThread)
  private
    gCmdSequenceNO: Cardinal;
    gDefaultPacketHeadLen: Cardinal;
    gDefaultCmdLen: Cardinal;
    gDefultCommand: string;
    SourceFileName: string;
    sFileBuffer: string;
    hFile: Cardinal;
    gStartPacket: Cardinal;

    DebugMemo: TMemo;
    IdTCPClient1: TIdTCPClient;
    function  ReadCmdNO(): Byte;
    procedure WriteCmdNO(CmdNO: Byte);
    function  GetPacketInfo(sBuffer: string; var PacketInfo: TPacketInfo): Boolean;
    procedure ReadASFHead(var sBuffer: string);
    function  ReadASFPacket(var sBuffer: string; cBufLen: Cardinal): Byte;
    procedure ShowDebugInfo(Info: string);
    procedure DownLoad(hLogFile: Cardinal);
  protected
    procedure Execute; override;
  public
    bTerminate: Boolean;  
    constructor Create(Memo: Tmemo; sHost: string; iPort: Integer; SourceFile: string; DestFile: string; iStartPacket: Cardinal=0);
    destructor  Destroy; override;
  end;
  PMMSThread = ^TMMSThread;

implementation

{ TMMSThread }

constructor TMMSThread.Create(Memo: Tmemo; sHost: string; iPort: Integer; SourceFile: string; DestFile: string; iStartPacket: Cardinal);
var
  iFileSize: Cardinal;
begin
  inherited Create(True);

  IdTCPClient1 := TIdTCPClient.Create(NIL);
  IdTCPClient1.Host := sHost;
  IdTCPClient1.Port := iPort;

  DebugMemo := Memo;
  SourceFileName := SourceFile;
  bTerminate := False; 
  sFileBuffer := '';
  gCmdSequenceNO := 0;
  gDefaultPacketHeadLen := 8;
  gDefaultCmdLen := 48;
  gStartPacket := iStartPacket;
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

  hFile := CreateFile(PAnsiChar(@DestFile[1]),
                      GENERIC_WRITE,
                      FILE_SHARE_WRITE,
                      NIL,
                      OPEN_ALWAYS,
                      FILE_ATTRIBUTE_NORMAL, 0 );

  if (hFile>0) then
  begin
    iFileSize := GetFileSize(hFile, NIL);
    SetFilePointer(hFile, iFileSize, NIL, FILE_BEGIN);
  end else begin
    ShowDebugInfo('Invalid file handle');
  end;

end;

destructor TMMSThread.Destroy;
begin
  if (hFile>0) then
  begin
    CloseHandle(hFile);
  end;

  if IdTCPClient1.Connected then
  begin
    IdTCPClient1.Disconnect;
    ShowDebugInfo('>>>>Disconnected !');
  end;
  IdTCPClient1.Free;

  inherited;
end;

procedure TMMSThread.Execute;
begin
  FreeOnTerminate := True;

  try
    if (hFile > 0) then
    begin
      try
        DownLoad(hFile);
      except on E: Exception do
        ShowDebugInfo(E.Message);
      end;  
    end else begin
      ShowDebugInfo('Invalid file handle');
    end;
  finally
    ShowDebugInfo('Terminated !');
  end;
end;

function TMMSThread.GetPacketInfo(sBuffer: string; var PacketInfo: TPacketInfo): Boolean;
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
    CopyMemory(@(PacketInfo.TotalPacketNum), Pchar(@sBuffer[iPos+56]), 8);
    CopyMemory(@(PacketInfo.MinPacketLen), Pchar(@sBuffer[iPos+92]), 4);
    CopyMemory(@(PacketInfo.MaxPacketLen), Pchar(@sBuffer[iPos+96]), 4);
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
{
  ShowDebugInfo(IntToHex(Byte(sPacketHead[1]), 2)+' '+
                IntToHex(Byte(sPacketHead[2]), 2)+' '+
                IntToHex(Byte(sPacketHead[3]), 2)+' '+
                IntToHex(Byte(sPacketHead[4]), 2)+' '+
                IntToHex(Byte(sPacketHead[5]), 2)+' '+
                IntToHex(Byte(sPacketHead[6]), 2)+' '+
                IntToHex(Byte(sPacketHead[7]), 2)+' '+
                IntToHex(Byte(sPacketHead[8]), 2)+' ');
}

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

  ShowDebugInfo('Recv---> '+IntToHex(Result, 2));
end;

procedure TMMSThread.WriteCmdNO(CmdNO: Byte);
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
    ShowDebugInfo('Send---> '+IntToHex(CmdNO, 2));
  finally
    //
  end;
end;

procedure TMMSThread.DownLoad(hLogFile: Cardinal);
var
  CmdNO: Cardinal;
  cWritted: Cardinal;
  sBuffer: string;
  PacketInfo: TPacketInfo;
  PacketFlag: Byte;
begin
  IdTCPClient1.Connect();
  if IdTCPClient1.Connected then
  begin
    ShowDebugInfo('>>>>Connectd OK!');
  end else begin
    ShowDebugInfo('>>>>Connectd Fail!');
    Exit;
  end;

  WriteCmdNO($01);
  CmdNO := ReadCmdNO();
  if (CmdNO<>$01) then
  begin
    ShowDebugInfo('Error: Command = '+IntToHex(CmdNO, 2));
    Exit;
  end;

  WriteCmdNO($18);
  CmdNO := ReadCmdNO();
  if (CmdNO<>$15) then
  begin
    ShowDebugInfo('Error: Command = '+IntToHex(CmdNO, 2));
    Exit;
  end;

  WriteCmdNO($02);
  CmdNO := ReadCmdNO();
  if (CmdNO<>$02) then
  begin
    ShowDebugInfo('Error: Command = '+IntToHex(CmdNO, 2));
    Exit;
  end;

  WriteCmdNO($05);
  CmdNO := ReadCmdNO();
  if (CmdNO<>$06) then
  begin
    ShowDebugInfo('Error: Command = '+IntToHex(CmdNO, 2));
    Exit;
  end;

  WriteCmdNO($15);
  CmdNO := ReadCmdNO();
  if (CmdNO<>$11) then
  begin
    ShowDebugInfo('Error: Command = '+IntToHex(CmdNO, 2));
    Exit;
  end;

  ShowDebugInfo('Receive file header.');
  ReadASFHead(sBuffer);
  if (gStartPacket = 0) then
  begin
    if (hLogFile > 0) then
    begin
      WriteFile(hLogFile, sBuffer[1], Length(sBuffer), cWritted, NIL);
    end else begin
      ShowDebugInfo('Error: Invalid file handle.');
      Exit;
    end;
  end;

  if not GetPacketInfo(sBuffer, PacketInfo) then
  begin
    ShowDebugInfo('Error: ASF head.');
    Exit;
  end;
  ShowDebugInfo('Packet number: '+  IntToStr(PacketInfo.TotalPacketNum));
  ShowDebugInfo('Packet maxlen: '+  IntToStr(PacketInfo.MaxPacketLen));
  ShowDebugInfo('Packet minlen: '+  IntToStr(PacketInfo.MinPacketLen));

  WriteCmdNO($07);
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

  ShowDebugInfo('Receive data');
  sFileBuffer := '';
  PacketFlag  := $00;
  while (PacketFlag<>$1E) do
  begin
    if bTerminate then Break;
    PacketFlag := ReadASFPacket(sBuffer, PacketInfo.MinPacketLen);

    case PacketFlag of
      $00: begin
         sFileBuffer := sFileBuffer + sBuffer;
         if (Length(sFileBuffer)>512000) then
         begin
           if (hLogFile > 0) then
           begin
             WriteFile(hLogFile, sFileBuffer[1], Length(sFileBuffer), cWritted, NIL);
             sFileBuffer := '';
           end else begin
             ShowDebugInfo('Error: Invalid file handle.');
             Exit;
           end;
         end;
      end;

      $1B: begin
         ShowDebugInfo('Recv---> 1B');
         WriteCmdNO($1B);
      end;
    end;
  end;

  if (Length(sFileBuffer)>0) then
  begin
    WriteFile(hLogFile, sFileBuffer[1], Length(sFileBuffer), cWritted, NIL);
    sFileBuffer := '';
  end;

  ShowDebugInfo('Download Completely!');
end;


procedure TMMSThread.ShowDebugInfo(Info: string);
begin
  DebugMemo.Lines.Add('['+DateTimeToStr(Now)+']     '+Info);
end;

end.
 