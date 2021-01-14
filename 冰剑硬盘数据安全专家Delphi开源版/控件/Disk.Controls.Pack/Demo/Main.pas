unit Main;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Spin, Menus, dcDiskScanner,
  dcInternal, dcStdDialogs, dcBrowseDialog, dcDiskInfo, dcFileInfo,
  dcShellProperties, dcFileAssociation, dcShellIcon, dcShellLink,
  dcFileCRC, dcEdits, dcFolderView, dcFolderMonitor,
  dcSystemImageList, dcComCtrls;

type
  TForm1 = class(TForm)
    PageControl: TPageControl;
    DiskScannerSheet: TTabSheet;
    MultiDiskScannerSheet: TTabSheet;
    OthersSheet: TTabSheet;
    Panel2: TPanel;
    MultiDiskScannerSearch: TBitBtn;
    MultiDiskScannerStop: TBitBtn;
    Panel3: TPanel;
    Splitter2: TSplitter;
    Panel1: TPanel;
    Splitter1: TSplitter;
    GroupBox1: TGroupBox;
    IncludeList: TListView;
    Panel4: TPanel;
    Label1: TLabel;
    Add1: TBitBtn;
    Delete1: TBitBtn;
    GroupBox2: TGroupBox;
    ExcludeList: TListView;
    Panel5: TPanel;
    Label2: TLabel;
    Add2: TBitBtn;
    Delete2: TBitBtn;
    GroupBox3: TGroupBox;
    ResultsList: TListView;
    Panel6: TPanel;
    DiskScannerSearch: TBitBtn;
    DiskScannerStop: TBitBtn;
    GroupBox7: TGroupBox;
    MaxMatchesSpin1: TSpinEdit;
    UnlimitedCheck1: TCheckBox;
    Panel7: TPanel;
    Panel8: TPanel;
    GroupBox4: TGroupBox;
    DiskScannerResults: TListView;
    Label3: TLabel;
    Label4: TLabel;
    SearchMaskEdit: TComboBox;
    Panel9: TPanel;
    GroupBox9: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    AnyTimeCheck: TCheckBox;
    CreatedRadio: TRadioButton;
    ModifiedRadio: TRadioButton;
    SinceDate: TDateTimePicker;
    TillDate: TDateTimePicker;
    GroupBox6: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    AnySizeCheck: TCheckBox;
    AtLeastSpin: TSpinEdit;
    AtMostSpin: TSpinEdit;
    Panel10: TPanel;
    GroupBox5: TGroupBox;
    ReadOnlyCheck: TCheckBox;
    HiddenCheck: TCheckBox;
    SystemCheck: TCheckBox;
    DirectoryCheck: TCheckBox;
    ArchiveCheck: TCheckBox;
    AnyCheck: TCheckBox;
    NormalCheck: TCheckBox;
    GroupBox10: TGroupBox;
    IncludeSubfoldersCheck: TCheckBox;
    IncludeHiddenSubfoldersCheck: TCheckBox;
    StatusBar: TStatusBar;
    GroupBox8: TGroupBox;
    MaxMatchesSpin2: TSpinEdit;
    UnlimitedCheck2: TCheckBox;
    GroupBox11: TGroupBox;
    DiskInfoView: TListView;
    GroupBox12: TGroupBox;
    GroupBox13: TGroupBox;
    ListBox: TListBox;
    Panel11: TPanel;
    GetFileInfoBtn: TBitBtn;
    IconsBox: TGroupBox;
    LargeIcon: TImage;
    SmallIcon: TImage;
    Label10: TLabel;
    Label11: TLabel;
    DiskBrowserBtn: TBitBtn;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    BrowseForCombo: TComboBox;
    SpecLocation: TComboBox;
    Msg: TEdit;
    ShowPathCheck: TCheckBox;
    ShowAncCheck: TCheckBox;
    ShowNetCheck: TCheckBox;
    Label15: TLabel;
    GetDiskInfo: TBitBtn;
    TabSheet1: TTabSheet;
    GroupBox14: TGroupBox;
    Panel12: TPanel;
    ExtIconsBox: TGroupBox;
    ExtLargeIcon: TImage;
    ExtSmallIcon: TImage;
    Label16: TLabel;
    Label17: TLabel;
    ExtListBox: TListBox;
    Label18: TLabel;
    GetBtn: TBitBtn;
    ExtEdit: TComboBox;
    Panel13: TPanel;
    InstallTestExtensionBtn: TButton;
    UninstallTestExtensionBtn: TButton;
    Label19: TLabel;
    Label20: TLabel;
    GroupBox15: TGroupBox;
    ShListBox: TListBox;
    Panel14: TPanel;
    ShIconsBox: TGroupBox;
    ShLargeIcon: TImage;
    ShSmallIcon: TImage;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    GetShellIconBtn: TBitBtn;
    DereferenceBox: TCheckBox;
    LinkBox: TCheckBox;
    OpenBox: TCheckBox;
    SelectedBox: TCheckBox;
    TabSheet2: TTabSheet;
    GroupBox16: TGroupBox;
    GroupBox17: TGroupBox;
    Panel15: TPanel;
    GetShortcutInfoBtn: TBitBtn;
    ShortcutIconsBox: TGroupBox;
    ShortcutLargeIcon: TImage;
    ShortcutSmallIcon: TImage;
    Label24: TLabel;
    Label25: TLabel;
    ShortcutListBox: TListBox;
    GroupBox18: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    SaveShellLinkBtn: TBitBtn;
    RunParamsEdit: TEdit;
    WorkingDirEdit: TEdit;
    Label26: TLabel;
    ShowFilesCheck: TCheckBox;
    GroupBox19: TGroupBox;
    CRCMethodCombo: TComboBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    CRCResult: TEdit;
    Label33: TLabel;
    CRCResultHex: TEdit;
    DiskScannerSuspended: TCheckBox;
    MultiDiskScannerSuspended: TCheckBox;
    StartFolder: TdcFolderEdit;
    ShObjectEdit: TdcFolderEdit;
    CRCFilenameEdit: TdcFileEdit;
    LinkTargetEdit: TdcFileEdit;
    FolderMonitorSheet: TTabSheet;
    Panel16: TPanel;
    Label34: TLabel;
    dcFolderEdit1: TdcFolderEdit;
    GroupBox20: TGroupBox;
    Panel18: TPanel;
    ViewStyleComboBox: TComboBox;
    Label35: TLabel;
    Panel17: TPanel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    UpBtn: TSpeedButton;
    dcDiskScanner: TdcDiskScanner;
    StartFolderBrowser: TdcBrowseDialog;
    dcSystemImageList1: TdcSystemImageList;
    dcMultiDiskScanner: TdcMultiDiskScanner;
    dcBrowseDialog: TdcBrowseDialog;
    dcOpenDialog: TdcOpenDialog;
    dcOpenFileDialog: TdcOpenDialog;
    dcOpenShortcutDialog: TdcOpenDialog;
    dcSaveShortcutDialog: TdcSaveDialog;
    dcFileInfo: TdcFileInfo;
    dcShellProperties: TdcShellProperties;
    dcShellLink: TdcShellLink;
    dcFileAssociation1: TdcFileAssociation;
    dcFileCRC1: TdcFileCRC;
    dcShellIcon: TdcShellIcon;
    Animate1: TAnimate;
    dcDiskInfo1: TdcDiskInfo;
    dcFolderMonitor1: TdcFolderMonitor;
    ShowFileExtensionsBox: TCheckBox;
    ShowFoldersBox: TCheckBox;
    SizeBox: TCheckBox;
    TypeBox: TCheckBox;
    Label36: TLabel;
    MaskComboBox: TComboBox;
    ModifiedBox: TCheckBox;
    AttributesBox: TCheckBox;
    PopupMenu1: TPopupMenu;
    Refresh1: TMenuItem;
    N1: TMenuItem;
    CreateFolder1: TMenuItem;
    Folder1: TMenuItem;
    Shortcut1: TMenuItem;
    N2: TMenuItem;
    Properties1: TMenuItem;
    N3: TMenuItem;
    View1: TMenuItem;
    LargeIcons1: TMenuItem;
    SmallIcons1: TMenuItem;
    List1: TMenuItem;
    Report1: TMenuItem;
    ArrangeIcons1: TMenuItem;
    byName1: TMenuItem;
    byType1: TMenuItem;
    bySize1: TMenuItem;
    byDate1: TMenuItem;
    N4: TMenuItem;
    Ascending1: TMenuItem;
    Descending1: TMenuItem;
    dcFolderListView1: TdcFolderListView;
    FindAllFoldersCheck: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure AnySizeCheckClick(Sender: TObject);
    procedure AnyTimeCheckClick(Sender: TObject);
    procedure NormalCheckClick(Sender: TObject);
    procedure AnyCheckClick(Sender: TObject);
    procedure DiskScannerSearchClick(Sender: TObject);
    procedure DiskScannerStopClick(Sender: TObject);
    procedure UnlimitedCheck1Click(Sender: TObject);
    procedure UnlimitedCheck2Click(Sender: TObject);
    procedure dcDiskScannerFileFound(Sender: TObject; FileName,
      FileType: String; FileSize: Extended; FileTime: TDateTime;
      FileAttributes: TdcScanAttributes;
      LargeIcon, SmallIcon: TIcon; SysImageIndex: Integer;
      TotalFiles: Integer; TotalSize: Extended);
    procedure dcDiskScannerScanFolder(Sender: TObject; Folder: String);
    procedure dcDiskScannerScanDone(Sender: TObject; TotalFiles: Integer;
      TotalSize: Extended; ElapsedTimeInSeconds: Integer);
    procedure FormResize(Sender: TObject);
    procedure Add1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Add2Click(Sender: TObject);
    procedure Delete2Click(Sender: TObject);
    procedure MultiDiskScannerSearchClick(Sender: TObject);
    procedure MultiDiskScannerStopClick(Sender: TObject);
    procedure dcMultiDiskScannerFileFound(Sender: TObject; FileName,
      FileType: String; FileSize: Extended; FileTime: TDateTime;
      FileAttributes: TdcScanAttributes;
      LargeIcon, SmallIcon: TIcon; SysImageIndex: Integer;
      TotalFiles: Integer; TotalSize: Extended);
    procedure dcMultiDiskScannerScanFolder(Sender: TObject; Folder: String);
    procedure dcMultiDiskScannerScanDone(Sender: TObject;
      TotalFiles: Integer; TotalSize: Extended;
      ElapsedTimeInSeconds: Integer);
    procedure dcMultiDiskScannerExcludingBegin(Sender: TObject);
    procedure dcMultiDiskScannerExcludingEnd(Sender: TObject);
    procedure IncludeListChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ExcludeListChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure GetFileInfoBtnClick(Sender: TObject);
    procedure DiskBrowserBtnClick(Sender: TObject);
    procedure DiskScannerResultsDblClick(Sender: TObject);
    procedure DiskScannerResultsMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure GetDiskInfoClick(Sender: TObject);
    procedure GetBtnClick(Sender: TObject);
    procedure InstallTestExtensionBtnClick(Sender: TObject);
    procedure UninstallTestExtensionBtnClick(Sender: TObject);
    procedure GetShellIconBtnClick(Sender: TObject);
    procedure DereferenceBoxClick(Sender: TObject);
    procedure LinkBoxClick(Sender: TObject);
    procedure OpenBoxClick(Sender: TObject);
    procedure SelectedBoxClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GetShortcutInfoBtnClick(Sender: TObject);
    procedure SaveShellLinkBtnClick(Sender: TObject);
    procedure CRCMethodComboChange(Sender: TObject);
    procedure DiskScannerSuspendedClick(Sender: TObject);
    procedure MultiDiskScannerSuspendedClick(Sender: TObject);
    procedure StartFolderExit(Sender: TObject);
    procedure ShObjectEditDlgOk(Sender: TObject);
    procedure CRCFilenameEditDlgOk(Sender: TObject);
    procedure dcFolderEdit1DlgOk(Sender: TObject);
    procedure ViewStyleComboBoxChange(Sender: TObject);
    procedure dcMultiDiskScannerFolderNotExist(Sender: TObject;
      Folder: String);
    procedure dcFolderListView1FolderChanged(Sender: TObject;
      Folder: String);
    procedure UpBtnClick(Sender: TObject);
    procedure dcFolderListView1BeginUpdate(Sender: TObject);
    procedure dcFolderListView1EndUpdate(Sender: TObject);
    procedure dcFolderMonitor1Change(Sender: TObject);
    procedure ShowFileExtensionsBoxClick(Sender: TObject);
    procedure ShowFoldersBoxClick(Sender: TObject);
    procedure SizeBoxClick(Sender: TObject);
    procedure TypeBoxClick(Sender: TObject);
    procedure MaskComboBoxChange(Sender: TObject);
    procedure ModifiedBoxClick(Sender: TObject);
    procedure AttributesBoxClick(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure Folder1Click(Sender: TObject);
    procedure Shortcut1Click(Sender: TObject);
    procedure Properties1Click(Sender: TObject);
    procedure dcFolderListView1ColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure byName1Click(Sender: TObject);
  private
    Excluding: Boolean;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}
{$R Roger.res}

