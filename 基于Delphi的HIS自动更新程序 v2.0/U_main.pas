unit U_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, IdBaseComponent, IdComponent , ImgList, ComCtrls, Gauges, StdCtrls,inifiles,
  IdTCPConnection, IdTCPClient, IdFTP,idftplist, RzPrgres,Shellapi;

type
  TFrmain = class(TForm)
    Image1: TImage;
    ImageList: TImageList;
    Timer1: TTimer;
    ftp1: TIdFTP;
    Label3: TLabel;
    ListView_files: TListView;
    Label4: TLabel;
    jd: TRzProgressBar;
    lbcp: TLabel;
    sd1: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure getfilelist;
    procedure ftpfinish;
    procedure getaddlist(filname:string;mddate:TDateTime);
    procedure getDirectory;
    procedure ftp1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure ftp1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure ftp1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
   myini:Tinifile;
   fh:string;
   login_server:string; //服务器地址
   login_user:string; //用户
   login_pass:string; //密码
   login_port:string;//端口

    subfile:Tstringlist;
    STime: TDateTime;
   subini:Tinifile;
     AverageSpeed: Double;
    { Private declarations }
  public
  BytesToTransfer,ttl: LongWord;
    TransferrignData:Boolean;
    tsfile,g_path:string; //主程序路径
    subpath:string;
    { Public declarations }
  end;
function GetFileLastWriteTime(const FileName: String): TDateTime;
var
  subsoft,nowshell:string;
  Frmain: TFrmain;

implementation
 uses uftpdown;
{$R *.dfm}

 procedure TFrmain.ftpfinish;
begin

 if fh='fh' then  begin
 try
 application.Terminate;
 except
self.close;
end;
end else begin
  fh:='fh';
  self.close;
 if (ShellExecute(handle, 'open', pchar('/'+trim(subsoft)+'/'+trim(subsoft)),pchar(nowshell),pchar('/'+trim(subsoft)),SW_SHOWMAXIMIZED)<>42) then begin
messagebox(handle,pchar('系统目录'+pchar(trim(subsoft))+'文件不存在'),'提示',mb_ok+mb_iconinformation);

 //application.Terminate;
 end;
 end;
 end;


// 取得文件修改时间
function GetFileLastWriteTime(const FileName: String): TDateTime;
var
  FileTime: TFileTime;
  LocalFileTime: TFileTime;
  hFile: THandle;
  SystemTime: TSystemTime;
begin
  Result := 0;
  FileTime.dwLowDateTime := 0;
  FileTime.dwHighDateTime := 0;
  hFile := FileOpen(FileName, fmShareDenyNone);
  try
    if hFile <> 0 then
    begin
      Windows.GetFileTime(hFile, nil, nil, @FileTime);
      FileTimeToLocalFileTime(FileTime, LocalFileTime);
      FileTime := LocalFileTime;
    end;
  finally
    FileClose(hFile);
  end;
  if FileTimeToSystemTime(FileTime, SystemTime) then
    Result := SystemTimeToDateTime(SystemTime);
