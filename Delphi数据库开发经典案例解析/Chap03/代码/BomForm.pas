unit BomForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons,MainForm,
  ToolWin, ExtCtrls;

type
  Tbom = class(TForm)
    TreeView1: TTreeView;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DBGrid1: TDBGrid;
    ADOQuery3: TADOQuery;
    DataSource1: TDataSource;
    ADOCommand1: TADOCommand;
    ToolBar1: TToolBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ToolButton1: TToolButton;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    ToolButton2: TToolButton;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    ToolButton3: TToolButton;
    BitBtn11: TBitBtn;
    BitBtn6: TBitBtn;
    Panel1: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    BitBtn12: TBitBtn;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    BitBtn13: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Memo1: TMemo;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
   
    

    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);

  private
    { Private declarations }
  public
    { Public declarations }
//标示按钮操作，用不同的值表示不同的草错
//insflag=1标识新增子项按钮被按下
//insflag=2表示新增同级项按钮被按下
//insflag=3表示修改按钮被按下
    insflag:integer;
//数据库中需求数量和损耗率为decimal，在sql操作中需要进行转换
 ratio,num:double;
//声明编写的函数和过程
    procedure showtree();
    function checknode(pnode:Ttreenode):integer;
 end;

type
//这个表用于保存树形图中各节点的详细数据
 Ttable=array[1..200,1..3] of string;
//这个表用于存储树形图各节点的节点位置
//与上一个表一起用来查询储存好的某个节点的数据
 Tnodetable=array[1..200] of TTreeNode;
var
  bom: Tbom;
  mytable:TTable;
  mynodetable:Tnodetable;
  

implementation

{$R *.dfm}

uses chooseForm;
//---------点窗体的X按钮时关闭窗体----------
procedure Tbom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

//--------显示窗体时就创建树形图-------
procedure Tbom.FormShow(Sender: TObject);
begin
  showtree();
end;

//----------自己编写的显示树形图的过程--------------
procedure Tbom.showtree();
var
pnode1,pnode,curnode:TTreenode;
pcode,code,pname,name:string;
i,count,order:integer;
begin
 //读入数据，刷新数据链接
 adoquery1.Close;
 adoquery1.SQL.Clear;
 adoquery1.SQL.Add('select a.*,b.* from 物料清单 a, 物料主文件 b');
 adoquery1.SQL.Add('where a.物料编号=b.物料编号');
 adoquery1.SQL.Add('order by a.低层码,a.父项编号');
 adoquery1.Open;

 //由于“全部产品”这一项数据不在物料清单表中，因此要从物料主文件中读入
 adoquery2.Close;
 adoquery2.SQL.Clear;
 adoquery2.SQL.Add('select 物料名称 from 物料主文件 where 物料编号=''0''');
 adoquery2.Open;

 //创建主节点‘全部产品’
 curnode:=treeview1.Items.AddFirst(nil,adoquery2.fieldbyname('物料名称').AsString);

  //逐个创建树形图中的子项
