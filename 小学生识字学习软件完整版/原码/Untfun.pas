unit Untfun;

interface

 uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ExtCtrls, ComCtrls, ToolWin,WinSock,StdCtrls, jpeg,
  REGISTRY,ComObj, WordXP,inifiles,Math,ActiveX,ShlObj;


  const

  // 公共信息
{$IFDEF GB2312}
  SCnInformation = '提示';
  SCnWarning = '警告';
  SCnError = '错误';
{$ELSE}
  SCnInformation = 'Information';
  SCnWarning = 'Warning';
  SCnError = 'Error';
{$ENDIF}

  C1=52845; //字符串加密算法的公匙
  C2=22719; //字符串加密算法的公匙



//▎================1、扩展的MDI有关操作函数  ===================▎//

  procedure OpenChildForm(FormClass: TFormClass; var Fm; AOwner:TComponent);
  procedure OpenForm(FormClass: TFormClass; var fm; AOwner: TComponent);

  function IsForm(formClass:TFormClass) : boolean; //判断指定窗口存在没有
  function isapprun(str:string):boolean;//判断指定程序运行没有
  function CloseApp(ClassName: String): Boolean;   //关闭外部应用程序

//▎================2、扩展的网络有关操作函数  ===================▎//



  function GetHostIP:string;   {* 获取计算机的IP地址}
  function GetComputerName:string;  {* 获取网络计算机名称}
  function GetCurrentUserName : string;  //*获取当前Windows登录名的用户


