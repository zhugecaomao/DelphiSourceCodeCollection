unit uRP_3010;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, QRExport;

type
  TRP_3010 = class(TQuickRep)
    Query1: TQuery;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRGroup1: TQRGroup;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRBand2: TQRBand;
    QRBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape1: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRLabel21: TQRLabel;
    Query2: TQuery;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText7: TQRDBText;
    DataSource2: TDataSource;
    QRDBText13: TQRDBText;
    QRLabel11: TQRLabel;
    Query3: TQuery;
    DataSource3: TDataSource;
    QRDBText20: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    DataSource1: TDataSource;
    QRLabel26: TQRLabel;
    Query1BDEDesigner: TStringField;
    Query1BDEDesigner2: TIntegerField;
    Query1BDEDesigner3: TFloatField;
    Query1BDEDesigner4: TFloatField;
    Query1BDEDesigner5: TFloatField;
    Query1BDEDesigner6: TStringField;
    Query1BDEDesigner7: TStringField;
    Query1BDEDesigner8: TDateTimeField;
    Query1BDEDesigner9: TStringField;
    Query1BDEDesigner10: TStringField;
    Query1BDEDesigner11: TStringField;
    Query1BDEDesigner12: TStringField;
    Query1BDEDesigner13: TStringField;
    Query1BDEDesigner14: TStringField;
    Query1BDEDesigner15: TStringField;
    Query1BDEDesigner16: TStringField;
    Query1BDEDesigner17: TStringField;
    Query1BDEDesigner18: TStringField;
    Query1BDEDesigner19: TStringField;
    Query1lk_khdh: TStringField;
    Query1BDEDesigner20: TStringField;
    QRLabel16: TQRLabel;
    QRLabel27: TQRLabel;
    QRSysData1: TQRSysData;
    procedure QRLabel25Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  RP_3010: TRP_3010;

implementation

uses uDM;

{$R *.DFM}

procedure TRP_3010.QRLabel25Print(sender: TObject; var Value: String);    
begin
  QRLabel26.Caption := Floattostr((Query2.FieldList[0].AsFloat + Query2.FieldList[1].AsFloat) - (Query3.FieldList[0].AsFloat + Query3.FieldList[1].AsFloat));
end;

end.
