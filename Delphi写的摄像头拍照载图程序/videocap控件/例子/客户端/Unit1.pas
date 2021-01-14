unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls, ExtCtrls,jpeg, Animate,Zlib;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    ClientSocket1: TClientSocket;
    Timer1: TTimer;
    Button3: TButton;
    Panel1: TPanel;
    AnimatedImage1: TAnimatedImage;
    Bevel1: TBevel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
Form1: TForm1;
c:longint;
m:tmemorystream;
ff:boolean;
implementation
uses Unit3;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
try
clientsocket1.Close;
clientsocket1.Host:=edit1.text;
clientsocket1.Open; //连接服务端
except
showmessage(edit1.text+#13#10+'未开机或未安装服务程序');
end;
//Timer1.Enabled:=true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
//clientsocket1.Socket.SendText('gets');
//clientsocket1.Socket.SendText('gets'); //发送申请，通知服务端需要屏幕图象
Timer1.Enabled:=true;
//clientsocket1.Socket.SendText('gets'); //发送申请，通知服务端需要屏幕图象
end;

procedure TForm1.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
caption:='连接到'+edit1.text;
end;

procedure TForm1.ClientSocket1Error(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
caption:='连接'+edit1.text+'失败';
showmessage(edit1.text+#13#10+'未开机或未安装服务程序');
errorcode:=0;
end;

procedure TForm1.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
var
buffer:array [0..20000] of byte; //设置接收缓冲区
len:integer;
ll:string;
b:tbitmap;
j:tjpegimage;
begin
try
if c=0 then //C为服务端发送的字节数，如果为0表示为尚未开始图象接收
begin
ff:=false;
ll:=socket.ReceiveText;
c:=strtoint(ll); //设置需接收的字节数
clientsocket1.Socket.SendText('okok'); //通知服务端开始发送图象
end else
begin //以下为图象数据接收部分
len:=socket.ReceiveLength; //读出包长度
socket.ReceiveBuf(buffer,len); //接收数据包并读入缓冲区内
m.Write(buffer,len); //追加入流M中
if m.Size>=c then //如果流长度大于需接收的字节数，则接收完毕
begin
ff:=true;
m.Position:=0;
b:=tbitmap.Create;
j:=tjpegimage.Create;
try
j.LoadFromStream(m); //将流M中的数据读至JPG图像对象J中
b.Assign(j); //将JPG转为BMP
//Image1.Picture.Bitmap.Assign(b); //分配给image1元件
//Image1.Picture.Bitmap:=b;
AnimatedImage1.Glyph.Assign(b);
finally //以下为清除工作
b.free;
j.free;
//clientsocket1.Socket.SendText('gets');
clientsocket1.Active:=false;
clientsocket1.Active:=true;
m.Clear;
c:=0;
end;
end;
end;
except
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
m:=tmemorystream.Create;
Button1.Click;
ff:=true;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
m.free;
ClientSocket1.Close;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
if ff then
begin
if RadioButton1.Checked then
clientsocket1.Socket.SendText('gets') else
clientsocket1.Socket.SendText('gets1');
end;
 //发送申请，通知服务端需要屏幕图象
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
Timer1.Enabled:=false;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
Timer1.Enabled:=false;
//stopThread;
end;



end.
