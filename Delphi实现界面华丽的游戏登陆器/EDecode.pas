unit EDecode;

interface

uses
  Windows, SysUtils, grobal2, DES; {Classes, Hutil32,}

   function  EncodeMessage (smsg: TDefaultMessage): string;
   function  DecodeMessage (str: string): TDefaultMessage;
   function  EncodeString (str: string): string;
   function  DecodeString (str: string): string;
   function  EncodeBuffer (buf: pChar; bufsize: integer): string;
   procedure DecodeBuffer (src: string; buf: PChar; bufsize: integer);
   procedure Decode6BitBuf (sSource: PChar; pBuf: PChar; nSrcLen,nBufLen: integer);
   procedure Encode6BitBuf (pSrc, pDest: PChar; nSrcLen, nDestLen: integer);
   function  MakeDefaultMsg (msg:Word; Recog:integer; param, tag, series:Word):TDefaultMessage;

  function DecodeString_3des(source: string): string;
  function EncodeString_3des(source: string): string;
  function Decode(source: string): string;
  function Encode(source: string): string;
implementation

function  MakeDefaultMsg (msg:Word; Recog:integer; param, tag, series:Word):TDefaultMessage;
begin
    result.Ident:=Msg;
    result.Param:=Param;
    result.Tag:=Tag;
    result.Series:=Series;
    result.Recog:=Recog;
end;

procedure Encode6BitBuf (pSrc,pDest:PChar;nSrcLen,nDestLen: integer);
var
  I,nRestCount,nDestPos:Integer;
  btMade,btCh,btRest:Byte;
begin
  nRestCount:=0;
  btRest:= 0;
  nDestPos:= 0;
  for i:= 0 to nSrcLen - 1 do begin
    if nDestPos >= nDestLen then break;
    btCh:=Byte(pSrc[i]);
    btMade:=Byte((btRest or (btCh shr (2+ nRestCount))) and $3F);
    btRest:=Byte(((btCh shl (8 - (2+ nRestCount))) shr 2) and $3F);
    Inc (nRestCount,2);

    if nRestCount < 6 then begin
      pDest[nDestPos]:=Char(btMade + $3C);
      Inc(nDestPos);
    end else begin
      if nDestPos < nDestLen - 1 then begin
        pDest[nDestPos]:=Char(btMade + $3C);
        pDest[nDestPos + 1]:=Char(btRest + $3C);
        Inc (nDestPos,2);
      end else begin
        pDest[nDestPos]:=Char(btMade + $3C);
        Inc(nDestPos);
      end;
      nRestCount:=0;
      btRest:=0;
    end;
   end;
   if nRestCount > 0 then begin
     pDest[nDestPos]:=Char(btRest + $3C);
     Inc(nDestPos);
   end;
   pDest[nDestPos]:=#0;
end;

procedure Decode6BitBuf (sSource:PChar;pBuf:PChar;nSrcLen,nBufLen:Integer);
const
  Masks: array[2..6] of byte = ($FC, $F8, $F0, $E0, $C0);
   //($FE, $FC, $F8, $F0, $E0, $C0, $80, $00);
var
  I,{nLen,}nBitPos,nMadeBit,nBufPos:Integer;
  btCh,btTmp,btByte:Byte;
begin
//  nLen:= Length (sSource);
  nBitPos:= 2;
  nMadeBit:= 0;
  nBufPos:= 0;
  btTmp:= 0;
  for I:= 0 to nSrcLen - 1 do begin
    if Integer(sSource[I]) - $3C >= 0 then
      btCh := Byte(sSource[I]) - $3C
    else begin
      nBufPos := 0;
      break;
    end;
    if nBufPos >= nBufLen then break;
    if (nMadeBit + 6) >= 8 then begin
      btByte := Byte(btTmp or ((btCh and $3F) shr (6- nBitPos)));
      pBuf[nBufPos] := Char(btByte);
      Inc(nBufPos);
      nMadeBit := 0;
      if nBitPos < 6 then Inc (nBitPos, 2)
      else begin
        nBitPos := 2;
        continue;
      end;
    end;
    btTmp:= Byte (Byte(btCh shl nBitPos) and Masks[nBitPos]);   // #### ##--
    Inc(nMadeBit, 8 - nBitPos);
  end;
  pBuf[nBufPos] := #0;
end;



function DecodeMessage (str: string): TDefaultMessage;
var
  EncBuf:array[0..BUFFERSIZE - 1] of Char;
  Msg: TDefaultMessage;
begin
  Decode6BitBuf (PChar(str), @EncBuf,Length(str),SizeOf(EncBuf));
  Move (EncBuf, msg, sizeof(TDefaultMessage));
  Result := msg;
end;


function DecodeString (str: string): string;
var
  EncBuf:array[0..BUFFERSIZE - 1] of Char;
begin
  Decode6BitBuf (PChar(str), @EncBuf,Length(str), SizeOf(EncBuf));
  Result := StrPas (EncBuf);

end;

procedure DecodeBuffer (src: string; buf: PChar; bufsize: integer);
var
  EncBuf:array[0..BUFFERSIZE - 1] of Char;
begin
      Decode6BitBuf (PChar(src), @EncBuf,Length(src), SizeOf(EncBuf));
      Move (EncBuf, buf^, bufsize);
