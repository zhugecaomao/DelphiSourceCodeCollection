unit uRp_2020;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TRp_2020 = class(TQuickRep)
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
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
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
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    Query1: TQuery;
    QRBand2: TQRBand;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRBand3: TQRBand;
    QRLabel21: TQRLabel;
    QRBand4: TQRBand;
    Query1F01: TStringField;
    Query1F04: TStringField;
    Query1F05: TFloatField;
    Query1F06: TFloatField;
    Query1F12: TStringField;
    Query1F13: TStringField;
    Query1F14: TStringField;
    Query1F15: TStringField;
    Query1F16: TStringField;
    Query1D_SN: TSmallintField;
    Query1F03: TStringField;
    Query1F04_1: TStringField;
    Query1F05_1: TStringField;
    Query1F06_1: TStringField;
    Query1F07: TStringField;
    Query1F08: TStringField;
    Query1F10: TFloatField;
    Query1F11: TFloatField;
    Query1lk_F12: TStringField;
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure QRLabel21Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  Rp_2020: TRp_2020;

implementation

uses uDM;

{$R *.DFM}

procedure TRp_2020.QuickRepAfterPreview(Sender: TObject);
begin
  self.Free;
end;

procedure TRp_2020.QRLabel21Print(sender: TObject; var Value: String);
begin
  QRLabel21.Caption := DM.Q_SysParamF01.AsString;
end;

end.
