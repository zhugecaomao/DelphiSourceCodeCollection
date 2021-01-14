unit Regest;

interface

uses Classes,Math,SysUtils,Controls,Dialogs;


type
   TCPUID  = array[1..4] of longint;
   FSn = array[0..3] of string[6];
   TRegInfo = record
    Sn,RegCode,RegSn: FSn;
    UserName: string[20];
    ComName: string[100];
    InstallDate,RegeditDate: TDate;
    RunData: integer;
    Reged: boolean;
    ParentLen,ChildLen: Longint;
    Version: string[5];
    Autor: string[20];
    RunPar: string[50];
   end;

   TMemoEncKey = record
    EncKey: array[0..50] of byte;
   end;

   TEncKey = array[0..255] of byte;

   procedure EncStream(Source: TStream;var AStream: TStream;var AKey: Tstream);
   procedure EncStreamByKey(Source: TStream;var AStream: TStream;AKey: Tstream);
   procedure DecStream(Source: TStream;var AStream: TStream;AKey: TStream);
   procedure GetRegInfo(var RegInfo: TRegInfo;var DecKey: TMemoEncKey;AStream: TStream);
   procedure DecRegInfo(RegInfo: TRegInfo;EncKey: TMemoEncKey;var DecStream: TStream);
   procedure getUserSn(var Reginfo: TRegInfo);
   procedure WriteUserInfo(Reginfo: TRegInfo;EncKey: TMemoEncKey;var DecStream: TStream;Append: boolean=true);

  function GetCPUID : TCPUID; assembler; register;     //得到CPU序列号
  procedure GetRegCn(AUserName: string;var ARegInfo: TRegInfo);
  procedure GetRegCode(var AFSn: FSn);

  procedure GetRegCode1(var AFSn: FSn);
  procedure DecRegCode(var AFSn: FSn);

var
  RegFileName:string='C:\WINDOWS\system32\reg.dll';
  FMaxRunData:integer=10;

