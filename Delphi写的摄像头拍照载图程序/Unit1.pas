unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,jpeg, ExtCtrls, Videocap, RzButton, ExtDlgs, XPMan,
  RzPanel;

type
  TForm1 = class(TForm)
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    XPManifest1: TXPManifest;
    SavePictureDialog1: TSavePictureDialog;
    RzGroupBox1: TRzGroupBox;
    VideoCap1: TVideoCap;
    RzGroupBox2: TRzGroupBox;
    Panel1: TPanel;
    Image1: TImage;
    RzPanel1: TRzPanel;
    RzBitBtn4: TRzBitBtn;
    RzBitBtn6: TRzBitBtn;
    ComboBox1: TComboBox;
    Label1: TLabel;
    RzGroupBox3: TRzGroupBox;
    RzPanel2: TRzPanel;
    Image2: TImage;
    Image3: TImage;
    RzBitBtn5: TRzBitBtn;

    procedure FormShow(Sender: TObject);

    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzPanel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure RzBitBtn6Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ZoomImage(src,dst:TImage;SetWidth: integer; SetHeight: integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ZoomImage (src,dst:TImage;SetWidth: integer; SetHeight: integer);
//缩放图片
var Bitmap: TBitmap;
begin
   Bitmap := TBitmap.Create;
   Bitmap.Width := SetWidth;
   Bitmap.Height := SetHeight;
   Bitmap.Canvas.StretchDraw(Bitmap.Canvas.ClipRect,timage(src).Picture.Graphic);
   timage(dst).Picture.Graphic := Bitmap;
   timage(src).Invalidate;
end;


procedure TForm1.FormShow(Sender: TObject);
//初始化摄像头连接
begin
    VideoCap1.DriverIndex:=0;
    VideoCap1.DriverOpen:=True;
    VideoCap1.VideoPreview:=True;
end;



procedure TForm1.RzBitBtn1Click(Sender: TObject);
//拍照
Var
  jpeg: TJPEGImage;
  bmp: TBitmap;
  strfilename:String;

begin
  inherited;
  strfilename:=extractfilepath(Application.ExeName);
  begin
       if not  VideoCap1.SaveAsDIB then
        begin
          ShowMessage('拍摄照片失败');
          Abort;
        end;

        bmp:= TBitmap.Create;
        try
          bmp.LoadFromFile(strfilename+ 'Capture.bmp' );

          jpeg:= TJPEGImage.Create;
          try
            jpeg.Assign( bmp );
            Image1.Picture.Graphic:=jpeg;
            RzPanel1.Refresh;
          finally
            jpeg.free;
          end;
        finally
          bmp.free;
        end;
  end;
end;

procedure TForm1.RzBitBtn3Click(Sender: TObject);
begin
   close;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
//退出程序前断开摄像头连接
begin
   VideoCap1.DriverOpen:=False;
   VideoCap1.destroy;
   Application.Terminate;
end;

procedure TForm1.RzBitBtn2Click(Sender: TObject);
//保存照片
var
  jpeg: TJPEGImage;
begin
    jpeg:= TJPEGImage.Create;
    jpeg.Assign(image2.Picture.Graphic);
    jpeg.CompressionQuality:=75;//压缩比例
    jpeg.compress;
    if SavePictureDialog1.Execute then
    jpeg.SaveToFile(SavePictureDialog1.FileName);
    jpeg.Free;
end;

procedure TForm1.RzPanel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
//移动裁剪框
const
      SC_DragMove   =   $F012;     {   a   magic   number   }
begin
      ReleaseCapture;      //释放鼠标捕获
      rzpanel1.Perform(WM_SysCommand,   SC_DragMove,   0);
      if rzpanel1.Top<image1.Top then
      rzpanel1.top:=image1.Top;
      if rzpanel1.left<image1.Left then
      rzpanel1.Left:=image1.Left;
      if (rzpanel1.Top+rzpanel1.Height)>(image1.top+image1.Height) then
      rzpanel1.Top:=image1.Top+image1.Height-rzpanel1.Height;
      if (rzpanel1.left+rzpanel1.width)>(image1.Left+image1.width) then
      rzpanel1.left:=image1.Left+image1.width-rzpanel1.width;
end;

procedure TForm1.RzBitBtn5Click(Sender: TObject);
//调用视频格式窗口
begin
   VideoCap1.DlgVFormat;
end;

procedure TForm1.RzBitBtn4Click(Sender: TObject);
//裁剪
var
bmp: TBitmap;
jpeg: TJPEGImage;
begin
     bmp:=tbitmap.Create;
     jpeg:= TJPEGImage.Create;
     jpeg.Assign(image1.Picture.Graphic);
     bmp.Assign(jpeg);
     Image3.Picture.Graphic:=nil;
     Image3.Canvas.CopyRect(bounds(0,0,RzPanel1.Width,RzPanel1.Height),bmp.Canvas,Bounds(RzPanel1.Left,RzPanel1.top,RzPanel1.Width,RzPanel1.Height));
     if ComboBox1.Text='单寸照片' then
     ZoomImage(Image3,Image2,71,100)
     else
     ZoomImage(Image3,Image2,100,150)
end;

procedure TForm1.RzBitBtn6Click(Sender: TObject);
//调用视频调整窗口
begin
   VideoCap1.DlgVSource;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
//照片尺寸选择
begin
    if ComboBox1.Text='单寸照片' then
    begin
      Image2.Picture.Graphic:=nil;
      RzPanel1.Height:=155;
      RzPanel1.Width:=110;
      Image2.Height:=100;
      Image2.Width:=71;
      Image2.Top:=25;
      Image3.Height:=155;
      Image3.Width:=110;
    end
    else
    begin
      Image2.Picture.Graphic:=nil;
      RzPanel1.Height:=197;
      RzPanel1.Width:=130;
      Image2.Height:=150;
      Image2.Width:=100;
      Image2.Top:=2;
      Image3.Height:=197;
      Image3.Width:=130;
    end
end;

end.
