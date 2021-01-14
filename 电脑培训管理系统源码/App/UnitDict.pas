unit UnitDict;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDBForm, DB, ComCtrls, DBCtrls, ExtCtrls, MenuBar, ToolWin,
  StdCtrls, Grids, DBGrids;

type
  TfrmDict = class(TBaseDBFrm)
    DS: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    cbDict: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure cbDictClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDict: TfrmDict;

implementation

uses UnitData, UnitDM;

{$R *.dfm}

procedure TfrmDict.FormShow(Sender: TObject);
begin
  inherited;
cbDict.Items.Clear;
cbDict.Items.Add('0—有效标志表');
cbDict.Items.Add('1—培训种类表');
cbDict.Items.Add('2—职业表');
cbDict.Items.Add('3—学历表');
cbDict.Items.Add('4—学员状态表');
cbDict.Items.Add('5—人员类型表');
cbDict.Items.Add('6—省、市、区表');
cbDict.Items.Add('7—部门表');
cbDict.Items.Add('8—职位表');
cbDict.Items.Add('9—性别表');
cbDict.Items.Add('10—生肖表');
cbDict.Items.Add('11—星座表');
cbDict.Items.Add('12—天气表');


cbDict.ItemIndex:=0;
DS.DataSet:=DM.T_FLAG;
DS.DataSet.Active:=true;
end;

procedure TfrmDict.ToolButton4Click(Sender: TObject);
begin
  inherited;
if DN.DataSource.DataSet.State in[dsEdit,dsInsert] then
    DN.DataSource.DataSet.Post;

end;

procedure TfrmDict.cbDictClick(Sender: TObject);
begin
  inherited;
DS.DataSet.Close;
case cbDict.ItemIndex of
    0:begin
//0—有效标志表 T_FLAG
        DS.DataSet:=DM.T_FLAG;
    end;
    1:begin
//1—培训种类表 T_KIND
        DS.DataSet:=DM.T_KIND;
    end;
    2:begin
//2—职业表 T_JOB
        DS.DataSet:=DM.T_JOB;
    end;
    3:begin
//3—学历表 T_KNOWLEDGE
        DS.DataSet:=DM.T_KNOWLEDGE;
    end;
    4:begin
//4—学员状态表 T_STATE
        DS.DataSet:=DM.T_STATE;
    end;
    5:begin
//5—人员类型表 T_XTYPE
        DS.DataSet:=DM.T_XTYPE;
    end;
    6:begin
//6—省、市、区表 T_SITE
        DS.DataSet:=DM.T_SITE;
    end;
    7:begin
//7—部门表 T_PART
        DS.DataSet:=DM.T_PART;
    end;
    8:begin
//8—职位表 T_ZW
        DS.DataSet:=DM.T_ZW;
    end;
    9:begin
//9—性别表 T_SEX
        DS.DataSet:=DM.T_SEX;
    end;
    10:begin
//10—生肖表 T_SX
        DS.DataSet:=DM.T_SX;
    end;
    11:begin
//11—星座表 T_STAR
        DS.DataSet:=DM.T_STAR;
    end;
    12:begin
//12—天气表 T_WEATHER
        DS.DataSet:=DM.T_WEATHER;
    end;
end;
DS.DataSet.Open;
end;

procedure TfrmDict.ToolButton1Click(Sender: TObject);
var
    ii:integer;
begin
  inherited;
if DN.DataSource.DataSet.State in[dsEdit,dsInsert] then
for ii:=0 to DS.DataSet.FieldCount-1 do
begin
    if UpperCase(DS.DataSet.Fields[ii].FieldName)='FLAG' then
    begin
        DS.DataSet.Fields.Fields[ii].AsString:='Y';
    end;
    if UpperCase(DS.DataSet.Fields[ii].FieldName)='OPERATOR' then
    begin
        DS.DataSet.Fields.Fields[ii].AsString:=sOperator;
    end;

end;
end;

procedure TfrmDict.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
if UpperCase(Column.FieldName)='DETAIL'then
begin
    ShowDetail(Column);

end;
end;

end.