uses AddPath, dcUtils;

procedure TForm1.FormShow(Sender: TObject);
begin
  TillDate.Date := Now;

  BrowseForCombo.ItemIndex := 0;
  SpecLocation.ItemIndex := 0;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  StatusBar.Panels[0].Width := Width - StatusBar.Panels[1].Width - StatusBar.Panels[2].Width;

  IncludeList.Columns[0].Width := IncludeList.Width - 5;
  ExcludeList.Columns[0].Width := ExcludeList.Width - 5;
end;

procedure TForm1.AnySizeCheckClick(Sender: TObject);
begin
  Label5.Enabled := not AnySizeCheck.Checked;
  AtLeastSpin.Enabled := not AnySizeCheck.Checked;
  Label6.Enabled := not AnySizeCheck.Checked;
  AtMostSpin.Enabled := not AnySizeCheck.Checked;
  Label7.Enabled := not AnySizeCheck.Checked;
end;

procedure TForm1.AnyTimeCheckClick(Sender: TObject);
begin
  CreatedRadio.Enabled := not AnyTimeCheck.Checked;
  ModifiedRadio.Enabled := not AnyTimeCheck.Checked;
  Label8.Enabled := not AnyTimeCheck.Checked;
  SinceDate.Enabled := not AnyTimeCheck.Checked;
  Label9.Enabled := not AnyTimeCheck.Checked;
  TillDate.Enabled := not AnyTimeCheck.Checked;
