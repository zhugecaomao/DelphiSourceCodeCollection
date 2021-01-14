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
var
  pic:TBitmap;
begin
  pic:= TBitmap.Create;
  pic.LoadFromFile('1.bmp');
  Canvas.Draw(30,30,pic);
  pic.Free;
end;
end.
