unit NewOpsysUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, TntStdCtrls;

type
  TNewOpsys = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label17: TTntLabel;
    GB: TTntLabel;
    Name: TEdit;
    Ram: TSpinEdit;
    Drive: TSpinEdit;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewOpsys: TNewOpsys;

implementation

{$R *.dfm}

end.

