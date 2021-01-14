unit uFM_1060;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_GRID, DBTables, Db, Grids, DBGrids, ExtCtrls, Buttons,
  DBCtrls, DBNavPlus, ToolWin, ComCtrls;

type
  TFM_1060 = class(TS_SingleDBGrid)
    Table1F01: TStringField;
    Table1F02: TStringField;
    Table1F03: TStringField;
    Table1F04: TFloatField;
    Table1F05: TFloatField;
    Table1F06: TStringField;
    Table1F07: TFloatField;
    Table1F08: TStringField;
    Table1F09: TStringField;
    Table1BUSER: TStringField;
    Table1BTIME: TDateTimeField;
    Table1EUSER: TStringField;
    Table1ETIME: TDateTimeField;
    procedure Table1F01Validate(Sender: TField);
    procedure Table1F02Validate(Sender: TField);
    procedure Table1F04Validate(Sender: TField);
    procedure Table1F05Validate(Sender: TField);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Table1AfterCancel(DataSet: TDataSet);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure SB3Click(Sender: TObject);
    procedure SB2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_1060: TFM_1060;

implementation
 uses utilities,uDataBaseEValue, uFunction, uRp_1060;
{$R *.DFM}

procedure TFM_1060.Table1F01Validate(Sender: TField);
begin
  inherited;
  EValue_IsNotNull(Sender);
end;

procedure TFM_1060.Table1F02Validate(Sender: TField);
begin
  inherited;
  EValue_IsNotNull(Sender);
end;

procedure TFM_1060.Table1F04Validate(Sender: TField);
begin
  inherited;
  EValue_IsNotNull(Sender);
end;

procedure TFM_1060.Table1F05Validate(Sender: TField);
begin
  inherited;
  EValue_IsNotNull(Sender);
end;

procedure TFM_1060.Table1BeforePost(DataSet: TDataSet);
begin
//把建档人,修改人,建档时间,修改时间存入资料表;
  InforSave(DataSet);
  inherited;

end;

procedure TFM_1060.Table1AfterPost(DataSet: TDataSet);
begin
  inherited;
  DBGrid1.Columns[3].ReadOnly := True;
  InforDisplay(DataSet,'物料仓');
end;

procedure TFM_1060.Table1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  InforDisplay(DataSet,'物料仓');
end;

procedure TFM_1060.FormCreate(Sender: TObject);
begin
  inherited;
  iRefreshDSCnt := 1;
end;

procedure TFM_1060.FormShow(Sender: TObject);
begin
  inherited;
  asRefreshDSNm[0] := 'Q_T1060';
end;

procedure TFM_1060.Table1AfterCancel(DataSet: TDataSet);
begin
  inherited;
  DBGrid1.Columns[3].ReadOnly := True;
end;

procedure TFM_1060.Table1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  DBGrid1.Columns[3].ReadOnly := false; // 新增后,可输入<库存量>
end;

procedure TFM_1060.SB3Click(Sender: TObject);
begin
  inherited;
  xSearch_Data(Table1,1,[0,1,2,3,4,5,6]);
end;

procedure TFM_1060.SB2Click(Sender: TObject);
begin
  inherited;
   if Application.FindComponent('Rp_1060')=nil then
     Rp_1060 := TRp_1060.Create(self);
     Rp_1060.Preview;
end;

end.
