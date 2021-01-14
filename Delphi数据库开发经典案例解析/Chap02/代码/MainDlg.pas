unit MainDlg;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ComCtrls, ExtCtrls, DB, ADODB, DBCtrls, Grids, DBGrids, Mask;

type
  Tmain = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TreeView1: TTreeView;
    ADOQuery1: TADOQuery;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    DBGrid1: TDBGrid;
    ADOQuery2: TADOQuery;
    DBNavigator1: TDBNavigator;
    DataSource1: TDataSource;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    ADOTable1: TADOTable;
    DataSource2: TDataSource;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ComboBox1: TComboBox;
    Label9: TLabel;
    Edit8: TEdit;
    Label10: TLabel;
    Edit9: TEdit;
    Label11: TLabel;
    Edit10: TEdit;
    Label12: TLabel;
    ComboBox2: TComboBox;
    Label13: TLabel;
    Edit11: TEdit;
    Edit12: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Edit13: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Edit14: TEdit;
    ComboBox3: TComboBox;
    Label18: TLabel;
    Edit15: TEdit;
    Label19: TLabel;
    Edit16: TEdit;
    Label20: TLabel;
    Edit17: TEdit;
    Label21: TLabel;
    Edit18: TEdit;
    Label22: TLabel;
    Edit19: TEdit;
    Label23: TLabel;
    Edit20: TEdit;
    Label24: TLabel;
    Edit21: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBGrid3: TDBGrid;
    Panel3: TPanel;
    DataSource3: TDataSource;
    ADOQuery3: TADOQuery;
    Edit22: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    Edit23: TEdit;
    Label27: TLabel;
    Edit24: TEdit;
    Label28: TLabel;
    ComboBox4: TComboBox;
    Label29: TLabel;
    ComboBox5: TComboBox;
    Button4: TButton;
    PageControl3: TPageControl;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    ADOTable2: TADOTable;
    DataSource4: TDataSource;
    DBGrid4: TDBGrid;
    DBNavigator3: TDBNavigator;
    DBGrid5: TDBGrid;
    Panel4: TPanel;
    Edit25: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    Edit26: TEdit;
    Button5: TButton;
    DBNavigator4: TDBNavigator;
    Panel7: TPanel;
    Edit31: TEdit;
    Label36: TLabel;
    Button8: TButton;
    DBGrid8: TDBGrid;
    ADOQuery4: TADOQuery;
    DataSource5: TDataSource;
    DBEdit1: TDBEdit;
    Label37: TLabel;
    Label38: TLabel;
    DBEdit2: TDBEdit;
    Label39: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    Label58: TLabel;
    ADOCommand1: TADOCommand;
    Panel8: TPanel;
    Edit32: TEdit;
    Button9: TButton;
    Label59: TLabel;
    Label60: TLabel;
    Edit33: TEdit;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    DataSource6: TDataSource;
    DataSource7: TDataSource;
    DBNavigator5: TDBNavigator;
    Panel10: TPanel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    ADOTable3: TADOTable;
    ADOTable4: TADOTable;
    Panel5: TPanel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBNavigator6: TDBNavigator;
    Label61: TLabel;
    Edit27: TEdit;
    Button6: TButton;


    procedure TreeView1Click(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);

    

    procedure TabSheet2Show(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure TabSheet9Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure TabSheet7Show(Sender: TObject);
    




    
  private
    { Private declarations }
  public

    { Public declarations }
  end;
type
 Ttable=array[1..200,1..3] of string;
 //建立一个200行3列的字符串数组，储存在显示树形控件时从组织机构编码表中读出的机构编号等信息以供显示
var
  main: Tmain;
  mytable:Ttable;
 //初始化一个数组
implementation

{$R *.dfm}

//--------------------------------------------------------------------
//----------------机构设置及编码功能的实现----------------------------
//---------------------------------------------------------------------
procedure Tmain.Button12Click(Sender: TObject);
//完成树形图的显示
var
pnode:TTreeNode;
i:integer;
//pnode为树节点类型的变量
scode,scodel,sname:string;
ItemLevel,ParentIndex:integer;

begin
adoquery1.Open;
i:=1;
while not adoquery1.Eof do
begin
scode:=adoquery1.FieldByName('类别号').AsString;
scodel:=adoquery1.FieldByName('单位编号').AsString;
sname:=adoquery1.FieldByName('类别').AsString;
ItemLevel:=adoquery1.FieldByName('ItemLevel').AsInteger;
ParentIndex:=adoquery1.FieldByName('ParentIndex').AsInteger;
//将表中的数据按数据储存的绝对顺序AbsIndex排列依次取出
//按绝对顺序读出数据可以为本实例的完成提供许多方便
mytable[i,1]:=scode;
mytable[i,2]:=scodel;
mytable[i,3]:=sname;
i:=i+1;
//储存类别名，单位编号和类别到前面定义好的字符串数组中
if (ItemLevel=0) then
begin
treeview1.Items.AddFirst(nil,sname);
//如果是第一个节点，那么它没有父节点，其父节点是nil（空），创建第一个节点的数据
end
else
begin
pnode:=treeview1.Items.Item[ParentIndex];
treeview1.Items.AddChild(pnode,sname);
//根据记录的父节点属性，依次为所有记录创建树形图
end;
adoquery1.Next;
end;


end;



procedure Tmain.TreeView1Click(Sender: TObject);
//这个过程是为了在机构设置及编码窗体上显示鼠标在树控件上所选的某一节点的信息
var
temp:integer;
pnode:TTreeNode;
begin
edit1.Text:=treeview1.Selected.Text;
//显示当前所选取的节点的名称，也就是单位名
if treeview1.Selected.Parent.Index<>-1 then
edit2.Text:=treeview1.Selected.Parent.Text
else
edit2.Text:='省医药集团';
//显示当前选取节点的父节点的名称，也就是上级单位名
//如果当前选取的时节点时第一个主节点，则直接显示'省医药集团'
edit3.Text:=mytable[treeview1.Selected.AbsoluteIndex+1,2];
temp:=length(edit3.Text)-1;
temp:=round(temp/2);
edit27.Text:=inttostr(temp);
if treeview1.Selected.Parent.index<>-1 then
edit4.Text:=mytable[treeview1.Selected.Parent.AbsoluteIndex+1,2]
else
edit4.Text:='0';
//index是指某单元在该级别中的序号，而absolute则是在整个树中的绝对序号
//将储存在字符串数组中的，与当前节点相对应的信息提取出来，显示在窗体上
//上面五行代码是为了显示当前节点的编号和父节点的编号
//--------------------------------------------------------------------




button13.Enabled:=true;
button14.Enabled:=true;
button15.Enabled:=true;
button6.Enabled:=true;
//允许对某个所选取的节点进行删除，修改名称，增加子节点等功能

end;




procedure Tmain.Button13Click(Sender: TObject);
//在当前节点下，增加一个子节点
var
pnode:TTreeNode;

begin
pnode:=treeview1.Selected;
//pnode相当于一个指针，它指向当前用户所选取的节点
treeview1.Items.AddChild(pnode,pnode.Text);
//用这个命令为当前节点增加一个子节点
button16.Enabled:=true;
//允许保存所作的设置
//发送消息，提示用户保存
MessageBox(0,'请保存所作的修改，程序将自动为新节点重新编码','提示',MB_OK);
end;

//--------增加为同级节点------------------
procedure Tmain.Button6Click(Sender: TObject);
var
pnode:TTreeNode;
begin
//指向选中节点的父节点
  pnode:=treeview1.Selected.Parent;
if pnode=nil then
  MessageBox(0,'不允许为本级节点添加同级节点,操作被取消','注意!',MB_OK)
 else
  //在父节点上添加子节点，相当与添加同类节点
  begin
  treeview1.Items.AddChild(pnode,pnode.Text);
button16.Enabled:=true;
//允许保存所作的设置
//发送消息，提示用户保存
MessageBox(0,'请保存所作的修改，程序将自动为新节点重新编码','提示',MB_OK);
   end;

end;

procedure Tmain.Button14Click(Sender: TObject);
//删除当前节点
begin
treeview1.Selected.Delete;
button16.Enabled:=true;
//删除当前所选取的节点并允许保存所做的设置
end;
//-----------------------------------------------------------------------
procedure Tmain.Button15Click(Sender: TObject);
//修改当前所选取的节点名称
begin
treeview1.Selected.Text:=edit1.Text;
button16.Enabled:=true;
//用户从第一个编辑框中修改当前节点名称并提交修改
//允许保存所做的设置
end;

procedure Tmain.Button16Click(Sender: TObject);
//保存对树形图所作的全部设置
var
i,temp:integer;
name,number,absindex,itemindex,itemlevel,parentindex:string;
order,code,s,sp:string;
//上面的变量为节点的数据和循环控制变量
pnode:TTreeNode;
//树形图节点
begin
adocommand1.CommandText:='set IDENTITY_insert 组织机构编码表 on';
adocommand1.Execute;
//打开SQL SERVER中的组织机构编码表的插入许可
adocommand1.CommandText:='select * into zztemp from 组织机构编码表';
adocommand1.Execute;
//一般来讲，在对一个表做大的修改前都需要创建一个临时表，以保存备份
//根据用户需要可以从SQL SERVER中恢复该数据表或者在程序中编写SQL 语句
//将备份表的数据重新读入组织机构编码表中
adocommand1.CommandText:='delete from 组织机构编码表';
adocommand1.Execute;
//清空要操作的表
adocommand1.CommandText:='insert into 组织机构编码表([内部编号],[类别],[AbsIndex],[ItemIndex],[ItemLevel],[ParentIndex],[类别号],[单位编号],[单位名称]) values(''300'',''省医药集团'',''0'',''0'',''0'',''-1'',''0'',''0'',''省医药集团'')';
adocommand1.Execute;
//直接插入首项数据

for i:=2 to treeview1.Items.Count do
//用treeview1.items.count可以计算树控件中所有的节点数目
 begin
 pnode:=treeview1.Items.Item[i-1];
 //依次指向树形图的所有节点
 name:=pnode.Text;
 number:=inttostr(300+pnode.AbsoluteIndex);
 //内部编码设为从300开始，也可以设为读者愿意使用的任何整数
 absindex:=inttostr(pnode.AbsoluteIndex);
 itemindex:=inttostr(pnode.Index);
 parentindex:=inttostr(pnode.Parent.AbsoluteIndex);
 //为节点各项参数读入数据
 s:=inttostr(pnode.Index);
  if length(s)=1 then
   s:='0'+s
   else
   s:=s;
   order:=s;
   //取子项的本级编号Index,也就是类别号
   //由于类别号是两位整数，而本级编号小于10的节点的编号是1位整数
   //对其进行编码，把例如1的index转为字符串01
//-----------------------------------------------------------
//某一个节点的编号实际上是由它自己的类别号，也就是它在本级中的INDEX
//前面加上父节点的编号组成，而父节点的编号也可以用这种方法依次推出
while pnode.Parent<>nil do
 begin
   sp:=inttostr(pnode.Parent.Index);
   if length(sp)=1 then
   sp:='0'+sp
   else
   sp:=sp;
   s:=sp+s;
   pnode:=pnode.Parent;
   //节点的编号等于类别号前面加上它的父节点编号，也等于加上它的所有父节点的类别号
   //这里的加是指字符串加
   //取父节点的类别号，并一直追溯到最顶层的主节点，从而构成一个节点的完整编号
 end;
   code:=copy(s,2,length(s));

   //由于首项的编号为0，程序中将它转为了00，因此需要去掉一个零
   temp:=length(code)-1;
   temp:=round(temp/2);
   itemlevel:=inttostr(temp);
   //根据编号的长度来计算它的所属级别，也就是它的itemlevel
  adocommand1.CommandText:='insert into 组织机构编码表([内部编号],[类别],[AbsIndex],[ItemIndex],[ItemLevel],[ParentIndex],[类别号],[单位编号],[单位名称]) values('''+number+''','''+name+''','''+absindex+''','''+itemindex+''','''+itemlevel+''','''+parentindex+''','''+order+''','''+code+''','''+name+''')';
  adocommand1.Execute;
  //向表中插入新记录
 end;
 adocommand1.CommandText:='set IDENTITY_insert 组织机构编码表 off';
adocommand1.Execute;
//关掉组织机构编码表的插入许可
adocommand1.Commandtext:='drop table zztemp';
adocommand1.Execute;
//删除临时表
MessageBox(0,'对机构所作的修改已经保存成功！','成功',MB_OK);
//刷新树形图的显示
treeview1.Items.Clear;
adoquery1.Active:=false;
adoquery1.Active:=true;
button12.Click;
end;

 //------------------------------------------------------------
 //------------------机构信息管理功能的实现--------------------
 //-------------------------------------------------------------
procedure Tmain.TabSheet2Show(Sender: TObject);
//显示机构信息
begin
adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select 内部编号,单位编号,单位名称,拼音编码,单位地址,');
adoquery2.SQL.Add('单位电话号码,开户银行,帐号,开户全称 from 组织机构编码表');
adoquery2.Open;
//设置列宽度
dbgrid1.Columns[0].Width:=64;
dbgrid1.Columns[1].Width:=64;
dbgrid1.Columns[2].Width:=192;
dbgrid1.Columns[3].Width:=64;
dbgrid1.Columns[4].Width:=256;
dbgrid1.Columns[5].Width:=128;
dbgrid1.Columns[6].Width:=128;
dbgrid1.Columns[7].Width:=128;
dbgrid1.Columns[8].Width:=128;
end;

procedure Tmain.Button8Click(Sender: TObject);
begin
//查询机构信息
adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select 内部编号,单位编号,单位名称,拼音编码,单位地址,');
adoquery2.SQL.Add('单位电话号码,开户银行,帐号,开户全称 from 组织机构编码表');
adoquery2.SQL.Add('where 单位名称 like ''%'+edit31.Text+'%''');
adoquery2.Open;
//设置查询结果显示时的列宽度
dbgrid1.Columns[0].Width:=64;
dbgrid1.Columns[1].Width:=64;
dbgrid1.Columns[2].Width:=192;
dbgrid1.Columns[3].Width:=64;
dbgrid1.Columns[4].Width:=256;
dbgrid1.Columns[5].Width:=128;
end;

