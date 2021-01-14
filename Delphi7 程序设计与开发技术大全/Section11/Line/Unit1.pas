unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TForm1 = class(TForm)
    procedure FormClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormClick(Sender: TObject);
var
  I:Integer;
  x1,y1,x2,y2:Integer;
begin
  for I := 4 downto 0 do
  begin
    Canvas.Pen.Width := I;
    x1 := (ClientWidth div 2) - (I + 1) * 30;
    x2 := (ClientWidth div 2) + (I + 1) * 30;
    y1 := (ClientHeight div 2) - (I + 1) * 30;
    y2 := (ClientHeight div 2) + (I + 1) * 30;
    Canvas.Rectangle(x1,y1,x2,y2);
  end;
end;

end.
