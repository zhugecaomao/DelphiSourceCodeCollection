unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    ScrollBar1: TScrollBar;
    ComboBox1: TComboBox;
    RadioButton1: TRadioButton;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Label1: TLabel;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Label2: TLabel;
    procedure RadioGroup1Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
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

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
if RadioGroup1.ItemIndex=0 then
  Panel1.Visible:=True
else
  Panel1.Visible:=False;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
Label1.Font.Size:=ScrollBar1.Position;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
Label1.Font.Name:=ComboBox1.Text;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
Label1.Font.Color:=clRed;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
Label1.Font.Color:=clGreen;
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
Label1.Font.Color:=clBlue;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Label1.Font.Style :=[];
if CheckBox1.Checked then
  Label1.Font.Style:=[fsBold];
if CheckBox2.Checked then
  Label1.Font.Style :=Label1.Font.Style +[fsItalic];
if CheckBox3.Checked then
  Label1.Font.Style :=Label1.Font.Style +[fsUnderline];
end;

end.
