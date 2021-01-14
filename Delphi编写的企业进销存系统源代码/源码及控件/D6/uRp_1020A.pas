unit uRp_1020A;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TRp_1020A = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRGroup1: TQRGroup;
    Query1: TQuery;
    QRDBText5: TQRDBText;
    QRShape6: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape5: TQRShape;
    procedure QuickRepAfterPreview(Sender: TObject);
  private

  public

  end;

var
  Rp_1020A: TRp_1020A;

implementation

{$R *.DFM}

procedure TRp_1020A.QuickRepAfterPreview(Sender: TObject);
begin
 self.free;
end;

end.
