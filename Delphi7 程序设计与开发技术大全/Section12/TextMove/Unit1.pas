unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Panel1: TPanel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    X:Integer;
    Pic:TRect;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Timer1.Enabled := True;
  Timer1.Interval := 10;
  X := Image1.Height + 20;
  Image1.Canvas.Brush.Color := clGray;
  Pic.Left:=0;
  Pic.Top:=0;
  Pic.Right:=Image1.Width;
  Pic.Bottom:=Image1.Height;
  Image1.Canvas.FillRect(Pic);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  x:=x-1;
  if x < -200 then
    x :=Image1.Height + 20;
  Image1.Canvas.Font.Size := 18;
  Image1.Canvas.Font.Color := $120000ff;
  Image1.Canvas.TextOut(80,x, '求是科技简介');
  Image1.Canvas.Font.Color := $1200ffff;
  Image1.Canvas.Font.Size := 12;
  Image1.Canvas.TextOut(40,x + 60, '本公司是____');
  Image1.Canvas.TextOut(0,x + 100, '公司简介内容:');
  Image1.Canvas.TextOut(40,x + 150, '本公司成立于2000年....');
end;

end.