end;


function  EncodeMessage (smsg: TDefaultMessage): string;
var
  EncBuf,TempBuf:array[0..BUFFERSIZE - 1] of Char;
begin
  Move (smsg, TempBuf, sizeof(TDefaultMessage));
  Encode6BitBuf(@TempBuf, @EncBuf, sizeof(TDefaultMessage), SizeOf(EncBuf));
  Result:=StrPas(EncBuf);
end;


function EncodeString (str: string): string;
var
  EncBuf:array[0..BUFFERSIZE - 1] of Char;
begin
  Encode6BitBuf(PChar(str), @EncBuf, Length(str), SizeOf(EncBuf));
  Result:=StrPas(EncBuf);
end;


function  EncodeBuffer (buf: pChar; bufsize: integer): string;
var
  EncBuf,TempBuf:array[0..BUFFERSIZE - 1] of Char;
begin
  if bufsize < BUFFERSIZE then begin
    Move (buf^, TempBuf, bufsize);
    Encode6BitBuf (@TempBuf, @EncBuf, bufsize, SizeOf(EncBuf));
    Result := StrPas (EncBuf);
  end else Result := '';
end;

function DecodeString_3des(source: string): string;
var
  DesDecode :TDCP_3des;
  Str:String;
begin
  try
    Result := '';
    DesDecode := TDCP_3des.Create(nil);
    DesDecode.InitStr('');
    DesDecode.Reset;
    Str:=DesDecode.DecryptString(source);
    DesDecode.Reset;
    Result :=Str;
    DesDecode.Free;
  except
    Result := '';
  end;
end;

function EncodeString_3des(source: string): string;
var
  DesEncode :TDCP_3des;
  Str:String;
begin
  try
    Result := '';
    DesEncode := TDCP_3des.Create(nil);
    DesEncode.InitStr('');
    DesEncode.Reset;
    Str:=DesEncode.EncryptString(source);
    DesEncode.Reset;
    Result :=Str;
    DesEncode.Free;
  except
    Result := '';
  end;
end;

function Decode(source: string): string;
Var
  Source_Len,Len : integer;
  Count,c1,c2 : integer;
  code : array[0..7] of byte;
  a1,a2 : byte;
  ind : dword;
  Decode_Str : string;
  label L1,L2;
Begin
  Result := '';
  Decode_Str := '';
  code[2] := $fc;
  code[4] := $f0;
  code[6] := $c0;
  Len := 0;
  a1 := 0;
  a2 := 0;
  c1 := 2;
  c2 := 0;
  ind := 0;
  Count := 0;
  Source_Len := Length(source);
  while (Count < Source_Len) do
    begin
      if(ord(Source[Count+1]) - $3c) < 0 then
        begin
          Decode_Str := Decode_Str + Source[Count+1];
          inc(Len);
          inc(Count);
          a1 := 0;
          a2 := 0;
          c1 := 2;
          c2 := 0;
          ind := 0;
          Continue;
          //break;
        end;
      a1 := ord(Source[Count+1]) - $3c;
      if Len >= Source_Len then
        begin
          break;
        end;
      if (c2 + 6) < 8 then
        begin
          goto L2;
        end;
      ind := a1 and $3f;
      ind := ind shr (6-c1);
      Decode_Str := Decode_Str + chr(ind or a2);
      Inc(Len);
      c2 := 0;
      if c1 >= 6 then
        begin
          c1 := 2;
          goto L1;
        end;
      inc(c1,2);
      L2 :a2 := a1 shl c1;
      a2 := a2 and code[c1];
      c2 := c2 + (8 - c1);
      L1 :inc(count);
    end;
    SetLength(Decode_Str,Len);
    Result := Decode_Str;
end;

function Encode(source: string): string;
var
  Source_Len,Len : integer;
  Count,c : integer;
  a1,a2 : byte;
  ind : dword;
  Encode_Str : string;
begin
  Result := '';
  Encode_Str := '';
  Len := 0;
  a1 := 0;
  a2 := 0;
  c := 0;
  ind := 0;
  Count := 0;
  Source_Len := Length(source);
  while Count < Source_Len do
  begin
    if Len >= $2710 then break;
    ind := ord(source[Count+1]);
    ind := ind shr (c+2);
    a1 := ind or a2;
    a1 := a1 and $3f;
    ind := ord(source[Count+1]);
    ind := ind shl (8-(c+2));
    ind := ind shr 2;
    a2 := ind and $3f;
    inc(c,2);
    if c >= 6 then
    begin
      if Len >= $270f then
      begin
        Encode_Str := Encode_Str + chr(a1 + $3c);
        inc(Len);
      end
      else
      begin
        Encode_Str := Encode_Str + chr(a1 + $3c);
        Encode_Str := Encode_Str + chr(a2 + $3c);
       Inc(Len,2);
      end;
      c := 0;
      a2 := 0;
    end
    else
    begin
      Encode_Str := Encode_Str + chr(a1 + $3c);
      Inc(Len);
    end;
    inc(Count);
   end;
  if c > 0 then
  begin
    Encode_Str := Encode_Str + chr(a2 + $3c);
   Inc(Len);
  end;
  SetLength(Encode_Str,Len);
  Result := Encode_Str;
end;

initialization
begin
end;


finalization
begin
end;
end.
