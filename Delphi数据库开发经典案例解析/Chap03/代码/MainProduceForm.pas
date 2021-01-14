unit MainProduceForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, ToolWin, StdCtrls, Buttons, ExtCtrls,
  ADODB, DB, DBCtrls, Mask;

type
  TMainProduce = class(TForm)
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
    Panel3: TPanel;
    BitBtn14: TBitBtn;
    DBGrid2: TDBGrid;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label15: TLabel;
    DBEdit11: TDBEdit;
    ADOQuery3: TADOQuery;
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
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure BitBtn14Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    insflag:integer;
  end;

var
  MainProduce: TMainProduce;

implementation

uses MainForm,ChooseForm;

{$R *.dfm}

//--------------下一条记录------------
procedure TMainProduce.BitBtn3Click(Sender: TObject);
begin
datasource2.DataSet.Next;

end;
//--------------上一条记录------------
procedure TMainProduce.BitBtn2Click(Sender: TObject);
begin
datasource2.DataSet.Prior;
end;
//--------------首条记录------------
procedure TMainProduce.BitBtn1Click(Sender: TObject);
begin
datasource2.DataSet.First;
end;
//--------------末条记录------------
procedure TMainProduce.BitBtn4Click(Sender: TObject);
begin
datasource2.DataSet.Last;
end;

procedure TMainProduce.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TMainProduce.BitBtn10Click(Sender: TObject);
begin
close;
end;

//查询数据
procedure TMainProduce.BitBtn12Click(Sender: TObject);
begin
adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select * from 主生产计划 where (物料编号 like ''%'+edit1.Text+'%'')and');
adoquery2.SQL.Add('(年份 like ''%'+edit2.Text+'%'')and(计划期 like ''%'+edit3.Text+'%'')');
adoquery2.Open;

end;

procedure TMainProduce.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 bitbtn12.Click;
end;

procedure TMainProduce.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 bitbtn12.Click;
end;

procedure TMainProduce.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 bitbtn12.Click;
end;




procedure TMainProduce.FormActivate(Sender: TObject);

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

procedure TMainProduce.BitBtn5Click(Sender: TObject);
begin
datasource2.DataSet.Insert;
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
dbgrid2.Enabled:=false;
//允许对需求数量和备注进行修改
dbedit7.ReadOnly:=false;
dbedit7.Text:='0';
dbedit9.ReadOnly:=false;
dbedit9.Text:='0';
dbedit8.ReadOnly:=false;
dbedit10.ReadOnly:=false;
dbedit11.ReadOnly:=false;
dbmemo1.ReadOnly:=false;
end;

procedure TMainProduce.BitBtn13Click(Sender: TObject);
var
newform:Tchoose;
begin
//标识从主需求窗体调用物料主文件窗口
main.bomflag:=4;
newform:=Tchoose.Create(application);
//将本窗口灰化
self.Enabled:=false;
//标识为第一个检索按钮按下
insflag:=1;
end;


procedure TMainProduce.BitBtn11Click(Sender: TObject);
begin
 main.bomflag:=5;
 main.N5.Click;
 //将本窗口灰化
self.Enabled:=false;
//标识为第一个检索按钮按下
insflag:=2;
end;

procedure TMainProduce.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
//设置列的宽度
dbgrid1.Columns[0].Width:=64;
dbgrid1.Columns[1].Width:=64;
dbgrid1.Columns[2].Width:=64;
dbgrid1.Columns[3].Width:=64;
dbgrid1.Columns[4].Width:=64;

end;

procedure TMainProduce.BitBtn6Click(Sender: TObject);
begin
datasource2.DataSet.Edit;
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
dbgrid2.Enabled:=false;
//允许对需求数量和备注进行修改
dbedit7.ReadOnly:=false;
dbedit9.ReadOnly:=false;
dbedit8.ReadOnly:=false;
dbedit10.ReadOnly:=false;
dbedit11.ReadOnly:=false;
dbmemo1.ReadOnly:=false;
end;

procedure TMainProduce.BitBtn8Click(Sender: TObject);

begin

datasource2.DataSet.Post;

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
dbgrid2.Enabled:=true;
//恢复dbedit的只读属性
dbedit7.ReadOnly:=true;
dbedit9.ReadOnly:=true;
dbedit8.ReadOnly:=true;
dbedit10.ReadOnly:=true;
dbedit11.ReadOnly:=true;
dbmemo1.ReadOnly:=true;
dbmemo1.ReadOnly:=true;
//刷新数据
adoquery2.Active:=false;
adoquery2.Active:=true;
end;

procedure TMainProduce.BitBtn9Click(Sender: TObject);
begin


datasource2.DataSet.Cancel;

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
dbgrid2.Enabled:=true;
//恢复dbedit的只读属性
dbedit7.ReadOnly:=true;
dbedit9.ReadOnly:=true;
dbedit8.ReadOnly:=true;
dbedit10.ReadOnly:=true;
dbedit11.ReadOnly:=true;
dbmemo1.ReadOnly:=true;
dbmemo1.ReadOnly:=true;
//刷新数据
adoquery2.Active:=false;
adoquery2.Active:=true;
end;

procedure TMainProduce.BitBtn7Click(Sender: TObject);
begin
if application.MessageBox('确实删除该数据？','删除',MB_OKCANCEL)=ID_OK then
 datasource2.dataset.delete;
end;


procedure TMainProduce.DataSource2DataChange(Sender: TObject;
  Field: TField);
begin
//为产品名称文本框查询产品名称
adoquery3.Close;
adoquery3.SQL.Clear;
adoquery3.SQL.Add('select 物料名称 from 物料主文件 where 物料编号='''+dbedit1.Text+'''');
adoquery3.Open;
dbedit2.Text:=adoquery3.FieldByName('物料名称').AsString;
end;

procedure TMainProduce.BitBtn14Click(Sender: TObject);
var
order,num:string;
begin
//选中的数据的计划期和物料编号
 order:=dbgrid1.Fields[3].AsString;
 num:=dbgrid1.Fields[0].AsString;
 //将主需求计划表中的数据送入主生产计划表
 adocommand1.CommandText:='insert into 主生产计划([物料编号], [年份], [计划期], [开始日期], [结束日期], [需求数量], [MPS数量], [状态], [备注]) select 物料编号,年份,计划期, 开始日期,结束日期,需求数量,需求数量,状态,备注 from 主需求计划 where (物料编号='''+num+''')and(计划期='''+order+''')';
 adocommand1.Execute;
 //保存到主需求计划历史
 adocommand1.CommandText:='insert into 主需求计划历史 select * from 主需求计划 where (物料编号='''+num+''')and(计划期='''+order+''')';
 adocommand1.Execute;
 //删除在主需求计划表中的已被插入到主生产计划表中的数据
  adocommand1.CommandText:='delete from 主需求计划 where (物料编号='''+num+''')and(计划期='''+order+''')';
  adocommand1.Execute;

 //刷新数据
adoquery2.Active:=false;
adoquery2.Active:=true;
adoquery1.Active:=false;
adoquery1.Active:=true;
 end;

end.
