unit printscreen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CreateParams(var params:tcreateparams);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormShow(Sender: TObject);
var
  rgn:HRGN;
begin
  Form2.AlphaBlendValue:=255;
//  BeginPath(Canvas.Handle);
//  SetBkMode( Canvas.Handle, TRANSPARENT );
//  Canvas.Font.Name:= '宋体';
//  Canvas.Font.Size:=80;
//  Canvas.TextOut( 10, 30, '你应该休息一会了!');//作为form的形状
//  EndPath(Canvas.Handle);
//  rgn:= PathToRegion(Canvas.Handle);
//  SetWindowRgn( Handle, rgn, true );
end;
procedure TForm2.FormCreate(Sender: TObject);
begin
  form2.Brush.Style:=bsclear;
  form2.BorderStyle:=bsnone;
end;
procedure Tform2.CreateParams(var params:tcreateparams);
begin 
 inherited createparams(params);
 params.ExStyle:=ws_ex_transparent; 
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  if AlphaBlendValue<25 then begin
     Form2.Hide;
     //Timer1.Enabled:=False;
     end
  else
     AlphaBlendValue:=AlphaBlendValue-10;
end;

end.
