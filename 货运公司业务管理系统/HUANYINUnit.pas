unit HUANYINUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AACtrls, AAFont, jpeg;

type
  THUANYINForm = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    Image1: TImage;
    procedure Timer2Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HUANYINForm: THUANYINForm;

implementation

{$R *.dfm}

procedure THUANYINForm.Timer2Timer(Sender: TObject);
begin
  HUANYINForm.Close;
end;

procedure THUANYINForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=CaFree;
end;

end.
