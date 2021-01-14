unit FormLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  Tlogin = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    Edit3: TEdit;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

   
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    

    private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  login: Tlogin;

implementation

uses FormManage, FormInfo;

{$R *.dfm}

//--------------------------输入编号自动显示用户名-----------
procedure Tlogin.Edit3Exit(Sender: TObject);
begin
  adoquery1.Close;
 adoquery1.SQL.Clear;
 adoquery1.SQL.Add('select 姓名 from 用户清单 where 用户编号='''+edit3.Text+'''');
 adoquery1.Open;
 edit1.Text:=adoquery1.fieldbyname('姓名').AsString;

end;

//---------------------输入编号后回车，跳到帐号输入框------------
procedure Tlogin.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then { 判断是按执行键}
//实际上也可以调用edit3的onexit方法来实现，是一样的
 begin
 adoquery1.Close;
 adoquery1.SQL.Clear;
 adoquery1.SQL.Add('select 姓名 from 用户清单 where 用户编号='''+edit3.Text+'''');
 adoquery1.Open;
 edit1.Text:=adoquery1.fieldbyname('姓名').AsString;
 end;
end;


//------------光标在密码框上时可按enter键执行查询-----------
procedure Tlogin.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then { 判断是按执行键}
button1.Click;
end;



//--------------用户名和密码校验登录系统--------------------------------------------------------------
procedure Tlogin.Button1Click(Sender: TObject);
var
num,user,pass,temp:string;

begin
//------------------根据用户输入的密码和帐号进行查询----------
 //保存用户输入的帐号和密码
 user:=edit1.Text;
 pass:=Edit2.Text;
//使用ADOQuery1组件时要养成好的习惯，先将其关闭，
//将原来的SQL语句清除后再添加新的SQL语句
 ADOQuery1.Close;
 ADOQuery1.SQL.Clear;
 ADOQuery1.SQL.Text:='select 用户编号 from 用户清单 where 姓名='''+user+'''and 密码='''+pass+'''';
 Adoquery1.Open;
 temp:=adoquery1.FieldByName('用户编号').AsString;
 if temp<>'' then
 //如果输入了正确的用户名和密码，那么必然能查到用户编号，否则结果为空
 begin

 //---------------根据用户获得的权限来确定能否操作相关窗口-----------------------
//先将所有按钮使能都设为否
    manage.Button1.Enabled:=false;
    manage.Button2.Enabled:=false;
    manage.Button3.Enabled:=false;
    manage.Button4.Enabled:=false;
    manage.Button5.Enabled:=false;
    info.N2.Enabled:=false;
    info.N3.Enabled:=false;
    info.N4.Enabled:=false;

//--------检查用户是否具有进货单权限，如是，则将进货单按钮置为可用----------
    adoquery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text:='select 权限序号 from 权限清单 where 用户编号='''+temp+'''and 权限名称=''进货单''';
    Adoquery1.Open;
    if adoquery1.FieldByName('权限序号').AsString<>'' then
    manage.Button2.Enabled:=true;

//-----------检查用户是否具有销售单权限，如是，则将销售单按钮置为可用---------------
    adoquery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text:='select 权限序号 from 权限清单 where 用户编号='''+temp+'''and 权限名称=''销售单''';
    Adoquery1.Open;
    if adoquery1.FieldByName('权限序号').AsString<>'' then
    manage.Button3.Enabled:=true;

//------------检查用户是否具有库存查询权限，如是，则将库存管理按钮置可用--------
    adoquery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text:='select 权限序号 from 权限清单 where 用户编号='''+temp+'''and 权限名称=''库存查询''';
    Adoquery1.Open;
    if adoquery1.FieldByName('权限序号').AsString<>'' then
    manage.Button4.Enabled:=true;

//----------检查用户是否具有权限管理权限，如是，则将权限管理按钮置为可用---------
    adoquery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text:='select 权限序号 from 权限清单 where 用户编号='''+temp+'''and 权限名称=''权限管理''';
    Adoquery1.Open;
    if adoquery1.FieldByName('权限序号').AsString<>'' then
    manage.Button5.Enabled:=true;

//---------检查用户是否具有商品资料维护权限，如是，则将资料维护按钮和商品资料维护菜单置为可用----------------------
    adoquery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text:='select 权限序号 from 权限清单 where 用户编号='''+temp+'''and 权限名称=''商品资料维护''';
    Adoquery1.Open;
    if adoquery1.FieldByName('权限序号').AsString<>'' then
    begin
    info.N2.Enabled:=true;
    manage.Button1.Enabled:=true
    end;

//-------检查用户是否具有供货商资料维护权限，如是，则将资料维护按钮和供货商资料维护菜单置可用------
    adoquery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text:='select 权限序号 from 权限清单 where 用户编号='''+temp+'''and 权限名称=''供货商资料维护''';
    Adoquery1.Open;
    if adoquery1.FieldByName('权限序号').AsString<>'' then
    begin
    info.N3.Enabled:=true;
    manage.Button1.Enabled:=true
    end;

//---------检查用户是否具有客户资料维护权限，如是，则将资料维护按钮和客户资料维护菜单置为可用----
    adoquery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text:='select 权限序号 from 权限清单 where 用户编号='''+temp+'''and 权限名称=''客户资料维护''';
    Adoquery1.Open;
    if adoquery1.FieldByName('权限序号').AsString<>'' then
    begin
    info.N4.Enabled:=true;
    manage.Button1.Enabled:=true
    end;
//---------登录成功，在管理窗体的状态栏上标示登录的用户名---------------
  manage.Visible:=true;
  manage.StatusBar1.Panels[0].Text:=user;

  login.Hide;
 end
//---------登录失败，提示用户重新输入----------------------------------
  else
   begin
    ShowMessage('用户名或密码错误，请检查后重新登录');
   end

end;

//----------登录窗口再次显示时，清空原来输入的用户名和密码--------------
procedure Tlogin.FormShow(Sender: TObject);
begin
edit1.Clear;
edit2.Clear;
end;







end.


