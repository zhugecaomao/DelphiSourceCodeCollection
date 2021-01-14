unit US_GRID;

{ SingleDBGrid Form :
  一. 控制内容
      (1). 自动编号

  二. 调用注意事项 :
      (1). 在 Form Create 中设置 iAutoNoType := 1, 指定 Table 为简单的整型自动方式
           若不需自动编号功能, 则不作赋值动作. 因 iAutoNoType 内定为 0;

}




interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uS_DB, DBTables, Db, Buttons, ExtCtrls, DBCtrls, DBNavPlus, ToolWin,
  ComCtrls, Grids, DBGrids;

type
  TS_SingleDBGrid = class(TS_DB)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject); virtual;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
   iAutoNoType : Integer;  // 自动编号类别: 1- iAutoNoType
    { Public declarations }
  end;

var
  S_SingleDBGrid: TS_SingleDBGrid;

implementation

uses utilities;

{$R *.DFM}

procedure TS_SingleDBGrid.Table1BeforePost(DataSet: TDataSet);
begin
  inherited;
  if (iAutoNoType = 1) and (DataSet.State = dsInsert) then
  Table1.FieldByName(sKeyFdNm).AsInteger := AutoSingleIntNo(Qry1,sTbNm,sKeyFdNm);
end;

procedure TS_SingleDBGrid.FormCreate(Sender: TObject);
begin
  inherited; 
  iAutoNoType := 0;
  sKeyFdNm := Table1.Fields[0].FieldName;
end;

procedure TS_SingleDBGrid.DBGrid1EditButtonClick(Sender: TObject);
begin
  inherited;
  // Called in tsDBGrid1KeyDown Where Press Key F4
end;

procedure TS_SingleDBGrid.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Case Key of
    vk_F4: DBGrid1EditButtonClick(Sender);
    // vk_Return: Key := vk_Tab;
  end;
end;



end.
