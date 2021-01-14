unit Option;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, ComCtrls;

type
  TfrmOption = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    DefBtn: TButton;
    cPageControl: TPageControl;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOption: TfrmOption;

implementation

{$R *.DFM}

end.
