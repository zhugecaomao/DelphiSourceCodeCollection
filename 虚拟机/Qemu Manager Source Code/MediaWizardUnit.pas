unit MediaWizardUnit;

interface

uses
  Windows, Messages, SysUtils,  Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Spin, TntDialogs, TntStdCtrls,
  TntExtCtrls,TNTForms;

type
  TMediaStoreWiz = class(TTNTForm)
    OpenDlg: TTntOpenDialog;
    NB: TNotebook;
    Bevel7: TTNTBevel;
    Bevel1: TTNTBevel;
    P1Back: TTNTButton;
    P1Next: TTNTButton;
    P1Cancel: TTNTButton;
    Panel1: TTNTPanel;
    Label2: TTNTLabel;
    Panel2: TTNTPanel;
    Bevel2: TTNTBevel;
    Bevel3: TTNTBevel;
    P2Back: TTNTButton;
    P2Next: TTNTButton;
    P2Cancel: TTNTButton;
    Label4: TTNTLabel;
    AddHow: TTNTRadioGroup;
    Panel3: TTNTPanel;
    Bevel4: TTNTBevel;
    Bevel5: TTNTBevel;
    MIBack: TTNTButton;
    MINext: TTNTButton;
    MICancel: TTNTButton;
    Label6: TTNTLabel;
    GroupBox1: TTNTGroupBox;
    Label7: TTNTLabel;
    Source: TTNTComboBox;
    Button1: TTNTButton;
    DestLbl: TTNTLabel;
    SaveDlg: TTNTSaveDialog;
    Panel4: TTNTPanel;
    Bevel6: TTNTBevel;
    Bevel8: TTNTBevel;
    MI2Back: TTNTButton;
    MI2Next: TTNTButton;
    MI2Cancel: TTNTButton;
    Label9: TTNTLabel;
    Label10: TTNTLabel;
    FileToCreate: TTNTLabel;
    PB: TProgressBar;
    Done: TTNTLabel;
    Bevel9: TTNTBevel;
    Bevel10: TTNTBevel;
    FinishBtn: TTNTButton;
    GroupBox2: TTNTGroupBox;
    CDImg: TTNTCheckBox;
    FlopImg: TTNTCheckBox;
    Panel6: TTNTPanel;
    Bevel11: TTNTBevel;
    Bevel12: TTNTBevel;
    BLBack: TTNTButton;
    BlNext: TTNTButton;
    BlCancel: TTNTButton;
    Label15: TTNTLabel;
    GroupBox3: TTNTGroupBox;
    disks: TSpinEdit;
    Label16: TTNTLabel;
    Label11: TTNTLabel;
    Label13: TTNTLabel;
    Panel5: TTNTPanel;
    Label17: TTNTLabel;
    procedure P2BackClick(Sender: TObject);
    procedure AddHowClick(Sender: TObject);
    procedure P1NextClick(Sender: TObject);
    procedure P2NextClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure MIBackClick(Sender: TObject);
    procedure MI2BackClick(Sender: TObject);
    procedure MINextClick(Sender: TObject);
    procedure MI2NextClick(Sender: TObject);
    procedure FinishBtnClick(Sender: TObject);
    procedure P1CancelClick(Sender: TObject);
    procedure SourceChange(Sender: TObject);
    procedure CDImgClick(Sender: TObject);
    procedure FlopImgClick(Sender: TObject);
    procedure BLBackClick(Sender: TObject);
  private
    { Private declarations }
  public
Function DetectCDROMDrives(Drive : String) : Boolean;
Function DetectFloppyDrives(Drive : String) : Boolean;
Function FileCopy( Const sourcefilename, targetfilename: String ) : Boolean;
    { Public declarations }
  end;

var
  MediaStoreWiz: TMediaStoreWiz;

implementation

uses mainUnit, WaitUnit;

{$R *.dfm}

procedure TMediaStoreWiz.P2BackClick(Sender: TObject);
begin
NB.ActivePage:= 'P1';
end;

procedure TMediaStoreWiz.AddHowClick(Sender: TObject);
begin
If AddHow.ItemIndex = -1 Then P2Next.Enabled := false Else P2Next.Enabled := True;
end;

procedure TMediaStoreWiz.P1NextClick(Sender: TObject);
var
I : Integer;
begin
If CdImg.Checked = True Then
  Begin
  AddHow.Items.Clear;
  Addhow.Items.AdD('Create From CD-ROM/DVD Disk');
  AddHow.Items.strings[0] := 'Create From CD-ROM/DVD Disk';
  Source.Clear;
  for i := 0 to 25 do If DetectCDROMDrives(Chr(i + 65) + ':') = True Then Source.Items.Add(Chr(i + 65) + ':');
  SaveDlg.Filter := 'ISO Image Files|*.iso'; SaveDlg.DefaultExt :='iso';
  SaveDlg.InitialDir := SysPath+'\media';
  SaveDlg.Filename := '';
  NB.ActivePage := 'MI';
  End;

