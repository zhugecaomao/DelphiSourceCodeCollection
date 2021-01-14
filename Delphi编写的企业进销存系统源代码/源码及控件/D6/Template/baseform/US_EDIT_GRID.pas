unit US_EDIT_GRID;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_EDIT, Grids_ts, TSGrid, TSDBGrid, Db, DBTables, StdCtrls,
  Mask, DBCtrls, ExtCtrls, Buttons, DBNavPlus, ComCtrls, ToolWin,
  ImgList, RXDBCtrl, ToolEdit, RxLookup, Grids, DBGrids;

type
  TS_SingleDBEdit_WithGrid = class(TS_SingleDBEdit)
    DBGrid1: TDBGrid;
    procedure Table1BeforeInsert(DataSet: TDataSet);
    procedure SB6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  S_SingleDBEdit_WithGrid: TS_SingleDBEdit_WithGrid;

implementation

{$R *.DFM}

procedure TS_SingleDBEdit_WithGrid.Table1BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if Self.ActiveControl = DBGrid1 then
  begin
    DBEdit1.SetFocus;
    if not DbEdit1.TabStop then SelectNext(DBEdit1,True,True);
  end;
end;

procedure TS_SingleDBEdit_WithGrid.SB6Click(Sender: TObject);
begin
  inherited;
 // Close;
end;

end.