end;

procedure TForm1.NormalCheckClick(Sender: TObject);
begin
  with dcDiskScanner do
   begin
    SearchAttributes := [];
    if NormalCheck.Checked then
      SearchAttributes := SearchAttributes + [saNormal]
    else
      AnyCheck.Checked := False;
    if ArchiveCheck.Checked then
      SearchAttributes := SearchAttributes + [saArchive]
    else
      AnyCheck.Checked := False;
    if ReadOnlyCheck.Checked then
      SearchAttributes := SearchAttributes + [saReadOnly]
    else
      AnyCheck.Checked := False;
    if HiddenCheck.Checked then
      SearchAttributes := SearchAttributes + [saHidden]
    else
      AnyCheck.Checked := False;
    if SystemCheck.Checked then
      SearchAttributes := SearchAttributes + [saSystem]
    else
      AnyCheck.Checked := False;
    if DirectoryCheck.Checked then
      SearchAttributes := SearchAttributes + [saDirectory]
    else
      AnyCheck.Checked := False;
    if AnyCheck.Checked then
      SearchAttributes := SearchAttributes + [saAny];

    NormalCheck.Checked := (saNormal in SearchAttributes);
    ArchiveCheck.Checked := (saArchive in SearchAttributes);
    ReadOnlyCheck.Checked := (saReadOnly in SearchAttributes);
    HiddenCheck.Checked := (saHidden in SearchAttributes);
    SystemCheck.Checked := (saSystem in SearchAttributes);
    DirectoryCheck.Checked := (saDirectory in SearchAttributes);
    AnyCheck.Checked := (saAny in SearchAttributes);
   end;
end;

procedure TForm1.AnyCheckClick(Sender: TObject);
begin
  if AnyCheck.Checked then
   begin
    dcDiskScanner.SearchAttributes := [saNormal, saArchive, saReadOnly, saHidden, saSystem, saDirectory, saAny];
    NormalCheck.Checked := True;
    ArchiveCheck.Checked := True;
    ReadOnlyCheck.Checked := True;
    HiddenCheck.Checked := True;
    SystemCheck.Checked := True;
    DirectoryCheck.Checked := True;
   end
  else
   with dcDiskScanner do
    begin
     SearchAttributes := [];
     if NormalCheck.Checked then
       SearchAttributes := SearchAttributes + [saNormal];
     if ArchiveCheck.Checked then
       SearchAttributes := SearchAttributes + [saArchive];
     if ReadOnlyCheck.Checked then
       SearchAttributes := SearchAttributes + [saReadOnly];
     if HiddenCheck.Checked then
       SearchAttributes := SearchAttributes + [saHidden];
     if SystemCheck.Checked then
       SearchAttributes := SearchAttributes + [saSystem];
     if DirectoryCheck.Checked then
       SearchAttributes := SearchAttributes + [saDirectory];
   end
