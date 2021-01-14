unit GeneralInf;

interface

uses
  ScktComp;

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

function GetSession(Str:Pchar;Count:integer;separator:char=#255):PPs;stdcall;external 'General.dll';
//function GetUserInfo(AUserName,ALogined,ASex,AHandle,AID:Pchar):AUserInfo;stdcall;external 'General.dll';

implementation

end.
