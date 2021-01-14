unit BCore;

interface
  Uses SysUtils,BLibrary,Aes,StringsUnit,DecryptCore,IniFiles,Dialogs;
  Function Decrypt(FileName,PW,DiskPW,Path:String):Boolean;
  Function Encrypt(FileName,PW,DiskPW,SaveFile:String):Boolean;
implementation

Function Encrypt;   {核心:加密}
var
  Temp:string;
  F:Tinifile;
begin
  Temp:=NewTemp;
{*密码加密}
  if RunCore2('E',FileName,Temp+ExtractFileName(FileName),PW) then
  Begin
  {如果DiskPW不为空}
  if (DiskPW<>'')and(GetIdeSerialNumber<>'') then
  RunCore('E',Temp+ExtractFileName(FileName),DiskPW);

  F:=Tinifile.Create(Temp+INIFileName);
  F.WriteInteger('Pack','Versoin',PackVersoin);
  If (DiskPW<>'') then begin
  F.WriteBool('Pack','DiskEncrypt',true);
  F.WriteString('PassWord','PW',EncryptString(DiskPW,EncryptString(PW,PassWordC,KB256),KB256));
  end else begin
  F.WriteBool('Pack','DiskEncrypt',False);
  F.WriteString('PassWord','PW',EncryptString(PW,PassWordC,KB256));
  end end else begin Result:=false; exit; end;

    // Messagebox(0,pchar('硬盘指纹启动失败，未知的错误!'),pchar('错误!'),MB_OK+MB_DEFBUTTON1+MB_APPLMODAL+MB_ICONError);
    {***end}
   {无法取得硬盘ID}
  // begin Messagebox(0,pchar('无法取得硬盘指纹!'),pchar('错误!'),MB_OK+MB_DEFBUTTON1+MB_APPLMODAL+MB_ICONError);
 //  Result:=False; Exit;
 //  end;
   {*end}
   {打包}
   ZipFile(Temp,SaveFile+'.BSE',True,True,GKey);
   Result:=True;
end;
Function Decrypt;
Var
  Temp:String;
  F:TiniFile;
begin
  {多解密引擎启动接口,主要为兼容旧档案构造}
  Temp:=NewTemp;
  UnZipFile(Temp,FileName,GKey);
  {如果找不到配置文件}
  {读配置文件}
  F:=Tinifile.Create(Temp+INIFileName);
  If FileExists(Temp+INIFileName)=False
  then ShowBox('档案被损坏或档案构造太旧~','错误');
  Case F.ReadInteger('Pack','Versoin',0) of
  5:begin
//  ShowMessage('执行监测一');
  Result:=Decrypt5(Temp,PW,DiskPW,Path);
  end;
  else ShowBox('档案被损坏或档案构造太旧~','错误');
  end;
end;
end.
