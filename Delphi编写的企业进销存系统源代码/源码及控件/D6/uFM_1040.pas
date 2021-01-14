unit uFM_1040;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_GRID, Db, DBTables, Grids, DBGrids, ExtCtrls, Buttons,
  DBCtrls, DBNavPlus, ToolWin, ComCtrls;

type
  TFM_1040 = class(TS_SingleDBGrid)
    Table1F01: TStringField;
    Table1F02: TStringField;
    Table1F03: TDateTimeField;
    Table1F04: TStringField;
    Table1F05: TStringField;
    Table1F06: TDateTimeField;
    Table1F07: TStringField;
    Table1BUSER: TStringField;
    Table1BTIME: TDateTimeField;
    Table1EUSER: TStringField;
    Table1ETIME: TDateTimeField;
    procedure Table1F01Validate(Sender: TField);
    procedure Table1F02Validate(Sender: TField);
    procedure DBGrid1EditButtonClick(Sender: TObject);override;
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure SB3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_1040: TFM_1040;

implementation
uses utilities,uDataBaseEValue, uFunction;
{$R *.DFM}

procedure TFM_1040.Table1F01Validate(Sender: TField);
begin
  inherited;
  EValue_IsNotNull(Sender);
end;

procedure TFM_1040.Table1F02Validate(Sender: TField);
begin
  inherited;
  EValue_IsNotNull(Sender);
end;

procedure TFM_1040.DBGrid1EditButtonClick(Sender: TObject);
begin
  inherited;
  if DBGrid1.SelectedField = Table1F03 then
    AssignDBDate(Sender,DataSource1,'F03' );
  if DBGrid1.SelectedField = Table1F06 then
    AssignDBDate(Sender,DataSource1,'F06' );
end;

procedure TFM_1040.Table1BeforePost(DataSet: TDataSet);
begin
  InforSave(DataSet);
  inherited;

end;

procedure TFM_1040.Table1AfterPost(DataSet: TDataSet);
begin
  inherited;
  InforDisplay(Dataset,'作业员基本资料');
end;

procedure TFM_1040.Table1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  InforDisplay(Dataset,'作业员基本资料');
end;

procedure TFM_1040.SB3Click(Sender: TObject);
begin
  inherited;
  xSearch_Data(Table1,1,[0,1,2,3,5]);
end;

end.