end;

procedure TForm1.DiskScannerSearchClick(Sender: TObject);
begin
  with dcDiskScanner do
   begin
    Folder := StartFolder.Text;
    SearchMask := SearchMaskEdit.Text;
    IncludeSubfolders := IncludeSubfoldersCheck.Checked;
    IncludeHiddenSubfolders := IncludeHiddenSubfoldersCheck.Checked;
    FindAllFolders := FindAllFoldersCheck.Checked;

    SearchAttributes := [];
    if NormalCheck.Checked then
      SearchAttributes := SearchAttributes + [saNormal];
    if ArchiveCheck.Checked then
      SearchAttributes := SearchAttributes + [saArchive];
    if ReadOnlyCheck.Checked then
      SearchAttributes := SearchAttributes + [saReadOnly];
    if HiddenCheck.Checked then
      SearchAttributes := SearchAttributes + [saHidden];
    if SystemCheck.Checked then
      SearchAttributes := SearchAttributes + [saSystem];
    if DirectoryCheck.Checked then
      SearchAttributes := SearchAttributes + [saDirectory];
    if AnyCheck.Checked then
      SearchAttributes := SearchAttributes + [saAny];

    SearchSize.AnySize := AnySizeCheck.Checked;
    SearchSize.MinSizeKB := AtLeastSpin.Value;
    SearchSize.MaxSizeKB := AtMostSpin.Value;

    SearchTime.AnyTime := AnyTimeCheck.Checked;
    if CreatedRadio.Checked then SearchTime.FindFiles := ffCreated
    else
     if ModifiedRadio.Checked then SearchTime.FindFiles := ffModified;

    SearchTime.SinceTime := SinceDate.Date;
    SearchTime.TillTime := TillDate.Date;

    Matches.Limited := not UnlimitedCheck1.Checked;
    Matches.MaxMatches := MaxMatchesSpin1.Value;

    DiskScannerSearch.Enabled := False;
    DiskScannerStop.Enabled := True;
    DiskScannerSuspended.Checked := False;    

    with DiskScannerResults.Items do
     begin
      BeginUpdate;
      try
        Clear;
      finally
        EndUpdate;
      end;
     end;

    Execute;
   end;
end;

procedure TForm1.DiskScannerStopClick(Sender: TObject);
begin
  dcDiskScanner.Stop
end;

procedure TForm1.UnlimitedCheck1Click(Sender: TObject);
begin
  MaxMatchesSpin1.Enabled := not UnlimitedCheck1.Checked;
end;

procedure TForm1.UnlimitedCheck2Click(Sender: TObject);
begin
  MaxMatchesSpin2.Enabled := not UnlimitedCheck2.Checked;
end;

procedure TForm1.dcDiskScannerFileFound(Sender: TObject; FileName,
  FileType: String; FileSize: Extended; FileTime: TDateTime;
  FileAttributes: TdcScanAttributes;
  LargeIcon, SmallIcon: TIcon; SysImageIndex: Integer;
  TotalFiles: Integer; TotalSize: Extended);
const
  KBStr = 'KB';  
var
  St: String;
  ListItem: TListItem;
begin
  StatusBar.Panels[1].Text := 'Files ' + IntToStr(TotalFiles);
  StatusBar.Panels[2].Text := 'Total size: ' + FloatToStr(TotalSize) + ' bytes';

  ListItem := DiskScannerResults.Items.Add; // adding new item
{** file name}
  ListItem.Caption := FileName;
{** file type}
  ListItem.SubItems.Add(FileType);
{** file size}
  if not (saDirectory in FileAttributes) then
    if FileSize <> 0 then
      St := FloatToStrF(Int(FileSize / 1024 + 1), ffNumber, 18, 0) + KBStr
    else
      St := '0' + KBStr
  else
    St := '';
  ListItem.SubItems.Add(St);
{** file time}
  ListItem.SubItems.Add(DateTimeToStr(FileTime));

{** icon image }
  ListItem.ImageIndex := SysImageIndex;
  if saHidden in FileAttributes then
    ListItem.Cut := True;
  St := LowerCase(ExtractFileExt(FileName));
  { adding shortcut overlay for .lnk and .url }
  if (St = '.lnk') or (St = '.url') then
    ListItem.OverlayIndex := 1;

{ //* Use code below if you don't want to use
  //* system images and set DiskScanner1.UseIcons to True
  ListItem.ImageIndex := ImageList1.Count;
  ImageList1.AddIcon(SmallIcon); }
end;

procedure TForm1.dcDiskScannerScanFolder(Sender: TObject; Folder: String);
begin            
  StatusBar.Panels[0].Text := Folder;
end;

procedure TForm1.dcDiskScannerScanDone(Sender: TObject; TotalFiles: Integer;
  TotalSize: Extended; ElapsedTimeInSeconds: Integer);
begin
  DiskScannerSearch.Enabled := True;
  DiskScannerStop.Enabled := False;

  ShowMessage('Scanning done.'#13#10 +
              'Total files found by specified criteria: ' + IntToStr(TotalFiles) + #13#10 +
              'Total size of files: ' + FloatToStr(TotalSize) + ' bytes'#13#10 +
              'Elapsed Time: ' + IntToStr(ElapsedTimeInSeconds) + ' seconds.');
end;

procedure TForm1.Add1Click(Sender: TObject);
var
  AddPathForm: TAddPathForm;
  ListItem: TListItem;
begin
  AddPathForm := TAddPathForm.Create(Application);
  if AddPathForm.ShowModal = id_Ok then
   begin
    ListItem := IncludeList.Items.Add;
    ListItem.Caption := AddPathForm.PathEdit.Text;
    ListItem.Checked := AddPathForm.IncludeCheck.Checked;
   end;
  AddPathForm.Free;
