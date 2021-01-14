unit uRp_4014B;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TRp_4014B = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
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
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    Query1: TQuery;
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape6: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    Query1F01: TStringField;
    Query1F02: TDateTimeField;
    Query1F03: TStringField;
    Query1F02_1: TIntegerField;
    Query1F03_1: TFloatField;
    Query1F04: TFloatField;
    Query1F05: TFloatField;
    Query1F06: TFloatField;
    Query1F01_1: TStringField;
    Query1F02_2: TStringField;
    Query1F03_2: TStringField;
    Query1F04_1: TStringField;
    Query1F05_1: TStringField;
    Query1F07: TStringField;
    Query1F08: TStringField;
    Query1lkF07: TStringField;
    Query1lkF08: TStringField;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel16: TQRLabel;
    procedure QuickRepAfterPreview(Sender: TObject);
  private

  public

  end;

var
  Rp_4014B: TRp_4014B;

implementation

uses uDM;

{$R *.DFM}

procedure TRp_4014B.QuickRepAfterPreview(Sender: TObject);
begin
  self.Free;
end;

end.
