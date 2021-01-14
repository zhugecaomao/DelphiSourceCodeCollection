unit MaterialsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ToolWin, ExtCtrls, Grids, DBGrids,
  ADODB, DB, DBCtrls, DBTables, Mask,BomForm;

type
  Tmaterials = class(TForm)
    ToolBar1: TToolBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ToolButton1: TToolButton;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    ToolButton2: TToolButton;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    ToolButton3: TToolButton;
    BitBtn10: TBitBtn;
    Panel1: TPanel;
    BitBtn11: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit4: TDBEdit;
    DBComboBox2: TDBComboBox;
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
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBComboBox3: TDBComboBox;

    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    
   
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    
   


  private
    { Private declarations }
  public
    OrderCode:string;
    { Public declarations }
  end;

var
  materials: Tmaterials;

implementation

uses MainForm;

{$R *.dfm}



//-----------窗体显示时，设置表中的列宽并初始化下拉列表框-----
procedure Tmaterials.FormShow(Sender: TObject);
begin

//设置列的宽度
dbgrid1.Columns[0].Width:=64;
dbgrid1.Columns[1].width:=80;
//设置计量单位下拉列表框中的内容
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select distinct 计量单位 from 物料主文件');
adoquery1.Open;
while not adoquery1.Eof do
begin
dbcombobox1.Items.Add(adoquery1.fieldbyname('计量单位').AsString);
adoquery1.Next;
end;
//设置计划类别下拉列表框中的内容
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select 类别名称,类别代码 from 物料计划类别');
adoquery1.Open;
while not adoquery1.Eof do
begin
dbcombobox2.Items.Add(adoquery1.fieldbyname('类别名称').AsString);
dbcombobox3.Items.Add(adoquery1.fieldbyname('类别代码').AsString);
adoquery1.Next;
end;

end;



//-----------------显示物料主文件中的物料类别的名称--------------------
procedure Tmaterials.DataSource1DataChange(Sender: TObject; Field: TField);
var
num,temp:string;
begin
//showmessage(dbgrid1.Fields[0].AsString);
//根据选取的数据记录，查询出它的详细数据
num:=dbgrid1.Fields[0].AsString;
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from 物料主文件 where 物料编号='''+num+'''');
adoquery1.Open;

//显示计划类别的名称（物料主文件中存储的是其拼音编码）
temp:=adoquery1.fieldbyname('计划类别').AsString;
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select 类别名称 from 物料计划类别 where 类别代码='''+temp+'''');
adoquery1.Open;
dbcombobox2.Text:=adoquery1.fieldbyname('类别名称').AsString;

end;
//--------------下一条记录------------
procedure Tmaterials.BitBtn3Click(Sender: TObject);
begin
datasource1.DataSet.Next;

end;
//--------------上一条记录------------
procedure Tmaterials.BitBtn2Click(Sender: TObject);
begin
datasource1.DataSet.Prior;
end;
//--------------首条记录------------
procedure Tmaterials.BitBtn1Click(Sender: TObject);
begin
datasource1.DataSet.First;
end;
//--------------末条记录------------
procedure Tmaterials.BitBtn4Click(Sender: TObject);
begin
datasource1.DataSet.Last;
end;

//---------点窗体的X图标时关闭窗体而不是最小化---------
procedure Tmaterials.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//当点击子窗体的关闭按钮时释放关闭窗体，如果不设置这条代码，将是最小化窗体而不是关闭
action:=cafree;
end;

//----------查询表中的数据并显示--------------------
procedure Tmaterials.BitBtn11Click(Sender: TObject);
begin
//查询数据
adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select * from 物料主文件 where (物料编号 like ''%'+edit1.Text+'%'')and');
adoquery2.SQL.Add('(物料名称 like ''%'+edit2.Text+'%'')and(拼音编码 like ''%'+edit3.Text+'%'')');
adoquery2.Open;


//将查询得到的数据通过clone命令复制到adotable中去
adotable1.Clone(adoquery2,ltUnspecified);
end;

//------------新增一条记录-----------------
procedure Tmaterials.BitBtn5Click(Sender: TObject);

