unit FinalReportForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, DB, ADODB, ExtCtrls;

type
  TFinalReport = class(TForm)
    QuickRep1: TQuickRep;
    ADOTable1: TADOTable;
    DetailBand1: TQRBand;
    TitleBand1: TQRBand;
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
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
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
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRSysData1: TQRSysData;
    QRShape1: TQRShape;
    QRLabel23: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText21: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetPeriod(period:integer);
  end;

var
  FinalReport: TFinalReport;

implementation

{$R *.dfm}

{ TFinalReport }



{ TFinalReport }

procedure TFinalReport.SetPeriod(period:integer);
begin
 adotable1.Filter:='会计期间='''+inttostr(period)+'''';
 adotable1.Filtered:=true;
end;

end.
