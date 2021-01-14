unit Fcutline;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, TeeFunci, DB, ADODB,
  Mxstore, MXDB, MXGRAPH;

type
  Tcutline = class(TForm)
    Chart1: TChart;
    ADOQuery1: TADOQuery;
    Series1: TBarSeries;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  cutline: Tcutline;

implementation

uses fmain;
{$R *.dfm}

end.
