unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons,Winsock,ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    edtPort: TEdit;
    SaveDialog1: TSaveDialog;
    btnListen: TBitBtn;
    btnRecv: TBitBtn;
    btnstop: TBitBtn;
    btnExit: TBitBtn;
    StatusBar1: TStatusBar;
    procedure btnExitClick(Sender: TObject);
    procedure btnstopClick(Sender: TObject);
    procedure btnRecvClick(Sender: TObject);
    procedure btnListenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    stopTrans:boolean;
    InTrans:boolean;
    server:TSocket;
    procedure RecvFile(filename:string);
  end;

var
  Form1: TForm1;
  const BlockLen=1024*4;

implementation

{$R *.dfm}

procedure TForm1.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.btnstopClick(Sender: TObject);
begin
  stoptrans:=true;
  if server<>INVALID_SOCKET then closesocket(server);
  server:=INVALID_SOCKET;
  btnstop.Enabled:=false;
  btnListen.Enabled:=true;
end;

procedure TForm1.btnRecvClick(Sender: TObject);
begin
  if (server=INVALID_SOCKET)then
  begin
  messagebox(handle,'have no listening','info',MB_OK);
  end;
  if savedialog1.Execute then
  recvfile(savedialog1.FileName);
end;

procedure TForm1.btnListenClick(Sender: TObject);
var
  ca:SOCKADDR_IN;
begin
    server:=socket(PF_INET,SOCK_sTREAM,IPPROTO_IP);
    if server=INVALID_SOCKET then
    begin
    statusbar1.SimpleText:='connection error!';
    exit;
    end;
    ca.sin_family:=PF_INET;
    ca.sin_port:=htons(strtoint(trim(edtport.Text)));
    ca.sin_addr.S_addr:=INADDR_ANY;
    if bind(server,ca,sizeof(ca))=SOCKET_ERROR then
    begin
    statusbar1.SimpleText:='binding error,please change other port';
    closesocket(server);
    end
    else
    statusbar1.SimpleText:='binding succeed';
    listen(Server,5);
    btnListen.Enabled:=false;
    btnstop.Enabled:=true;
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
begin
      if Intrans then
    if MessageBox(Handle,'正在传输文件，停止吗？','提示',MB_YESNO)=IDNO then
    abort;
    if Server<>INVALID_SOCKET then
      closesocket(server);
    if WSACleanup<>0 then
    MessageBox(Handle,'清除WinSock动态连接库错误','提示',MB_OK)
    else
     MessageBox(Handle,'清除WinSock动态连接库成功','提示',MB_OK);
end;

procedure TForm1.RecvFile(filename:string);
var
Ftrans:file of byte;
Recelen:integer;
BlockBuf:array[0..BlockLen-1] of Byte;
RecvSocket:TSocket;
ra:SOCKADDR_IN;
ra_len:integer;
begin
   ra_len:=sizeof(ra);
   RecvSocket:=accept(server,@ra,@ra_len);
   AssignFile(Ftrans,filename);
   ReWrite(Ftrans);
   StopTrans:=false;
   Intrans:=true;
   Recelen:=recv(RecvSocket,BlockBuf,BlockLen,0);
   while (Recelen>0)and (not StopTrans) do
   begin
    BlockWrite(Ftrans,BlockBuf[0],Recelen);
    Application.ProcessMessages;
    Recelen:=recv(RecvSocket,BlockBuf,BlockLen,0);
    if StopTrans then
      begin
      closefile(Ftrans);
      closesocket(RecvSocket);
      InTrans:=false;
      MessageBox(handle,'stop transmission','info',MB_OK);
      exit;
      end;
    end;
    closefile(FTRans);
    closesocket(RecvSocket);
    InTrans:=false;
    if (Recelen=SOCKET_ERROR) then
    messagebox(handle,'trans error','info',MB_OK)
    else
    Messagebox(handle,'custom shut down,trans complete','info',MB_OK);




end;
end.
