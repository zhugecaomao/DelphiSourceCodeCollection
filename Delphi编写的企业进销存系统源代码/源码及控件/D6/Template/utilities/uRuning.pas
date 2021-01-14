unit uRuning;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, DdeMan;

type
  TRuning = class(TForm)
    Animate1: TAnimate;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Runing: TRuning;

implementation

{$R *.DFM}


end.
