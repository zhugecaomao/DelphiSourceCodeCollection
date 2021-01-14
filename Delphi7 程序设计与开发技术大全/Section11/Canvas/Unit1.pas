unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormPaint(Sender: TObject);
var
  A,x1,y1,x2,y2:Double;
  D:Integer;
  I:Integer;
  E,M_PI:Double;
begin
  D := 100;
  M_PI := 3.1415926535897932;
  for I := 0 to 720 do
  begin
    A := I * M_PI / 360;
    E := D * (1 + sin(12 * A));
    x1 := 320 + E * cos(A);
    x2 := 320 + E * cos(A + M_PI / 6);
    y1 := 240 + E * sin(A);
    y2 := 240 + E * sin(A + M_PI / 6);
    Canvas.MoveTo(Round(x1),Round(y1));
    Canvas.LineTo(Round(x2),Round(y2));
  end;
end;
end.
