unit func;

interface
uses
  Windows,DB,SysUtils,dbtables,Dialogs,registry,menus,Forms,jpeg,
  graphics,classes,DBGrids, Chain_Data;

Function WriteRegFile(menth:integer;keyname:String;Regkey:variant):variant;
Function ReadRegFile(menth:integer;keyname:String):variant;
Function ExistsRegKey(keyname:string):boolean;
Function DeleteRegKey(keyname:string):boolean;
Function GetFontStyle(FontNo:integer):TFontStyles;
Function Encrypt(EncryptStr,EncryptKey:string):string;
Function Decrypt(DecryptStr,EncryptKey:string):string;
//提示窗口
//function MessageForm(const Msg, Caption: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; DefButton: Longint=1): Word;
{ 取系统信息 }
function  GetComputerName: AnsiString;  //取本机的计算机名称
function GetDiskVolumeLable(DiskVolume:char):string;//取得本机硬盘的卷标
var
  Font_Style:array[0..4] of TFontStyles;
implementation

Function GetCurImage(CurStr:string):integer;
var
    len:integer;
    tempstr:string;
begin
    tempstr:=trim(CurStr);
    len:=length(tempstr);
    if (len mod 2)=0 then
    begin
        tempstr:=copy(tempstr,length(tempstr)-1,2);
    end
    else
    begin
        tempstr:=copy(tempstr,length(tempstr),1);
        Result:=strtoint(tempstr);
    end;
end;

Function strtohex(instr:string):string; //
var
    i:integer;
    asc:integer;
    hexstr:string;
begin
    Result:='';
    for i:=1 to length(instr) do
    begin
        asc:=ord(instr[i]);
        hexstr:=inttohex(asc,2);
        Result:=Result+hexstr;
    end;
end;

Function hexstrtodecstr(instr:string):string;
var
    hexstr1,hexstr2:string;
    decint,i:integer;
begin
    try
    Result:='';
    i:=1;
    while not (i>length(instr)) do
    begin
        hexstr1:=copy(instr,i,1);
        if hexstr1='A' then hexstr1:='10';
        if hexstr1='B' then hexstr1:='11';
        if hexstr1='C' then hexstr1:='12';
        if hexstr1='D' then hexstr1:='13';
        if hexstr1='E' then hexstr1:='14';
        if hexstr1='F' then hexstr1:='15';

        hexstr2:=copy(instr,i+1,1);
        if hexstr2='A' then hexstr2:='10';
        if hexstr2='B' then hexstr2:='11';
        if hexstr2='C' then hexstr2:='12';
        if hexstr2='D' then hexstr2:='13';
        if hexstr2='E' then hexstr2:='14';
        if hexstr2='F' then hexstr2:='15';

        decint:=strtoint(hexstr1)*16+strtoint(hexstr2);
        Result:=Result+chr(decint);
        i:=i+2;
    end;
    except
        Result:='False';
    end;
end;

Function Encrypt(EncryptStr,EncryptKey:string):string;
var
    i,j,icount:integer;
    s1,s2,tempstr:string;
    asc1,asc2,asc3:integer;
begin
    Result:='';
    s1:=EncryptStr;
    s2:=EncryptKey;
    icount:=length(s1) div 3;
    j:=1;

    for i:=1 to icount do
    begin
        tempstr:=copy(s1,(i-1)*3+1,3);
        asc1:=strtoint(tempstr);
        asc2:=ord(s2[j]);
        j:=j+1;
        if j>length(s2) then
        j:=1;

        asc3:=asc1 xor asc2;
        Result:=Result+chr(asc3);
    end;
end;

Function Decrypt(DecryptStr,EncryptKey:string):string;
var
    i,j:integer;
    str:char;
    s1,s2:string;
    asc1,asc2,asc3:integer;
begin
    Result:='';
    s1:=DecryptStr;
    s2:=EncryptKey;
    j:=1;

    for i:=1 to length(s1) do
    begin
        str:=s1[i];
        asc1:=ord(str);
        asc2:=ord(s2[j]);
        j:=j+1;
        if j>length(s2) then
            j:=1;
        asc3:=asc1 xor asc2;
        Result:=Result+formatfloat('000',asc3);
    end;
    Result:=trim(Result);
end;

function GetFontStyle(FontNo:Integer):TFontStyles;
begin
    Result:=[];
    case FontNo of
        3: Result:=[fsBold,fsItalic];
        2: Result:=[fsItalic];
        1: Result:=[fsBold];
        else Result:=[];
    end;
end;


Function writeselfdog(var selfstr:string;port:integer):integer;
type
    TDataProc=Function(num: Integer; data: Pchar):integer;cdecl;//stdcall;
var
    re      :integer;
    hLib      :Thandle;
    DataProc  :TDataProc;
begin
    hLib:=LoadLibrary('Dec.dll');
    if hLib<32 then
    begin
        result:=-2;
        exit;
    end;
    DataProc:=TDataProc(GetProcAddress(hLib,'SetData'));
    re:=DataProc(port,@selfstr[1]);
    FreeLibrary(hLib);
    result:=re;
end;

Function WriteRegFile(menth:integer;keyname:String;Regkey:variant):variant;
var
    tempkey :string;
    tempregkey :Tregistry;
