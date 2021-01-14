unit QReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, DB, DBTables, QRCtrls, StdCtrls;

type
  TQReportForm = class(TForm)
    Table1: TTable;
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRSysData1: TQRSysData;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QReportForm: TQReportForm;

implementation

{$R *.dfm}

procedure TQReportForm.Button1Click(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TQReportForm.Button2Click(Sender: TObject);
begin
  QuickRep1.Print;
end;

procedure TQReportForm.Button3Click(Sender: TObject);
begin
  close;
end;

end.