implementation
  function GetCPUID : TCPUID; assembler; register;     //得到CPU序列号
  asm
    PUSH    EBX         {Save affected register}
    PUSH    EDI
    MOV     EDI,EAX     {@Resukt}
    MOV     EAX,1
    DW      $A20F       {CPUID Command}
    STOSD          {CPUID[1]}
    MOV     EAX,EBX
    STOSD               {CPUID[2]}
    MOV     EAX,ECX
    STOSD               {CPUID[3]}
    MOV     EAX,EDX
    STOSD               {CPUID[4]}
    POP     EDI {Restore registers}
    POP     EBX
  end;

 procedure EncStream(Source: TStream;var AStream: TStream;var AKey: Tstream);
 var
  i: integer;
  EncKey: TEncKey;
  code,EncCode,KeyCode: Byte;
  temStream: TMemoryStream;
 begin
  temStream := TMemoryStream.Create;
  Source.Seek(0,0);
  AKey.Seek(0,0);
  for i := 0 to Source.Size do
  begin
    Source.Read(code,sizeof(Byte));
    Randomize;
    KeyCode := EncKey[randomrange(0,255)];
    AKey.Write(KeyCode,sizeof(byte));
    EncCode := code xor KeyCode;
    temStream.Write(EncCode,sizeof(byte));
  end;
  AStream.Seek(0,0);
  temStream.Seek(0,0);
  AStream.CopyFrom(temStream,temStream.Size);
  temStream.Free;
 end;

 procedure EncStreamByKey(Source: TStream;var AStream: TStream;AKey: Tstream);
 var
  i: integer;
  EncKey: TEncKey;
  code,EncCode,KeyCode: Byte;
  temStream: TMemoryStream;
 begin
  temStream := TMemoryStream.Create;
  Source.Seek(0,0);
  AKey.Seek(0,0);
  for i := 0 to Source.Size do
  begin
    Source.Read(code,sizeof(Byte));
    AKey.Read(KeyCode,sizeof(byte));

    EncCode := (code xor KeyCode);// xor KeyCode;
    temStream.Write(EncCode,sizeof(byte));
    if AKey.Position = AKey.Size then
      AKey.Seek(0,0);
  end;
  AStream.Seek(0,0);
  temStream.Seek(0,0);
  AStream.CopyFrom(temStream,temStream.Size);
  temStream.Free;
 end;

 procedure DecStream(Source: TStream;var AStream: TStream;AKey: TStream);
 var
  i: integer;
  EncKey: TEncKey;
  code,EncCode,KeyCode: Byte;
  temStream: TMemoryStream;
 begin
  temStream := TMemoryStream.Create;
  Source.Seek(0,0);
  AKey.Seek(0,0);
  for i := 0 to Source.Size do
  begin
    Source.Read(code,sizeof(Byte));
    AKey.Read(KeyCode,sizeof(byte));
    EncCode := (code xor KeyCode);// shl KeyCode;
    temStream.Write(EncCode,sizeof(byte));
    if AKey.Position = AKey.Size then
      AKey.Seek(0,0);
  end;
  AStream.Seek(0,0);
  temStream.Seek(0,0);
  AStream.CopyFrom(temStream,temStream.Size);
  temStream.Free;
 end;

 procedure GetRegInfo(var RegInfo: TRegInfo;var DecKey: TMemoEncKey;AStream: TStream);
 var
  KeyStream,SourStream,ToStream: TMemoryStream;
  begin
    KeyStream := TMemoryStream.Create;
    SourStream := TMemoryStream.Create;
    ToStream := TMemoryStream.Create;

    AStream.Seek(-sizeof(TMemoEncKey),soEnd);
    KeyStream.CopyFrom(AStream,sizeof(TMemoEncKey));
    AStream.Seek(-sizeof(TMemoEncKey)-sizeof(TRegInfo),soEnd);
    SourStream.CopyFrom(AStream,sizeof(TRegInfo));

    DecStream(SourStream,TStream(ToStream),KeyStream);

    ToStream.Seek(0,0);
    ToStream.Read(RegInfo,sizeof(TRegInfo));
    KeyStream.Seek(0,0);
    ToStream.Read(DecKey,sizeof(TMemoEncKey));

    KeyStream.Free;
    SourStream.Free;
    ToStream.Free;
 end;

  procedure DecRegInfo(RegInfo: TRegInfo;EncKey: TMemoEncKey;var DecStream: TStream);
  var
    SourMemory,KeyMemory1,DecMemory2: TMemoryStream;
  begin
      SourMemory := TMemoryStream.Create;
      KeyMemory1 := TMemoryStream.Create;
      DecMemory2 := TMemoryStream.Create;
      SourMemory.Write(RegInfo,sizeof(TRegInfo));
      KeyMemory1.Write(EncKey,sizeof(TmemoEncKey));

      EncStreamByKey(SourMemory,TStream(DecStream),KeyMemory1);
  end;
  procedure getUserSn(var Reginfo: TRegInfo);
  var
    i: integer;
    CPUID: TCPUID;
  begin
    CPUID := GetCPUID;
    for i := low(RegInfo.Sn) to high(RegInfo.Sn) do
    begin
      if i <> high(RegInfo.Sn) then
      begin
      RegInfo.Sn[i] := format('%0x',[CPUID[i+1]]);
      //showmessage(format('%0x',[CPUID[i+1]]));
      RegInfo.RegSn[i] := '';
      end
      else
      begin
      RegInfo.Sn[i] := format('%0x',[CPUID[i+1]]);
      RegInfo.RegSn[i] := '';
      end
    end;
  end;
  procedure WriteUserInfo(Reginfo: TRegInfo;EncKey: TMemoEncKey;var DecStream: TStream;Append: boolean=true);
  var
    DecMemory2,KeyMemory1: TMemorystream;
  begin
      KeyMemory1 := TMemoryStream.Create;
      DecMemory2 := TMemoryStream.Create;
      //SourMemory.Write(RegInfo,sizeof(TRegInfo));
      KeyMemory1.Write(EncKey,sizeof(TmemoEncKey));

      //EncStream := TMemoryStream.Create;
      DecRegInfo(RegInfo,EncKey,TStream(DecMemory2));
      //EncStreamByKey(SourMemory,TStream(DecMemory2),KeyMemory1);

      if Append then
        DecStream.Seek(0,soEnd)
      else
        DecStream.Seek(-sizeof(TmemoEncKey)-sizeof(TRegInfo),soEnd);
      DecMemory2.Seek(0,0);
      DecStream.CopyFrom(DecMemory2,sizeof(TRegInfo));
      KeyMemory1.Seek(0,0);
      DecStream.CopyFrom(KeyMemory1,sizeof(TmemoEncKey));

      KeyMemory1.Free;
      DecMemory2.Free;
  end;
  procedure GetRegCn(AUserName: string;var ARegInfo: TRegInfo);
  var
    i,j,k: integer;
    n,m,TemByte: byte;
  begin
    n := 0;
    ARegInfo.UserName := AUserName;
    ARegInfo.RegCode[0] := ARegInfo.Sn[0];
    ARegInfo.RegCode[1] := ARegInfo.Sn[1];
    ARegInfo.RegCode[2] := ARegInfo.Sn[2];
    ARegInfo.RegCode[3] := ARegInfo.Sn[3];

    //AUserName := AUserName + AUserName;
    for i := 1 to length(AUserName) do
    begin
      for j := 0 to 3 do
      begin
         for k := 1 to length(ARegInfo.Sn[j]) do
         begin
         TemByte := ord(AUserName[i]);
         if TemByte > 122 then
          TemByte := TemByte div 2;
          m := ord(ARegInfo.RegCode[j][k]) xor TemByte;
          if (m in[48..57]) or (m in[65..90]) or (m in[97..122]) then
            ARegInfo.RegCode[j][k] := chr(m)
         end;
      end;
    end;
  end;
  procedure GetRegCode(var AFSn: FSn);
  var
    EncStr: string;
    i: integer;
    temChar: char;
    tembyte: byte;
  begin
    for i := low(AFSn) to high(AFSn) do
    begin
      EncStr := EncStr+AFSn[i];
    end;

    temChar := EncStr[1];
    for i := 1 to length(EncStr) do
    begin
      if i <> length(EncStr) then
      begin
        tembyte := ord(EncStr[i]) xor ord(EncStr[i+1]);
        if (tembyte in[48..57]) or (tembyte in[65..90]) or (tembyte in[97..122]) then
          EncStr[i] := chr(temByte)
        else
          EncStr[i] := EncStr[i+1];
      end
      else
      begin
        tembyte := ord(EncStr[i]) xor ord(temChar);
        if (tembyte in[48..57]) or (tembyte in[65..90]) or (tembyte in[97..122]) then
          EncStr[i] := chr(temByte)
        else
          EncStr[i] := temChar;
      end;
    end;

    AFSn[0] := Copy(EncStr,0,length(AFSn[0]));
    AFSn[1] := Copy(EncStr,length(AFSn[0]),length(AFSn[1]));
    AFSn[2] := Copy(EncStr,length(AFSn[0])+length(AFSn[1]),length(AFSn[2]));
    AFSn[3] := Copy(EncStr,length(AFSn[0])+length(AFSn[1])+length(AFSn[2]),length(AFSn[3]));
  end;

  procedure GetRegCode1(var AFSn: FSn);
  var
    EncStr: string;
    i: integer;
    temChar: char;
    tembyte: byte;
  begin
    for i := low(AFSn) to high(AFSn) do
    begin
      EncStr := EncStr+AFSn[i];
    end;

    temChar := EncStr[1];
    for i := 1 to length(EncStr) do
    begin
      if i <> length(EncStr) then
      begin
        tembyte := ABS((ord(EncStr[i]) and ord(EncStr[i+1])));
        if (tembyte in[48..57]) or (tembyte in[65..90]) or (tembyte in[97..122]) then
          EncStr[i] := chr(temByte)
        else
          EncStr[i] := EncStr[i+1];
      end
      else
      begin
        tembyte := ABS(ord(EncStr[i]) and ord(temChar));
        if (tembyte in[48..57]) or (tembyte in[65..90]) or (tembyte in[97..122]) then
          EncStr[i] := chr(temByte)
        else
          EncStr[i] := temChar;
      end;
    end;

    AFSn[0] := Copy(EncStr,0,length(AFSn[0]));
    AFSn[1] := Copy(EncStr,length(AFSn[0]),length(AFSn[1]));
    AFSn[2] := Copy(EncStr,length(AFSn[0])+length(AFSn[1]),length(AFSn[2]));
    AFSn[3] := Copy(EncStr,length(AFSn[0])+length(AFSn[1])+length(AFSn[2]),length(AFSn[3]));
  end;
  
  procedure DecRegCode(var AFSn: FSn);
  var
    i: integer;
    EncStr: string;
  begin
    for i := low(AFSn) to high(AFSn) do
    begin
      EncStr := EncStr+AFSn[i];
    end;
    for i := 0 to length(EncStr) do
    begin
      GetRegCode(AFSn);
    end;
    GetRegCode1(AFSn);
  end;
end.
