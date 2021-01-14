unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, XPMenu;

type
  TForm8 = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel2: TBevel;
    Button1: TButton;
    Label5: TLabel;
    XPMenu1: TXPMenu;
    procedure Button1Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation
uses shellapi;

{$R *.dfm}

procedure TForm8.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TForm8.Label5Click(Sender: TObject);
begin
  ShellExecute(handle,'open','http://ancientbamboo.icpcn.com', nil,nil,SW_ShowNormal);
  //打开我的主页
end;

procedure TForm8.Label5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  label5.Font.Color:=clred;
end;

procedure TForm8.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  label5.Font.Color:=clblack;
end;

end.
 