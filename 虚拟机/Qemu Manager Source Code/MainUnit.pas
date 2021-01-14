{Qemu Manager v5.0
(c) 2008 D.T.Reynolds
http://www.davereyn.co.uk
email: dave@davereyn.co.uk
Qemu Copyright © 2008 Fabrice Bellard.
http://fabrice.bellard.free.fr/qemu/
Qemu Manager is provided "as-is," without any express or implied warranty.
In no event shall the author be held liable for any damages arising from the
use of this software.
Permission is granted to anyone to use Qemu Manager and it source code for any purpose,
provided that the following condition is met:
1. The origin of Qemu Manager must not be misrepresented; you must not
   claim that you wrote Qemu Manager.
}

{-monitor tcp::4444,server,nowait}

unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls,  ToolWin, ExtCtrls, Menus,
  ImgList,IniFiles, StdCtrls, FileCtrl, WinSvc,ShellAPI,TLHelp32,
  strutils, Buttons, DB, dbf, TntComCtrls, TntMenus, TntStdCtrls,
  TntDialogs;

type
  TMain = class(TForm)
    PC: TTntPageControl;
    MainTS: TTntTabSheet;
    TV: TTntTreeView;
    Panel1: TPanel;
    SB: TTntStatusBar;
    MainMenu: TTntMainMenu;
    File1: TTntMenuItem;
    Exit1: TTntMenuItem;
    Options1: TTntMenuItem;
    ACC1: TTntMenuItem;
    Acc2: TTntMenuItem;
    N20: TTntMenuItem;
    CreateDiskImage1: TTntMenuItem;
    N1: TTntMenuItem;
    ShowLastLaunchCommand1: TTntMenuItem;
    N3: TTntMenuItem;
    ConfigureOperatingSystemDefaults1: TTntMenuItem;
    N11: TTntMenuItem;
    ConfigureMediaImagePaths1: TTntMenuItem;
    N6: TTntMenuItem;
    BrowseMediaFolders1: TTntMenuItem;
    BrowseDiskImageFolder1: TTntMenuItem;
    N13: TTntMenuItem;
    BrowseMediaImageFolder1: TTntMenuItem;
    N17: TTntMenuItem;
    drv: TTntMenuItem;
    N7: TTntMenuItem;
    pp2: TTntMenuItem;
    pp1: TTntMenuItem;
    CheckForUpdates1: TTntMenuItem;
    FTPServer1: TTntMenuItem;
    FTPStart: TTntMenuItem;
    FTPStop: TTntMenuItem;
    N10: TTntMenuItem;
    ConfigureFTPServer1: TTntMenuItem;
    Session: TTntMenuItem;
    PauseSession1: TTntMenuItem;
    N8: TTntMenuItem;
    RebootSession1: TTntMenuItem;
    N9: TTntMenuItem;
    QuitSession1: TTntMenuItem;
    Help1: TTntMenuItem;
    Index1: TTntMenuItem;
    N4: TTntMenuItem;
    About1: TTntMenuItem;
    Splitter1: TSplitter;
    FL: TFileListBox;
    TntLabel1: TTntLabel;
    MIL: TImageList;
    SysTimer: TTimer;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    Play: TToolButton;
    ToolButton11: TToolButton;
    Stop: TToolButton;
    SaveDlg: TTntSaveDialog;
    ToolButton10: TToolButton;
    ToolButton8: TToolButton;
    scanFl: TFileListBox;
    MIL3: TImageList;
    OpSysDB: TDbf;
    OpSysDBNAME: TStringField;
    OpSysDBDISK: TStringField;
    OpSysDBRAM: TStringField;
    OpSysDBINDEX: TStringField;
    OpSysDBHARDWARE: TStringField;
    ProcessDB: TDbf;
    ProcessDBPROCESSID: TStringField;
    ProcessDBVM: TStringField;
    ScanProcDB: TDbf;
    ScanProcDBPROCESSID: TStringField;
    ScanProcDBVM: TStringField;
    QMVersDB: TDbf;
    QMVersDBDESC: TStringField;
    QMVersDBEXE: TStringField;
    QMVersDBVNO: TStringField;
    QMVersDBQMCLIENT: TStringField;
    QMVersDBKQEMU: TStringField;
    QMVersDBSUBDIR: TStringField;
    QemuVersionControlManager1: TTntMenuItem;
    Dock: TPopupMenu;
    RestoreQemuManage1: TMenuItem;
    N2: TMenuItem;
    QuitQemuManager1: TMenuItem;
    N5: TMenuItem;
    ScreenCapture1: TMenuItem;
    SD: TTntSaveDialog;
    QMVersDBDEFAULT: TStringField;
    Mil2: TImageList;
    PC2: TTntPageControl;
    TntTabSheet1: TTntTabSheet;
    Label1: TLabel;
    HLV: TTntListView;
    TntTabSheet3: TTntTabSheet;
    DLV: TTntListView;
    Netsheet: TTntTabSheet;
    NLV: TTntListView;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    TntTabSheet5: TTntTabSheet;
    ALV: TTntListView;
    N12: TTntMenuItem;
    DisableQemuManagerQEMUClientSupport1: TTntMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure TVClick(Sender: TObject);
    procedure HLVDblClick(Sender: TObject);
    procedure DLVDblClick(Sender: TObject);
    procedure NLVDblClick(Sender: TObject);
    procedure ALVDblClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PlayClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SysTimerTimer(Sender: TObject);
    procedure TVGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure ShowLastLaunchCommand1Click(Sender: TObject);
    procedure StopClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure CreateDiskImage1Click(Sender: TObject);
    procedure ACC1Click(Sender: TObject);
    procedure Acc2Click(Sender: TObject);
    procedure drvClick(Sender: TObject);
    procedure FTPStartClick(Sender: TObject);
    procedure FTPStopClick(Sender: TObject);
    procedure BrowseDiskImageFolder1Click(Sender: TObject);
    procedure BrowseMediaImageFolder1Click(Sender: TObject);
    procedure ConfigureFTPServer1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure ConfigureOperatingSystemDefaults1Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure TCPConnected(Sender: TObject);
    procedure TCPDisconnected(Sender: TObject);
    procedure QuitQemuManager1Click(Sender: TObject);
    procedure RestoreQemuManage1Click(Sender: TObject);
    procedure ScreenCapture1Click(Sender: TObject);
    procedure WndProc(var Msg : TMessage); override;
    procedure QemuVersionControlManager1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure CheckForUpdates1Click(Sender: TObject);
    procedure DisableQemuManagerQEMUClientSupport1Click(Sender: TObject);
  private
    { Private declarations }
  public
  { Public declarations }
  TINotifyData : TNotifyIconData;
  Procedure CalcVM;
  Function ReadData(VM : String; Group : String; Key : String) : String;
  Procedure WriteData(VM : String; Group : String; Key : String; Data : string);
  Procedure DeleteData(VM : String; Group : String; Key : String);
  Procedure AddImages(ImageName : String; ListToAdd : TImageList;Inc : Integer);
  Procedure ReadSystemConfig(FR : Boolean);
  Procedure RetrieveVMInfo(Name : string;Index : Integer);
  Function DetectCDROMDrives(Drive : String) : Boolean;
  Function DetectFloppyDrives(Drive : String) : Boolean;
  Function CreateVirtualDisk(Name : string; Size : String; FSys : String) : Boolean;
  Procedure ExecConsoleApp(Path : String; Params : String);
  Function PrepareQEMUToRun : String;
  Function FindBiosLocation : String;
  Function CheckFileName(Fname : String) : String;
  Function MCheckFileName(Fname : String) : String;
  Procedure LaunchQemu(LaunchStr : String; Client : Boolean);
  function CheckKQemuRunning(SM,SS : string) : DWord;
  function ServStart(SM, SS : string) : boolean;
  function ServStop(SM,SS : string) : boolean;
  Function DirtyCreate(Name : string; usecli : Boolean) : Boolean;
  Function CreateDisk(DType : String; Size : Integer; Name : String) : String;
  Procedure CheckDriverStatus;
  function runwait(const FName, Pars: string; Ws: Word): Boolean;
  Procedure WriteSysData(Head : String; Key : string; Value : string);
  Procedure DebugRun;
  Function GetTempDir : String;
  Procedure UpdateTV(VM: String; Mode : Integer);
  Function CreateDiskImage(SourceF : String; DestF : String; Prog : TProgressBar) : Boolean;
//  Function SendCommand(Session : String; Command : String) : Boolean;
  Procedure ScanSessionIDList;
  Function GeneratePortNo : Integer;
  Function DeletePortNo(Port : Integer) : Boolean;
  end;

var
  Main: TMain;
  Node1: TTNTTreeNode;
  SysPath,SysLang,GetShellDirectory,QMSessionName : String;
  FTEnable,FTAll,FTPPath,AllowList: String;
  SelType,DefKeyIndex,paintcount,Wiz : Integer;
  LastRun,LastRunPar,WaitText,ActMedia,DefKeyLay : string;
  PortSL : TStringlist;
  ProcTF : Textfile;
  SysStopSvc : Boolean;
  NOQMQC : String;
  

implementation

uses SelMemUnit, SelProcUnit, YesNoUnit, SelSoundUnit, QPathUnit,
  SelWindowNoUnit, SelCDFLOPUNIT, VlanUnit, InputUnit, RedirectUnit,
  ListenUnit, COnnectorUnit, NewVlanUnit, KeybUnit, SelMachineUnit,
  ProcPriUnit, NewVMUnit, NewDiskUnit, LastRunUnit, FtpSetupUnit, InfoUnit,
  AboutUnit, OpSysUnit, ImpExpUnit, MediaWizardUnit, QMVersUnit,
  SelQPathUnit, ProfileWizUnit;

{$R *.dfm}

Procedure TMain.CalcVM;
var
j : Integer;
Ini : TIniFile;
Begin
TV.Items.Clear;
if(TV.Items.Count = 0) then
  begin
  with TV.Items.AddFirst(nil,'Virtual Machines') do
	  begin
    Selected := true;
    end;
  end else Exit;

