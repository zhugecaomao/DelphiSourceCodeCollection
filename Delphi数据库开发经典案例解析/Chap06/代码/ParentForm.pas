unit ParentForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Buttons, ExtCtrls, DB,
  ADODB, Grids, DBGrids;

type
  TParent = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
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
    ImageList1: TImageList;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetButton(val:integer);
  end;

var
  Parent: TParent;

implementation

{$R *.dfm}
//显示数据表中当前数据的数量
procedure TParent.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  //显示数据数量
  label2.Caption:=inttostr(adotable1.RecordCount);
end;


//----------------转到第一条记录------------------------
procedure TParent.ToolButton1Click(Sender: TObject);
begin
 datasource1.DataSet.First;
end;
//----------------转到上一条记录------------------------
procedure TParent.ToolButton2Click(Sender: TObject);
begin
 datasource1.DataSet.Prior;
end;
//----------------转到下一条记录------------------------
procedure TParent.ToolButton3Click(Sender: TObject);
begin
 datasource1.DataSet.Next;
end;
//----------------转到最后一条记录------------------------
procedure TParent.ToolButton4Click(Sender: TObject);
begin
 datasource1.DataSet.Last;
end;
//----------------新增记录------------------------
procedure TParent.ToolButton6Click(Sender: TObject);
begin
 datasource1.DataSet.Append;
 SetButton(0);

end;
//----------------编辑记录------------------------
procedure TParent.ToolButton7Click(Sender: TObject);
begin
 datasource1.Edit;
 SetButton(0);
end;
//----------------删除记录------------------------
procedure TParent.ToolButton8Click(Sender: TObject);
begin
 if application.MessageBox('是否删除记录？','确认',MB_OKCANCEL)=IDOK then
  datasource1.DataSet.Delete;
end;
//----------------提交操作------------------------
procedure TParent.ToolButton10Click(Sender: TObject);
begin
 if datasource1.DataSet.State in [dsEdit,dsInsert] then
   begin
   datasource1.DataSet.Post;
   SetButton(1);
   end;


end;
//----------------取消操作------------------------
procedure TParent.ToolButton11Click(Sender: TObject);
begin
 datasource1.DataSet.Cancel;
 SetButton(1);
end;
//----------------关闭窗体------------------------
procedure TParent.ToolButton13Click(Sender: TObject);
begin
 close;
end;
//----------------设置按钮状态------------------------
procedure TParent.SetButton(val: integer);
begin
if val=0 then
 (*将新增，修改，删除以及首记录，上记录，下记录，尾记录等按钮enable设置为false
 而将保存，取消两按钮enable属性设置为true*)
 begin
  toolbutton1.Enabled:=false;
  toolbutton2.Enabled:=false;
  toolbutton3.Enabled:=false;
  toolbutton4.Enabled:=false;
  toolbutton6.Enabled:=false;
  toolbutton7.Enabled:=false;
  toolbutton8.Enabled:=false;
  toolbutton10.Enabled:=true;
  toolbutton11.Enabled:=true;
  //打开板上数据库控件的enable属性
  panel2.Enabled:=true;
  //锁定数据表
  dbgrid1.Enabled:=false;
  
 end
else
 (*将新增，修改，删除以及首记录，上记录，下记录，尾记录等按钮enable设置为true
 而将保存，取消两按钮enable属性设置为false*)
 begin
    toolbutton1.Enabled:=true;
    toolbutton2.Enabled:=true;
    toolbutton3.Enabled:=true;
    toolbutton4.Enabled:=true;
    toolbutton6.Enabled:=true;
    toolbutton7.Enabled:=true;
    toolbutton8.Enabled:=true;
    toolbutton10.Enabled:=false;
    toolbutton11.Enabled:=false;
    //关闭板上数据库控件的enable属性
    panel2.Enabled:=false;
    dbgrid1.Enabled:=true;

  end;

end;
//----------设置关闭窗体时的动作--------------
procedure TParent.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

//----------根据窗口中查询条件的设置来查询--------------
procedure TParent.BitBtn1Click(Sender: TObject);
var
(*设置一个整数，其二进制的三位分别代表查询条件1到3
当某一个查询条件可见，也就是要使用这个条件时，相应的位置为1，否则置0
例如第1，2个条件要使用而第3个不使用时，该整数二进制的值为110，也就是6*)
condition:integer;
begin

//初始化该参数，设为7，二进制数为111
 condition:=7;
//如果第1个条件不可用，则将该位置0，方法是和整数3（二进制011）进行与操作
if label3.Visible=false then
 condition:=(condition)and(3);

 //如果第2个条件不可用，则将该位置0，方法是和整数5（二进制101）进行与操作
if label4.Visible=false then
 condition:=(condition)and(5);

 //如果第3个条件不可用，则将该位置0，方法是和整数6（二进制110）进行与操作
if label5.Visible=false then
 condition:=(condition)and(6);

if condition=7 then//三个查询条件都存在的情况
 begin
   adoquery1.Close;
   adoquery1.SQL.Clear;
   adoquery1.SQL.Add('select * from '+adotable1.TableName);
   adoquery1.SQL.Add(' where('+label3.Caption+' like ''%'+edit1.Text+'%'')');
   adoquery1.SQL.Add('and('+label4.Caption+' like ''%'+edit2.Text+'%'')');
   adoquery1.SQL.Add('and('+label5.Caption+' like ''%'+edit3.Text+'%'')');
   adoquery1.Open;
   //将查询得到的数据通过clone命令复制到adotable中去
   adotable1.Clone(adoquery1,ltUnspecified);

 end;

if condition=6 then//只存在两个查询条件的情况
 begin
   adoquery1.Close;
   adoquery1.SQL.Clear;
   adoquery1.SQL.Add('select * from '+adotable1.TableName);
   adoquery1.SQL.Add(' where('+label3.Caption+' like ''%'+edit1.Text+'%'')');
   adoquery1.SQL.Add('and('+label4.Caption+' like ''%'+edit2.Text+'%'')');
   adoquery1.Open;
   //将查询得到的数据通过clone命令复制到adotable中去
   adotable1.Clone(adoquery1,ltUnspecified);

 end;

if condition=4 then //只存在一个查询条件的情况
 begin
   adoquery1.Close;
   adoquery1.SQL.Clear;
   adoquery1.SQL.Add('select * from '+adotable1.TableName);
   adoquery1.SQL.Add(' where('+label3.Caption+' like ''%'+edit1.Text+'%'')');
   adoquery1.Open;
   //将查询得到的数据通过clone命令复制到adotable中去
   adotable1.Clone(adoquery1,ltUnspecified);
 end;
end;

end.
