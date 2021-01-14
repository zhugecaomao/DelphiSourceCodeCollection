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
  for I := 1 to 8 do
  begin
    Canvas.Brush.Style := TBrushStyle(I);    //设置Brush的填充模式
    Canvas.Rectangle(45 * I,20,30 + 45 * I,50);
  end;
end;

end.
