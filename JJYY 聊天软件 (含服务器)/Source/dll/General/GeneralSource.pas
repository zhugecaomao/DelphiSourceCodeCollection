unit GeneralSource;

interface

uses
  SysUtils,
  Classes;

type
  Ps=array of Pchar;
  PPs=^Ps;

  TUserInfo=Record
    UserName:Pchar;
    Logined:Pchar;
    Sex:Pchar;
    Handle:Pchar;
    ID:Pchar;
  end;

  AUserInfo=array of TUserInfo;
  PUserInfo=^AUserInfo;

function GetSession(Str:Pchar;Count:integer;separator:char=#255):PPs;stdcall;
function GetUserInfo(AUserName,ALogined,ASex,AHandle,AID:Pchar):PUserInfo;stdcall;

implementation

function GetSession(Str:Pchar;Count:integer;separator:char=#255):PPs;stdcall;
var
  s:PPs;
  i,j,iPos:integer;
begin
  new(s);
  setlength(s^,Count+1);
  j:=0;

  ipos:=-1;
  for i:=0 to strlen(Str)-1 do
    if Str[i]=separator then
    begin
      inc(iPos);
      GetMem(s^[j],i-iPos+1);
      StrPCopy(s^[j],copy(StrPas(Str),iPos+1,i-iPos));
      iPos:=i;
      inc(j);
      if j=Count then Break;
    end;

  GetMem(s^[j],integer(Strlen(Str))-iPos+1);
  StrPCopy(s^[j],copy(Str,iPos+2,integer(Strlen(Str))-iPos-1));

  Result:=s;
end;

function GetUserInfo(AUserName,ALogined,ASex,AHandle,AID:Pchar):PUserInfo;stdcall;
var
  UserName:TStrings;
  Logined:TStrings;
  Sex:TStrings;
  Handle:TStrings;
  ID:TStrings;
  UserInfo:PUserInfo;
  i:integer;
begin
  new(UserInfo);
  UserName:=TStringList.Create ;
  Logined:=TStringList.Create ;
  Sex:=TStringList.Create ;
  Handle:=TStringList.Create ;
  ID:=TStringList.Create ;

  try
    UserName.Text:=AUserName;
    Logined.Text:=ALogined;
    Sex.Text:=ASex;
    Handle.Text:=AHandle;
    ID.Text :=AID;

    if UserName.Count>0 then
    begin
      SetLength(UserInfo^,UserName.Count);
      for i:=0 to UserName.Count-1 do
      begin
        GetMem(UserInfo^[i].UserName,length(UserName.Strings[i])+1);
        GetMem(UserInfo^[i].Logined,length(Logined.Strings[i])+1);
        GetMem(UserInfo^[i].Sex,length(Sex.Strings[i])+1);
        GetMem(UserInfo^[i].Handle,length(Handle.Strings[i])+1);
        GetMem(UserInfo^[i].ID,length(ID.Strings[i])+1);

        StrpCopy(UserInfo^[i].UserName,UserName.Strings[i]);
        StrpCopy(UserInfo^[i].Logined,Logined.Strings[i]);
        StrpCopy(UserInfo^[i].Sex,Sex.Strings[i]);
        StrpCopy(UserInfo^[i].Handle,Handle.Strings[i]);
        StrpCopy(UserInfo^[i].ID,ID.Strings[i]);
      end;
    end;
  finally
    UserName.Free ;
    Logined.Free;
    Sex.Free;
    Handle.Free;
    ID.Free ;
  end;

  Result:=UserInfo;
end;

end.
