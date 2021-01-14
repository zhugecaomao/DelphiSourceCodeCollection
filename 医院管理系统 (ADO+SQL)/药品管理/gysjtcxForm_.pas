unit gysjtcxForm_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  TFormgysjtcx = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formgysjtcx: TFormgysjtcx;

implementation

uses DMypgl_;

{$R *.dfm}

end.
