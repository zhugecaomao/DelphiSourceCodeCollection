unit uFM_1020A;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_GRID, Db, ExtCtrls, DBTables, Grids, DBGrids, Buttons,
  DBCtrls, DBNavPlus, ToolWin, ComCtrls;

type
  TFM_1020A = class(TS_SingleDBGrid)
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    Query1: TQuery;
    Query1F03: TStringField;
    Table1F01: TStringField;
    Table1F02: TStringField;
    Table1F03: TStringField;
    Table1F04: TStringField;
    Table1F05: TFloatField;
    Table1K_SN: TSmallintField;
    Table1F06: TDateTimeField;
    Table1F07: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure SB2Click(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);override;
    procedure Table1BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_1020A: TFM_1020A;

implementation
uses utilities, uRp_1020A;
{$R *.DFM}

procedure TFM_1020A.FormCreate(Sender: TObject);
begin
  inherited;
   Query1.Open;
end;

procedure TFM_1020A.SB2Click(Sender: TObject);
begin
  inherited;
  if Application.FindComponent('Rp_1020A')=nil then
   Rp_1020A := TRp_1020A.Create(self);
   Rp_1020A.Preview;
end;

procedure TFM_1020A.DBGrid1EditButtonClick(Sender: TObject);
begin
  inherited;
   if DBGrid1.SelectedField = Table1F06 then
    AssignDBDate(Sender,DataSource1,'F06');
end;

procedure TFM_1020A.Table1BeforePost(DataSet: TDataSet);
begin
  QryExec(Qry1,'select Max(K_SN) from T1020A');
     Table1K_SN.AsInteger := Qry1.Fields[0].AsInteger + 1;
  inherited;

end;

end.
