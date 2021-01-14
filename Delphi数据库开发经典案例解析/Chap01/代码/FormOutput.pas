unit FormOutput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, DB, StdCtrls, Grids, ExtCtrls;

type
  Toutput = class(TForm)
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit3: TEdit;
    StringGrid1: TStringGrid;
    ComboBox3: TComboBox;
    Button1: TButton;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    ADOCommand1: TADOCommand;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ComboBox3Select(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure ComboBox2DropDown(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    
  private
    { Private declarations }
//-------------设置选取的stringgrid单元成员的行，列值为public，以供其他窗体中调用-----------------
  public
  currentRow: integer;
  currentCol:integer;
    { Public declarations }
  end;

var
  output: Toutput;
  currentRow: integer;
  currentCol:integer;
implementation

uses FormInfo, FormManage;

{$R *.dfm}
//-------------------窗体创建时，设置stringgrid的行列属性，宽度等信息--------------
//---------------同时为业务员添加数据词典---------------------------------------
procedure Toutput.FormCreate(Sender: TObject);
var
i,j,num:integer;
begin
//-------------设置stringgrid行，列名称---------------------

stringgrid1.Cols[0].Add('序号');
stringgrid1.ColWidths[0]:=32;
stringgrid1.Cols[1].Add('货号(双击)');
stringgrid1.ColWidths[1]:=80;
stringgrid1.Cols[2].Add('品名');
stringgrid1.ColWidths[2]:=128;
stringgrid1.Cols[3].Add('单位');
stringgrid1.ColWidths[3]:=32;
 stringgrid1.Cols[4].Add('数量');
 stringgrid1.ColWidths[4]:=64;
stringgrid1.Cols[5].Add('仓库');
stringgrid1.ColWidths[5]:=48;
 stringgrid1.Cols[6].Add('单价');
 stringgrid1.ColWidths[6]:=64;
stringgrid1.Cols[7].Add('金额');
stringgrid1.ColWidths[7]:=64;
 stringgrid1.Cols[8].Add('税率');
 stringgrid1.ColWidths[8]:=64;
stringgrid1.Cols[9].Add('税额');
stringgrid1.ColWidths[9]:=64;
stringgrid1.Cols[10].Add('不含税额');
stringgrid1.ColWidths[10]:=64;

for i:=1 to 20 do
 begin
 stringgrid1.Rows[i].Add(inttostr(i));
 stringgrid1.RowHeights[i]:=20;
 end;
//-------------------------设置业务员数据词典------------------------
adoquery1.Close;
adoquery1.SQL.Add('select 姓名 from 用户清单 where 姓名!=''sys''');
adoquery1.Open;
combobox1.Clear;
while not adoquery1.Eof do
begin
 combobox1.Items.Add(adoquery1.fieldbyname('姓名').AsString);
 adoquery1.Next;
end;
end;

//------------------设置选取的单元行，列值--------------------------
//-----------------添加销售价，数量等信息并根据这些信息进行计算---------
//-------------------将统计结果显示在窗体下方的文本框中-----------------
procedure Toutput.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
 price,number,tax,sum:double;
 j:integer;
begin
//读取选取的当前单元的行，列值
 currentCol:=ACol;
 currentRow:=ARow;
//只有当选取仓库时，动态下拉列表才显示
 if (currentCol<>5) then
  combobox3.Visible:=false;
//只有商品信息不为空时才可以输入单位和默认税率
 if (currentCol=3)and(stringgrid1.Cells[2,currentRow]<>'') then
   begin
  adoquery1.Close;
 adoquery1.SQL.Clear;
 adoquery1.SQL.Add('select distinct 单位 from 商品清单 where 货号='''+stringgrid1.Cells[1,currentRow]+'''');
 adoquery1.Open;
 stringgrid1.Cells[3,currentRow]:=adoquery1.FieldByName('单位').AsString;
 stringgrid1.Cells[8,currentRow]:='17';
   end;



 //--------------------当商品信息，数量，单价不为空时，才能进行计算------------------------
  if (currentRow<>0)and(stringgrid1.Cells[1,currentRow]<>'')and(stringgrid1.Cells[4,currentRow]<>'')and(stringgrid1.Cells[6,currentRow]<>'')and(stringgrid1.Cells[5,currentRow]<>'') then
   begin
 //-----------------计算某条销售单明细的进货金额，税额和不含税额-------------------------
//-----------------------这里开始添加的代码是判断出货量的------------------------
//------------------销售商品的数量不允许大于库存中的储存数量----------------------
 adoquery1.Close;
 adoquery1.SQL.Clear;
 adoquery1.SQL.Add('select 库存数量 from 库存库 where 货号='''+stringgrid1.Cells[1,currentRow]+'''');
 adoquery1.Open;
 if strtoint(stringgrid1.Cells[4,currentRow])>adoquery1.FieldByName('库存数量').AsInteger then
  begin
  showmessage('该库中此种商品的最大储量小于您的输入,将按照最大储量出货');
  stringgrid1.Cells[4,currentRow]:=adoquery1.FieldByName('库存数量').AsString;
  end;

//----------计算某条销售单明细的进货金额，税额和不含税额-----------------------
   number:=strtofloat(stringgrid1.Cells[4,currentRow]);
   price:=strtofloat(stringgrid1.Cells[6,currentRow]);
   tax:=strtofloat(stringgrid1.Cells[8,currentRow])/100;
   stringgrid1.Cells[7,currentRow]:=floattostr(number*price);
   stringgrid1.Cells[9,currentRow]:=floattostr(tax*number*price/(1+tax));
   stringgrid1.Cells[10,currentRow]:=floattostr(number*price/(1+tax));

  //----------------统计合计金额-----------------------
   sum:=0;
   for j:=1 to 20 do
   if  stringgrid1.Cells[7,j]<>'' then
      sum:=sum+strtofloat(stringgrid1.Cells[7,j]);
   edit4.Text:=floattostr(sum);
  //----------------统计合计税额-----------------------
   sum:=0;
   for j:=1 to 20 do
   if  stringgrid1.Cells[9,j]<>'' then
      sum:=sum+strtofloat(stringgrid1.Cells[9,j]);
   edit6.Text:=floattostr(sum);
   //----------------统计合计不含税额-----------------------
   sum:=0;
   for j:=1 to 20 do
   if  stringgrid1.Cells[10,j]<>'' then
      sum:=sum+strtofloat(stringgrid1.Cells[10,j]);
   edit5.Text:=floattostr(sum);

end;
end;


//---------------在选取仓库条件满足时，显示仓库名下拉列表--------------
//-------------------并设置仓库名数据词典-------------------------------
procedure Toutput.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

//------------------仓库名下拉列表框显示在鼠标附近-----------------
if (currentCol=5)and(stringgrid1.Cells[2,currentRow]<>'') then
   begin
   combobox3.Visible:=true;
   combobox3.Left:=X;
   combobox3.Top:=Y+120;
 //------------------------添加数据词典-----------------------
 //------------------注意和进货单的不同之处-------------------
 //-------------这里是根据商品的编号来查询存有这个商品的仓库-------
 adoquery1.Close;
 adoquery1.SQL.Clear;
 adoquery1.SQL.Add('select distinct 仓库 from 库存库 where 货号='''+stringgrid1.Cells[1,currentRow]+'''');
 adoquery1.Open;
 combobox3.Items.Clear;
 while not adoquery1.Eof do
  begin
  combobox3.Items.Add(adoquery1.FieldByName('仓库').AsString);
  adoquery1.Next;
  end;
  end;
end;

//------------------将选取的值添加到stringgrid单元，并隐藏列表框--------------
procedure Toutput.ComboBox3Select(Sender: TObject);
begin
if currentCol=5 then
begin
 stringgrid1.Cells[5,currentRow]:=combobox3.Text;
 combobox3.Visible:=false;
 combobox3.Items.Clear;
end;
end;


//----------双击货号列读入商品信息----------------------
procedure Toutput.StringGrid1DblClick(Sender: TObject);

begin
//--------只允许在第一列由“（双击）”标示处双击----------
if currentCol=1 then
begin
//---------------显示库存清单---------------------------
manage.button4.click;
//-------------显示商品清单时，不允许对进货单窗体进行操作------
output.Enabled:=false;
end;
end;

//----------------动态添加客户数据词典-----------------------
//--------客户资料窗体中双击读入数据功能见客户资料窗体的代码--------
procedure Toutput.ComboBox2DropDown(Sender: TObject);
begin
//显示客户清单
 info.visible:=true;
 info.N4.Click;
//显示客户清单时，不允许对进货单窗体进行操作
 output.Enabled:=false;

end;



//---------------窗体显示时设置当前值-------------------------
procedure Toutput.FormShow(Sender: TObject);
begin
//制表事件为当前日期
edit1.Text:=datetostr(date);
//制单人即登录用户
edit2.Text:=manage.StatusBar1.Panels[0].Text;
currentRow:=1;
currentCol:=1;
end;

//----------------关闭窗体时打开管理窗体----------------------------
procedure Toutput.FormClose(Sender: TObject; var Action: TCloseAction);
var
i,j:integer;
begin
manage.show;

end;

//-----------------保存销售单，销售单明细数据-------------------------
procedure Toutput.Button1Click(Sender: TObject);
var
maxnum,maxnum2,temp,inputnum,inputnum2:string;
newnum,newnum2,i:integer;
begin
  //计算销售单中最大编号，以便插入新的销售单数据时编号不冲突
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select max(编号) 最大编号 from 销售单');
  adoquery1.Open;
  maxnum:=adoquery1.FieldByName('最大编号').asstring;

//对读出的编号进行截取并将其转换为整数值，字段太长时可以不能用strtoint来转换
 //防止插入第一条记录时出错
    if (maxnum='')or(maxnum=' ') then
   temp:='00000'
   else
   temp:=copy(maxnum,1,5);
   //新插入的销售单编号为插入前的最大编号+1
    newnum:=strtoint(temp)+1;
//重新组合编码
if length(inttostr(newnum))=1 then
 inputnum:='0000'+inttostr(newnum);
if length(inttostr(newnum))=2 then
 inputnum:='000'+inttostr(newnum);
if length(inttostr(newnum))=3 then
 inputnum:='00'+inttostr(newnum);
if length(inttostr(newnum))=4 then
 inputnum:='0'+inttostr(newnum);
if length(inttostr(newnum))=5 then
 inputnum:=inttostr(newnum);
//计算销售单明细最大编号以便插入新的销售单明细数据时编号不冲突
   adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select max(编号) 最大编号 from 销售单明细');
  adoquery1.Open;
  maxnum2:=adoquery1.FieldByName('最大编号').asstring;

//防止插入第一条记录时出错
    if (maxnum2='')or(maxnum2=' ') then
   temp:='00000'
   else
   temp:=copy(maxnum2,1,5);
   newnum2:=strtoint(temp);

//由于销售单明细数据可能由很多条，因此在下面的循环中销售单明细循环种再编号和组合编码



  //-----------插入新的销售单和销售单明细-----------------------------
  //如果客户号为空或者时没有销售单明细数据，则取消插入
  if (combobox2.Text='')or(edit4.Text='') then
  showmessage('客户号不能为空，且销售单明细数据必须完整')
  else
  begin
   //插入新的销售单数据
   adocommand1.CommandText:='insert into 销售单([编号],[客户编号],[销售日期],[业务员],[制单人],[税价合计],[不含税价],[税额]) values('''+inputnum+''','''+combobox2.Text+''','''+edit1.Text+''','''+combobox1.Text+''','''+edit2.Text+''','''+edit4.Text+''','''+edit5.Text+''','''+edit6.Text+''')';
   adocommand1.Execute;
      //根据销售单明细条目的数量，插入销售单明细数据
   for i:=1 to 20 do
    if stringgrid1.Cells[7,i]<>'' then
     //重新组合编码
     begin
     newnum2:=newnum2+1;
     if length(inttostr(newnum2))=1 then
      inputnum2:='0000'+inttostr(newnum2);
     if length(inttostr(newnum2))=2 then
      inputnum2:='000'+inttostr(newnum2);
     if length(inttostr(newnum2))=3 then
      inputnum2:='00'+inttostr(newnum2);
     if length(inttostr(newnum2))=4 then
      inputnum2:='0'+inttostr(newnum2);
     if length(inttostr(newnum2))=5 then
      inputnum2:=inttostr(newnum2);
     adocommand1.CommandText:='insert into 销售单明细([编号],[销售单号],[货号],[销售数量],[销售价],[税价合计],[税率],[不含税价],[税额],[仓库]) values('''+inputnum2+''','''+inputnum+''','''+stringgrid1.Cells[1,i]+''','''+stringgrid1.Cells[4,i]+''','''+stringgrid1.Cells[6,i]+''','''+stringgrid1.Cells[7,i]+''','''+stringgrid1.Cells[8,i]+''','''+stringgrid1.Cells[10,i]+''','''+stringgrid1.Cells[9,i]+''','''+stringgrid1.Cells[5,i]+''')';
     adocommand1.Execute;
     end;
  //通知用户，操作成功
   showmessage('销售单及明细保存成功');

  end;

end;
//------------------提交销售单----------------------------------
//---------报表预览及打印功能与进货单完全一致--------------------
procedure Toutput.Button3Click(Sender: TObject);
var
i,j:integer;
begin
adocommand1.CommandText:='exec sf_销售单';
adocommand1.Execute;
showmessage('销售单处理成功');
//清空前面的输入
for i:=1 to 10 do
 for j:=1 to 20 do
  stringgrid1.Cells[i,j]:='';
combobox1.Text:='';
combobox2.Text:='';
edit3.Clear;
edit4.Clear;
edit5.Clear;
edit6.Clear;
end;

end.
