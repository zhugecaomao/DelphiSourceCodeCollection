unit SelCDFLOPUNIT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TSelPhysical = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Drive: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelPhysical: TSelPhysical;

implementation

{$R *.dfm}

end.
