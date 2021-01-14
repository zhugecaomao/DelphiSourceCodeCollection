unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ToolWin;

type
  TFrame1 = class(TFrame)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    procedure FrameClick(Sender: TObject);
  private
    { Private declarations }
  public
  Procedure LaunchQemu(LaunchStr : String);
  Function ReadData(VM : String; Group : String; Key : String) : String;
  function CheckKQemuRunning(SM,SS : string) : DWord;
  function ServStart(SM, SS : string) : boolean;
  function ServStop(SM,SS : string) : boolean;
  Procedure WriteData(VM : String; Group : String; Key : String; Data : string);

    { Public declarations }
  end;

implementation

var
  SysPath,SysVM,SysQemu : String;


{$R *.dfm}

Procedure TFrame1.LaunchQemu(LaunchStr : String);
var
ProcInfo:TProcessInformation; StartInfo : TStartupInfo;
Pri : DWord;
ActiveEXE,EmuPath,MType,Data : String;

Begin
EmuPath := ReadData(SysVM,'General','Qemu Path');
If EmuPath = 'Default' Then EmuPath := SysQemu;
Mtype :=ReadData(SysVM,'Advanced','MachineType');
If (MType = 'Qemu PC Based System (Default)') or (MType = '')  Then ActiveEXE := EmuPath+'\qemu.exe';
If MType = 'Qemu Power PC Based System (qemu-system-ppc)' Then ActiveEXE := EmuPath+'\qemu-system-ppc.exe';
If MType = 'Qemu Sparc Based System (qemu-system-sparc)' Then ActiveEXE := EmuPath+'\qemu-system-sparc.exe';
If MType = 'Qemu x86_64 PC Based System (qemu-system-x86_64)' Then ActiveEXE := EmuPath+'\qemu-system-x86_64.exe';
If MType = 'Qemu MIPS Based System (qemu-system-mips)' Then ActiveExe := EmuPath+'\qemu-system-mips.exe';
If MType = 'Qemu ARM Based System (qemu-system-arm)' Then ActiveExe := EmuPath+'\qemu-system-arm.exe';

