Unit AlarmFile;

Interface

Uses
  Windows, SysUtils, tmSDK_DataType;

Type
  TAlarmFile = Class
  Private
    FrameBuf: PUCHAR;
    Size: Integer;
    WritePtr: Integer;
    ReadPtr: Integer;
    Count: Integer;
    FramesCounter: Integer;
    FramesToWriteImmediatly: Integer;
    CanStopWrite: Boolean;
    FramesToStopWrite: Integer;
    FramesBeforeCurPos: Integer;
    Function MakeRoom(Len: Integer): Integer;
    Function StoreData(DataBuf: PUCHAR; Len: Integer): Integer;
    Function GetData(DataBuf: PUCHAR; Len: Integer): Integer;
    Function WriteData(FileHandle: Integer; Len: Integer): Integer;
    Function RemoveData(Len: Integer): Integer;
    Function TypeToFrames(FrameType: TFrameType): Integer;
  Public
    Constructor Create;
    Destructor Destroy; Override;

    Function Setup(FramesBeforeAlarm, FramesAfterAlarm: ULONG): Integer;
    Function FramePush(FileHandle: Integer; FrameData: PUCHAR; Len: ULONG; FrameType: TframeType; Breakable: ULONG): Integer;
    Function Trigger(FileHandle: Integer): Integer;
    Function Reset(): Integer;
  End;

Implementation

Uses Consts;

Const
  FRAME_INFO_HEADER_MAGIC = $20020620;
  FRAME_STACK_SIZE = 400;
  FRAME_BUF_SIZE = 512 * 1024;

Type
  PFRAME_INFO_HEADER = ^TFRAME_INFO_HEADER;
  TFRAME_INFO_HEADER = Record
    Magic: ULONG;
    FrameType: TframeType;
    FrameLen: ULONG;
    Breakable: ULONG;
  End;

Constructor TAlarmFile.Create;
Begin
  Size := FRAME_BUF_SIZE;
  FrameBuf := GetMemory(Size);
  Count := 0;
  WritePtr := 0;
  ReadPtr := 0;
  FramesCounter := 0;
  FramesToWriteImmediatly := 0;
  CanStopWrite := TRUE;
End;

Destructor TAlarmFile.Destroy;
Begin
  If (FrameBuf <> Nil) Then
    FreeMem(FrameBuf);
  Inherited;
End;

Function TAlarmFile.Setup(FramesBeforeAlarm, FramesAfterAlarm: ULONG): Integer;
Begin
  FramesBeforeCurPos := FramesBeforeAlarm;
  FramesToStopWrite := FramesAfterAlarm;
  Result := 0;
End;

Function TAlarmFile.FramePush(FileHandle: Integer; FrameData: PUCHAR; Len: ULONG; FrameType: TframeType; Breakable: ULONG): Integer;
Var
  FrameInfoH: TFRAME_INFO_HEADER;
Begin

  If Succeeded(FramesToWriteImmediatly) Or (Not CanStopWrite) Then
  Begin
    If (Succeeded(Breakable) And (FramesToWriteImmediatly <= 0)) Then
    Begin
      CanStopWrite := TRUE;
      FramesToWriteImmediatly := 0;
      Result := 0;
      Exit;
    End;
    FileWrite(FileHandle, FrameData, Len);
    Dec(FramesToWriteImmediatly, TypeToFrames(FrameType));
    Result := 0;
    Exit;
  End;

  Inc(Len, SizeOf(TFRAME_INFO_HEADER));
  MakeRoom(Len);
  FrameInfoH.FrameLen := Len;
  FrameInfoH.FrameType := FrameType;
  FrameInfoH.Magic := FRAME_INFO_HEADER_MAGIC;
  FrameInfoH.Breakable := Breakable;

  StoreData(@FrameInfoH, SizeOf(TFRAME_INFO_HEADER));
  StoreData(FrameData, Len - SizeOf(TFRAME_INFO_HEADER));
  Inc(FramesCounter, TypeToFrames(FrameType));
  Result := 0;
End;

Function TAlarmFile.Trigger(FileHandle: Integer): Integer;
Var
  StartWrite: Boolean;
  FrameInfoH: TFRAME_INFO_HEADER;
Begin
  If (FramesCounter = 0) Then
  Begin
    Result := 0;
    Exit;
  End;
  StartWrite := FALSE;
  While Succeeded(FramesCounter) Do
  Begin
    GetData(@FrameInfoH, SizeOf(TFRAME_INFO_HEADER));
    Assert(FrameInfoH.Magic = FRAME_INFO_HEADER_MAGIC);

    If (FramesCounter < FramesBeforeCurPos) And Succeeded(FrameInfoH.Breakable) Then
    Begin
      WriteData(FileHandle, FrameInfoH.FrameLen - SizeOf(TFRAME_INFO_HEADER));
      StartWrite := TRUE;
    End
    Else If StartWrite Then
      WriteData(FileHandle, FrameInfoH.FrameLen - SizeOf(TFRAME_INFO_HEADER))
    Else
      RemoveData(FrameInfoH.FrameLen - SizeOf(TFRAME_INFO_HEADER));
    Dec(FramesCounter, TypeToFrames(FrameInfoH.FrameType));
    Assert(FramesCounter >= 0);
  End;

  If StartWrite Then
  Begin
    FramesToWriteImmediatly := FramesToStopWrite;
    CanStopWrite := FALSE;
  End;
  Result := 0;
