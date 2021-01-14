unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  C: TCanvas;
begin
  C:= TCanvas.Create;
  C.Pen.Width :=5;
  C.Font.Size:=30;
  C.Font.Color:=clRed;
  Try
    C.Handle := GetDC (0);
    C.TextOut(20,20,'Hello World');
  Finally
    C.Free;
end;
end;

end.
