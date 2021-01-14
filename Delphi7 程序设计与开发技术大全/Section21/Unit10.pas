unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, Mask, DBCtrls,DB;

type
   TForm10 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button2: TButton;
    Button3: TButton;
    DBGrid2: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;
     loc:boolean;
   //locOp:TLocateOptions;
implementation

uses Unit2;

{$R *.dfm}

procedure TForm10.Button1Click(Sender: TObject);
{查询个人借阅情况}
var studno:string;
begin
studno:=edit1.Text;
datamodule2.Studenttable.open;
{判断学生学号是否错误}
if not datamodule2.Studenttable.Findkey([edit1.text]) then
begin
showmessage('学号错误! ');
edit1.clear ;
edit1.SetFocus ;
end
else
begin
{设置Q u e r y组件的属性}
with datamodule2.query1 do
begin
close;
DatabaseName :='work';
DataSource :=datamodule2.RecordDS ;
SQL.clear; {设置S Q L属性让Q u e r y组件指向指定学号的借阅记录}
SQL.add( 'SELECT BookNo, Borrowdate,Returndate,Delayed');
SQL.add( 'FROM bRecord ');
SQL.add ('WHERE StuNo =+'''+studno+'''');
open;
end;
{设置B o o k Ta b l e组件的属性,建立它与Q u e r y组件之间的联系}
with datamodule2.BookTable do
begin
close;
DatabaseName := 'work';
IndexFieldNames := 'BookNo';
MasterFields := 'BookNo';
MasterSource := datamodule2.QueryDS ;
TableName := 'BookTable.db';
Active:=True ;
end ;
{设置D B E d i t 1属性,使之显示指定图书记录的书名}
with DBEdit1 do
begin
DataSource :=DataModule2.BookDS;
DataField :='BookName';
end ;
{设置D B E d i t 2属性,使之显示指定图书记录的作者名}
with DBEdit2 do
begin
DataSource := DataModule2.BookDS;
DataField := 'Author';
end ;
{设置D B E d i t 3属性,使之显示指定图书记录的出版社}
with DBEdit3 do
begin
DataSource := DataModule2.BookDS;
DataField := 'Publish';
end ;
{设置D B E d i t 4属性,使之显示需要归还图书记录的书号}
with DBEdit4 do
begin
DataSource := DataModule2.QueryDS;
DataField :='BookNo';
end ;
end ;
datamodule2.Studenttable.close;
end ;


procedure TForm10.Button2Click(Sender: TObject);
var sbookno: string;
snewstud:string;
begin
sbookno:=dbedit4.text;
with datamodule2.BookTable do
begin
close;
IndexFieldNames:='BookNo';
readonly:=false ;
open;
{根据书号让记录指针指向图书记录中此图书记录}
Findkey([sbookno]);
end;
{判断此图书是否被预约}
if datamodule2.BookTable.FieldByName('ordered').asboolean=true then
{如果此图书已被预约}
begin
with datamodule2.BookTable do
begin
edit; {修改图书记录中的借阅和预约状态字段值}
SetFields([nil,nil,nil,nil,false,true]);
post;
end;
with datamodule2.RecordTable do
begin
Open;
loc:=datamodule2.RecordTable.locate('BookNo',sbookno,[loPartialKey]);

{根据书号让记录指针指向借阅此图书的记录}
//Findkey([ sbookno]);
snewstud:= datamodule2.RecordTable.FieldByName('orderstu').AsString;
datamodule2.RecordTable.edit;
datamodule2.RecordTable.setfields([nil,nil,snewstud,null,null,null,false,false]);
datamodule2.RecordTable.post;
end;
end
else {如果图书未被预约}
begin
with datamodule2.BookTable do
begin
edit; {修改图书记录中的借阅和预约状态字段值}
SetFields([nil,nil,nil,nil,false,false]);
post;
end;
with datamodule2.RecordTable do
begin
//IndexFieldNames:='BookNo';
Open;
{根据书号让记录指针指向借阅此图书的记录}
Findkey([sbookno]);
Delete; {删除借阅此图书的记录}
post;
end;
end;
showmessage('已经完成图书归还! ');
end;

procedure TForm10.Button3Click(Sender: TObject);
begin
modalresult:=mrok;
end;

end.
