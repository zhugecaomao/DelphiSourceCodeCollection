unit mess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons;

type
  Tmess_frm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    SpeedButton1: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mess_frm: Tmess_frm;

implementation

{$R *.DFM}

procedure Tmess_frm.Button1Click(Sender: TObject);
begin
close;
end;

procedure Tmess_frm.Timer1Timer(Sender: TObject);
begin
if not self.ProgressBar1.Visible  then self.ProgressBar1.Visible :=true;
if not self.speedbutton1.Visible then self.speedbutton1.Visible:=true;

self.ProgressBar1.StepIt;
if self.progressbar1.Max=self.ProgressBar1.Position then
begin
timer1.Enabled:=false;
self.ProgressBar1.Hide;
self.ProgressBar1.Position:=0;
close;
end;
end;

procedure Tmess_frm.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tmess_frm.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure Tmess_frm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_ESCAPE then close;
end;

end.
