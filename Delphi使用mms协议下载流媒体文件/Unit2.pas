unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowDebugInfo(Info: string);

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure ShowDebugInfo(Info: string);
begin
  Form2.Memo1.Lines.Add('[ '+DateTimeToStr(Now)+' ] '+Info);
end;

end.
