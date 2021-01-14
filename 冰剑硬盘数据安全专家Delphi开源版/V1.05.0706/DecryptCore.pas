unit DecryptCore;
{
解密核心组
v1.0 2007/7/5
}
interface
  Uses
    StringsUnit,BLibrary,Aes,IniFiles,Dialogs;
  Function Decrypt5(BSETempPath,PassWord,DPassWord,Path:String):Boolean;
implementation
uses
  BSecurityUnit;
Function Decrypt5;
var
  A,SFile,CPassWord{验证密码字符串}:string;
  I:Longint;
  F:Tinifile;
begin
  F:=Tinifile.Create(BSETempPath+INIFileName);
  {密码验证}
  if F.ReadBool('Pack','DiskEncrypt',False)=False
  then DPassWord:='';
  if (DPassWord='') then  {是否启动硬盘加密}
  CPassWord:=EncryptString(PassWord,PassWordC,KB256) else {构建密码验证字符串}
  CPassWord:=EncryptString(DPassWord,EncryptString(PassWord,PassWordC,KB256),KB256);

  If CPassWord<>F.ReadString('PassWord','PW','No') then
  begin
  ShowBox('密码错误，请重试!','错误');
  Result:=false;
  Exit;
  end;
  {验证结束}
  Form1.FileListBox.FileName:=BSETempPath;
  if Form1.FileListBox.Items.Count<>0 then
  for i:=0 to Form1.FileListBox.Items.Count-1 do
  begin
    A:=Form1.FileListBox.Items.strings[i];
    if Form1.FileListBox.Items.Strings[i]<>(INIFileName){配置文件路径}   {如果不是配置文件}
    then Begin {硬盘解密}
    SFile:=BSETempPath+Form1.FileListBox.Items.Strings[i];
    if (DPassWord<>'') then
    RunCore('D',SFile,DPassWord);
    RunCore2('D',SFile,Path+'\'+A,PassWord);
    end;
  end;
  Result:=True;
End;
end.
