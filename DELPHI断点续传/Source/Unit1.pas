unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, IdFTP, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IdHTTPHeaderInfo, ExtCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    ProgressBar1: TProgressBar;
    Button2: TButton;
    IdHTTP1: TIdHTTP;
    IdFTP1: TIdFTP;
    Button3: TButton;
    ComboBox1: TComboBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure IdHTTP1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdHTTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdHTTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure IdHTTP1Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure Button3Click(Sender: TObject);
  private
    AbortTransfer: Boolean; //是否中断
    BytesToTransfer: LongWord; //下载总大小
    procedure FtpDownLoad(aURL, aFile: string; bResume: Boolean);
    procedure HttpDownLoad(aURL, aFile: string; bResume: Boolean);
    procedure MyDownLoad(aURL, aFile: string; bResume: Boolean);
    function GetProt(aURL: string): Byte;
    function GetURLFileName(aURL: string): string;
    procedure GetFTPParams(aURL: string; var sName, sPass, sHost, sPort,
      sDir: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

var
  AverageSpeed: Double = 0;

implementation

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
begin
  AbortTransfer := True;
end;

function TForm1.GetProt(aURL: string): Byte;
begin //检测下载的地址是http还是ftp
  Result := 0;
  if Pos('http', LowerCase(aURL)) = 1 then
    Result := 1; //http协议
  if Pos('ftp', LowerCase(aURL)) = 1 then
    Result := 2; //ftp协议
end;

function TForm1.GetURLFileName(aURL: string): string;
var
  i: integer;
  s: string;
begin //返回下载地址的文件名
  s := aURL;
  i := Pos('/', s);
  while i <> 0 do //去掉"/"前面的内容剩下的就是文件名了
  begin
    Delete(s, 1, i);
    i := Pos('/', s);
  end;
  Result := s;
end;

procedure TForm1.GetFTPParams(aURL: string; var sName, sPass, sHost, sPort, sDir: string);
var
  i, j: integer;
  s, tmp: string;
begin //分析ftp地址的登陆用户名，密码和目录
  s := aURL;
  if Pos('ftp://', LowerCase(s)) <> 0 then //去掉ftp头
    Delete(s, 1, 6);
  i := Pos('@', s);
  if i <> 0 then //地址含用户名，也可能含密码
  begin
    tmp := Copy(s, 1, i - 1);
    s := copy(s, i+1, Length(s));
    j := Pos(':', tmp);
    if j <> 0 then //包含密码
    begin
      sName := Copy(tmp, 1, j - 1); //得到用户名
      sPass := Copy(tmp, j + 1, i - j - 1); //得到密码
    end else
    begin
      sName := tmp;
      sPass := Inputbox('输入框','请输入登陆ftp密码','');
    end;
  end else //匿名用户
  begin
    sName := 'anonymous';
    sPass := 'test@ftp.com';
  end;
  i := Pos(':', s);
  j := Pos('/', s);
  sHost := Copy(s, 1, j - 1); //主机
  if i <> 0 then //含端口
    sPort := Copy(s, i + 1, j - i - 1) else
    sPort := '21'; //默认21端口

  tmp := Copy(s, j + 1, Length(s));
  while j <> 0 do
  begin
    Delete(s, 1, j);
    j := Pos('/', s);
  end; //目录
  sDir := '/' + Copy(tmp, 1, Length(tmp) - Length(s) - 1);
end;

procedure TForm1.FtpDownLoad(aURL, aFile: string; bResume: Boolean);
var
  tStream: TFileStream;
  sName, sPass, sHost, sPort, sDir: string;
begin //ftp方式下载
  if FileExists(aFile) then //建立文件流
    tStream := TFileStream.Create(aFile, fmOpenWrite) else
    tStream := TFileStream.Create(aFile, fmCreate);

  GetFTPParams(aURL, sName, sPass, sHost, sPort, sDir);
  with IdFTP1 do
  try
    if Connected then Disconnect; //重新连接
    Username := sName;
    Password := sPass;
    Host := sHost;
    Port := StrToInt(sPort);
    Connect;
  except
    exit;
  end;

  IdFTP1.ChangeDir(sDir); //改变目录
  BytesToTransfer := IdFTP1.Size(aFile);
  try
    if bResume then //续传
    begin
      tStream.Position := tStream.Size;
      IdFTP1.Get(aFile, tStream, True);
    end else
    begin
      IdFTP1.Get(aFile, tStream, False);
    end;
  finally
    tStream.Free;
  end;
end;

procedure TForm1.HttpDownLoad(aURL, aFile: string; bResume: Boolean);
var
  tStream: TFileStream;
begin //Http方式下载
  if FileExists(aFile) then //如果文件已经存在
    tStream := TFileStream.Create(aFile, fmOpenWrite) else
    tStream := TFileStream.Create(aFile, fmCreate);

  if bResume then //续传方式
  begin
    IdHTTP1.Request.ContentRangeStart := tStream.Size - 1;
    tStream.Position := tStream.Size - 1; //移动到最后继续下载
    IdHTTP1.Head(aURL);
    IdHTTP1.Request.ContentRangeEnd := IdHTTP1.Response.ContentLength;
  end else //覆盖或新建方式
  begin
    IdHTTP1.Request.ContentRangeStart := 0;
  end;

  try
    IdHTTP1.Get(aURL, tStream); //开始下载
  finally
    tStream.Free;
  end;
end;

procedure TForm1.MyDownLoad(aURL, aFile: string; bResume: Boolean);
begin
  case GetProt(aURL) of
    0: ShowMessage('不可识别的地址！');
    1: HttpDownLoad(aURL, aFile, bResume);
    2: FtpDownLoad(aURL, aFile, bResume);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  aURL, aFile: string;
begin
  aURL := ComboBox1.Text; //下载地址，例如"http://www.2ccc.com/update/demo.exe"
  aFile := GetURLFileName(aURL); //得到文件名，例如"demo.exe"
  if FileExists(aFile) then
  begin
    case MessageDlg('文件已经存在，是否续传？', mtConfirmation, mbYesNoCancel, 0) of
      mrYes: MyDownLoad(aURL, aFile, True); //续传
      mrNo: MyDownLoad(aURL, aFile, False); //覆盖
      mrCancel: Exit; //取消
    end;
  end else MyDownLoad(aURL, aFile, False); //建立新文件下载
end;

procedure TForm1.IdHTTP1Work(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
  if AbortTransfer then
  begin //中断下载
    IdHTTP1.Disconnect;
    IdFTP1.Abort;
  end;
  ProgressBar1.Position := AWorkCount;
  Application.ProcessMessages;
end;

procedure TForm1.IdHTTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCountMax: Integer);
begin
  AbortTransfer := False;
  if AWorkCountMax > 0 then
    ProgressBar1.Max := AWorkCountMax else
    ProgressBar1.Max := BytesToTransfer;
end;

procedure TForm1.IdHTTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  ProgressBar1.Position := 0;
end;

procedure TForm1.IdHTTP1Status(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: string);
begin
  ListBox1.ItemIndex := ListBox1.Items.Add(AStatusText);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Close;
end;

end.

