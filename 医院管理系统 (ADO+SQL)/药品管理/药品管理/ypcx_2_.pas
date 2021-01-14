unit ypcx_2_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons;

type
  TFormypcx_2 = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    BitBtn_Formypcx_2print: TBitBtn;
    procedure BitBtn_Formypcx_2printClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formypcx_2: TFormypcx_2;

implementation

uses DMypgl_, ypgl_2_BB_, ypgl_;

{$R *.dfm}

procedure TFormypcx_2.BitBtn_Formypcx_2printClick(Sender: TObject);
begin
Formypcx_3BB.QRLabel1.Caption:=datetostr(ypgl.DateTimePicker1.Date);
Formypcx_3BB.QRLabel2.Caption:=datetostr(ypgl.DateTimePicker2.Date);
Formypcx_3BB.QuickRep1.Preview;
end;

end.
