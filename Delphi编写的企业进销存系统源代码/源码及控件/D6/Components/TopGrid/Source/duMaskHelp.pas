unit duMaskHelp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls {$IFDEF TSVER_V6}, Variants {$ENDIF};

type
  TfmMaskHelp = class(TForm)
    Memo1: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMaskHelp: TfmMaskHelp;

implementation

{$R *.dfm}

end.
