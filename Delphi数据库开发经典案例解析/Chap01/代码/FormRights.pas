unit FormRights;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, DBCtrls, ExtCtrls;

type
  Trights = class(TForm)
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    GroupBox2: TGroupBox;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ComboBox1: TComboBox;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    Button1: TButton;
    Label1: TLabel;
    ADOQuery3: TADOQuery;
    ADOCommand1: TADOCommand;
    Label2: TLabel;
    
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rights: Trights;
  UserName:string;
  UserNumber,MaxNumber:string;
  order:integer;

implementation

uses FormManage;

{$R *.dfm}


//-----------关闭窗体时同时关闭对权限清单的插入许可功能------------------
procedure Trights.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//先将对权限清单表的插入功能关闭
adocommand1.CommandText:='SET IDENTITY_INSERT 权限清单 off';
adocommand1.Execute;
//关闭窗体是返回上一级窗体
manage.show;
end;

//------------------窗体显示时，为下拉列表框设置用户词典------------------------
//-------------------不允许对管理员sys的权限进行设置-------------------------
procedure Trights.FormShow(Sender: TObject);
begin

 adoquery1.Close;
 adoquery1.SQL.Clear;
 adoquery1.SQL.Text:='select distinct 姓名 from 用户清单 where 姓名!=''sys''';
 adoquery1.Open;
 combobox1.Clear;
 while not adoquery1.Eof do
begin
 combobox1.Items.Add(adoquery1.fieldbyname('姓名').AsString);
 adoquery1.Next;
 end
end;

//--------------将下拉列表中选中的用户所对应拥有的权限显示在列表框中---------
procedure Trights.ComboBox1Change(Sender: TObject);
var
 str,temp:string;
begin
adoquery2.Close;
adoquery2.SQL.clear;
adoquery2.SQL.Text:='select 权限名称 from 权限清单 where 用户编号=(select 用户编号 from 用户清单 where 姓名='''+combobox1.Text+''''+')';
adoquery2.Open;
listbox1.Clear;

while not adoquery2.Eof do
 begin
  temp:=adoquery2.fieldbyname('权限名称').AsString;
  listbox1.Items.Add(temp);
  adoquery2.Next;
  end;

//----------------------根据用户的权限修改checkbox中的内容-----------
//--------------------判断用户是否拥有商品清单管理权限--------------
adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select 用户编号 from 权限清单 where (用户编号=(select 用户编号 from 用户清单 where 姓名='''+combobox1.Text+'''))and(权限名称='''+checkbox1.Caption+''')');
adoquery2.Open;
if adoquery2.FieldByName('用户编号').AsString<>'' then
 checkbox1.Checked:=true
 else
 checkbox1.Checked:=false;
//--------------------判断用户是否拥有供货商资料管理权限--------------
adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select 用户编号 from 权限清单 where (用户编号=(select 用户编号 from 用户清单 where 姓名='''+combobox1.Text+'''))and(权限名称='''+checkbox2.Caption+''')');
adoquery2.Open;
if adoquery2.FieldByName('用户编号').AsString<>'' then
 checkbox2.Checked:=true
 else
 checkbox2.Checked:=false;
//--------------------判断用户是否拥有客户资料管理权限--------------
adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select 用户编号 from 权限清单 where (用户编号=(select 用户编号 from 用户清单 where 姓名='''+combobox1.Text+'''))and(权限名称='''+checkbox3.Caption+''')');
adoquery2.Open;
if adoquery2.FieldByName('用户编号').AsString<>'' then
 checkbox3.Checked:=true
 else
 checkbox3.Checked:=false;
//--------------------判断用户是否拥有进货单权限--------------
 adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select 用户编号 from 权限清单 where (用户编号=(select 用户编号 from 用户清单 where 姓名='''+combobox1.Text+'''))and(权限名称='''+checkbox4.Caption+''')');
adoquery2.Open;
if adoquery2.FieldByName('用户编号').AsString<>'' then
 checkbox4.Checked:=true
 else
 checkbox4.Checked:=false;
//--------------------判断用户是否拥有商品销售单管理权限--------------
 adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select 用户编号 from 权限清单 where (用户编号=(select 用户编号 from 用户清单 where 姓名='''+combobox1.Text+'''))and(权限名称='''+checkbox5.Caption+''')');
adoquery2.Open;
if adoquery2.FieldByName('用户编号').AsString<>'' then
 checkbox5.Checked:=true
 else
 checkbox5.Checked:=false;
//--------------------判断用户是否拥有库存查询权限--------------
 adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select 用户编号 from 权限清单 where (用户编号=(select 用户编号 from 用户清单 where 姓名='''+combobox1.Text+'''))and(权限名称='''+checkbox6.Caption+''')');
adoquery2.Open;
if adoquery2.FieldByName('用户编号').AsString<>'' then
 checkbox6.Checked:=true
 else
 checkbox6.Checked:=false;
//--------------------判断用户是否拥有权限管理权限--------------
 adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select 用户编号 from 权限清单 where (用户编号=(select 用户编号 from 用户清单 where 姓名='''+combobox1.Text+'''))and(权限名称='''+checkbox7.Caption+''')');
adoquery2.Open;
if adoquery2.FieldByName('用户编号').AsString<>'' then
 checkbox7.Checked:=true
 else
 checkbox7.Checked:=false;
end;

//--------------------修改选择的用户的权限---------------------------------
 procedure Trights.Button1Click(Sender: TObject);
 var str:string;
 begin
//获得与某个用户相对应的用户编号
UserName:=combobox1.Text;
adoquery3.Close;
adoquery3.SQL.clear;
adoquery3.SQL.Text:='select 用户编号 from 用户清单 where 姓名='''+UserName+'''';
adoquery3.Open;
UserNumber:=adoquery3.fieldbyname('用户编号').AsString;
adoquery3.Close;

//计算权限清单中的权限序号之最大值，以免其后输入的权限序号与已有的冲突
adoquery3.Close;
adoquery3.SQL.clear;
adoquery3.SQL.Text:='select max(权限序号) maxnum from 权限清单 as max';
adoquery3.Open;
MaxNumber:=adoquery3.fieldbyname('maxnum').AsString;
adoquery3.Close;

//删除该用户的所有权限记录以备下一步的修改
adocommand1.CommandText:='delete from 权限清单 where 用户编号='''+UserNumber+'''';
adocommand1.Execute;

//打开对用户权限记录表的插入权限，这是由建立数据库的时候就设置好的，用完后需要把它关闭
adocommand1.CommandText:='SET IDENTITY_INSERT 权限清单 on';
adocommand1.Execute;

//检查checkbox1状态，判断是否给该用户商品资料维护权限
if checkbox1.Checked then
begin
 order:=strtoint(MaxNumber)+1;
 str:=inttostr(order);

 adocommand1.CommandText:='insert into 权限清单([权限序号],[用户编号],[权限名称]) values('''+str+''','+''''+UserNumber+''','+''''+checkbox1.Caption+''''+')';
 adocommand1.Execute;
