unit KeybUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TKeyb = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    CB: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Keyb: TKeyb;

implementation

{$R *.dfm}

end.
