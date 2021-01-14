unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  CurImage:Integer;
implementation

{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  case CurImage of
    1:begin
      Image6.Picture:=Image1.Picture;
      CurImage:=2;
      end;
    2:begin
      Image6.Picture:=Image2.Picture;
      CurImage:=3;
      end;
    3:begin
      Image6.Picture:=Image3.Picture;
      CurImage:=4;
      end;
    4:begin
      Image6.Picture:=Image4.Picture;
      CurImage:=5;
      end;
    5:begin
      Image6.Picture:=Image5.Picture;
      CurImage:=1;
      end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CurImage:=2;
end;

end.
