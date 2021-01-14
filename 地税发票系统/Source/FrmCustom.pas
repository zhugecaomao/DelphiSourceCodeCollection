unit FrmCustom;

interface

uses
  AdvGrid, SysUtils, Controls, Windows, Messages,TlHelp32;

type 
  TKeyByte = array[0..5] of Byte;
  TDesMode = (dmEncry, dmDecry);
function EncryStr(Str, Key: string): string;
function DecryStr(Str, Key: string): string;
function EncryStrHex(Str, Key: string): string;
function DecryStrHex(StrHex, Key: string): string;

const
  BitIP: array[0..63] of Byte = 
  (57, 49, 41, 33, 25, 17, 9, 1,
    59, 51, 43, 35, 27, 19, 11, 3,
    61, 53, 45, 37, 29, 21, 13, 5,
    63, 55, 47, 39, 31, 23, 15, 7,
    56, 48, 40, 32, 24, 16, 8, 0,
    58, 50, 42, 34, 26, 18, 10, 2,
    60, 52, 44, 36, 28, 20, 12, 4,
    62, 54, 46, 38, 30, 22, 14, 6);

  BitCP: array[0..63] of Byte = 
  (39, 7, 47, 15, 55, 23, 63, 31,
    38, 6, 46, 14, 54, 22, 62, 30,
    37, 5, 45, 13, 53, 21, 61, 29,
    36, 4, 44, 12, 52, 20, 60, 28,
    35, 3, 43, 11, 51, 19, 59, 27,
    34, 2, 42, 10, 50, 18, 58, 26,
    33, 1, 41, 9, 49, 17, 57, 25,
    32, 0, 40, 8, 48, 16, 56, 24);

  BitExp: array[0..47] of Integer = 
  (31, 0, 1, 2, 3, 4, 3, 4, 5, 6, 7, 8, 7, 8, 9, 10,
    11, 12, 11, 12, 13, 14, 15, 16, 15, 16, 17, 18, 19, 20, 19, 20,
    21, 22, 23, 24, 23, 24, 25, 26, 27, 28, 27, 28, 29, 30, 31, 0);

  BitPM: array[0..31] of Byte = 
  (15, 6, 19, 20, 28, 11, 27, 16, 0, 14, 22, 25, 4, 17, 30, 9,
    1, 7, 23, 13, 31, 26, 2, 8, 18, 12, 29, 5, 21, 10, 3, 24);

  sBox: array[0..7] of array[0..63] of Byte = 
  ((14, 4, 13, 1, 2, 15, 11, 8, 3, 10, 6, 12, 5, 9, 0, 7,
    0, 15, 7, 4, 14, 2, 13, 1, 10, 6, 12, 11, 9, 5, 3, 8,
    4, 1, 14, 8, 13, 6, 2, 11, 15, 12, 9, 7, 3, 10, 5, 0,
    15, 12, 8, 2, 4, 9, 1, 7, 5, 11, 3, 14, 10, 0, 6, 13),

    (15, 1, 8, 14, 6, 11, 3, 4, 9, 7, 2, 13, 12, 0, 5, 10,
    3, 13, 4, 7, 15, 2, 8, 14, 12, 0, 1, 10, 6, 9, 11, 5,
    0, 14, 7, 11, 10, 4, 13, 1, 5, 8, 12, 6, 9, 3, 2, 15,
    13, 8, 10, 1, 3, 15, 4, 2, 11, 6, 7, 12, 0, 5, 14, 9),

    (10, 0, 9, 14, 6, 3, 15, 5, 1, 13, 12, 7, 11, 4, 2, 8,
    13, 7, 0, 9, 3, 4, 6, 10, 2, 8, 5, 14, 12, 11, 15, 1,
    13, 6, 4, 9, 8, 15, 3, 0, 11, 1, 2, 12, 5, 10, 14, 7,
    1, 10, 13, 0, 6, 9, 8, 7, 4, 15, 14, 3, 11, 5, 2, 12),

    (7, 13, 14, 3, 0, 6, 9, 10, 1, 2, 8, 5, 11, 12, 4, 15,
    13, 8, 11, 5, 6, 15, 0, 3, 4, 7, 2, 12, 1, 10, 14, 9,
    10, 6, 9, 0, 12, 11, 7, 13, 15, 1, 3, 14, 5, 2, 8, 4,
    3, 15, 0, 6, 10, 1, 13, 8, 9, 4, 5, 11, 12, 7, 2, 14),

    (2, 12, 4, 1, 7, 10, 11, 6, 8, 5, 3, 15, 13, 0, 14, 9,
    14, 11, 2, 12, 4, 7, 13, 1, 5, 0, 15, 10, 3, 9, 8, 6,
    4, 2, 1, 11, 10, 13, 7, 8, 15, 9, 12, 5, 6, 3, 0, 14,
    11, 8, 12, 7, 1, 14, 2, 13, 6, 15, 0, 9, 10, 4, 5, 3),

    (12, 1, 10, 15, 9, 2, 6, 8, 0, 13, 3, 4, 14, 7, 5, 11,
    10, 15, 4, 2, 7, 12, 9, 5, 6, 1, 13, 14, 0, 11, 3, 8,
    9, 14, 15, 5, 2, 8, 12, 3, 7, 0, 4, 10, 1, 13, 11, 6,
    4, 3, 2, 12, 9, 5, 15, 10, 11, 14, 1, 7, 6, 0, 8, 13),

    (4, 11, 2, 14, 15, 0, 8, 13, 3, 12, 9, 7, 5, 10, 6, 1,
    13, 0, 11, 7, 4, 9, 1, 10, 14, 3, 5, 12, 2, 15, 8, 6,
    1, 4, 11, 13, 12, 3, 7, 14, 10, 15, 6, 8, 0, 5, 9, 2,
    6, 11, 13, 8, 1, 4, 10, 7, 9, 5, 0, 15, 14, 2, 3, 12),

    (13, 2, 8, 4, 6, 15, 11, 1, 10, 9, 3, 14, 5, 0, 12, 7,
    1, 15, 13, 8, 10, 3, 7, 4, 12, 5, 6, 11, 0, 14, 9, 2,
    7, 11, 4, 1, 9, 12, 14, 2, 0, 6, 10, 13, 15, 3, 5, 8,
    2, 1, 14, 7, 4, 10, 8, 13, 15, 12, 9, 0, 3, 5, 6, 11));

  BitPMC1: array[0..55] of Byte = 
  (56, 48, 40, 32, 24, 16, 8,
    0, 57, 49, 41, 33, 25, 17,
    9, 1, 58, 50, 42, 34, 26,
    18, 10, 2, 59, 51, 43, 35,
    62, 54, 46, 38, 30, 22, 14,
    6, 61, 53, 45, 37, 29, 21,
    13, 5, 60, 52, 44, 36, 28,
    20, 12, 4, 27, 19, 11, 3);

  BitPMC2: array[0..47] of Byte = 
  (13, 16, 10, 23, 0, 4,
    2, 27, 14, 5, 20, 9,
    22, 18, 11, 3, 25, 7,
    15, 6, 26, 19, 12, 1,
    40, 51, 30, 36, 46, 54,
    29, 39, 50, 44, 32, 47,
    43, 48, 38, 55, 33, 52,
    45, 41, 49, 35, 28, 31);

