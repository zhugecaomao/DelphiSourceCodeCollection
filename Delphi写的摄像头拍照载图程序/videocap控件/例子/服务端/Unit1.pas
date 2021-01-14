unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Videocap,iniFiles, ScktComp, ExtCtrls,vfw,jpeg,Zlib;

type
  TForm1 = class(TForm)
    ServerSocket1: TServerSocket;
    Button2: TButton;
    EdUpdate: TEdit;
    EdFrame: TEdit;
    Edfps: TEdit;
    VideoCap1: TVideoCap;
    procedure CheckPrevClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure VideoCap1VideoStream(sender: TObject; lpVhdr: PVIDEOHDR);
    procedure Button2Click(Sender: TObject);
    procedure EdUpdateChange(Sender: TObject);
    procedure ServerSocket1ClientError(Sender: TObject;
      Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer);
  private
   count:integer; // Frame Counter
   BmInf:TBitmapInfo;   // InfoHeader of Bitmapformat
   oldtime,oldtime2:DWord;
   oldcount:integer;
   timerate:dWord;
   m1:tmemorystream;
   bitmap:tbitmap;

    { Private declarations }
  public

    { Public declarations }
  end;

var
  Form1: TForm1;
implementation
{$R *.dfm}
procedure TForm1.CheckPrevClick(Sender: TObject);
begin
//VideoCap1.VideoPreview:=CheckPrev.Checked;
end;

procedure TForm1.FormCreate(Sender: TObject);
var ini:TInifile;
begin
 ini:= TInifile.Create('vcap.ini');
 VideoCap1.Driverindex:=ini.readInteger('Driver','index',-1);
 ini.free;
 ServerSocket1.open;
 bitmap:=tbitmap.Create;
 VideoCap1.VideoPreview:=true;
 Button2.Click; 
end;

procedure TForm1.FormDestroy(Sender: TObject);
var ini:TInifile;
begin
 ini:= TInifile.Create('vcap.ini');
 ini.writeInteger('Driver','index',videoCap1.Driverindex);
 ini.free;
end;

procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
s,s1:string;
jpg:tjpegimage;
desk:tcanvas;
begin
try
s:=socket.ReceiveText;

if s='gets' then //客户端发出申请
begin
jpg:=tjpegimage.Create;
m1:=tmemorystream.Create; //初始化流m1,在用sendstream(m1)发送流后，
//它将保留到socket对话结束，
//不能用手工free掉，否则会触发异常
jpg.Assign(Bitmap); //将图象转成JPG格式
jpg.SaveToStream(m1); //将JPG图象写入流中
jpg.free;
m1.Position:=0;
s1:=inttostr(m1.size);
Socket.sendtext(s1); //发送图象大小
end;
//----------------------------------------

if s='gets1' then // 屏幕
begin
jpg:=tjpegimage.Create;
desk:=tcanvas.Create;
desk.Handle:=getdc(hwnd_desktop);
m1:=tmemorystream.Create;
with bitmap do
begin
width:=screen.Width;
height:=screen.Height;
canvas.CopyRect(canvas.cliprect,desk,desk.cliprect);
end;
jpg.Assign(bitmap);
jpg.SaveToStream(m1);
jpg.free;
m1.Position:=0;
s1:=inttostr(m1.size);
Socket.sendtext(s1);
end;
//---------------------------

if s='okok' then //客户端已准备好接收图象
begin
m1.Position:=0;
Socket.SendStream(m1); //发送JPG图象
end;
except
end;
end;

procedure TForm1.VideoCap1VideoStream(sender: TObject; lpVhdr: PVIDEOHDR);
var fps:integer;
    t:string;
begin
inc(count);  // frame Counter
if lpvhdr^.dwTimeCaptured -oldtime >20 then // calc Framerate
 begin
  oldtime:=lpvhdr^.dwTimeCaptured;
  // calc frames per second
  fps:= count - oldcount;
  oldcount:= count;
  edfps.text:= inttostr(fps);
  EdFrame.text:= inttostr(count);
 end;
canvas.Lock;
if  lpvhdr^.dwTimeCaptured -oldtime2 > timerate then // New Image
 begin
  oldtime2:=lpvhdr^.dwTimeCaptured;
    try
    FrameToBitmap(bitmap,lpVhdr^.lpData,bminf);
    with bitmap.canvas do
     begin
       font.Color:= clred;
       SetBkMode(handle,windows.transparent);
       t:= DateTimeToStr(now);
       Textout(10,bminf.bmiHeader.biHeight - textheight(text), t);
     end;
   except
  end;
end;
canvas.Unlock;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 EdUpdateChange(self);
 bmInf:= VideoCap1.BitmapInfo;
 VideoCap1.StartCapture;
end;

procedure TForm1.EdUpdateChange(Sender: TObject);
begin
  try
   timerate:= strtoint(edUpdate.Text);
  except
    timerate:=10;
  end;
end;


procedure TForm1.ServerSocket1ClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
try
except
end;
end;


end.
