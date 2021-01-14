unit DecisionUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeeProcs, TeEngine, Chart, MXGRAPH, ExtCtrls, MXPIVSRC, MXDB,
  DB, DBTables, MXTABLES, Mxstore, Series, StdCtrls;

type
  TDecisionForm = class(TForm)
    DecisionCube1: TDecisionCube;
    DecisionQuery1: TDecisionQuery;
    DecisionSource1: TDecisionSource;
    DecisionPivot1: TDecisionPivot;
    DecisionGraph1: TDecisionGraph;
    Series3: TBarSeries;
    Button1: TButton;
    Series4: TBarSeries;
    Series1: TBarSeries;
    Series5: TBarSeries;
    Series6: TBarSeries;
    Series7: TBarSeries;
    Series8: TBarSeries;
    Series9: TBarSeries;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DecisionForm: TDecisionForm;

implementation

{$R *.dfm}

procedure TDecisionForm.Button1Click(Sender: TObject);
begin
  close;
end;

end.