//order代表某个节点是第几个创建的
//这个编号也是该节点在mytable中的储存位置，初始化为0
 order:=0;

 //逐项读入数据
 while not adoquery1.Eof do
 begin
  //将父项编号等读入变量
  pcode:=adoquery1.fieldbyname('父项编号').AsString;
  code:=adoquery1.fieldbyname('物料编号').AsString;
  name:=adoquery1.fieldbyname('物料名称').AsString;

  //查找记录的父项编号所对应的物料名称
  adoquery2.Close;
  adoquery2.SQL.Clear;
  adoquery2.SQL.Add('select 物料名称 from 物料主文件 where 物料编号='''+pcode+'''');
  adoquery2.Open;
  pname:=adoquery2.fieldbyname('物料名称').AsString;
  //计算当前树形图中的总结点数目
  count:=treeview1.Items.Count;
  //从第一个节点开始，逐个检查其物料名称是否与要创建的节点的父项节点的物料名称相同
  //如相同，则在这个节点下创建子项
  for i:=1 to count do
   begin
   pnode1:=treeview1.Items.Item[i-1];
     if pnode1.Text=pname then
       begin
       //创建子节点
       pnode:=treeview1.Items.AddChild(pnode1,name);
       pnode.Expanded:=true;
       //根据创建顺序储存数据信息
       order:=order+1;
       mytable[order,1]:=pcode;
       mytable[order,2]:=code;
       mytable[order,3]:=name;
       //储存树节点的节点数据
       mynodetable[order]:=pnode;

       end;
   end;
   //处理下一条记录
 adoquery1.Next;
 end;
end;

//----------显示在树形图中选中的节点的物料清单数据------
procedure Tbom.TreeView1Click(Sender: TObject);
var
pcode,code,name,temp:string;
i:integer;
begin
//如选择的是首节点，则读入产品信息
if treeview1.Selected.Parent=nil then
 begin
 adoquery3.Close;
 adoquery3.SQL.Clear;
 adoquery3.SQL.Add('select a.*,b.* from 物料主文件 a,物料清单 b');
 adoquery3.SQL.Add('where (a.物料编号=b.物料编号)and(b.父项编号=''0'')');
 adoquery3.Open;
  edit1.Text:='0';
  edit2.Text:='全部产品';
  edit3.Text:='';
  edit4.Text:='';
  edit5.Text:='0';
  groupbox1.Caption:='全部产品';
 end
else
//如选择的是非首节点以外的节点，则读入相对应的物料清单信息
begin
//取得所选节点的数据在mytable中的位置
  i:=checknode(treeview1.Selected);
//从储存表中读入详细数据
 pcode:=mytable[i,1];
 code:=mytable[i,2];
 name:=mytable[i,3];

 //根据节点是否有子节点，给予sql不同的语句进行查询
 adoquery3.Close;
 adoquery3.SQL.Clear;
 //如选取得节点有子节点，则表中显示的是它的子项信息
 if treeview1.Selected.HasChildren then
  begin
  adoquery3.SQL.Add('select a.*,b.* from 物料主文件 a,物料清单 b where (a.物料编号=b.物料编号)');
  adoquery3.SQL.Add('and(b.父项编号='''+code+''')');
  temp:='下属的物料清单';
  end
  else
//如果没有子节点，则显示它自己的信息
  begin
  adoquery3.SQL.Add('select a.*,b.* from 物料主文件 a,物料清单 b where (a.物料编号=b.物料编号)');
  adoquery3.SQL.Add('and(b.物料编号='''+code+''')');
  adoquery3.SQL.Add('and(b.父项编号='''+pcode+''')');
  temp:='无下属零件';
  end;
  adoquery3.Open;
  //在窗体的文本框中显示选中的节点的信息
  edit1.Text:=code;
  edit2.Text:=name;
  edit3.Text:=pcode;
  edit4.Text:=dbgrid1.Fields[11].AsString;
  edit5.Text:=inttostr(treeview1.Selected.level);
  memo1.Text:=adoquery3.fieldbyname('其它事项').AsString;
  edit9.Text:=adoquery3.fieldbyname('领料车间').AsString;
  edit10.Text:=adoquery3.fieldbyname('领料库房').AsString;
  edit11.Text:=adoquery3.fieldbyname('损耗率').AsString;
  edit12.Text:=adoquery3.fieldbyname('审核日期').AsString;
  groupbox1.Caption:=copy(name,1,16)+temp;
end;



end;

//----------自行编写的函数-----------------------
//----用于从一个储存节点的表中查找某个节点的详细在mytable中的储存位置-----
function Tbom.checknode(pnode:TTreeNode):integer;
var
i:integer;
begin
 for i:=1 to treeview1.Items.Count-1 do
  if pnode=mynodetable[i] then
   begin
   checknode:=i;
   end;
end;





//--------------首记录---------------------
procedure Tbom.BitBtn1Click(Sender: TObject);
begin
 datasource1.DataSet.First;
end;

//--------------上一条记录---------------------
procedure Tbom.BitBtn2Click(Sender: TObject);
begin
 datasource1.DataSet.Prior;
end;

//--------------下一条记录---------------------
procedure Tbom.BitBtn3Click(Sender: TObject);
begin
datasource1.DataSet.Next;
end;

//--------------尾记录---------------------
procedure Tbom.BitBtn4Click(Sender: TObject);
begin
datasource1.DataSet.Last;
end;

//----------------新增子项---------------------------------
procedure Tbom.BitBtn5Click(Sender: TObject);

begin

//标识新增子项按钮被按下
insflag:=1;
//清空文本框中的内容
edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
edit5.Clear;
edit9.Clear;
edit10.Clear;
edit11.Clear;
edit12.Clear;
//将搜寻按钮置为可用状态，同样对其它按钮进行设置
bitbtn13.Enabled:=true;
bitbtn1.Enabled:=false;
bitbtn2.Enabled:=false;
bitbtn3.Enabled:=false;
bitbtn4.Enabled:=false;
bitbtn5.Enabled:=false;
bitbtn6.Enabled:=false;
bitbtn7.Enabled:=false;
bitbtn8.Enabled:=false;
bitbtn9.Enabled:=true;
bitbtn10.Enabled:=true;
//允许修改文本框中的内容
edit4.ReadOnly:=false;
edit9.ReadOnly:=false;
edit10.ReadOnly:=false;
edit11.ReadOnly:=false;
edit12.ReadOnly:=false;
end;

//----------------新增同级项------------------------------
procedure Tbom.BitBtn6Click(Sender: TObject);
begin

//标识新增同级项按钮被按下
insflag:=2;
//清空文本框中的内容
edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
edit5.Clear;
edit9.Clear;
edit10.Clear;
edit11.Clear;
edit12.Clear;
memo1.Clear;
//将搜寻按钮置为可用状态，同样对其它按钮进行设置
bitbtn13.Enabled:=true;
bitbtn1.Enabled:=false;
bitbtn2.Enabled:=false;
bitbtn3.Enabled:=false;
bitbtn4.Enabled:=false;
bitbtn5.Enabled:=false;
bitbtn6.Enabled:=false;
bitbtn7.Enabled:=false;
bitbtn8.Enabled:=false;
bitbtn9.Enabled:=true;
bitbtn10.Enabled:=true;
//允许修改文本框中的内容
edit4.ReadOnly:=false;
edit9.ReadOnly:=false;
edit10.ReadOnly:=false;
edit11.ReadOnly:=false;
edit12.ReadOnly:=false;
end;



//--------------删除数据----------------------
procedure Tbom.BitBtn8Click(Sender: TObject);
begin
//询问用户，确认删除
 if treeview1.Selected.HasChildren then
  showmessage('请先删除该项所属的全部子项')
 else
  begin
  //删除数据
  adocommand1.CommandText:='delete from 物料清单 where (物料编号='''+edit1.Text+''')and(父项编号='''+edit3.Text+''')';
  if application.MessageBox('确实删除该条数据？','删除',MB_OKCANCEL)=ID_OK then
  begin
  adocommand1.Execute;
  //重新绘制树形图
  treeview1.Items.Clear;
  showtree();
  end;
  end;

end;

//--------修改数据------------------------
procedure Tbom.BitBtn7Click(Sender: TObject);
begin
//标识修改项按钮被按下
insflag:=3;
//将相应按钮置为可用状态
bitbtn1.Enabled:=false;
bitbtn2.Enabled:=false;
bitbtn3.Enabled:=false;
bitbtn4.Enabled:=false;
bitbtn5.Enabled:=false;
bitbtn6.Enabled:=false;
bitbtn7.Enabled:=false;
bitbtn8.Enabled:=false;
bitbtn9.Enabled:=true;
bitbtn10.Enabled:=true;
//允许修改文本框中的内容
edit4.ReadOnly:=false;
edit9.ReadOnly:=false;
edit10.ReadOnly:=false;
edit11.ReadOnly:=false;
edit12.ReadOnly:=false;
//提醒用户与物料有关的信息应该在物料主文件中修改
showmessage('物料编号，物料名称等内容请在物料主文件中修改');
end;

//-------------调出子窗体，选择物料--------------------
procedure Tbom.BitBtn13Click(Sender: TObject);
var
newform:Tchoose;
begin

main.bomflag:=1;
newform:=Tchoose.Create(application);
//将本窗口灰化
self.Enabled:=false;
end;

//---------窗体恢复时，读入存在主窗体公共变量中的数据--------------
procedure Tbom.FormActivate(Sender: TObject);
var
i:integer;
begin
//如果是新增子项按钮被按下，则将从物料主文件中选取得零件的编号
//名称等信息送到BOM窗口中，并初始化一些数据
 if insflag=1 then
  begin
  edit1.Text:=main.str;
  edit2.Text:=main.str2;
  edit4.Text:='0.0';
  edit11.Text:='0.0';
  if treeview1.Selected.Parent=nil then
  edit3.Text:='0'
  else
  begin
  i:=checknode(treeview1.Selected);
  edit3.Text:=mytable[i,2];
  end;
  edit5.Text:=inttostr(treeview1.Selected.Level+1);
 end;
//如果是新增同级项按钮被按下，则处理方法与新增子项相同，但父项编号和低层码有变化
 if insflag=2 then
  begin
  edit1.Text:=main.str;
  edit2.Text:=main.str2;
  edit4.Text:='0.0';
  edit11.Text:='0.0';
  if treeview1.Selected.Parent=nil then
  begin
  edit3.Text:='0';
  edit5.Text:=inttostr(treeview1.Selected.Level+1);
  showmessage('不允许为"全部产品"添加同级项')
  end
  else
  begin
  i:=checknode(treeview1.Selected);
  edit3.Text:=mytable[i,1];
  edit5.Text:=inttostr(treeview1.Selected.Level);
  end;
 end;

end;

//------------保存对数据所作的修改-------------------
procedure Tbom.BitBtn9Click(Sender: TObject);
begin
//由于损耗率和数量在数据库中以decimal存储，因此需要将他们转换一遍
  ratio:=strtofloat(edit11.Text);
  num:=strtofloat(edit4.text);
//对新增子项或同级项操作的处理
if (insflag=1)or(insflag=2) then
  adocommand1.CommandText:='insert into 物料清单([父项编号], [物料编号], [需要数量], [低层码],[领料车间],[领料库房],[损耗率],[审核日期],[其它事项]) values('''+edit3.Text+''','''+edit1.Text+''','''+floattostr(num)+''','''+edit5.Text+''','''+edit9.Text+''','''+edit10.Text+''','''+floattostr(ratio)+''','''+edit12.Text+''','''+memo1.Text+''')';
//对修改操作的处理
if insflag=3 then
  adocommand1.CommandText:='update 物料清单 set [需要数量]='''+floattostr(num)+''',[领料车间]='''+edit9.Text+''',[领料库房]='''+edit10.Text+''',[损耗率]='''+floattostr(ratio)+''',[审核日期]='''+edit12.Text+''',[其它事项]='''+memo1.Text+''' where (物料编号='''+edit1.Text+''')and(父项编号='''+edit3.Text+''')';
adocommand1.Execute;

//清除现有树形图，重新绘制
treeview1.Items.Clear;
showtree();
//清除操作标识
insflag:=0;
//恢复按钮功能
bitbtn13.Enabled:=false;
bitbtn1.Enabled:=true;
bitbtn2.Enabled:=true;;
bitbtn3.Enabled:=true;
bitbtn4.Enabled:=true;
bitbtn5.Enabled:=true;
bitbtn6.Enabled:=true;
bitbtn7.Enabled:=true;
bitbtn8.Enabled:=true;
bitbtn9.Enabled:=false;
bitbtn10.Enabled:=false;
//不允许修改文本框中的内容
edit4.ReadOnly:=true;
edit9.ReadOnly:=true;
edit10.ReadOnly:=true;
edit11.ReadOnly:=true;
edit12.ReadOnly:=true;
end;

//---------------取消操作-------------------------
procedure Tbom.BitBtn10Click(Sender: TObject);
begin
//清除操作标识
insflag:=0;
//清空文本框中的内容
edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
edit5.Clear;
edit9.Clear;
edit10.Clear;
edit11.Clear;
edit12.Clear;
memo1.Clear;
//恢复按钮功能
bitbtn13.Enabled:=false;
bitbtn1.Enabled:=true;
bitbtn2.Enabled:=true;;
bitbtn3.Enabled:=true;
bitbtn4.Enabled:=true;
bitbtn5.Enabled:=true;
bitbtn6.Enabled:=true;
bitbtn7.Enabled:=true;
bitbtn8.Enabled:=true;
bitbtn9.Enabled:=false;
bitbtn10.Enabled:=false;
//不允许修改文本框中的内容
edit4.ReadOnly:=true;
edit9.ReadOnly:=true;
edit10.ReadOnly:=true;
edit11.ReadOnly:=true;
edit12.ReadOnly:=true;
end;

//---------------查询数据--------------------
procedure Tbom.BitBtn12Click(Sender: TObject);
begin
adoquery3.Close;
adoquery3.SQL.Clear;
adoquery3.SQL.Add('select a.*,b.* from 物料清单 a,物料主文件 b where (a.父项编号 like ''%'+edit6.Text+'%'')and');
adoquery3.SQL.Add('(b.物料名称 like ''%'+edit7.Text+'%'')and(b.拼音编码 like ''%'+edit8.Text+'%'')');
adoquery3.SQL.Add('and(a.物料编号=b.物料编号)');
adoquery3.Open;


end;

//------在文本框中按下enter键执行查询-------------
procedure Tbom.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 bitbtn12.Click;
end;

procedure Tbom.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 bitbtn12.Click;
end;

procedure Tbom.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 bitbtn12.Click;
end;

//-----------关闭窗体--------------------
procedure Tbom.BitBtn11Click(Sender: TObject);
begin
close;
end;

procedure Tbom.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  //设置表中列的宽度
  dbgrid1.Columns[0].Width:=80;
  dbgrid1.Columns[1].Width:=100;
  dbgrid1.Columns[2].Width:=64;
  dbgrid1.Columns[3].Width:=64;
  dbgrid1.Columns[4].Width:=64;
  dbgrid1.Columns[5].Width:=64;
  dbgrid1.Columns[6].Width:=64;
  dbgrid1.Columns[7].Width:=64;
  dbgrid1.Columns[8].Width:=64;
  dbgrid1.Columns[9].Width:=64;
  dbgrid1.Columns[10].Width:=64;
  dbgrid1.Columns[11].Width:=64;
end;

end.
