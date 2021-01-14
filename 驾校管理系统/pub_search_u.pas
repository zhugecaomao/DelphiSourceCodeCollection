unit pub_search_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  Tpub_search = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    search_Btn: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Database1: TDatabase;
    ComboBox1: TComboBox;
    Label1: TLabel;
    ok_Btn: TBitBtn;
    Query1: TQuery;
    exit_Btn: TBitBtn;
    procedure search_BtnClick(Sender: TObject);
    procedure ok_BtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure exit_BtnClick(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
    procedure myselect(mysql:string;frm_title:string); //初始化查询窗口的sql语句
  end;

var
  pub_search: Tpub_search;
  myarr :Variant;

implementation

uses public_var;

{$R *.dfm}

procedure Tpub_search.search_BtnClick(Sender: TObject);
var
filterstr:string;
begin
  if edit1.text<>'' then
  begin
     filterstr:=combobox1.text+'='+''''+edit1.Text+'''';
     query1.Filter:=filterstr;
     query1.Filtered:=true;
     dbgrid1.DataSource:=datasource1;
  end
  else
  begin
      query1.Filtered:=false;
      dbgrid1.DataSource:=datasource1;
  end;
end;

procedure Tpub_search.ok_BtnClick(Sender:TObject);
var
  i:integer;
  cls_name:string;
begin
    //把query字段的值赋给数组
    for i:=0 to query1.fieldcount-1 do
    begin
      cls_name:=query1.Fields[i].ClassName;
      if cls_name='TStringField' then
        myarr[i]:=query1.Fields[i].AsString;
      if cls_name='TIntegerField' then
        myarr[i]:=query1.Fields[i].AsInteger;
      if cls_name='TDateTimeField' then
        myarr[i]:=query1.Fields[i].AsDateTime;
      if cls_name='TBooleanField' then
        myarr[i]:=query1.Fields[i].AsBoolean;
    end;
    self.Close;
end;

procedure Tpub_search.myselect(mysql:string;frm_title:string);
var
  i:integer;
begin
  pub_search.Caption:=frm_title;
  query1.DatabaseName:='jx';
  query1.close;
  query1.sql.clear;
  query1.sql.add(mysql);
  query1.open;
  //初始化combobox1.items的值
  for i:=0 to query1.FieldCount-1 do
    combobox1.Items.Add(query1.Fields[i].FieldName);
  //根据query的字段个数生成动态数组维数
  myarr:=VarArrayCreate([0,query1.FieldCount-1],varVariant);
end;

procedure Tpub_search.FormShow(Sender: TObject);
begin
  ComboBox1.ItemIndex:=0;
end;

procedure Tpub_search.exit_BtnClick(Sender: TObject);
begin
  close;
end;

end.
