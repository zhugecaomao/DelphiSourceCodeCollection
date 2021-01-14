unit ConfigCreate;

interface
uses
  SysUtils,IniFiles,StringsUnit,Dialogs;
  Function WriteConfig(FileName:string;DiskEncrypt:boolean):boolean;
  Function ReadConfig(FileName:string;Var PackVersoin:integer;DiskEncrypt:boolean):Boolean;
implementation
Function WriteConfig;
var
  f:Tinifile;
begin
  f:=Tinifile.Create(FileName);
  F.WriteInteger('Pack','Versoin',PackVersoin);
  F.WriteBool('Pack','DiskEncrypt',DiskEncrypt);
  F.Destroy;
  if FileExists(FileName) then result:=true else result:=false;
end;


Function ReadConfig;
var
  f:Tinifile;
begin
  if FileExists(FileName) then Begin
  f:=Tinifile.Create(FileName);
  PackVersoin:=F.ReadInteger('Pack','Versoin',0);
  DiskEncrypt:=F.ReadBool('Pack','DiskEncrypt',false);
 // ShowMessage(FileName+inttostr(PackVersoin));
  result:=true;
  end else result:=false;
  if (PackVersoin=0) then result:=False;
end;
end.
 