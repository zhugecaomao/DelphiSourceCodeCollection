unit logo_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls;

type
  Tlogo = class(TForm)
    img: TImage;
    Timer1: TTimer;
    procedure imgClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  logo: Tlogo;

implementation

{$R *.dfm}

procedure Tlogo.imgClick(Sender: TObject);
begin
   logo.ModalResult:=mrOK;
end;

procedure Tlogo.Timer1Timer(Sender: TObject);
begin
   logo.ModalResult:=mrOK;
end;

end.