end;

procedure TForm1.Delete1Click(Sender: TObject);
var
  ListItem: TListItem;
begin
  ListItem := IncludeList.Selected;
  if ListItem <> nil then
   IncludeList.Items.Delete(ListItem.Index);
end;

procedure TForm1.Add2Click(Sender: TObject);
var
  AddPathForm: TAddPathForm;
  ListItem: TListItem;
begin
  AddPathForm := TAddPathForm.Create(Application);
  if AddPathForm.ShowModal = id_Ok then
   begin
    ListItem := ExcludeList.Items.Add;
    ListItem.Caption := AddPathForm.PathEdit.Text;
    ListItem.Checked := AddPathForm.IncludeCheck.Checked;
   end;
  AddPathForm.Free;
end;

procedure TForm1.Delete2Click(Sender: TObject);
var
  ListItem: TListItem;
begin
  ListItem := ExcludeList.Selected;
  if ListItem <> nil then
   ExcludeList.Items.Delete(ListItem.Index);
end;

procedure TForm1.IncludeListChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  Delete1.Enabled := IncludeList.Selected <> nil;
end;

procedure TForm1.ExcludeListChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  Delete2.Enabled := ExcludeList.Selected <> nil;
end;

procedure TForm1.MultiDiskScannerSearchClick(Sender: TObject);
var
  i: Integer;
  ListItem: TListItem;
begin
  ResultsList.Items.Clear;
  dcMultiDiskScanner.IncludeList.Clear;
  dcMultiDiskScanner.ExcludeList.Clear;

  i := IncludeList.Items.Count;
  if i <> 0 then
   for i := 0 to i - 1 do
    begin
     ListItem := IncludeList.Items[i];
     dcMultiDiskScanner.IncludeList.AddPath(ListItem.Caption, ListItem.Checked);
    end;

  i := ExcludeList.Items.Count;
  if i <> 0 then
   for i := 0 to i - 1 do
    begin
     ListItem := ExcludeList.Items[i];
     dcMultiDiskScanner.ExcludeList.AddPath(ListItem.Caption, ListItem.Checked);
    end;

  MultiDiskScannerSearch.Enabled := False;
  MultiDiskScannerStop.Enabled := True;
  MultiDiskScannerSuspended.Checked := False;

  dcMultiDiskScanner.Matches.Limited := not UnlimitedCheck2.Checked;
  dcMultiDiskScanner.Matches.MaxMatches := MaxMatchesSpin2.Value;

  dcMultiDiskScanner.Execute;
end;

procedure TForm1.MultiDiskScannerStopClick(Sender: TObject);
begin
  dcMultiDiskScanner.Stop;
end;

procedure TForm1.dcMultiDiskScannerFileFound(Sender: TObject; FileName,
  FileType: String; FileSize: Extended; FileTime: TDateTime;
  FileAttributes: TdcScanAttributes;
  LargeIcon, SmallIcon: TIcon; SysImageIndex: Integer;
  TotalFiles: Integer; TotalSize: Extended);
var
  ListItem: TListItem;
begin
  StatusBar.Panels[1].Text := 'Files ' + IntToStr(TotalFiles);
  StatusBar.Panels[2].Text := 'Total size: ' + FloatToStr(TotalSize) + ' bytes';

  ListItem := ResultsList.Items.Add;
  ListItem.Caption := FileName;
  ListItem.SubItems.Add(FileType);
  if not (saDirectory in FileAttributes) then
    ListItem.SubItems.Add(FloatToStr(Int(FileSize / 1024) + 1) + ' Kb');
  ListItem.SubItems.Add(DateTimeToStr(FileTime));  

  ListItem.ImageIndex := SysImageIndex;
end;

procedure TForm1.dcMultiDiskScannerScanFolder(Sender: TObject;
  Folder: String);
begin
  if Excluding then Folder := 'Excluding: ' + Folder;
  StatusBar.Panels[0].Text := Folder;
end;

procedure TForm1.dcMultiDiskScannerScanDone(Sender: TObject;
  TotalFiles: Integer; TotalSize: Extended; ElapsedTimeInSeconds: Integer);
begin
  MultiDiskScannerSearch.Enabled := True;
  MultiDiskScannerStop.Enabled := False;

  ShowMessage('Scanning done.'#13#10 +
              'Total files found by specified criteria: ' + IntToStr(TotalFiles) + #13#10 +
              'Total size of files: ' + FloatToStr(TotalSize) + ' bytes'#13#10 +
              'Elapsed Time: ' + IntToStr(ElapsedTimeInSeconds) + ' seconds.');
end;

procedure TForm1.dcMultiDiskScannerExcludingBegin(Sender: TObject);
begin
  Excluding := True;
end;

procedure TForm1.dcMultiDiskScannerExcludingEnd(Sender: TObject);
begin
  Excluding := False;
end;

procedure TForm1.dcMultiDiskScannerFolderNotExist(Sender: TObject;
  Folder: String);
begin
  Application.MessageBox(PChar('Folder "' + Folder + '" not exist.'), 'dcMultiDiskScanner', MB_ICONINFORMATION);
end;

procedure TForm1.GetFileInfoBtnClick(Sender: TObject);
var
  St: String;
