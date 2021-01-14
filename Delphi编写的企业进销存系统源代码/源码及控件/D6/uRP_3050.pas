unit uRP_3050;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TRP_3050 = class(TQuickRep)
    Query1: TQuery;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText15: TQRDBText;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRDBText16: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel21: TQRLabel;
    Query2: TQuery;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    Query3: TQuery;
    QRLabel22: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText21: TQRDBText;
    DataSource1: TDataSource;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel24: TQRLabel;
    procedure QRLabel25Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  RP_3050: TRP_3050;

implementation

{$R *.DFM}

procedure TRP_3050.QRLabel25Print(sender: TObject; var Value: String);
begin
  QRLabel26.Caption := Floattostr((Query2.FieldList[0].AsFloat + Query2.FieldList[1].AsFloat) - (Query3.FieldList[0].AsFloat + Query3.FieldList[1].AsFloat));
end;

end.
