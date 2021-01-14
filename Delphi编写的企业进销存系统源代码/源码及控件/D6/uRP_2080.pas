unit uRP_2080;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TRP_2080 = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    Query1: TQuery;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape30: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRShape3: TQRShape;
    QRShape20: TQRShape;
    QRLabel6: TQRLabel;
    Query1mf01: TStringField;
    Query1mf02: TDateTimeField;
    Query1mf03: TStringField;
    Query1mf04: TStringField;
    Query1mf05: TStringField;
    Query1mf06: TStringField;
    Query1mf13: TStringField;
    Query1Pf10: TStringField;
    Query1Pf11: TStringField;
    Query1cf02: TStringField;
    Query1pf01: TStringField;
    Query1pf02: TStringField;
    Query1pf03: TStringField;
    Query1pf04: TStringField;
    Query1pf05: TStringField;
    Query1pf07: TFloatField;
    Query1df03: TFloatField;
    Query1df06: TStringField;
    QRDBText9: TQRDBText;
    Query1cf03: TStringField;
    Query1ff03: TStringField;
    QRBand3: TQRBand;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    Query1f20: TFloatField;
    procedure QRLabel21Print(sender: TObject; var Value: String);
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure QRExpr1Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  RP_2080: TRP_2080;

implementation

uses uDM;

{$R *.DFM}

procedure TRP_2080.QRLabel21Print(sender: TObject; var Value: String);
begin
  QRLabel21.Caption := DM.Q_SysParamf01.AsString;
end;

procedure TRP_2080.QuickRepAfterPreview(Sender: TObject);
begin
 self.Free;
end;

procedure TRP_2080.QRExpr1Print(sender: TObject; var Value: String);
begin
  value := floattostr(Query1df03.asfloat * Query1pf07.AsFloat);
end;

end.
