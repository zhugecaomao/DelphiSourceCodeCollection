unit uRp_1090;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TRp_1090 = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    Query1: TQuery;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    Query1F01: TStringField;
    Query1F02: TStringField;
    Query1F03: TStringField;
    Query1F04: TStringField;
    Query1F05: TStringField;
    Query1F06: TFloatField;
    Query1F07: TFloatField;
    QRDBText8: TQRDBText;
    QRGroup1: TQRGroup;
    Query1F11: TStringField;
    Query1F03_1: TStringField;
    QRGroup2: TQRGroup;
    Query1F03_2: TStringField;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    Query1F13: TFloatField;
    QRLabel15: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape6: TQRShape;
    QRLabel12: TQRLabel;
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QuickRepAfterPreview(Sender: TObject);
  private

  public

  end;

var
  Rp_1090: TRp_1090;

implementation

uses uDM;

{$R *.DFM}

procedure TRp_1090.QRDBText8Print(sender: TObject; var Value: String);
begin
  //value := floattostr(Query1.Fields[5].asfloat * Query1.Fields[6].asfloat);
end;


procedure TRp_1090.QuickRepAfterPreview(Sender: TObject);
begin
  self.Free;
end;

end.
