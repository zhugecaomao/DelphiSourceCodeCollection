unit Flogo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  Tlogo = class(TForm)
    Image1: TImage;
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  logo: Tlogo;

implementation



{$R *.dfm}

procedure Tlogo.Image1Click(Sender: TObject);
begin
  self.Close;
end;

end.