//▎================3、 扩展的注册有关操作函数  ===================▎//

  function getzcm:string;
  function readzcm_ini(s:string):Integer ;
  function writezcm_ini(i:Integer;s:string):Boolean ;
  function readzcm_reg(s:string):integer;
  function writezcm_reg(s:string):Boolean;

  function GetHDNumber(Drv : String): DWORD; //得到硬盘序列号
  function Serial(Num:DWORD):string; //这个号码是用户给你生成注册码的，它通过对硬盘序列号编码而来。
  
  function StrToHex(AStr: string): string; {* 字符转化成十六进制}
  function HexToStr(AStr: string): string; {* 十六进制转化成字符}
  function TransChar(AChar: Char): Integer;

  function Encrypt(const S: String; Key: Word): String;//字符串加密函数
  function Decrypt(const S: String; Key: Word): String; //字符串解密函数

 //▎================4、 扩展的文件路径函数  ===================▎//

 function PathWithSlash(const Path: string): string;
 {功能，将路径变为带\符号的路径}

 function PathGetWindowsPath: string;  //WINDOWS路径\
 function PathGetSystemPath: string;   //SYSTEM32路径\
 function getsyspath:string;          //SYSTEM路径\
 function getAppPath : string;        //程序路径   带"\"
 function GetTempDirectory: String;    //临时目录\

 function shFileCopy(srcFile,destFile:String;bDelDest:boolean=true):boolean;// 功能：安全的复制文件
  { 功能：安全的复制文件 ,srcFile，destFile：源文件和目标文件 ,
 bDelDest：如果目标文件已经存在，是否覆盖 ,返回值：true成功，false失败}

 procedure DelTree(DirName:String);
 {如C:\123  或C:\123\都行,内部会补齐 }

 function EmptyDirectory(TheDirectory :String ; Recursive : Boolean):Boolean;
 {删除目录内的文件和子目录;如:"C:\123\" }

 procedure creatdesktoplink(Linkname:string);
 {建立桌面快捷方式，Linkname为在桌面上要显示的字符}


//▎================5 扩展的字符串操作函数  ===================▎//

function InStr(const sShort: string; const sLong: string): Boolean;     {测试通过}
{* 判断s1是否包含在s2中}

function IntToStrEx(Value: Integer; Len: Integer; FillChar: Char = '0'): string;  {测试通过}
{* 扩展整数转字符串函数  Example:   IntToStrEx(1,5,'0');   返回："00001"}

function IntToStrSp(Value: Integer; SpLen: Integer = 3; Sp: Char = ','): string;  {测试通过}
{* 带分隔符的整数－字符转换}

function ByteToBin(Value: Byte): string; {测试通过}
{* 字节转二进制串}

function StrRight(Str: string; Len: Integer): string;  {测试通过}
{* 返回字符串右边的字符   Examples: StrRight('ABCEDFG',3);   返回:'DFG' }

function StrLeft(Str: string; Len: Integer): string; {测试通过}
{* 返回字符串左边的字符}

function Spc(Len: Integer): string;  {测试通过}
{* 返回空格串}

function Replace(Str,s1,s2:string;CaseSensitive:Boolean):string;  {测试通过}
{* 返回将指定字符s1用字符串s2替换后的字符串，可支持大小写敏感由CaseSensitive操作}
{example: replace('We know what we want','we','I',false) = 'I Know what I want'}

function Replicate(pcChar:Char; piCount:integer):string;
{在一个字符串中查找某个字符串的位置}

function StrNum(ShortStr:string;LongString:string):Integer;     {测试通过}
{* 返回某个字符串中某个字符串中出现的次数}


function PadLStr(psInput:String; piWidth:Integer; pcPadWith:Char):String;        {测试通过}
{* 返回从psInput字符串左边开始用pcPadWith填充后总长度为PiWidth的字符串}

function PadRStr(psInput:String; piWidth:Integer; pcPadWith:Char):String;       {测试通过}
{* 返回从psInput字符串右边开始用pcPadWith填充后总长度为PiWidth的字符串}

function PadCStr(psInput:String; piWidth:Integer; pcPadWith:Char):String;        {测试通过}
{* 返回从psInput字符串两边开始用pcPadWith填充后总长度为PiWidth的字符串}

function ChrTran(psInput:String; pcSearch:Char; pcTranWith:Char):String;        {测试通过}
{* 返回替换后字符串[替换单个字符] Examples: ChrTran('abCdEgdlkh','d','#')； 返回'abC#Eg#lkh'}

function StrTran(psInput:String; psSearch:String; psTranWith:String):String;        {测试通过}
{* 返回替换后字符串[替换字符串] Examples: StrTran('aruyfbn','ruy','=====');； 返回'a=====fbn'}

function Stuff(psInput:String; piBeginPlace,piCount:Integer; psStuffWith:String):String;
{ *返回替换后字符串[替换字符串] Examples: Stuff('ABCDEFGHI',3,4,'12345')；返回'AB12345GHI'}

function IsDigital(Value: string): boolean;
{功能说明：判断string是否全是数字}

function RandomStr(aLength : Longint) : String;
{随机字符串函数}

procedure TxttoWords(const S: string; words: TstringList);  
{功能说明：分解成单个汉字，没有乱码，测试通过}

function tx(i: integer): string;      
{功能说明：将数字变成汉字，如1变一}

 //==================================== 自定义的字符串
  function deleleftdot(str:string):string;   //删除行首点号
  function deleleftdun(str:string):string; //删除行首顿号
  function deleleftdigital(str:string;partstr:string):string;

  function replacing(S,source,target:string):string;   
  {功能:在S中用target来替换source,能够完全去除}

  function balancerate(source,target:string;pdxz:Boolean):Real;
  {功能:计算两个字体符相同的经率,pdxz为是不是判断选择,处理时有差别,自定义}

 //以下为    处理时间
 function TimeToSecond(const H, M, S: Integer): Integer;
 function TimeSecondToTime(const secs: Integer):string;
 //▎================6 扩展的WORD操作函数  ===================▎//

 function CONNECTWORD: Boolean;
 {功能：建立、连接}

 procedure addstrtoword(text:string;align:Boolean;fontname:WideString;fontsize:integer);
 {向WORD中追加字符，顺序为追加内容、对齐方式、字体、字体大小}

 procedure Addbmptoword(STR:string);
 {功能：向WORD加入图片，STR为文件路径}
 
 procedure addstrtorich(s, fontname: string; fontsize,alimen: Integer; Richedit: TRichEdit);
 {功能：向RICHEDIT控件中追加内容，顺序为内容、字体、字体大小、对齐方式（O为左，1为中，2为中）、控件NAME}

 procedure  loadpicture(str:string;var image:TImage);
 {功能：打开图像文件，STR为路役，IMAGE为显示的控件}

 //▎================7 扩展的读取皮肤文件的函数  ===================▎//
  function  readskinfile(Keyname:string):string;
  {功能，读出皮肤路役，Keyname一般可设为程序名称，以利识别}

  procedure writeskinfile(keyname,filename:string);
  {功能，写入皮肤路役，Keyname一般可设为程序名称，以利识别}

//===================8.ado===========
  function setadoaccess(mdbpath:string;passwd:string):string;
  // 加入字体
 


 var
   msword: Variant;


  implementation

procedure OpenChildForm(FormClass: TFormClass; var Fm; AOwner:TComponent);
var
  I: Integer;
  Child: TForm;
begin
  for I := 0 to Screen.FormCount - 1 do
   if Screen.Forms[I].ClassType = FormClass then
     begin
       Child := Screen.Forms[I];
       if Child.WindowState = wsMinimized then
       ShowWindow(Child.Handle, SW_SHOWNORMAL)
       else
       ShowWindow(Child.handle,SW_SHOWNA);
       if (not Child.Visible) then Child.Visible := True;
        Child.BringToFront;
        Child.Setfocus;
        TForm(Fm) := Child;
        Exit;
     end;
    Child := TForm(FormClass.NewInstance);
    TForm(Fm) := Child;
    Child.Create(AOwner);
end;


procedure OpenForm(FormClass: TFormClass; var fm; AOwner: TComponent);
var
  i: integer;
  Child: TForm;
begin
  for i := 0 to Screen.FormCount - 1 do
    if screen.Forms[i].Owner = Aowner then
     begin
        //如有一窗口打开,将不打开新的窗口
        if Screen.Forms[i].ClassType = FormClass then
          begin
            Child := Screen.Forms[i];
            if Child.WindowState = wsMinimized then    //如已存在但最少化的窗口,将还原显示
            ShowWindow(Child.handle, SW_SHOWNORMAL)
            else
            ShowWindow(Child.handle, SW_SHOWNA);
            if (not Child.Visible) then Child.Visible := True;
            Child.BringToFront;
            Child.Setfocus;
            TForm(fm) := Child;
            exit;
          end;

      exit;
   end;


  Child := TForm(FormClass.NewInstance);
  TForm(fm) := Child;
  Child.Create(AOwner);
end;

function readzcm_reg(s:string):integer;
var
  re_id:integer;
  registerTemp : TRegistry;
  re_code:string;
  ini_num:Integer;
  Temres:Integer;
begin
  Temres:=0;
  registerTemp := TRegistry.Create;
    with registerTemp do
    begin
      RootKey:=HKEY_LOCAL_MACHINE;
       try
       if OpenKey('Software\Microsoft\Windows\'+s,True) then// 建一目录
          begin                               //wwwwwwwwwwwwwwwww 
            if ValueExists('reg_code') then  //如存在则
            begin
              re_code:=ReadString('reg_code');
              if re_code=getzcm then Temres:=0;// 己注册
            end
            else
            begin  //如果注册码键值不存在      //eeeeeeeeeeeee

              ini_num:=readzcm_ini('xlxt');   //读出INI记录的运行次数

              //往下语句肯定是非注册用户
              if valueexists('gc_id')=False then   //如NOT存在则
              begin //判断其存在否？     //ggggggggggggggg
                if ini_num =0 then
                begin
                  Writeinteger('gc_id',1);//如不存在则建立
                  writezcm_ini(1,'xlxt');
                  Temres:=1;
                end
                else
                Writeinteger('gc_id',ini_num);
              END                     //gggggggggggggg
              else
              begin //判断其存在否？   rrrrrrrrrrrrrrrrrr
                re_id:=readinteger('gc_id');//读出标志值
                re_id:=max(re_id,ini_num);
                if (re_id>500) or (re_id<1) then  Temres :=1000//假如1000，则应注册。
                else
                begin
                  re_id:=re_id+1; //最大值为500 ,试用期
                  Writeinteger('gc_id',re_id);
                  writezcm_ini(re_id,'xlxt');
                  Temres :=re_id;
                end;
              end;  //IF  EXSIT      rrrrrrrrrrrrrrrrrrrr
         end;//如果键值不存在        eeeeeeeeeeeeeeeeeeee
       end;    //      wwwwwwwwwww
       
     finally
     CloseKey;
     Free;
   end;
 Result :=Temres;
end; //with registerTemp do

end;


function writezcm_reg(s:string):Boolean;
VAR
  REG:TREGISTRY;
  str:string;
begin
   Result :=False;
   str:=getzcm;
   REG:=TREGISTRY.Create ;
      WITH REG DO
        BEGIN
          ROOTKEY:=HKEY_LOCAL_MACHINE;
          TRY
          if OpenKey('Software\Microsoft\Windows\'+s,True) then
            begin
              WriteString('reg_code',str);
              Writeinteger('gc_id',0);//若输入的注册码正确，则将标志值置为0 即已注册。
              Result :=True;
            end;
          FINALLY
          CloseKey;
          Free;
          END;
       end;
end;

function getzcm:string;
var
  str,temstr:string;
  i:Integer;
begin
  str:=Trim(Serial(GetHDNumber('C:')));
  temstr:=Copy(str,1,10);
  i:=Length(temstr);
  if i<10 then temstr:=temstr+copy('luzhenfeng',1,10-i);
  Result :=temstr ;
end;

function readzcm_ini(s:string):Integer ;
var
  inifile:TIniFile ;
  IniFileName:string;
  num:Integer ;
begin
  IniFileName:= PathGetWindowsPath+'myset.ini' ;
  inifile:=TInifile.Create(IniFileName);
  try
  num:=inifile.ReadInteger(s,'recorder',0);
  finally
  inifile.Free;
  end;

  Result :=num;  
end;

function writezcm_ini(i:integer;s:string):Boolean ;
var
  inifile:TIniFile ;
  IniFileName:string;
  BB:Boolean ;
begin

  IniFileName:= PathGetWindowsPath+'myset.ini' ;
  inifile:=TInifile.Create(IniFileName);
  try
    inifile.WriteInteger(s,'recorder',i);
    BB :=True;
  finally
    inifile.Free ;
  end;
  result:=BB;
end;

 //-------------------------------------  生成注册码
function GetHDNumber(Drv : String): DWORD; //得到硬盘序列号
var
 VolumeSerialNumber : DWORD;
 MaximumComponentLength : DWORD;
 FileSystemFlags : DWORD;
begin
 if Drv[Length(Drv)] =':' then Drv := Drv + '\';
 GetVolumeInformation(pChar(Drv),
            nil,
            0,
            @VolumeSerialNumber,
            MaximumComponentLength,
            FileSystemFlags,
            nil,
            0);
 Result:= (VolumeSerialNumber);
 //GetVolumeInformation("C:\\",NULL,NULL,&dwIDESerial,NULL,NULL,NULL,NULL);
end;

function Serial(Num:DWORD):string; //这个号码是用户给你生成注册码的，它通过对硬盘序列号编码而来。
var sNum:string; inChar:array[1..4]of char;
begin 

 Num:=Num xor 8009211011;
 sNum:=inttostr(Num);
 inChar[1]:=char(((integer(sNum[1])+integer(sNum[2]))mod 5)+integer('a'));
 inChar[2]:=char(((integer(sNum[3])+integer(sNum[4]))mod 5)+integer('a'));
 inChar[3]:=char(((integer(sNum[5])+integer(sNum[6]))mod 5)+integer('a'));
 inChar[4]:=char(((integer(sNum[7])+integer(sNum[8])+integer(sNum[9]))mod 5)+integer('a'));
 insert(inChar[1],sNum,1);
 insert(inChar[4],sNum,3);
 insert(inChar[2],sNum,5);
 insert(inChar[3],sNum,9);
 Result:=sNum;
end;

//▎======================⑾进制函数及过程======================▎//

function TransChar(AChar: Char): Integer;
begin
   if AChar in ['0'..'9'] then
      Result := Ord(AChar) - Ord('0')
   else
      Result := 10 + Ord(AChar) - Ord('A');
   end;


//字符转化成十六进制
function StrToHex(AStr: string): string;
var
   I : Integer;
//   Tmp: string;
   begin
      Result := '';
      For I := 1 to Length(AStr) do
      begin
         Result := Result + Format('%2x', [Byte(AStr[I])]);
      end;
      I := Pos(' ', Result);
      While I <> 0 do
      begin
         Result[I] := '0';
         I := Pos(' ', Result);
      end;
end;

//十六进制转化成字符
function HexToStr(AStr: string): string;
var
   I : Integer;
   CharValue: Word;
   begin
   Result := '';
   for I := 1 to Trunc(Length(Astr)/2) do
   begin
      Result := Result + ' ';
      CharValue := TransChar(AStr[2*I-1])*16 + TransChar(AStr[2*I]);
      Result[I] := Char(CharValue);
   end;
end;

//▎======================字符串加密和解密======================▎//

//字符串加密函数
function Encrypt(const S: String; Key: Word): String;
var
   I : Integer;
begin
      Result := S;
      for I := 1 to Length(S) do
      begin
         Result[I] := char(byte(S[I]) xor (Key shr 8));
         Key := (byte(Result[I]) + Key) * C1 + C2;
         if Result[I] = Chr(0) then
            Result[I] := S[I];
      end;
      Result := StrToHex(Result);
end;


//字符串解密函数
function Decrypt(const S: String; Key: Word): String;
var
   I: Integer;
   S1: string;
begin
   S1 := HexToStr(S);
   Result := S1;
   for I := 1 to Length(S1) do
   begin
      if char(byte(S1[I]) xor (Key shr 8)) = Chr(0) then
         begin
            Result[I] := S1[I];
            Key := (byte(Chr(0)) + Key) * C1 + C2; //保证Key的正确性　　
         end
      else
         begin
            Result[I] := char(byte(S1[I]) xor (Key shr 8));
            Key := (byte(S1[I]) + Key) * C1 + C2;
         end;
   end;
end;
//==========================================     文件路径
function PathWithSlash(const Path: string): string;       //带\符号
begin
 Result := Path;
 if (Length(Result) > 0) and (Result[Length(Result)] <> '\') then Result := Result + '\';
end;

function PathGetSystemPath: string;   //SYSTEM32路径
var
 Buf: array[0..255] of Char;
begin
 GetSystemDirectory(@Buf, 255);
 Result := PathWithSlash(StrPas(@Buf));
end;

function PathGetWindowsPath: string;  //WINDOWS路径
var
 Buf: array[0..255] of Char;
begin
 GetWindowsDirectory(@Buf, 255);
 Result := PathWithSlash(StrPas(@Buf));
end;

function getsyspath:string; //  注:MySysPath为SYSTEM路径
var
MySysPath : PCHAR ;
  begin
  GetMem(MySysPath,255);
  GetSystemDirectory(MySysPath,255);
  result:=PathWithSlash(strpas(mysyspath));
 end;

function getAppPath : string;   //程序目录带\
var
  strTmp : string;
begin
  strTmp :=ExtractFilePath(application.Exename);
  result := PathWithSlash(strTmp);
end;

function GetTempDirectory: String;    //临时目录\
var
TempDir: array[0..255] of Char;
begin
GetTempPath(255, @TempDir);
result:=PathWithSlash(strpas(TempDir));
end; 


//▎============================================================▎//
//▎==================①扩展的字符串操作函数====================▎//
//▎============================================================▎//
 // 判断s1是否包含在s2中
function InStr(const sShort: string; const sLong: string): Boolean;
var
  s1, s2: string;
begin
  s1 := LowerCase(sShort);
  s2 := LowerCase(sLong);
  Result := Pos(s1, s2) > 0;
end;

// 扩展整数转字符串函数，参数分别为目标数、长度、填充字符（默认为０）
function IntToStrEx(Value: Integer; Len: Integer; FillChar: Char = '0'): string;
begin
  Result := IntToStr(Value);
  while Length(Result) < Len do
    Result := FillChar + Result;
end;

// 带分隔符的整数－字符转换
function IntToStrSp(Value: Integer; SpLen: Integer = 3; Sp: Char = ','): string;
var
  s: string;
  i, j: Integer;
begin
  s := IntToStr(Value);
  Result := '';
  j := 0;
  for i := Length(s) downto 1 do
  begin
    Result := s[i] + Result;
    Inc(j);
    try
       if ((j mod SpLen) = 0) and (i <> 1) then
          Result := Sp + Result;
    except
       MessageBox(Application.Handle,' IntToStrSp函数的第二个参数值不能为数字0 ！',SCnError,16);
       exit;
    end
  end;
end;

// 返回字符串右边的字符
function StrRight(Str: string; Len: Integer): string;
begin
  if Len >= Length(Str) then
    Result := Str
  else
    Result := Copy(Str, Length(Str) - Len + 1, Len);
end;

// 返回字符串左边的字符
function StrLeft(Str: string; Len: Integer): string;
begin
  if Len >= Length(Str) then
    Result := Str
  else
    Result := Copy(Str, 1, Len);
end;

// 字节转二进制串
function ByteToBin(Value: Byte): string;
const
  V: Byte = 1;
var
  i: Integer;
begin
  for i := 7 downto 0 do
    if (V shl i) and Value <> 0 then
      Result := Result + '1'
    else
      Result := Result + '0';
end;

// 返回空格串
function Spc(Len: Integer): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to Len - 1 do
    Result := Result + ' ';
end;

// 返回将指定字符s1用字符串s2替换后的字符串，可支持大小写敏感由CaseSensitive操作}
function Replace(Str,s1,s2:string;CaseSensitive:Boolean):string;
var
   i:integer;
   s,t:string;
begin
   s:='';
   t:=str;
   repeat
      if casesensitive then
         i:=pos(s1,t)
      else
         i:=pos(lowercase(s1),lowercase(t));
         if i>0 then
            begin
               s:=s+Copy(t,1,i-1)+s2;
               t:=Copy(t,i+Length(s1),MaxInt);
            end
         else
            s:=s+t;
   until i<=0;
   result:=s;
end;

function Replicate(pcChar:Char; piCount:integer):string;
begin
	Result:='';
	SetLength(Result,piCount);
	fillChar(Pointer(Result)^,piCount,pcChar)
end;

// 返回某个字符串中某个字符串中出现的次数}
function StrNum(ShortStr:string;LongString:string):Integer;     {测试通过}
var
   i:Integer;
begin
   i:=0;
   while pos(ShortStr,LongString)>0 do
      begin
         i:=i+1;
         LongString:=Copy(LongString,(pos(ShortStr,LongString))+1,Length(LongString)-pos(ShortStr,LongString))
      end;
   Result:=i;
end;


{* 返回从psInput字符串左边开始用pcPadWith填充后总长度为PiWidth的字符串}
function PadLStr(psInput:String; piWidth:Integer; pcPadWith:Char):String;
begin
	Result:=Replicate(pcPadWith,piWidth-Length(psInput))+psInput
end;

{* 返回从psInput字符串右边开始用pcPadWith填充后总长度为PiWidth的字符串}
function PadRStr(psInput:String; piWidth:Integer; pcPadWith:Char):String;
begin
	Result:=psInput+Replicate(pcPadWith,piWidth-Length(psInput))
end;

{* 返回从psInput字符串两边开始用pcPadWith填充后总长度为PiWidth的字符串}
function PadCStr(psInput:String; piWidth:Integer; pcPadWith:Char):String;
var
	liHalf :integer;
begin
	liHalf:=(piWidth-Length(psInput))div 2;
	Result:=Replicate(pcPadWith,liHalf)+psInput+Replicate(pcPadWith,piWidth-Length(psInput)-liHalf)
end;

{* 返回替换后字符串 Examples: ChrTran('abCdEgdlkh','d','#')； 返回'bC#Eg#lkh'}
function ChrTran(psInput:String; pcSearch:Char; pcTranWith:Char):String;
var
	i,j:integer;
begin
	j:=Length(psInput);
	for i:=1 to j do
  begin
		if psInput[i]=pcSearch then
			psInput[i]:=pcTranWith
  end;
	Result:=psInput
end;

{* 返回替换后字符串 Examples: StrTran('aruyfbn','ruy','====='); 返回'a=====fbn'}
function StrTran(psInput:String; psSearch:String; psTranWith:String):String;
var
	liPosition,liLenOfSrch,liLenOfIn:integer;
begin
	liPosition:=Pos(psSearch,psInput);
	liLenOfSrch:=Length(psSearch);
	liLenOfIn:=Length(psInput);
	while liPosition>0 do
	begin
		psInput:=Copy(psInput,1,liPosition-1)
			+psTranWith
      +Copy(psInput,liPosition+liLenOfSrch,liLenOfIn);
		liPosition:=Pos(psSearch,psInput)
	end;
	Result:=psInput
end;

{ *返回替换后字符串[替换字符串] Examples: Stuff('ABCDEFGHI',3,4,'12345')；返回'AB12345GHI'}
function Stuff(psInput:String; piBeginPlace,piCount:Integer; psStuffWith:String):String;
begin
	Result:=Copy(psInput,1,piBeginPlace-1)+
		psStuffWith+
    Copy(psInput,piBeginPlace+piCount,Length(psInput))
end;


{功能说明：判断string是否全是数字}
function IsDigital(Value: string): boolean;
var
  i, j: integer;
  str: char;
begin
  result := true;
  Value := trim(Value);
  j := Length(Value);
  if j = 0 then
  begin
    result := false;
    exit;
  end;
  for i := 1 to j do
  begin
    str := Value[i];
    if not (str in ['0'..'9']) then
    begin
      result := false;
      exit;
    end;
  end;
end;

{随机字符串函数}
function RandomStr(aLength : Longint) : String;
var
  X : Longint;
begin
  if aLength <= 0 then exit;
  SetLength(Result, aLength);
  for X:=1 to aLength do
    Result[X] := Chr(Random(26) + 65);
end;


//=============================================

function tx(i: integer): string;
begin
 case i of
 0:RESULT:='一';
 1:RESULT:='二';
 2:result:='三';
 3:result:='四';
 4:result:='五';
 5:result:='六';
 6:result:='七';
 7:result:='八';
 8:result:='九';
 9:result:='十';
  ELSE
   result:='太多了';
 end;

end;


function deleleftdigital(str:string;partstr:string):string;
var
  i,j:integer  ;
  s:string;
begin
  
  j:=Length(partstr);

  i:=pos(partstr,str);
  s:=StrLeft(str,i-1);

  if IsDigital(s) then
  begin
    if j=1 then delete(str,1,i)
    else
    Delete(str,1,i+j-1)
  end;
  result:=trim(str);
end;


function deleleftdot(str:string):string; //删除行首点号
var
  I:integer  ;
  s:string;
begin
  str:=Trim(str);
  i:=pos('.',str);
  s:=StrLeft(str,i-1);

  if IsDigital(s) then delete(str,1,i);
  result:=trim(str);
end;

function deleleftdun(str:string):string;    //删除行首顿号
var
  I:integer  ;
  s:string;
begin
  str:=Trim(str);
  i:=pos('、',str);
  s:=StrLeft(str,i-1);

  if IsDigital(s) then delete(str,1,i+1);  // 顿号是2个字节
  result:=trim(str);
end;

 //字符串处理,分成单个字,没有乱码
procedure TxttoWords(const S: string; words: TstringList);
var
  j:Integer ;
  sCuted{ 按固定长度分割出来的部分字符串 }: string;
  iCutLength{ 按固定长度分割出来的部分字符串的长度 }: integer;
  bIsDBCS{ 是否是汉字的前半字节 }: boolean;
  sline:string;
begin
  sline:=s;
  if Length(sline)=0 then words.Add(#13#10)
  else
  repeat ;
  iCutLength :=2;
  sCuted :=Copy(sline,1,iCutLength );
  bIsDBCS:=False ;
  for j:=1 to icutlength do
    begin
      if bIsDBCS then
        bIsDBCS :=False
        else
          if Windows.IsDBCSLeadByte(Byte(sCuted[j])) then
            bIsDBCS :=True;

    end; //end of for

    if bIsDBCS then Dec(iCutLength);
    if Copy(sline,1,iCutLength)<>#13#10 then   //去除回车
    words.Add(Copy(sline,1,iCutLength));
    sline :=Copy(sline,iCutLength +1,Length(sline )-icutlength);
    until Length (sline)<=0 ;
end;

function replacing(S,source,target:string):string;    //完全去除
var
  site,StrLen:integer;
begin
  {source在S中出现的位置}
  site:=pos(source,s);
  {source的长度}
  StrLen:=length(source);
  {删除source字符串}
  delete(s,site,StrLen);
  {插入target字符串到S中}
  insert(target,s,site);
 {返回新串}

 site:=pos(source,s);
  IF site >0 then
      S:=replacing(S,source,target) ;
  Result :=S;
end;

 function balancerate(source,target:string;pdxz:Boolean):Real;
 var
   str1,str2:string;
   sourcelist,targetlist: TstringList;
   i,df:Integer;
   Temstr:string;
   maxcount:Integer ;
 begin
   source :=Trim(source);    //去除前后空格
   target :=Trim(target);

   if Trim(source)=Trim(target ) then    //   如果相等就对了
      begin
        Result :=1;
        Exit;
      end;

   source:=replacing(source,'，',''); //去除逗号
   source:=replacing(source,',','');  //去除半角，
   source:=replacing(source,'。',''); //去除句号
   source:=replacing(source,'？',''); //去除问号
   source:=replacing(source,'：',''); //去除：
   source:=replacing(source,':','');  //去除半角:
   source:=replacing(source,';','');  //去除分号
   source:=replacing(source,'；','');  //去除半角分号
   source:=replacing(source,' ','');  //去除空格
   source:=replacing(source,'《','');  //去除书引号
   source:=replacing(source,'》','');  //去除书引号

//=======================
   target:=replacing(target,'，',''); //去除逗号
   target:=replacing(target,',','');  //去除半角，
   target:=replacing(target,'。',''); //去除句号
   target:=replacing(target,'？',''); //去除问号
   target:=replacing(target,'：',''); //去除：
   target:=replacing(target,':','');  //去除半角:
   target:=replacing(target,';','');  //去除分号
   target:=replacing(target,'；','');  //去除半角分号
   target:=replacing(target,' ','');  //去除空格
   target:=replacing(target,'《','');  //去除书引号
   target:=replacing(target,'》','');  //去除书引号

 
    if Trim(source)=Trim(target ) then    //   去除符号后如果相等就对了
      begin
        Result :=1;
        Exit;
      end;

     df :=0;
     
  if pdxz then  //if is 判断\选择题则
    begin
      target:=replacing(target,'.','');  //去除.
      source:=replacing(source,'.','');  //去除.

        // source代表答案,targe代表答的答题
       if Length(target)>Length(source) then
        begin
          Result :=0 ; //多选不得分;
          Exit;
        end;

      str2:=target;
        for i:=1 to Length(source) do
          begin
            str1:=Copy(source,i,1) ;
            if InStr(str1,str2) then
            df:=df+1;  //计算对的个数
          end;

      Result :=df/length(source);
   
     end//如果不是判断/选择题
     else
     begin
       sourcelist :=TStringList.Create ;
       targetlist :=TStringList.Create ;
       TxttoWords(source,sourcelist);
       TxttoWords(target,targetlist);

        if sourcelist.Count >targetlist.Count then
        maxcount :=sourcelist.Count
        else
        maxcount :=targetlist.Count ;//最大值


       str2 :=target ;
       for i:=0 to sourcelist.Count -2 do
         begin
           Temstr:=sourcelist.Strings[i+1];
           str1:=sourcelist.Strings[i]+temstr;
           if InStr(str1,str2) then
              df:=df+1;
         end;

       if df>0 then df:=df+1;
       Result :=df/maxcount;        //输出结果
       // Result :=df/sourcelist.count;
      sourcelist.Free ;  //清除内存
      targetlist.Free ;
     end;

end;



//=========================
function IsForm(FormClass: TFormClass) : boolean; //判断指定窗口存在没有
var
i : integer;
begin
result := False;
for i := 0 to screen.FormCount -1 do
begin
if (screen.Forms[i].ClassType = formClass) then
begin
result := True;
Break;
end;
end;
end;

function isapprun(str:string):boolean; //判断指定程序运行没有
var
HWndCalculator : HWnd;
begin
result:=false;

HWndCalculator := FindWindow(nil, pchar(str));
if HWndCalculator <> 0 then
    result:=true;

end;

function CloseApp(ClassName: String): Boolean;
//关闭外部应用程序
var Exehandle: THandle;
begin
  //ExeHandle := FindWindow(nil, Pchar(Caption));
  ExeHandle := FindWindow(Pchar(ClassName),nil);
  if ExeHandle <> 0
  then
   begin
     PostMessage(ExeHandle, WM_Quit, 0, 0);
     Result:=True;
   end
  else
   begin
     Result:=False;
   end;
end;


{* 获取计算机的IP地址}
function GetHostIP:string;
var
   wVersionRequested : WORD;
   wsaData : TWSAData;
   p : PHostEnt; s : array[0..128] of char; p2 : pchar;
begin
   try
      wVersionRequested := MAKEWORD(1, 1); //创建 WinSock
      WSAStartup(wVersionRequested, wsaData); //创建 WinSock
      GetHostName(@s,128);
      p:=GetHostByName(@s);
      p2 := iNet_ntoa(PInAddr(p^.h_addr_list^)^);
      Result:= P2;
   finally
      WSACleanup; //释放 WinSock
   end;
end;

 {* 获取网络计算机名称}
function GetComputerName:string;
var
   wVersionRequested : WORD;
   wsaData : TWSAData;
   p : PHostEnt; s : array[0..128] of char;
begin
   try
      wVersionRequested := MAKEWORD(1, 1); //创建 WinSock
      WSAStartup(wVersionRequested, wsaData); //创建 WinSock
      GetHostName(@s,128);
      p:=GetHostByName(@s);
      Result:=p^.h_Name;
   finally
      WSACleanup; //释放 WinSock
   end;
end;

//*获取当前Windows登录名的用户
function GetCurrentUserName : string;
const
   cnMaxUserNameLen = 254;
var
   sUserName : string;
   dwUserNameLen : Dword;
begin
   dwUserNameLen := cnMaxUserNameLen-1;
   SetLength( sUserName, cnMaxUserNameLen );
   GetUserName(Pchar( sUserName ), dwUserNameLen );
   SetLength( sUserName, dwUserNameLen );
   Result := sUserName;
end;

//===================================时间处理
function TimeToSecond(const H, M, S: Integer): Integer;
begin
Result := H * 3600 + M * 60 + S;
end;

function TimeSecondToTime(const secs: Integer):string;
var
  H, M, S: Word;
begin
H := secs div 3600;
M := (secs mod 3600) div 60;
S := secs mod 60;

Result :=format('%-.2d', [h])+'：'+format('%-.2d', [m])+ '：'+format('%-.2d', [s]);

end; 


function CONNECTWORD: Boolean;
var
  template:OleVariant ;
  newtemplate:OleVariant ;
  docutype:OleVariant ;
  visible:OleVariant ;

begin
  template:=EmptyParam ;
 // newtemplate :=TRUE;  //模板式
  //docutype:=0;   //模板式
   newtemplate :=False;
   docutype :=wdNewBlankDocument ;    //文档式
   visible :=True;
  try
   begin
    MSWord := CreateOLEObject('Word.Application');//连接Word
    msword.visible:=True;
    msword.Documents.Add(template,newtemplate,docutype ,visible );
    Result:=True;
    END;
  except
    begin
     application.MessageBox('Word文档连接失败','提示',MB_OK+  MB_ICONEXCLAMATION);
     Result :=False ;
     END;
  END;
end;


procedure addstrtoword(text:string;align:Boolean;fontname:WideString;fontsize:integer);
begin
  MSWord.Selection.Font.Size:=fontsize ;
  MSWord.Selection.Font.Name := fontname ;
  if  align then
  MSWord.Selection.ParagraphFormat.Alignment:= wdAlignParagraphCenter
  else
   BEGIN
   MSWord.Selection.ParagraphFormat.Alignment:= wdAlignParagraphLEFT;
   MSWord.Selection.ParagraphFormat.FirstLineIndent:=30;
   end;

  MSWord.Selection.TypeText(text);
  MSWord.Selection.TypeParagraph;
end;

procedure Addbmptoword(str:string );
begin  //str:图片绝对路径;
    msword.Selection.InlineShapes.AddPicture(str,False, True);
end;
{s:加入的字符;FONTNAME:字体名称,FONTSIZE:字体大小;ALIGENM:对齐方式0为左2为中1为右,RICHEDIT为加入对象的载体}

procedure addstrtorich(s, fontname: string; fontsize,alimen: Integer; Richedit: TRichEdit);
begin
  try
    Richedit.Lines.Add(s) ;
    Richedit.SelLength :=-length(s)-2;
    Richedit.SelAttributes.Size :=fontsize ;
    Richedit.SelAttributes.Name :=fontname ;
    Richedit.Paragraph.Alignment :=talignment(alimen) ;
  //  Richedit.SelStart:=Length(Richedit.Lines.Text);
  except
    Exit ;
  END;  
end;

//读取皮肤文件========================================================
function readskinfile(keyname:string):string;
var
 IniFileName:string;
 inifile:TInifile;
 str:string;
 ML:string;
 
begin
  ml:= getapppath+'ini';
  if Not DirectoryExists(ml) then CreateDir(ml);

  IniFileName:=getapppath+'ini\skin.ini';
  inifile:=TInifile.Create(IniFileName);
  str:=inifile.ReadString(Keyname,'skinfiles','');
  inifile.Free;

  Result :=str;

end;

procedure writeskinfile(keyname,filename:string);
var
  inifile:TInifile;
  IniFileName:string;
  ML:string;

begin
  ml:= getapppath+'ini';
  if Not DirectoryExists(ml) then CreateDir(ml);

  IniFileName:=GETAPPPath+'ini\Skin.ini';
  inifile:=TInifile.Create(IniFileName);
    try
       inifile.WriteString(keyname,'skinfiles',filename);
    finally
      inifile.Free;
    end;
end;

{ 
功能：安全的复制文件 
srcFile，destFile：源文件和目标文件 
bDelDest：如果目标文件已经存在，是否覆盖 
返回值：true成功，false失败 
} 
function shFileCopy(srcFile,destFile:String;bDelDest:boolean=true):boolean; 
begin
  result:=false;
  if not FileExists(srcFile) then
  begin
    Application.MessageBox ('源文件不存在，不能复制','提示',MB_OK+MB_ICONEXCLAMATION);
    exit;
  end;

  if srcFile=destFile then
  begin
    Application.MessageBox ('源文件和目标文件相同，不能复制','提示',MB_OK+MB_ICONEXCLAMATION);
    exit;
  end;
  
  if FileExists(destFile) then
  begin
  if not bDelDest then
      begin
       Application.MessageBox ('目标文件已经存在，不能复制','提示',MB_OK+MB_ICONEXCLAMATION);
       exit;
       end
  else
  begin
    if Application.MessageBox('目标文件己存在,要覆盖吗?','提示',MB_OK+MB_ICONQUESTION)=IDOK then
    begin
      FileSetAttr(destFile,FileGetAttr(destFile) and not $00000001);
      
      if not DeleteFile(PChar(destFile)) then
      begin
        Application.MessageBox ('目标文件已经存在，并且不能被删除，复制失败','提示',MB_OK+MB_ICONEXCLAMATION);
        exit;
      end;
    END;
  END;
  end; //END IF FILEEXISTS
     if not CopyFile(PChar(srcFile),PChar(destFile),False ) then     //COPY
     begin
       Application.MessageBox ('发生未知的错误，复制文件失败','提示',MB_OK+MB_ICONEXCLAMATION);
       exit;
     end;
//目标文件去掉只读属性 
    FileSetAttr(destFile,FileGetAttr(destFile) and not $00000001);
    result:=true;
end;

procedure loadpicture(str:string;var image:TImage);
var
 ms: tmemorystream;
 mJPeg: TJPegImage;
 sType:String ;
begin
   sType:=ExtractFileExt(str) ;
   ms:=TMemoryStream.Create ;
   mJpeg:=TJpegImage.Create ;
    Try
     ms.LoadFromFile(str ) ;
     ms.Position:=0 ;
    If (UpperCase(sType)='.JPEG') or (UpperCase(sType)='.JPG') Then
      Begin
        mJpeg.LoadFromStream(ms) ;    //把JPG流引入
        Image.Picture.Bitmap.Assign(mJpeg) ;
     End
     Else
      if UpperCase(sType)='.BMP' then
        Image.Picture.Bitmap.LoadFromStream(ms) ;    //引入BMP流
   Finally
   ms.Free ;
   mJpeg.Free ;
   End ;
 
End ;

//======================   目录操作
procedure DelTree(DirName:String); 
var 
hFindFile:Cardinal; 
FileName: String; 
FindFileData:WIN32_FIND_DATA; 
begin 
if DirName[Length(DirName)]<>'\' then 
  DirName:= DirName + '\'; 
hFindFile:= FindFirstFile(PChar(DirName + '*.*'), FindFileData); 
if hFindFile <> INVALID_HANDLE_VALUE then 
begin 
  repeat 
   FileName:= FindFileData.cFileName; 
   if (FileName <> '.') and (FileName <> '..') then 
   begin 
    if (FindFileData.dwFileAttributes = FILE_ATTRIBUTE_DIRECTORY) then 
     DelTree(DirName + FileName) 
    else 
     DeleteFile(PChar(DirName + FileName)); 
   end; 
  until FindNextFile(hFindFile, FindFileData) = false; 
  Windows.FindClose(hFindFile); 
  RmDir(DirName); 
end; 
end;   

function EmptyDirectory(TheDirectory :String ; Recursive : Boolean):Boolean;
var
SearchRec : TSearchRec; 
Res : Integer; 
begin 
Result := False; 
TheDirectory := Trim(TheDirectory);
Res := FindFirst(TheDirectory + '*.*', faAnyFile, SearchRec); 
try 
while Res = 0 do 
begin 
if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then 
begin 
if ((SearchRec.Attr and faDirectory) > 0) and Recursive 
then begin 
EmptyDirectory(TheDirectory + SearchRec.Name, True); 
RemoveDirectory(PChar(TheDirectory + SearchRec.Name)); 
end 
else begin 
DeleteFile(PChar(TheDirectory + SearchRec.Name)) 
end; 
end; 
Res := FindNext(SearchRec); 
end;
Result := True;
finally
FindClose(SearchRec);
//FindClose(SearchRec.FindHandle);
end;
end;

procedure creatdesktoplink(Linkname:string);
var
 tmpObject: IUnknown;
 tmpSLink: IShellLink;
 tmpPFile: IPersistFile;
 PIDL: PItemIDList;
 StartupDirectory: array[0..MAX_PATH] of Char;
 StartupFilename: string;
 LinkFilename: WideString;
 Tempstr:string ;
begin
 //StartupFilename := ExtractFilePath(Application.ExeName) + 'xlxt.exe';
 StartupFilename :=Application.ExeName;

 if not FileExists(StartupFilename) then Exit;
 tmpObject := CreateComObject(CLSID_ShellLink);
 tmpSLink := tmpObject as IShellLink;
 tmpPFile := tmpObject as IPersistFile;
 tmpSLink.SetPath(pChar(StartupFilename));
 tmpSLink.SetWorkingDirectory(pChar(ExtractFilePath(StartupFilename)));
 SHGetSpecialFolderLocation(0,CSIDL_DESKTOPDIRECTORY,PIDL);
 SHGetPathFromIDList(PIDL,StartupDirectory);

 Tempstr :='\'+ Linkname+'.lnk' ;

 LinkFilename := StartupDirectory + Tempstr ;
 

 if FileExists(LinkFileName) then

  begin
  application.MessageBox('快捷方式己存在,不能重复建立','提示',MB_OK+  MB_ICONEXCLAMATION);
  Exit;
  end
  else
  begin
   tmpPFile.Save(pWChar(LinkFilename), FALSE);
   application.MessageBox('快捷方式己建立','提示',MB_OK+MB_ICONinformation);
  END;
end;



function setadoaccess(mdbpath:string;passwd:string):string;
Const
  SConnectionString       = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s;'
                                +'Jet OLEDB:Database Password=%s;';
begin
  mdbpath:=trim(mdbpath);
  passwd:=trim(passwd);
  result:=format(SConnectionString,[mdbpath,passwd]);
end;




end.
