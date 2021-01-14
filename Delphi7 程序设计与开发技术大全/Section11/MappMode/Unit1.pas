unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
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
begin  //MM_LOENGLISHģʽ
SetMapMode(Canvas.Handle,MM_LOENGLISH);
Canvas.Pen.Width:=100;
Canvas.Pen.Color:=clRed;
Canvas.Rectangle(0,0,100,100);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin  //MM_LOMETRICģʽ
SetMapMode(Canvas.Handle,MM_LOMETRIC);
Canvas.Pen.Width:=100;
Canvas.Pen.Color:=clWhite;
Canvas.Rectangle(0,0,100,100);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin  //MM_ANISOTROPICģʽ
SetMapMode(Canvas.Handle,MM_ANISOTROPIC);
Canvas.Pen.Width:=100;
Canvas.Pen.Color:=clBlue;
Canvas.Rectangle(0,0,100,100);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin  //MM_LOMETRICģʽ
SetMapMode(Canvas.Handle,MM_LOMETRIC);
Canvas.Pen.Width:=100;
Canvas.Pen.Color:=clBlack;
Canvas.Rectangle(0,0,100,100);
end;

end.
