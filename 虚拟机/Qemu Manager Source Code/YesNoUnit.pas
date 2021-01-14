unit YesNoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TYesNo = class(TForm)
    GB: TGroupBox;
    Caption: TLabel;
    Button1: TButton;
    Button2: TButton;
    CB: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YesNo: TYesNo;

implementation

{$R *.dfm}

end.
