unit uRP_3050A;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TRP_3050A = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRLabel1: TQRLabel;
    Query1: TQuery;
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
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape1: TQRShape;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText16: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel18: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRLabel20: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText19: TQRDBText;
    DataSource1: TDataSource;
    Query2: TQuery;
    DataSource2: TDataSource;
    Query3: TQuery;
    DataSource3: TDataSource;
    QRLabel19: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel25: TQRLabel;
    procedure QRLabel26Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  RP_3050A: TRP_3050A;

implementation

{$R *.DFM}

procedure TRP_3050A.QRLabel26Print(sender: TObject; var Value: String);
begin
  QRLabel27.Caption := Floattostr((Query2.FieldList[0].AsFloat + Query2.FieldList[1].AsFloat) - (Query3.FieldList[0].AsFloat + Query3.FieldList[1].AsFloat));
end;

end.
