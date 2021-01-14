unit splashformunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls;

type
  Tsplashform = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  splashform: Tsplashform;

implementation

{$R *.dfm}

procedure Tsplashform.Timer1Timer(Sender: TObject);
begin
    SplashForm.ModalResult:=  mrOK; 

end;

procedure Tsplashform.Image1Click(Sender: TObject);
begin
     SplashForm.ModalResult:= mrOK; 

end;

end.
