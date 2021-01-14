unit C_Browse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Stand, DosMove, StdCtrls, Buttons, ExtCtrls, DBCtrls,
  DBNavPlus, DB, DBTables, Grids, DBGrids;

type
  TBrowseForm = class(TStandForm)
    cmbOption: TComboBox;
    cmbExpress: TComboBox;
    edtValue: TEdit;
    btnLoca: TBitBtn;
    qryMaster: TQuery;
    qryDetail: TQuery;
    dsMaster: TDataSource;
    dsDetail: TDataSource;
    dbgMaster: TDBGrid;
    dbgDetail: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BrowseForm: TBrowseForm;

implementation

{$R *.dfm}

end.
