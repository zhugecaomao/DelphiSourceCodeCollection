unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ScktComp, StdCtrls,ToolWin, Comctrls,Buttons,shellapi,jpeg,Imglist;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    btnConnect: TButton;
    btnSnap: TButton;
    btnDisconnect: TButton;
    btnClose: TButton;
    ClientSocket1: TClientSocket;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConnectClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure btnSnapClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocket1Connecting(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
const bufsize=2048;
var
stream:Tmemorystream;
jpegscreen:Tjpegimage;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
stream:=Tmemorystream.create;
jpegscreen:=Tjpegimage.Create;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Clientsocket1.active:=false;
stream.Free;
jpegscreen.Free;
end;

procedure TForm1.btnConnectClick(Sender: TObject);
var
remotehost: string;
begin
remotehost:=inputbox('建立连接','请输入对方IP或名称：','') ;
if trim(remotehost)<>'' then
begin
if clientsocket1.active then clientsocket1.Active:=false;
clientsocket1.port:=1234;
clientsocket1.Host:=remotehost;
try
clientsocket1.active:=true;
except
raise exception.Create('连接失败！');
end;
end;
end;

procedure TForm1.btnDisconnectClick(Sender: TObject);
begin
  clientsocket1.active:=false;
  stream.Clear ;
end;

procedure TForm1.btnSnapClick(Sender: TObject);
begin
stream.Clear;
if not clientsocket1.active then
raise Exception.Create('please connect first');
clientsocket1.socket.sendText('show');
end;

procedure TForm1.btnCloseClick(Sender: TObject);
begin
clientsocket1.Active:=false;
close;
end;

procedure TForm1.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
var
  buf:array[0..bufsize-1] of char;
  numberbytes:integer;
begin
   numberbytes:=socket.ReceiveLength;
   socket.ReceiveBuf(buf,numberbytes) ;
   stream.Write(buf,numberbytes);
   if numberbytes=bufsize then
   socket.SendText('show')
   else
    begin
      try
        stream.Position:=0;
        jpegscreen.LoadFromStream(stream);
        image1.picture.bitmap.assign(jpegscreen);
        except
        stream.Clear;
        end;
        end;

end;

procedure TForm1.ClientSocket1Connecting(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  showmessage('connection succeed');
end;

procedure TForm1.ClientSocket1Error(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
    stream.Clear;
end;

end.
