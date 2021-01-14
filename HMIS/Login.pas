unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, DB, ADODB, Buttons;

type
  TF_Login = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TMaskEdit;
    E_Password: TEdit;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure E_PasswordKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

  public
    { Public declarations }
  end;

var
  F_Login: TF_Login;

implementation

uses DataModule, Main, Crypt;

{$R *.dfm}

procedure TF_Login.BitBtn1Click(Sender: TObject);
var
  str :string;
begin  {*****登录按钮点击事件******}
    if (Edit1.Text = '') then       //用户工号输入框为空判断
    begin
      Application.MessageBox('请输入用户工号','提示',MB_ICONWARNING+MB_OK);
      Edit1.SetFocus;             //焦点仍在工号输入框中
      exit;
    end
    else
    with DM.AQ_SQL do
    begin                           //以下代码判断用户的合法性和权限
      Close;
      SQL.Clear;        //清除SQL语句
      SQL.Add('SELECT * FROM Users'); //增加SQL语句
      SQL.Add('WHERE User_ID=:ID');  //条件为用户工号等于输入工号,设置一个参数ID
      Parameters.ParamByName('ID').Value := Edit1.Text; //参数ID赋值
      Open;              //执行Add的SQL语句
      if (RecordCount <>1) or (Trim(FieldByName('User_Password').AsString) <> Encrypt(E_Password.Text)) then //如果用户工号或密码不对则提示密码错
      begin
        if (RecordCount <> 1) then
        begin
          Application.MessageBox('用户工号不存在，请您重新输入','错误',MB_ICONERROR+MB_OK);
          Edit1.SetFocus;
          exit;
        end;
        str := Encrypt(E_Password.Text);
        str := Trim(FieldByName('User_Password').AsString);
        if (Encrypt(E_Password.Text) <> Trim(FieldByName('User_Password').AsString)) then
        begin
//          AnsiString str=DM.AQ_SQL.FieldByName("User_Password").AsString;
          Application.MessageBox('用户密码不正确，请您重新输入','提示',MB_ICONERROR+MB_OK+MB_TASKMODAL);
          E_Password.SetFocus;
          exit;
        end;
      end
      else
      begin
        F_Main.Operator := Trim(DM.AQ_SQL['User_Name']); //用户名赋值，DM.AQ_SQL['User_Name']是另一种从数据表中取字段值的方法
        if (Trim(FieldByName('User_Popedom').AsString) = '管理员') then //管理员权限判断
        begin
          F_Main.Popedom := '管理员';
          with F_Main.mxLBar.Header[5] do
          begin
            Button[1].Enabled := true; //允许"用户注册"
            Button[3].Enabled := true; //允许"备份数据"
            Button[4].Enabled := true; //允许"还原数据"
          end;
//          F_Main.StatusBar1.Panels.Items[2].Text = "目前权限：管理员（Administrator）";
        end;
        if (Trim(FieldByName('User_Popedom').AsString) = '用户') then //客户权限判断
        begin
          F_Main.Popedom := '用户';  //赋权限值
          with F_Main.mxLBar.Header[5] do
          begin
            Button[1].Enabled := false; //不允许"用户注册"
            Button[3].Enabled := false; //不允许"备份数据"
            Button[4].Enabled := false; //不允许"还原数据"
          end;
//          F_Main.StatusBar1.Panels.Items[2].Text = "目前权限：用户（User）";
        end;
      end;
    end;
    F_Login.Close; //关闭用户登录窗口
    F_Login.Tag := 1;  //点击确定按钮标志
end;

procedure TF_Login.BitBtn2Click(Sender: TObject);
begin  {*****取消按钮点击事件******}
    Close;  //关闭窗口
end;

procedure TF_Login.E_PasswordKeyPress(Sender: TObject; var Key: Char);
begin  {*****密码输入框KeyPress事件******}
    if (Key = #13) then        //按下回车键执行
       BitBtn1Click(self);     //调用BitBtn1按钮点击事件
end;

procedure TF_Login.FormClose(Sender: TObject; var Action: TCloseAction);
begin  {*****登录窗口关闭事件******}
    if(F_Login.Tag <> 1) then
      Application.Terminate;  //中止程序运行
end;

end.