var
  HttpURL: string = 'http://www.bkwork.com/'; 

  MoneyCaStr: string = '  ÒÚÇª°ÛÊ®ÍòÇ§°ÙÊ®Ôª½Ç·Ö'; 
  CurrentFP: string; 
  AppPath: string; 
  DataPath: string; 
  NowDate: TDate; 
  CurrenUser: String;  
  IsAdmin: Boolean;    
  BKString: string = '±´¿Ç¹¤×÷ÊÒÖÆ×÷';
  TaxPubReadOnly: Boolean = False; 
  WorksFlags: Integer; 
  subKey: array[0..15] of TKeyByte; 
  PubACol, PubARow: Integer; 
  procedure Anti_DeDe();       
  procedure CheckParentProc;   
  function NtoC(n0: real): string;   
  Function DumpLoaded: Boolean;stdcall;  
  Function IsBPX(addr:Pointer):Boolean;stdcall;
  Function IsDebug():Boolean;stdcall; 
  Function RegLoaded: Boolean;stdcall;  
  Function FileLoaded: Boolean;stdcall;  
  Function SoftIceXPLoaded:Boolean;stdcall;

implementation



function NtoC(n0: real): string;
  function IIF(b: boolean; s1, s2: string): string;
  begin 
    if b then IIF := s1 else IIF := s2;
  end;
