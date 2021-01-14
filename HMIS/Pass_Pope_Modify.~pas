unit Pass_Pope_Modify;    //修改密码、权限窗体单元

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TF_PP_Modi = class(TForm)
    StaticText1: TStaticText;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    StaticText2: TStaticText;
    Edit2: TEdit;
    StaticText4: TStaticText;
    Edit4: TEdit;
    Edit3: TEdit;
    CheckBox1: TCheckBox;
    StaticText3: TStaticText;
    GroupBox2: TGroupBox;
    StaticText6: TStaticText;
    ComboBox1: TComboBox;
    CheckBox2: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_PP_Modi: TF_PP_Modi;

implementation

uses DataModule, Crypt;

{$R *.dfm}

procedure TF_PP_Modi.FormCreate(Sender: TObject);
begin  {*****窗体初始化事件*****}
      Edit2.Visible := false;     //三个Edit对象不可见
      Edit3.Visible := false;
      Edit4.Visible := false;
      ComboBox1.Visible := false; //ComboBox1对象不可见
end;

procedure TF_PP_Modi.CheckBox1Click(Sender: TObject);
begin  {*****修改密码CheckBox点击事件*****}
    if CheckBox1.Checked then       //CheckBox1选中判断
      begin
      Edit2.Visible := true;        //三个Edit对象可见
      Edit3.Visible := true;
      Edit4.Visible := true;
      end
    else
      begin
      Edit2.Visible := false;     //三个Edit对象不可见
      Edit3.Visible := false;
      Edit4.Visible := false;
      end;
end;

procedure TF_PP_Modi.CheckBox2Click(Sender: TObject);
begin  {*****修改权限CheckBox点击事件*****}
    if CheckBox2.Checked then        //CheckBox2选中判断
      ComboBox1.Visible := true   //ComboBox1对象可见
    else
      ComboBox1.Visible := false; //ComboBox1对象不可见
end;

procedure TF_PP_Modi.BitBtn1Click(Sender: TObject);
begin  {*****确定按钮点击事件*****}
  if CheckBox1.Checked then         //修改密码CheckBox1选中判断
    begin
    if (Edit1.Text = '')or(Edit3.Text <> Edit4.Text) then
      begin
      if Edit1.Text='' then  //工号输入框为空判断
        begin
        ShowMessage('请输入用户工号');
        Edit1.SetFocus;          //焦点仍在工号输入框中
        exit;
        end;
      if(Edit3.Text <> Edit4.Text)then //密码输入是否一致判断
        begin
        ShowMessage('输入新密码不一致，请您重新输入');
        Edit3.SetFocus;
        exit;
        end;
      end
    else                       //检查用户工号和密码是否正确
    with DM.AQ_SQL do
      begin
        Close;
        SQL.Clear;  //清除SQL语句
        SQL.Add('SELECT User_ID,User_Password FROM Users');
        SQL.Add('WHERE User_ID=:ID_Val');  //设置查询条件数据的两个参数ID_Val,Password
        SQL.Add('AND User_Password=:PassWord');
        Parameters.ParamByName('ID_Val').Value := Edit1.Text;  //两个参数赋值
        Parameters.ParamByName('PassWord').Value := Encrypt(Edit2.Text);  //Encrypt为异或加密算法解密函数
        Open;       //执行SQL语句
      if RecordCount<>1 then
        begin
        ShowMessage('密码不正确，请重新输入');
        Edit2.SetFocus;
        exit;
        end
      else
        begin
          Edit;     //进入记录编辑状态
          FieldByName('User_Password').Value := Encrypt(Edit3.Text);
          Post;
          Application.MessageBox('密码修改成功', '提示', MB_ICONINFORMATION+MB_OK);
        end;
      end;
    end;
  ////修改权限这部分功能已经屏蔽
  if CheckBox2.Checked then //修改权限CheckBox2选中判断
  begin
    if ComboBox1.Text='' then
      begin
      ShowMessage('请您选择权限类型');
      ComboBox1.SetFocus;
      exit;
      end
    else    //检查用户工号和密码是否正确
    with DM.AQ_SQL do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT User_ID,User_Popedom FROM Users');
        SQL.Add('WHERE User_ID=:User_Val'); //设置参数
        Parameters.ParamByName('User_Val').Value := Edit1.Text;  //参数赋值
        Open;
      if(RecordCount <> 1)then
        begin
        ShowMessage('此用户工号不存在');
        Edit1.SetFocus();
        end
      else
        begin
          Edit;  //进入记录编辑状态
          FieldByName('User_Popedom').Value := ComboBox1.Text;
          Post;
        ShowMessage('权限修改成功');
        end;
      end;
  end;   
  F_PP_Modi.Close;
end;

procedure TF_PP_Modi.BitBtn2Click(Sender: TObject);
begin  {*****取消按钮点击事件*****}
    F_PP_Modi.Close;        
end;

procedure TF_PP_Modi.Edit4KeyPress(Sender: TObject; var Key: Char);
begin  {*****确认密码输入框KeyPress事件*****}
    if (Key = #13) then        //按下回车键执行
      BitBtn1Click(self);      //调用BitBtn1按钮点击事件
end;

end.
