unit rmb;

interface

function NumToUpper(const num:real):string;

implementation
uses SysUtils;

function NumToUpper(const num:real):string;
var aa,bb,cc:string;
    bbb:array[1..16]of string;
    uppna:array[0..9] of string;
    i:integer;
begin

    bbb[1]:='Íò';
   bbb[2]:='Çª';
   bbb[3]:='°Û';
   bbb[4]:='Ê°';
  bbb[5]:='ÒÚ';;
  bbb[6]:='Çª';;
  bbb[7]:='°Û';
  bbb[8]:='Ê°';
  bbb[9]:='Íò';
  bbb[10]:='Çª';
  bbb[11]:='°Û';
  bbb[12]:='Ê°';
  bbb[13]:='Ôª';
 bbb[14]:='.';
  bbb[15]:='½Ç';
 bbb[16]:='·Ö';
  uppna[1]:='Ò¼';
  uppna[2]:='·¡';
  uppna[3]:='Èþ';
  uppna[4]:='ËÁ';
  uppna[5]:='Îé';
  uppna[6]:='Â½';
  uppna[7]:='Æâ';
  uppna[8]:='°Æ';
  uppna[9]:='¾Á';
  Str(num:16:2,aa);
  cc:='';
  bb:='';
  result:='';
  for i:=1 to 16 do
    begin
      cc:=aa[i];
      if cc<>' ' then
        begin
         bb:=bbb[i];
          if cc='0' then
            cc:='Áã'
          else
            begin
              if cc='.' then
                begin
                  cc:='';
                  bb:='';
                end
              else
                begin
                  cc:=uppna[StrToInt(cc)];
                end
            end;
          result:=result+(cc+bb)
        end;
    end;
  result:=result+'Õý';
end;

end.