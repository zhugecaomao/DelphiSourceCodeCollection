unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ExtDlgs, Menus;

type
  TForm1 = class(TForm)
    Image1: TImage;
    SavePictureDialog1: TSavePictureDialog;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  BZ:Boolean;          //设定一个标志,判断鼠标是否处于按下
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  //初始化画笔
  Image1.Canvas.Pen.Width:=10;
  Image1.Canvas.Pen.Color:=clRed;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  //画线
  if BZ then
    Image1.Canvas.LineTo(X,Y);
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  //移动画笔到鼠标处
  Image1.Canvas.MoveTo(X,Y);
  BZ:=True;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  //设置标志,表示鼠标抬起
  BZ:=False;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  //将Image1组件中的内容保存到文件
  SavePictureDialog1.FileName:='';
  SavePictureDialog1.Filter:='位图(*.bmp)|*.bmp';
  SavePictureDialog1.DefaultExt:='*.bmp';
  SavePictureDialog1.Execute;
  if SavePictureDialog1.FileName <> '' then
    Image1.Picture.SaveToFile(SavePictureDialog1.FileName);
end;

end.
