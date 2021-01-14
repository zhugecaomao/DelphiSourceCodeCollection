unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TForm8 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    BitBtn1: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses Unit9, Unit10;

{$R *.dfm}

procedure TForm8.Button1Click(Sender: TObject);
begin
form9.showmodal;
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
 form9.showmodal;
end;

procedure TForm8.Button3Click(Sender: TObject);
begin
form9.showmodal;
end;

procedure TForm8.Button4Click(Sender: TObject);
begin
form10.showmodal;
end;


procedure TForm8.Button5Click(Sender: TObject);
begin
form10.showmodal;
end;

procedure TForm8.BitBtn1Click(Sender: TObject);
begin
close;
end;

end.
