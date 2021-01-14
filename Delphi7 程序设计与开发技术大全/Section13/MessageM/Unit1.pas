unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TForm1 = class(TForm)
    Procedure WMPaint (var Msg: TWMPaint); message WM_PAINT;  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
Procedure TForm1.WMPaint (var Msg: TWMPaint);
begin
  MessageBeep (0);
  Inherited;
end;

end.
