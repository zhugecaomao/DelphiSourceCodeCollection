unit IcCardDefine;

interface

uses
  SysUtils, Classes, DB, DBTables, StdCtrls, DBCtrls;


var
  IcDev : Longint;
  OutBuf: PChar;
  InBuf : string;

procedure InitStatus(CommPort: Integer);
procedure ExitComm;
function IsCardExists: Boolean;
function CheckPass: Boolean;
procedure ICDown;

implementation

uses drv_unit;

procedure ICDown;
var
  st: SmallInt;
begin
  st := IC_Down(IcDev);
  if st<>0 then
    raise Exception.Create('œ¬µÁ ß∞‹£°');
end;

function CheckPass: Boolean;
var
  st: SmallInt;
begin
  InBuf := 'FFFFFF';
  st := IC_CheckPass_4442hex(IcDev,PChar(InBuf));
  if st <> 0 then
    Result := False
  else
    Result := True;
end;

procedure InitStatus(CommPort: Integer);
var
  st: SmallInt;
begin
  IcDev := IC_InitComm(CommPort);
  if IcDev < 0 then
    raise Exception.Create('≥ı ºªØ¥Æø⁄ ß∞‹£°');
  st := IC_Status(IcDev);
  if st < 0 then
    raise Exception.Create('∂¡–¥∆˜¥Ê‘⁄¥ÌŒÛ£°');
  if st <> 1 then
  begin
    st := IC_InitType(IcDev,16); //4442
    if st <> 0 then
      raise Exception.Create('ICø®¿‡–Õ¥ÌŒÛ£°');
  end;
end;

function IsCardExists: Boolean;
var
  st: SmallInt;
begin
  st := IC_Status(IcDev);
  if st < 0 then
    raise Exception.Create('∂¡–¥∆˜¥Ê‘⁄¥ÌŒÛ£°');
  if st = 1 then
    Result := False
  else
    Result := True;
end;

procedure ExitComm;
begin
  IC_ExitComm(IcDev);
end;

end.
