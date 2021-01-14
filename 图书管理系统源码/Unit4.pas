unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, DB, ExtCtrls, JPEG, IniFiles, XPMenu;

type
  TForm4 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    XPMenu1: TXPMenu;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    int_login:integer;     //设置登陆次数
  public
    { Public declarations }
    bool_login:boolean;
  end;

var
  Form4: TForm4;

implementation
uses Myjiami, Unit6, Unit1;
{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
var
  ADOQuery1:TADOQuery;              //定义ADOQUERY对象
  IniFile1: TIniFile;  //INI文件类
  str_id :string;      //员工编号
  str_humanid:string;  //权限编号
  str_pwd:string;      //当前用户密码
  bool_select:boolean;
  bool_update:boolean;
  bool_delete:boolean;
  bool_insert:boolean;
begin
  if (edit1.Text='') or (edit2.Text='') then
  begin
    MessageDlg('用户名或密码不能为空！！', mtInformation, [mbYes],0);
    exit;
  end;
  str_pwd:= edit2.Text ;
  edit2.Text:=Myjiami.editstrtomd(edit2.Text,'A');    //密码加密
  ADOQuery1:=TADOQuery.Create(self);
  ADOQuery1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  ADOQuery1.Close;           //关闭QUERY
  ADOQuery1.SQL.Clear;       //清空QUERY中的SQL
  ADOQuery1.SQL.Add('select * from tab_login where user_name=:A and user_password=:B');  //重置SQL语句
  ADOQuery1.Parameters.ParamByName('A').Value:=Edit1.Text;        //赋值
  ADOQuery1.Parameters.ParamByName('B').Value:=edit2.Text;        //赋值
  ADOQuery1.Open;            //打开SQL
  if ADOQuery1.RecordCount > 0 then
  begin
    str_id:=ADOQuery1.FieldValues['employer_id'];
    str_humanid:=ADOQuery1.FieldValues['human_id'];
    form1.Menu_enable;
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select * from tab_empinfo where employer_id=:A');
    ADOQuery1.Parameters.ParamByName('A').Value:=str_id ;
    ADOQuery1.Open;  //得到员工姓名
    form6.str_oldpwd:=str_pwd;
    form1.StatusBar1.Panels[0].Text:='操作者：';
    form1.StatusBar1.Panels[0].Text:=form1.StatusBar1.Panels[0].Text+ADOQuery1.FieldValues['emp_name'];
    form1.statusbar1.Panels[1].Text:='登陆时间:    '+formatdatetime('yyyy/mm/dd hh:nn:SS',now);//得到登陆时间
    bool_login:=true;
    int_login:=0;
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select * from tab_human where human_id=:A');
    ADOQuery1.Parameters.ParamByName('A').Value:=str_humanid;
    ADOQuery1.Open;   //得到登陆者的权限
    bool_select:=ADOQuery1.FieldByName('human_select').AsBoolean;
    bool_insert:=ADOQuery1.FieldByName('human_insert').AsBoolean;
    bool_update:=ADOQuery1.FieldByName('human_update').AsBoolean;
    bool_delete:=ADOQuery1.FieldByName('human_delete').AsBoolean;
    form1.int_human:=0;
    form6.int_str_human:=0;
    if bool_select=true then
    begin
      form1.N8.Enabled:=true;
      form1.N13.Enabled:=true;
      form1.N18.Enabled:=true;
      form1.N34.Enabled:=true;
      form1.ToolButton11.Visible:=true;
      form1.ToolButton8.Visible:=true;
      form1.N21.Enabled:=true;
      form1.int_human:=2;
    end;
    if bool_insert=true then
    begin
      form1.N4.Enabled:=true;
      form1.N21.Enabled:=true;
      form1.N10.Enabled:=true;
      form1.N15.Enabled:=true;
      form1.ToolButton1.Visible:=true;
      form1.ToolButton11.Visible:=true;
      form1.ToolButton5.Visible:=true;
      form1.int_human:=2;
    end;
    if bool_update= true then
    begin
      form1.N5.Enabled:=true;
      form1.N11.Enabled:=true;
      form1.N16.Enabled:=true;
      form1.N21.Enabled:=true;
      form1.ToolButton2.Visible:=true;
      form1.ToolButton11.Visible:=true;
      form1.ToolButton6.Visible:=true;
      form1.int_human:=2;
    end;
    if bool_delete=true then
    begin
      form1.N6.Enabled:=true;
      form1.N12.Enabled:=true;
      form1.N17.Enabled:=true;
      form1.N21.Enabled:=true;
      form1.ToolButton3.Visible:=true;
      form1.ToolButton11.Visible:=true;
      form1.ToolButton7.Visible:=true;
      form1.int_human:=2;
    end;
    if (bool_select) and (bool_insert=true) and (bool_update=true) and (bool_delete=true) then
    begin
      form1.N20.Enabled:=true;
      form1.N21.Enabled:=true;
      form1.N22.Enabled:=true;
      form1.N32.Enabled:=true;
      form1.N24.Enabled:=true;
      form1.N25.Enabled:=true;
      form1.N35.Enabled:=true;
      form1.N36.Enabled:=true;
      form1.N37.Enabled:=true;
      form1.N39.Enabled:=true;
      form1.int_human:=1;
      form6.int_str_human:=1;
    end;
    form1.form_panel4Click;
    form1.PageControl1.ActivePageIndex:=1;
    form6.Edit5.Text:=edit1.Text;
    form6.str_username:=edit1.Text;
    form4.Close;
  end
  else
  begin
    MessageDlg('用户名或密码错误'+#13+'请重新输入!',mtWarning,[mbOK],0);
    edit1.Text:='';
    edit2.Text:='';
    int_login:=int_login + 1;
    if int_login=1 then
    begin
      IniFile1:= TIniFile.Create(extractfilepath(application.ExeName)+'login.ini');  //创建一个INI文件
      IniFile1.WriteInteger('loginlock','times',1);  //向文件中写入内容
      IniFile1.Free;
      messagedlg('你只有三次机会登录系统'+#13+'现在你还有两次机会！！',mtWarning,[mbOK],0);
    end;
    IF int_login=2 then
    begin
      IniFile1:= TIniFile.Create(extractfilepath(application.ExeName)+'login.ini');  //创建一个INI文件
      IniFile1.WriteInteger('loginlock','times',2);  //向文件中写入内容
      IniFile1.Free;
      MessageDlg('您还有最后一次机会'+#13+'如用户名或密码错误'+#13+'本系统将被锁定！！',mtWarning,[mbOK],0);
    end;
    if int_login=3 then   //登陆次数为3次时被锁
    begin
      IniFile1:= TIniFile.Create(extractfilepath(application.ExeName)+'login.ini');  //创建一个INI文件
      IniFile1.WriteString('loginlock','threetime','LOCK');  //向文件中写入内容
       IniFile1.WriteInteger('loginlock','times',0);
      IniFile1.Free;
      MessageDlg('由于您登陆次数太多'+#13+'系统己被锁定请与'+#13+'软件开发商联系！！',mtWarning,[mbOK],0);
      application.Terminate;  //超过次数退出程序
    end;
  end;
  form6.edit5.text:=edit1.Text;
  ADOQuery1.Free;
end;

procedure TForm4.FormCreate(Sender: TObject);
var
  JPEG:TJPEGImage;     //JPEG图片类
  IniFile1: TIniFile;  //INI文件类
  s:string;
  int_superlogin:integer;
begin
//--------------闪屏的图片设置--------
  JPEG:=TJPEGImage.Create ; //利用TPicture的对象转换bitmap与JPEG
  //如果不是位图则直接载入JPEG对象
  JPEG.LoadFromFile(extractfilepath(application.ExeName)+'RES\login.jpg');
  image1.Picture.Assign(JPEG);
  image1.stretch:=true;
  image1.Enabled:=true;
  JPEG.Free;
//--------------创建登陆INI文件
  if FileExists(extractfilepath(application.ExeName)+'login.ini') then   //文件是否存在
  begin         //文件存在
    IniFile1:= TIniFile.Create(extractfilepath(application.ExeName)+'login.ini');  //创建一个INI文件
    s:=IniFile1.ReadString('loginlock','threetime',s);  //向文件中读出内容
    int_superlogin:=IniFile1.ReadInteger('SUAD','auotlogin',int_superlogin);
    int_login := IniFile1.ReadInteger('loginlock','times',int_login);
    if int_superlogin<>1 then
    begin
      edit1.Text:='';
      edit2.Text:='';
    end;
    if int_login=1 then
    begin
      messagedlg('你只有三次机会登录系统'+#13+'现在你还有两次机会！！',mtWarning,[mbOK],0);
    end;
    IF int_login=2 then
    begin
      MessageDlg('您还有最后一次机会'+#13+'如用户名或密码错误'+#13+'本系统将被锁定！！',mtWarning,[mbOK],0);
    end;
    if s = 'LOCK' then
    begin
      MessageDlg('由于您登陆次数太多'+#13+'系统己被锁定请与'+#13+'软件开发商联系！！',mtWarning,[mbOK],0);
      application.Terminate;
    end
  end
  else
  begin          //文件不存在
    IniFile1:= TIniFile.Create(extractfilepath(application.ExeName)+'login.ini');  //创建一个INI文件
    IniFile1.WriteString('loginlock','threetime','OPEN');  //向文件中写入内容
    IniFile1.WriteInteger ('loginlock','times',int_login);  //向文件中写入登录次数
    IniFile1.WriteInteger('SUAD','auotlogin',1);  //以超级管员的身份
  end;
  IniFile1.Free;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bool_login = false then
  begin
    application.Terminate;
  end;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  close;
end;

end.
