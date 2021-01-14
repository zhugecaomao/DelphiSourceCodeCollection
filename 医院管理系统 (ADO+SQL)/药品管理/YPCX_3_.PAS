unit ypcx_3_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons;

type
  TFormypcx_3 = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    BitBtn_Formypcx_3print: TBitBtn;
    procedure BitBtn_Formypcx_3printClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formypcx_3: TFormypcx_3;

implementation

uses DMypgl_, ypgl_2_BB_, ypcx_3_BB_, ypgl_;

{$R *.dfm}



procedure TFormypcx_3.BitBtn_Formypcx_3printClick(Sender: TObject);
begin
Formypcx2BB.QRLabel1.Caption:=datetostr(ypgl.DateTimePicker3.Date);
Formypcx2BB.QRLabel3.Caption:=datetostr(ypgl.DateTimePicker4.Date);
Formypcx2BB.QuickRep1.Preview;
end;

end.
