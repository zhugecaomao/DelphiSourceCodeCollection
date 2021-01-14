unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    ScrollBar1: TScrollBar;
    procedure ScrollBar1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
Form1.AlphaBlend:=True;
Form1.AlphaBlendValue :=ScrollBar1.Position;
end;

end.