begin
  if dcOpenDialog.Execute then
   begin
    dcFileInfo.FileName := dcOpenDialog.FileName;
    IconsBox.Visible := True;

    ListBox.Clear;
    ListBox.Items.Add('Name: ' + dcFileInfo.FileName);
    ListBox.Items.Add('Type: ' + dcFileInfo.FileType);
    ListBox.Items.Add('Size: ' + FloatToStr(dcFileInfo.FileSize) + ' bytes');
    ListBox.Items.Add('Created: ' + DateTimeToStr(dcFileInfo.TimeCreated));
    ListBox.Items.Add('Modified: ' + DateTimeToStr(dcFileInfo.TimeLastModified));
    ListBox.Items.Add('Accessed: ' + DateTimeToStr(dcFileInfo.TimeLastAccessed));

    St := 'Attributes: ';
    if fiaArchive in dcFileInfo.FileAttributes then
     St := St + 'Archive ';
    if fiaHidden in dcFileInfo.FileAttributes then
     St := St + 'Hidden ';
    if fiaReadOnly in dcFileInfo.FileAttributes then
     St := St + 'ReadOnly ';
    if fiaSystem in dcFileInfo.FileAttributes then
     St := St + 'System ';
    ListBox.Items.Add(St);

    LargeIcon.Picture.Icon.Assign(dcFileInfo.LargeIcon);
    SmallIcon.Picture.Icon.Assign(dcFileInfo.SmallIcon);
   end;
end;

procedure TForm1.DiskBrowserBtnClick(Sender: TObject);
begin
  with dcBrowseDialog do
   begin
    StatusText := Msg.Text;

    case BrowseForCombo.ItemIndex of
      0: BrowseFor := forFolder;
      1: BrowseFor := forComputer;
      2: BrowseFor := forPrinter;
      3: BrowseFor := forAnything;
     end;

    case SpecLocation.ItemIndex of
       0: SpecialLocation := slNone;
       1: SpecialLocation := slDesktop;
       2: SpecialLocation := slPrograms;
       3: SpecialLocation := slControlPanel;
       4: SpecialLocation := slPrinters;
       5: SpecialLocation := slPersonal;
       6: SpecialLocation := slFavorites;
       7: SpecialLocation := slStartup;
       8: SpecialLocation := slRecent;
       9: SpecialLocation := slSendto;
      10: SpecialLocation := slRecycleBin;
      11: SpecialLocation := slStartMenu;
      12: SpecialLocation := slDesktopDirectory;
      13: SpecialLocation := slMyComputer;
      14: SpecialLocation := slNetwork;
      15: SpecialLocation := slNethood;
      16: SpecialLocation := slFonts;
      17: SpecialLocation := slTemplates;
     end;

    Options := [];
    if ShowPathCheck.Checked then
      Options := Options + [soShowStatusText, soShowPathInStatus];
    if ShowAncCheck.Checked then
      Options := Options + [soShowSysAncestors];
    if ShowNetCheck.Checked then
      Options := Options + [soShowNetworkFiles];
    if ShowFilesCheck.Checked then
      Options := Options + [soShowFiles];

    Execute;
   end;
end;

procedure TForm1.DiskScannerResultsDblClick(Sender: TObject);
var
  ListItem: TListItem;
begin
  if PageControl.ActivePage = DiskScannerSheet then
    ListItem := DiskScannerResults.Selected
  else
    ListItem := ResultsList.Selected;  
  if ListItem = nil then Exit;

  dcShellProperties.ShowPropertiesByFile(ListItem.Caption);
end;

procedure TForm1.DiskScannerResultsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ListItem: TListItem;
begin
  if Button = mbRight then
   begin
    if PageControl.ActivePage = DiskScannerSheet then
      ListItem := DiskScannerResults.Selected
    else
      ListItem := ResultsList.Selected;
    if ListItem = nil then Exit;

    dcShellProperties.ShowContextMenuByFile(ListItem.Caption);
   end; 
end;

procedure TForm1.GetDiskInfoClick(Sender: TObject);
var
  DriveNum: Integer;
  St: String;

  ListItem: TListItem;
begin
  DiskInfoView.Items.Clear;

  for DriveNum := 1 to Length(dcDiskInfo1.AvailableDrives) do
   begin
    dcDiskInfo1.Disk := dcDiskInfo1.AvailableDrives[DriveNum];

    ListItem := DiskInfoView.Items.Add;
    ListItem.Caption := dcDiskInfo1.Disk;
    ListItem.SubItems.Add(dcDiskInfo1.SerialNumberStr);

    if dcDiskInfo1.DriveType <> dtNoDrive then
     begin
      ListItem.ImageIndex := dcDiskInfo1.SysImageIndex;
      ListItem.SubItems.Add(dcDiskInfo1.FileSystem);

      case dcDiskInfo1.DriveType of
        dtCDROM: St := 'CD-ROM';
        dtFixed: St := 'Fixed';
        dtFloppy: St := 'Floppy';
        dtNetwork: St := 'Network';
        dtRAM: St := 'RAM';
        dtVirtual: St := 'Virtual';
        dtUnknown: St := 'Unknown';
       end;

      ListItem.SubItems.Add(St);
      ListItem.SubItems.Add(FloatToStr(dcDiskInfo1.DiskSize / 1024) + ' Kb');
      ListItem.SubItems.Add(FloatToStr(dcDiskInfo1.DiskFree / 1024) + ' Kb');
     end
    else
     begin
      ListItem.SubItems.Add('No Disk');
      ListItem.SubItems.Add('No Disk');
     end;
   end;
end;

procedure TForm1.GetBtnClick(Sender: TObject);
begin
  dcFileAssociation1.EXTENSION := ExtEdit.Text;
  ExtIconsBox.Visible := True;

  with ExtListBox, dcFileAssociation1 do
   begin
    Clear;
    Items.Add('Executable file: ' + ExecutableFile);
    Items.Add('Parameters: ' + ParamString);
    Items.Add('Icon file: ' + IconFile + '; Index: ' + IntToStr(IconIndex));
    Items.Add('File type: ' + FileDescription);
    Items.Add('Extension description: ' + ExtDescription);
   end;

  ExtLargeIcon.Picture.Icon.Assign(dcFileAssociation1.LargeIcon);
  ExtSmallIcon.Picture.Icon.Assign(dcFileAssociation1.SmallIcon);
end;

