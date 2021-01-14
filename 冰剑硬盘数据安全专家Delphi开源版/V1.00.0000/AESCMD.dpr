program aescmd;

//{$APPTYPE CONSOLE}

uses
  SysUtils,AES;
const
  GKEY='#SYC$';
  KB=KB256;
begin
  { TODO -oUser -cConsole Main : Insert code here }
  if Paramcount>1 then begin
  if (Paramstr(1)='E')or(Paramstr(1)='e') then
      if Paramcount=4 then
      if FileExists(Paramstr(2)) then
         EncryptFile(Paramstr(2),Paramstr(3),Paramstr(4)+GKEY,KB256);
   if (Paramstr(1)='D')or(Paramstr(1)='d') then
      if FileExists(Paramstr(2)) then
      if Paramcount=4 then
         DecryptFile(Paramstr(2),Paramstr(3),Paramstr(4)+GKEY,KB256);
           end;
end.
