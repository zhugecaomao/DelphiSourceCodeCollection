unit FtpSetupUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,IniFiles,
  TntComCtrls, TntDBGrids, TntStdCtrls, TntMenus, TntDialogs,TntForms,
  TntButtons;
type
  TFTPSetup = class(TTNTForm)
    GroupBox3: TTntGroupBox;
    Label6: TTNTLabel;
    SpeedButton2: TTNTSpeedButton;
    Label7: TTNTLabel;
    Full: TTNTCheckBox;
    Justfol: TTNTCheckBox;
    SharePath: TTNTEdit;
    AList: TTNTEdit;
    Button1: TTNTButton;
    Button2: TTNTButton;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    TntLabel3: TTntLabel;
    TntLabel4: TTntLabel;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure JustfolClick(Sender: TObject);
    procedure FullClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTPSetup: TFTPSetup;

implementation
Uses MainUnit, GetDirUnit;

{$R *.DFM}

procedure TFTPSetup.FormShow(Sender: TObject);
begin

IF FTALL = '1' Then
  Begin
  Full.Checked := True;
  JustFol.Checked := False;
  End
Else
  Begin
  Full.Checked := False;
  JustFol.Checked := False;
  End;
If FTPPath = '' Then
  Begin
  SharePath.Text := '';
  End
Else
  Begin
  SharePath.Text := FTPPath;
  End;
If FTEnable = '1' Then JustFol.Checked := True Else JustFol.Checked := False;
IF AllowList = '' Then AList.Text := '' Else AList.Text := AllowList;

end;

procedure TFTPSetup.Button1Click(Sender: TObject);
var
QIni : TIniFile;
begin
If (JustFol.Checked = True) and (SharePath.Text = '') then MessageDlg('Please select a path to share',MTError,[MBOK],0) Else
   Begin
   QINI := TINIFile.Create(SysPath+'\qman.ini');
   With QIni DO
      Begin
      If Full.Checked = True Then WriteString('FileTransfer','Share All','1') Else WriteString('FileTransfer','Share All','0');
      If JustFol.Checked = True Then Begin WriteString('FileTransfer','Share Dir',SharePath.Text); WriteString('FileTransfer','Enable Folder','1') End Else Begin WriteString('FileTransfer','Share Path',''); WriteString('FileTransfer','Enable Folder','0'); End;
      If AList.Text = '' Then WriteString('FileTransfer','Allow','') Else WriteString('FileTransfer','Allow',AList.Text);
      If Full.Checked = True Then FTALL := '1' Else FTAll := '0';
      FTPPath := SharePath.Text;
      AllowList := AList.Text;
      If JustFol.Checked = True Then FTEnable := '1' Else FTEnable := '0';
      End;
    QIni.Free;
    End;
   Close
end;

procedure TFTPSetup.JustfolClick(Sender: TObject);
begin
If Full.Checked = True then JustFol.Checked := False;
end;

procedure TFTPSetup.FullClick(Sender: TObject);
begin
If JustFol.Checked = True then Full.Checked := False;
end;

procedure TFTPSetup.Button2Click(Sender: TObject);
begin
Close
end;

procedure TFTPSetup.SpeedButton2Click(Sender: TObject);
begin
GetShellDirectory := '';
SelDir.ShowModal;
If GetShellDirectory > '' Then
  Begin
  SharePath.Text :=  GetShellDirectory;
  End;
end;

end.
