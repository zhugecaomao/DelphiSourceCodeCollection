unit logUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, ComCtrls;

type
  Tlogform = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Timer1: TTimer;
    procedure Image1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  logform: Tlogform;
  closetag:integer;

implementation
uses passunit;

{$R *.dfm}

procedure Tlogform.Image1Click(Sender: TObject);
begin
close;
end;

procedure Tlogform.Label2Click(Sender: TObject);
begin
close;
end;

procedure Tlogform.Label1Click(Sender: TObject);
begin
close;
end;

procedure Tlogform.FormActivate(Sender: TObject);
begin
logform.Left:=GetSystemMetrics(SM_CXSCREEN)div 2-logform.Width div 2;
logform.Top:=GetSystemMetrics(SM_CYSCREEN)div 2-logform.Height div 2;
closetag:=0;
Timer1.Enabled:=true;
end;

procedure Tlogform.Timer1Timer(Sender: TObject);
begin
if closetag=3 then
  begin
    Timer1.Enabled:=false;
    logform.Close;
  end
else
  closetag:=closetag+1;
end;

procedure Tlogform.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
Timer1.Enabled:=false;
logform.Hide;
passform.ShowModal;
end;

procedure Tlogform.Label3Click(Sender: TObject);
begin
close;
end;

procedure Tlogform.Label4Click(Sender: TObject);
begin
close;
end;

end.
