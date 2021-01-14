unit InputUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TInputFrm = class(TForm)
    Button2: TButton;
    Button1: TButton;
    GB: TGroupBox;
    Caption: TLabel;
    Text: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InputFrm: TInputFrm;

implementation

{$R *.dfm}

end.