begin
//在dbgrid中插入一行新的数据，并提示用户在右边文本框中修改
datasource1.DataSet.Insert;
showmessage('请在右边的文本框中输入新数据的详细内容');
//对数据文本框中设置默认值，防止用户输入错误数值类型或者对不能为空的列输入空值
dbedit1.Text:='0000';
dbedit2.Text:='在此输入物料名，该项不能为空';
dbedit9.Text:='0.00';
dbedit10.Text:='0.00';
dbedit11.Text:='0.00';
dbedit12.Text:='0.00';
dbedit19.Text:='0.00';
dbedit20.Text:='0.00';
dbedit21.Text:='0.00';
dbedit16.Text:='0';
dbedit17.Text:='0';
dbedit18.Text:='0';
dbedit23.Text:='10';
dbcombobox1.SelText:=dbcombobox1.Items.Strings[0];
dbcombobox3.SelText:=dbcombobox3.Items.Strings[0];
//物料主文件中存储的是类别的拼音，而不是名称，因此插入时
//需要输入拼音而不是名称
dbcombobox2.Visible:=false;
dbcombobox3.Visible:=true;
dbedit26.Text:='20040101';
//将插入，删除，修改和移动按钮关闭，防止错误操作
bitbtn6.Enabled:=false;
bitbtn7.Enabled:=false;
bitbtn1.Enabled:=false;
bitbtn2.Enabled:=false;
bitbtn3.Enabled:=false;
bitbtn4.Enabled:=false;
bitbtn5.Enabled:=false;
//打开保存和取消按钮的使能，允许保存或者取消
bitbtn8.Enabled:=true;
bitbtn9.Enabled:=true;
//允许修改文本框中的内容
dbedit1.ReadOnly:=false;
dbedit2.ReadOnly:=false;
dbedit3.ReadOnly:=false;
dbedit4.ReadOnly:=false;
dbedit5.ReadOnly:=false;
dbedit6.ReadOnly:=false;
dbedit7.ReadOnly:=false;
dbedit8.ReadOnly:=false;
dbedit9.ReadOnly:=false;
dbedit10.ReadOnly:=false;
dbedit11.ReadOnly:=false;
dbedit12.ReadOnly:=false;
dbedit13.ReadOnly:=false;
dbedit14.ReadOnly:=false;
dbedit15.ReadOnly:=false;
dbedit16.ReadOnly:=false;
dbedit17.ReadOnly:=false;
dbedit18.ReadOnly:=false;
dbedit19.ReadOnly:=false;
dbedit20.ReadOnly:=false;
dbedit21.ReadOnly:=false;
dbedit22.ReadOnly:=false;
dbedit23.ReadOnly:=false;
dbedit24.ReadOnly:=false;
dbedit25.ReadOnly:=false;
dbedit26.ReadOnly:=false;

end;

//----------编辑一条已有的记录--------------
procedure Tmaterials.BitBtn6Click(Sender: TObject);
begin

datasource1.DataSet.Edit;
//物料主文件中存储的是类别的拼音，而不是名称，因此插入时
//需要输入拼音而不是名称
dbcombobox2.Visible:=false;
dbcombobox3.Visible:=true;

//将插入，删除，修改和移动按钮关闭，防止错误操作
bitbtn6.Enabled:=false;
bitbtn7.Enabled:=false;
bitbtn1.Enabled:=false;
bitbtn2.Enabled:=false;
bitbtn3.Enabled:=false;
bitbtn4.Enabled:=false;
bitbtn5.Enabled:=false;
//打开保存和取消按钮的使能，允许保存或者取消
bitbtn8.Enabled:=true;
bitbtn9.Enabled:=true;
//允许修改文本框中的内容
dbedit1.ReadOnly:=false;
dbedit2.ReadOnly:=false;
dbedit3.ReadOnly:=false;
dbedit4.ReadOnly:=false;
dbedit5.ReadOnly:=false;
dbedit6.ReadOnly:=false;
dbedit7.ReadOnly:=false;
dbedit8.ReadOnly:=false;
dbedit9.ReadOnly:=false;
dbedit10.ReadOnly:=false;
dbedit11.ReadOnly:=false;
dbedit12.ReadOnly:=false;
dbedit13.ReadOnly:=false;
dbedit14.ReadOnly:=false;
dbedit15.ReadOnly:=false;
dbedit16.ReadOnly:=false;
dbedit17.ReadOnly:=false;
dbedit18.ReadOnly:=false;
dbedit19.ReadOnly:=false;
dbedit20.ReadOnly:=false;
dbedit21.ReadOnly:=false;
dbedit22.ReadOnly:=false;
dbedit23.ReadOnly:=false;
dbedit24.ReadOnly:=false;
dbedit25.ReadOnly:=false;
dbedit26.ReadOnly:=false;
end;

//-----------删除一条记录------------------------
procedure Tmaterials.BitBtn7Click(Sender: TObject);
begin
if application.MessageBox('确实删除记录？该命令不可取消!','删除记录',MB_OKCANCEL)=IDOK then
datasource1.DataSet.Delete
else
abort;
end;

