unit Unit2;

interface

uses
  Classes,Graphics;

type
  TSquareThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    procedure Paint;        //在窗体中画正方形
  Public
    X1,Y,X2,Step:Integer;  //正方形的新、旧位置和变化的步长
    EColor:TColor;         //正方形的颜色
    Constructor Create(Col:TColor;XPos,YPos:Integer);     //构造函数

end;

implementation

Uses Unit1;

Procedure TSquareThread.Paint;
Begin
  //使用窗体的颜色在老地方画一个正方形
  Form1.Canvas.Pen.Color:=Form1.Color;
  Form1.Canvas.Brush.Color:=Form1.Color;
  Form1.Canvas.Rectangle(X1-10,Y-10,X1+10,Y+10);
  //使用窗体的颜色在老地方画一个正方形
  Form1.Canvas.Pen.Color:=EColor;
  Form1.Canvas.Brush.Color:=EColor;
  Form1.Canvas.Rectangle(X2-10, Y-10, X2+10, Y+10);
End;

Constructor TSquareThread.Create (Col: TColor; XPos, YPos: Integer);
Begin
  EColor:=Col;      //颜色
  X2:=XPos;         //X坐标
  X1:=X2;
  Y:=YPos;          //Y坐标
  Inherited Create (True);
End;

procedure TSquareThread.Execute;
begin
  Step:=1;          //步长
  Repeat
  X1:=X2;
  X2:=X2+Step;      //改变X坐标位置
  if X2<160 then
  Step:=1           //到了左边
  Else if X2>(Form1.ClientWidth-15) then
    Step:=-1;       //到了右边
  Synchronize(Paint);
  Until Terminated;
end;

end.
 