unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, ExtCtrls, ComCtrls, ToolWin,IniFiles,svcmgr,winsvc,shellapi,Forms,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, StdCtrls,
  TntExtCtrls,  Sockets, ImgList, Menus, TntDialogs,TLHelp32;

type
  TMain = class(TForm)
    SysTimer: TTimer;
    TB: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    SB: TPanel;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Status: TStatusBar;
    TCP: TIdTCPClient;
    TCPTimer: TTimer;
    MIL: TImageList;
    ToolButton5: TToolButton;
    Pause: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    CDDVD: TPopupMenu;
    EjectCDDVDMediaFromDrive1: TMenuItem;
    LoadDiskImage1: TMenuItem;
    UsePCCDDVDDrive1: TMenuItem;
    FDISK: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    SDOWN: TPopupMenu;
    ResetVirtualMachine1: TMenuItem;
    ShutdownVirtualMachine1: TMenuItem;
    ToolButton11: TToolButton;
    MediaOpen: TTntOpenDialog;
    EjectFloppyDisk1MediaFromDrive1: TMenuItem;
    LoadCDDVDDiskImageRestartVM1: TMenuItem;
    LoadFloppyDisk0DiskImageRestartVM1: TMenuItem;
    ToolButton6: TToolButton;
    SSHOT: TPopupMenu;
    SaveSnapshot1: TMenuItem;
    N1: TMenuItem;
    LoadSnapshot1: TMenuItem;
    N2: TMenuItem;
    DeleteSnapshot1: TMenuItem;
    QCOW2ImagesOnly1: TMenuItem;
    N3: TMenuItem;
    CheckProcess: TTimer;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SysTimerTimer(Sender: TObject);
    procedure SBResize(Sender: TObject);
    procedure TCPTimerTimer(Sender: TObject);
    procedure TCPStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure ToolButton4Click(Sender: TObject);
    procedure PauseClick(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ResetVirtualMachine1Click(Sender: TObject);
    procedure ShutdownVirtualMachine1Click(Sender: TObject);
    procedure EjectCDDVDMediaFromDrive1Click(Sender: TObject);
    procedure LoadDiskImage1Click(Sender: TObject);
    procedure UsePCCDDVDDrive1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure EjectFloppyDisk1MediaFromDrive1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure LoadCDDVDDiskImageRestartVM1Click(Sender: TObject);
    procedure LoadFloppyDisk0DiskImageRestartVM1Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure SaveSnapshot1Click(Sender: TObject);
    procedure LoadSnapshot1Click(Sender: TObject);
    procedure DeleteSnapshot1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CheckProcessTimer(Sender: TObject);
    procedure TCPDisconnected(Sender: TObject);
  private
    { Private declarations }
  public
  Procedure LaunchQemu(LaunchStr : String);
  Function ReadData(VM : String; Group : String; Key : String) : String;
  function CheckKQemuRunning(SM,SS : string) : DWord;
  function ServStart(SM, SS : string) : boolean;
  function ServStop(SM,SS : string) : boolean;
  Procedure WriteData(VM : String; Group : String; Key : String; Data : string);
  Procedure AddImages(ImageName : string; ListToAdd : TImageList; Inc : Integer);
  Function DetectCDROMDrives(Drive : String) : Boolean;
  Function DetectFloppyDrives(Drive : String) : Boolean;
  Procedure SendCommand(Cmd : String);
  Procedure ScanSessionIDList(Session : Integer);
  Procedure LoadHelp;
    { Public declarations }
  end;

var
  Main: TMain;
  SysPath,SysVM,SysQemu,SysLaunch : String;
  sysHand : hwnd;
  SysProcess : Integer;
  StartIt,EndIt : Boolean;
  HelpBmp : TBitmap;

implementation

uses SelCDFLOPUNIT, HelpUnit;



{$R *.dfm}

Procedure TMain.LaunchQemu(LaunchStr : String);
var
ProcInfo:TProcessInformation; StartInfo : TStartupInfo;
Pri : DWord;
ActiveEXE,EmuPath,MType,Data,s : String;
t : Textfile;
Begin
{EmuPath := ReadData(SysVM,'General','Qemu Path');
If EmuPath = 'Default' Then EmuPath := SysQemu;
Mtype :=ReadData(SysVM,'Advanced','MachineType');
If (MType = 'Qemu PC Based System (Default)') or (MType = '')  Then ActiveEXE := EmuPath+'\qemu.exe';
If MType = 'Qemu Power PC Based System (qemu-system-ppc)' Then ActiveEXE := EmuPath+'\qemu-system-ppc.exe';
If MType = 'Qemu Sparc Based System (qemu-system-sparc)' Then ActiveEXE := EmuPath+'\qemu-system-sparc.exe';
If MType = 'Qemu x86_64 PC Based System (qemu-system-x86_64)' Then ActiveEXE := EmuPath+'\qemu-system-x86_64.exe';
If MType = 'Qemu MIPS Based System (qemu-system-mips)' Then ActiveExe := EmuPath+'\qemu-system-mips.exe';
If MType = 'Qemu ARM Based System (qemu-system-arm)' Then ActiveExe := EmuPath+'\qemu-system-arm.exe';}

s :=ReadData(SysVM,'General','Qemu Path');
If Copy(S,1,4) = '{QM}' Then ActiveExe := sysPath+'\'+Copy(S,6,Length(S)-5)+'\' Else ActiveEXE := S+'\';
ActiveExe := ActiveEXE+ReadData(SysVM,'General','Qemu EXE');


FillChar(StartInfo,SizeOf(TStartupInfo),#0);
FillChar(ProcInfo,SizeOf(TProcessInformation),#0);
StartInfo.cb := SizeOf(TStartupInfo);
// MUST BE DONE TO MAKE IT WORK!
SetEnvironmentVariable('SDL_VIDEODRIVER','windib');

If ReadData(SysVM,'Hardware','Disable Accelerator') = 'No' Then
IF CheckKQemuRunning('','KQEMU') = 1 Then
  Begin
  If ServStart('','KQEMU') Then Status.Panels[0].Text := 'KQEMU Driver Started';
  End Else Status.Panels[0].Text := 'KQEMU Driver Started';


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
SysLaunch := '"'+ActiveExe+'" '+LaunchStr;
If CreateProcess(nil,PChar('"'+ActiveExe+'" '+LaunchStr),nil, nil,False, Pri, nil, PChar(SysPath+'\Media'), StartInfo, ProcInfo) Then
  Begin
  TCPTimer.Enabled := True;
  SysProcess :=ProcInfo.dwProcessId;
  CheckProcess.Enabled := True;
  End;
StartIt := False;
CloseHandle(ProcInfo.hProcess);
CloseHandle(ProcInfo.hThread);
End;

procedure TMain.FormCreate(Sender: TObject);
var
Ini : TInifile;
s : String;
begin
StartIt := True;
Endit := False;
SysPath := ExtractFileDir(Application.EXEName);
If ParamStr(1) <> '' Then
  Begin
  SysVM := ParamStr(1);
//  SB.Panels[2].Text := ParamStr(1);
  INI := TINIFile.Create(SysPath+'\qman.ini');
  SysQemu  := Ini.ReadString('General','Default Qemu Path','');
  Ini.Free;
  Main.Caption :='QMQC - '+ParamStr(1)+' - (Press Ctrl-Alt to unlock mouse)';
  AddImages('TI',MIL,10);
  End
Else EndIt := True;
end;


Function TMain.ReadData(VM : String; Group : String; Key : String) : String;
var
Ini : TInifile;
S : String;
Begin
INI := TINIFile.Create(SysPath+'\images\'+VM+'.VM');
S := Ini.ReadString(Group,Key,'');
Result := s;
Ini.Free;
End;




function TMain.CheckKQemuRunning(SM,SS : string) : DWord;
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


function Tmain.ServStop(SM,SS : string) : boolean;
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



function Tmain.ServStart(SM,SS : string) : boolean;
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


Procedure TMain.WriteData(VM : String; Group : String; Key : String; Data : string);
var
Ini : TInifile;
Begin
INI := TINIFile.Create(SysPath+'\images\'+VM+'.vm');
Ini.WriteString(Group,Key,Data);
Ini.Free;

End;



procedure TMain.FormDestroy(Sender: TObject);
var
hqemu : Longint;
begin
{hqemu := GetWindow(SYSHAND, gw_cHILD);
SendMessageA(hqemu, WM_Close,0,0); }
If EndIt = False Then
  Begin
  If TCP.Connected = True then SendCommand('quit');
  sleep(1000);
  End;
  IF TCP.Connected = True Then
    Begin
      Try
      TCP.Disconnect;
      except
      on E: Exception do Status.Panels[1].Text := 'Error: '+E.Message;
      End;
    End;
end;



procedure TMain.SysTimerTimer(Sender: TObject);
var
ls : String;
begin
SysTimer.Enabled := False;

If EndIt = True Then
  Begin
  Main.Enabled := True;
  ShowMessage('Usage: QMCLIENT <"VMNAME">'+#13+#13+'(eg: QMCLIENT "MY TEST VM")');
  StartIT := False;
  application.terminate;
  end else
  Begin
  syshand := sb.handle;
  ls := readData(SysVM,'General','LaunchID');
  LS := LS+' -monitor tcp::'+ReadData(SysVM,'General','PortID')+',server';
  LS := LS+' -hwnd '+IntToStr(sb.Handle);
  LaunchQemu(ls);
  End;
end;

procedure TMain.SBResize(Sender: TObject);
begin
Main.Height := SB.Height+74;
Main.width := SB.width+7;
end;

procedure TMain.TCPTimerTimer(Sender: TObject);
begin
TCPTimer.Enabled := False;
TCP.port := StrToInt(ReadData(SysVM,'General','PortID'));
  Try
  TCP.Connect;
  except
  on E: Exception do Status.Panels[1].Text := 'Error: '+E.Message;
  End;


end;

procedure TMain.TCPStatus(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: String);
begin
status.Panels[1].Text := 'Qemu Monitor: '+AStatusText;
STATUS.REFRESH;

end;

Procedure TMain.AddImages(ImageName : string; ListToAdd : TImageList; Inc : Integer);
var
  h : THandle;
  ResBmp :String;
  Bmp : TBitmap;
  I : Integer;
begin
  h := LoadLibrary('QemuManDll.DLL');
  try
    if h <> 0 then
    begin
    For I  := 1 To Inc Do
        Begin
        ResBmp := ImageName+IntToStr(I);
        Bmp := Tbitmap.Create;
           try
           Bmp.LoadFromResourceName(h,resBmp);
           ListToAdd.AddMasked(Bmp,clwhite);
           finally
           Bmp.Free;
           end;
        End;
    end
    else
    begin
    MessageDlg('Cannot load QEMUMANDLL.DLL',MTError,[MBOK],0);
    Application.Terminate;
    end;
  finally
    FreeLibrary(h);
  end;
end;



procedure TMain.ToolButton4Click(Sender: TObject);
begin
SendCommand('sendkey ctrl-alt-delete');
end;

procedure TMain.PauseClick(Sender: TObject);
begin
If Pause.ImageIndex = 4 Then
  Begin
  SendCommand('stop');
  pause.ImageIndex := 5;
  End
Else
  Begin
  SendCommand('cont');
  pause.ImageIndex := 4;
  End;


end;

procedure TMain.ToolButton11Click(Sender: TObject);
begin
close
end;

procedure TMain.ResetVirtualMachine1Click(Sender: TObject);
begin
SendCommand('system_reset');
end;

procedure TMain.ShutdownVirtualMachine1Click(Sender: TObject);
begin
SendCommand('system_powerdown');
end;

procedure TMain.EjectCDDVDMediaFromDrive1Click(Sender: TObject);
begin
//0.9.0 Compat
SendCommand('eject -f cdrom');
//0.9.1
SendCommand('eject -f ide1-cd0');
end;

procedure TMain.LoadDiskImage1Click(Sender: TObject);
var cc : Boolean;
begin
With MediaOpen Do
  Begin
  Title := 'Select CD/DVD Image';
  DefaultExt := 'iso';
  FilterIndex := 1;
  cc := Execute;
  IF CC = True Then
    Begin
    //0.9.0 Compat
    EjectCDDVDMediaFromDrive1.Click;
    SendCommand('change cdrom '+Filename);
    //0.9.1
    SendCommand('change ide1-cd0 '+Filename);
    End;
  End;

end;

procedure TMain.UsePCCDDVDDrive1Click(Sender: TObject);
var
j : Integer;
begin
With SelPhysical DO
  Begin
  Drive.Clear;
   for j := 0 to 25 do If DetectCDROMDrives(Chr(j + 65) + ':') = True Then Drive.Items.Add(Chr(j + 65) + ':');

   If Drive.Items.Count > 0 Then
    Begin
    Drive.ItemIndex := 0;
    ShowModal;
    If ModalResult = MROK Then
      Begin
      EjectCDDVDMediaFromDrive1.Click;
      SendCommand('change cdrom '+'\\.\'+Drive.Text);
      //0.9.1
      SendCommand('change ide1-cd0 '+'\\.\'+Drive.Text);
      End;
    End Else MessageDlg('There are NO physical CD/DVD Drives to use!',MtError,[MBOK],0);
   End;
end;



Function TMain.DetectCDROMDrives(Drive : String) : Boolean;

var
DriveType: integer;
s: String;
begin
s := Drive; Result := False;
DriveType := GetDriveType(PChar(s));
If (Drive = 'A:') or (Drive = 'B:') Then Result := false Else
  Begin
  case DriveType of
    DRIVE_REMOVABLE:
    Result := False;
    DRIVE_FIXED:
    Result := False;
    DRIVE_CDROM:
    Result := True;
    end;
  End;
End;

Function TMain.DetectFloppyDrives(Drive : String) : Boolean;
var
DriveType: integer;
s: String;
begin
s := Drive; Result := False;
DriveType := GetDriveType(PChar(s));
case DriveType of
  DRIVE_REMOVABLE:
  Result := True;
  DRIVE_FIXED:
  Result := False;
  DRIVE_CDROM:
  Result := False;
  end;
End;


procedure TMain.MenuItem1Click(Sender: TObject);
begin
//0.9.0 Compat
SendCommand('eject -f fda');
//0.9.1
SendCommand('eject -f floppy0');

end;

procedure TMain.EjectFloppyDisk1MediaFromDrive1Click(Sender: TObject);
begin
//0.9.0 Compat
SendCommand('eject -f fdb');
//0.9.1
SendCommand('eject -f floppy1');

end;

procedure TMain.MenuItem2Click(Sender: TObject);
var cc : Boolean;
begin
With MediaOpen Do
  Begin
  Title := 'Select Floppy Disk 0 Image';
  DefaultExt := 'img';
  FilterIndex := 2;
  cc := Execute;
  IF CC = True Then
    Begin
    //0.9.0 Compat
    SendCommand('eject -f fda');
    //0.9.1
    SendCommand('eject -f floppy0');
    SendCommand('change fda '+Filename);
    //0.9.1
    SendCommand('change floppy0 '+Filename);
    End;
  End;

end;


procedure TMain.MenuItem3Click(Sender: TObject);
var
j : Integer;
begin
With SelPhysical DO
  Begin
  Drive.Clear;
   for j := 0 to 25 do If DetectFloppyDrives(Chr(j + 65) + ':') = True Then Drive.Items.Add(Chr(j + 65) + ':');
   If Drive.Items.Count > 0 Then
    Begin
    Drive.ItemIndex := 0;
    ShowModal;
    If ModalResult = MROK Then
      Begin
      //0.9.0 Compat
      SendCommand('eject -f fda');
      //0.9.1
      SendCommand('eject -f floppy0');
      SendCommand('change fda '+'\\.\'+Drive.Text);
      //0.9.1
      SendCommand('change floppy0 '+'\\.\'+Drive.Text);
      End;
    End Else MessageDlg('There are NO physical Floppy Disk Drives to use!',MtError,[MBOK],0);
   End;
end;

procedure TMain.LoadCDDVDDiskImageRestartVM1Click(Sender: TObject);
var cc : Boolean;
begin
With MediaOpen Do
  Begin
  Title := 'Select CD/DVD Image';
  DefaultExt := 'iso';
  FilterIndex := 1;
  cc := Execute;
  IF CC = True Then
    Begin
    //0.9.0 Compat
    EjectCDDVDMediaFromDrive1.Click;
    SendCommand('change cdrom '+Filename);
    //0.9.1
    SendCommand('change ide1-cd0 '+Filename);
    SendCommand('system_reset');
    End;
  End;

end;

procedure TMain.LoadFloppyDisk0DiskImageRestartVM1Click(Sender: TObject);
var cc : Boolean;
begin
With MediaOpen Do
  Begin
  Title := 'Select Floppy Disk 0 Image';
  DefaultExt := 'img';
  FilterIndex := 2;
  cc := Execute;
  IF CC = True Then
    Begin
    //0.9.0 Compat
    SendCommand('eject -f fda');
    //0.9.1
    SendCommand('eject -f floppy0');
    SendCommand('change fda '+Filename);
    //0.9.1
    SendCommand('change floppy0 '+Filename);
    SendCommand('system_reset');
    End;
  End;

end;
procedure TMain.ToolButton13Click(Sender: TObject);
var
  h : THandle;
  ResBmp :String;
  Bmp : TBitmap;
begin
With Help Do
  Begin
  h := LoadLibrary('QemuManDll.DLL');
  if h <> 0 then
    begin
    ResBmp := 'TI'+IntToStr(11);
    Bmp := Tbitmap.Create;
    Bmp.LoadFromResourceName(h,resBmp);
    Image.Picture.Bitmap.Assign(Bmp);
    ShowModal;
    Bmp.Free;
    FreeLibrary(h);
    End;
  end;
End;

procedure TMain.SaveSnapshot1Click(Sender: TObject);
var
ns : String;
begin
If InputQuery('Save State', 'State ID', NS) = True Then
  Begin
  SendCommand('savevm '+Ns);
  end;

end;

procedure TMain.LoadSnapshot1Click(Sender: TObject);
var
ns : String;
begin
If InputQuery('Load State', 'State ID', NS) = True Then
  Begin
  SendCommand('loadvm '+Ns);
  end;

end;

procedure TMain.DeleteSnapshot1Click(Sender: TObject);
var
ns : String;
begin
If InputQuery('Delete State', 'State ID', NS) = True Then
  Begin
  SendCommand('delvm '+Ns);
  end;
End;

procedure TMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
If StartIT = True Then CanClose := false;
end;



Procedure TMain.SendCommand(Cmd : String);
Begin
  Try
  TCP.SendCmd(Cmd);
  except
  on E: Exception do Status.Panels[1].Text := 'Error: '+E.Message;
  End;

End;


procedure TMain.CheckProcessTimer(Sender: TObject);
begin
CheckProcess.Enabled := False;
ScanSessionIDList(SysProcess);
end;



Procedure TMain.ScanSessionIDList(Session : Integer);
var
MyHandle: THandle;
Struct: TProcessEntry32;
DIDF,Failed : Boolean;
I,J,EndOf : Integer;
proc,FName : String;
TempString,FN : string;
CC : Boolean;
begin
DIDF := False;
Proc := IntToStr(Session);
MyHandle:=CreateToolHelp32SnapShot(TH32CS_SNAPPROCESS, 0);
Struct.dwSize:=Sizeof(TProcessEntry32);
if Process32First(MyHandle, Struct) then
If Proc = IntToStr(Struct.th32ProcessID) Then DIDF := True;
while Process32Next(MyHandle, Struct) do
If Proc = IntToStr(Struct.th32ProcessID) Then DIDF := True;
CloseHandle(MyHandle);

If DidF = False Then
  Begin
  Main.Enabled := True;
  StartIT := False;
  MessageDlg('QEMU did not launch correctly, please check your VM Settings and try launching again!'+#13+#13+SysLaunch,MtError,[MBOK],0);
  application.terminate;
  End Else Main.Enabled := True;
End;


procedure TMain.TCPDisconnected(Sender: TObject);
begin
Main.Enabled := True;
end;

Procedure TMain.LoadHelp;
Begin
end;


end.
