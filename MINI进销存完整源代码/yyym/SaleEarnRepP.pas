unit SaleEarnRepP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, DB, DBTables, ExtCtrls, StdCtrls;

type
  TSaleEarnRep = class(TForm)
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
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
    ColumnHeaderBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SaleEarnRep: TSaleEarnRep;

implementation

  Uses SaleEarnForm;

{$R *.dfm}

procedure TSaleEarnRep.FormCreate(Sender: TObject);
begin
       QRLabel2.Caption:=SaleEarnForm.Form5.DBEdit1.Text;
        QRLabel4.Caption:=DateToStr(SaleEarnForm.Form5.DateTimePicker1.Date);
         QRLabel7.Caption:=SaleEarnForm.Form5.DBEdit2.Text;
          QRLabel9.Caption:=SaleEarnForm.Form5.DBEdit3.Text;
           QRLabel11.Caption:=SaleEarnForm.Form5.DBEdit4.Text;
             QRLabel20.Caption:=SaleEarnForm.Form5.DBEdit5.Text;
             QRLabel22.Caption:=SaleEarnForm.Form5.DBEdit6.Text;
             QRLabel24.Caption:=SaleEarnForm.Form5.DBEdit7.Text;
             QRLabel26.Caption:=SaleEarnForm.Form5.DBEdit8.Text;
            Query1.Close;
            Query1.Params[0].AsString:=QRLabel2.Caption;
            Query1.Open;

end;

procedure TSaleEarnRep.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:=caFree;
end;

end.
