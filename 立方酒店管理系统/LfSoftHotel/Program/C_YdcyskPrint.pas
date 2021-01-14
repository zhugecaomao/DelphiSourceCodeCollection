unit C_YdcyskPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls,C_Define;

type
  TYdcyskPrintForm = class(TForm)
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    qrlTitle: TQRLabel;
    qrlSub: TQRLabel;
    qrlKrxm: TQRLabel;
    qrlLxr: TQRLabel;
    qrlYcsj: TQRLabel;
    QRLabel1: TQRLabel;
    qrlBz: TQRMemo;
    QRShape1: TQRShape;
    qrlYcbz: TQRLabel;
    qrlCtmc: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    qrlLxdh: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape8: TQRShape;
    QRLabel6: TQRLabel;
    QRShape9: TQRShape;
    QRLabel7: TQRLabel;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel13: TQRLabel;
    QRShape24: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape25: TQRShape;
    QRLabel22: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape30: TQRShape;
    QRLabel25: TQRLabel;
    QRShape31: TQRShape;
    QRLabel26: TQRLabel;
    QRShape32: TQRShape;
    QRLabel27: TQRLabel;
    QRShape33: TQRShape;
    QRShape35: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure YdcyskPrint;
  end;

var
  YdcyskPrintForm: TYdcyskPrintForm;


implementation

{$R *.dfm}

procedure TYdcyskPrintForm.YdcyskPrint;
begin
  with YdcyskPrintForm do
  begin
    QuickRep1.Print;
    //QuickRep1.PreviewModal;
  end;
end;

end.
