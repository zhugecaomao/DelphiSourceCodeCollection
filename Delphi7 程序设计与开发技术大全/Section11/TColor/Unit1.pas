unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

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
begin
  Canvas.Font.Color := clRed;
  Canvas.Pen.Color := RGB(0,255,0);
  Canvas.Brush.Color := $00FF0000;
  Canvas.TextOut(20,20,'TColorÊ¾Àý');
  Canvas.Rectangle(60,60,200,140);
end;

end.