End;

Function TAlarmFile.Reset(): Integer;
Begin
  If FrameBuf <> Nil Then
    ReAllocMem(FrameBuf, FRAME_BUF_SIZE);
  If (FrameBuf = Nil) Then
    MessageBox(0, '´íÎó£ºÄÚ´æ²»×ã¡£', PChar(SMsgDlgError), MB_ICONHAND);
  Size := FRAME_BUF_SIZE;
  Count := 0;
  WritePtr := 0;
  ReadPtr := 0;
  FramesCounter := 0;
  FramesToWriteImmediatly := 0;
  CanStopWrite := TRUE;
  Result := 0;
End;

Function TAlarmFile.MakeRoom(Len: Integer): Integer;
Var
  CurFrameInfo: TFRAME_INFO_HEADER;
Begin
  Assert(Len < Size);
  Assert(Size = FRAME_BUF_SIZE);
  While (Len > Size - Count) Do
  Begin
    GetData(@CurFrameInfo, SizeOf(TFRAME_INFO_HEADER));
    Assert(CurFrameInfo.Magic = FRAME_INFO_HEADER_MAGIC);
    RemoveData(CurFrameInfo.FrameLen - SizeOf(TFRAME_INFO_HEADER));
    Dec(FramesCounter, TypeToFrames(CurFrameInfo.FrameType));
  End;
  Result := Size - Count;
End;

Function TAlarmFile.StoreData(DataBuf: PUCHAR; Len: Integer): Integer;
Var
  FirstPart: Integer;
Begin
  Assert(Len <= Size - Count);
  FirstPart := Size - WritePtr;
  If (FirstPart < Len) Then
  Begin
    CopyMemory(PUCHAR(Integer(FrameBuf) + WritePtr), DataBuf, FirstPart);
    CopyMemory(FrameBuf, PUCHAR(Integer(DataBuf) + FirstPart), Len - FirstPart);
  End
  Else
    CopyMemory(PUCHAR(Integer(FrameBuf) + WritePtr), DataBuf, Len);
  Inc(WritePtr, Len);
  If (WritePtr > Size) Then
    Dec(WritePtr, Size);
  Inc(Count, Len);
  Result := Len;
End;

Function TAlarmFile.GetData(DataBuf: PUCHAR; Len: Integer): Integer;
Var
  FirstPart: Integer;
Begin
  Assert(Assigned(DataBuf));
  Assert(Len <= Count);

  FirstPart := Size - ReadPtr;
  If (FirstPart < Len) Then
  Begin
    CopyMemory(DataBuf, PUCHAR(Integer(FrameBuf) + ReadPtr), FirstPart);
    CopyMemory(PUCHAR(Integer(DataBuf) + FirstPart), FrameBuf, Len - FirstPart);
  End
  Else
    CopyMemory(DataBuf, PUCHAR(Integer(FrameBuf) + ReadPtr), Len);
  Inc(ReadPtr, Len);
  If (ReadPtr > Size) Then
    Dec(ReadPtr, Size);
  Dec(Count, Len);
  Result := Len;
End;

Function TAlarmFile.WriteData(FileHandle: Integer; Len: Integer): Integer;
Var
  FirstPart: Integer;
Begin
  FirstPart := Size - ReadPtr;
  If (FirstPart < Len) Then
  Begin
    FileWrite(FileHandle, PUCHAR(Integer(FrameBuf) + ReadPtr)^, FirstPart);
    FileWrite(FileHandle, FrameBuf, Len - FirstPart);
  End
  Else
    FileWrite(FileHandle, PUCHAR(Integer(FrameBuf) + ReadPtr)^, Len);
  Inc(ReadPtr, Len);
  If (ReadPtr > Size) Then
    Dec(ReadPtr, Size);
  Dec(Count, Len);
  Assert(Count >= 0);
  Result := 0;
End;

Function TAlarmFile.RemoveData(Len: Integer): Integer;
Begin
  Assert(Len <= FRAME_BUF_SIZE);
  Inc(ReadPtr, Len);
  If (ReadPtr > FRAME_BUF_SIZE) Then
    Dec(ReadPtr, FRAME_BUF_SIZE);
  Dec(Count, Len);
  Result := 0;
End;

Function TAlarmFile.TypeToFrames(FrameType: TframeType): Integer;
Begin
  Result := 1;
  Case FrameType Of
    PktIFrames: ;
    PktPFrames: Result := 1;
    PktBBPFrames: Result := 3;
  End;
End;

End.