//--------取消操作--------------
procedure Tmaterials.BitBtn9Click(Sender: TObject);
begin
datasource1.DataSet.Cancel;
//在浏览状态下，显示的是类别的名称
dbcombobox3.Visible:=false;
dbcombobox2.Visible:=true;

//将插入，删除，修改和移动按钮打开
bitbtn6.Enabled:=true;
bitbtn7.Enabled:=true;
bitbtn1.Enabled:=true;
bitbtn2.Enabled:=true;
bitbtn3.Enabled:=true;
bitbtn4.Enabled:=true;
bitbtn5.Enabled:=true;
//关闭保存和取消按钮的使能
bitbtn8.Enabled:=false;
bitbtn9.Enabled:=false;
//关闭允许修改文本框中的内容
dbedit1.ReadOnly:=true;
dbedit2.ReadOnly:=true;
dbedit3.ReadOnly:=true;
dbedit4.ReadOnly:=true;
dbedit5.ReadOnly:=true;
dbedit6.ReadOnly:=true;
dbedit7.ReadOnly:=true;
dbedit8.ReadOnly:=true;
dbedit9.ReadOnly:=true;
dbedit10.ReadOnly:=true;
dbedit11.ReadOnly:=true;
dbedit12.ReadOnly:=true;
dbedit13.ReadOnly:=true;
dbedit14.ReadOnly:=true;
dbedit15.ReadOnly:=true;
dbedit16.ReadOnly:=true;
dbedit17.ReadOnly:=true;
dbedit18.ReadOnly:=true;
dbedit19.ReadOnly:=true;
dbedit20.ReadOnly:=true;
dbedit21.ReadOnly:=true;
dbedit22.ReadOnly:=true;
dbedit23.ReadOnly:=true;
dbedit24.ReadOnly:=true;
dbedit25.ReadOnly:=true;
dbedit26.ReadOnly:=true;
end;



//----------------提交对数据表所作的修改----------------
procedure Tmaterials.BitBtn8Click(Sender: TObject);
begin
if application.MessageBox('确定执行对数据所作的操作？','确定',MB_OKCANCEL)=IDOK then
datasource1.DataSet.Post
else
abort;
//在浏览状态下，显示的是类别的名称
dbcombobox3.Visible:=false;
dbcombobox2.Visible:=true;
//将插入，删除，修改和移动按钮打开
bitbtn6.Enabled:=true;
bitbtn7.Enabled:=true;
bitbtn1.Enabled:=true;
bitbtn2.Enabled:=true;
bitbtn3.Enabled:=true;
bitbtn4.Enabled:=true;
bitbtn5.Enabled:=true;
//关闭保存和取消按钮的使能
bitbtn8.Enabled:=false;
bitbtn9.Enabled:=false;
//关闭允许修改文本框中的内容
dbedit1.ReadOnly:=true;
dbedit2.ReadOnly:=true;
dbedit3.ReadOnly:=true;
dbedit4.ReadOnly:=true;
dbedit5.ReadOnly:=true;
dbedit6.ReadOnly:=true;
dbedit7.ReadOnly:=true;
dbedit8.ReadOnly:=true;
dbedit9.ReadOnly:=true;
dbedit10.ReadOnly:=true;
dbedit11.ReadOnly:=true;
dbedit12.ReadOnly:=true;
dbedit13.ReadOnly:=true;
dbedit14.ReadOnly:=true;
dbedit15.ReadOnly:=true;
dbedit16.ReadOnly:=true;
dbedit17.ReadOnly:=true;
dbedit18.ReadOnly:=true;
dbedit19.ReadOnly:=true;
dbedit20.ReadOnly:=true;
dbedit21.ReadOnly:=true;
dbedit22.ReadOnly:=true;
dbedit23.ReadOnly:=true;
dbedit24.ReadOnly:=true;
dbedit25.ReadOnly:=true;
dbedit26.ReadOnly:=true;
end;
//------------------关闭窗体----------------------
procedure Tmaterials.BitBtn10Click(Sender: TObject);
begin
//SendMessage(handle, WM_SYSCOMMAND, SC_close, 0);
close;
end;
//---------在任何一个文本框上按enter键都能执行查询---------
procedure Tmaterials.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 bitbtn11.Click;
end;

procedure Tmaterials.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 bitbtn11.Click;
end;

procedure Tmaterials.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 bitbtn11.Click;
end;

end.
