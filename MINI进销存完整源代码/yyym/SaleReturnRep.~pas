unit SaleReturnRep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, DB, DBTables, ExtCtrls, StdCtrls;

type
  TSaleReturnRepF = class(TForm)
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    Query1: TQuery;
    QRDBText1: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SaleReturnRepF: TSaleReturnRepF;

implementation

  Uses ReturnForm;

{$R *.dfm}

procedure TSaleReturnRepF.FormCreate(Sender: TObject);
begin
       QRLabel2.Caption:=ReturnForm.SaleReturnForm.DBEdit1.Text;
        QRLabel4.Caption:=DateToStr(ReturnForm.SaleReturnForm.DateTimePicker1.Date);
         QRLabel7.Caption:=ReturnForm.SaleReturnForm.DBEdit2.Text;
          QRLabel9.Caption:=ReturnForm.SaleReturnForm.DBEdit3.Text;
           QRLabel11.Caption:=ReturnForm.SaleReturnForm.DBEdit4.Text;

            Query1.Close;
            Query1.Params[0].AsString:=QRLabel2.Caption;
            Query1.Open;

end;

procedure TSaleReturnRepF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:=caFree;
end;

end.
