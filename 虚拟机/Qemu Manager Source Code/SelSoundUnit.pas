unit SelSoundUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TSelSound = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    SB16: TCheckBox;
    ES1370: TCheckBox;
    Adlib: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelSound: TSelSound;

implementation

{$R *.dfm}

end.
