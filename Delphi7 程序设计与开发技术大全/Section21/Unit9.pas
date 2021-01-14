unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, ComCtrls, Mask, DBCtrls;

type
  TForm9 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    DBGrid1: TDBGrid;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label4: TLabel;
    Edit4: TEdit;
    Button5: TButton;
    RadioGroup2: TRadioGroup;
    Edit6: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    DBCheckBox1: TDBCheckBox;
    DBEdit1: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    DBEdit2: TDBEdit;
    DBGrid2: TDBGrid;
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm9.TabSheet1Show(Sender: TObject);
begin  {设置书名字段为索引字段}
//datamodule2.BookTable.IndexFieldNames:='BookName';
end;

procedure TForm9.TabSheet2Show(Sender: TObject);
begin   {设置作者名字段为索引字段}
//datamodule2.BookTable.IndexFieldNames:='author';
end;

procedure TForm9.Button5Click(Sender: TObject);
begin     {根据书名关键字查询}
datamodule2.BookTable.Open;
datamodule2.BookTable.FindNearest([edit1.text]);
end;

procedure TForm9.Button1Click(Sender: TObject);
begin       {根据作者名查询}
datamodule2.BookTable.Open;
datamodule2.BookTable.FindNearest([edit4.text]);
end;

procedure TForm9.Button2Click(Sender: TObject);
var srecord:integer;
sstudno: string ;
sbookno: string ;
sordstno: string ;
begin {判断此图书是否已被预约}
if dbcheckbox1.checked=true then
begin
showmessage('该书已被其他同学预约，无法再次被借阅或预约! ');
radiogroup1.Enabled:=false;
button2.Enabled :=false;
end
else
begin {判断学号是否正确}
sstudno:=edit3.text;
datamodule2.studentTable.IndexFieldNames:='stuno';
datamodule2.studentTable.Open;
if not datamodule2.Studenttable.Findkey([sstudno]) then
begin
showmessage('学号错误! ');
edit6.Enabled :=false;
button6.Enabled := false;
end
else
begin
case radiogroup1.ItemIndex of
0: {图书被借阅的情况}
begin
{在借阅记录数据表格中插入一条新的借阅记录}
with datamodule2.RecordTable do
begin
open;
last;
srecord:=datamodule2.RecordTable.fieldbyname('recordno').asinteger + 1 ;
sstudno:=edit6.text;
sbookno:=dbedit2.text;
insert; {插入一条新记录并设置各字段值}
setfields([srecord,sstudno,sbookno,null,null,null,false,false]);
post;
showmessage('借阅成功! ');
end;
{修改图书记录数据表格中的相应记录}
with datamodule2.BookTable do
begin
sbookno:=dbedit2.text;
IndexFieldNames:='BookNo';
close;
readonly:=false;
Open;
FindKey([sbookno]); {指向此图书记录}
edit;
{修改此图书的图书记录}
setfields([nil,nil,nil,nil,nil,true,false]);
datamodule2.BookTable.Post;
showmessage('借阅成功! ');
end ;
end ;
1 : {预约图书}
begin
{修改图书记录数据表格中的相应记录}
with datamodule2.BookTable do
begin
sbookno:=dbedit2.text;
datamodule2.BookTable.close;
IndexFieldNames:='BookNo';
datamodule2.BookTable.readonly:=false ;
Open;
Findkey([sbookno]); {指向此图书记录}
edit ;
{修改此图书的图书记录的预约状态值}
setfields([nil,nil,nil,nil,nil,true,true]);
post;
end;
{在借阅记录数据表格中插入一条新的借阅记录}
with datamodule2.RecordTable do
begin
sordstno:=edit6.text;
IndexFieldNames:='BookNo';
Open;
Findkey([dbedit2.text]); {指向此图书的借阅记录}
edit ;
{修改此图书的借阅记录中的预约状态值}
setfields([nil,nil,nil,nil,nil,nil,true]);
post;
end ;
showmessage('预约成功! ');
end ;
end ;
end ;
end ;
end ;
procedure TForm9.Button3Click(Sender: TObject);
begin
edit6.clear;
edit6.Enabled :=true;
button6.Enabled :=True;
radiogroup2.Enabled:=true;
end;

procedure TForm9.Button4Click(Sender: TObject);
begin
modalresult:=mrok;
end;

procedure TForm9.Button6Click(Sender: TObject);
var srecord:integer;
sstudno: string ;
sbookno: string ;
sordstno : string ;
begin {判断此图书是否已被预约}
if dbcheckbox2.checked=true then
begin
showmessage('借阅成功! ');
//showmessage('该书已被其他同学预约，无法再次被借阅或预约! ');
radiogroup2.Enabled:=false;
button6.Enabled :=false;
end
else
begin {判断学号是否正确}
sstudno:=edit6.text;
datamodule2.studentTable.IndexFieldNames:='stuno';
datamodule2.studentTable.Open;
if not datamodule2.Studenttable.Findkey([sstudno]) then
begin
showmessage('学号错误! ');
edit6.Enabled :=false;
button6.Enabled := false;
end
else
begin
case radiogroup2.ItemIndex of
0: {图书被借阅的情况}
begin
{在借阅记录数据表格中插入一条新的借阅记录}
with datamodule2.RecordTable do
begin
open;
last;
srecord:=datamodule2.RecordTable.fieldbyname('recordno').asinteger + 1 ;
sstudno:=edit6.text;
sbookno:=dbedit2.text;
insert; {插入一条新记录并设置各字段值}
setfields([srecord,sbookno,sstudno,null,null,null,false,false]);
post;
end;
{修改图书记录数据表格中的相应记录}
with datamodule2.BookTable do
begin
sbookno:=dbedit2.text;
IndexFieldNames:='BookNo';
close;
readonly:=false;
Open;
FindKey([sbookno]); {指向此图书记录}
edit;
{修改此图书的图书记录}
setfields([nil,nil,nil,nil,nil,true,false]);
datamodule2.BookTable.Post;
showmessage('借阅成功! ');
end ;
end ;
1 : {预约图书}
begin
{修改图书记录数据表格中的相应记录}
with datamodule2.BookTable do
begin
sbookno:=dbedit2.text;
datamodule2.BookTable.close;
IndexFieldNames:='BookNo';
datamodule2.BookTable.readonly:=false ;
Open;
Findkey([sbookno]); {指向此图书记录}
edit ;
{修改此图书的图书记录的预约状态值}
setfields([nil,nil,nil,nil,nil,true,true]);
post;
end;
{在借阅记录数据表格中插入一条新的借阅记录}
with datamodule2.RecordTable do
begin
sordstno:=edit6.text;
IndexFieldNames:='BookNo';
Open;
Findkey([dbedit1.text]); {指向此图书的借阅记录}
edit ;
{修改此图书的借阅记录中的预约状态值}
setfields([nil,nil,nil,sstudno,nil,true,nil]);
post;
end ;
showmessage('预约成功! ');
end ;
end ;
end ;
end ;

end;

procedure TForm9.Button7Click(Sender: TObject);
begin
edit6.clear;
edit6.Enabled :=true;
button6.Enabled :=True;
radiogroup2.Enabled:=true;
end;

procedure TForm9.Button8Click(Sender: TObject);
begin
modalresult:=mrok;
end;

end.
