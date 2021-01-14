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
  MyWinPath:String;
begin
  SetLength(MyWinPath,144);
  if GetWindowsDirEctory(PChar(MyWinPath),144)<>0 then
  begin
    SetLength(MyWinPath,Length(PChar(MyWinPath)));
    Edit1.Text:=MyWinPath;
  end
  else
    RaiseLastWin32Error;
end;

end.