const c = 'ÁãÒ¼·¡ÈþËÁÎéÂ½Æâ°Æ¾Á¡ó·Ö½ÇÔ²Ê°°ÛÇªÍòÊ°°ÛÇªÒÚÊ°°ÛÇªÍò';
var L, i, n, code: integer;
  Z: boolean;
  s, st, st1: string;
begin
  s := FormatFloat('0.00', n0);
  L := Length(s);
  Z := n0 < 1;
  for i := 1 to L - 3 do
  begin
    Val(Copy(s, L - i - 2, 1), n, code);
    st := IIf((n = 0) and (Z or (i = 9) or (i = 5) or (i = 1)), '', Copy(c, n * 2 + 1, 2))
      + IIf((n = 0) and ((i <> 9) and (i <> 5) and (i <> 1) or Z and (i = 1)), '', Copy(c, (i + 13) * 2 - 1, 2))
      + st;
    Z := (n = 0);
  end;
  Z := False;
  for i := 1 to 2 do
  begin
    Val(Copy(s, L - i + 1, 1), n, code);
    st1 := IIf((n = 0) and ((i = 1) or (i = 2) and (Z or (n0 < 1))), '', Copy(c, n * 2 + 1, 2))
      + IIf((n > 0), Copy(c, (i + 11) * 2 - 1, 2), IIf((i = 2) or Z, '', 'Õû'))
      + st1;
    Z := (n = 0);
  end;
  for i := 1 to Length(st) do if Copy(st, i, 4) = 'ÒÚÍò' then Delete(st, i + 2, 2);
  NtoC := IIf(n0 = 0, 'Áã', st + st1);
end;




procedure initPermutation(var inData: array of Byte);
var
  newData: array[0..7] of Byte;
  i: Integer;
begin
  FillChar(newData, 8, 0);
  for i := 0 to 63 do
    if (inData[BitIP[i] shr 3] and (1 shl (7 - (BitIP[i] and $07)))) <> 0 then
      newData[i shr 3] := newData[i shr 3] or (1 shl (7 - (i and $07)));
  for i := 0 to 7 do inData[i] := newData[i];
end;

procedure conversePermutation(var inData: array of Byte);
var
  newData: array[0..7] of Byte;
  i: Integer;
begin
  FillChar(newData, 8, 0);
  for i := 0 to 63 do
    if (inData[BitCP[i] shr 3] and (1 shl (7 - (BitCP[i] and $07)))) <> 0 then
      newData[i shr 3] := newData[i shr 3] or (1 shl (7 - (i and $07)));
  for i := 0 to 7 do inData[i] := newData[i];
end;

procedure expand(inData: array of Byte; var outData: array of Byte);
var
  i: Integer;
begin
  FillChar(outData, 6, 0);
  for i := 0 to 47 do
    if (inData[BitExp[i] shr 3] and (1 shl (7 - (BitExp[i] and $07)))) <> 0 then
      outData[i shr 3] := outData[i shr 3] or (1 shl (7 - (i and $07)));
end;

procedure permutation(var inData: array of Byte);
var
  newData: array[0..3] of Byte;
  i: Integer;
begin
  FillChar(newData, 4, 0);
  for i := 0 to 31 do
    if (inData[BitPM[i] shr 3] and (1 shl (7 - (BitPM[i] and $07)))) <> 0 then
      newData[i shr 3] := newData[i shr 3] or (1 shl (7 - (i and $07)));
  for i := 0 to 3 do inData[i] := newData[i];
end;

function si(s, inByte: Byte): Byte;
var
  c: Byte;
begin
  c := (inByte and $20) or ((inByte and $1E) shr 1) or
    ((inByte and $01) shl 4);
  Result := (sBox[s][c] and $0F);
end;

procedure permutationChoose1(inData: array of Byte;
  var outData: array of Byte);
var
  i: Integer;
begin
  FillChar(outData, 7, 0);
  for i := 0 to 55 do
    if (inData[BitPMC1[i] shr 3] and (1 shl (7 - (BitPMC1[i] and $07)))) <> 0 then
      outData[i shr 3] := outData[i shr 3] or (1 shl (7 - (i and $07)));
end;

procedure permutationChoose2(inData: array of Byte;
  var outData: array of Byte);
var
  i: Integer;
