unit C_ChartPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeeProcs, TeEngine, Chart, DbChart, QRTEE, QuickRpt, ExtCtrls;

type
  TChartPrintForm = class(TForm)
    QuickRep1: TQuickRep;
    QRDBChart1: TQRDBChart;
    QRChart1: TQRChart;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChartPrintForm: TChartPrintForm;

procedure ChartPrint(AChart: TChart);

implementation

{$R *.dfm}

procedure ChartPrint(AChart: TChart);
begin
  ChartPrintForm := TChartPrintForm.Create(Application);
  try
    with ChartPrintForm do
    begin
      QuickRep1.Print;
      //QuickRep1.PreviewModal;
    end;
  finally
    ChartPrintForm.Free;
  end;
end;

end.