end;

 //检查checkbox2状态，判断是否给该用户供货商资料维护权限
if checkbox2.Checked then
begin
 order:=strtoint(MaxNumber)+2;
 str:=inttostr(order);

 adocommand1.CommandText:='insert into 权限清单([权限序号],[用户编号],[权限名称]) values('''+str+''','+''''+UserNumber+''','+''''+checkbox2.Caption+''''+')';
 adocommand1.Execute;
end;

 //检查checkbox3状态，判断是否给该用户客户资料维护权限
if checkbox3.Checked then
begin
 order:=strtoint(MaxNumber)+3;
 str:=inttostr(order);

 adocommand1.CommandText:='insert into 权限清单([权限序号],[用户编号],[权限名称]) values('''+str+''','+''''+UserNumber+''','+''''+checkbox3.Caption+''''+')';
 adocommand1.Execute;
end;

  //检查checkbox4状态，判断是否给该用户进货单访问权限
if checkbox4.Checked then
begin
 order:=strtoint(MaxNumber)+4;
 str:=inttostr(order);

 adocommand1.CommandText:='insert into 权限清单([权限序号],[用户编号],[权限名称]) values('''+str+''','+''''+UserNumber+''','+''''+checkbox4.Caption+''''+')';
 adocommand1.Execute;
end;

 //检查checkbox5状态，判断是否给该用户销售单访问权限
if checkbox5.Checked then
begin
 order:=strtoint(MaxNumber)+5;
 str:=inttostr(order);

 adocommand1.CommandText:='insert into 权限清单([权限序号],[用户编号],[权限名称]) values('''+str+''','+''''+UserNumber+''','+''''+checkbox5.Caption+''''+')';
 adocommand1.Execute;
end;

 //检查checkbox6状态，判断是否给该用户库存查询权限
