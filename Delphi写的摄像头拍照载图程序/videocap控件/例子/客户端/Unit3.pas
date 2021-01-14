unit Unit3;

interface

uses
  Classes,SysUtils,Unit1;

type
  LostThread = class(TThread)
  private
   dtTimer: TDateTime;
   procedure initTimer;
   procedure procInfo();
        { Private declarations }
  protected
  iState: Integer;
    procedure Execute; override;
  end;


procedure startThread;
procedure stopThread;

implementation
var
  LostThread_T:LostThread;


procedure startThread;
  //if not bFlag then
  begin
    LostThread_T:=LostThread.Create(True);
    LostThread_T.Priority := tpLower;
    LostThread_T.Resume;
  end;

procedure stopThread;
begin
  if LostThread_T <> nil then
  begin
    LostThread_T.Free;
    LostThread_T:= nil;
  end;
end;



procedure LostThread.initTimer;
var
  Hour, Min: word;
begin
end;

procedure LostThread.procInfo;
begin
if ff then
begin
Form1.clientsocket1.Socket.SendText('gets');
ff:=false;
end;
end;


procedure LostThread.Execute;
begin
procInfo;
end;
end.
