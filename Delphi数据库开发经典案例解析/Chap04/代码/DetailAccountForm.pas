unit DetailAccountForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Grids, DBGrids, ExtCtrls, StdCtrls,
  Buttons, DB, ADODB, DBCtrls, Mask;

type
  TDetailAccount = class(TForm)
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Label4: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Button1: TButton;
    Button2: TButton;
    Label5: TLabel;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);



    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);


    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    
    
  private
    { Private declarations }
  public
    { Public declarations }
  //添加列表框中项目的函数
  procedure setlist();
  end;

var
  DetailAccount: TDetailAccount;

implementation

{$R *.dfm}

procedure TDetailAccount.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;


procedure TDetailAccount.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  //显示数据数量
  label2.Caption:=inttostr(adoquery1.RecordCount);
  //设置数据表宽度
  dbgrid1.Columns[0].Width:=80;
  dbgrid1.Columns[1].Width:=64;
  dbgrid1.Columns[2].Width:=64;
  dbgrid1.Columns[3].Width:=64;
  dbgrid1.Columns[4].Width:=64;
  dbgrid1.Columns[5].Width:=64;
  dbgrid1.Columns[6].Width:=64;
  dbgrid1.Columns[7].Width:=64;
  dbgrid1.Columns[8].Width:=64;
end;


//---------------首记录----------------
procedure TDetailAccount.ToolButton1Click(Sender: TObject);
begin
 datasource1.DataSet.First;
end;

//---------------上记录----------------
procedure TDetailAccount.ToolButton2Click(Sender: TObject);
begin
 datasource1.DataSet.Prior;
end;

//---------------下记录----------------
procedure TDetailAccount.ToolButton3Click(Sender: TObject);
begin
 datasource1.DataSet.Next;
end;

//---------------尾记录----------------
procedure TDetailAccount.ToolButton4Click(Sender: TObject);
begin
 datasource1.DataSet.Last;
end;

procedure TDetailAccount.ToolButton13Click(Sender: TObject);
begin
close;
end;

//----------查询数据并显示-------------
procedure TDetailAccount.BitBtn1Click(Sender: TObject);
begin
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select a.*,b.科目名称 from 本期明细帐簿 a,科目表 b where (a.科目代码 like ''%'+edit1.Text+'%'')and');
adoquery1.SQL.Add('(a.科目代码=b.科目代码)');
adoquery1.Open;
//清除设置的数据过滤器并重新设置列表
datasource1.DataSet.Filtered:=false;
setlist();

end;



procedure TDetailAccount.FormShow(Sender: TObject);

begin
  setlist();
end;

//-------------将数据集中已有的科目名称添加到列表中-------------
procedure TDetailAccount.setlist;
var
name:string;
begin
listbox1.Clear;
listbox2.Clear;
 while not adoquery1.Eof do
  begin
    name:=adoquery1.fieldbyname('科目名称').AsString;
    //如果列表中没有该名称则添加，若已有则不做动作
    if listbox1.Items.IndexOf(name)=-1 then
     listbox1.Items.Insert(listbox1.Items.Count,name);
    adoquery1.Next;
  end;
end;

//选中一个科目名称并允许将其添加到右边的列表中
procedure TDetailAccount.ListBox1Click(Sender: TObject);
begin
if listbox1.Items.Count<>0 then
button1.Enabled:=true;
end;

//选中一个科目名称，并允许从右边的列表中删除
procedure TDetailAccount.ListBox2Click(Sender: TObject);
begin
if listbox2.Items.Count<>0 then
button2.Enabled:=true;
end;

//-----在右边的列表中添加某一项----------
procedure TDetailAccount.Button1Click(Sender: TObject);
var
name:string;
begin
name:=listbox1.Items.Strings[listbox1.ItemIndex];
//若右边的列表框不存在该项再向其中添加
if listbox2.Items.IndexOf(name)=-1 then
listbox2.Items.Insert(listbox2.Items.Count,name);
//允许在表中根据选择的项进行显示
bitbtn2.Enabled:=true;
end;

//-----在右边的列表中删除某一项----------
procedure TDetailAccount.Button2Click(Sender: TObject);
begin
//若部为空，则可以将名称项从列表中删除
if listbox2.Items.Count<>0 then
listbox2.Items.Delete(listbox2.ItemIndex);
//若右边列表已空，则将按钮变灰
if listbox2.Items.Count=0 then
begin
button2.Enabled:=false;
bitbtn2.Enabled:=false;
end;
end;

//----------根据选择的项显示数据-----------
procedure TDetailAccount.BitBtn2Click(Sender: TObject);
var
filstr:string;
i:integer;
begin
filstr:='';
//根据列表中内容设置数据集的过滤项并设置
for i:=0 to listbox2.Count-1 do
 begin
   filstr:=filstr+'科目名称='''+listbox2.Items.Strings[i]+'''';
   if i<>listbox2.Count-1 then
   filstr:=filstr+' OR ';
 end;
datasource1.DataSet.Filter:=filstr;
datasource1.DataSet.Filtered:=true;
end;



end.




