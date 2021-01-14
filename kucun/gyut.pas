unit gyut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg,shellapi;

type
  Tgyfm = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    procedure Image1Click(Sender: TObject);
    procedure Label5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label5MouseLeave(Sender: TObject);
    procedure Label5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  gyfm: Tgyfm;

implementation

{$R *.dfm}

procedure Tgyfm.Image1Click(Sender: TObject);
begin
close;
end;

procedure Tgyfm.Label5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
label5.font.Color:=clblue;
end;

procedure Tgyfm.Label5MouseLeave(Sender: TObject);
begin
label5.font.Color:=clblack;
end;

procedure Tgyfm.Label5Click(Sender: TObject);
begin
//shellexecute(handle,'open',pchar('http://www.dnvkj.com'),nil,nil,SW_SHOWNORMAL);
end;

end.
