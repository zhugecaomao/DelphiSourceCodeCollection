unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,jpeg;

type
  TForm1 = class(TForm)
    Image1: TImage;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var
 JPG: TJPEGImage;
begin
  OpenDialog1.Filter:= 'JPG(*.JPG)|*.JPG;所有文件(*.*)|*.*';
    if OpenDialog1.Execute then
    begin
      JPG:= TJPEGImage.Create;
      JPG.LoadFromFile(OpenDialog1.FileName);
      Image1.Picture.Assign(JPG);
      JPG.Free;
    end;
end;

end.
