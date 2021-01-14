unit FormInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls, DB, ADODB;

type
  Tinput = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit3: TEdit;
    Label4: TLabel;
    StringGrid1: TStringGrid;
    ADOQuery1: TADOQuery;
    ComboBox3: TComboBox;
    Button1: TButton;
    Label5: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Edit6: TEdit;
    Button2: TButton;
    ADOCommand1: TADOCommand;
    Button3: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);


    procedure ComboBox2DropDown(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    
    procedure ComboBox3Select(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    
  private
    { Private declarations }
  public

//-------------设置选取的stringgrid单元成员的行，列值为public，以供其他窗体中调用-----------------

  currentRow: integer;
  currentCol:integer;

  { Public declarations }
  end;

var
  input: Tinput;
  currentRow: integer;
  currentCol:integer;

implementation

uses FormManage, FormInfo, FormReport;

{$R *.dfm}
//----------------关闭窗体时打开管理窗体----------------------------
procedure Tinput.FormClose(Sender: TObject; var Action: TCloseAction);
var i,j:integer;
begin
manage.show;


end;

//---------------窗体显示时设置当前值-------------------------
procedure Tinput.FormShow(Sender: TObject);
begin
//制表事件为当前日期
edit1.Text:=datetostr(date);
//制单人即登录用户
edit2.Text:=manage.StatusBar1.Panels[0].Text;
currentCol:=1;
currentRow:=1;

end;



//----------------动态添加供货商数据词典-----------------------
//--------供货商窗体中双击读入数据功能见供货商窗体的代码--------
procedure Tinput.ComboBox2DropDown(Sender: TObject);
begin
//显示供货商清单
 info.visible:=true;
 info.N3.Click;
//显示供货商清单时，不允许对进货单窗体进行操作
 input.Enabled:=false;

end;

//----------双击货号列读入商品信息----------------------
procedure Tinput.StringGrid1DblClick(Sender: TObject);
begin
//只允许在第一列由“（双击）”标示处双击
if currentCol=1 then
begin
//显示商品清单
info.Visible:=true;
info.N2.Click;
//显示商品清单时，不允许对进货单窗体进行操作
input.Enabled:=false;
end;
end;

//------------------设置选取的单元行，列值--------------------------
//-----------------添加单价，数量等信息并根据这些信息进行计算---------
//-------------------将统计结果显示在窗体下方的文本框中-----------------
procedure Tinput.StringGrid1SelectCell(Sender: TObject; ACol,
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
 //----------计算某条进货单明细的进货金额，税额和不含税额-----------------------
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

//-------------------窗体创建时，设置stringgrid的行列属性，宽度等信息--------------
//---------------同时为业务员添加数据词典---------------------------------------
procedure Tinput.FormCreate(Sender: TObject);
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

//----------------------在选取仓库条件满足时，显示仓库名下拉列表--------------
//-------------------并设置仓库名数据词典-------------------------------
procedure Tinput.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

//------------------仓库名下拉列表框显示在鼠标附近-----------------
if (currentCol=5)and(stringgrid1.Cells[2,currentRow]<>'') then
   begin
   combobox3.Visible:=true;
   combobox3.Left:=X;
   combobox3.Top:=Y+120;

//------------------------添加数据词典-----------------------
 adoquery1.Close;
 adoquery1.SQL.Clear;
 adoquery1.SQL.Add('select distinct 仓库名 from 仓库清单');
 adoquery1.Open;
 combobox3.Items.Clear;
 while not adoquery1.Eof do
  begin

  combobox3.Items.Add(adoquery1.FieldByName('仓库名').AsString);
  adoquery1.Next;
  end;

  end;



end;


//------------------将选取的值添加到stringgrid单元，并隐藏列表框--------------
procedure Tinput.ComboBox3Select(Sender: TObject);
begin
//只有鼠标点击“仓库”列时，才会显示列表框
if currentCol=5 then
begin
 stringgrid1.Cells[5,currentRow]:=combobox3.Text;
 combobox3.Visible:=false;
 combobox3.Items.Clear;
end;
end;

//---------------预览报表-------------------------------
procedure Tinput.Button2Click(Sender: TObject);
begin
//-----------------先刷新报表中的数据源-----------------------
report.ADOQuery1.Active:=false;
report.ADOQuery1.Active:=true;
report.QuickRep1.Preview;
end;

//-----------------保存进货单，进货单明细数据-------------------------
procedure Tinput.Button1Click(Sender: TObject);
var
maxnum,maxnum2,temp,inputnum,inputnum2:string;
newnum,newnum2,i:integer;
begin
 //--------------------为新插入的进货单和进货单明细数据计算编号-------------
//计算进货单中最大编号，以便插入新的进货单数据时编号不冲突
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select max(编号) 最大编号 from 进货单');
  adoquery1.Open;
  maxnum:=adoquery1.FieldByName('最大编号').asstring;

//对读出的编号进行截取并将其转换为整数值，字段太长时可以不能用strtoint来转换
 //防止插入第一条记录时出错
    if (maxnum='')or(maxnum=' ') then
   temp:='00000'
   else
   temp:=copy(maxnum,1,5);

//新插入的进货单编号为插入前的最大编号+1
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

 //计算进货单明细最大编号以便插入新的进货单明细数据时编号不冲突
   adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select max(编号) 最大编号 from 进货单明细');
  adoquery1.Open;
  maxnum2:=adoquery1.FieldByName('最大编号').asstring;

//对读出的编号进行截取并将其转换为整数值，字段太长时可以不能用strtoint来转换
 //防止插入第一条记录时出错
    if (maxnum2='')or(maxnum2=' ') then
   temp:='00000'
   else
   temp:=copy(maxnum2,1,5);
   newnum2:=strtoint(temp);


//由于进货单明细数据可能由很多条，因此在下面的循环中进货单明细循环种再编号和组合编码



//-----------插入新的进货单和进货单明细-----------------------------
//如果供货商号为空或者时没有进货单明细数据，则取消插入----
  if (combobox2.Text='')or(edit4.Text='') then
  showmessage('供货商号不能为空，且进货单明细数据必须完整')
  else
  begin
//插入新的进货单数据
   adocommand1.CommandText:='insert into 进货单([编号],[供货商号],[进货日期],[业务员],[制单人],[税价合计],[不含税价],[税额]) values('''+inputnum+''','''+combobox2.Text+''','''+edit1.Text+''','''+combobox1.Text+''','''+edit2.Text+''','''+edit4.Text+''','''+edit5.Text+''','''+edit6.Text+''')';
   adocommand1.Execute;
//根据进货单明细条目的数量，插入进货单明细数据
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
     adocommand1.CommandText:='insert into 进货单明细([编号],[进货单号],[货号],[进货数量],[进价],[税价合计],[税率],[不含税价],[税额],[仓库]) values('''+inputnum2+''','''+inputnum+''','''+stringgrid1.Cells[1,i]+''','''+stringgrid1.Cells[4,i]+''','''+stringgrid1.Cells[6,i]+''','''+stringgrid1.Cells[7,i]+''','''+stringgrid1.Cells[8,i]+''','''+stringgrid1.Cells[10,i]+''','''+stringgrid1.Cells[9,i]+''','''+stringgrid1.Cells[5,i]+''')';
     adocommand1.Execute;
     end;
//通知用户，操作成功
     showmessage('进货单及明细保存成功');

  end;

end;

//-----------------预览和打印报表-------------------------------------
procedure Tinput.Button3Click(Sender: TObject);
var
i,j:integer;
begin
if application.messagebox('是否现在打印进货单报表？','确认',MB_OKCANCEL)=IDOK then
 report.QuickRep1.Print;
adocommand1.CommandText:='exec sf_进货单';
adocommand1.Execute;
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
