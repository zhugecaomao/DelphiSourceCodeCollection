unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, MXPIVSRC, Grids, MXGRID, Mxstore, MXDB, DB, DBTables,
  MXTABLES;

type
  TForm1 = class(TForm)
    DecisionQuery1: TDecisionQuery;
    DecisionSource1: TDecisionSource;
    DecisionCube1: TDecisionCube;
    DecisionGrid1: TDecisionGrid;
    DecisionPivot1: TDecisionPivot;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
