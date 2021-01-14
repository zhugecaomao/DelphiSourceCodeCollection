unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
const
  Step=200;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    procedure ShowButtons(Sender:Tobject);//显示窗体上的按钮
    procedure HideButtons(Sender:Tobject);//隐藏窗体上的按钮
    procedure Button15Click(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Bitmap:TBitmap;
  MidX,MidY:Integer;                                   //中间变量，当前步骤所拷贝位图的宽
  RatioX,RatioY:Real;                                    //每步位图宽度增加量
  X0,Y0:Integer;
  Rect1,Rect2:TRect;                              //源、目标矩形区域

implementation

{$R *.dfm}

//显示窗体上的按钮
procedure TForm1.ShowButtons(Sender:Tobject);
var
  I:Integer;
begin
  for I:=0 to Form1.ControlCount -1 do
    Form1.Controls[I].Visible:=True;
end;

//隐藏窗体上的按钮
procedure TForm1.HideButtons(Sender:Tobject);
var
  I:Integer;
begin
  for I:=0 to Form1.ControlCount -1 do
    Form1.Controls[I].Visible:=False;
end;

//清屏并显示按钮
procedure TForm1.FormClick(Sender: TObject);
begin
  Button15.Click;
  Form1.ShowButtons(Sender);
end;

//从中心到四周
procedure TForm1.Button1Click(Sender: TObject);
var
  I:Integer;
begin
  HideButtons(Sender);
  Button15Click(Sender);
  Bitmap:=TBitmap.Create;
  Bitmap.LoadFromFile('a.bmp');
  X0:=Bitmap.Width div 2;
  Y0:=Bitmap.Height div 2;
  RatioX:=Bitmap.Width/Step;
  RatioY:=Bitmap.Height/Step;
  for I:=0 to Step do
  begin
    MidX:=Round(RatioX*I*0.5);
    MidY:=Round(RatioY*I*0.5);
    BitBlt(Form1.Canvas.Handle,X0-MidX,Y0-MidY,Round(RatioX*I),Round(RatioY*I),
    Bitmap.Canvas.Handle,X0-MidX,Y0-MidY,srccopy);
  end;
  Bitmap.Free;
end;

//从四周到中心
procedure TForm1.Button2Click(Sender: TObject);
var
  I:Integer;
begin
  HideButtons(Sender);
  Button15Click(Sender);
  Bitmap:=TBitmap.Create;
  Bitmap.LoadFromFile('a.bmp');
  X0:=Bitmap.Width div 2;
  Y0:=Bitmap.Height div 2;
  RatioX:=Bitmap.Width/Step;
  RatioY:=Bitmap.Height/Step;
  for I:=0 to Step do
  begin
    MidX:=Round(RatioX*I*0.5);
    MidY:=Round(RatioY*I*0.5);
    BitBlt(Form1.Canvas.Handle,0,0,Round(RatioX*I*1),Height,
    Bitmap.Canvas.Handle,0,0,srccopy);
    BitBlt(Form1.Canvas.Handle,Width-Round(RatioX*I),0,Round(RatioX*I*0.5),Height,
    Bitmap.Canvas.Handle,Width -Round(RatioX*I),0,srccopy);
    BitBlt(Form1.Canvas.Handle,0,0,Width,Round(RatioY*I*1),
    Bitmap.Canvas.Handle,0,0,srccopy);
    BitBlt(Form1.Canvas.Handle,0,Height-Round(RatioY*I),Width,Round(RatioY*I*0.5),
    Bitmap.Canvas.Handle,0,Height-Round(RatioY*I),srccopy);
  end;
  Bitmap.Free;
end;

//从左上角到右下角
procedure TForm1.Button3Click(Sender: TObject);
var
  I:Integer;
begin
  HideButtons(Sender);
  Button15Click(Sender);
  Bitmap:=TBitmap.Create;
  Bitmap.LoadFromFile('a.bmp');
  RatioX:=Bitmap.Width/Step;
  RatioY:=Bitmap.Height/Step;
  for I:=0 to Step do
  begin
    BitBlt(Form1.Canvas.Handle,0,0,Round(RatioX*I*1),Round(RatioY*I*1),
    Bitmap.Canvas.Handle,0,0,srccopy);
  end;
  Bitmap.Free;
end;

//从左下角到右上角
procedure TForm1.Button4Click(Sender: TObject);
var
  I:Integer;
begin
  HideButtons(Sender);
  Button15Click(Sender);
  Bitmap:=TBitmap.Create;
  Bitmap.LoadFromFile('a.bmp');
  RatioX:=Bitmap.Width/Step;
  RatioY:=Bitmap.Height/Step;
  for I:=0 to Step do
  begin
    BitBlt(Form1.Canvas.Handle,0,Bitmap.Height-Round(RatioY*I),Round(RatioX*I*1),Round(RatioY*I*1),
    Bitmap.Canvas.Handle,0,Bitmap.Height-Round(RatioY*I),srccopy);
  end;
  Bitmap.Free;
end;

//从右上角到左下角
procedure TForm1.Button5Click(Sender: TObject);
var
  I:Integer;
begin
  HideButtons(Sender);
  Button15Click(Sender);
  Bitmap:=TBitmap.Create;
  Bitmap.LoadFromFile('a.bmp');
  RatioX:=Bitmap.Width/Step;
  RatioY:=Bitmap.Height/Step;
  for I:=0 to Step do
  begin
    BitBlt(Form1.Canvas.Handle,Bitmap.Width -Round(RatioX*I),0,Round(RatioX*I*1),Round(RatioY*I*1),
    Bitmap.Canvas.Handle,Bitmap.Width -Round(RatioX*I),0,srccopy);
  end;
  Bitmap.Free;
end;

//从右下角到左上角
procedure TForm1.Button6Click(Sender: TObject);
var
  I:Integer;
begin
  HideButtons(Sender);
  Button15Click(Sender);
  Bitmap:=TBitmap.Create;
  Bitmap.LoadFromFile('a.bmp');
  RatioX:=Bitmap.Width/Step;
  RatioY:=Bitmap.Height/Step;
  for I:=0 to Step do
  begin
    BitBlt(Form1.Canvas.Handle,Bitmap.Width -Round(RatioX*I),Bitmap.Height -Round(RatioY*I),Round(RatioX*I*1),Round(RatioY*I*1),
    Bitmap.Canvas.Handle,Bitmap.Width -Round(RatioX*I),Bitmap.Height -Round(RatioY*I),srccopy);
  end;
  Bitmap.Free;
end;

//从左到右
procedure TForm1.Button7Click(Sender: TObject);
var
  I:Integer;
begin
  HideButtons(Sender);
  Button15Click(Sender);
  Bitmap:=TBitmap.Create;
  Bitmap.LoadFromFile('a.bmp');
  X0:=0;
  Y0:=0;
  RatioX:=Bitmap.Width/Step;
  RatioY:=Bitmap.Height/Step;
  for I:=0 to Step do
  begin
    MidX:=Round(RatioX*I);
    MidY:=Round(RatioY*I);
    BitBlt(Form1.Canvas.Handle,0,0,Round(RatioX*I*1),Height,
    Bitmap.Canvas.Handle,0,0,srccopy);
  end;
  Bitmap.Free;
end;

//从右到左
procedure TForm1.Button8Click(Sender: TObject);
var
  I:Integer;
begin
  HideButtons(Sender);
  Button15Click(Sender);
  Bitmap:=TBitmap.Create;
  Bitmap.LoadFromFile('a.bmp');
  X0:=0;
  Y0:=0;
  RatioX:=Bitmap.Width/Step;
  RatioY:=Bitmap.Height/Step;
  for I:=0 to Step do
  begin
    MidX:=Round(RatioX*I);
    MidY:=Round(RatioY*I);
    BitBlt(Form1.Canvas.Handle,Bitmap.Width -Round(RatioX*I),0,Round(RatioX*I*1),Height,
    Bitmap.Canvas.Handle,Bitmap.Width -Round(RatioX*I),0,srccopy);
  end;
  Bitmap.Free;
end;

//从上到下
procedure TForm1.Button9Click(Sender: TObject);
var
  I:Integer;
begin
  HideButtons(Sender);
  Button15Click(Sender);
  Bitmap:=TBitmap.Create;
  Bitmap.LoadFromFile('a.bmp');
  X0:=0;
  Y0:=0;
  RatioX:=Bitmap.Width/Step;
  RatioY:=Bitmap.Height/Step;
  for I:=0 to Step do
  begin
    MidX:=Round(RatioX*I);
    MidY:=Round(RatioY*I);
    BitBlt(Form1.Canvas.Handle,0,0,Width,Round(RatioY*I*1),
    Bitmap.Canvas.Handle,0,0,srccopy);
  end;
  Bitmap.Free;
end;

//从下到上
procedure TForm1.Button10Click(Sender: TObject);
var
  I:Integer;
begin
  HideButtons(Sender);
  Button15Click(Sender);
  Bitmap:=TBitmap.Create;
  Bitmap.LoadFromFile('a.bmp');
  X0:=0;
  Y0:=0;
  RatioX:=Bitmap.Width/Step;
  RatioY:=Bitmap.Height/Step;
  for I:=0 to Step do
  begin
    MidX:=Round(RatioX*I);
    MidY:=Round(RatioY*I);
    BitBlt(Form1.Canvas.Handle,0,Bitmap.Height -Round(RatioY*I),Width,Round(RatioY*I*1),
    Bitmap.Canvas.Handle,0,Bitmap.Height -Round(RatioY*I),srccopy);
  end;
  Bitmap.Free;
end;

//从中间到左右两侧
procedure TForm1.Button11Click(Sender: TObject);
var
  I:Integer;
begin
  HideButtons(Sender);
  Button15Click(Sender);
  Bitmap:=TBitmap.Create;
  Bitmap.LoadFromFile('a.bmp');
  X0:=Bitmap.Width div 2;
  RatioX:=Bitmap.Width/Step;
  RatioY:=Bitmap.Height/Step;
  for I:=0 to Step do
  begin
    MidX:=Round(RatioX*I*0.5);
    MidY:=Round(RatioY*I);
    BitBlt(Form1.Canvas.Handle,X0-MidX,0,Round(RatioX*I*0.5),Width,
    Bitmap.Canvas.Handle,X0-MidX,0,srccopy);
    BitBlt(Form1.Canvas.Handle,X0,0,Round(RatioX*I*0.5),Width,
    Bitmap.Canvas.Handle,X0,0,srccopy);
  end;
  Bitmap.Free;
end;

//从左右两侧到中间
procedure TForm1.Button12Click(Sender: TObject);
var
  I:Integer;
begin
  HideButtons(Sender);
  Button15Click(Sender);
  Bitmap:=TBitmap.Create;
  Bitmap.LoadFromFile('a.bmp');
  X0:=Width div 2;
  Y0:=0;
  RatioX:=Bitmap.Width/Step;
  RatioY:=Bitmap.Height/Step;
  for I:=0 to Step do
  begin
    MidX:=Round(RatioX*I*0.5);
    MidY:=Round(RatioY*I);
    BitBlt(Form1.Canvas.Handle,0,0,Round(RatioX*I*1),Height,
    Bitmap.Canvas.Handle,0,0,srccopy);
    BitBlt(Form1.Canvas.Handle,Width -Round(RatioX*I),0,Round(RatioX*I*1),Height,
    Bitmap.Canvas.Handle,Width -Round(RatioX*I),0,srccopy);
    if (Width-RatioX*I)<X0 then
      Exit;
  end;
  Bitmap.Free;
end;

//从中间到上下两侧
procedure TForm1.Button13Click(Sender: TObject);
var
  I:Integer;
begin
  HideButtons(Sender);
  Button15Click(Sender);
  Bitmap:=TBitmap.Create;
  Bitmap.LoadFromFile('a.bmp');
  Y0:=Bitmap.Height div 2;
  RatioX:=Bitmap.Width/Step;
  RatioY:=Bitmap.Height/Step;
  for I:=0 to Step do
  begin
    MidX:=Round(RatioX*I*0.5);
    MidY:=Round(RatioY*I);
    BitBlt(Form1.Canvas.Handle,0,Y0-MidY,Width,Round(RatioY*I),
    Bitmap.Canvas.Handle,0,Y0-MidY,srccopy);
    BitBlt(Form1.Canvas.Handle,0,Y0,Width,Round(RatioY*I),
    Bitmap.Canvas.Handle,0,Y0,srccopy);
  end;
  Bitmap.Free;
end;

//从上下两侧到中间
procedure TForm1.Button14Click(Sender: TObject);
var
  I:Integer;
begin
  HideButtons(Sender);
  Button15Click(Sender);
  Bitmap:=TBitmap.Create;
  Bitmap.LoadFromFile('a.bmp');
  Y0:=Height div 2;
  RatioX:=Bitmap.Width/Step;
  RatioY:=Bitmap.Height/Step;
  for I:=0 to Step do
  begin
    MidX:=Round(RatioX*I*0.5);
    MidY:=Round(RatioY*I);

    BitBlt(Form1.Canvas.Handle,0,0,Width,Round(RatioY*I*1),
    Bitmap.Canvas.Handle,0,0,srccopy);
    BitBlt(Form1.Canvas.Handle,0,Height-Round(RatioY*I),Width,Round(RatioY*I*1),
    Bitmap.Canvas.Handle,0,Height-Round(RatioY*I),srccopy);
    if (Height-RatioY*I)<X0 then
      Exit;
  end;
  Bitmap.Free;
end;

//清屏
procedure TForm1.Button15Click(Sender: TObject);
var
  I:Integer;
begin
  Form1.HideButtons(Sender);
  Bitmap:=TBitmap.Create;
  X0:=0;
  Y0:=0;
  RatioX:=Form1.Width;
  RatioY:=Form1.Height;
  for I:=0 to Step do
  begin
    MidX:=Round(RatioX*I*0.5);
    MidY:=Round(RatioY*I*0.5);
    BitBlt(Form1.Canvas.Handle,X0-MidX,Y0-MidY,Round(RatioX*I),Round(RatioY*I),
    Bitmap.Canvas.Handle,X0-MidX,Y0-MidY,blackness);
  end;
  Bitmap.Free;
end;

//退出
procedure TForm1.Button16Click(Sender: TObject);
begin
  Close;
end;

end.
