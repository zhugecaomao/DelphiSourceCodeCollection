unit US_MD_GRID;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_GRID, ExtCtrls, DBTables, Db, Grids, DBGrids, Buttons,
  DBCtrls, DBNavPlus, ToolWin, ComCtrls;

type
  TS_MasterDetail_WithGrid = class(TS_SingleDBGrid)
    Table2: TTable;
    DataSource2: TDataSource;
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure Table1BeforeDelete(DataSet: TDataSet);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2EditButtonClick(Sender: TObject);
    procedure SB4Click(Sender: TObject);
    procedure Table2BeforePost(DataSet: TDataSet);
    procedure Table1BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    sDTbNm: String;     // 明细资料表名
    sDKeyFdNm: String;  // 明细键值字段名  
    { Public declarations }
  end;

var
  S_MasterDetail_WithGrid: TS_MasterDetail_WithGrid;

implementation

uses utilities, uDataBaseEValue;

{$R *.DFM}

procedure TS_MasterDetail_WithGrid.FormCreate(Sender: TObject);
begin
  Try
    Table2.Open;
  Except
    R_OkMessage(['资料表开启错误'],'',MB_ICONERROR);
  End;

  inherited;

  // 取得 Table2.TableName, 存入 sDTbNm 中
  sDTbNm := Table2.TableName;
  if Pos('.',sDTbNm)>0 then
    if Pos('dbo.',sDTbNm)=1 then Delete(sDTbNm,1,4)
      else Delete(sDTbNm, Pos('.',sDTbNm), 4);

  sDKeyFdNm := Table2.IndexFieldNames;
  if Pos(';',sDKeyFdNm) > 0 then
    sDKeyFdNm := Copy(sDKeyFdNm, 1, Pos(';',sDKeyFdNm)-1);
end;

procedure TS_MasterDetail_WithGrid.DBGrid1Enter(Sender: TObject);
begin
  inherited;
  DataSetPost(Table2);
  DBNavPlus1.DataSource := DataSource1;
  DBGrid1.Color := clWindow;
  DBGrid2.Color := $0099F2C6;
end;

procedure TS_MasterDetail_WithGrid.DBGrid1Exit(Sender: TObject);
begin
  inherited;
  if not Table1.IsEmpty then
  begin
    DataSetPost(Table1);
    DBNavPlus1.DataSource := DataSource2;
    DBGrid1.Color := $0099F2C6;
    DBGrid2.Color := clWindow;
  end;
end;

procedure TS_MasterDetail_WithGrid.Table1BeforeDelete(DataSet: TDataSet);
begin
  inherited;
  // 删除主档之前, 将对应明细档删除
  QryExec(Qry1, Format('Delete From %s Where %s=''%s''',[sDTbNm, sDKeyFdNm, DataSet.FieldByName(sKeyFdNm).AsString]),False);
end;

procedure TS_MasterDetail_WithGrid.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Case Key of
    vk_F4: DBGrid2EditButtonClick(Sender);
    vk_Return: Key := vk_Tab;
  end;
end;

procedure TS_MasterDetail_WithGrid.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = vk_F12 then
    if (Self.ActiveControl=DBGrid1) then
    begin
      DBGrid1.SetFocus;
      Key := 0;
    end
    else
    begin
      DBGrid2.SetFocus;
      Key := 0;
    end;
end;

procedure TS_MasterDetail_WithGrid.DBGrid2EditButtonClick(Sender: TObject);
begin
  inherited;
  // Press F4 Call this method
end;

procedure TS_MasterDetail_WithGrid.SB4Click(Sender: TObject);
begin
  inherited;
  if (DBGrid1.Align = alLeft) then
  begin
    DBGrid1.Align := alTop;
    Splitter1.Align := alTop;
    DBGrid1.Height := 150;
    SB4.Caption := '纵向';
  end
  else
  begin
    Splitter1.Align := alLeft;
    DBGrid1.Align := alLeft;
    DBGrid1.Width := 300;
    SB4.Caption := '横向';
  end;
end;

procedure TS_MasterDetail_WithGrid.Table2BeforePost(DataSet: TDataSet);
begin
  inherited;
  CheckFieldVal(DataSet);
end;

procedure TS_MasterDetail_WithGrid.Table1BeforePost(DataSet: TDataSet);
begin
  inherited;

  if (aOriValues[0] <> '') then
    if DataSet.FieldByName(sKeyFdNm).AsString <> aOriValues[0] then
    begin
       QryExec(Qry1, Format('Update %s set %s=''%s'' Where %s=''%s''',
                            [sDTbNm, sDKeyFdNm, DataSet.FieldByName(sKeyFdNm).AsString, sDKeyFdNm, aOriValues[0]]),False);
       Table2.Refresh;
    end;

end;

end.