begin
  FillChar(outData, 6, 0);
  for i := 0 to 47 do
    if (inData[BitPMC2[i] shr 3] and (1 shl (7 - (BitPMC2[i] and $07)))) <> 0 then
      outData[i shr 3] := outData[i shr 3] or (1 shl (7 - (i and $07)));
end;

procedure cycleMove(var inData: array of Byte; bitMove: Byte);
var
  i: Integer;
begin
  for i := 0 to bitMove - 1 do
  begin
    inData[0] := (inData[0] shl 1) or (inData[1] shr 7);
    inData[1] := (inData[1] shl 1) or (inData[2] shr 7);
    inData[2] := (inData[2] shl 1) or (inData[3] shr 7);
    inData[3] := (inData[3] shl 1) or ((inData[0] and $10) shr 4);
    inData[0] := (inData[0] and $0F);
  end;
end;

procedure makeKey(inKey: array of Byte; var outKey: array of TKeyByte);
const
  bitDisplace: array[0..15] of Byte =
  (1, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 1);
var
  outData56: array[0..6] of Byte;
  key28l: array[0..3] of Byte;
  key28r: array[0..3] of Byte;
  key56o: array[0..6] of Byte;
  i: Integer;
begin
  permutationChoose1(inKey, outData56);

  key28l[0] := outData56[0] shr 4;
  key28l[1] := (outData56[0] shl 4) or (outData56[1] shr 4);
  key28l[2] := (outData56[1] shl 4) or (outData56[2] shr 4);
  key28l[3] := (outData56[2] shl 4) or (outData56[3] shr 4);
  key28r[0] := outData56[3] and $0F;
  key28r[1] := outData56[4];
  key28r[2] := outData56[5];
  key28r[3] := outData56[6];

  for i := 0 to 15 do
  begin
    cycleMove(key28l, bitDisplace[i]);
    cycleMove(key28r, bitDisplace[i]);
    key56o[0] := (key28l[0] shl 4) or (key28l[1] shr 4);
    key56o[1] := (key28l[1] shl 4) or (key28l[2] shr 4);
    key56o[2] := (key28l[2] shl 4) or (key28l[3] shr 4);
    key56o[3] := (key28l[3] shl 4) or (key28r[0]);
    key56o[4] := key28r[1];
    key56o[5] := key28r[2];
    key56o[6] := key28r[3];
    permutationChoose2(key56o, outKey[i]);
  end;
end;

procedure encry(inData, subKey: array of Byte;
  var outData: array of Byte);
var
  outBuf: array[0..5] of Byte;
  buf: array[0..7] of Byte;
  i: Integer;
begin
  expand(inData, outBuf);
  for i := 0 to 5 do outBuf[i] := outBuf[i] xor subKey[i];
  buf[0] := outBuf[0] shr 2;
  buf[1] := ((outBuf[0] and $03) shl 4) or (outBuf[1] shr 4);
  buf[2] := ((outBuf[1] and $0F) shl 2) or (outBuf[2] shr 6);
  buf[3] := outBuf[2] and $3F;
  buf[4] := outBuf[3] shr 2;
  buf[5] := ((outBuf[3] and $03) shl 4) or (outBuf[4] shr 4);
  buf[6] := ((outBuf[4] and $0F) shl 2) or (outBuf[5] shr 6);
  buf[7] := outBuf[5] and $3F;
  for i := 0 to 7 do buf[i] := si(i, buf[i]);
  for i := 0 to 3 do outBuf[i] := (buf[i * 2] shl 4) or buf[i * 2 + 1];
  permutation(outBuf);
  for i := 0 to 3 do outData[i] := outBuf[i];
end;

procedure desData(desMode: TDesMode;
  inData: array of Byte; var outData: array of Byte);

var
  i, j: Integer;
  temp, buf: array[0..3] of Byte;
