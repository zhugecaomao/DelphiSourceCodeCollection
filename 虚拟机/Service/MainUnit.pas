unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  ExtCtrls,inifiles,Forms,TLHelp32,StdCtrls,WinSvc,FileCtrl;

type
  TQMSVC = class(TService)
    SysTimer: TTimer;
    procedure SysTimerTimer(Sender: TObject);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    Function ReadData(VM : String; Group : String; Key : String) : String;
    Procedure WriteData(VM : String; Group : String; Key : String; Data : string);
    Procedure ReadSystemConfig;
    Procedure CreateProcessSL;
    Procedure ScanProcessSL;
    Procedure DestroyProcessSL;
    Function GetTempDir : string;
    Function PrepareQemuToRun(VM : String) : String;
    Function FindBiosLocation(VM : String) : String;
    Function CheckFileName(Fname : String) : String;
    Function MCheckFileName(Fname : String) : String;
    Procedure LaunchQemu(LaunchStr : String; VM : String);
    function CheckKQemuRunning(SM,SS : string) : DWord;
    function ServStop(SM,SS : string) : boolean;
    function ServStart(SM,SS : string) : boolean;
    Procedure StopQemu(VM : String);




    { Public declarations }
  end;

var
  QMSVC: TQMSVC;
  SysPath,SysLang,SysQemu,GetShellDirectory : String;
  FTEnable,FTAll,FTPPath,AllowList: String;
  SelType : Integer;
  LastRun,LastRunPar,WaitText,ActMedia : string;
  ProcSL : TStringlist;
  ProcTF : Textfile;
  SysStopSvc : Boolean;


implementation

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  QMSVC.Controller(CtrlCode);
end;

function TQMSVC.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