FL.Directory := SysPAth+'\Images';
FL.Mask := '*.VM';
IF FL.Count > 0 Then
  Begin
  For J := 0 to FL.Items.Count-1 DO
    Begin
    Ini := TIniFile.Create(SysPath+'\Images\'+FL.Items[j]);
    With Ini Do
      Begin
      with tv.Items.AddChildFirst(TV.Selected,Copy(FL.Items[j],1,Length(FL.Items[J])-3)) do
        Begin
        ImageIndex := 0;
        SelectedIndex := 0;
        If ReadData(Copy(FL.Items[j],1,Length(FL.Items[J])-3),'General','Status') = 'Running' Then
          Begin
          ImageIndex := 8;
          SelectedIndex := 8;
          End;
        MakeVisible;
        End;
      End;
    Ini.Free;
    End;
  End;
SB.Panels[0].Text := 'Total Virtual Machines: '+IntToStr(FL.Items.Count);
TV.Refresh;
End;
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

Procedure TMain.WriteData(VM : String; Group : String; Key : String; Data : string);
var
Ini : TInifile;
Begin
INI := TINIFile.Create(SysPath+'\images\'+VM+'.VM');
Ini.WriteString(Group,Key,Data);
Ini.Free;

End;

Procedure TMain.DeleteData(VM : String; Group : String; Key : String);
var
Ini : TInifile;
Begin
INI := TINIFile.Create(SysPath+'\images\'+VM+'.VM');
Ini.DeleteKey(Group,Key);
Ini.Free;

End;


procedure TMain.FormCreate(Sender: TObject);
begin
with TINotifyData do
  Begin
  hIcon := Application.Icon.Handle;
  uCallbackMessage := WM_USER + 1;
  cbSize := sizeof(TINotifyData);
  Wnd := Handle;
  uID := 100;
  uFlags := NIF_MESSAGE + NIF_ICON + NIF_TIP;
  end;
StrPCopy(TINotifyData.szTip, Application.Title);
ReadSystemConfig(False);
If CheckKQemuRunning('','KQEMU') = 1 Then SB.Panels[1].Text := '' else SB.Panels[1].Text := 'KQEMU Driver Started';
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
           ListToAdd.AddMasked(Bmp,clFuchsia);
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

Procedure TMain.ReadSystemConfig(FR : Boolean);
var
INI : TIniFile;
Begin
SysPath := ExtractFileDir(Application.ExeName);
INI := TINIFile.Create(SysPath+'\qman.ini');
With Ini Do
  Begin
  Wiz := ReadInteger('General','WizardComplete',0);
  SysLang := ReadString('General','Language','English');
  DefKeyLay :=ReadString('General','Default Keyboard Layout','en-us');
  DefKeyIndex := ReadInteger('General','Default Keyboard Index',-1);
  NOQMQC := ReadString('General','Client Support','Yes');
  FTEnable := ReadString('FileTransfer','Enable Folder','0');
  FTAll := ReadString('FileTransfer','Share All','0');
  FTPPath := ReadString('FileTransfer','Share Dir','');
  AllowList := ReadString('FileTransfer','Allow','');
  If NoQMQC = 'No' Then DisableQemuManagerQEMUClientSupport1.Checked := true Else DisableQemuManagerQEMUClientSupport1.Checked := False;
  If ReadString('General','Stop Services','False') = 'True' Then SysStopSvc := True Else SysStopSvc := False;
  If sysStopSvc = True Then Drv.Checked := true Else Drv.Checked := false;
  End;
Ini.Free;

If FR = False Then
  Begin
  //Get Images From DLL
  If FileExists(SysPath+'\qemumandll.dll') Then
    Begin
   AddImages('MI',MIL,57);
   AddImages('NI',MIL2,12);
   //Session Images
  AddImages('TI',MIL3,2);
    End;
  OpSysDB.FilePath := SysPath;
  QMVersDB.FilePath := SysPath;
  OpSysDB.Active := True;
  QMVersDB.Active := true;
  ProcessDB.FilePath := SysPath;
  ScanProcDB.FilePath := SysPath;
  ProcessDB.Active := True;
  ScanProcDB.Active := True;
  End;
//Display VM'S
ScanSessionIDList;
CalcVM;
If TV.Items.Count > 1 Then
  Begin
  TV.Items.Item[1].Selected := True;
  RetrieveVMInfo(tv.Selected.Text,tv.selected.Index);
  End;

// Run Wizard
If Wiz > 0 Then
  Begin
  CheckDriverStatus;
  SysTimer.Enabled := True;
  End;
End;
procedure TMain.TVClick(Sender: TObject);
begin

if Tv.selected.text= 'Virtual Machines' Then PC2.Visible := false Else
  Begin
  RetrieveVMInfo(tv.Selected.Text,tv.selected.Index);
  End;
end;



Procedure TMain.RetrieveVMInfo(Name : string; Index : Integer);
var
INI : TIniFile;
I,j : Integer;
ListItem : TTNTListItem;
S : String;
Begin
PC2.Visible := True;
Ini := TIniFile.Create(SysPath+'\Images\'+Name+'.vm');
With Ini Do
  Begin

  HLV.Clear; DLV.Clear; NLV.Clear; ALV.Clear;
 ListItem := HLV.Items.Add; Listitem.Caption := 'Virtual Machine Name'; ListItem.SubItems.Add(TV.Selected.Text);  ListItem.ImageIndex := 51;
  ListItem := HLV.Items.Add; Listitem.Caption := 'Operating System'; ListItem.SubItems.Add(ReadString('General','Operating System',''));  ListItem.ImageIndex := 0;
   ListItem := HLV.Items.Add; Listitem.Caption := 'Machine Description'; ListItem.SubItems.Add(ReadString('Advanced','MachineType',''));ListItem.ImageIndex := 28;

  ListItem := HLV.Items.Add; Listitem.Caption := 'Memory'; ListItem.SubItems.Add(ReadString('Hardware','RAM','')+' MB');ListItem.ImageIndex := 2;
  ListItem := HLV.Items.Add; Listitem.Caption := 'Processors'; ListItem.SubItems.Add(ReadString('Hardware','Processors',''));ListItem.ImageIndex := 3;
  ListItem := HLV.Items.Add; Listitem.Caption := 'Enable Sound'; ListItem.SubItems.Add(ReadString('Audio','Enable Sound',''));ListItem.ImageIndex := 19;
  If ReadString('Audio','Enable Sound','') ='Yes' Then
    Begin
    S := '';
    IF ReadString('Audio','Use Adlib','') = 'Yes' Then If S = '' Then S := 'Adlib' Else S := S+',Adlib';
    IF ReadString('Audio','Use SB16','') = 'Yes' Then If S = '' Then S := 'SB16' Else S := S+',SB16';
    IF ReadString('Audio','Use ES1370','') = 'Yes' Then If S = '' Then S := 'ES1370' Else S := S+',ES1370';
    IF S = '' Then S := 'None Selected';
    ListItem := HLV.Items.Add; Listitem.Caption := 'Sound Devices'; ListItem.SubItems.Add(s);ListItem.ImageIndex := 20;
    End;
  ListItem := HLV.Items.Add; Listitem.Caption := 'Enable Network Card'; ListItem.SubItems.Add(ReadString('Hardware','Network',''));ListItem.ImageIndex := 45;
  If ReadString('Hardware','Network','') = 'Yes' Then NetSheet.TabVisible := True Else NetSheet.TabVisible := False;

  ListItem := HLV.Items.Add; Listitem.Caption := 'Keyboard Language'; ListItem.SubItems.Add(ReadString('Hardware','Keyboard','en-us'));ListItem.ImageIndex := 42;
  ListItem := HLV.Items.Add; Listitem.Caption := 'Full Screen Display'; ListItem.SubItems.Add(ReadString('Hardware','Full Screen Display',''));ListItem.ImageIndex := 6;

//QM CLIENT
ListItem := HLV.Items.Add; Listitem.Caption := 'Use Qemu Manager QEMU Client'; ListItem.SubItems.Add(ReadString('Hardware','Qemu Manager Client',''));ListItem.ImageIndex := 56;

ListItem := HLV.Items.Add; Listitem.Caption := 'Last Run'; ListItem.SubItems.Add(ReadString('General','Last Run',''));ListItem.ImageIndex := 1;

//RUPERT

  // NOW DRIVES
  ListItem := DLV.Items.Add; Listitem.Caption := 'Hard Disk 0 '; ListItem.SubItems.Add(ReadString('Drives','HDA',''));ListItem.ImageIndex := 16;
  ListItem := DLV.Items.Add; Listitem.Caption := 'Hard Disk 1 '; ListItem.SubItems.Add(ReadString('Drives','HDB',''));ListItem.ImageIndex := 33;
  ListItem := DLV.Items.Add; Listitem.Caption := 'Hard Disk 2 '; ListItem.SubItems.Add(ReadString('Drives','HDC',''));ListItem.ImageIndex := 34;
  ListItem := DLV.Items.Add; Listitem.Caption := 'Hard Disk 3 '; ListItem.SubItems.Add(ReadString('Drives','HDD',''));ListItem.ImageIndex := 35;
  ListItem := DLV.Items.Add; Listitem.Caption := 'Use PC CD-ROM Drive'; ListItem.SubItems.Add(ReadString('Drives','Use System CD',''));ListItem.ImageIndex := 38;


  If ReadString('Drives','Use System CD','') = 'Yes' Then
    Begin
    ListItem := DLV.Items.Add; Listitem.Caption := 'CD-ROM Drive'; ListItem.SubItems.Add(ReadString('Drives','System CD Drive',''));ListItem.ImageIndex := 39;
    End
  Else
    Begin
    ListItem := DLV.Items.Add; Listitem.Caption := 'CD-ROM Image File'; ListItem.SubItems.Add(ReadString('Drives','CDROM',''));ListItem.ImageIndex := 17;
    End;

  //Check For SYSTEM CD
  ListItem := DLV.Items.Add; Listitem.Caption := 'Boot From CD-ROM'; ListItem.SubItems.Add(ReadString('Drives','Boot CDROM',''));ListItem.ImageIndex := 21;
  ListItem := DLV.Items.Add; Listitem.Caption := 'Floppy Disk 0 Image File'; ListItem.SubItems.Add(ReadString('Drives','Floppy',''));ListItem.ImageIndex := 18;
  ListItem := DLV.Items.Add; Listitem.Caption := 'Use PC Floppy Disk Drive'; ListItem.SubItems.Add(ReadString('Drives','USePCFloppy',''));ListItem.ImageIndex := 43;

    If ReadString('Drives','UsePCFloppy','No') = 'Yes' Then
    Begin
    ListItem := DLV.Items.Add; Listitem.Caption := 'Floppy Drive 0'; ListItem.SubItems.Add(ReadString('Drives','System Floppy Drive',''));ListItem.ImageIndex := 18;
    End
  Else
    Begin
    ListItem := DLV.Items.Add; Listitem.Caption := 'Floppy Disk 1 Image File'; ListItem.SubItems.Add(ReadString('Drives','FloppyB',''));ListItem.ImageIndex := 36;
    End;
  ListItem := DLV.Items.Add; Listitem.Caption := 'Boot From Floppy 0'; ListItem.SubItems.Add(ReadString('Drives','BootFloppy',''));ListItem.ImageIndex := 37;
  ListItem := dLV.Items.Add; Listitem.Caption := 'Saved State ID'; ListItem.SubItems.Add(ReadString('Advanced','SavedState',''));ListItem.ImageIndex := 31;

  //NOW NETWORK
  I := StrToInt(ReadString('Network','VLANS','0'));
   IF I > 0 Then
    Begin
    For J := 0 to I-1 Do
      Begin
      ListItem := NLV.Items.Add; Listitem.Caption := 'VLAN '+IntToStr(J);
      ListItem.SubItems.Add(ReadString('Network','VLAN'+IntToStr(j),''));ListItem.ImageIndex := 22;
      If ReadString('Network','VLAN'+IntToStr(j),'') = 'Tap Networking' Then
        Begin
        ListItem := NLV.Items.Add; Listitem.Caption := 'VLAN '+IntToStr(j)+' Tap ID';
        ListItem.SubItems.Add(ReadString('Network','VLAN'+IntToStr(j)+'TAPID',''));ListItem.ImageIndex := 41;
        End;
      ListItem := NLV.Items.Add; Listitem.Caption := 'VLAN '+IntToStr(j)+' Mac Address ';
      If ReadString('Network','VLAN'+IntToStr(j)+'Mac','') ='' Then
        Begin
        ListItem.SubItems.Add('Automatic');ListItem.ImageIndex := 40;
        End
      Else
        Begin
        ListItem.SubItems.Add(ReadString('Network','VLAN'+IntToStr(j)+'Mac',''));ListItem.ImageIndex := 40;
        End;
      ListItem := NLV.Items.Add; Listitem.Caption := 'VLAN '+IntToStr(j)+' Listeners';
      ListItem.SubItems.Add(ReadString('Network','VLAN'+IntToStr(j)+'Listener',''));ListItem.ImageIndex := 25;
      ListItem := NLV.Items.Add; Listitem.Caption := 'VLAN '+IntToStr(j)+' Connectors';
      ListItem.SubItems.Add(ReadString('Network','VLAN'+IntToStr(j)+'Connector',''));ListItem.ImageIndex := 26;
      End;
    end;

   ListItem := NLV.Items.Add; Listitem.Caption := 'Port Redirections';
   ListItem.SubItems.Add(ReadString('Network','RedirectString',''));ListItem.ImageIndex := 27;

//   ListItem := NLV.Items.Add; Listitem.Caption := 'TFTP Folder';
//   ListItem.SubItems.Add(ReadString('Network','TFTP','None'));ListItem.ImageIndex := 53;

   // ADVANCED;
   ListItem := ALV.Items.Add; Listitem.Caption := 'Qemu Path'; ListItem.SubItems.Add(ReadString('General','Qemu Path',''));ListItem.ImageIndex := 5;
   ListItem := ALV.Items.Add; Listitem.Caption := 'Qemu EXE Name'; ListItem.SubItems.Add(ReadString('General','Qemu Exe',''));ListItem.ImageIndex := 21;
   //NEW RUPERT
  ListItem := ALV.Items.Add; Listitem.Caption := 'Disable ACPI Support'; ListItem.SubItems.Add(ReadString('Advanced','ACPI',''));ListItem.ImageIndex := 48;
  ListItem := ALV.Items.Add; Listitem.Caption := 'Standard VGA Mode'; ListItem.SubItems.Add(ReadString('Advanced','VGA',''));ListItem.ImageIndex := 50;
  ListItem := ALV.Items.Add; Listitem.Caption := 'Close VM When Rebooted'; ListItem.SubItems.Add(ReadString('Advanced','NoReboot',''));ListItem.ImageIndex := 49;
  ListItem := ALV.Items.Add; Listitem.Caption := 'Enable SDL output'; ListItem.SubItems.Add(ReadString('Advanced','SDL',''));ListItem.ImageIndex := 47;
  ListItem := ALV.Items.Add; Listitem.Caption := 'Launch as VNC Server'; ListItem.SubItems.Add(ReadString('Hardware','VNC Server',''));ListItem.ImageIndex := 14;
  If ReadString('Hardware','VNC Server','') = 'Yes' Then
    Begin
    ListItem := ALV.Items.Add; Listitem.Caption := 'VNC Window No'; ListItem.SubItems.Add(ReadString('Hardware','VNC Number',''));ListItem.ImageIndex := 15;
    End;
  ListItem := ALV.Items.Add; Listitem.Caption := 'Enable USB Tablet Device'; ListItem.SubItems.Add(ReadString('Hardware','USB Tablet',''));ListItem.ImageIndex := 44;
//  ListItem := ALV.Items.Add; Listitem.Caption := 'Run as Windows Service (Caution)'; If ReadString('General','Service','') = '1' Then ListItem.SubItems.Add('Yes') else ListItem.SubItems.Add('No');ListItem.ImageIndex := 54;
  ListItem := ALV.Items.Add; Listitem.Caption := 'Do Not Start CPU on Startup'; ListItem.SubItems.Add(ReadString('Hardware','Do Not Start CPU',''));ListItem.ImageIndex := 32;
  ListItem := ALV.Items.Add; Listitem.Caption := 'Simulate ISA System'; ListItem.SubItems.Add(ReadString('Hardware','Simulate ISA',''));ListItem.ImageIndex := 7;
  ListItem := ALV.Items.Add; Listitem.Caption := 'Use Local Time'; ListItem.SubItems.Add(ReadString('Hardware','Use Local Time',''));ListItem.ImageIndex := 8;
  ListItem := ALV.Items.Add; Listitem.Caption := 'Dock QEMU Manager on VM Launch'; ListItem.SubItems.Add(ReadString('Hardware','Dock Qemu Manager',''));ListItem.ImageIndex := 9;
  ListItem := ALV.Items.Add; Listitem.Caption := 'Disable ALL Accelerator Support'; ListItem.SubItems.Add(ReadString('Hardware','Disable Accelerator',''));ListItem.ImageIndex := 10;
  ListItem := ALV.Items.Add; Listitem.Caption := 'Enable FULL acceleration Support'; ListItem.SubItems.Add(ReadString('Hardware','Full Acceleration',''));ListItem.ImageIndex := 11;
  ListItem := ALV.Items.Add; Listitem.Caption := 'Enable WIN2K Hack'; ListItem.SubItems.Add(ReadString('Hardware','Enable WIN2K Hack',''));ListItem.ImageIndex := 12;
  ListItem := ALV.Items.Add; Listitem.Caption := 'Do Not Apply Changes to VM Session'; ListItem.SubItems.Add(ReadString('Hardware','Do Not Apply',''));ListItem.ImageIndex := 13;
  ListItem := ALV.Items.Add; Listitem.Caption := 'Qemu Process Priority (CAUTION)'; ListItem.SubItems.Add(ReadString('Advanced','Process',''));ListItem.ImageIndex := 46;
  ListItem := ALV.Items.Add; Listitem.Caption := 'Run VM In Debug Mode'; ListItem.SubItems.Add(ReadString('Advanced','Debug','No'));ListItem.ImageIndex := 52;
  ListItem := ALV.Items.Add; Listitem.Caption := 'Override All Settings'; ListItem.SubItems.Add(ReadString('Advanced','OverrideAll',''));ListItem.ImageIndex := 29;
  ListItem := ALV.Items.Add; Listitem.Caption := 'Optional Launch Data'; ListItem.SubItems.Add(ReadString('Advanced','OptionalString',''));ListItem.ImageIndex := 30;

  //SESSPANEL
//If ReadString('General','Status','') = 'Running' Then SessPanel.Visible := True Else SessPanel.Visible := False;

  End;

Ini.Free;
//PC2.Visible := True;
//tv.Repaint;
End;




procedure TMain.HLVDblClick(Sender: TObject);
var
I : Integer;
MemoryStatus: TMemoryStatus;
T : LongInt;
DoDrive : Boolean;
SL : TStringList;
j : Integer;
CC : Boolean;
begin
If HLV.ItemIndex > -1 Then
  Begin
I  := HLV.Selected.ImageIndex;
//MEMORY
If I = 2 Then
  Begin
  With SelMemory DO
    Begin
    SE.Value := StrToInt(ReadData(TV.Selected.Text,'Hardware','RAM'));
    MemoryStatus.dwLength := SizeOf(MemoryStatus) ;
    GlobalMemoryStatus(MemoryStatus) ;
    with MemoryStatus do T :=dwAvailPhys div 1024 div 1024;
    SE.MaxLength := t;
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Hardware','RAM',SE.Text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;

// M TYPE
If I = 28 Then
  Begin
  With MType Do
    Begin
    Main.QMVersDB.First;
    CB.Clear;
    If Main.QMVersDB.IsEmpty = false Then
      Begin
      SL := TStringList.Create;
      Repeat
      If Main.QMVersDBDefault.Text = 'Yes' Then CB.Items.Add(Main.QMversDBDesc.text) Else SL.Add(Main.QMVersDBDesc.Text);
      Main.QMversDB.Next;
      Until Main.QMVersDB.EOF = True;
      IF SL.Count > 0 Then
      For J := 0 To SL.Count-1 Do CB.Items.Add(SL.Strings[j]);
      CB.ItemIndex := 0;
      SL.Free;
      End;
    If ReadData(TV.Selected.Text,'Advanced','MachineTypeIndex') > '' Then
    CB.ItemIndex := StrToInt(ReadData(TV.Selected.Text,'Advanced','MachineTypeIndex')) Else CB.ItemIndex := -1;
    ShowModal;
    If ModalResult = MROK Then
      Begin
      if MessageDlg('Do you want Qemu  Manager to automatically modify this VM to match selected machine type ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
        Main.QMVersDB.First;
        CC := False;
        Repeat
        If CB.Text = Main.QMVersDBDesc.Text Then
          Begin
          WriteData(TV.Selected.Text,'General','Qemu Path',Main.QMVersDBSubDir.Text);
          WriteData(TV.Selected.Text,'General','Qemu EXE',Main.QMVersDBEXE.Text);
          CC := true;
          End Else Main.QMVersDB.Next;
          Until (Main.QMVersDB.EOF = True) or (CC = True);
        End;
      WriteData(TV.Selected.Text,'Advanced','MachineType',CB.Text);
      WriteData(TV.Selected.Text,'Advanced','MachineTypeIndex',IntToStr(CB.ItemIndex));
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;


//PROCESSORS
If I = 3 Then
  Begin
  With SelProc DO
    Begin
    SE.Value := StrToInt(ReadData(TV.Selected.Text,'Hardware','Processors'));
    SE.MaxLength := 255;
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Hardware','Processors',SE.Text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;

//Enable USB


If I = 4 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Hardware','Enable USB') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Enable USB devices ?';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Hardware','Enable USB',CB.Text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;


// ENABLE CLIENT NEW

If I = 56 Then
  Begin
  If NOQMQC = 'Yes' Then
    Begin
    With YesNo DO
      Begin
      If ReadData(TV.Selected.Text,'Hardware','Qemu Manager Client') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
      Caption.Caption := 'Enable Qemu Manager QEMU Client ?';
      ShowModal;
      If ModalResult = MROK Then
        Begin
        WriteData(TV.Selected.Text,'Hardware','Qemu Manager Client',CB.Text);
        RetrieveVMInfo(TV.Selected.Text,0);
        End;
      End;
    End Else MessageDlg('You currently have Qemu Manager QEMU Client support disabled',MtError,[MBOK],0);
  End;



//Enable Audio
If I = 19 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Audio','Enable Sound') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Enable Sound Devices ?';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Audio','Enable Sound',CB.Text);
      WriteData(TV.Selected.Text,'Audio','Use SB16','Yes');
      WriteData(TV.Selected.Text,'Audio','Use ES1370','Yes');
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;
//Sound Devices
If I = 20 Then
  Begin
  With SelSound DO
    Begin
    If ReadData(TV.Selected.Text,'Audio','Use SB16') = 'Yes' Then SB16.Checked := True Else SB16.Checked := False;
    If ReadData(TV.Selected.Text,'Audio','Use ES1370') = 'Yes' Then ES1370.Checked := True Else ES1370.Checked := False;
    If ReadData(TV.Selected.Text,'Audio','Use Adlib') = 'Yes' Then Adlib.Checked := True Else Adlib.Checked := False;
    ShowModal;
    If ModalResult = MROK Then
      Begin
      If SB16.checked = True Then WriteData(TV.Selected.Text,'Audio','Use SB16','Yes') Else WriteData(TV.Selected.Text,'Audio','Use SB16','No');
      If ES1370.checked = True Then WriteData(TV.Selected.Text,'Audio','Use ES1370','Yes') Else WriteData(TV.Selected.Text,'Audio','Use ES1370','No');
      If Adlib.checked = True Then WriteData(TV.Selected.Text,'Audio','Use Adlib','Yes') Else WriteData(TV.Selected.Text,'Audio','Use Adlib','No');
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;

// Full Screen
If I = 6 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Hardware','Full Screen Display') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Full Screen Display ?';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Hardware','Full Screen Display',CB.text);
      If CB.Text = 'Yes' Then Begin WriteData(TV.Selected.Text,'Hardware','Qemu Manager Client','No'); I := 15 End Else
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;

// Enable Network
If I = 45 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Hardware','Network') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Enable Networking ?';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Hardware','Network',CB.text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;

 //keyb
If I = 42 Then
  Begin
  With Keyb DO
    Begin
    If ReadData(TV.Selected.Text,'Hardware','KeyboardIndex') > '' Then
    CB.ItemIndex := StrToInt(ReadData(TV.Selected.Text,'Hardware','KeyboardIndex')) Else CB.ItemIndex := -1;
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(Tv.Selected.Text,'Hardware','Keyboard',CB.Text);
      WriteData(Tv.Selected.Text,'Hardware','KeyboardIndex',IntToStr(CB.ItemIndex));

      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;
  End;

end;
procedure TMain.DLVDblClick(Sender: TObject);
var
i,j: Integer;
DoDrive : Boolean;
begin
//hda
If DLV.ItemIndex > -1 Then
Begin
I  := DLV.Selected.ImageIndex;
If I = 16 Then
  Begin
  With SelQPath DO
    Begin
    SelType := 1;
    NewBtn.Visible := True; Pdisk.Visible := true;
    Caption.Caption := 'Specify Hard Disk 0 Path';
    QPath.Text := ReadData(TV.Selected.Text,'Drives','HDA');
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(Tv.Selected.Text,'Drives','HDA',QPath.Text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    SelType := 0;
    NewBtn.Visible := false;Pdisk.Visible :=False;
    End;
  End;

If I = 31 Then
  Begin
  With InputFrm DO
      Begin
      GB.Caption := 'Saved State ID';
      Caption.Caption := 'Enter Saved State ID';
      Text.Text := ReadData(Tv.Selected.Text,'Advanced','SavedState');
      ShowModal;
      If ModalResult = MROK Then
        Begin
        WriteData(Tv.Selected.Text,'Advanced','SavedState',Text.Text);
        RetrieveVMInfo(TV.Selected.Text,0);
        End;
      end;
  end;





If I = 33 Then
  Begin
  With SelQPath DO
    Begin
    SelType := 1;
    NewBtn.Visible := True;  Pdisk.Visible := true;
    Caption.Caption := 'Specify Hard Disk 1 Path';
    QPath.Text := ReadData(TV.Selected.Text,'Drives','HDB');
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(Tv.Selected.Text,'Drives','HDB',QPath.Text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    SelType := 0;
    NewBtn.Visible := False; Pdisk.Visible := False;
    End;
  End;
If I = 34 Then
  Begin
  With SelQPath DO
    Begin
    SelType := 1;
    NewBtn.Visible := True; Pdisk.Visible := true;
    Caption.Caption := 'Specify Hard Disk 2 Image';
    QPath.Text := ReadData(TV.Selected.Text,'Drives','HDC');
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(Tv.Selected.Text,'Drives','HDC',QPath.Text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
      SelType := 0;
      NewBtn.Visible := False;  Pdisk.Visible := false;
    End;
  End;

If I = 35 Then
  Begin
  With SelQPath DO
    Begin
    SelType := 1;
    NewBtn.Visible := True; Pdisk.Visible := true;
    Caption.Caption := 'Specify Hard Disk 3 Image';
    QPath.Text := ReadData(TV.Selected.Text,'Drives','HDD');
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(Tv.Selected.Text,'Drives','HDD',QPath.Text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
      SelType := 0;
      NewBtn.Visible := False; Pdisk.Visible := False;
    End;
  End;
//CDROM
If I = 17 Then
  Begin
  With SelQPath DO
    Begin
    ODMedia.Filter := 'CD/DVD Image|*.Iso|Floppy Image|*.img|All Files|*.*';
    SelType := 2; Imp.Visible := True;
    Caption.Caption := 'Specify CD/DVD Image';
    QPath.Text := ReadData(TV.Selected.Text,'Drives','CDROM');
    ShowModal;
    If ModalResult = MROK Then
      Begin
      IF QPath.Text > '' Then
        Begin
        If ReadData(TV.Selected.Text,'Drives','Use System CD') = 'Yes' Then WriteData(TV.Selected.Text,'Drives','Use System CD','No');
        End;

      WriteData(Tv.Selected.Text,'Drives','CDROM',QPath.Text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
      SelType := 0;  Imp.Visible := False;
    End;
  End;


//FLOPPY DISK 1
If I = 18 Then
  Begin
  With SelQPath DO
    Begin
    SelType := 2; Imp.Visible := True;
    ODMedia.Filter := 'Floppy Image|*.img|CD/DVD Image|*.Iso|All Files|*.*';
    Caption.Caption := 'Specify Floppy Disk Image';
    QPath.Text := ReadData(TV.Selected.Text,'Drives','Floppy');
    ShowModal;
    If ModalResult = MROK Then
      Begin
      IF QPath.Text > '' Then
        Begin
        If ReadData(TV.Selected.Text,'Drives','USePCFloppy') = 'Yes' Then WriteData(TV.Selected.Text,'Drives','USePCFloppy','No');
        End;
      WriteData(Tv.Selected.Text,'Drives','Floppy',QPath.Text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
      SelType := 0; Imp.Visible := False;
    End;
  End;

//FLOPPY DISK 2
If I = 36 Then
  Begin
  With SelQPath DO
    Begin
    SelType := 2; Imp.Visible := True;
    ODMedia.Filter := 'Floppy Image|*.img|CD/DVD Image|*.Iso|All Files|*.*';
    Caption.Caption := 'Specify Floppy Disk Image';
    QPath.Text := ReadData(TV.Selected.Text,'Drives','FloppyB');
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(Tv.Selected.Text,'Drives','FloppyB',QPath.Text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
      SelType := 0; Imp.Visible := False;
    End;
  End;

// BOOT CDROM
If I = 21 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Drives','Boot CDROM') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Boot VM from CD-ROM ?';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      IF CB.Text = 'Yes' Then
        Begin
        If ReadData(TV.Selected.Text,'Drives','BootFloppy') = 'Yes' Then WriteData(TV.Selected.Text,'Drives','BootFloppy','No');
        End;
      WriteData(TV.Selected.Text,'Drives','Boot CDROM',CB.text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;

//SYSTEM CD
If I = 38 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Drives','Use System CD') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Use PC CD/DVD-ROM';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      IF CB.Text = 'Yes' Then
        Begin
        If ReadData(TV.Selected.Text,'Drives','CDROM') > '' Then WriteData(TV.Selected.Text,'Drives','CDROM','');
        //CHECK A LETTER IS SPECIFIED
        If ReadData(TV.Selected.Text,'Drives','System CD Drive') = '' Then
          Begin
          DoDrive := true;
          I := 39;
          End;
        End Else WriteData(TV.Selected.Text,'Drives','System CD Drive','');
       WriteData(TV.Selected.Text,'Drives','Use System CD',CB.text);
       RetrieveVMInfo(TV.Selected.Text,0);
       End;
    End;
  End;


//SYSTEM FLOPPY
If I = 43 Then
  Begin
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Drives','UsePCFloppy') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Use PC Floppy Disk Drive';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      IF CB.Text = 'Yes' Then
        Begin
        If ReadData(TV.Selected.Text,'Drives','System Floppy Drive') > '' Then WriteData(TV.Selected.Text,'Drives','System Floppy Drive','');
        //CHECK A LETTER IS SPECIFIED
        If ReadData(TV.Selected.Text,'Drives','System Floppy Drive') = '' Then
          Begin
          DoDrive := true;
          I := 90;
          End;
        End Else WriteData(TV.Selected.Text,'Drives','System Floppy Drive','');
       WriteData(TV.Selected.Text,'Drives','UsePCFloppy',CB.text);
       RetrieveVMInfo(TV.Selected.Text,0);
       End;
    End;
  End;


// DriveLetter
//SYS FLOPPY
If I = 90 Then
Begin
With SelPhysical DO
  Begin
  Drive.ItemIndex := 0;
  Drive.Clear;
  for j := 0 to 25 do If DetectFloppyDrives(Chr(j + 65) + ':') = True Then Drive.Items.Add(Chr(j + 65) + ':');
  Drive.Text := ReadData(TV.Selected.Text,'Drives','System Floppy Drive');
  If Drive.Items.Count > 0 Then
    Begin
    Drive.ItemIndex := 0;
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Drives','System Floppy Drive',Drive.Text);
       RetrieveVMInfo(TV.Selected.Text,0);
       End
      Else
      If DoDrive = True Then
        Begin
        WriteData(TV.Selected.Text,'Drives','UsePCFloppy','No'); RetrieveVMInfo(TV.Selected.Text,0);
        End;
      End Else MessageDlg('There are NO physical Floppy Drives to use!',MtError,[MBOK],0);
    End;
  DoDrive := false;
  End;
End;


If I = 39 Then
Begin
With SelPhysical DO
  Begin
  Drive.ItemIndex := 0;
  Drive.Clear;
  for j := 0 to 25 do If DetectCDROMDrives(Chr(j + 65) + ':') = True Then Drive.Items.Add(Chr(j + 65) + ':');
  Drive.Text := ReadData(TV.Selected.Text,'Drives','System CD Drive');
  If Drive.Items.Count > 0 Then
    Begin
    Drive.ItemIndex := 0;
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Drives','System CD Drive',Drive.Text);
       RetrieveVMInfo(TV.Selected.Text,0);
       End
      Else
      If DoDrive = True Then
        Begin
        WriteData(TV.Selected.Text,'Drives','Use System CD','No'); RetrieveVMInfo(TV.Selected.Text,0);
        End;
      End Else MessageDlg('There are NO physical CD/DVD Drives to use!',MtError,[MBOK],0);
    End;
  DoDrive := false;
  End;
//End;


//Boot Floppy
If I = 37 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Drives','BootFloppy') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Boot VM from Floppy Disk ?';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      IF CB.Text = 'Yes' Then
        Begin
        If ReadData(TV.Selected.Text,'Drives','Boot CDROM') = 'Yes' Then WriteData(TV.Selected.Text,'Drives','Boot CDROM','No');
        End;
      WriteData(TV.Selected.Text,'Drives','BootFloppy',CB.text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
    End;
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


Function TMain.CreateVirtualDisk(Name : string; Size : String; FSys : String) : Boolean;
var
actsize : Integer;
Par : string;
s : String;
T: File;
Begin
ActSize := StrToInt(Size)*1024;
S := Name;
Screen.cursor := CRHourGlass;
If fsys = 'qcow2' Then Par :='create -f qcow2 "'+s+'" '+IntToStr(actsize);
If fsys = 'qcow' Then Par :='create -f qcow "'+s+'" '+IntToStr(actsize);
If fsys = 'cow' Then Par :='create -f cow "'+s+'" '+IntToStr(actsize);
if fSys = 'raw' Then Par :='create "'+s+'" '+IntToStr(actSize);
if fsys = 'vmdk' then Par :='create -f vmdk "'+s+'" '+IntToStr(actsize);
ExecConsoleApp(SysPath+'\qemu-img.exe', Par);

{Check Image Exists}
{$I-}
AssignFile(t,s);
Reset(t);
{$I+}
IF IOResult = 0 Then
  Begin
  CloseFile(t);
  Result := True;
  End Else Result := False;
Screen.cursor := CRDefault;
end;

Procedure TMain.ExecConsoleApp(Path : String; Params : String);
var
ProcInfo:TProcessInformation; StartInfo : TStartupInfo;
Begin
FillChar(StartInfo,SizeOf(TStartupInfo),#0);
FillChar(ProcInfo,SizeOf(TProcessInformation),#0);
StartInfo.cb := SizeOf(TStartupInfo);
If CreateProcess(nil,PChar('"'+Path+'" '+Params),nil, nil,False,
CREATE_NO_WINDOW,nil, nil, StartInfo, ProcInfo) Then
  Begin
  WaitForSingleObject(ProcInfo.hProcess, INFINITE);
  End;
CloseHandle(ProcInfo.hProcess);
CloseHandle(ProcInfo.hThread);
End;



procedure TMain.NLVDblClick(Sender: TObject);
var
I,VLNo,j,k,EndOf : Integer;
S : String;
Trig : Boolean;
TempString,TempString2 : String;
begin
//VLAN
IF NLV.ItemIndex > -1 Then
Begin
I  := NLV.Selected.ImageIndex;
If I = 22 Then
  Begin
  S := NLV.Selected.Caption; VLNO := 0;
  If ReadData(TV.Selected.Text,'Network','VLANS') > '' Then
    Begin
    J := StrToInt(ReadData(TV.Selected.Text,'Network','VLANS'));
    If J <= 11 Then VLNo := StrToInt(Copy(s,6,1));
    If J >= 11 Then VLNo := StrToInt(Copy(s,6,2));
    If J >= 101 Then VLNo := StrToInt(Copy(s,6,3));
    // We Now Have VLAN Number
    With VLAN DO
      Begin
      VL.Value := VLNo;
      IF ReadData(TV.Selected.Text,'Network','VLAN'+IntToStr(VLNo)) = 'User Networking' Then CB.ItemIndex := 0;
      IF ReadData(TV.Selected.Text,'Network','VLAN'+IntToStr(VLNo)) = 'Tap Networking' Then CB.ItemIndex := 1;
      ShowModal;
      If ModalResult = MROK Then
        Begin
        WriteData(TV.Selected.Text,'Network','VLAN'+IntToStr(VLNo),CB.Text);
        RetrieveVMInfo(TV.Selected.Text,0);
        End;
      end;
    End;
  end; //END I22

If I = 41 Then
  Begin
  S := NLV.Selected.Caption; VLNO := 0;
  If ReadData(TV.Selected.Text,'Network','VLANS') > '' Then
    Begin
    J := StrToInt(ReadData(TV.Selected.Text,'Network','VLANS'));
    If J <= 11 Then VLNo := StrToInt(Copy(s,6,1));
    If J >= 11 Then VLNo := StrToInt(Copy(s,6,2));
    If J >= 101 Then VLNo := StrToInt(Copy(s,6,3));
    // We Now Have VLAN Number
    With InputFrm DO
      Begin
      GB.Caption := 'Tap ID';
      Caption.Caption := 'Enter TAP ID';
      Text.Text := ReadData(TV.Selected.Text,'Network','VLAN'+IntToStr(VLNo)+'TapID');
      ShowModal;
      If ModalResult = MROK Then
        Begin
        WriteData(TV.Selected.Text,'Network','VLAN'+IntToStr(VLNo)+'TapID',Text.Text);
        RetrieveVMInfo(TV.Selected.Text,0);
        End;
      end;
    End;
  end; //END I41

If I = 40 Then
  Begin
  S := NLV.Selected.Caption; VLNO := 0;
  If ReadData(TV.Selected.Text,'Network','VLANS') > '' Then
    Begin
    J := StrToInt(ReadData(TV.Selected.Text,'Network','VLANS'));
    If J <= 11 Then VLNo := StrToInt(Copy(s,6,1));
    If J >= 11 Then VLNo := StrToInt(Copy(s,6,2));
    If J >= 101 Then VLNo := StrToInt(Copy(s,6,3));
    // We Now Have VLAN Number
    With InputFrm DO
      Begin
      GB.Caption := 'Mac Address';
      Caption.Caption := 'Enter MAC Address (Leave Blank for Automatic)';
      S := ReadData(TV.Selected.Text,'Network','VLAN'+IntToStr(VLNo)+'Mac');
      IF S = '' Then
      Text.Text := '' Else
      Text.Text := s;
      ShowModal;
      If ModalResult = MROK Then
        Begin
        WriteData(TV.Selected.Text,'Network','VLAN'+IntToStr(VLNo)+'Mac',Text.Text);
        RetrieveVMInfo(TV.Selected.Text,0);
        End;
      end;
    End;
  end; //END I40

If I = 27 Then
  Begin
  With Redirect Do
    Begin
    TempString :=s;
    TCPMemo.Clear;
    S := ReadData(TV.Selected.text,'Network','RedirectString');
    If S <> '' Then
      Begin
     // BREAK STRING
      TempString := s;
      Repeat
      EndOf :=Pos('|',TempString);
      If Endof = 0 Then TCPMemo.Items.Add(TempString) Else
        Begin
        TCPMemo.Items.Add(copy(TempString,1,EndOf-1));
        TempString2 :=  Copy(TempString,Endof+1,Length(TempString));
        TempString := TempString2;
        End;
      Until EndOF = 0;
      //END BREAK STRING
      End;
    HPort.Text := '';
    Rport.Text := '';
    PortType.ItemIndex := -1;
    ShowModal;
    If ModalResult = MROK Then
      Begin
      If TCPMemo.Items.Count > 0 Then
        Begin
        S := '';
        For K := 0 to TCPMemo.Items.Count-1 Do
          Begin
          If K = TCPMemo.Items.Count-1 Then
          S := S+TCPMemo.Items[k] Else S := S+TCPMemo.Items[k]+'|';
          End;
        End Else S:= '';
      WriteData(TV.Selected.Text,'Network','RedirectString',s);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;

If I = 25 Then
  Begin
  With Listeners Do
    Begin
    TCPMemo.Clear; VLNo := 0;
    HPort.Text := '';
    S := NLV.Selected.Caption;
    If ReadData(TV.Selected.Text,'Network','VLANS') > '' Then
      Begin
      J := StrToInt(ReadData(TV.Selected.Text,'Network','VLANS'));
      If J <= 11 Then VLNo := StrToInt(Copy(s,6,1));
      If J >= 11 Then VLNo := StrToInt(Copy(s,6,2));
      If J >= 101 Then VLNo := StrToInt(Copy(s,6,3));
      S := ReadData(TV.Selected.text,'Network','VLAN'+IntToStr(VLNo)+'Listener');
      If S <> '' Then
        Begin
       // BREAK STRING
       TempString :=s;
       TCPMemo.Clear;
        Repeat
        EndOf :=Pos('|',TempString);
        If Endof = 0 Then TCPMemo.Items.Add(TempString) Else
          Begin
          TCPMemo.Items.Add(copy(TempString,1,EndOf-1));
          TempString2 :=  Copy(TempString,Endof+1,Length(TempString));
          TempString := TempString2;
          End;
        Until EndOF = 0;
        //END BREAK STRING
        End;
      HPort.Text := '';
      ShowModal;
      If ModalResult = MROK Then
        Begin
        If TCPMemo.Items.Count > 0 Then
          Begin
          S := '';
          For K := 0 to TCPMemo.Items.Count-1 Do
            Begin
            If K = TCPMemo.Items.Count-1 Then
            S := S+TCPMemo.Items[k] Else S := S+TCPMemo.Items[k]+'|';
            End;
          End Else S:= '';
        WriteData(TV.Selected.Text,'Network','VLAN'+IntToStr(VLNo)+'Listener',s);
        RetrieveVMInfo(TV.Selected.Text,0);
        End;
      End;
    End;
  End;

If I = 26 Then
  Begin
  With Connectors Do
    Begin
    TCPMemo.Clear;
    HPort.Text := ''; CIP.Text := ''; VLNo := 0;
    S := NLV.Selected.Caption;
    If ReadData(TV.Selected.Text,'Network','VLANS') > '' Then
      Begin
      J := StrToInt(ReadData(TV.Selected.Text,'Network','VLANS'));
      If J <= 11 Then VLNo := StrToInt(Copy(s,6,1));
      If J >= 11 Then VLNo := StrToInt(Copy(s,6,2));
      If J >= 101 Then VLNo := StrToInt(Copy(s,6,3));
      S := ReadData(TV.Selected.text,'Network','VLAN'+IntToStr(VLNo)+'Connector');
      If S <> '' Then
        Begin
       // BREAK STRING
       TempString :=s;
       TCPMemo.Clear;
        Repeat
        EndOf :=Pos('|',TempString);
        If Endof = 0 Then TCPMemo.Items.Add(TempString) Else
          Begin
          TCPMemo.Items.Add(copy(TempString,1,EndOf-1));
          TempString2 :=  Copy(TempString,Endof+1,Length(TempString));
          TempString := TempString2;
          End;
        Until EndOF = 0;
        //END BREAK STRING
        End;
      HPort.Text := '';
      ShowModal;
      If ModalResult = MROK Then
        Begin
        If TCPMemo.Items.Count > 0 Then
          Begin
          S := '';
          For K := 0 to TCPMemo.Items.Count-1 Do
            Begin
            If K = TCPMemo.Items.Count-1 Then
            S := S+TCPMemo.Items[k] Else S := S+TCPMemo.Items[k]+'|';
            End;
          End Else S:= '';
        WriteData(TV.Selected.Text,'Network','VLAN'+IntToStr(VLNo)+'Connector',s);
        RetrieveVMInfo(TV.Selected.Text,0);
        End;
      End;
    End;
  End;
End;

end;

procedure TMain.ALVDblClick(Sender: TObject);
var
I : Integer;
Trig : Boolean;
begin
Trig := False;
IF ALV.ItemIndex > -1 Then
Begin
I := ALV.Selected.ImageIndex;

//Qemu Path
If I = 5 Then
  Begin
  With SelQPath DO
    Begin
    QM.Visible := tRUE;
    Caption.Caption := 'Specify QEMU Path';
    QPath.Text := ReadData(TV.Selected.Text,'General','Qemu Path');

    ShowModal;
    QM.VISIBLE := FALSE;
    If ModalResult = MROK Then
      Begin
      WriteData(Tv.Selected.Text,'General','Qemu Path',QPath.Text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;

//Q EXE
If I = 21 Then
  Begin
  With InputFrm DO
    Begin
    GB.Caption := 'Qemu';
    Caption.Caption := 'Qemu EXE Name';
    Text.Text := ReadData(TV.Selected.Text,'General','Qemu EXE');
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'General','Qemu EXE',Text.Text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;


If I = 32 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Hardware','Do Not Start CPU') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Start CPU on VM Launch ?';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Hardware','Do Not Start CPU',CB.text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;
//ISA
If I = 7 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Hardware','Simulate ISA') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Simulate ISA System ?';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Hardware','Simulate ISA',CB.text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;
//Service
{If I = 54 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'General','Service') = '1' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Run As Windows Service ?';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      If CB.Text = 'Yes' Then
      WriteData(TV.Selected.Text,'General','Service','1') Else
      WriteData(TV.Selected.Text,'General','Service','0');
      //ENABLE VNC SERVER
      If CB.Text = 'Yes' Then Begin Trig := True; I := 14; End Else
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End; }

//debug
If I = 52 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Advanced','Debug') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Run VM In Debug Mode ?';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Advanced','Debug',CB.text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;

//Local Time
If I = 8 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Hardware','Use Local Time') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'User Local Time ?';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Hardware','Use Local Time',CB.text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;
//Dock
If I = 9 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Hardware','Dock Qemu Manager') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Dock Qemu Manager on VM Launch ?';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Hardware','Dock Qemu Manager',CB.text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;

//DISABLE ALL
If I = 10 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Hardware','Disable Accelerator') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Disable ALL Acceleration ?';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Hardware','Disable Accelerator',CB.text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;

//ENABLE FULL
If I = 11 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Hardware','Full Acceleration') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Enable Full Acceleration (Caution) ?';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Hardware','Full Acceleration',CB.text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;
If I = 12 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Hardware','Enable WIN2K Hack') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Enable Windows 2000 Installation Hack ?';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Hardware','Enable WIN2K Hack',CB.text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;
If I = 13 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Hardware','Do Not Apply') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Do NOT apply session changes ?';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Hardware','Do Not Apply',CB.text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;

//VNC Server
If I = 14 Then
  Begin
  With YesNo DO
    Begin
    If Trig = True Then
      Begin
      Trig := False;
      I := 15;
      WriteData(TV.Selected.Text,'Hardware','VNC Server','Yes');
      End Else
      Begin
      If ReadData(TV.Selected.Text,'Hardware','VNC Server') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
      Caption.Caption := 'Launch as a VNC Server ?';
      ShowModal;
      If ModalResult = MROK Then
        Begin
        WriteData(TV.Selected.Text,'Hardware','VNC Server',CB.text);
        If CB.Text = 'Yes' Then Begin WriteData(TV.Selected.Text,'Hardware','Qemu Manager Client','No'); I := 15 End Else
        RetrieveVMInfo(TV.Selected.Text,0);
        End;
      End;
    End;
  End;


 //VNC Number
 If I = 15 Then
  Begin
  With SelWindow DO
    Begin
    SE.Value := StrToInt(ReadData(TV.Selected.Text,'Hardware','VNC Number'));
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(Tv.Selected.Text,'Hardware','VNC Number',SE.Text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;

 If I = 44 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Hardware','USB Tablet') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Enable USB Tablet Device ?';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Hardware','USB Tablet',CB.text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;

 If I = 29 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Advanced','OverrideAll') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Override all VM Settings ?';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Advanced','OverrideAll',CB.text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;

 If I = 30 Then
  Begin
  With InputFrm DO
    Begin
    GB.Caption := 'Override';
    Caption.Caption := 'Enter VM Override Data';
    Text.Text := ReadData(TV.Selected.Text,'Advanced','OptionalString');
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Advanced','OptionalString',Text.Text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  end; //END I41


  If I = 48 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Advanced','ACPI') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Disable ACPI Support ?';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Advanced','ACPI',CB.text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;

  If I = 50 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Advanced','VGA') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Enable Standard VGA Mode ?';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Advanced','VGA',CB.text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;

  If I = 49 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Advanced','NoReboot') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Close VM on Reboot ?';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Advanced','NoReboot',CB.text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;

  If I = 47 Then
  Begin
  With YesNo DO
    Begin
    If ReadData(TV.Selected.Text,'Advanced','SDL') = 'Yes' then CB.ItemIndex := 0 Else CB.ItemIndex := 1;
    Caption.Caption := 'Enable SDL Graphics ?';
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Advanced','SDL',CB.text);
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;


// Priority
  If I = 46 Then
  Begin
  With Proc DO
    Begin
    If ReadData(TV.Selected.Text,'Advanced','ProcessIndex') > '' Then
    CB.ItemIndex := StrToInt(ReadData(TV.Selected.Text,'Advanced','ProcessIndex')) Else CB.ItemIndex := -1;
    ShowModal;
    If ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Advanced','Process',CB.text);
      WriteData(TV.Selected.Text,'Advanced','ProcessIndex',IntToStr(CB.ItemIndex));
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;
End;
end;

procedure TMain.ToolButton2Click(Sender: TObject);
var
J: Integer;
begin
WIth NewVLan Do
  Begin
  If ReadData(TV.Selected.Text,'Network','VLANS') > '' Then
    Begin
    J := StrToInt(ReadData(TV.Selected.Text,'Network','VLANS'));
    VL.Value := J;
    CB.ItemIndex := -1;
    ShowModal;
    IF ModalResult = MROK Then
      Begin
      WriteData(TV.Selected.Text,'Network','VLAN'+VL.Text,CB.Text);
      WriteData(TV.Selected.Text,'Network','VLANS',IntToStr(J+1));
      WriteData(TV.Selected.Text,'Network','VLAN'+VL.Text+'Mac','');
      WriteData(TV.Selected.Text,'Network','VLAN'+VL.Text+'TapID','');
      WriteData(TV.Selected.Text,'Network','VLAN'+VL.Text+'Listener','');
      WriteData(TV.Selected.Text,'Network','VLAN'+VL.Text+'Connector','');
      RetrieveVMInfo(TV.Selected.Text,0);
      End;
    End;
  End;
end;

procedure TMain.ToolButton3Click(Sender: TObject);
var
i,j,VLNo : Integer;
S : String;
begin
S := NLV.Selected.Caption; VLNO := 0;
If ReadData(TV.Selected.Text,'Network','VLANS') > '' Then
  Begin
  J := StrToInt(ReadData(TV.Selected.Text,'Network','VLANS'));
  If J <= 11 Then VLNo := StrToInt(Copy(s,6,1));
  If J >= 11 Then VLNo := StrToInt(Copy(s,6,2));
  If J >= 101 Then VLNo := StrToInt(Copy(s,6,3));
  IF VLNO > 0 then
    Begin
    DeleteData(TV.Selected.Text,'Network','VLAN'+IntToStr(VLNo));
    DeleteData(TV.Selected.Text,'Network','VLAN'+IntToStr(VLNo)+'Mac');
    DeleteData(TV.Selected.Text,'Network','VLAN'+IntToStr(VLNo)+'Connector');
    DeleteData(TV.Selected.Text,'Network','VLAN'+IntToStr(VLNo)+'Listener');
    DeleteData(TV.Selected.Text,'Network','VLAN'+IntToStr(VLNo)+'TapID');
    WriteData(TV.Selected.Text,'Network','VLANS',IntToStr(J-1));
    RetrieveVMInfo(TV.Selected.Text,0);
    End Else MessageDlg('You CANNOT delete VLAN0',MtError,[MBOK],0);
  End;
end;

Function TMain.PrepareQemuToRun : String;
var
StringToRun : String;
Args : String;
DMemo : TMemo;
BootString : string;
I,J : Integer;
DidError : Boolean;
ss,TmpPath,Data,TVD : String;
D1,d2,d3 : Integer;
vl,EndOf : Integer;
TempString,TempString2,S : String;
begin
TVD := TV.Selected.Text;
If ReadData(TVD,'Advanced','OverrideAll') = 'Yes' Then Data := ReadData(TVD,'Advanced','OptionalString'); If Data > '' Then StringToRun := Data Else
  Begin
  // First add bios line ensuring correct bios file can be found, next and ram
  StringToRun := '-L "'+FindBiosLocation+'" -m '+ReadData(TV.Selected.Text,'Hardware','RAM');
  //Scan Hard Disks
  Data := ReadData(TVD,'Drives','HDA'); If Data > '' Then StringToRun := StringToRun +' -hda "'+CheckFileName(Data)+'"';
  Data := ReadData(TVD,'Drives','HDB'); If Data > '' Then StringToRun := StringToRun +' -hdb "'+CheckFileName(Data)+'"';
  Data := ReadData(TVD,'Drives','HDC'); If Data > '' Then StringToRun := StringToRun +' -hdc "'+CheckFileName(Data)+'"';
  Data := ReadData(TVD,'Drives','HDD'); If Data > '' Then StringToRun := StringToRun +' -hdd "'+CheckFileName(Data)+'"';
  //Scan Floppy Disks
  //First check physical disk is not going to be used
  Data := ReadData(TVD,'Drives','UsePCFloppy');
  IF Data = 'Yes' Then
  StringToRun := StringToRun + ' -fda "//./'+Lowercase(ReadData(TVD,'Drives','System Floppy Drive'))+'"'
  Else
   Begin
   Data := ReadData(TVD,'Drives','Floppy'); If Data > '' Then StringToRun := StringToRun +' -fda "'+MCheckFileName(Data)+'"';
   End;

  Data := ReadData(TVD,'Drives','FloppyB'); If Data > '' Then StringToRun := StringToRun +' -fdb "'+MCheckFileName(Data)+'"';
  //Boot Floppy ?


  //CDROM
  Data := ReadData(TVD,'Drives','Use System CD');
  IF Data = 'Yes' Then
  StringToRun := StringToRun + ' -cdrom "//./'+Lowercase(ReadData(TVD,'Drives','System CD Drive'))+'"' Else
    Begin
    Data := ReadData(TVD,'Drives','CDROM'); If Data > '' Then StringToRun := StringToRun +' -cdrom "'+MCheckFileName(Data)+'"';
    End;
  BootString := '';

  //Boot CDROM ?
  Data := ReadData(TVD,'Drives','Boot CDROM');
  If Data = 'Yes' Then  BootString := ' -boot d';
  Data := ReadData(TVD,'Drives','BootFloppy');
  If Data = 'Yes' Then  BootString := ' -boot a';

  If BootString = '' Then BootString := ' -boot c';

  StringToRun := StringToRun+BootString;


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



Function TMain.FindBiosLocation : String;
var
SR: TSearchRec;
DirList: TStringList;
IsFound,DidFind: Boolean;
i: integer;
StartDir,FileMask,s,t : String;

begin
t :=ReadData(TV.Selected.Text,'General','Qemu Path');
If Copy(t,1,4) = '{QM}' Then s := sysPath+'\'+Copy(t,6,Length(t)-5)+'\' Else s := t+'\';
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


Function TMain.CheckFileName(Fname : String) : String;
var
S : String;
Data : string;
Begin
S := ExtractFileDir(FName);
If S > '' Then data := FName Else data := SysPath+'\Images\'+FName;
Result := AnsiReplaceStr(data, '\', '\\');

End;

Function TMain.MCheckFileName(Fname : String) : String;
var
S,Data : String;
Begin
S := ExtractFileDir(FName);
If S > '' Then Data := FName Else Data := SysPath+'\Media\'+FName;
Result := AnsiReplaceStr(Data, '\', '\\')
End;



Procedure TMain.LaunchQemu(LaunchStr : String; client : Boolean);
var
ProcInfo:TProcessInformation; StartInfo : TStartupInfo;
Pri : DWord;
TVD,ActiveEXE,EmuPath,MType,Data,sd,s: String;
Begin
TVD := TV.Selected.Text;
EmuPath := ReadData(TVD,'General','Qemu Path');
{Mtype :=ReadData(TVD,'Advanced','MachineType');
If (MType = 'Qemu PC Based System (Default)') or (MType = '')  Then ActiveEXE := EmuPath+'\qemu.exe';
If MType = 'Qemu Power PC Based System (qemu-system-ppc)' Then ActiveEXE := EmuPath+'\qemu-system-ppc.exe';
If MType = 'Qemu Sparc Based System (qemu-system-sparc)' Then ActiveEXE := EmuPath+'\qemu-system-sparc.exe';
If MType = 'Qemu x86_64 PC Based System (qemu-system-x86_64)' Then ActiveEXE := EmuPath+'\qemu-system-x86_64.exe';
If MType = 'Qemu MIPS Based System (qemu-system-mips)' Then ActiveExe := EmuPath+'\qemu-system-mips.exe';
If MType = 'Qemu ARM Based System (qemu-system-arm)' Then ActiveExe := EmuPath+'\qemu-system-arm.exe';}

s :=ReadData(TVD,'General','Qemu Path');
If Copy(S,1,4) = '{QM}' Then ActiveExe := sysPath+'\'+Copy(S,6,Length(S)-5)+'\' Else ActiveEXE := S+'\';
ActiveExe := ActiveEXE+ReadData(TVD,'General','Qemu EXE');
FillChar(StartInfo,SizeOf(TStartupInfo),#0);
FillChar(ProcInfo,SizeOf(TProcessInformation),#0);
StartInfo.cb := SizeOf(TStartupInfo);
If (ReadData(TVD,'Advanced','SDL') = 'Yes') or (ReadData(TVD,'Hardware','Full Screen Display') = 'Yes') Then
SetEnvironmentVariable('SDL_VIDEODRIVER','windib');

If ReadData(TVD,'Hardware','Disable Accelerator') = 'No' Then
IF CheckKQemuRunning('','KQEMU') = 1 Then  If ServStart('','KQEMU') Then SB.Panels[1].Text := 'KQEMU Driver Started';

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
sd := LaunchStr;
//CLIENT CHECK

If (Client = False) or (NOQMQC = 'No') Then
  Begin
  If ReadData(TV.Selected.Text,'Advanced','Debug') = 'Yes' Then DebugRun Else
    Begin
    If CreateProcess(nil,PChar('"'+ActiveExe+'" '+LaunchStr),nil, nil,False, Pri,
    nil, PChar(SysPath+'\Media'), StartInfo, ProcInfo) Then
        Begin
        WriteData(TVD,'General','StatusID',IntToStr(ProcInfo.dwProcessId));
        WriteData(TVD,'General','Status','Running');
        WriteData(TVD,'General','Last Run',DateToStr(Now)+' - '+TimeToStr(Now));
        RetrieveVMInfo(TV.Selected.Text,0);
        ProcessDB.Insert;
        ProcessDBProcessID.Text :=IntToStr(ProcInfo.dwProcessId);
        ProcessDBVM.Text := TV.Selected.Text;
        ProcessDB.Post;
        If ReadData(TVD,'Hardware','Dock Qemu Manager') = 'Yes' Then
          Begin
          Hide;
          Shell_NotifyIcon(NIM_ADD, @TINotifyData);
          End;
        End;
      CloseHandle(ProcInfo.hProcess);
      CloseHandle(ProcInfo.hThread);
      End;
  End
Else
  Begin
  WriteData(TVD,'General','LaunchID',sd);
  //NOW EXECUTE CLIENT
  ActiveEXe := SysPath+'\qmclient.exe';
  LaunchStr := TV.Selected.Text;
    If CreateProcess(nil,PChar('"'+ActiveExe+'" '+PChar('"'+LaunchStr+'"')),nil, nil,False, Pri,
    nil, nil, StartInfo, ProcInfo) Then
        Begin
        WriteData(TVD,'General','StatusID',IntToStr(ProcInfo.dwProcessId));
        WriteData(TVD,'General','Status','Running');
        WriteData(TVD,'General','Last Run',DateToStr(Now)+' - '+TimeToStr(Now));
        RetrieveVMInfo(TV.Selected.Text,0);
        ProcessDB.Insert;
        ProcessDBProcessID.Text :=IntToStr(ProcInfo.dwProcessId);
        ProcessDBVM.Text := TV.Selected.Text;
        ProcessDB.Post;
        If ReadData(TVD,'Hardware','Dock Qemu Manager') = 'Yes' Then
          Begin
          Hide;
          Shell_NotifyIcon(NIM_ADD, @TINotifyData);
          End;


        End;
     CloseHandle(ProcInfo.hProcess);
     CloseHandle(ProcInfo.hThread);
    End;
SysTimer.Enabled := True;
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


procedure TMain.FormDestroy(Sender: TObject);
begin
If SysStopSvc = True Then
If ServStop('','KQEMU') Then SB.Panels[1].Text := '';

SysTimer.Enabled := False;
Shell_NotifyIcon(NIM_DELETE, @TINotifyData);
Application.ProcessMessages;

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


procedure TMain.PlayClick(Sender: TObject);
var
s : String;
begin
If (TV.Selected.ImageIndex = 8) and (TV.Selected.SelectedIndex = 8) Then MessageDlg('This virtual machine is already running!!',MtError,[MBOK],0) Else
  Begin
  if (Tv.selected.text = 'Virtual Machines') Or (TV.Selected.Text = '') Then
    Begin End Else
    Begin
    S := ReadData(TV.Selected.Text,'Hardware','Qemu Manager Client');
    If S = 'Yes' Then LaunchQemu(PrepareQemuToRun,True) Else LaunchQemu(PrepareQemuToRun,false);
    End;
  end;
End;
procedure TMain.FormShow(Sender: TObject);
var
INI : TIniFile;
Begin
If Wiz = 0 Then
  Begin
  With DefProWiz Do
    Begin
    showModal;
    If ModalResult = MROk Then
      Begin
      INI := TINIFile.Create(SysPath+'\qman.ini');
      With Ini Do
        Begin
        //INSTALL KQEMU IF REQUIRED
        If KQEMU.Checked = True Then
          Begin
          ServStop('','KQEMU');
          SB.Panels[1].Text := '';
          runwait(SysPath+'\qemu\kqemu\inskqemu.exe','/INSTALL',SW_ShowNormal);
          CheckDriverStatus;
          End;
        WriteString('General','Default Keyboard Layout',Keyb.text);
        WriteInteger('General','Default Keyboard Index',Keyb.ItemIndex);
        WriteString('General','WizardComplete','1');

        If client.Checked = False Then WriteString('General','Client Support','No') Else WriteString('General','Client Support','Yes');
        QMVersDB.Insert;
        QMVersDBDesc.Text := 'Standard 32 Bit PC (0.9.0) QMQC'; QMVersDBExe.Text := 'qemu.exe';
        QMVersDBSubDir.Text := '{QM}\qemu\090'; QMVersDBQMClient.Text := 'Yes';
        QMVersDBDefault.Text := 'No'; QMVersDB.Post;
        QMVersDB.Insert;
        QMVersDBDesc.Text := 'Standard 32 Bit PC (0.9.1) QMQC'; QMVersDBExe.Text := 'qemu.exe';
        QMVersDBSubDir.Text := '{QM}\qemu\091'; QMVersDBQMClient.Text := 'Yes';
        QMVersDBDefault.Text := 'Yes'; QMVersDB.Post;
        QMVersDB.Insert;
        QMVersDBDesc.Text := 'Standard 64 Bit PC (0.9.0) QMQC'; QMVersDBExe.Text := 'qemu-system-x86_64.exe';
        QMVersDBSubDir.Text := '{QM}\qemu\090'; QMVersDBQMClient.Text := 'Yes';
        QMVersDBDefault.Text := 'No'; QMVersDB.Post;
        QMVersDB.Insert;
        QMVersDBDesc.Text := 'Standard 64 Bit PC (0.9.1) QMQC'; QMVersDBExe.Text := 'qemu-system-x86_64.exe';
        QMVersDBSubDir.Text := '{QM}\qemu\091'; QMVersDBQMClient.Text := 'Yes';
        QMVersDBDefault.Text := 'No'; QMVersDB.Post;
        Wiz := 1;
        ReadSystemConfig(True);
        End;
      Ini.Free;
      end;
    end;
  End;
CheckDriverStatus;
TV.SetFocus;
end;


procedure TMain.SysTimerTimer(Sender: TObject);
begin
SysTimer.Enabled := False;
ScanSessionIDList;
SysTimer.Enabled := True;



end;

procedure TMain.TVGetSelectedIndex(Sender: TObject; Node: TTreeNode);
begin
If ReadData(Node.TEXT,'General','Status') = 'Running' Then
  Begin
  node.ImageIndex := 8;
  node.selectedIndex := 8;
  End
Else
  Begin
  node.ImageIndex := 0;
  node.selectedIndex := 0;
  End;


end;

procedure TMain.ShowLastLaunchCommand1Click(Sender: TObject);
begin
With LastRunFrm Do
  Begin
  LR.Text := LastRun+' '+LastRunPar;
  ShowModal;
  End;
end;

procedure TMain.StopClick(Sender: TObject);
VAR
Ret : BOOL;
PrID: Integer;
Ph: THandle;
CC : Boolean;
begin
  if (Tv.selected.text = 'Virtual Machines') Or (TV.Selected.Text = '') Then
    Begin
    End
  Else
    Begin
    If ReadData(TV.Selected.Text,'Hardware','Qemu Manager Client') = 'Yes' Then
    MessageDlg('You CANNOT terminate a QEMU Session that has been launched using the Qemu Manager QEMU Client!, Please use the client to end the session',MtWarning,[MBOK],0) Else
      Begin
      SysTimer.Enabled := False;
      If ReadData(TV.Selected.Text,'General','StatusID') > '' Then
        Begin
        if MessageDlg('Terminating a Virtual Machine can cause data loss - continue ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
          PrID := StrToInt(ReadData(TV.Selected.Text,'General','StatusID'));
          Ph := OpenProcess(1, BOOL(0), PrID);
          Ret := TerminateProcess(Ph, 0);
          if Integer(Ret) = 0 then MessageDlg('The selected Virtual Machine Is Not Running',MtInformation,[MBOK],0) Else
            Begin
            End;
          end;
        End Else MessageDlg('This Virtual Machine is not running',MtWarning,[MBOK],0);
      SysTimer.Enabled := True;
      End;
    End;
  end;


Function TMain.DirtyCreate(Name : string; usecli : Boolean) : Boolean;
Var
T : Textfile;
Begin
{$I-}
AssignFile(t,SysPath+'\Images\'+Name+'.vm');
ReWrite(t);
{$I+}
IF IOResult = 0 Then
  Begin
  WriteLn(T,'[General]');
  WriteLn(T,'Operating System=');
  WriteLn(T,'Last Run=');
  WriteLn(T,'Qemu Path=Default');
  WriteLn(T,'Status=Stopped');
  WriteLn(T,'StatusID=');
  WriteLn(T,'[Hardware]');
  WriteLn(T,'RAM=');
  WriteLn(T,'Full Screen Display=No');
  WriteLn(T,'Do Not Start CPU=No');
  WriteLn(T,'Simulate ISA=No');
  WriteLn(T,'Use Local Time=Yes');
  WriteLn(T,'Dock Qemu Manager=No');
  WriteLn(T,'Do Not Apply=No');
  WriteLn(T,'Disable Accelerator=No');
  Writeln(t,'KeyboardIndex='+IntToStr(DefKeyIndex));
  WriteLn(T,'Keyboard='+DefKeyLay);
  if usecli = true Then Writeln(t,'Qemu Manager Client=Yes') else Writeln(t,'Qemu Manager Client=Disabled');

  WriteLn(T,'Enable WIN2K Hack=No');
  WriteLn(T,'Enable USB=No');
  WriteLn(T,'Hard Disk Size=');
  WriteLn(T,'Full Acceleration=No');
  WriteLn(T,'Processors=1');
  WriteLn(T,'VNC Server=No');
  WriteLn(T,'VNC Number=1');
  WriteLn(T,'USB Tablet=No');
  WriteLn(T,'Network=Yes');
  WriteLn(T,'[Drives]');
  WriteLn(T,'HDA=');
  WriteLn(T,'HDB=');
  WriteLn(T,'HDC=');
  WriteLn(T,'HDD=');
  WriteLn(T,'CDROM=');
  WriteLn(T,'Boot CDROM=No');
  WriteLn(T,'Use System CD=No');
  WriteLn(T,'System CD Drive=');
  WriteLn(T,'Floppy=');
  WriteLn(T,'BootFloppy=No');
  WriteLn(T,'USePCFloppy=No');
  WriteLn(T,'FloppyB=');
  WriteLn(T,'[Audio]');
  WriteLn(T,'Enable Sound=Yes');
  WriteLn(T,'Use SB16=Yes');
  WriteLn(T,'Use ES1370=Yes');
  WriteLn(T,'Use Adlib=No');
  WriteLn(T,'[Network]');
  WriteLn(T,'VLANS=1');
  WriteLn(T,'VLAN0=User Networking');
  WriteLn(T,'VLAN0TapID=');
  WriteLn(T,'VLAN0Mac=');
  WriteLn(T,'RedirectString=');
  WriteLn(T,'Listener=');
  WriteLn(T,'VLAN0Listener=');
  WriteLn(T,'VLAN0Connector=');
  WriteLn(T,'[Advanced]');
  WriteLn(T,'MachineType=Qemu PC Based System (Default)');
  WriteLn(T,'OverrideAll=No');
  WriteLn(T,'OverrideString=');
  WriteLn(T,'SavedState=');
  WriteLn(T,'USBString=');
  WriteLn(T,'SDL=No');
  WriteLn(T,'NoReboot=No');
  WriteLn(T,'VGA=No');
  WriteLn(T,'ACPI=No');
  WriteLn(T,'Process=Normal');
  Writeln(t,'Debug=No');
  writeln(t,'Monitor=No');
  writeln(t,'Name=No');
  Writeln(t,'MachineTypeIndex=0');
  Writeln(t,'ProcessIndex=2');




  CloseFile(t);
  Result := True;
  End Else Result := false;
End;

procedure TMain.ToolButton1Click(Sender: TObject);
Var
RamSL,DiskSL : TStringList;
I,J : Integer;
CC : Boolean;
S : String;
begin
With NewVM Do
  Begin
  VMName.Text := '';
  OpSys.ItemIndex := -1;
  SE.Value := 128;
  SE2.Value := 10000;
  CB.ItemIndex := 0;
  OpSys.Clear;
  RamSL := TStringList.Create;
  DiskSL := TStringList.Create;
  Dtype.ItemIndex := 1;
  If Main.OpSysDB.IsEmpty = False Then
    Begin
    Main.OpSysDB.First;
    Repeat
    OpSys.Items.Add(Main.OpSysDBName.Text);
    OpsysDB.next;
    Until OpSysDB.EOF = True;
    End;
  ShowModal;
  If ModalResult = MROK Then
    Begin
    S :=CreateDisk(Dtype.Text,SE2.Value,SysPath+'\Images\'+VMName.Text+'.dsk');
    If  S> '' Then
      Begin
      If CB.Text = 'Qemu PC Based System (Default)' Then DirtyCreate(VMName.Text,True) else DirtyCreate(VMName.Text,False);
      WriteData(VMName.Text,'Hardware','RAM',SE.Text);
      WriteData(VMName.Text,'General','Operating System',Opsys.Text);
      WriteData(VMName.Text,'Drives','HDA',S);
      WriteData(VMName.text,'General','PortID',IntToStr(GeneratePortNo));
      CC := False;
      Main.QMVersDB.First;
      If Main.QMVersDB.IsEmpty = False Then
        Begin
        Repeat
        If Main.QMVersDBDesc.Text = CB.Text Then
          Begin
          WriteData(VMName.text,'General','Qemu Path',Main.QMVersDBSubDir.Text);
          WriteData(VMName.text,'General','Qemu EXE',Main.QMVersDBExe.Text);
          WriteData(VMName.text,'Advanced','MachineType',Main.QMVersDBDesc.Text);
          If (QMVersDBQMClient.Text = 'Yes') And (NOQMQC = 'Yes') Then WriteData(VMName.text,'Hardware','Qemu Manager Client','Yes') Else
          WriteData(VMName.text,'Hardware','Qemu Manager Client','Disabled');
//          If Main.QMVersDBKQEMU.Text = 'No' Then WriteData(VMName.Text,'Hardware','Disable Accelerator','Yes');
          CC := True;
          End Else Main.QMVersDB.Next;
        Until (Main.QMVersDB.EOF = True) or (CC = True);
         End;

      FL.Mask := '*.vm';
      CalcVM;
      I := TV.Items.Count;
      For J := 0 To I-1 Do
        Begin

        If TV.items[j].Text =VMName.text Then
          Begin
          TV.Items[J].Selected := tRUE;
          RetrieveVMInfo(TV.Selected.Text,0);
          Exit;
          End;
        End;

      End;
    End;
  RamSL.Free; DiskSL.Free;

  End;
end;


Function TMain.CreateDisk(DType : String; Size : Integer; Name : String) : String;
var
p1,p2,p3 : String;
cc,DTag: Boolean;
D : Word;
Go : Boolean;
Fname,s: string;
ImageOK : Boolean;
begin
P1 := SelQPath.ExtractLongPathName(Syspath+'\IMAGES');
P2 :=SelQPath.ExtractLongPathName(ExtractFileDir(NAME));
FName := Name;
saveDlg.InitialDir := SysPath+'\Images';
saveDlg.FileName := ''; GO := True;
IF Name = '' Then If saveDlg.Execute = True Then
  Begin
  FName := SaveDlg.FileName;
  Go := True;
  P2 :=ExtractFIleDir(FName);

  End
  Else Go := False;
If Go = True Then
  Begin
  CC := False; DTag := False;
  If Uppercase(P1) <> Uppercase(P2) Then
    Begin
    DTag := True;
    If MessageDlg('Note: Saving the disk image outside the main images directory make may the virtual machine unusable on other systems - continue ?',
    mtConfirmation, [mbYes, mbNo], 0) = MrNo Then CC := True;
    End;
    IF CC = False Then
      Begin

      If DType = 'Qcow (QEMU Image Format)' Then ImageOK := Main.CreateVirtualDisk(FName,IntToStr(Size),'qcow');
      If DType = 'Qcow2  (QEMU Image Format)' Then ImageOK := Main.CreateVirtualDisk(FName,IntToStr(Size),'qcow2');
      If DType = 'Raw (Raw Disk Image File)' Then ImageOK := Main.CreateVirtualDisk(FName,IntToStr(Size),'raw');
      If DType = 'vmdk (VMWare 3-4 Image Format)' Then ImageOK := Main.CreateVirtualDisk(FName,IntToStr(Size),'vmdk');
      If ImageOK = False Then Begin MessageDlg('Error: Disk image was not created successfully',MTError,[MBOK],0); Result := ''; End Else
      Begin
        If DTag = False Then Result := ExtractFileName(FName) Else
        Result := FName;
       // MessageDlg('Disk Image Created Successfully',MTInformation,[MBOK],0)
        End;
      End;
    End;
  End;
procedure TMain.ToolButton6Click(Sender: TObject);
begin
If TV.Selected.Text <> 'Virtual Machines' Then
  Begin
  If MessageDlg('Are you Sure you wish to delete this virtual machine ?',
  mtConfirmation, [mbYes, mbNo], 0) = MrYes Then
    Begin
    If MessageDlg('Do you wish to delete the main virtual disk image also ?',
    mtConfirmation, [mbYes, mbNo], 0) = MrYes Then DeleteFile(ReadData(TV.Selected.text,'Drives','HDA'));
    DeletePortNo(StrToInt(ReadData(TV.Selected.Text,'General','PortID')));
    DeleteFile(SysPath+'\Images\'+TV.Selected.Text+'.vm');
    FL.Mask := '*.vm';
    PC2.Visible := false;
    CalcVM;
//    RetrieveVMInfo(TV.Selected.Text,0);
    End;
  End Else MessageDlg('Please select a virtual machine to delete',MTError,[MBOK],0);

end;

procedure TMain.CreateDiskImage1Click(Sender: TObject);
begin
With NewDisk Do
  Begin
  SE.Value := 10000;
  DType.ItemIndex := 1;
  ShowModal;
  If ModalResult = MROK Then
    Begin
    Main.CreateDisk(DType.Text,SE.Value,'');
    End;
  end;

end;

procedure TMain.ACC1Click(Sender: TObject);
begin
If MessageDlg('Are you sure you wish to install the KQEMU accelerator driver ?',
mtConfirmation, [mbYes, mbNo], 0) = MrYes Then
  Begin
  ServStop('','KQEMU');
  SB.Panels[1].Text := '';
  runwait(SysPath+'\qemu\kqemu\inskqemu.exe','/INSTALL',SW_ShowNormal);
  CheckDriverStatus;
  End;

end;



Procedure TMAIN.CheckDriverStatus;
Begin
  If CheckKQemuRunning('','KQEMU') = 0 Then
    Begin
    Acc1.Enabled := True;
    Acc2.Enabled := false;
    End;
  If CheckKQemuRunning('','KQEMU') > 0 Then
    Begin
    Acc1.Enabled := False;
    Acc2.Enabled := True;
    End;
End;



procedure TMain.Acc2Click(Sender: TObject);
begin
If MessageDlg('Are you sure you wish to uninstall the KQEMU accelerator driver ?',
mtConfirmation, [mbYes, mbNo], 0) = MrYes Then
  Begin
  ServStop('','KQEMU');
  SB.Panels[1].Text := '';
  runwait(SysPath+'\qemu\kqemu\inskqemu.exe','/REMOVE',SW_ShowNormal);
  CheckDriverStatus;
  End;

end;


function TMain.runwait(const FName, Pars: string; Ws: Word): Boolean;
var
  SInfo: TStartupInfo;
  PInfo: TProcessInformation;
  CL: string;
begin
CL := '"'+FNAME+'" '+Pars;
FillChar(SInfo, SizeOf(SInfo), #0);
with SInfo do
  begin
  cb := SizeOf(SInfo);
  dwFlags := STARTF_USESHOWWINDOW;
  wShowWindow := WS;
  end;
Result := CreateProcess(nil, PChar(CL), NIL, nil, False,CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil, PChar(ExtractFilePath(Fname)), SInfo, PInfo);
if Result then WaitForSingleObject(PINFO.hProcess, INFINITE);
end;



procedure TMain.drvClick(Sender: TObject);
begin
If Drv.checked = True Then
  Begin
  WriteSysData('General','Stop Services','False');
  Drv.Checked := false;
  SysStopSvc := False;
  End
else
  Begin
  WriteSysData('General','Stop Services','True');
  Drv.Checked := True;
  SysStopSvc := True;
  End;
end;


Procedure TMain.WriteSysData(Head : String; Key : string; Value : string);
var
INI : TIniFile;
Begin
SysPath := ExtractFileDir(Application.ExeName);
INI := TINIFile.Create(SysPath+'\qman.ini');
With Ini Do
  Begin
  WriteString(Head,Key,Value);
  End;
Ini.Free;
End;
procedure TMain.FTPStartClick(Sender: TObject);
var
QIni : TIniFile;
begin
QINI := TINIFile.Create(ExtractFilePath(ParamStr(0))+'qman.ini');
With QIni Do
  begin
  If ReadString('General','No Info','') ='1' Then
  ShellExecute (0, nil, PChar(SysPath+'\QMFTServ.exe'), nil, nil, SW_SHOWNORMAL) Else
    Begin
    Info.ShowModal;
    ShellExecute (0, nil, PChar(SysPath+'\QMFTServ.exe'), nil, nil, SW_SHOWNORMAL);
    End;
  End;
QIni.Free;
end;

procedure TMain.FTPStopClick(Sender: TObject);
var Handle:THandle;
begin
Handle:=FindWindow(Nil, 'Qemu Manager File Transfer Server') ;
If PostMessage(Handle, WM_QUIT, 0, 0) = False Then MessageDlg('Unable to stop the FTP Server!',MtError,[MBOK],0);

end;

procedure TMain.BrowseDiskImageFolder1Click(Sender: TObject);
begin
ShellExecute (0, nil, PChar(SysPath+'\Images'),nil, nil, SW_SHOWNORMAL);
end;

procedure TMain.BrowseMediaImageFolder1Click(Sender: TObject);
begin
ShellExecute (0, nil, PChar(SysPath+'\Media'),nil, nil, SW_SHOWNORMAL);
end;

procedure TMain.ConfigureFTPServer1Click(Sender: TObject);
Begin
FTPSetup.ShowModal;
end;

Procedure TMain.debugRun;
var
  SInfo: TStartupInfo;
  PInfo: TProcessInformation;
  res : Boolean;
  CL: string;
  T : textfile;
  FN : String;
begin
FN :=  GetTempDir+TV.Selected.Text+'.bat';
{$I-}
AssignFile(t,FN);
ReWrite(t);
{$I+}
IF IOResult = 0 Then
  Begin
  Writeln(t,'@echo off');
  Writeln(t,'cls');
  Writeln(t,'echo Qemu Manager - Debug Mode');
  Writeln(t,'echo -------------------------');
  Writeln(t,'echo.');
  Writeln(t,'echo Qemu Launch Command:');
  Writeln(t,'echo.');
  Writeln(t,'echo '+LastRun+' '+LastRunPar);
  Writeln(t,LastRun+' '+LastRunPar);
  Writeln(t,'echo.');
  Writeln(t,'Pause');
  Writeln(t,'cls');
  CloseFile(t);
//  CL := LastRun+' '+LastRunPar;
  FillChar(SInfo, SizeOf(SInfo), #0);
  with SInfo do
    begin
    cb := SizeOf(SInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := SW_ShowNormal;
    end;
  Res := CreateProcess(nil, PChar(FN), NIL, nil, False,CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil, PChar(SysPath+'\Media'), SInfo, PInfo);
  if Res then
    Begin
    WriteData(TV.Selected.Text,'General','StatusID',IntToStr(Pinfo.dwProcessId));
    WriteData(TV.Selected.Text,'General','Status','Running');
    WriteData(TV.Selected.Text,'General','Last Run',DateToStr(Now)+' - '+TimeToStr(Now));
    RetrieveVMInfo(TV.Selected.Text,0);
    ProcessDB.Insert;
    ProcessDBProcessID.Text :=IntToStr(Pinfo.dwProcessId);
    ProcessDBVM.Text := TV.Selected.Text;
    ProcessDB.Post;
    If ReadData(TV.Selected.Text,'Hardware','Dock Qemu Manager') = 'Yes' Then
      Begin
      Hide;
      Shell_NotifyIcon(NIM_ADD, @TINotifyData);
      End;
    End;
//  DeleteFile(SysPath+'\lr.bat');
  End;
End;

Function TMain.GetTempDir : string;
var
lng: DWORD;
thePath: string;
begin
SetLength(thePath, MAX_PATH) ;
lng := GetTempPath(MAX_PATH, PChar(thePath)) ;
SetLength(thePath, lng) ;
Result := thepath;
end;


procedure TMain.About1Click(Sender: TObject);
begin
AboutBox.ShowModal;
end;

procedure TMain.ConfigureOperatingSystemDefaults1Click(Sender: TObject);
begin
Opsys.ShowModal;
end;



Function TMain.CreateDiskImage(SourceF : String; DestF : String; Prog : TProgressBar) : Boolean;
Const
 bufSize = 16384;
var
  Source,Dest : TFileStream;
  Point : Pointer;
  IncCnt,Total,SourceSize,TS,FS : Int64;

begin
if SetCurrentDir(SourceF) then
  begin
  Prog.Max := 100; Prog.Position := 0;
  GetDiskFreeSpaceEx(PChar(SourceF), Fs, Ts, nil);
  SetCurrentDir('C:');
  SourceSize := Ts;
  total := 0;
    try
    Source := TFileStream.Create('\\.\'+SourceF, fmOpenRead);
    Dest := TFileStream.Create(DestF, fmCreate);
    GetMem(Point, bufSize);
    IncCnt := Source.Read(Point^, bufSize);
    IncCnt := Dest.Write(Point^, Inccnt);
    total := total + Inccnt;
    while (IncCnt > 0) do
      begin
      Application.ProcessMessages;
      Inccnt := Source.Read(Point^, bufSize);
      Inccnt := Dest.Write(Point^, Inccnt);
      total := total + Inccnt;
      Prog.Position :=  Round((total / SourceSize) * 100);
      end;
    FreeMem(Point, bufSize);
    Dest.Free;
    Source.Free;
    Result := True;
    Except on E : Exception Do
      Begin
      Result := False;
      End;
    end;
  End Else Result := False;
end;



procedure TMain.ToolButton8Click(Sender: TObject);
begin
ActMedia := '';
With MediaStoreWiz Do
  Begin
  NB.ActivePage := 'P1'; P1Next.Enabled := False; P1Back.Enabled := False;
  P2Next.Enabled :=False; MINext.Enabled := False; MI2Next.Enabled := False;
  MI2Back.Enabled := False; MI2Cancel.Enabled := False; Done.Visible := False;
  CDImg.Checked := False; FlopImg.Checked := False; FinishBtn.Enabled := True;
  DestLbl.Caption := 'None'; PB.Position := 0;
  AddHow.ItemIndex := -1;
  ShowModal;
  end;

end;




procedure TMain.TCPConnected(Sender: TObject);
begin
sb.panels[3].Text := 'Connected to '+QMSessionName;
sb.refresh;

end;

procedure TMain.TCPDisconnected(Sender: TObject);
begin
sb.panels[3].Text := 'Disconnected from '+QMSessionName;
sb.refresh;
end;


Procedure TMain.ScanSessionIDList;
var
MyHandle: THandle;
Struct: TProcessEntry32;
DIDF,Failed : Boolean;
I,J,EndOf : Integer;
Proc,FName : String;
TempString,FN : string;
CC : Boolean;
begin
CC := False;
ScanProcDB.First;
If ScanProcDB.IsEmpty = False Then
  Begin
  Repeat
  DidF := False;
  Proc := ScanProcDBProcessID.text;
  Fname := ScanProcDBVM.Text;
  MyHandle:=CreateToolHelp32SnapShot(TH32CS_SNAPPROCESS, 0);
  Struct.dwSize:=Sizeof(TProcessEntry32);
  if Process32First(MyHandle, Struct) then
  If Proc = IntToStr(Struct.th32ProcessID) Then DIDF := True;
  while Process32Next(MyHandle, Struct) do
  If Proc = IntToStr(Struct.th32ProcessID) Then DIDF := True;
  CloseHandle(MyHandle);
  If DIDF = False Then
    Begin
    CC := True;
    // PROCESS NO LONGER RUNNING
    WriteData(FName,'General','StatusID','');
    WriteData(FName,'General','Status','Stopped');
    FN :=  GetTempDir+FName+'.bat';
    DeleteFile(FN);
    ScanProcDB.Delete;
    UpdateTV(fname,2);
    End Else ScanProcDB.Next;
  Until (ScanProcDB.EOF = true) or (CC = True);
  End;
End;


Function TMain.GeneratePortNo : Integer;
var
Index : Integer;
PNo : String;
CC : Boolean;
I : LongInt;
Begin
I := 60001;
PortSL := TStringList.Create;
If FileExists(SysPath+'\QMPorts.Dat') Then
  Begin
  PortSL.LoadFromFile(SysPath+'\QMPorts.Dat');
  If PortSL.Count > 0 Then
    Begin
    PortSL.Sort;
    For I := 60001 To 69999 Do
      Begin
      if PortSL.Find(IntToStr(i), Index) then Begin End Else break;
      End;
    End;
  End;
PortSL.Add(IntToStr(i));
PortSL.SaveToFile(SysPath+'\QMPorts.Dat');
PortSL.Free;
Result := I;
End;

Function TMain.DeletePortNo(Port : Integer) : Boolean;
var
Index : Integer;
PNo : String;
CC : Boolean;
I : LongInt;
Begin
I := Port;
PortSL := TStringList.Create;
If FileExists(SysPath+'\QMPorts.Dat') Then
  Begin
  PortSL.LoadFromFile(SysPath+'\QMPorts.Dat');
  If PortSL.Count > 0 Then
    Begin
    PortSL.Sort;
    For I := 60001 To 69999 Do
      Begin
      if PortSL.Find(IntToStr(i), Index) then Begin If PortSL.Count = 1 Then PortSL.Clear Else PortSL.Delete(Index+1);
      Break;
      Result := True; End;
      End;
    End;
  End Else Result := False;
PortSL.SaveToFile(SysPath+'\QMPorts.Dat');
PortSL.Free;

End;

Procedure TMAIN.UpdateTV(vm : String; Mode : Integer);
var
i,j : Integer;
Begin
i := tv.Items.Count;
For J := 0 to i-1 do
  begin
  If TV.items[j].Text = vm Then
    Begin
    if mode = 1 then tv.Items[j].ImageIndex := 8;
    if mode = 2 then tv.Items[j].ImageIndex := 0;
    End;
  End;
End;


procedure TMain.QuitQemuManager1Click(Sender: TObject);
begin
close
end;

procedure TMain.RestoreQemuManage1Click(Sender: TObject);
begin
show;
end;





procedure TMain.ScreenCapture1Click(Sender: TObject);
 var
ScrHDC: HDC;
ScrHandle: HWnd;
 bmp: TBitmap;
    begin
    ScrHandle := GetDeskTopWindow;
    ScrHDC := GetDC(ScrHandle);
      try
      bmp := TBitmap.Create;
        try
        bmp.Width := Screen.Width;
        bmp.Height := Screen.Height;
        BitBlt(bmp.Canvas.Handle, 0, 0,
        Screen.Width, Screen.Height, ScrHDC, 0, 0, SRCCOPY);

      IF SD.Execute = True Then
        bmp.SaveToFile(SD.Filename);
      finally
      bmp.Free
      end
    finally
    ReleaseDC(ScrHandle, ScrHDC);
    end;
end;


procedure TMain.WndProc(var Msg : TMessage);
var
point : TPoint;
begin
  case Msg.Msg of
    WM_USER + 1:
    case Msg.lParam of
      WM_RBUTTONDOWN:
         begin
         GetCursorPos(point);
         Dock.Popup(point.x, point.y);
         end;
    end;
  end;
  inherited;
 End;


procedure TMain.QemuVersionControlManager1Click(Sender: TObject);
begin
QemuVers.ShowModal;
end;

procedure TMain.Exit1Click(Sender: TObject);
begin
close
end;

procedure TMain.CheckForUpdates1Click(Sender: TObject);
begin
if MessageDlg('Qemu Manager must close to check for updates - continue ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
  ShellExecute (0, nil, PChar(Syspath+'\updater.exe'),nil, nil, SW_SHOWNORMAL);
  Close
  End;
end;

procedure TMain.DisableQemuManagerQEMUClientSupport1Click(Sender: TObject);
var
ini : TIniFile;
begin
INI := TINIFile.Create(SysPath+'\qman.ini');
With Ini Do
  Begin
  If DisableQemuManagerQEMUClientSupport1.Checked = True Then
    Begin
    WriteString('General','Client Support','Yes');
    DisableQemuManagerQEMUClientSupport1.Checked := False;
    NOQMQC := 'Yes';
    End
  Else
    Begin
    WriteString('General','Client Support','No');
    DisableQemuManagerQEMUClientSupport1.Checked := True;
    NOQMQC := 'No';
    End;
  end;
End;

end.