end;

  procedure TFrmain.getaddlist(filname:string;mddate:TDateTime);
  var Listit:Tlistitem;
     begin
  //sHOWMESSAGE(formatdatetime('yyyy-mm-dd hh:nn:ss',mddate)+g_path+subpath+filname+formatdatetime('yyyy-mm-dd hh:nn:ss',GetFileCreationTime(g_path+subsoft+'\'+subpath+filname)));
    // showmessage(formatdatetime('yyyy-mm-dd hh:nn:ss',GetFileCreationTime(g_path+'\test\'+subsoft+'\'+ftp1.DirectoryListing.Items[filname].FileName)));
     //EXIT;
   if formatdatetime('yyyy-mm-dd hh:nn:ss',mddate)>formatdatetime('yyyy-mm-dd hh:nn:ss',GetFileLastWriteTime(g_path+subsoft+'\'+subpath+filname)) then begin

   Listit:=ListView_files.Items.Add;
  with Listit do begin
  Listit.ImageIndex:=0;
  Listit.Caption:=subpath+filname;
  Listit.SubItems.Add(formatdatetime('yyyy年mm月dd日 hh:nn:ss',mddate)) ;
  Listit.SubItems.Add('准备更新');
  end;
  end;
  end;
procedure TFrmain.FormCreate(Sender: TObject);
  var i,flno:integer;
   var Listit:Tlistitem;
begin

g_path := ExtractFilePath(application.ExeName);
 if not DirectoryExists(g_path+subsoft) then mkdir(g_path+subsoft);
ListView_files.Items.Clear;
  subini:=tinifile.Create(g_path+'HIS_UPDATE.ini');
  login_server:=subini.ReadString('HIS_UPDATE','server','168.168.1.2');
  login_user:=subini.ReadString('HIS_UPDATE','user','his');
  login_pass:=subini.ReadString('HIS_UPDATE','pass','089965');
  login_port:=subini.ReadString('HIS_UPDATE','Port','8021');
  if ftp1.Connected then ftp1.Disconnect; //重新连接
 lbcp.Caption:='正在获取更新列表';
ftp1.Host:=login_server;
ftp1.Username:=login_user;
ftp1.Password:=login_pass;
ftp1.Port := StrToInt(login_port);
subini.Free;

try
ftp1.Connect;
ftp1.Get('HIS_UPDATE.ini','HIS_UPDATE.ini',true);
subini:=tinifile.Create(g_path+'HIS_UPDATE.ini');
except
 lbcp.Caption:='与服务器连接失败..';
 exit;
 end;
flno:=subini.ReadInteger('update_soft','filenum',0);
if flno>0 then begin
for i:=1 to flno do begin
  Listit:=ListView_files.Items.Add;
  with Listit do begin
  Listit.ImageIndex:=0;
  Listit.Caption:=subini.ReadString('update_soft','files'+inttostr(i),'login') ;
  Listit.SubItems.Add(formatdatetime('yyyy年mm月dd日 hh:nn:ss',now)) ;
  Listit.SubItems.Add('准备更新');
 end;
end;
end;


try
subfile:=tstringlist.Create;
finally

subfile.Clear;
end;
getDirectory;
end;
procedure TFrmain.getDirectory;
var i:integer;
begin
ftp1.ChangeDir(subsoft);
getfilelist;
for i:=0 to subfile.Count-1 do begin
subpath:=subfile.Strings[i]+'\';
ftp1.ChangeDir('..\'+subsoft+'\'+subpath);
getfilelist;
end;
end;

procedure TFrmain.getfilelist;
var i:integer;
lsfl:tstringlist;
begin
lsfl:=tstringlist.Create;

ftp1.List(lsfl,'*.*');
 for i:=0 to lsfl.Count-1  do
 begin
if (trim(ftp1.DirectoryListing.Items[i].FileName)='.') or (trim(ftp1.DirectoryListing.Items[i].FileName)='..')  then
else begin
 if (ftp1.DirectoryListing.Items[i].ItemType=ditDirectory) then
 begin
   try
    if not DirectoryExists(g_path+subsoft+'\'+ftp1.DirectoryListing.Items[i].FileName) then mkdir(g_path+subsoft+'\'+ftp1.DirectoryListing.Items[i].FileName);
    finally

     subfile.Add(ftp1.DirectoryListing.Items[i].FileName);
     end;
 end else
 begin
 getaddlist(ftp1.DirectoryListing.Items[i].FileName,ftp1.DirectoryListing.Items[i].ModifiedDate);
 end;
 end;
  end;
  end;


procedure TFrmain.ftp1Work(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
Var
  S,jds: String;
  TotalTime: TDateTime;
  H, M, Sec, MS: Word;
  DLTime: Double;
begin

 TotalTime :=  Now - STime;
  DecodeTime(TotalTime, H, M, Sec, MS);
Sec := Sec + M * 60 + H * 3600;
 DLTime := Sec + MS / 1000;
if DLTime > 0 then
 AverageSpeed:= (AWorkCount) / DLTime;
  S := FormatFloat('0.00 KB/s', AverageSpeed);
 case AWorkMode of
 wmRead: sd1.Caption :=  S;
// wmWrite: StatusBar1.Panels[1].Text := '上传速度 ' + S;
 end;
jds:=Format('%.*f',[0,(AWorkCount/ttl)*100]);
jd.Percent:=strtoint(jds);


end;

procedure TFrmain.ftp1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCountMax: Integer);
begin
  ttl:=BytesToTransfer;
  AverageSpeed := 0;
end;

procedure TFrmain.ftp1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
 BytesToTransfer := 0;
  TransferrignData := false;

  AverageSpeed := 0;


end;

procedure TFrmain.FormShow(Sender: TObject);
begin
ftpdown.create;
end;

procedure TFrmain.Timer1Timer(Sender: TObject);
begin
if ftp1.Connected=false  then  ftpfinish;

end;

procedure TFrmain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree
end;

end.
