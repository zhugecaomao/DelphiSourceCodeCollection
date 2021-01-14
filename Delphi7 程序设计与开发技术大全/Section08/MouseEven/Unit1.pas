unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TForm1 = class(TForm)
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    Bz:Boolean;     //声明一个“标志”功能的全局布尔型变量
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbLeft then              //如果是鼠标左键按下
  begin
    Bz:=True;                        //将标志变量设置为True，即可画状态
    Form1.Canvas.MoveTo(X,Y);        //将画笔移动到鼠标按下左键的位置
  end;
end;

procedure TForm1.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbLeft then             //如果是鼠标左键抬起
    Bz:=False;                      //将标志变量设置为False，即不可画状态
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Bz:=False;                        //初始化标志变量为不可画状态
  Form1.Canvas.Pen.Color:=clRed;    //设置画笔颜色为红色
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if Bz then                         //如果标志变量为True，即可画状态，则
  begin
    Form1.Canvas.LineTo(X,Y);        //从画笔位置画线到鼠标当前位置
    Form1.Canvas.MoveTo(X,Y);        //设置画笔位置
  end;
end;

end.