If FlopImg.Checked = True Then
  Begin
  AddHow.Items.Clear;
  Addhow.Items.AdD('Create From CD-ROM/DVD Disk');
  AddHow.Items.Add('Create Blank Floppy Disk Image');
  AddHow.Items.strings[0] := 'Create From Floppy Disk';
  Source.Clear;
  for i := 0 to 25 do If DetectFloppyDrives(Chr(i + 65) + ':') = True Then Source.Items.Add(Chr(i + 65) + ':');
  SaveDlg.Filter := 'Disk Image Files|*.img'; SaveDlg.DefaultExt :='img';
  SaveDlg.InitialDir := SysPath+'\media';
  SaveDlg.Filename := '';
  NB.ActivePage := 'P2';
  End;
end;

procedure TMediaStoreWiz.P2NextClick(Sender: TObject);
begin
If AddHow.ItemIndex = 0 Then NB.ActivePage := 'MI';
If AddHow.ItemIndex = 1 Then
  Begin
  SaveDlg.Filter := 'Floppy Disk Image Files|*.img';
  SaveDlg.DefaultExt :='img';
  SaveDlg.InitialDir := sysPath+'\Media';
  SaveDlg.Filename := '';
  If SaveDlg.Execute = True Then
    Begin
    WaitText := 'Creating Image - Please Wait';
    Wait.show;Wait.Refresh;
    FileCopy(SysPath+'\resource\144mb.img',SaveDlg.Filename);
    Wait.Hide;
    ActMedia := ExtractFileName(SaveDlg.Filename);
    NB.ActivePage := 'Finish';
    End;
  End;
End;

Function TMediaStoreWiz.detectCDROMDrives(Drive : String) : Boolean;
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

Function TMediaStoreWiz.detectFloppyDrives(Drive : String) : Boolean;
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

procedure TMediaStoreWiz.Button1Click(Sender: TObject);
begin
SaveDlg.InitialDir := SysPath+'\Media';
SaveDlg.Filename := '';
If SaveDlg.Execute = True Then
  Begin
  DestLbl.Caption := SaveDlg.Filename;
  IF (Source.ItemIndex = -1) or (DestLbl.Caption = 'None') Then MINext.Enabled := false Else MINext.Enabled := True;
  End;
end;

procedure TMediaStoreWiz.MIBackClick(Sender: TObject);
begin
If FlopImg.Checked = True Then NB.ActivePage := 'P2' Else NB.ActivePage := 'P1';
end;

procedure TMediaStoreWiz.MI2BackClick(Sender: TObject);
begin
NB.ActivePage := 'MI';
end;

procedure TMediaStoreWiz.MINextClick(Sender: TObject);
begin
FileToCreate.Caption := DestLbl.Caption;
NB.ActivePage := 'MI2';
{Make Image Here}
NB.Refresh;
IF Main.CreateDiskImage(Source.Text,DestLbl.Caption,PB) = True Then
  Begin
  Done.Visible := True;
  ActMedia := FileToCreate.Caption;
  MI2Next.Enabled := True;
  MI2Cancel.Enabled := True;
  End Else
    Begin
    MessageDlg('Disk Image was NOT created successfully',MtError,[MBOK],0);
    Nb.ActivePage := 'MI';
    End;
end;

procedure TMediaStoreWiz.MI2NextClick(Sender: TObject);
begin
NB.ActivePage := 'Finish';
end;

procedure TMediaStoreWiz.FinishBtnClick(Sender: TObject);
begin
Close
end;

procedure TMediaStoreWiz.P1CancelClick(Sender: TObject);
begin
 if MessageDlg('Are you sure you wish to cancel ?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
  Close
  End;
end;

procedure TMediaStoreWiz.SourceChange(Sender: TObject);
begin
IF (Source.ItemIndex = -1) or (DestLbl.Caption = 'None') Then MINext.Enabled := false Else MINext.Enabled := True;
end;

procedure TMediaStoreWiz.CDImgClick(Sender: TObject);
begin
IF CDImg.Checked = True Then
If FlopImg.Checked = true THen FlopImg.Checked := False;
If (CDImg.Checked = True) or (FlopImg.Checked = True) Then P1Next.Enabled := True Else P1Next.Enabled := false;
end;

procedure TMediaStoreWiz.FlopImgClick(Sender: TObject);
begin
IF FlopImg.Checked = True Then
If CDImg.Checked = true THen CdImg.Checked := False;
If (CDImg.Checked = True) or (FlopImg.Checked = True) Then P1Next.Enabled := True Else P1Next.Enabled := false;
end;

Function TMediaStoreWiz.FileCopy(Const sourcefilename, targetfilename: String) : Boolean;
Var
S, T: TFileStream;
Begin
Result := True;
    Try
    S := TFileStream.Create(sourcefilename, fmOpenRead);
    Except On E:EFCreateError Do Result := False;
    End;

    try
    T := TFileStream.Create(targetfilename, fmOpenWrite or fmCreate);
    Except On E:EFCreateError Do Result := False;
    End;
If Result = True Then
   Begin
        try
        T.CopyFrom(S, S.Size);
        Except On E:EInOutError Do Result := False;
        End;
   S.Free; T.Free;
   End;
end;

procedure TMediaStoreWiz.BLBackClick(Sender: TObject);
begin
NB.ActivePage := 'P2';
end;







end.
