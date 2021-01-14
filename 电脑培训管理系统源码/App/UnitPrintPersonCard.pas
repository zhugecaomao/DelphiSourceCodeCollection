unit UnitPrintPersonCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls,QRPrntr;

type
  TfrmPrintPersonCard = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBImage1: TQRDBImage;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    qrlTitle: TQRLabel;
    QRDBText5: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintPersonCard: TfrmPrintPersonCard;

implementation

uses UnitDM, UnitData, UnitPrint_tmp;

{$R *.dfm}

end.