procedure TForm1.InstallTestExtensionBtnClick(Sender: TObject);
begin
  with dcFileAssociation1 do
   begin
    AccessMode := amReadWrite;
    EXTENSION := 'test';
    FileDescription := 'Test File';
    ExecutableFile := Application.ExeName;
    ParamString := '%1';
    IconFile := Application.ExeName;
    IconIndex := 1;
   end;
end;

procedure TForm1.UninstallTestExtensionBtnClick(Sender: TObject);
begin
  dcFileAssociation1.UninstallExtension('test');
end;

procedure TForm1.GetShellIconBtnClick(Sender: TObject);
begin
  dcShellIcon.FileName := ShObjectEdit.Text;
  ShIconsBox.Visible := True;

  ShListBox.Clear;
  ShListBox.Items.Add('File name: ' + dcShellIcon.FileName);  
  ShListBox.Items.Add('Display name: ' + dcShellIcon.DisplayName);
  ShListBox.Items.Add('File type: ' + dcShellIcon.FileType);
  ShLargeIcon.Picture.Icon.Assign(dcShellIcon.LargeIcon);
  ShSmallIcon.Picture.Icon.Assign(dcShellIcon.SmallIcon);
end;

procedure TForm1.DereferenceBoxClick(Sender: TObject);
begin
  if DereferenceBox.Checked then
    dcShellIcon.Options := dcShellIcon.Options + [ioDereferenceShellLinks]
  else
    dcShellIcon.Options := dcShellIcon.Options - [ioDereferenceShellLinks];

  GetShellIconBtnClick(nil);    
end;

procedure TForm1.LinkBoxClick(Sender: TObject);
begin
  if LinkBox.Checked then
    dcShellIcon.Options := dcShellIcon.Options + [ioLinkOverlay]
  else
    dcShellIcon.Options := dcShellIcon.Options - [ioLinkOverlay];

  GetShellIconBtnClick(nil);
end;

procedure TForm1.OpenBoxClick(Sender: TObject);
begin
  if OpenBox.Checked then
    dcShellIcon.Options := dcShellIcon.Options + [ioOpen]
  else
    dcShellIcon.Options := dcShellIcon.Options - [ioOpen];

  GetShellIconBtnClick(nil);
end;

procedure TForm1.SelectedBoxClick(Sender: TObject);
begin
  if SelectedBox.Checked then
    dcShellIcon.Options := dcShellIcon.Options + [ioSelected]
  else
    dcShellIcon.Options := dcShellIcon.Options - [ioSelected];

  GetShellIconBtnClick(nil);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LinkTargetEdit.Text := LowerCase(Application.ExeName);
  CRCFilenameEdit.Text := LowerCase(Application.ExeName);
  dcFileCRC1.FILENAME := Application.ExeName;
  CRCMethodCombo.ItemIndex := 0;
  CRCResult.Text := IntToStr(dcFileCRC1.CRC);
  CRCResultHex.Text := IntToHex(dcFileCRC1.CRC, 8);

  { FolderListView }
  ViewStyleComboBox.ItemIndex := Integer(dcFolderListView1.ViewStyle);
  case dcFolderListView1.ViewStyle of
    vsIcon: LargeIcons1.Checked := True;
    vsSmallIcon: SmallIcons1.Checked := True;
    vsList: List1.Checked := True;
    vsReport: Report1.Checked := True;
   end;
  case dcFolderListView1.SortColumn of
    1: byType1.Checked := True;
    2: bySize1.Checked := True;
    3: byDate1.Checked := True;
    else byName1.Checked := True;
   end;
  if dcFolderListView1.SortDirection = sdAscending then
    Ascending1.Checked := True
  else
    Descending1.Checked := True;
  { *** ***** *** }

  if ParamCount <> 0 then
   ShowMessage('We have to process the "' + ParamStr(1) + '" file !');
end;

procedure TForm1.GetShortcutInfoBtnClick(Sender: TObject);
begin
  if dcOpenShortcutDialog.Execute then
   begin
    dcShellLink.FileName := dcOpenShortcutDialog.FileName;
    ShortcutIconsBox.Visible := True;

    ShortcutListBox.Clear;
    ShortcutListBox.Items.Add('File Name: ' + dcShellLink.FileName);
    ShortcutListBox.Items.Add('Short Description: ' + dcShellLink.ShortDescription);
    ShortcutListBox.Items.Add('Link Target: ' + dcShellLink.LinkTarget);
    ShortcutListBox.Items.Add('Run Parameters: ' + dcShellLink.Parameters);
    ShortcutListBox.Items.Add('Working Directory: ' + dcShellLink.WorkingDirectory);
    ShortcutListBox.Items.Add('Hot Key: ' + ShortcutToText(dcShellLink.HotKey));
    ShortcutListBox.Items.Add('Icon Location: ' + dcShellLink.IconLocation + '; Index: ' + IntToStr(dcShellLink.IconIndex));

    ShortcutLargeIcon.Picture.Icon.Assign(dcShellLink.LargeIcon);
    ShortcutSmallIcon.Picture.Icon.Assign(dcShellLink.SmallIcon);
   end;
end;

procedure TForm1.SaveShellLinkBtnClick(Sender: TObject);
begin
  if dcSaveShortcutDialog.Execute then
   begin
    dcShellLink.LinkTarget := LinkTargetEdit.Text;
    dcShellLink.Parameters := RunParamsEdit.Text;
    dcShellLink.WorkingDirectory := WorkingDirEdit.Text;
    dcShellLink.SaveToFile(dcSaveShortcutDialog.FileName);
   end;
end;

procedure TForm1.CRCMethodComboChange(Sender: TObject);
begin
  dcFileCRC1.Method := TdcFileCRCMethod(CRCMethodCombo.ItemIndex);
  CRCResult.Text := IntToStr(dcFileCRC1.CRC);
  CRCResultHex.Text := IntToHex(dcFileCRC1.CRC, 8);
end;

