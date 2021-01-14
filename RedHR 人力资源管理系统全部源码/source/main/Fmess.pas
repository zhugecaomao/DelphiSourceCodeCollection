unit Fmess;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Gauges;

type
  Tmess = class(TForm)
    Panel1: TPanel;
    Timer1: TTimer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mess: Tmess;

implementation

{$R *.dfm}

end.
