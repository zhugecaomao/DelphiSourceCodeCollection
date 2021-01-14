unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  CurrDir:String;
begin
  SetLength(CurrDir,144);
  if GetCurrentDirectory(144,(PChar(CurrDir)))<>0 then
  begin
    SetLength(CurrDir,Length(PChar(CurrDir)));
    Edit1.Text:=CurrDir;
  end
  else
    RaiseLastWin32Error;
end;

end.