procedure TForm1.DiskScannerSuspendedClick(Sender: TObject);
begin
  dcDiskScanner.Suspended := DiskScannerSuspended.Checked;
end;

procedure TForm1.MultiDiskScannerSuspendedClick(Sender: TObject);
begin
  dcMultiDiskScanner.Suspended := MultiDiskScannerSuspended.Checked;
end;

procedure TForm1.StartFolderExit(Sender: TObject);
begin
  try
    dcDiskScanner.Folder := StartFolder.Text;
  except
    StartFolder.SetFocus;
    raise
  end;
end;

procedure TForm1.ShObjectEditDlgOk(Sender: TObject);
begin
  GetShellIconBtnClick(nil);
end;

procedure TForm1.CRCFilenameEditDlgOk(Sender: TObject);
begin
  dcFileCRC1.FILENAME := CRCFilenameEdit.Text;
  CRCResult.Text := IntToStr(dcFileCRC1.CRC);
  CRCResultHex.Text := IntToHex(dcFileCRC1.CRC, 8);
end;

procedure TForm1.dcFolderEdit1DlgOk(Sender: TObject);
begin
  dcFolderListView1.Folder := dcFolderEdit1.Text;
  dcFolderMonitor1.Folder := dcFolderEdit1.Text;
  UpBtn.Enabled := dcFolderListView1.IsBackPossible;
end;

procedure TForm1.ViewStyleComboBoxChange(Sender: TObject);
begin
  if (Sender = nil) or not (Sender is TComponent) then Exit;

  LargeIcons1.Checked := False;
  SmallIcons1.Checked := False;
  List1.Checked := False;
  Report1.Checked := False;

  if (Sender as TComponent).Tag = 0 then
    dcFolderListView1.ViewStyle := TViewStyle(ViewStyleComboBox.ItemIndex)
  else
    dcFolderListView1.ViewStyle := TViewStyle((Sender as TComponent).Tag - 1);

  ViewStyleComboBox.ItemIndex := Integer(dcFolderListView1.ViewStyle);
  case dcFolderListView1.ViewStyle of
    vsIcon: LargeIcons1.Checked := True;
    vsSmallIcon: SmallIcons1.Checked := True;
    vsList: List1.Checked := True;
    vsReport: Report1.Checked := True;
   end;
end;

procedure TForm1.byName1Click(Sender: TObject);
begin
  if Sender <> nil then
   begin
    if not (Sender is TComponent) then Exit;
    if (Sender as TComponent).Tag < 4 then
      dcFolderListView1.SortColumn := (Sender as TComponent).Tag
    else
      dcFolderListView1.SortDirection := TdcListViewSortDirection((Sender as TComponent).Tag - 10);
   end;

  with dcFolderListView1 do
   begin
    byName1.Checked := SortColumn = 0;
    bySize1.Checked := SortColumn = 1;
    byType1.Checked := SortColumn = 2;
    byDate1.Checked := SortCOlumn = 3;
    Ascending1.Checked := SortDirection = sdAscending;
    Descending1.Checked := SortDirection = sdDescending;
   end; 
end;

procedure TForm1.dcFolderListView1ColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  byName1Click(nil);
end;

procedure TForm1.dcFolderListView1FolderChanged(Sender: TObject;
  Folder: String);
begin
  dcFolderEdit1.Text := Folder;
  dcFolderMonitor1.Folder := Folder;
  UpBtn.Enabled := dcFolderListView1.IsBackPossible;
end;

procedure TForm1.UpBtnClick(Sender: TObject);
begin
  dcFolderListView1.Back;
end;

procedure TForm1.dcFolderListView1BeginUpdate(Sender: TObject);
begin
  Animate1.Active := True;
  Animate1.Visible := True;
end;

procedure TForm1.dcFolderListView1EndUpdate(Sender: TObject);
begin
  Animate1.Visible := False;
  Animate1.Active := False;
end;

procedure TForm1.dcFolderMonitor1Change(Sender: TObject);
begin
  dcFolderListView1.Refresh;
end;

procedure TForm1.ShowFileExtensionsBoxClick(Sender: TObject);
begin
  dcFolderListView1.ShowFileExtensions := ShowFileExtensionsBox.Checked;
end;

procedure TForm1.ShowFoldersBoxClick(Sender: TObject);
begin
  with dcFolderListView1 do
   if ShowFoldersBox.Checked then
     FileAttributes := FileAttributes + [saDirectory]
   else
     FileAttributes := FileAttributes - [saDirectory]   
end;

procedure TForm1.SizeBoxClick(Sender: TObject);
begin
  dcFolderListView1.ReportColumns.Size.Visible := SizeBox.Checked;
end;

procedure TForm1.TypeBoxClick(Sender: TObject);
begin
  dcFolderListView1.ReportColumns.FileType.Visible := TypeBox.Checked;
end;

procedure TForm1.ModifiedBoxClick(Sender: TObject);
begin
  dcFolderListView1.ReportColumns.Modified.Visible := ModifiedBox.Checked;
end;

procedure TForm1.AttributesBoxClick(Sender: TObject);
begin
  dcFolderListView1.ReportColumns.Attributes.Visible := AttributesBox.Checked;
end;

procedure TForm1.MaskComboBoxChange(Sender: TObject);
begin
  dcFolderListView1.FileMask := MaskComboBox.Text;
end;

procedure TForm1.Refresh1Click(Sender: TObject);
begin
  dcFolderListView1.Refresh;
end;

procedure TForm1.Folder1Click(Sender: TObject);
begin
  dcFolderListView1.CreateFolder('New Folder', True);
end;

procedure TForm1.Shortcut1Click(Sender: TObject);
begin
  dcFolderListView1.CreateShortcut;
end;

procedure TForm1.Properties1Click(Sender: TObject);
begin
  dcFolderListView1.ShowFolderProperties;
end;

end.
