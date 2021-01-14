unit SelWindowNoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TSelWindow = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    SE: TSpinEdit;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelWindow: TSelWindow;

implementation

{$R *.dfm}

end.
