unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JPEG, StdCtrls, Extctrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  JpegImage: TJPEGImage;
  BmpImage: TImage;
begin
  BmpImage := TImage.Create(self);
  Jpegimage := TJPEGImage.Create;
  BmpImage.Picture.LoadFromFile('Tower.bmp');     //装入位图文件
  JpegImage.Assign(BmpImage.Picture.Bitmap);
  JpegImage.SaveToFile('Tower.jpg');              //保存为JPEG文件
  BmpImage.Free;
  JpegImage.Free ;
end;

end.