//--------------------------------------------------------------
//-----------------------职员信息管理功能的实现-----------------
//----------------------职员信息维护----------------------------

procedure Tmain.DBGrid2CellClick(Column: TColumn);
//将用户在dbgrid上所选取的职员的全部信息添加到职员信息维护窗体中的相应文本框中
begin

adotable1.Refresh;
edit5.Text:=dbgrid2.Fields[1].AsString;
edit6.Text:=dbgrid2.Fields[2].AsString;
edit7.Text:=dbgrid2.Fields[3].AsString;
combobox1.Text:=dbgrid2.Fields[4].AsString;
edit8.Text:=dbgrid2.Fields[5].AsString;
edit9.Text:=dbgrid2.Fields[6].AsString;
edit10.Text:=dbgrid2.Fields[7].AsString;
combobox2.Text:=dbgrid2.Fields[8].AsString;
edit11.Text:=dbgrid2.Fields[9].AsString;
edit12.Text:=dbgrid2.Fields[10].AsString;
edit13.Text:=dbgrid2.Fields[11].AsString;
combobox3.Text:=dbgrid2.Fields[12].AsString;
edit14.Text:=dbgrid2.Fields[13].AsString;
edit15.Text:=dbgrid2.Fields[14].AsString;
edit16.Text:=dbgrid2.Fields[15].AsString;
edit17.Text:=dbgrid2.Fields[16].AsString;
edit18.Text:=dbgrid2.Fields[18].AsString;
edit19.Text:=dbgrid2.Fields[17].AsString;
edit20.Text:=dbgrid2.Fields[19].AsString;
edit21.Text:=dbgrid2.Fields[20].AsString;

