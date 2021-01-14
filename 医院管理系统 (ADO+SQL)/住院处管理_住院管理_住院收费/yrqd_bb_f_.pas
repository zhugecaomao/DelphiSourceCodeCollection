unit yrqd_bb_f_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, ExtCtrls, QRCtrls, DB, ADODB, StdCtrls;

type
  Tyrqd_bb_f = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    QRShape15: TQRShape;
    QRBand3: TQRBand;
    QRLabel9: TQRLabel;
    ADOQyrqd_bb: TADOQuery;
    ADOQyrqd_bbid: TStringField;
    ADOQyrqd_bbDSDesigner: TStringField;
    ADOQyrqd_bbDSDesigner2: TIntegerField;
    ADOQyrqd_bbDSDesigner3: TStringField;
    ADOQyrqd_bbDSDesigner4: TFloatField;
    ADOQyrqd_bbDSDesigner5: TDateTimeField;
    DSyrqd_bb: TDataSource;
    ADOQyrqd_bbField: TStringField;
    QRExpr1: TQRExpr;
    ADOQyrqd_bbStringField: TStringField;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRShape14: TQRShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  yrqd_bb_f: Tyrqd_bb_f;

implementation

uses DM_zygl_;

{$R *.dfm}

end.
