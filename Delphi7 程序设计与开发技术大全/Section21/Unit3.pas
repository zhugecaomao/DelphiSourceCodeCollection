unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    BitBtn1: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit4, Unit5, Unit11, Unit6, Unit7, Unit1, Unit2;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
Form4.showmodal;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
exit;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
Form5.showmodal;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
Form11.showmodal;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
Form6.show;
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
Form7.show;
end;

end.
