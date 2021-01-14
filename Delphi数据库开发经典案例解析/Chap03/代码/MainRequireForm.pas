unit MainRequireForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, ToolWin, StdCtrls, Buttons, ExtCtrls,
  ADODB, DB, DBCtrls, Mask;

type
  TMainRequire = class(TForm)
    Panel1: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    BitBtn12: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
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
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBMemo1: TDBMemo;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    BitBtn13: TBitBtn;
    BitBtn11: TBitBtn;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    ADOCommand1: TADOCommand;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    insflag:integer;
  end;

var
  MainRequire: TMainRequire;

implementation

uses MainForm,ChooseForm;

{$R *.dfm}

//--------------下一条记录------------
procedure Tmainrequire.BitBtn3Click(Sender: TObject);
begin
datasource1.DataSet.Next;

end;
//--------------上一条记录------------
procedure Tmainrequire.BitBtn2Click(Sender: TObject);
begin
datasource1.DataSet.Prior;
end;
//--------------首条记录------------
procedure Tmainrequire.BitBtn1Click(Sender: TObject);
begin
datasource1.DataSet.First;
end;
//--------------末条记录------------
procedure Tmainrequire.BitBtn4Click(Sender: TObject);
begin
datasource1.DataSet.Last;
end;
//---------关闭窗体---------------
procedure TMainRequire.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TMainRequire.BitBtn10Click(Sender: TObject);
begin
close;
end;

//-----------查询---------------------
procedure TMainRequire.BitBtn12Click(Sender: TObject);
begin
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from 主需求计划 where (物料编号 like ''%'+edit1.Text+'%'')and');
adoquery1.SQL.Add('(年份 like ''%'+edit2.Text+'%'')and(计划期 like ''%'+edit3.Text+'%'')');
adoquery1.Open;

end;
//------响应enter键-----------
procedure TMainRequire.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 bitbtn12.Click;
end;

procedure TMainRequire.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 bitbtn12.Click;
end;

procedure TMainRequire.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 bitbtn12.Click;
end;

//---------------读入公共变量------------------
procedure TMainRequire.FormActivate(Sender: TObject);
begin
//如果是新增按钮被按下，则将从物料主文件中选取得零件的编号
//名称等信息送到主需求窗口中，并初始化一些数据
 if insflag=1 then
  begin
  dbedit1.Text:=main.str;
  dbedit2.Text:=main.str2;
  end;
  if insflag=2 then
  begin
  dbedit3.Text:=main.str;
  dbedit4.Text:=main.str2;
  dbedit5.Text:=main.str3;
  dbedit6.Text:=main.str4;
  end;

end;

//--------插入新数据---------------
procedure TMainRequire.BitBtn5Click(Sender: TObject);
begin
datasource1.DataSet.Insert;
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
//将两个浏览按钮使能打开
bitbtn11.Enabled:=true;
bitbtn13.Enabled:=true;
//必须用保存按钮才能提交
dbgrid1.Enabled:=false;
//允许对需求数量和备注进行修改
dbedit7.ReadOnly:=false;
dbedit7.Text:='0';
dbmemo1.ReadOnly:=false;
end;

//-----------从物料主文件窗体中检索数据--------------
procedure TMainRequire.BitBtn13Click(Sender: TObject);
var
newform:Tchoose;
begin
//标识从主需求窗体调用物料主文件窗口
main.bomflag:=2;
newform:=Tchoose.Create(application);
//将本窗口灰化
self.Enabled:=false;
//标识为第一个检索按钮按下
insflag:=1;
end;

//-----------从工厂日历窗体中检索数据--------------
procedure TMainRequire.BitBtn11Click(Sender: TObject);
begin
 main.bomflag:=3;
 main.N5.Click;
 //将本窗口灰化
self.Enabled:=false;
//标识为第二个检索按钮按下
insflag:=2;
end;

//----更新文本框中的数据内容-------------
procedure TMainRequire.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
//为产品名称文本框查询产品名称
adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select 物料名称 from 物料主文件 where 物料编号='''+dbedit1.Text+'''');
adoquery2.Open;
//根据表中“状态”的取值确定单选框的取值
if copy(adoquery1.FieldByName('状态').AsString,1,4)='正常' then
radiobutton1.Checked:=true
else
radiobutton2.Checked:=true;
//设置列的宽度
dbgrid1.Columns[0].Width:=64;
dbgrid1.Columns[1].Width:=64;
dbgrid1.Columns[2].Width:=64;
dbgrid1.Columns[3].Width:=64;
dbgrid1.Columns[4].Width:=64;

end;

//-----------编辑数据------------------
procedure TMainRequire.BitBtn6Click(Sender: TObject);
begin
datasource1.DataSet.Edit;
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
//将两个浏览按钮使能打开
bitbtn11.Enabled:=true;
bitbtn13.Enabled:=true;
//必须用保存按钮才能提交
dbgrid1.Enabled:=false;
//允许对需求数量和备注进行修改
dbedit7.ReadOnly:=false;
dbmemo1.ReadOnly:=false;
end;

//------------------保存操作--------------------
procedure TMainRequire.BitBtn8Click(Sender: TObject);
var
state,dorder,dnum:string;
begin
if radiobutton1.Checked then
 state:='正常'
 else
 state:='无效';
dorder:=dbedit4.Text;
dnum:=dbedit1.Text;
datasource1.DataSet.Post;
adocommand1.CommandText:='update 主需求计划 set 状态='''+state+''''+'where (物料编号='''+dnum+''')and(计划期='''+dorder+''')';
adocommand1.Execute;
dbgrid1.Enabled:=true;

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
//将两个浏览按钮使能关闭
bitbtn11.Enabled:=false;
bitbtn13.Enabled:=false;
//恢复dbgrid的选取功能
dbgrid1.Enabled:=true;
//恢复dbedit的只读属性
dbedit7.ReadOnly:=true;
dbmemo1.ReadOnly:=true;
//刷新数据
adoquery1.Active:=false;
adoquery1.Active:=true;
end;

//------------------取消操作--------------------
procedure TMainRequire.BitBtn9Click(Sender: TObject);
begin
datasource1.DataSet.Cancel;
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
//将两个浏览按钮使能关闭
bitbtn11.Enabled:=false;
bitbtn13.Enabled:=false;
//恢复dbgrid的选取功能
dbgrid1.Enabled:=true;
//恢复dbedit的只读属性
dbedit7.ReadOnly:=true;
dbmemo1.ReadOnly:=true;
end;

//---------------删除数据-------------
procedure TMainRequire.BitBtn7Click(Sender: TObject);
begin
if application.MessageBox('确实删除该数据？','删除',MB_OKCANCEL)=ID_OK then
 datasource1.dataset.delete;
end;


end.
