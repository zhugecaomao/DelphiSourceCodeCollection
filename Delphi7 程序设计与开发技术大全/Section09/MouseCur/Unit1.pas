unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
        h: HCURSOR;
begin
        h:=LoadCursorFromFile('3dsmove.cur');
        SetSystemCursor(h,ocr_normal);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
        SystemParametersinfo(SPI_SETCURSORS,0,nil,SPIF_SENDCHANGE);
end;

end.
