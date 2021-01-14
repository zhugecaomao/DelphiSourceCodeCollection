unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons,Winsock,ExtCtrls;

type
  TForm1 = class(TForm)
    ProgressBar1: TProgressBar;
    edtIP: TEdit;
    edtport: TEdit;
    BtnConnect: TBitBtn;
    BtnSend: TBitBtn;
    BtnStop: TBitBtn;
    BtnExit: TBitBtn;
    StatusBar1: TStatusBar;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    Label2: TLabel;
    procedure BtnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSendClick(Sender: TObject);
    procedure BtnStopClick(Sender: TObject);
    procedure BtnConnectClick(Sender: TObject);
  private
  client:TSocket;
    { Private declarations }
  public
    { Public declarations }
    StopTrans:boolean;
    InTrans:boolean;
    procedure TransFile(filename:string);
  end;

  const BlockLen=1024*4;
var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtnExitClick(Sender: TObject);
begin
 close;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  aWSAData:TWSAData;
begin
   if WSAStartup($0101,aWSAData)<>0 then
   raise Exception.Create('不能启动WinSock动态链接库！');
   MessageBox(Handle,aWSAData.szDesCription,'WinSock动态链接库版本',MB_OK);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var tim:Tdatetime;
begin
    if Intrans then
    if MessageBox(Handle,'正在传输文件，停止吗？','提示',MB_YESNO)=IDNO then
    abort;
    if WSACleanup<>0 then
    MessageBox(Handle,'清除WinSock动态连接库错误','提示',MB_OK)
    else
     MessageBox(Handle,'清除WinSock动态连接库成功','提示',MB_OK);
     closesocket(client);
end;

procedure TForm1.BtnSendClick(Sender: TObject);
begin
if (OpenDialog1.Execute)and (fileExists(OpenDialog1.FileName)) then
transfile(OpenDialog1.filename);
end;

procedure TForm1.BtnStopClick(Sender: TObject);
begin
  stopTrans:=true;
end;

procedure TForm1.BtnConnectClick(Sender: TObject);
var
  ca:SOCKADDR_IN;
  hostaddr:u_long;
begin
   client:=socket(PF_INET,SOCK_STREAM,IPPROTO_IP);
   IF Client=INVALID_SOCKET  then
   begin
    StatusBar1.simpleText:='创建socket错误！';
    exit;
    end;
    ca.sin_family:=PF_INET;
    ca.sin_port:= htons(StrToInt(Trim(edtport.Text)));
    hostaddr:=inet_addr(pchar(trim(edtIP.Text)));
    if (hostaddr=-1)then
    begin
    statusbar1.SimpleText:='host ip:'+trim(edtIP.Text)+'error';
    exit;
    end
    else
      ca.sin_addr.S_addr:=hostaddr;
      if connect(client,ca,sizeof(ca))<>0 then
      begin
      statusbar1.SimpleText:='connect socket error!';
      exit;
      end
      else
      statusbar1.SimpleText:='connection  succeed!'
end;

procedure TForm1.TransFile(filename:string);
var
  Ftrans:file of byte;
  Flen:integer;
  Blocknum,Remainlen:integer;
  BlockBuf:array[0..BlockLen-1] of byte;
  i:integer;
  SendLen: integer;
begin
  AssignFile(Ftrans,filename);
  Reset(Ftrans);
  Flen:= FileSize(Ftrans);
  BlockNum:=Flen div BlockLen;
  ProgressBar1.Max:=1+BlockNum;
  RemainLen:=Flen mod BlockLen;
  StopTrans:=False;
  InTrans:=True;
  SendLen:=1;
  for i:=0 to BlockNum -1 do
  begin
    if (StopTrans) or (sendLen<=0) then Break;
    BlockRead(Ftrans,BlockBuf[0],BlockLen);
    SendLen:=send(client,BlockBuf,BlockLen,0);
    Progressbar1.Position:=i;
    application.ProcessMessages;   
    end;
    if stopTrans then
     begin
     closefile(Ftrans);
     InTrans:=false;
     statusBar1.SimpleText:='';
     messagebox(handle,'stop trans','info' ,MB_OK);
     progressbar1.Position:=0;
     exit;
     end;
     if(sendLen<=0)then
     begin
     Closefile(Ftrans);
     InTrans:=false;
     statusBar1.SimpleText:='';
     messagebox(handle,'exception stop trans ','info' ,MB_OK);
     progressbar1.Position:=0;
     exit;
     end;
     if RemainLen>0 then
     begin
     BlockRead(Ftrans,BlockBuf[0],RemainLen);
     SendLen:=send(client,BlockBuf,RemainLen,0);
     if (SendLen<=0) then
     begin
     closefile(Ftrans);
     InTrans:=false;
     statusbar1.SimpleText:='';
     messagebox(handle,'exception stop trans ','info' ,MB_OK);
     progressbar1.Position:=0;
     exit;
     end;
     end;
    progressbar1.Position:=progressbar1.Max;
    closefile(Ftrans);
    Intrans:=false;
    statusbar1.SimpleText:='';
    messagebox(handle,'trans complete! ','info' ,MB_OK);
    progressbar1.Position:=0;
  end;

    
end.
                                      .