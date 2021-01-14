unit gysjtcxForm_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DBCtrls;

type
  TFormgysjtcx = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
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

procedure TFormgysjtcx.BitBtn1Click(Sender: TObject);
begin
close;
end;

end.
