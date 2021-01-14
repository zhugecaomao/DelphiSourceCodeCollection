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
begin
  for I := 0 to 6 do
  begin
    Canvas.Pen.Style := TPenStyle(I);
    Canvas.MoveTo(50,20 + I * 20);
    Canvas.LineTo(200,20 + I * 20);
  end;
end;

end.