begin
    tempregkey:=TRegistry.create;
    try
        tempkey:='\SOFTWARE\minipacs';
        tempregkey.RootKey := HKEY_LOCAL_MACHINE;
        tempregkey.OpenKey(tempkey,TRUE);

        case menth of
            1:
            begin
                tempregkey.WriteInteger(keyname,Regkey);
                result :=tempregkey.ReadInteger(keyname);
            end;

            2:
            begin
                tempregkey.WriteString(keyname,Regkey);
                result:=tempregkey.ReadString(keyname);
            end;

            3:
            begin
                tempregkey.WriteBool(keyname,Regkey);
                result:= tempregkey.ReadBool(keyname);
            end;
        end;
    finally
        tempregkey.closekey;
        tempregkey.destroy;
    end;
end;

Function ReadRegFile(menth:integer;keyname:String):variant;
var
    tempkey :string;
    tempregkey :Tregistry;
begin
    tempregkey:=TRegistry.create;
    try
        tempkey:='\SOFTWARE\minipacs';
        tempregkey.RootKey := HKEY_LOCAL_MACHINE;
        tempregkey.OpenKey(tempkey,TRUE);
        case menth of
            1:  Result:=tempregkey.ReadInteger(keyname);
            2:  Result:=tempregkey.ReadString(keyname);
            3:  Result:=tempregkey.ReadBool(keyname);
        end;
    finally
        tempregkey.closekey;
        tempregkey.destroy;
    end;
end;

Function ExistsRegKey(keyname:string):boolean;
var
    tempkey       :string;
    tempregkey    :Tregistry;
begin
    tempregkey:=TRegistry.create;
    try
        tempkey:='\SOFTWARE\minipacs';
        tempregkey.RootKey := HKEY_LOCAL_MACHINE;
        tempregkey.OpenKey(tempkey,TRUE);
        if tempregkey.valueexists(keyname) then
            result:= true
        else
            result:= false;
    finally
        tempregkey.closekey;
        tempregkey.destroy;
    end;
end;

Function DeleteRegKey(keyname:string):boolean;
var
    tempkey:string;
    tempregkey:Tregistry;
begin
    tempregkey:=TRegistry.create;
    try
        tempkey:='\SOFTWARE\minipacs';
        tempregkey.RootKey := HKEY_LOCAL_MACHINE;
        tempregkey.OpenKey(tempkey,TRUE);
        if tempregkey.valueexists(keyname) then
        begin
            tempregkey.DeleteKey(keyname);
            result:= true
        end
        else
            result:= false;
    finally
        tempregkey.closekey;
        tempregkey.destroy;
    end;
end;
//取计算机名称
function GetComputerName: AnsiString;
var lpBuffer: array[0..MAX_PATH] of char;
    dwSize: DWORD;
begin
  dwSize:= MAX_PATH;
  if not Windows.GetComputerName(lpBuffer, dwSize) then
    raise Exception.Create(SysErrorMessage(GetLastError()));
  Result:= StrPas(lpBuffer);
end;
Procedure Change_Bmp_To_Jpeg(var bmpfile,jpgFile:String; compressquality:integer);
var
    jpegimg :Tjpegimage;
    bmpimg:TBitMap;
begin
    jpegimg:=nil;
    bmpimg:=nil;
    try
        try
            jpegimg :=Tjpegimage.create;
            bmpimg  :=TBitMap.create;
            bmpimg.loadfromfile(bmpfile);
            Jpegimg.compressionQuality:=compressquality;
            Jpegimg.Assign(bmpimg);
            Jpegimg.Compress ;
            Jpegimg.SaveToFile(jpgFile);
            deletefile(bmpfile);
        except
            MessageBeep(0);
            Application.MessageBox('当前图象转换错误!','警告!',0);
            exit;
        end;
    finally
        if jpegimg<>nil then
            jpegimg.free;
        if bmpimg<>nil then
            bmpimg.free;
    end;
end;
//取得本机硬盘的卷标
function GetDiskVolumeLable(DiskVolume:char):string;
var
  VolumeLabel, FileSystem: Array[0..$FF] of Char;
  SerialNumber, DW, SysFlags: DWord;
  function DecToHex(aValue: LongInt): String;
  var
    w: Array[1..2] of Word absolute aValue;
    function HexByte(b: Byte): String;
    const
      Hex: Array[$0..$F] of Char = '0123456789ABCDEF';
    begin
      HexByte := Hex[b shr 4] + Hex[b and $F];
    end;
    function HexWord(w: Word): String;
    begin
      HexWord := HexByte(Hi((w-3)*2)) + HexByte(Lo((w+3)*2));
    end;
  begin
    Result :=  HexWord(w[1]) + HexWord(w[2]);
  end;
begin
  Result := '';
  DiskVolume := UpCase(DiskVolume);
  if (DiskVolume >= 'A') and (DiskVolume <= 'Z') then
  begin
    GetVolumeInformation(PChar(DiskVolume + ':\'), VolumeLabel, SizeOf(VolumeLabel),
                         @SerialNumber, DW, SysFlags,
                         FileSystem, SizeOf(FileSystem));
    Result := DecToHex(SerialNumber);
//    Insert('-', Result, 5);
  end;
end;

Function Get_Part_Path(filename :string):string;
var
    len,i :integer;
begin
    len :=length(filename);
    for i:=len downto 1 do
    begin
        if filename[i]='\' then
            break;
    end;
    result :=copy(filename,1,i-1)
end;

Procedure InitFontArray;
begin
  Font_Style[0] :=[fsBold];
  Font_Style[1] :=[fsBold];
  Font_Style[2] :=[fsItalic];
  Font_Style[3] :=[fsUnderline];
  Font_Style[4] :=[fsStrikeOut];
end;
end.
