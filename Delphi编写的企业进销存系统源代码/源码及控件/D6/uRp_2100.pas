unit uRp_2100;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TRp_2100 = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
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
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape24: TQRShape;
    QRShape26: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    Query1: TQuery;
    QRBand2: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText14: TQRDBText;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape1: TQRShape;
    QRShape20: TQRShape;
    QRLabel21: TQRLabel;
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure QRLabel21Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  Rp_2100: TRp_2100;

implementation

uses uDM;

{$R *.DFM}

procedure TRp_2100.QuickRepAfterPreview(Sender: TObject);
begin
 self.Free;
end;

procedure TRp_2100.QRLabel21Print(sender: TObject; var Value: String);
begin
  QRLabel21.Caption := dm.Q_SysParamF01.ASstring;
end;

end.
