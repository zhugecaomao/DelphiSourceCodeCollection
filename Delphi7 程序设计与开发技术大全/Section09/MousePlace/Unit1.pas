unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
rtButton2: TRect;
begin
// 获取B u t t o n 2组件的坐标
rtButton2 := Button2.BoundsRect;
// 将坐标转换为屏幕坐标
MapWindowPoints(handle, 0, rtButton2, 2);
// 将鼠标移动的范围限制在B u t t o n 2组件上
ClipCursor( @rtButton2 ) ;
end ;
procedure TForm1.Button2Click(Sender: TObject);
begin
// 取消鼠标移动范围的限制
        ClipCursor( 0 );
end;

end.
