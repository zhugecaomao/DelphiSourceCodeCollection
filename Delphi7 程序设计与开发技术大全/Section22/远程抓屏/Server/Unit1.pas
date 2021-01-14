unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ExtCtrls,jpeg,registry,shellapi,buttons, StdCtrls, ScktComp,winsock;

type
  TForm1 = class(TForm)
    ServerSocket1: TServerSocket;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientError(Sender: TObject;
      Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer);
  private
  procedure sendscreen;
  procedure snapscreen;
    { Private declarations }
  public
    { Public declarations }
  end;

var
frmServer:Tform1;
  Form1: TForm1;

implementation
const Bufsize=2048;
var
LeftSize:Longint;
jpegStream:TMemoryStream;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
jpegStream:=TmemoryStream.Create;

end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
    jpegstream.free;
end;

procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
  var
  rstr:string;
begin
   rstr:=socket.ReceiveText;
   if rstr='show' then
   sendscreen();
end;

procedure TForm1.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
   jpegStream.clear;
end;

procedure TForm1.ServerSocket1ClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  jpegStream.Clear;
end;

procedure TForm1.sendscreen;
var
  sendsize:longint;
  buf:array[0..BufSize-1] of char;
  begin
  if jpegstream.Size=0 then
    snapscreen;
    if LeftSize>Bufsize then
    sendsize:=bufSize
    else
    SendSize:=LeftSize;
    jpegStream.readBuffer(buf,SendSize);
    Leftsize:=Leftsize-SendSize;

    try
      ServerSocket1.socket.Connections[0].SendBuf(buf,SendSize);
      sleep(10);
    except
      jpegstream.clear;
      end;
      if leftSize= 0 then
      Jpegstream.clear;
   end;

procedure TForm1.snapscreen;
var
bmpscreen :Tbitmap;
jpegscreen:Tjpegimage;
FullscreenCanvas:Tcanvas;
dc:HDC;
sourceRect,destRect:TRect;
begin
dc:=getdc(0);
fullscreencanvas:=Tcanvas.Create;
fullscreencanvas.Handle:=dc;
bmpscreen:=Tbitmap.Create;
bmpscreen.Width:=screen.Width;
bmpscreen.height:=screen.Height;
sourcerect:=rect(0,0,screen.Width,screen.Height);
destrect:=rect(0,0,screen.Width,screen.Height);
bmpscreen.Canvas.CopyRect(sourcerect,fullscreencanvas,destrect);
jpegscreen:=Tjpegimage.Create;
jpegscreen.Assign(bmpscreen);
jpegscreen.CompressionQuality:=40;
jpegscreen.SaveToStream(jpegstream);
jpegstream.Position:=0;
Leftsize:=jpegstream.size;
fullscreencanvas.Free;
bmpscreen.Free;
jpegscreen.Free;
releaseDC(0,DC) ;

end;
end.
