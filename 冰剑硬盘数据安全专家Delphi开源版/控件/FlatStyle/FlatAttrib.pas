unit FlatAttrib;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, FlatCtrls, FlatUtils;

type
  TMaskForm = class(TForm)
    EditText: TFlatMaskEdit;
    EditMask: TFlatEdit;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MaskForm: TMaskForm;

implementation

{$R *.dfm}

end.
