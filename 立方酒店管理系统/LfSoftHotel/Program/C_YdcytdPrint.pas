unit C_YdcytdPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, ExtCtrls, QRCtrls;

type
  TYdcytdPrintForm = class(TForm)
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    qrlTitle: TQRLabel;
    QRLabel2: TQRLabel;
    qrlKrxm: TQRLabel;
    QRLabel3: TQRLabel;
    qrlLxr: TQRLabel;
    QRLabel5: TQRLabel;
    qrlYcsj: TQRLabel;
    QRLabel4: TQRLabel;
    qrlLxdh: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    qrlBz: TQRMemo;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    qrlSub: TQRLabel;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure YdcytdPrint;
  end;

var
  YdcytdPrintForm: TYdcytdPrintForm;


implementation

uses C_Ydcytd;

{$R *.dfm}

procedure TYdcytdPrintForm.YdcytdPrint;
begin
  QuickRep1.Print;
  //QuickRep1.PreviewModal;
end;

end.