begin
  for i := 0 to 7 do outData[i] := inData[i];
  initPermutation(outData);
  if desMode = dmEncry then
  begin
    for i := 0 to 15 do
    begin
      for j := 0 to 3 do temp[j] := outData[j]; 
      for j := 0 to 3 do outData[j] := outData[j + 4]; 
      encry(outData, subKey[i], buf); 
      for j := 0 to 3 do outData[j + 4] := temp[j] xor buf[j]; 
    end;

    for j := 0 to 3 do temp[j] := outData[j + 4];
    for j := 0 to 3 do outData[j + 4] := outData[j];
    for j := 0 to 3 do outData[j] := temp[j];
  end
  else if desMode = dmDecry then
  begin
    for i := 15 downto 0 do
    begin
      for j := 0 to 3 do temp[j] := outData[j];
      for j := 0 to 3 do outData[j] := outData[j + 4];
      encry(outData, subKey[i], buf);
      for j := 0 to 3 do outData[j + 4] := temp[j] xor buf[j];
    end;
    for j := 0 to 3 do temp[j] := outData[j + 4];
    for j := 0 to 3 do outData[j + 4] := outData[j];
    for j := 0 to 3 do outData[j] := temp[j];
  end;
  conversePermutation(outData);
end;



function EncryStr(Str, Key: string): string;
var
  StrByte, OutByte, KeyByte: array[0..7] of Byte;
  StrResult: string;
  I, J: Integer;
begin
  if (Length(Str) > 0) and (Ord(Str[Length(Str)]) = 0) then
    raise Exception.Create('Error: the last char is NULL char.');
  if Length(Key) < 8 then
    while Length(Key) < 8 do Key := Key + Chr(0);
  while Length(Str) mod 8 <> 0 do Str := Str + Chr(0);

  for J := 0 to 7 do KeyByte[J] := Ord(Key[J + 1]);
  makeKey(keyByte, subKey);

  StrResult := '';

  for I := 0 to Length(Str) div 8 - 1 do
  begin
    for J := 0 to 7 do
      StrByte[J] := Ord(Str[I * 8 + J + 1]);
    desData(dmEncry, StrByte, OutByte);
    for J := 0 to 7 do
      StrResult := StrResult + Chr(OutByte[J]);
  end;

  Result := StrResult;
end;

function DecryStr(Str, Key: string): string;
var
  StrByte, OutByte, KeyByte: array[0..7] of Byte;
  StrResult: string;
  I, J: Integer;
begin
  if Length(Key) < 8 then
    while Length(Key) < 8 do Key := Key + Chr(0);

  for J := 0 to 7 do KeyByte[J] := Ord(Key[J + 1]);
  makeKey(keyByte, subKey);

  StrResult := '';

  for I := 0 to Length(Str) div 8 - 1 do
  begin
    for J := 0 to 7 do StrByte[J] := Ord(Str[I * 8 + J + 1]);
    desData(dmDecry, StrByte, OutByte);
    for J := 0 to 7 do
      StrResult := StrResult + Chr(OutByte[J]);
  end;
  while (Length(StrResult) > 0) and
    (Ord(StrResult[Length(StrResult)]) = 0) do
    Delete(StrResult, Length(StrResult), 1);
  Result := StrResult;
end;



function EncryStrHex(Str, Key: string): string;
var
  StrResult, TempResult, Temp: string;
  I: Integer;
begin
  TempResult := EncryStr(Str, Key);
  StrResult := '';
  for I := 0 to Length(TempResult) - 1 do
  begin
    Temp := Format('%x', [Ord(TempResult[I + 1])]);
    if Length(Temp) = 1 then Temp := '0' + Temp;
    StrResult := StrResult + Temp;
  end;
  Result := StrResult;
end;

function DecryStrHex(StrHex, Key: string): string;
  function HexToInt(Hex: string): Integer;
  var
    I, Res: Integer;
    ch: Char;
  begin
    Res := 0;
    for I := 0 to Length(Hex) - 1 do
    begin
      ch := Hex[I + 1];
      if (ch >= '0') and (ch <= '9') then
        Res := Res * 16 + Ord(ch) - Ord('0')
      else if (ch >= 'A') and (ch <= 'F') then
        Res := Res * 16 + Ord(ch) - Ord('A') + 10
      else if (ch >= 'a') and (ch <= 'f') then
        Res := Res * 16 + Ord(ch) - Ord('a') + 10
      else raise Exception.Create('Error: not a Hex String');
    end;
    Result := Res;
  end;

var
  Str, Temp: string;
  I: Integer;
begin
  Str := '';
  for I := 0 to Length(StrHex) div 2 - 1 do
  begin
    Temp := Copy(StrHex, I * 2 + 1, 2);
    Str := Str + Chr(HexToInt(Temp));
  end;
  Result := DecryStr(Str, Key);
end;

procedure Anti_DeDe();
var
  DeDeHandle:THandle;
  i:integer;
