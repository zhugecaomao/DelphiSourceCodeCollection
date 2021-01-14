unit C_YskPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, C_Define, DB, DBTables;

type
  TYskPrintForm = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    qrlTitle: TQRLabel;
    qrlSub: TQRLabel;
    qrlDwmc: TQRLabel;
    qrlZbr: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
    qryWork: TQuery;
    QRGroup1: TQRGroup;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qryWorkD_KHBH: TStringField;
    qryWorkD_KHMC: TStringField;
    dsWork: TDataSource;
    qryDetail: TQuery;
    qryDetailD_XMBH: TStringField;
    qryDetailSUM: TFloatField;
    qryDetailD_XMMC: TStringField;
    qryDetailD_KHBH: TStringField;
    QRShape1: TQRShape;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRDBText4: TQRDBText;
    QRExpr1: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YskPrintForm: TYskPrintForm;

procedure YskPrint(aYskze: Double);

implementation

uses C_HotelData;

{$R *.dfm}
procedure YskPrint(aYskze: Double);
begin
  YskPrintForm := TYskPrintForm.Create(Application);
  try
    with YskPrintForm do
    begin
      qrlTitle.Caption := '应收帐款一览表';
      qrlSub.Caption := '日期：'+DateToStr(Date)+'  应收款总额：'+FormatFloat('#.##',aYskze);
      qrlZbr.Caption := '制表人：'+CZY.CzyXm;
      qrlDwmc.Caption := Hotel_Name;
      qryWork.Open;
      qryDetail.Open;
      //QuickRep1.Print;
      QuickRep1.PreviewModal;
    end;
  finally
    YskPrintForm.qryWork.Close;
    
    YskPrintForm.qryDetail.Close;
    YskPrintForm.Free;
  end;
end;

end.
