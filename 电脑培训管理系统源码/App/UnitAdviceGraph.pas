unit UnitAdviceGraph;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ExtCtrls, ComCtrls, MenuBar, ToolWin, StdCtrls,
  TeeProcs, TeEngine, Chart, DbChart, Series;

type
  TfrmAdviceGraph = class(TBaseFrm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBChart1: TDBChart;
    DBChart2: TDBChart;
    DBChart3: TDBChart;
    Series1: TPieSeries;
    Series2: TBarSeries;
    Series3: TPieSeries;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdviceGraph: TfrmAdviceGraph;

implementation

uses UnitDM, UnitSearchAdvice;

{$R *.dfm}

end.
