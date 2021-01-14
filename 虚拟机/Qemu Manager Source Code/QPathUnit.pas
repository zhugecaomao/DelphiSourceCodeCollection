unit QPathUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls,FileCtrl,ShellAPI, ExtCtrls, TntDialogs;

type
  TSelQPath = class(TForm)
    GroupBox1: TGroupBox;
    Caption: TLabel;
    Button1: TButton;
    Button2: TButton;
    QPath: TEdit;
    SpeedButton1: TSpeedButton;
    ODDisk: TOpenDialog;
    ODMedia: TOpenDialog;
    NewBtn: TButton;
    Imp: TButton;
    PDisk: TButton;
    qm: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure NewBtnClick(Sender: TObject);
    procedure PDiskClick(Sender: TObject);
    procedure ImpClick(Sender: TObject);
    procedure qmClick(Sender: TObject);
  private
    { Private declarations }
  public
    function ExtractLongPathName(const PathName: string): string;

    { Public declarations }
  end;

var
  SelQPath: TSelQPath;

implementation
Uses MainUnit, NewDiskUnit, SelPhysicalUnit, MediaWizardUnit, SelQPathUnit;

{$R *.dfm}

procedure TSelQPath.SpeedButton1Click(Sender: TObject);
var
Dir : string;
S : String;
begin
If SelType = 0 Then
if SelectDirectory('Select a directory', QPath.Text, Dir) then QPath.Text := Dir;
If SelType = 1 Then
  Begin
  ODDisk.InitialDir := SysPath+'\Images';
  If ODDisk.Execute = True Then
    Begin
    If Uppercase(ExtractFileDir(ODDisk.Filename)) = Uppercase(ExtractLongPathName(Syspath+'\IMAGES')) Then QPath.Text := ExtractFileName(ODDisk.Filename) Else Qpath.Text := ODDisk.FileName;
    End;
  End;

If SelType = 2 Then
  Begin
  ODMedia.InitialDir := SysPath+'\Media';
  If ODMedia.Execute = True Then
    Begin
    If Uppercase(ExtractFileDir(ODMedia.Filename)) = Uppercase(ExtractLongPathName(Syspath+'\Media')) Then QPath.Text := ExtractFileName(ODMedia.Filename) Else Qpath.Text := ODMedia.FileName;
    End;
  End;

End;



function TSelQPath.ExtractLongPathName(const PathName: string): string;
var
LastSlash, PathPtr: PChar;
function ExtractLongFileName(const FileName: string): string;
var
Info: TSHFileInfo;
begin
if SHGetFileInfo(PChar(FileName), 0, Info, Sizeof(Info), SHGFI_DISPLAYNAME) <> 0 then Result := string(Info.szDisplayName)
else Result := FileName;
end;

begin
Result := '';
PathPtr := PChar(PathName);
LastSlash := StrRScan(PathPtr, '\');
while LastSlash <> nil do
  begin
  Result := '\' + ExtractLongFileName(PathPtr) + Result;
  if LastSlash <> nil then
    begin
    LastSlash^ := #0;
    LastSlash := StrRScan(PathPtr, '\');
    end;
  end;
Result := PathPtr + Result;
end;







procedure TSelQPath.NewBtnClick(Sender: TObject);
begin
With NewDisk Do
  Begin
  SE.Value := 10000;
  DType.ItemIndex := 1;
  ShowModal;
  If ModalResult = MROK Then
    Begin
    QPath.Text := Main.CreateDisk(DType.Text,SE.Value,'');
    End;
  end;
End;

procedure TSelQPath.PDiskClick(Sender: TObject);
var
hDevice : THandle;
I : Integer;
begin
With Physical Do
  begin
  Drives.Clear;
  For I := 0 to 255 Do
    Begin
    hDevice := CreateFile(PChar('\\.\PhysicalDrive'+IntToStr(i)),GENERIC_READ or GENERIC_WRITE,FILE_SHARE_READ or FILE_SHARE_WRITE,nil, OPEN_EXISTING,0,0);
    if hDevice=INVALID_HANDLE_VALUE then Begin End Else
      Begin
      If I = 0 Then Drives.Items.Add('Disk '+IntToStr(i)+' (System Drive (CAUTION))') Else
      Drives.Items.Add('Disk '+IntToStr(i));
      CloseHandle(hdevice);
      End;
    End;
    ShowModal;
    If ModalResult = MROK Then
      Begin
      QPath.Text := '\\.\PhysicalDrive'+IntToStr(Drives.ItemIndex);
      End;
    end;
  End;
procedure TSelQPath.ImpClick(Sender: TObject);
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
  If ActMedia > '' Then QPath.text := actMedia;
  end;

end;

procedure TSelQPath.qmClick(Sender: TObject);
begin
With SelQ Do
  Begin
  ShowModal;
  If ModalResult = MROK Then
    Begin
    qpath.Text := '{QM}\qemu\'+TV.Selected.Text;
    End;
  end;
End;

end.

