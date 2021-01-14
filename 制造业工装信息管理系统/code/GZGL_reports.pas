unit GZGL_reports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, ComCtrls, StdCtrls;

type
  TfrmGZGL_Reports = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ScrollBox1: TScrollBox;
    QR_YBB: TQuickRep;
    QRBand3: TQRBand;
    QRImage3: TQRImage;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRBand1: TQRBand;
    QRImage2: TQRImage;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand4: TQRBand;
    Lab_title: TQRLabel;
    Lab_dw: TQRLabel;
    Lab_y: TQRLabel;
    QRExpr1: TQRExpr;
    PageHeaderBand1: TQRBand;
    QRExpr2: TQRExpr;
    Lab_Y2: TQRLabel;
    QRLabel17: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel16: TQRLabel;
    QRBand2: TQRBand;
    QRImage1: TQRImage;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
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
    QRDBText28: TQRDBText;
    QRDBText30: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    TabSheet3: TTabSheet;
    ScrollBox2: TScrollBox;
    QR_NBB: TQuickRep;
    QRBand5: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRImage4: TQRImage;
    QRBand6: TQRBand;
    QRImage5: TQRImage;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRBand7: TQRBand;
    QRExpr3: TQRExpr;
    Lab_N2: TQRLabel;
    QRLabel36: TQRLabel;
    QRBand8: TQRBand;
    QRImage6: TQRImage;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    TitleBand1: TQRBand;
    QRLabel40: TQRLabel;
    Lab_n: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel42: TQRLabel;
    QRExpr4: TQRExpr;
    QRBand9: TQRBand;
    QRLabel43: TQRLabel;
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGZGL_Reports: TfrmGZGL_Reports;

implementation

uses GZGL_DModule, GZGL_print_YBB, GZGL_print_NBB;

{$R *.dfm}

procedure TfrmGZGL_Reports.FormCreate(Sender: TObject);
begin
  with dmd do begin
    if not Tbl_lb.Active then Tbl_NBB.Open;
    if not Tbl_YBB.Active then Tbl_YBB.Open;
  end;
end;

procedure TfrmGZGL_Reports.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  if value='0' then value:='';
end;

end.
