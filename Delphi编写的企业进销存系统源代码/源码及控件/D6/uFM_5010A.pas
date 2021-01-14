unit uFM_5010A;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_GRID, Db, ExtCtrls, DBTables, Grids, DBGrids, Buttons,
  DBCtrls, DBNavPlus, ToolWin, ComCtrls;

type
  TFM_5010A = class(TS_SingleDBGrid)
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    Query1: TQuery;
    DataSource2: TDataSource;
    Query1F03: TStringField;
    Table1F01: TStringField;
    Table1F02: TStringField;
    Table1F03: TStringField;
    Table1F04: TStringField;
    Table1F05: TFloatField;
    Table1K_SN: TSmallintField;
    Table1F06: TDateTimeField;
    Table1F07: TStringField;
    procedure Table1F02Validate(Sender: TField);
    procedure FormCreate(Sender: TObject);
    procedure SB2Click(Sender: TObject);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure DBGrid1EditButtonClick(Sender: TObject);override;
    procedure Table1AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_5010A: TFM_5010A;

implementation
uses utilities,uDataBaseEValue, uFunction, uRp_5010A;

{$R *.DFM}

procedure TFM_5010A.Table1F02Validate(Sender: TField);
begin
  inherited;
  EValue_IsNotNull(Sender)
end;

procedure TFM_5010A.FormCreate(Sender: TObject);
begin
  inherited;
  Query1.Open;
end;

procedure TFM_5010A.SB2Click(Sender: TObject);
begin
  inherited;
  if Application.FindComponent('Rp_5010A')=nil then
    Rp_5010A := TRp_5010A.create(self);
    Rp_5010A.Preview;

end;

procedure TFM_5010A.Table1BeforePost(DataSet: TDataSet);
begin
  
  QryExec(Qry1,'select Max(K_SN) from T5010A');
     Table1K_SN.AsInteger := Qry1.Fields[0].AsInteger + 1;

 inherited;
end; 

procedure TFM_5010A.DBGrid1EditButtonClick(Sender: TObject);
begin
  inherited;
  if DBGrid1.SelectedField = Table1F06 then
    AssignDBDate(Sender,DataSource1,'F06');
end;

procedure TFM_5010A.Table1AfterPost(DataSet: TDataSet);
begin
  inherited;
  Table1.Refresh;
end;

end.
