unit BSecurityUnit;
{BY MooHyu devh.net at 2007
123bd123@163.com QQ 360888822}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dcInternal, dcFileInfo, LxpDraggingFilesMonitor, StdCtrls,
  Menus, ExtCtrls, dcEdits, ComCtrls, XPMan, BCore, StringsUnit,
  dcBrowseDialog, dcStdDialogs, FileCtrl, ConfigCreate,
  ZnMD5,BLibrary;

type
  TForm1 = class(TForm)
    FilesMonitor1: TlxpDraggingFilesMonitor;
    FileInfo: TdcFileInfo;
    FileEdit: TdcFileEdit;
    Panel1: TPanel;
    MainMenu: TMainMenu;
    N1: TMenuItem;
    Panel2: TPanel;
    Info: TLabel;
    Img: TImage;
    Shape1: TShape;
    FilesMonitor2: TlxpDraggingFilesMonitor;
    Panel4: TPanel;
    PWEdit: TLabeledEdit;
    EBtn: TButton;
    Dbtn: TButton;
    XPManifest1: TXPManifest;
    FileListBox: TFileListBox;
    SaveDlg: TdcSaveDialog;
    BrowseDlg: TdcBrowseDialog;
    Panel3: TPanel;
    DelCheck: TCheckBox;
    N2: TMenuItem;
    C1: TMenuItem;
    A1: TMenuItem;
    SHELL1: TMenuItem;
    ShellI1: TMenuItem;
    P: TPanel;
    Panel5: TPanel;
    CBox: TCheckBox;
    FilesMonitor: TlxpDraggingFilesMonitor;
    DiskName: TLabel;
    DiSKIDName: TLabel;
    MD5: TznMD5;
    K_MD5: TznMD5;
    procedure FormCreate(Sender: TObject);
    procedure FilesMonitor1DropFiles(Receiver: TWinControl;
      const FileNames: TStrings; const FilesCount: Integer;
      const DropPoint: TPoint);
    procedure FilesMonitor2DropFiles(Receiver: TWinControl;
      const FileNames: TStrings; const FilesCount: Integer;
      const DropPoint: TPoint);
    procedure FileEditDlgOk(Sender: TObject);
    procedure EBtnClick(Sender: TObject);
    procedure DbtnClick(Sender: TObject);
    Procedure Enabled;
    Procedure FileM(FileName:String);
    procedure A1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure ShellI1Click(Sender: TObject);
    procedure FilesMonitorDropFiles(Receiver: TWinControl;
      const FileNames: TStrings; const FilesCount: Integer;
      const DropPoint: TPoint);
    procedure MD5End(const nNormal: Boolean; const nMD5String: String);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  Form1: TForm1;
  DiskMd5:string;
implementation
{$R *.dfm}
Procedure TForm1.Enabled;
begin
  Ebtn.Enabled:=true;
  Dbtn.Enabled:=true;
  DelCheck.Enabled:=true;
  pwedit.Enabled:=true;
  CBOX.Enabled:=true;
end;
Procedure TForm1.FileM;
begin
 if FileExists(FileName) then begin
   FileEdit.Text:=FileName;
   FileInfo.FILENAME:=FileEdit.Text;
   Info.Caption:= '文件类型 '+FileInfo.FileType+ #13 +
                  '文件长度 '+IntToStr(FileInfo.FileSize div 1000)+' KB' + #13 +
                  '创建时间 '+DateToStr(FileInfo.TimeCreated)+' '+
                  TimeToStr(FileInfo.TimeCreated);
   Img.Picture.Icon:=FileInfo.LargeIcon;
   Enabled;
   if UpperCase(ExtractFileExt(FileName))='.BSE'
   then begin
   EBtn.Enabled:=False;
   CBox.Enabled:=False;
   p.Caption:='选定已经构建的档案，构建选项及按钮自动禁用!';
   end else
   begin
   Dbtn.Enabled:=false;
   p.Caption:='选定非档案文件，释放档案选项及按钮自动禁用!';
   end;
   end;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
   If (FileExists(ExtractFilePath(Application.ExeName)+CoreName))=False
   then begin
   ShowBox('找不到启动BSE必须的 '+CoreName+' 文件，程序终止!','找不到文件!');
   Application.Terminate;
   end;
   Form1.Caption:=Form1.Caption+Versoin;
   if ParamCount>0 then  {有参数时}
    FileM(ParamStr(1))
   else    {无参数时} Info.Caption:= s1 + Versoin + #13 + s2 + #13 + s3;
   if GetIdeSerialNumber<>'' then
   begin
   DiSKIDName.Caption:=GetIdeSerialNumber;
   MD5.SourceStr:=StrPas(GetIdeSerialNumber);
   Md5.MD5_String;             {等待MD5运算结束  }
   end else
   begin
   DiSKIDName.Caption:='不支持本机硬盘，获取失败。';
   CBox.Enabled:=False;
   end;
end;


procedure TForm1.FilesMonitor1DropFiles(Receiver: TWinControl;
  const FileNames: TStrings; const FilesCount: Integer;
  const DropPoint: TPoint);
