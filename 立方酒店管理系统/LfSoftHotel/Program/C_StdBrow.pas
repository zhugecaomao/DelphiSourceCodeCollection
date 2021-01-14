unit C_StdBrow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Stand, DosMove, StdCtrls, Buttons, ExtCtrls, DB, DBTables,
  Grids, DBGrids;

type
  TStdBrowForm = class(TStandForm)
    qryWork: TQuery;
    dsWork: TDataSource;
    cmbOption: TComboBox;
    cmbExpress: TComboBox;
    edtValue: TEdit;
    btnLoca: TBitBtn;
    btnPrint: TBitBtn;
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StdBrowForm: TStdBrowForm;

implementation

{$R *.dfm}

end.
