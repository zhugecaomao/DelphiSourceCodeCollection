unit TextPassEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FlatBars, StdCtrls, FlatUtils, FlatCtrls, FlatBtns,aes;

type
  TTextForm = class(TForm)
    FlatButton1: TFlatButton;
    FlatButton2: TFlatButton;
    PassWord: TFlatMaskEdit;
    FlatTitlebar1: TFlatTitlebar;
    FlatTitlebar2: TFlatTitlebar;
    procedure FlatButton1Click(Sender: TObject);
    procedure FlatButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TextForm: TTextForm;

implementation

uses Experts;
const
  GKEY='#LoveSYCheng$';

{$R *.dfm}

procedure TTextForm.FlatButton1Click(Sender: TObject);
begin
  if Password.Text<>'' then
  begin
  Form1.Text.Lines.Text:=EncryptString(Form1.Text.Lines.Text,Gkey+Password.Text,KB256);
  close;
  end;
end;

procedure TTextForm.FlatButton2Click(Sender: TObject);
begin
  if Password.Text<>'' then
  begin
  Form1.Text.Lines.Text:=DecryptString(Form1.Text.Lines.Text,Gkey+Password.Text,KB256);
  close;
  end;
end;

end.
