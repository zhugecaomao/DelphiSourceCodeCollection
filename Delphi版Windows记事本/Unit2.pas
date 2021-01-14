unit unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,shellapi, ComCtrls, Buttons;

type
  TForm2 = class(TForm)
    Bevel1: TBevel;
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel2: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Panel2: TPanel;
    Label7: TLabel;
    Label11: TLabel;
    SpeedButton1: TSpeedButton;
    procedure Timer1Timer(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label11MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
{$R *.dfm}

procedure TForm2.Timer1Timer(Sender: TObject);
begin
if image2.Visible then
  image2.Visible:=false
else
  image2.Visible:=true;
end;

procedure TForm2.Label11Click(Sender: TObject);
begin
shellexecute(handle,'open','http://www.2ccc.com','','',sw_shownormal);
end;

procedure TForm2.Label7Click(Sender: TObject);
begin
shellexecute(handle,'open','mailto:guobin_99@163.com','','',sw_shownormal);
end;

procedure TForm2.Label11MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
label11.Font.Style:=label11.Font.Style+[fsunderline];
label11.Font.Color:=clred;
end;

procedure TForm2.Label7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 label7.Font.Style:=label11.Font.Style+[fsunderline];
label7.Font.Color:=clred;
end;

procedure TForm2.Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   label7.Font.Style:=label11.Font.Style-[fsunderline];
   label11.Font.Style:=label11.Font.Style-[fsunderline];
   label7.Font.Color:=clMaroon;
   label11.Font.Color:=clMaroon;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
close;
end;

end.