FillChar(StartInfo,SizeOf(TStartupInfo),#0);
FillChar(ProcInfo,SizeOf(TProcessInformation),#0);
StartInfo.cb := SizeOf(TStartupInfo);
//If ReadData(SysVM,'Advanced','SDL') = 'Yes' Then
//SetEnvironmentVariable('SDL_VIDEODRIVER','windib');

If ReadData(SysVM,'Hardware','Disable Accelerator') = 'No' Then
IF CheckKQemuRunning('','KQEMU') = 1 Then  If ServStart('','KQEMU') Then SB.Panels[1].Text := 'KQEMU Driver Started';

Pri :=CREATE_NEW_PROCESS_GROUP+NORMAL_PRIORITY_CLASS+DETACHED_PROCESS;
{Priority}
Data := ReadData(SysVM,'Advanced','Process');
If Data <> '' Then
  Begin
  If Data = 'Low' Then Pri :=CREATE_NEW_PROCESS_GROUP+IDLE_PRIORITY_CLASS+DETACHED_PROCESS;
  If Data = 'Below Normal' Then Pri :=CREATE_NEW_PROCESS_GROUP+$4000+DETACHED_PROCESS;
  If Data = 'Normal' Then Pri :=CREATE_NEW_PROCESS_GROUP+NORMAL_PRIORITY_CLASS+DETACHED_PROCESS;
  If Data = 'Above Normal' Then Pri :=CREATE_NEW_PROCESS_GROUP+$8000+DETACHED_PROCESS;
  If Data = 'High' Then Pri :=CREATE_NEW_PROCESS_GROUP+HIGH_PRIORITY_CLASS+DETACHED_PROCESS;
  If Data = 'Realtime' Then Pri :=CREATE_NEW_PROCESS_GROUP+REALTIME_PRIORITY_CLASS+DETACHED_PROCESS;
  End;

If CreateProcess(nil,PChar('"'+ActiveExe+'" '+LaunchStr),nil, nil,False, Pri, nil, PChar(SysPath+'\Media'), StartInfo, ProcInfo) Then
  Begin
  TCPTimer.Enabled := True;
  End;
CloseHandle(ProcInfo.hProcess);
CloseHandle(ProcInfo.hThread);
End;

procedure TFrame1.FormCreate(Sender: TObject);
var
Ini : TInifile;
begin
SysPath := ExtractFileDir(Application.EXEName);
If ParamStr(1) <> '' Then
  Begin
  SysVM := ParamStr(1);
  SB.Panels[2].Text := ParamStr(1);
  INI := TINIFile.Create(SysPath+'\qman.ini');
  SysQemu  := Ini.ReadString('General','Default Qemu Path','');
  Ini.Free;
  End Else Close;
end;


Function TFrame1.ReadData(VM : String; Group : String; Key : String) : String;
var
Ini : TInifile;
S : String;
Begin
INI := TINIFile.Create(SysPath+'\images\'+VM+'.VM');
S := Ini.ReadString(Group,Key,'');
Result := s;
Ini.Free;
End;




function TFrame1.CheckKQemuRunning(SM,SS : string) : DWord;
var
 hand0,Hand1 : SC_Handle;
 sstat : TServiceStatus;
 Res : DWord;
begin
Res := 0;
sstat.dwCurrentState := 0;
hand0 := OpenSCManager(PChar(SM), Nil,SC_MANAGER_CONNECT);
if(hand0 > 0)then
  begin
  hand1 := OpenService(hand0, PChar(SS),SERVICE_QUERY_STATUS);
  if(hand1 > 0)then
    begin
    if (QueryServiceStatus( hand1, sstat)) then
      begin
      Res := sstat.dwCurrentState;


      end;
    CloseServiceHandle(hand1);
    end;
  CloseServiceHandle(hand0);
  end;
  Result := Res;
end;


function TFrame1.ServStop(SM,SS : string) : boolean;
var
hand0,Hand1 : SC_Handle;
sstat : TServiceStatus;
s : PChar;
Res : DWord;
begin
  sstat.dwCurrentState := 0;
  hand0 := OpenSCManager(PChar(SM), nil,SC_MANAGER_CONNECT);
  if(hand0 > 0)then
  begin
  hand1:= OpenService( Hand0, PChar(sS),SERVICE_STOP or SERVICE_QUERY_STATUS);
  if hand1 > 0 then
    begin
    if ControlService(Hand1, SERVICE_CONTROL_STOP,sstat) then
     begin
     if(QueryServiceStatus(Hand1, sstat))then
        begin
        while(SERVICE_STOPPED <> sstat.dwCurrentState)do
          begin
          Res := sstat.dwCheckPoint;
          Sleep(sstat.dwWaitHint);
          if(not QueryServiceStatus(hand1,sstat))then
            begin
            break;
            end;
          if(sstat.dwCheckPoint < Res)then
            begin
            break;
            end;
        end;
        End;
      end;
      CloseServiceHandle(hand0);
    end;
    CloseServiceHandle(hand1);
  end;
Result := SERVICE_STOPPED = sstat.dwCurrentState;
CheckKQemuRunning('','KQEMU')
end;



function TFrame1.ServStart(SM,SS : string) : boolean;
var
  hand0,Hand1 : SC_Handle;
  sstat : TServiceStatus;
  s : PChar;
  Res : DWord;
begin
  sstat.dwCurrentState := 0;
  hand0 := OpenSCManager(PChar(SM), nil,SC_MANAGER_CONNECT);
  if(hand0 > 0)then
  begin
  hand1 := OpenService(hand0, PChar(SS),SERVICE_START or SERVICE_QUERY_STATUS);
  if(hand1 > 0)then
    begin
    S := Nil;
    if(StartService( hand1, 0,s))then
      begin
      if(QueryServiceStatus(hand1, sstat))then
        begin
        while(SERVICE_RUNNING <> sstat.dwCurrentState)do
          begin
          Res := sstat.dwCheckPoint;
          Sleep(sstat.dwWaitHint);
          if not QueryServiceStatus(hand1, sstat) then
            begin
            break;
            end;
            if sstat.dwCheckPoint < Res then
            begin
            break;
            end;
          end;
        end;
      end;
    CloseServiceHandle(hand1);
    end;
  CloseServiceHandle(hand0);
  end;
  Result := SERVICE_RUNNING = sstat.dwCurrentState;
CheckKQemuRunning('','KQEMU')
end;

//  StringToRun := stringToRun+' -monitor tcp::'+ReadData(TVD,'General','PortID')+',server,nowait,nodelay';


Procedure TFrame1.WriteData(VM : String; Group : String; Key : String; Data : string);
var
Ini : TInifile;
Begin
INI := TINIFile.Create(SysPath+'\images\'+VM+'.VM');
Ini.WriteString(Group,Key,Data);
Ini.Free;

End;



procedure TFrame1.FormDestroy(Sender: TObject);
begin
TCP.SendCmd('quit');
TCP.Disconnect;
end;

procedure TFrame1.TCPTimerTimer(Sender: TObject);
begin
TCPTimer.Enabled := false;
TCP.Host := 'localhost';
TCP.Port :=StrToInt(readData(SysVM,'General','PortID'));
TCP.Connect(3000);

end;

procedure TFrame1.SysTimerTimer(Sender: TObject);
var
ls : String;
//QemuPanel : TPanel;
begin
//QemuPanel := TPanel.Create(Main);
{With QemuPanel Do
  Begin
  parent := main;
  bevelInner := BVNone;
  BevelOuter := BVNone;
  Align := alClient;
  caption := '';
  End;}
SysTimer.Enabled := False;
ls := readData(SysVM,'General','LaunchID');
LS := LS+' -monitor tcp::'+ReadData(SysVM,'General','PortID')+',server,nowait,nodelay';
LS := LS+' -hwnd '+IntToStr(TS.Handle);
LaunchQemu(ls);

end;
end.
