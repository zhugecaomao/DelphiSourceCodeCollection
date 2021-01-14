unit Core;

interface
uses
  Forms,Classes,SysUtils,Dialogs,Windows,ZipEngine,Aes,RandomString,Core_InterFace,StringsUnit;
Procedure Encrity(FileName,PassWord,Save:string);
Procedure Decrity(FileName,PassWord,Path:string);
implementation
  uses BSecurityUnit;
Function NewTemp:String;
begin
  result:=GetTempDir+GetRandomString+'\';
  MkDir(result);
end;

Procedure Encrity;
var
  Temp:string;
begin
   Temp:=NewTemp;
   //Showmessage('Core.exe E '+'"'+FileName+'"'+' '+'"'+Temp+ExtractFileName(FileName)+'"'+' "'+PassWord+'"');
   if ExecAppWait(ExtractFilePath(Application.ExeName)+'Core.exe',' E '+'"'+FileName+'"'+' '+'"'+Temp+ExtractFileName(FileName)+'"'+' "'+PassWord+'"')
   then ZipFile(Temp,Save+'.BSE',True,True,EncryptString(GKey+PassWord,PassWord))
end;
Procedure Decrity;
var
  Temp,YFile:string;
  A:String;
  I:longint;

begin
  Temp:=NewTemp;
  UnZipFile(Temp,FileName,EncryptString(GKey+PassWord,PassWord));
 // showmessage(Temp);
  Form1.FileListBox.FileName:=temp;
  if Form1.FileListBox.Items.Count<>0 then
  for i:=0 to Form1.FileListBox.Items.Count-1 do
  begin
    A:=Form1.FileListBox.Items.strings[i];
    ExtractFileName(ChangeFileExt(A,''));
  //  showmessage(ExtractFilePath(Application.ExeName)+'Core.exe'+' D '+'"'+Temp+Form1.FileListBox.Items.Strings[i]+'"'+' '+'"'+Path+A+'"'+' "'+PassWord+'"');
    YFile:='"'+Temp+Form1.FileListBox.Items.Strings[i]+'"';
    ExecAppWait(ExtractFilePath(Application.ExeName)+'Core.exe',' D '+YFile+' '+'"'+Path+'\'+A+'"'+' "'+PassWord+'"');
 // MSBOX(S_Decrity_Core_End);
  end else
  begin
    Messagebox(0,pchar('√‹¬Î¥ÌŒÛªÚµµ∞∏±ªÀªµ£¨«Î÷ÿ ‘!'),pchar('¥ÌŒÛ!'),MB_OK+MB_DEFBUTTON1+MB_APPLMODAL+MB_ICONError);
  end;
end;
end.
