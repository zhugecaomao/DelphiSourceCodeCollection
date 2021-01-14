unit uFM_1100;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_GRID, DBTables, Db, Grids, DBGrids, ExtCtrls, Buttons,
  DBCtrls, DBNavPlus, ToolWin, ComCtrls;

type
  TFM_1100 = class(TS_SingleDBGrid)
    Table1F01: TStringField;
    Table1F02: TFloatField;
    Table1BUSER: TStringField;
    Table1BTIME: TDateTimeField;
    Table1EUSER: TStringField;
    Table1ETIME: TDateTimeField;
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_1100: TFM_1100;

implementation

uses uDM,uDataBaseEValue, uFunction;

{$R *.DFM}

procedure TFM_1100.Table1BeforePost(DataSet: TDataSet);
begin
  //把建档人,修改人,建档时间,修改时间存入资料表;
  InforSave(DataSet);
  inherited;
end;

procedure TFM_1100.Table1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  InforDisplay(DataSet,'币别设定');
end;

procedure TFM_1100.Table1AfterPost(DataSet: TDataSet);
begin
  inherited;
  InforDisplay(DataSet,'币别设定');
end;

end.
