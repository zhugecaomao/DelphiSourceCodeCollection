unit VlanUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, TntDBCtrls, Mask, TntStdCtrls, Spin;

type
  TVLan = class(TForm)
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label1: TTntLabel;
    Label3: TTntLabel;
    CB: TComboBox;
    VL: TSpinEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VLan: TVLan;

implementation

{$R *.dfm}

end.
