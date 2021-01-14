unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, JPEG, StdCtrls;

type
  TForm5 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.FormShow(Sender: TObject);
begin
  //-----------设置LABEL显示位置--------
  Label1.Font.Color:=clFuchsia;
  Label1.Font.Size:=18;
  Label1.Transparent:=true;
  label1.Left:=(form5.Width-label1.Width) div 2;
end;

procedure TForm5.FormCreate(Sender: TObject);
var
  JPEG:TJPEGImage;     //JPEG图片类
  Textfile1:Textfile;
  i:integer;
  s:string;
begin
//--------------闪屏的图片设置--------
  JPEG:=TJPEGImage.Create ; //利用TPicture的对象转换bitmap与JPEG
  //如果不是位图则直接载入JPEG对象
  JPEG.LoadFromFile(extractfilepath(application.ExeName)+'RES\BK.jpg');
  image1.Picture.Assign(JPEG);
  image1.stretch:=true;
  image1.Enabled:=true;
  JPEG.Free;
//-----------读取文本文件-------------
  AssignFile(Textfile1, 'sys.txt');
  reset(Textfile1);       //打开文件
  while not eof (Textfile1) do
  begin
    readln(Textfile1, s);
    Label1.Caption:=s+'         ';
  end;
  closefile(Textfile1);

end;

end.