begin
{拖入监视器1}
   FileM(FileNames[0]);
end;

procedure TForm1.FilesMonitor2DropFiles(Receiver: TWinControl;
  const FileNames: TStrings; const FilesCount: Integer;
  const DropPoint: TPoint);
begin
{拖入监视器2}
  FileM(FileNames[0]);
end;

procedure TForm1.FileEditDlgOk(Sender: TObject);
begin
{打开文件}
  if FileExists(FileEdit.Text)
  then
  begin
    FileInfo.FILENAME:=FileEdit.Text;
    Info.Caption:='文件类型 '+FileInfo.FileType+ #13 +
                  '文件长度 '+IntToStr(FileInfo.FileSize div 1000)+' KB' + #13 +
                  '创建时间 '+DateToStr(FileInfo.TimeCreated)+' '+
                  TimeToStr(FileInfo.TimeCreated);

    Img.Picture.Icon:=FileInfo.LargeIcon;
    Enabled;
  end;
end;

procedure TForm1.EBtnClick(Sender: TObject);
Var
  DPW:String;
begin
{加密}
  DPW:='';
  if (pwedit.Text<>'')and(FileExists(FileEdit.Text))and(SaveDlg.Execute) then
  begin
  p.Caption:='工作中……'+FileEdit.Text;
  if CBOX.Checked then DPW:=DiSKIDName.Caption;
  if Encrypt(FileEdit.Text,UpperCase(pwedit.Text),DPW,SaveDlg.FileName) Then
  begin
  if DelCheck.Checked then
  deletefile(FileEdit.Text);
  p.Caption:='已完成! ^_^';
  end else p.Caption:='发生错误，没有完成任务~';
  end;
end;

procedure TForm1.DbtnClick(Sender: TObject);
var
  DPW:String;
begin
{解密}
  DPW:='';
  DPW:=DiSKIDName.Caption;
  if (pwedit.Text<>'')and(FileExists(FileEdit.Text))and(BrowseDlg.Execute) then
  begin
  p.Caption:='工作中……'+FileEdit.Text;
  if Decrypt(FileEdit.Text,UpperCase(pwedit.Text),DPW,BrowseDlg.Folder) then
  begin
  if DelCheck.Checked then
  deletefile(FileEdit.Text);
  p.Caption:='已完成! ^_^';
  end else p.Caption:='发生错误，没有完成任务~';
  end;
end;

procedure TForm1.A1Click(Sender: TObject);
 var
  S: string;
begin
  S := 'BinJian Security Experts (BSE)                                      ' + #13 + #13 +
    '俺滴博客' + #13 +
    '    http://www.cnare.cn/' + #13 +
    '    http://www.cnare.com.cn/' + #13 +  #13 +
    '电子邮箱' + #13 +
    '    123bd123@163.com'+ #13 +
    '    188959995@qq.com'+ #13 + #13 +
    'Copyright (c) 1998-2001 Eldos,Alexander Ionov.' + #13 + #13 +
    'Copyright (c) 2007-2046 BinJian & cnare.cn' + #13 + #13 +
    'UpDate 2007.6.29 8.47 by BinJian (王臻)' ;
  MessageBox(Handle, PChar(S),Pchar('关于 BinJian Security Experts (BSE) '), MB_ICONINFORMATION);
end;

procedure TForm1.C1Click(Sender: TObject);
begin
  Close;
end;
Function GetWinDir:String;        {取得 Windows/System32 系统路径}
var
  Buf:array[0..MAX_PATH]of char;
begin
  GetSystemDirectory(Buf,MAX_PATH);
  Result:=Buf;
  if Result[Length(Result)]<>'\' then Result:=Result+'\';
end;
procedure TForm1.ShellI1Click(Sender: TObject);
begin
{关联}
 If FileExists(GetWinDir+'BSE.exe')=false then
  if Messagebox(0,pchar('.BSE 扩展名尚未关联，是否立即关联?'),pchar('提示!'),MB_YESNO+MB_DEFBUTTON1+MB_APPLMODAL+MB_ICONWARNING)=6
  then begin
    deletefile(Pchar(GetWinDir+'BSE.exe'));
    CopyFile(Pchar(Application.ExeName),Pchar(GetWinDir+'BSE.exe'),false);
    CopyFile(Pchar(ExtractFilePath(Application.ExeName)+CoreName),Pchar(GetWinDir+CoreName),false);
    Rshell('.BSE',GetWinDir+'BSE.exe');
  end else else Messagebox(0,pchar('.BSE 扩展名已经关联!'),pchar('提示!'),MB_OK+MB_DEFBUTTON1+MB_APPLMODAL+MB_ICONWARNING);
end;

procedure TForm1.FilesMonitorDropFiles(Receiver: TWinControl;
  const FileNames: TStrings; const FilesCount: Integer;
  const DropPoint: TPoint);
begin
{拖入监视器3}
   FileM(FileNames[0]);
end;



procedure TForm1.MD5End(const nNormal: Boolean; const nMD5String: String);
begin
  DiskMd5:=UpperCase(Md5.GetMD5String);
  DiSKIDName.Caption:=DiskMd5;
end;

end.