if checkbox6.Checked then
begin
 order:=strtoint(MaxNumber)+6;
 str:=inttostr(order);

 adocommand1.CommandText:='insert into 权限清单([权限序号],[用户编号],[权限名称]) values('''+str+''','+''''+UserNumber+''','+''''+checkbox6.Caption+''''+')';
 adocommand1.Execute;
end;

  //检查checkbox7状态，判断是否给该权限管理权限
if checkbox7.Checked then
begin
 order:=strtoint(MaxNumber)+7;
 str:=inttostr(order);

 adocommand1.CommandText:='insert into 权限清单([权限序号],[用户编号],[权限名称]) values('''+str+''','+''''+UserNumber+''','+''''+checkbox7.Caption+''''+')';
 adocommand1.Execute;
end;

//通知用户修改成功
  showmessage('修改成功!');

//----------------------根据用户的权限修改同步更新checkbox中的内容-----------
//--------------------判断更新后用户是否拥有商品清单管理权限--------------
adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select 用户编号 from 权限清单 where (用户编号=(select 用户编号 from 用户清单 where 姓名='''+combobox1.Text+'''))and(权限名称='''+checkbox1.Caption+''')');
adoquery2.Open;
if adoquery2.FieldByName('用户编号').AsString<>'' then
 checkbox1.Checked:=true
 else
 checkbox1.Checked:=false;
//--------------------判断更新后用户是否拥有供货商资料维护权限--------------
adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select 用户编号 from 权限清单 where (用户编号=(select 用户编号 from 用户清单 where 姓名='''+combobox1.Text+'''))and(权限名称='''+checkbox2.Caption+''')');
adoquery2.Open;
if adoquery2.FieldByName('用户编号').AsString<>'' then
 checkbox2.Checked:=true
 else
 checkbox2.Checked:=false;
//--------------------判断更新后用户是否拥有客户资料维护权限--------------
adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select 用户编号 from 权限清单 where (用户编号=(select 用户编号 from 用户清单 where 姓名='''+combobox1.Text+'''))and(权限名称='''+checkbox3.Caption+''')');
adoquery2.Open;
if adoquery2.FieldByName('用户编号').AsString<>'' then
 checkbox3.Checked:=true
 else
 checkbox3.Checked:=false;
//--------------------判断更新后用户是否拥有进货单管理权限--------------
 adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select 用户编号 from 权限清单 where (用户编号=(select 用户编号 from 用户清单 where 姓名='''+combobox1.Text+'''))and(权限名称='''+checkbox4.Caption+''')');
adoquery2.Open;
if adoquery2.FieldByName('用户编号').AsString<>'' then
 checkbox4.Checked:=true
 else
 checkbox4.Checked:=false;
//--------------------判断更新后用户是否拥有销售单管理权限--------------
 adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select 用户编号 from 权限清单 where (用户编号=(select 用户编号 from 用户清单 where 姓名='''+combobox1.Text+'''))and(权限名称='''+checkbox5.Caption+''')');
adoquery2.Open;
if adoquery2.FieldByName('用户编号').AsString<>'' then
 checkbox5.Checked:=true
 else
 checkbox5.Checked:=false;
//--------------------判断更新后用户是否拥有库存查询权限--------------
 adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select 用户编号 from 权限清单 where (用户编号=(select 用户编号 from 用户清单 where 姓名='''+combobox1.Text+'''))and(权限名称='''+checkbox6.Caption+''')');
adoquery2.Open;
if adoquery2.FieldByName('用户编号').AsString<>'' then
 checkbox6.Checked:=true
 else
 checkbox6.Checked:=false;
//--------------------判断更新后用户是否拥有权限管理权限--------------
 adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select 用户编号 from 权限清单 where (用户编号=(select 用户编号 from 用户清单 where 姓名='''+combobox1.Text+'''))and(权限名称='''+checkbox7.Caption+''')');
adoquery2.Open;
if adoquery2.FieldByName('用户编号').AsString<>'' then
 checkbox7.Checked:=true
 else
 checkbox7.Checked:=false;

//-------------刷新更新后的列表框中的权限清单------------

adoquery2.Close;
adoquery2.SQL.clear;
adoquery2.SQL.Text:='select 权限名称 from 权限清单 where 用户编号=(select 用户编号 from 用户清单 where 姓名='''+combobox1.Text+''''+')';
adoquery2.Open;
listbox1.Clear;
while not adoquery2.Eof do
 begin
  listbox1.Items.Add(adoquery2.fieldbyname('权限名称').AsString);
  adoquery2.Next;
  end;
end;
end.
