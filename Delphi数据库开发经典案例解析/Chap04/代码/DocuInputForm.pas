unit DocuInputForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Grids, DBGrids, ExtCtrls, StdCtrls,
  Buttons, DB, ADODB, DBCtrls, Mask,mainform;

type
  TDocuInput = class(TForm)
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
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBComboBox1: TDBComboBox;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    Label13: TLabel;
    DBEdit7: TDBEdit;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    Panel3: TPanel;
    ADOQuery3: TADOQuery;
    StringGrid1: TStringGrid;
    ADOCommand1: TADOCommand;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

    procedure BitBtn4Click(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1DblClick(Sender: TObject);




  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetToolBar(isEnable:bool);
    procedure SumAccount();
    //当执行新增和编辑后，保存时执行不同的代码
    procedure OpType(opname:string);
  end;
//对将要从dll中的调用的函数的声明
type
Tshowdllform=function(Ahandle:Thandle;Acaption:string;tablename:string):string;stdcall;
Ttable=array[1..20] of string;
var
  DocuInput: TDocuInput;
  maxnum,recordnum,curRow,curCol:integer;
  mytable:Ttable;
  op:string;


implementation

{$R *.dfm}

procedure TDocuInput.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

//----------------初始化表----------------------
procedure TDocuInput.DataSource1DataChange(Sender: TObject;
  Field: TField);
  var
  i,j:integer;
begin

  //设置数据表宽度
  dbgrid1.Columns[0].Width:=48;
  dbgrid1.Columns[1].Width:=64;
  dbgrid1.Columns[2].Width:=64;

  //显示与凭证编号对应的分录表
  adoquery2.Close;
  adoquery2.SQL.Clear;
  adoquery2.SQL.Add('select distinct a.*,c.科目名称 from 分录表 a,凭证表 b,科目表 c where (a.凭证编号='''+dbedit1.Text+''')and(a.科目代码=c.科目代码) order by 编号');
  adoquery2.Open;
  //初始化表，将表格清空
  for i:=1 to 20 do
   for j:=0 to 4 do
    if op<>'insert' then
    stringgrid1.Cells[j,i]:='';

  //将分录表数据读入表格,并保存编号数据以供后面的数据库操作使用
  i:=1;
  recordnum:=0;
  while not adoquery2.Eof do
  begin
   stringgrid1.Cells[0,i]:=adoquery2.fieldbyname('科目代码').AsString;
   stringgrid1.Cells[1,i]:=adoquery2.fieldbyname('科目名称').AsString;
   stringgrid1.Cells[2,i]:=adoquery2.fieldbyname('借方').AsString;
   stringgrid1.Cells[3,i]:=adoquery2.fieldbyname('贷方').AsString;
   stringgrid1.Cells[4,i]:=adoquery2.fieldbyname('摘要').AsString;
   mytable[i]:=adoquery2.fieldbyname('编号').AsString;
   i:=i+1;
   recordnum:=recordnum+1;
   adoquery2.Next;

  end;
  //设置分录表的列宽度
  stringgrid1.ColWidths[0]:=48;
  stringgrid1.ColWidths[1]:=116;
  stringgrid1.ColWidths[2]:=64;
  stringgrid1.ColWidths[3]:=64;
  stringgrid1.ColWidths[4]:=150;
  //显示凭证数
  label2.Caption:=inttostr(datasource1.DataSet.RecordCount);
  
end;

//-----------------设置工具栏按钮--------------------
procedure TDocuInput.SetToolBar(isEnable: bool);
begin
 if isEnable=true then
  begin
   //将首记录等记录移动按钮设置为不可用
   toolbutton1.Enabled:=false;
   toolbutton2.Enabled:=false;
   toolbutton3.Enabled:=false;
   toolbutton4.Enabled:=false;
   //将新增修改等按钮设置为不可用
   toolbutton6.Enabled:=false;
   toolbutton7.Enabled:=false;
   toolbutton8.Enabled:=false;
   //将保存和取消按钮设置为可用
   toolbutton10.Enabled:=true;
   toolbutton11.Enabled:=true;
   //将窗体内的数据显示控件设为可修改
   dbedit2.Enabled:=true;
   dbedit3.Enabled:=true;
   dbcombobox1.Enabled:=true;
   stringgrid1.Enabled:=true;
   dbgrid1.Enabled:=false;


 end;

 if isEnable=false then
  begin
   //将首记录等记录移动按钮设置为可用
   toolbutton1.Enabled:=true;
   toolbutton2.Enabled:=true;
   toolbutton3.Enabled:=true;
   toolbutton4.Enabled:=true;
   //将新增修改等按钮设置为可用
   toolbutton6.Enabled:=true;
   toolbutton7.Enabled:=true;
   toolbutton8.Enabled:=true;
   //将保存和取消按钮设置为不可用
   toolbutton10.Enabled:=false;
   toolbutton11.Enabled:=false;
   //将窗体内的数据显示控件设为不可修改

   dbedit2.Enabled:=false;
   dbedit3.Enabled:=false;
   dbcombobox1.Enabled:=false;
   dbgrid1.Enabled:=true;
   stringgrid1.Enabled:=false;


  end;


end;

//---------------新增记录----------------
procedure TDocuInput.ToolButton6Click(Sender: TObject);
var
totalnum:string;


begin

//刷新数据，得到凭证数据中最大编码并加一，防止编码重复
adoquery3.Close;
adoquery3.SQL.Clear;
adoquery3.SQL.Add('select max(凭证编号) 最大编号 from 凭证表');
adoquery3.Open;
totalnum:=adoquery3.FieldByName('最大编号').Asstring;
totalnum:=copy(totalnum,1,6);
if totalnum='' then totalnum:='0';
totalnum:=inttostr(strtoint(totalnum)+1);


//开始新增
SetToolBar(true);
datasource1.DataSet.Insert;

//组成六位的凭证编码
if length(totalnum)=1 then
 dbedit1.Text:='00000'+totalnum;
if length(totalnum)=2 then
 dbedit1.Text:='0000'+totalnum;
if length(totalnum)=3 then
 dbedit1.Text:='000'+totalnum;


//默认凭证字号
dbcombobox1.SelText:='收';
//加入当前日期
dbedit2.Text:=datetostr(date);
// 默认会计期间
main.setpara;
dbedit4.Text:=main.para[2];
//默认过帐状态
dbedit5.Text:='未过';
//设置操作类型
op:='insert';




end;

//---------------修改记录----------------
procedure TDocuInput.ToolButton7Click(Sender: TObject);
begin
SetToolBar(true);
datasource1.DataSet.Edit;
//设置操作类型
op:='edit';

end;

//---------------删除记录----------------
procedure TDocuInput.ToolButton8Click(Sender: TObject);
begin
 if application.MessageBox('删除该条记录？','财务管理系统',MB_OKCANCEL)=IDOK then
  begin
    //先删除分录表记录，再删除凭证记录
    adocommand1.CommandText:='delete from 分录表 where 凭证编号='''+dbedit1.Text+'''';
    adocommand1.Execute;
    datasource1.DataSet.Delete;
  end;
end;

//---------------首记录----------------
procedure TDocuInput.ToolButton1Click(Sender: TObject);
begin
 datasource1.DataSet.First;


end;

//---------------上记录----------------
procedure TDocuInput.ToolButton2Click(Sender: TObject);
begin
 datasource1.DataSet.Prior;

end;

//---------------下记录----------------
procedure TDocuInput.ToolButton3Click(Sender: TObject);
begin
 datasource1.DataSet.Next;

end;

//---------------尾记录----------------
procedure TDocuInput.ToolButton4Click(Sender: TObject);
begin
 datasource1.DataSet.Last;

end;

procedure TDocuInput.ToolButton13Click(Sender: TObject);
begin
close;
end;

//---------------保存记录----------------
procedure TDocuInput.ToolButton10Click(Sender: TObject);
begin
  if dbedit6.Text<>dbedit7.Text then
   showmessage('借贷双方不平衡，请检查')
  else
  begin
   if op='insert' then
    begin
    datasource1.DataSet.Post;
    opType(op);
    end;
   if op='edit' then
    begin
    opType(op);
    datasource1.DataSet.Post;
    end;
  SetToolBar(false);
  //清除操作标识符
  op:='';
  end;
end;

//---------------取消操作----------------
procedure TDocuInput.ToolButton11Click(Sender: TObject);
begin
  datasource1.DataSet.Cancel;
  SetToolBar(false);
    //清除操作标识符
  op:='';
end;

//----------查询数据并显示-------------
procedure TDocuInput.BitBtn1Click(Sender: TObject);
begin
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from 凭证表 where (凭证编号 like ''%'+edit1.Text+'%'')and');
adoquery1.SQL.Add('(会计期间 like ''%'+edit2.Text+'%'')and(日期 like ''%'+edit3.Text+'%'')');
adoquery1.Open;

end;




//----------------为凭证录入分录表-----------------
procedure TDocuInput.BitBtn4Click(Sender: TObject);
begin
 datasource2.DataSet.Delete;
end;


//----------统计分录表中的各项信息以储存到数据库----------
procedure TDocuInput.SumAccount;
var
sumoutput,suminput:double;
i:integer;
begin
suminput:=0;
sumoutput:=0;
//统计借贷双方的数额
for i:=1 to 20 do
  if (stringgrid1.Cells[2,i]<>'')and(stringgrid1.Cells[3,i]<>'') then
    begin
     suminput:=suminput+strtofloat(stringgrid1.Cells[2,i]);
     sumoutput:=sumoutput+strtofloat(stringgrid1.Cells[3,i]);
    end;
dbedit6.Text:=floattostr(suminput);
dbedit7.Text:=floattostr(sumoutput);
end;

procedure TDocuInput.DBEdit9Exit(Sender: TObject);
begin
SumAccount;
end;


//------------设置分录表表头-------
procedure TDocuInput.FormShow(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='科目编码';
  stringgrid1.Cells[1,0]:='科目名称(双击选择)';
  stringgrid1.Cells[2,0]:='借方';
  stringgrid1.Cells[3,0]:='贷方';
  stringgrid1.Cells[4,0]:='摘要';
end;





//----当在分录表中输入时，不允许在上面有空行的情况下输入新的一行数据----
procedure TDocuInput.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
//防止在输入数据时上面有空行
if stringgrid1.Cells[0,Arow-1]='' then
 begin
  showmessage('请先完成上行中空的项目');
  exit;
 end;
//保存选取的单元行列值
curRow:=ARow;
curCol:=ACol;
if (curCol<=4)and(curCol>=2) then
  stringgrid1.Options:=stringgrid1.Options+[goEditing];
//防止选中标题栏
if ARow=0 then curRow:=ARow+1;
//统计借贷双方信息
sumAccount();

end;

//---在输入分录表时调用dll中的表格，选择科目名称和号码 -----
procedure TDocuInput.StringGrid1DblClick(Sender: TObject);
var
showForm:TShowDllForm;
module:Thandle;

begin
 //只有双击指定列才有效
 if curCol<>1 then exit;
 //读入dll
 module:=loadlibrary('sec.dll');
 //如果读入错误，则module会是一个小于32的错误代码
 //由此可以判断是否读入成功
 if module<32 then exit;
 @showForm:=getprocaddress(module,pchar(1));
 if @showForm=nil then exit;

 //通过dll传递参数
 stringgrid1.Cells[0,curRow]:=showForm(application.Handle,'选择科目名称','科目表');

 //为科目代码添加科目名称
 adoquery3.Close;
 adoquery3.SQL.Clear;
 adoquery3.SQL.Add('select 科目名称 from 科目表 where 科目代码='''+stringgrid1.Cells[0,curRow]+'''');
 adoquery3.Open;
 stringgrid1.Cells[1,curRow]:=adoquery3.fieldbyname('科目名称').AsString;
 stringgrid1.Cells[2,curRow]:='0';
 stringgrid1.Cells[3,curRow]:='0';

end;

//---------------------对分录表进行插入和修改时所执行的操作--------------------------
procedure TDocuInput.OpType(opname: string);
var
 i:integer;
 inputval,outputval,oldnum:string;
begin
//如果是新增凭证，则直接将分录表中的数据逐条插入
  if opname='insert' then
   begin
     for i:=1 to 20 do
      begin
      //如果表格中为空，则跳出循环
       if stringgrid1.Cells[0,i]='' then continue;
       inputval:=stringgrid1.cells[2,i];
       outputval:=stringgrid1.cells[3,i];
       //插入数据，由于借方和贷方数据在sql server中为money，故需要进行转换
       adocommand1.CommandText:='insert into 分录表([凭证编号],[科目代码],[借方],[贷方],[摘要]) values('''+dbedit1.Text+''','''+stringgrid1.Cells[0,i]+''',cast('''+inputval+''' as money),cast('''+outputval+''' as money),'''+stringgrid1.Cells[4,i]+''')';
       adocommand1.Execute;
      end;
   end;
  if opname='edit' then
   begin
     for i:=1 to 20 do
      begin
       if stringgrid1.Cells[0,i]='' then continue;
       inputval:=stringgrid1.cells[2,i];
       outputval:=stringgrid1.cells[3,i];
       //对凭证所属的分录表原有数据进行更新
       if i<=recordnum then
       adocommand1.CommandText:='update 分录表 set [科目代码]='''+stringgrid1.cells[0,i]+''',[借方]=cast('''+inputval+''' as money),[贷方]=cast('''+outputval+''' as money),[摘要]='''+stringgrid1.Cells[4,i]+''' where 编号='''+mytable[i]+''''
       else
       //插入凭证所属的分录表中的新数据
       adocommand1.CommandText:='insert into 分录表([凭证编号],[科目代码],[借方],[贷方],[摘要]) values('''+dbedit1.Text+''','''+stringgrid1.Cells[0,i]+''',cast('''+inputval+''' as money),cast('''+outputval+''' as money),'''+stringgrid1.Cells[4,i]+''')';
       adocommand1.Execute;
      end;
   end;

end;





end.