Function TQMSvc.ReadData(VM : String; Group : String; Key : String) : String;
var
Ini : TInifile;
S : String;
Begin
INI := TINIFile.Create(SysPath+'\images\'+VM+'.VM');
S := Ini.ReadString(Group,Key,'');
Result := s;
Ini.Free;
End;

Procedure TQMSvc.WriteData(VM : String; Group : String; Key : String; Data : string);
var
Ini : TInifile;
Begin
INI := TINIFile.Create(SysPath+'\images\'+VM+'.VM');
Ini.WriteString(Group,Key,Data);
Ini.Free;

End;


Procedure TQMSvc.ReadSystemConfig;
var
INI : TIniFile;
Begin
SysPath := ExtractFileDir(Application.ExeName);
INI := TINIFile.Create(SysPath+'\qman.ini');
With Ini Do
  Begin
  SysLang := ReadString('General','Language','English');
  SysQemu := ReadString('General','Default QEMU Path','');
  FTEnable := ReadString('FileTransfer','Enable Folder','0');
  FTAll := ReadString('FileTransfer','Share All','0');
  FTPPath := ReadString('FileTransfer','Share Dir','');
  AllowList := ReadString('FileTransfer','Allow','');

  If ReadString('General','Stop Services','False') = 'True' Then SysStopSvc := True;
  End;
Ini.Free;

CreateProcessSL;
SysTimer.Enabled := True;
End;

Procedure TQMSVC.CreateProcessSL;
Begin
ProcSL := TStringList.Create;
  Try
  ProcSL.LoadFromFile(SysPath+'\Process.Dat');
  Except on EFOpenError Do Begin End;
  End;
End;

Procedure TQMSVC.ScanProcessSL;
var
MyHandle: THandle;
Struct: TProcessEntry32;
DIDF,Failed : Boolean;
I,J,EndOf : Integer;
Proc,FName : String;
TempString,FN : string;

begin

I := ProcSL.Count;
IF I > 0 Then
  Begin
  For J := 0 To I-1 Do
    Begin
    TempString :=ProcSL.Strings[j];
    EndOf :=Pos('/',TempString); DidF := False;
    Proc := Copy (TempString,1,EndOf-1);
    FName := Copy(TempString,EndOf+1,Length(TempString));
    If FName > '' Then
      Begin
      MyHandle:=CreateToolHelp32SnapShot(TH32CS_SNAPPROCESS, 0);
      Struct.dwSize:=Sizeof(TProcessEntry32);
      if Process32First(MyHandle, Struct) then
      If Proc = IntToStr(Struct.th32ProcessID) Then DIDF := True;
      while Process32Next(MyHandle, Struct) do
      If Proc = IntToStr(Struct.th32ProcessID) Then DIDF := True;
      CloseHandle(MyHandle);
      If DIDF = False Then
        Begin
        // PROCESS NO LONGER RUNNING
        WriteData(FName,'General','StatusID','');
        WriteData(FName,'General','Status','Stopped');
        ProcSL.Strings[j] := '';
        FN :=  GetTempDir+FName+'.bat';
        DeleteFile(FN);

        //REMOVE FROM SL NOW
        End;
      End;
    End;
  End;
End;
Procedure TQMSvc.DestroyProcessSL;
Begin
ProcSL.SaveToFile(SysPath+'\Process.Dat');
ProcSL.Free;
End;


Function TQMSvc.GetTempDir : string;
var
lng: DWORD;
thePath: string;
begin
SetLength(thePath, MAX_PATH) ;
lng := GetTempPath(MAX_PATH, PChar(thePath)) ;
SetLength(thePath, lng) ;
Result := thepath;
end;

procedure TQMSVC.SysTimerTimer(Sender: TObject);
begin
SysTimer.Enabled := False; ScanProcessSL;SysTimer.Enabled := True;
end;


Function TQMSvc.PrepareQemuToRun(VM : String) : String;
var
StringToRun : String;
Args : String;

I,J : Integer;
DidError : Boolean;
ss,TmpPath,Data,TVD : String;
D1,d2,d3 : Integer;
vl,EndOf : Integer;
TempString,TempString2,S : String;
begin
TVD :=VM;
If ReadData(TVD,'Advanced','OverrideAll') = 'Yes' Then Data := ReadData(TVD,'Advanced','OptionalString'); If Data > '' Then StringToRun := Data Else
  Begin
  // First add bios line ensuring correct bios file can be found, next and ram
  StringToRun := '-L "'+FindBiosLocation(TVD)+'" -m '+ReadData(TVD,'Hardware','RAM');
  //Scan Hard Disks
  Data := ReadData(TVD,'Drives','HDA'); If Data > '' Then StringToRun := StringToRun +' -hda "'+CheckFileName(Data)+'"';
  Data := ReadData(TVD,'Drives','HDB'); If Data > '' Then StringToRun := StringToRun +' -hdb "'+CheckFileName(Data)+'"';
  Data := ReadData(TVD,'Drives','HDC'); If Data > '' Then StringToRun := StringToRun +' -hdc "'+CheckFileName(Data)+'"';
  Data := ReadData(TVD,'Drives','HDD'); If Data > '' Then StringToRun := StringToRun +' -hdd "'+CheckFileName(Data)+'"';
  //Scan Floppy Disks
  //First check physical disk is not going to be used
  Data := ReadData(TVD,'Drives','UsePCFloppy');
  IF Data = 'Yes' Then
    Begin
    End
  Else Data := ReadData(TVD,'Drives','Floppy'); If Data > '' Then StringToRun := StringToRun +' -fda "'+MCheckFileName(Data)+'"';

  Data := ReadData(TVD,'Drives','FloppyB'); If Data > '' Then StringToRun := StringToRun +' -fdb "'+MCheckFileName(Data)+'"';
  //Boot Floppy ?

  Data := ReadData(TVD,'Drives','BootFloppy');
  If Data = 'Yes' Then  StringToRun := StringToRun + ' -boot a';

  //CDROM
  Data := ReadData(TVD,'Drives','Use System CD');
  IF Data = 'Yes' Then
  StringToRun := StringToRun + ' -cdrom "//./'+Lowercase(ReadData(TVD,'Drives','System CD Drive'))+'"' Else
    Begin
    Data := ReadData(TVD,'Drives','CDROM'); If Data > '' Then StringToRun := StringToRun +' -cdrom "'+MCheckFileName(Data)+'"';
    End;

  //Boot CDROM ?
  Data := ReadData(TVD,'Drives','Boot CDROM');
  If Data = 'Yes' Then  StringToRun := StringToRun + ' -boot d';

  //Sound
  If ReadData(TVD,'Audio','Enable Sound') = 'Yes' Then
    Begin
    D1 := 0; D2 := 0;  D3 := 0;
    If ReadData(TVD,'Audio','Use SB16') = 'Yes' Then D1 := 1;
    If ReadData(TVD,'Audio','Use ES1370') = 'Yes' Then D2 := 1;
    If ReadData(TVD,'Audio','Use Adlib') = 'Yes' Then D3 := 1;
    iF (D1 = 1) and (D2 =1) And (D3=1) Then StringToRun := StringToRun + ' -soundhw all' Else
      Begin
      ss := '';
      If ReadData(TVD,'Audio','Use SB16') = 'Yes' Then If SS = '' Then SS := 'sb16' Else SS := SS+ ',sb16';
      If ReadData(TVD,'Audio','Use Adlib') = 'Yes' Then If SS = '' Then SS := 'adlib' Else SS := SS+ ',adlib';
      If ReadData(TVD,'Audio','Use ES1370') = 'Yes' Then If SS = '' Then SS := 'es1370' Else SS := SS+ ',es1370';
      If ss > '' then StringToRun := StringToRun +' -soundhw '+ss;
      End;
    End;

  //Full Virt
  If ReadData(TVD,'Hardware','Full Acceleration') = 'Yes' Then  StringToRun := StringToRun +' -kernel-kqemu';
  //Processors
  If StrToInt(ReadData(TVD,'Hardware','Processors')) > 1 Then StringToRun := StringToRun +' -smp '+ReadData(TVD,'Hardware','Processors');
  //General Params
  If ReadData(TVD,'Hardware','Full Screen Display') = 'Yes' Then StringToRun := StringToRun + ' -full-screen';
  If ReadData(TVD,'Hardware','Do Not Start CPU') = 'Yes' Then StringToRun := StringToRun + ' -S';
  If ReadData(TVD,'Hardware','Simulate ISA') = 'Yes' Then StringToRun := StringToRun + ' -M isapc';
  //Network

  If ReadData(TVD,'Hardware','Network') = 'Yes' Then
    Begin
    D1 := StrToInt(ReadData(TVD,'Network','VLANS'));
    If D1 > 0 Then
      Begin
      For D2 := 0 To D1-1 Do
        Begin
        If ReadData(TVD,'Network','VLAN'+IntToStr(D2)) = 'User Networking' Then
          Begin
          If (ReadData(TVD,'Network','VLAN'+IntToStr(D2)) = 'User Networking') And (ReadData(TVD,'Network','VLAN'+IntToStr(D2)+'Mac') ='') Then
          StringToRun := StringToRun + ' -net nic,vlan='+IntToStr(d2)+' -net user,vlan='+IntToStr(d2) Else
          StringToRun := StringToRun + ' -net nic,vlan='+IntToStr(d2)+',macaddr='+ReadData(TVD,'Network','VLAN'+IntToStr(D2)+'Mac')+' -net user,vlan='+IntToStr(d2);
          End
        Else
          Begin
          If (ReadData(TVD,'Network','VLAN'+IntToStr(D2)) = 'TAP Networking') And (ReadData(TVD,'Network','VLAN'+IntToStr(D2)+'Mac') ='') Then
          StringToRun := StringToRun + ' -net nic,vlan='+IntToStr(d2)+', -net tap,vlan='+IntToStr(D2)+',ifname="'+ReadData(TVD,'Network','VLAN'+IntToStr(d2)+'TapID')+'"' Else
          StringToRun := StringToRun + ' -net nic,vlan='+IntToStr(d2)+',macaddr='+ReadData(TVD,'Network','VLAN'+IntToStr(d2)+'Mac')+' -net tap,vlan='+IntToStr(d2)+',ifname="'+ReadData(TVD,'Network','VLAN'+IntToStr(d2)+'TapID')+'"';
          End;
        End;
      End;

    //Network Sockets
    D1 := StrToInt(ReadData(TVD,'Network','VLANS'));
    If D1 > 0 Then
      Begin
      For D2 := 0 To D1-1 Do
        Begin
        If ReadData(TVD,'Network','VLAN'+IntToStr(D2)+'Listener') > '' Then
          Begin
          //BREAK UP STRING
          S := ReadData(TVD,'Network','VLAN'+IntToStr(D2)+'Listener');
          TempString := s;
          If S > '' Then
            Begin
            Repeat
            EndOf :=Pos('|',TempString);
            If Endof = 0 Then StringToRun := StringToRun+ ' -net socket,vlan='+IntToStr(d2)+',listen=:'+TempString Else
              Begin
              StringToRun := StringToRun +' -net socket,vlan='+IntToStr(d2)+',listen=:'+(copy(TempString,1,EndOf-1));
              TempString2 :=  Copy(TempString,Endof+1,Length(TempString));
              TempString := TempString2;
              End;
            Until EndOF = 0;
            End;
          End;
        End;
      end;

    D1 := StrToInt(ReadData(TVD,'Network','VLANS'));
    If D1 > 0 Then
      Begin
      For D2 := 0 To D1-1 Do
        Begin
        If ReadData(TVD,'Network','VLAN'+IntToStr(D2)+'Connector') > '' Then
          Begin
          //BREAK UP STRING
          S := ReadData(TVD,'Network','VLAN'+IntToStr(D2)+'Connector');
          TempString := s;
          IF S > '' Then
            Begin
            Repeat
            EndOf :=Pos('|',TempString);
            If Endof = 0 Then StringToRun := StringToRun+ ' -net socket,vlan='+IntToStr(d2)+',connect='+TempString Else
              Begin
              StringToRun := StringToRun +' -net socket,vlan='+IntToStr(d2)+',connect='+(copy(TempString,1,EndOf-1));
              TempString2 :=  Copy(TempString,Endof+1,Length(TempString));
              TempString := TempString2;
              End;
            Until EndOF = 0;
            End;
          End;
        End;
      end;
    //Redirectors
    S := ReadData(TVD,'Network','RedirectString');
    TempString := s;
    Repeat
    EndOf :=Pos('|',TempString);
    IF S > '' Then
      Begin
      If Endof = 0 Then   StringToRun := StringToRun +' -redir '+TempString Else
        Begin
        StringToRun := StringToRun +' -redir '+(copy(TempString,1,EndOf-1));
        TempString2 :=  Copy(TempString,Endof+1,Length(TempString));
        TempString := TempString2;
        End;
      End;
    Until EndOF = 0;
    End Else StringToRun := StringToRun+' -net none'; //END NETWORKING

  {J := Length(EmuDBFTPDir.Text);
  If EmuDBEnableFTP.Text = 'True' Then StringToRun := StringToRun + ' -tftp "/'+Copy(EmuDBFTPDir.Text,4,J)+'"'; }
  //LoadvM
  Data := ReadData(TVD,'Advanced','SavedState'); If Data > '' Then StringToRun := StringToRun +' -loadvm "'+Data+'"';
  //snapshot
  Data := ReadData(TVD,'Hardware','Do Not Apply'); If Data = 'Yes' Then StringToRun := StringToRun+' -snapshot';
  //Optional Commands
  Data := ReadData(TVD,'Advanced','OptionalString'); If Data > '' Then StringToRun := StringToRun+' '+Data;
  //DISABLE ACCEL
  Data := ReadData(TVD,'Hardware','Disable Accelerator'); If Data = 'Yes' Then StringToRun := StringToRun+' -no-kqemu';
  //WIN 2K HACK
  Data := ReadData(TVD,'Hardware','Enable WIN2K Hack'); If Data = 'Yes' Then StringToRun := StringToRun+' -win2k-hack';
  //LOCAL TIME
  Data := ReadData(TVD,'Hardware','Use Local Time'); If Data = 'Yes' Then StringToRun := StringToRun+' -localtime';
  //USB TAB
  Data := ReadData(TVD,'Hardware','USB Tablet'); If Data = 'Yes' Then StringToRun := StringToRun+' -usbdevice tablet';

  //KEYBOARD
  Data := ReadData(TVD,'Hardware','Keyboard'); If Data <> '' Then StringToRun := StringToRun+' -k '+Data;

  //VNC
  S := ' ';
  Data := ReadData(TVD,'Hardware','VNC Server'); If Data = 'Yes' Then
    Begin
    Data := ReadData(TVD,'Hardware','VNC Number'); If Data  > '' Then
      Begin
      Data := ReadData(TVD,'Hardware','USB Tablet'); If Data <> 'Yes' Then S := S+' -usbdevice tablet';
      Data := ReadData(TVD,'Hardware','Keyboard'); If Data = '' Then S := S+' -k en-us';
      S := S+' -vnc :'+ReadData(TVD,'Hardware','VNC Number');
      StringToRun := StringToRun+s;
      End;
    End;
  End;
  //Send Results
  Result := StringToRun;



End;



Function TQMSvc.FindBiosLocation(VM : String) : String;
var
SR: TSearchRec;
DirList: TStringList;
IsFound,DidFind: Boolean;
i: integer;
StartDir,FileMask,s : String;

begin
s := ReadData(VM,'General','Qemu Path');
If S = 'Default' Then S := SysPath;
StartDir := S;
FileMask := '*.bin';
DidFind := False;
if StartDir[length(StartDir)] <> '\' then StartDir := StartDir + '\';
IsFound := FindFirst(StartDir+FileMask, faAnyFile-faDirectory, SR) = 0;
while IsFound do
      begin
      Result := Copy(StartDir,0,Length(StartDir)-1);
      DidFind := True;
      IsFound := FindNext(SR) = 0;
      end;
FindClose(SR);

If DidFind = False Then
   Begin
   DirList := TStringList.Create;
   IsFound := FindFirst(StartDir+'*.*', faAnyFile, SR) = 0;
   DidFind := False;
   while IsFound do
         Begin
         if ((SR.Attr and faDirectory) <> 0) and (SR.Name[1] <> '.') then
         DirList.Add(StartDir + SR.Name);
         IsFound := FindNext(SR) = 0;
         end;
   FindClose(SR);
   {Check If Found}
   for i := 0 to DirList.Count - 1 do
        Begin
        StartDir := Dirlist[i];
        if StartDir[length(StartDir)] <> '\' then StartDir := StartDir + '\';
        IsFound := FindFirst(StartDir+FileMask, faAnyFile-faDirectory, SR) = 0;
        while IsFound do
          begin
          Result := Copy(StartDir,0,Length(StartDir)-1);
          IsFound := FindNext(SR) = 0;
          end;
    FindClose(SR);
    End;
    DirList.Free;
   End;
end;


Function TQMSVC.CheckFileName(Fname : String) : String;
var
S : String;
Begin
S := ExtractFileDir(FName);
If S > '' Then Result := FName Else Result := SysPath+'\Images\'+FName;
End;


Procedure TQMSvc.LaunchQemu(LaunchStr : String; VM : string);
var
ProcInfo:TProcessInformation; StartInfo : TStartupInfo;
Pri : DWord;
TVD,ActiveEXE,EmuPath,MType,Data : String;
Begin
TVD := VM;
EmuPath := ReadData(TVD,'General','Qemu Path');
If EmuPath = 'Default' Then EmuPath := SysQemu;
Mtype :=ReadData(TVD,'Advanced','MachineType');
If (MType = 'Qemu PC Based System (Default)') or (MType = '')  Then ActiveEXE := EmuPath+'\qemu.exe';
If MType = 'Qemu Power PC Based System (qemu-system-ppc)' Then ActiveEXE := EmuPath+'\qemu-system-ppc.exe';
If MType = 'Qemu Sparc Based System (qemu-system-sparc)' Then ActiveEXE := EmuPath+'\qemu-system-sparc.exe';
If MType = 'Qemu x86_64 PC Based System (qemu-system-x86_64)' Then ActiveEXE := EmuPath+'\qemu-system-x86_64.exe';
If MType = 'Qemu MIPS Based System (qemu-system-mips)' Then ActiveExe := EmuPath+'\qemu-system-mips.exe';
If MType = 'Qemu ARM Based System (qemu-system-arm)' Then ActiveExe := EmuPath+'\qemu-system-arm.exe';

FillChar(StartInfo,SizeOf(TStartupInfo),#0);
FillChar(ProcInfo,SizeOf(TProcessInformation),#0);
StartInfo.cb := SizeOf(TStartupInfo);
If ReadData(TVD,'Advanced','SDL') = 'Yes' Then
SetEnvironmentVariable('SDL_VIDEODRIVER','windib');

If ReadData(TVD,'Hardware','Disable Accelerator') = 'No' Then
IF CheckKQemuRunning('','KQEMU') = 1 Then ServStart('','KQEMU');

Pri :=CREATE_NEW_PROCESS_GROUP+NORMAL_PRIORITY_CLASS+DETACHED_PROCESS;
{Priority}
Data := ReadData(TVD,'Advanced','Process');
If Data <> '' Then
  Begin
  If Data = 'Low' Then Pri :=CREATE_NEW_PROCESS_GROUP+IDLE_PRIORITY_CLASS+DETACHED_PROCESS;
  If Data = 'Below Normal' Then Pri :=CREATE_NEW_PROCESS_GROUP+$4000+DETACHED_PROCESS;
  If Data = 'Normal' Then Pri :=CREATE_NEW_PROCESS_GROUP+NORMAL_PRIORITY_CLASS+DETACHED_PROCESS;
  If Data = 'Above Normal' Then Pri :=CREATE_NEW_PROCESS_GROUP+$8000+DETACHED_PROCESS;
  If Data = 'High' Then Pri :=CREATE_NEW_PROCESS_GROUP+HIGH_PRIORITY_CLASS+DETACHED_PROCESS;
  If Data = 'Realtime' Then Pri :=CREATE_NEW_PROCESS_GROUP+REALTIME_PRIORITY_CLASS+DETACHED_PROCESS;
  End;

  //KEEP A LOG OF THE LAST COMMAND LINE DATA
LastRun := '"'+ActiveExe+'"';
LastRunPar := LaunchStr;
  If CreateProcess(nil,PChar('"'+ActiveExe+'" '+LaunchStr),nil, nil,False, Pri,
  nil, PChar(SysPath+'\Media'), StartInfo, ProcInfo) Then
      Begin
      WriteData(TVD,'General','StatusID',IntToStr(ProcInfo.dwProcessId));
      WriteData(TVD,'General','Status','Running');
      WriteData(TVD,'General','Last Run',DateToStr(Now)+' - '+TimeToStr(Now));
//      RetrieveVMInfo(TV.Selected.Text,0);
      ProcSL.Add(IntToStr(ProcInfo.dwProcessId)+'/'+TVD);
      End;
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);

SysTimer.Enabled := True;
End;

function TQMSvc.CheckKQemuRunning(SM,SS : string) : DWord;
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


function TQMSvc.ServStop(SM,SS : string) : boolean;
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

function TQMSvc.ServStart(SM,SS : string) : boolean;
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


procedure TQMSVC.ServiceStop(Sender: TService; var Stopped: Boolean);
var
Ini : TInifile;
Rec : TSearchRec;
S,u : String;

begin
SysTimer.Enabled := False;

if FindFirst(SysPath+'\Images\*.vm', faAnyFile, rec) = 0 then
  begin
  repeat
  INI := TINIFile.Create(SysPath+'\images\'+rec.name);
  If Ini.ReadString('General','Service','') = '1' Then
    Begin
    S :=Copy(rec.name,1,Length(rec.name)-3);
    StopQemu(s);
    End;
   Ini.Free;
  until FindNext(rec) <> 0;
  FindClose(Rec);
  end;
DestroyProcessSL;
Application.ProcessMessages;

End;


Function TQMSvc.MCheckFileName(Fname : String) : String;
var
S : String;
Begin
S := ExtractFileDir(FName);
If S > '' Then Result := FName Else Result := SysPath+'\Media\'+FName;
End;




procedure TQMSVC.ServiceStart(Sender: TService; var Started: Boolean);
var
Ini : TInifile;
Rec : TSearchRec;
S,u : String;

begin
ReadSystemConfig;
//Start
if FindFirst(SysPath+'\Images\*.vm', faAnyFile, rec) = 0 then
  begin
  repeat
  INI := TINIFile.Create(SysPath+'\images\'+rec.name);
  If Ini.ReadString('General','Service','') = '1' Then
    Begin
    S :=Copy(rec.name,1,Length(rec.name)-3);
    u := PrepareQemuToRun(s);
    LaunchQemu(u,s);
    End;
   Ini.Free;
  until FindNext(rec) <> 0;
  FindClose(Rec);
  end;
End;


Procedure TQMSvc.StopQemu(VM : String);
VAR
Ret : BOOL;
PrID: Integer;
Ph: THandle;
begin
SysTimer.Enabled := False;
IF ProcSL.Count > 0 Then
  Begin
  If ReadData(VM,'General','StatusID') > '' Then
    Begin
    PrID := StrToInt(ReadData(VM,'General','StatusID'));
    Ph := OpenProcess(1, BOOL(0), PrID);
    Ret := TerminateProcess(Ph, 0);
    if Integer(Ret) = 0 then Begin End Else
      Begin
      End;
    End;
  End;
SysTimer.Enabled := True;
End;

end.

