unit Frepstaffinfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, DB, ADODB, QRCtrls;

type
  TRepStaffinfo = class(TForm)
    QuickRep1: TQuickRep;
    ADOQuery1: TADOQuery;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    TitleBand1: TQRBand;
    ADOQuery2: TADOQuery;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    QRShape6: TQRShape;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRShape13: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel11: TQRLabel;
    QRShape16: TQRShape;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRShape17: TQRShape;
    QRDBText10: TQRDBText;
    QRShape18: TQRShape;
    QRLabel13: TQRLabel;
    QRShape19: TQRShape;
    QRDBText11: TQRDBText;
    QRLabel14: TQRLabel;
    QRShape20: TQRShape;
    QRDBText12: TQRDBText;
    QRLabel17: TQRLabel;
    QRShape25: TQRShape;
    QRDBText15: TQRDBText;
    QRShape26: TQRShape;
    QRLabel18: TQRLabel;
    QRShape27: TQRShape;
    QRDBText16: TQRDBText;
    QRShape21: TQRShape;
    QRLabel15: TQRLabel;
    QRShape22: TQRShape;
    QRDBText13: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBRichText1: TQRDBRichText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RepStaffinfo: TRepStaffinfo;

implementation

uses fmain;
{$R *.dfm}

end.
