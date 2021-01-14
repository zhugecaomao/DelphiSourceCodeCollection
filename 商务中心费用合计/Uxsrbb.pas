unit Uxsrbb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TF_xsrbb = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
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
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape18: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape21: TQRShape;
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
    QRLabel37: TQRLabel;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape28: TQRShape;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape29: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRShape30: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRdzs: TQRLabel;
    QRdys: TQRLabel;
    QRdzj: TQRLabel;
    QRdyj: TQRLabel;
    QRcsns: TQRLabel;
    QRcgns: TQRLabel;
    QRczgjs: TQRLabel;
    QRcsnj: TQRLabel;
    QRcgnj: TQRLabel;
    QRcgjj: TQRLabel;
    QRfys: TQRLabel;
    QRfyss: TQRLabel;
    QRfyj: TQRLabel;
    QRfysj: TQRLabel;
    QRgnhj: TQRLabel;
    QRgjhj: TQRLabel;
    QRgatj: TQRLabel;
    QRrws: TQRLabel;
    QRswj: TQRLabel;
    QRsms: TQRLabel;
    QRsmj: TQRLabel;
    QRitj: TQRLabel;
    QRLand: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel61: TQRLabel;
    QRsqdt: TQRLabel;
    QRbqlydt: TQRLabel;
    QRbqxsdt: TQRLabel;
    QRbqdtjc: TQRLabel;
    QRjedt: TQRLabel;
    QRsqypmxp: TQRLabel;
    QRbqlymxp: TQRLabel;
    QRbqxsmxp: TQRLabel;
    QRbqjcmxp: TQRLabel;
    QRjemxp: TQRLabel;
    QRsqyp5: TQRLabel;
    QRbqlyyp5: TQRLabel;
    QRbqxsyp5: TQRLabel;
    QRbqjc5: TQRLabel;
    QRjeyp5: TQRLabel;
    QRry: TQRLabel;
    QRShape27: TQRShape;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel59: TQRLabel;
    QRdz: TQRLabel;
    QRLabel62: TQRLabel;
    QRGJCZ: TQRLabel;
    QRLabel63: TQRLabel;
    QRGNCZ: TQRLabel;
    QRLabel65: TQRLabel;
    QRSNCZ: TQRLabel;
    QRLabel64: TQRLabel;
    QRSW: TQRLabel;
    QRLabel66: TQRLabel;
    QRGJCH: TQRLabel;
    QRLabel67: TQRLabel;
    QRGNCH: TQRLabel;
    QRLabel68: TQRLabel;
    QRgat: TQRLabel;
    qrbmhj: TQRLabel;
    QRbqhj: TQRLabel;
    QRlyhj: TQRLabel;
    QRschj: TQRLabel;
    QRjchj: TQRLabel;
    QRxshjje: TQRLabel;
    QRneibu: TQRLabel;
    QRits: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRShape26: TQRShape;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRyouyi: TQRLabel;
    QRShape34: TQRShape;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRShape33: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRA3: TQRLabel;
    QRA4: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_xsrbb: TF_xsrbb;

implementation

{$R *.dfm}

end.
