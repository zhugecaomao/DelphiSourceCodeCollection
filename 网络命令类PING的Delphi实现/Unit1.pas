unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses ping;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
str:string;
ping:Tping;
begin
ping:=Tping.create ;//一定要初试化哦
ping.pinghost('127.0.0.1',str);
memo1.Lines.Add(str);
ping.destroy ;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
memo1.Lines.Add(pingip('127.0.0.1'))
end;

end.