begin
  DeDeHandle:=FindWindow(nil,chr($64)+chr($65)+chr($64)+chr($65));
  if DeDeHandle<>0 then
    begin
      For i:=1 to 4500000 do
        SendMessage(DeDeHandle,WM_CLOSE,0,0);
    end;
end;

procedure CheckParentProc;
var 
  Pn: TProcesseNtry32;
  sHandle: THandle;
  H, ExplProc, ParentProc: Hwnd;
  Found: Boolean;
  Buffer: array[0..1023] of Char;
  Path: string;
begin
  H := 0;
  ExplProc := 0;
  ParentProc := 0;
  
  SetString(Path,
            Buffer,
            GetWindowsDirectory(Buffer, Sizeof(Buffer) - 1));
  Path := UpperCase(Path) + '\EXPLORER.EXE'; 
  
  sHandle := CreateToolHelp32SnapShot(TH32CS_SNAPALL, 0);
  Found := Process32First(sHandle, Pn); 
  while Found do 
  begin
    if Pn.szExeFile = ParamStr(0) then 
    begin
      ParentProc := Pn.th32ParentProcessID; 
      
      H := OpenProcess(PROCESS_ALL_ACCESS, True, Pn.th32ParentProcessID);
    end
    else if UpperCase(Pn.szExeFile) = Path then
      ExplProc := Pn.th32ProcessID;      
    Found := Process32Next(sHandle, Pn); 
  end;
  
  if ParentProc <> ExplProc then
  begin
    TerminateProcess(H, 0); 
    
  end;
end;


Function IsBPX(addr:Pointer):Boolean;stdcall;
var
  YInt,NInt:Integer;
begin
  asm
    mov esi,addr
    mov al,[esi]
    cmp al,$CC
    je @Yes
    jne @No
    @Yes:
      mov YInt,1
    @No:
      mov NInt,1
  end;
  if YInt=1 then
    Result:=True;
  if NInt=1 then
    Result:=False;
end;



Function IsDebug():Boolean;stdcall; 
var
  YInt,NInt:Integer;
begin
  asm
    mov eax,fs:[30h]
    movzx eax,byte ptr[eax+2h]
    or al,al
    jz @No
    jnz @Yes
    @No:
      mov NInt,1
    @Yes:
      Mov YInt,1
  end;
  if YInt=1 then
    Result:=True;
  if NInt=1 then
    Result:=False;
end;



Function DumpLoaded: Boolean;stdcall;  
var
  hFile: Thandle;
Begin
  Result:= false;
  hFile := FindWindow(nil,'ProcDump32 (C) 1998, 1999, 2000 G-RoM, Lorian & Stone');
  if( hFile <> 0 ) then
  begin
    Result:= TRUE;
  end;
End;

Function RegLoaded: Boolean;stdcall;  
var
  hFile: Thandle;
Begin
  Result:= false;
  hFile := FindWindow(nil,'Registry Monitor - Sysinternals: www.sysinternals.com');
  if( hFile <> 0 ) then
  begin
    Result:= TRUE;
  end;
End;

Function FileLoaded: Boolean;stdcall;  
var
  hFile: Thandle;
Begin
  Result:= false;
  hFile := FindWindow(nil,'File Monitor - Sysinternals: www.sysinternals.com');
  if( hFile <> 0 ) then
  begin
    Result:= TRUE;
  end;
End;

Function SoftIceXPLoaded:Boolean;stdcall;
var
  mark:Integer;
  YesInt,NoInt:Integer;
begin
  YesInt:=0;NoInt:=0;
  mark:=0;
  asm
    push offset @handler
    push dword ptr fs:[0]
    mov  dword ptr fs:[0],esp
    xor  eax,eax
    int 1
    inc  eax
    inc  eax
    pop  dword ptr fs:[0]
    add esp,4
    or   eax,eax
    jz   @found
    cmp mark, 0
    jnz   @found
    jmp  @Nofound
    @handler:
      mov ebx,[esp+0ch]
      add dword ptr [ebx+0b8h],02h
      mov ebx,[esp+4]
      cmp [ebx], 80000004h
      jz @Table
      inc mark
    @Table:
      xor eax,eax
     ret
    @found:
      mov YesInt,1
    @Nofound:
      mov NoInt,1
  end;
  if Yesint=1 then
    Result:=True;
  if NoInt=1 then
    Result:=False;
end;

end.