//允许修改，插入，删除记录
button1.Enabled:=true;
button2.Enabled:=true;
button3.Enabled:=true;

end;

//--------------修改所选取的职员的数据-------------
procedure Tmain.Button1Click(Sender: TObject);

var
intNum:integer;
begin
//读取选取的职员的内部编号
intNum:=dbgrid2.Fields[0].AsInteger;

//更新数据表
adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('update 职员基本信息表 set 职员编号='''+edit5.Text+'''');
adoquery2.SQL.Add(',姓名='''+edit6.Text+'''');
adoquery2.SQL.Add(',姓名简码='''+edit7.Text+'''');
adoquery2.SQL.Add(',性别='''+combobox1.text+'''');
adoquery2.SQL.Add(',出生日期='''+edit8.Text+'''');
adoquery2.SQL.Add(',年龄='''+edit9.Text+'''');
adoquery2.SQL.Add(',籍贯='''+edit10.Text+'''');
adoquery2.SQL.Add(',民族='''+combobox2.Text+'''');
adoquery2.SQL.Add(',文化程度='''+edit11.Text+'''');
adoquery2.SQL.Add(',毕业学校='''+edit12.Text+'''');
adoquery2.SQL.Add(',健康状况='''+edit13.Text+'''');
adoquery2.SQL.Add(',婚姻状况='''+combobox3.Text+'''');
adoquery2.SQL.Add(',身份证号码='''+edit14.Text+'''');
adoquery2.SQL.Add(',家庭电话='''+edit15.Text+'''');
adoquery2.SQL.Add(',办公电话='''+edit16.Text+'''');
adoquery2.SQL.Add(',手机='''+edit17.Text+'''');
adoquery2.SQL.Add(',电子邮件地址='''+edit19.Text+'''');
adoquery2.SQL.Add(',职工账号='''+edit18.Text+'''');
adoquery2.SQL.Add(',单位编号='''+edit20.Text+'''');
adoquery2.SQL.Add(',备注='''+edit21.Text+'''');
adoquery2.SQL.Add(' where 内部编号='''+inttostr(intNum)+'''');

adoquery2.SQL.Add('select 姓名 from 职员基本信息表 where 内部编号='''+inttostr(intNum)+'''');
adoquery2.Open;
//显示更新了数据的职员名，并发出更新成功的消息
label58.Caption:=adoquery2.fieldbyname('姓名').asstring+'的信息已经被成功修改';
//刷新dbgrid中的数据
adotable1.Active:=false;
adotable1.Active:=true;

end;

//------------删除记录---------------------------
procedure Tmain.Button2Click(Sender: TObject);
var
deleteName:string;
deleteNum:integer;
begin
//读入要删除记录的职员的姓名和职员编号
deleteName:=edit6.Text;
deleteNum:=dbgrid2.Fields[0].AsInteger;
//为保险起见，只有职员姓名和编号都符合时才能删除
adocommand1.CommandText:='delete from 职员基本信息表 where (内部编号='''+inttostr(deleteNum)+''')and(姓名='''+deleteName+''')';
adocommand1.Execute;
//显示删除成功的消息
MessageBox(0,'删除记录成功!','删除',MB_OK);
label58.Caption:=deleteName+'的记录已被成功删除';
//刷新dbgrid的数据
adotable1.Active:=false;
adotable1.Active:=true;

end;


//----------------插入新记录----------------------------
procedure Tmain.Button3Click(Sender: TObject);

var
MaxIntNum:integer;
TotalNum:integer;
begin

adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select max(内部编号) 最大编号,count(内部编号) 总人数 from 职员基本信息表');
adoquery2.Open;
//计算数据表中职员内部编号的最大值和总人数
//自动计算新插入的职员数据的内部编号
MaxIntNum:=adoquery2.FieldByName('最大编号').AsInteger;
TotalNum:=adoquery2.FieldByName('总人数').AsInteger;
adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select count(职员编号) 雷同编号 from 职员基本信息表 where 职员编号='''+edit5.Text+'''');
adoquery2.Open;
//判断输入的职员编号，如果输入的职员编号于已有的相同，则提示修改
if (adoquery2.FieldByName('雷同编号').AsInteger>0) then
 MessageBox(0,'职员编号与其他职员编号雷同!','Error!',MB_OK)
 else
 begin
 //不允许用户输入空的编号和姓名，如果输入为空，则提示错误
  if (edit5.Text='')or(edit6.Text='') then
  MessageBox(0,'姓名和编号不能为空!','Error!',MB_OK)
   else
   begin
    //打开职员基本信息表插入许可
    adocommand1.CommandText:='set IDENTITY_insert 职员基本信息表 on';
    adocommand1.Execute;
    //向表中插入新记录，这里只插入了不能为空的三项，后面用update语句来对它进行更新
    adocommand1.CommandText:='insert into 职员基本信息表([内部编号], [职员编号], [姓名]) values('''+inttostr(MaxIntNum+1)+''','+''''+edit5.Text+''','+''''+edit6.Text+''')';
    adocommand1.Execute;
    adoquery2.Close;
    adoquery2.SQL.Clear;
    //更新新插入的数据项，完成插入的功能
    adoquery2.SQL.Add('update 职员基本信息表 set 姓名简码='''+edit7.Text+'''');
    adoquery2.SQL.Add(',性别='''+combobox1.text+'''');
  adoquery2.SQL.Add(',出生日期='''+edit8.Text+'''');
  adoquery2.SQL.Add(',年龄='''+edit9.Text+'''');
  adoquery2.SQL.Add(',籍贯='''+edit10.Text+'''');
  adoquery2.SQL.Add(',民族='''+combobox2.Text+'''');
  adoquery2.SQL.Add(',文化程度='''+edit11.Text+'''');
  adoquery2.SQL.Add(',毕业学校='''+edit12.Text+'''');
  adoquery2.SQL.Add(',健康状况='''+edit13.Text+'''');
  adoquery2.SQL.Add(',婚姻状况='''+combobox3.Text+'''');
  adoquery2.SQL.Add(',身份证号码='''+edit14.Text+'''');
  adoquery2.SQL.Add(',家庭电话='''+edit15.Text+'''');
  adoquery2.SQL.Add(',办公电话='''+edit16.Text+'''');
  adoquery2.SQL.Add(',手机='''+edit17.Text+'''');
  adoquery2.SQL.Add(',电子邮件地址='''+edit19.Text+'''');
  adoquery2.SQL.Add(',职工账号='''+edit18.Text+'''');
  adoquery2.SQL.Add(',单位编号='''+edit20.Text+'''');
  adoquery2.SQL.Add(',备注='''+edit21.Text+'''');
  adoquery2.SQL.Add(' where 内部编号='''+inttostr(MaxIntNum+1)+'''');
  adoquery2.SQL.Add('select 姓名 from 职员基本信息表 where 内部编号='''+inttostr(MaxIntNum+1)+'''');
   adoquery2.Open;

   adoquery2.FieldByName('姓名').AsString;
//刷新dbgrid的数据并发送插入成功的消息
//label58就是放入的那个caption为空，用来显示消息的label控件
   label58.Caption:=adoquery2.fieldbyname('姓名').asstring+'的信息已经被成功插入';
    adotable1.Active:=false;
    adotable1.Active:=true;
//别忘了关掉插入许可
        adocommand1.CommandText:='set IDENTITY_insert 职员基本信息表 off';
    adocommand1.Execute;

   end;
end;


end;

 //--------------------------------------------------------------
//-----------------------职员信息管理功能的实现-----------------
//----------------------职员信息查询----------------------------

procedure Tmain.Button4Click(Sender: TObject);
begin
//这里是从两个表中查询数据，请注意其中逻辑运算符的使用方法和通配符的使用
  adoquery3.Close;
  adoquery3.SQL.Clear;
  adoquery3.SQL.Add('select a.姓名,a.性别,a.出生日期,a.籍贯,a.民族,b.单位名称,a.办公电话,a.婚姻状况,a.文化程度 from 职员基本信息表 a,组织机构编码表 b');
  adoquery3.sql.add('where (a.单位编号=b.单位编号)and((姓名 like ''%'+edit22.text+'%'')and');
  adoquery3.SQL.Add('(姓名简码 like ''%'+edit23.Text+'%'')and');
  adoquery3.SQL.Add('(籍贯 like ''%'+edit24.Text+'%'')and');
  adoquery3.SQL.Add('(民族 like ''%'+combobox5.Text+''')and');
  adoquery3.SQL.Add('(性别 like ''%'+combobox4.Text+'''))');
  adoquery3.Open

end;
//-----------窗体显示时，将表中所有数据显示出来-----------
procedure Tmain.TabSheet3Show(Sender: TObject);
begin
button4.Click;
end;



//--------------------------------------------------------------------------------
//----------------------薪资福利管理功能的实现-----------------------------------
//-----------------工资发放历史查询,个人所得税率表显示，职员奖惩管理------------


procedure Tmain.Button5Click(Sender: TObject);
//工资发放历史查询
var
i:integer;
begin
  adoquery3.Close;
  adoquery3.SQL.Clear;
  adoquery3.SQL.Add('select b.姓名,a.* from 工资发放历史表 a,职员基本信息表 b ');
  adoquery3.SQL.Add('where (a.职员编号=b.职员编号)and((b.姓名 like ''%'+edit26.Text+'%'')and');
  adoquery3.SQL.Add('(a.日期 like ''%'+edit25.Text+'%''))');
  adoquery3.Open;
  //设置表的宽度
    for i:=3 to 29 do
    dbgrid5.Columns[i].Width:=64;

end;

procedure Tmain.TabSheet9Show(Sender: TObject);
 //显示时列出表中所有数据，相当于输入空值进行查询
begin
button5.Click;
end;


//-------------------------当月工资管理------------------------------------------
//---------设置表中的字段的宽度------------
procedure Tmain.TabSheet7Show(Sender: TObject);
begin
dbgrid8.Columns[0].Width:=80;
dbgrid8.Columns[1].Width:=80;
dbgrid8.Columns[2].Width:=86;
dbgrid8.Columns[3].Width:=86;
dbgrid8.Columns[4].Width:=86;
dbgrid8.Columns[5].Width:=80;
dbgrid8.Columns[6].Width:=80;
dbgrid8.Columns[7].Width:=80;
dbgrid8.Columns[8].Width:=80;

end;
 
 //---------读取工资的历史纪录---------------------------------
procedure Tmain.Button9Click(Sender: TObject);
//利用SQL 建库时的脚本，实现月工资统计表的形成
begin
//检查输入的要导入数据的月份和将导入数据的当前月份，如果为空，则提示重新输入
 if (edit32.text='')or(edit33.text='') then
   MessageBox(0,'输入不能为空!','错误',MB_OK)

//检查输入的时间的格式
   else if (length(edit32.Text)<>6)or(length(edit33.Text)<>6) then
    MessageBox(0,'输入应如''200301''格式!','错误',MB_OK)

    else
    begin
//形成当月工资统计表
     adocommand1.CommandText:='exec sf_形成月工资统计表 '''+edit32.Text+''','''+edit33.Text+'''';
     adocommand1.Execute;
     //刷新数据
     adoquery4.Active:=false;
     adoquery4.Active:=true;

    end;

end;
//------------计算当月工资------------------
procedure Tmain.Button10Click(Sender: TObject);
begin
      adocommand1.CommandText:='exec sf_当月工资统计';
     adocommand1.Execute;
//刷新数据
     adoquery4.Active:=false;
     adoquery4.Active:=true;


end;

//----------------发放所选取的员工的工资----------------
procedure Tmain.Button11Click(Sender: TObject);

var
num:string;
begin
//获取要发放工资的员工的编号
num:=adoquery4.Fields[2].AsString;
//发放工资
adocommand1.CommandText:='exec sf_当月工资发放 '''+num+'''';
adocommand1.Execute;
MessageBox(0,'所选员工的工资发放已成功!','Success',MB_OK);
//刷新数据
adoquery4.Active:=false;
adoquery4.Active:=true;

end;



end.

