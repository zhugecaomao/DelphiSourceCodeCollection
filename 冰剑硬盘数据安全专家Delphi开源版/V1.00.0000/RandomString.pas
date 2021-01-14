unit RandomString;

interface
uses
  Windows,SysUtils,Classes;
function GetRandomString:string;
function GetTempDir: string;
implementation
function GetRandomString;
{max length of generated password} 
const
   intMAX_PW_LEN = 10; 
var 
   i: Byte; 
   s: string; 
begin
  s:='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  Result := '';
  for i := 0 to intMAX_PW_LEN-1 do
    Result := Result + s[Random(Length(s)-1)+1];
end;



function GetTempDir;
var
  Buffer: array[0..MAX_PATH] of Char;
begin
  GetTempPath(SizeOf(Buffer) - 1, Buffer);
  Result := StrPas(Buffer);
end;
initialization
   Randomize;
end.
 