unit SelOpSysUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TSelOpSys = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    OpSysList: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelOpSys: TSelOpSys;

implementation
Uses MainUnit;

{$R *.dfm}

end.
