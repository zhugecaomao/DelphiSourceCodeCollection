unit report;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB;

type
  TQuickReport1 = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    DetailBand1: TQRBand;
    LblIncName: TQRLabel;
    LblPrintDate: TQRLabel;
    lblTit: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel1: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape11: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape17: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape18: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape19: TQRShape;
    QRLabel49: TQRLabel;
    LblCN1: TQRLabel;
    LblCN2: TQRLabel;
    LblCN3: TQRLabel;
    LblName: TQRLabel;
    LblPhone: TQRLabel;
    LblFax: TQRLabel;
    Lblmobile: TQRLabel;
    LblBuyAmount: TQRLabel;
    LblAddr: TQRLabel;
    LblBuyDate: TQRLabel;
    LblOverRun: TQRLabel;
    LblCpu: TQRLabel;
    Lblmainboard: TQRLabel;
    LblMemory: TQRLabel;
    LblHD: TQRLabel;
    LblSound: TQRLabel;
    LbldisplayCard: TQRLabel;
    LblCDROM: TQRLabel;
    Lblfloppy: TQRLabel;
    LblKeyBoard: TQRLabel;
    LblSoundBox: TQRLabel;
    LblNetWork: TQRLabel;
    LblModem: TQRLabel;
    LblPrint: TQRLabel;
    LblOther: TQRLabel;
    LblPower: TQRLabel;
    Lblbox: TQRLabel;
    Lbldisplay: TQRLabel;
    Lblmouse: TQRLabel;
    LblIncAddr: TQRLabel;
    LblIncMail: TQRLabel;
    LblIncWeb: TQRLabel;
    LblIncPhone: TQRLabel;
    LblIncFax: TQRLabel;
    LblIncPhone1: TQRLabel;
    QMemo: TQRMemo;
    QRLabel50: TQRLabel;
  private

  public

  end;

var
  QuickReport1: TQuickReport1;

implementation

{$R *.DFM}

end.
