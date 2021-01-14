unit u_xgmm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, Buttons, StdCtrls, Mask, ExtCtrls, DBTables, Variants,
  ADODB;

type
  TfrmXgmm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    btnOK: TSpeedButton;
    btnCancel: TSpeedButton;
    edtOldPassword: TEdit;
    edtNewPassword: TEdit;
    edtConPassword: TEdit;
    qytmp: TADOQuery;
    edtName: TLabeledEdit;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtOldPasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNewPasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConPasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edtNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
     aLogined, succeed: boolean;
    { Private declarations }
    procedure Logined(bAliasName, aPassword: string; var aYhbh, aZH:string);
//      aLogined: boolean);
    procedure updatePassword(bAliasName, aPassword: string);
//      var aResult: boolean);
{    procedure Logined(bAliasName, aPassword: string; var aYhbh, aZH:string;
      aLogined: boolean); safecall;
    procedure updatePassword(bAliasName, aPassword: string;
      var aResult: boolean); safecall;   }

//    procedure Logined(bAliasName, aPassword: OleVariant; var aYhbh, aZH,
//      aLogined: OleVariant); safecall;
//    procedure updatePassword(bAliasName, aPassword: OleVariant;
//      var aResult: OleVariant); safecall;

  public
    { Public declarations }
  end;

var
  frmXgmm: TfrmXgmm;

implementation

uses main,u_dm,U_public;

//uses U_mainform, u_public;

{$R *.DFM}
procedure TfrmXgmm.Logined(bAliasName, aPassword: string; var aYhbh, aZH:string);
 //    aLogined: boolean);
var      
  sqlString: string;
begin
  aLogined := True;
    //用SQL语句来判断身份是否存在
  sqlString := 'select log_id,login_name,LOGIN_PASS from USESZ where (LOG_ID=:@LOG)';
  sqlString := sqlString + ' AND (login_pass=:@pass)';
  qytmp.Close ;
  qytmp.SQL.Clear;
  qytmp.SQL.Add(sqlString);
  qytmp.Parameters.ParamByName('@log').Value :=bAliasName;
  qytmp.Parameters.ParamByName('@pass').Value :=aPassword;
  qytmp.Prepared;
  try
    qytmp.Open;
//    CurrentParam.UserName:=QYTMP.Fields[2].AsVariant ;
    CurrentParam.UserName :=QYTMP.Fields[1].AsString ;
  except
    aLogined := False;
    exit;
  end;
  if LENGTH(CurrentParam.UserName) = 0 then //查到记录为O，代表身份不存在
  begin
    aLogined:= False;
    exit;
  end;
end;

procedure TfrmXgmm.updatePassword(bAliasName, aPassword: string);
//      var aResult: boolean);
var
  sqlString: string;
begin
  succeed := True;
  sqlString := 'update Usesz set login_pass=:@pass';
  sqlString := sqlString + ' where log_id=:@LOG';
  qytmp.Close ;
  qytmp.SQL.Clear;
  qytmp.SQL.Add(sqlString);
  qytmp.Parameters.ParamByName('@log').Value :=bAliasName;
  qytmp.Parameters.ParamByName('@pass').Value :=aPassword;
  QYTMP.Prepared ;
  try
    qytmp.ExecSQL;
  except
    succeed := False;
  end;
end;

//确定按钮点击过程
procedure TfrmXgmm.btnOKClick(Sender: TObject);
var
  Yhbh, Zh:string;
//   aLogined, succeed: boolean;
  AliasName, Password: string;
begin
  AliasName := trim(edtname.Text) ;
  Password := trim(edtOldPassword.Text);
   Password := CryptStr(trim(edtOldPassword.Text));
  //调用应用服务器的Logined方法，判断旧密码是否正确
  Logined(AliasName, Password, Yhbh, zh);//,aLogined);
  if not aLogined then
  begin
    application.messagebox('旧密码输入不正确', '材料租赁系统', mb_iconinformation + mb_defbutton1);
    edtOldPassword.text := '';
    edtOldPassword.SetFocus;
    exit;
  end;
  if edtConPassword.text <> edtNewPassword.text then
  begin
    application.messagebox('密码输入不一致', '材料租赁系统', mb_iconinformation + mb_defbutton1);
    edtConPassword.text := '';
    edtNewPassword.text := '';
    edtNewPassword.SetFocus;
    exit;
  end;

  if length(trim(edtConPassword.text))<6 then
  begin
    application.messagebox('密码输入不得少于六位和大于十位', '材料租赁系统', mb_iconinformation + mb_defbutton1);
    edtConPassword.text := '';
    edtNewPassword.text := '';
    edtNewPassword.SetFocus;
   exit;
  end;
  Password := trim(edtNewPassword.Text);
  Password:=CryptStr(trim(edtNewPassword.Text));
  //调用应用服务器的UpdatePassword方法更新密码
  UpdatePassword(AliasName, Password);//,succeed);
  if succeed then
    application.messagebox('密码修改成功', '材料租赁系统', mb_iconinformation + mb_defbutton1)
  else
  begin
    application.messagebox('密码修改失败', '材料租赁系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  close;
end;

//取消按钮点击过程
procedure TfrmXgmm.btnCancelClick(Sender: TObject);
begin
  close;
end;

//旧密码输入框按键处理过程
procedure TfrmXgmm.edtOldPasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //如果按键是“回车键”，就输入焦点切换到新密码输入框
//  if key = 13 then
//    edtNewPassword.SetFocus;
end;

//新密码输入框按键处理过程
procedure TfrmXgmm.edtNewPasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //如果按键是“回车键”，就输入焦点切换到确认密码输入框
//  if key = 13 then
//    edtConPassword.SetFocus;
end;

//确认密码输入框按键处理过程
procedure TfrmXgmm.edtConPasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //如果按键是“回车键”,调用“确定”按钮点击过程
  if key = 13 then
    btnOK.click;
end;

procedure TfrmXgmm.FormCreate(Sender: TObject);
begin
//dminfos.tbLogin.Active :=true;
end;



procedure TfrmXgmm.edtNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //如果按键是“回车键”，就输入焦点切换到新密码输入框


end;

end.

