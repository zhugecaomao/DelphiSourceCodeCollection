unit SelMemUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Spin;

type
  TSelMemory = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    SE: TSpinEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelMemory: TSelMemory;

implementation
Uses MainUnit;

{$R *.dfm}

end.
