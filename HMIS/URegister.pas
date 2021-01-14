unit URegister;          //用户注册窗体单元

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TF_Register = class(TForm)
    StaticText1: TStaticText;
    Edit1: TEdit;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    Edit2: TEdit;
    StaticText5: TStaticText;
    Edit3: TEdit;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    Edit4: TEdit;
    StaticText8: TStaticText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    ComboBox1: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Register: TF_Register;

implementation

uses DataModule, Crypt;

{$R *.dfm}

procedure TF_Register.BitBtn1Click(Sender: TObject);
begin  {*****确定按钮点击事件*****}
    if(Edit1.Text='')or(Edit3.Text<>Edit4.Text)then
      begin
      if(Edit1.Text='')then      //输入工号为空判断
        begin
        ShowMessage('请输入用户工号');
        Edit1.SetFocus;
        end;
      if(Edit3.Text<>Edit4.Text)then   //输入密码不一致判断
        begin
        ShowMessage('输入新密码不一致，请您重新输入');
        Edit3.SetFocus;
        end;
//      if(ComboBox1.Text.IsEmpty()){   //权限为空判断
//      ShowMessage('请您选择权限类型');
//      ComboBox1.SetFocus();
//      }
      end
    else
    with DM.AQ_SQL do
      begin
        Close;
        SQL.Clear;  //清除SQL语句
        SQL.Add('INSERT INTO Users(User_ID,User_Name,User_Popedom,User_Password) '); //插入一条记录 (User_ID,User_Name,User_Password)
        SQL.Add(' VALUES(:ID_Val,:Name_Val,:Pope_Val,:Pass_Val)'); //设置插入记录数据的四个参数ID_Val,Name_Val,Pass_Val
        Parameters.ParamByName('ID_Val').Value := Edit1.Text;    //四个参数分别赋值
        Parameters.ParamByName('Name_Val').Value := Edit2.Text;
        Parameters.ParamByName('Pope_Val').Value := ComboBox1.Text;
        Parameters.ParamByName('Pass_Val').Value := Encrypt(Edit3.Text);  //Encrypt为异或加密算法加密函数
        ExecSQL;     //执行SQL语句
        ShowMessage('恭喜恭喜，您已经注册成功了');
        F_Register.Close;  //关闭注册窗口，退出注册环境
      end;
end;

procedure TF_Register.BitBtn2Click(Sender: TObject);
begin  {*****取消按钮点击事件*****}
    F_Register.Close;    //关闭注册窗口，退出注册环境
end;

procedure TF_Register.Edit4KeyPress(Sender: TObject; var Key: Char);
begin  {*****密码确认输入框KeyPress事件*****}
    if (Key = #13) then        //按下回车键执行
       BitBtn1Click(self);     //调用BitBtn1按钮点击事件
end;

end.
