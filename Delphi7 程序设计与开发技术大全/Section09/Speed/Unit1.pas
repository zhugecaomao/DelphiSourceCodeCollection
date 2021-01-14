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
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  OSpeed: Word; // 光标闪烁的原始速度
  CSpeed: Word; // 光标闪烁的当前速度
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
// 获取光标闪烁的原始速度
  OSpeed:=GetCaretBlinkTime;
  Edit1.Text:=IntToStr(OSpeed);
  CSpeed:=OSpeed;

end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
//恢复光标闪烁的原始速度
SetCaretBlinkTime(OSpeed);

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
//加快光标闪烁的速度
  CSpeed:=CSpeed div 2;
  SetCaretBlinkTime(CSpeed);
  Edit1.Text:=IntToStr(CSpeed);
  Edit1.SetFocus;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
//减慢光标闪烁的速度
  CSpeed:=CSpeed*2;
  SetCaretBlinkTime(CSpeed);
  Edit1.Text:=IntToStr(CSpeed);
  Edit1.SetFocus;
end;


procedure TForm1.Button3Click(Sender: TObject);
begin
//恢复光标闪烁的原始速度
  SetCaretBlinkTime(OSpeed);
  Edit1.Text:=IntToStr(OSpeed);
  CSpeed:=OSpeed;
  Edit1.SetFocus;
end;


end.
 