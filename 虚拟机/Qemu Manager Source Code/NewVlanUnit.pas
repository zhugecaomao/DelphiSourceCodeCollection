unit NewVlanUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, TntStdCtrls;

type
  TNewVLAN = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TTntLabel;
    Label3: TTntLabel;
    CB: TComboBox;
    VL: TSpinEdit;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewVLAN: TNewVLAN;

implementation

{$R *.dfm}

end.
