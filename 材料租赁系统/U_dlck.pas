unit U_dlck;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Db, DBClient, winsock, jpeg, variants, ComCtrls,
  ADODB;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    qytmp: TADOQuery;
    Label1: TLabel;
    edtAliasName: TEdit;
    Label2: TLabel;
    edtPassword: TEdit;
    btnOK: TSpeedButton;
    btnCancel: TSpeedButton;
    Image2: TImage;
    procedure btnCancelClick(Sender: TObject);
    procedure edtAliasNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOKClick(Sender: TObject);
    procedure cmbCKnameKeyPress(Sender: TObject; var Key: Char);
    procedure edtPasswordKeyPress(Sender: TObject; var Key: Char);
  private
    vFuncs: variant; //存储用户功能列表
//    procedure setFuncs; //设置主窗体菜单的有效性
    procedure Logined(bAliasName, aPassword: string);
    procedure query_dwinfo ;
 //   procedure logmenu(slogid:string);
    { Private declarations }
  public
    { Public declarations }
  end;

function LoginExecute(aFormClass: TFormClass): Boolean; //打开登录窗口，并判断是否登录成功
var
  frmLogin: TfrmLogin;
  bLogined: Boolean = false;
  vLogined:Boolean = false;
  s_value:string;
implementation

uses main, u_dm, u_public;
{$R *.DFM}
procedure TfrmLogin.query_dwinfo ;
var
  strsql:string;
begin
 strsql:='select dwcode,dw_name,dw_address,dw_past,dw_tele,dw_khyh,dw_khyhzh,dw_lxr,bz';
 strsql:=strsql+' from dwinfo';
 with qytmp do
 begin
   close;
   sql.Clear ;
   sql.Add(strsql);
   prepared;
   open;
   with CurrentParam do
   begin
     dwcode :=Fields[0].AsString ;
     name:=Fields[1].AsString ;
     address:=Fields[2].AsString ;
     past:=Fields[3].AsInteger ;
     tele:=Fields[4].AsString ;
     khyh:=Fields[5].AsString ;
     khyhzh:=Fields[6].AsString ;
     lxr:=Fields[7].AsString ;
   end;
 end;
end;

procedure TfrmLogin.Logined(bAliasName, aPassword: string);
 //    aLogined: boolean);
var
  sqlString: string;
  s:string;
begin
 vLogined := True;
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
    CurrentParam.UserName :=QYTMP.Fields[1].AsString ;
  except
    vLogined := False;
    exit;
  end;
  if LENGTH(CurrentParam.UserName) = 0 then //查到记录为O，代表身份不存在
  begin
    vLogined:= False;
    exit;
  end;
end;
//打开登录窗口，并判断是否登录成功
function LoginExecute(aFormClass: TFormClass): Boolean;
begin
  with aFormClass.Create(Application) do
  begin
    bLogined := False;
    try
      showModal;
    finally
      free;
    end;
    result := bLogined;
  end;
end;

procedure TfrmLogin.btnCancelClick(Sender: TObject);
begin
  close;
end;


procedure TfrmLogin.edtAliasNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    edtPassword.setfocus;
end;

procedure TfrmLogin.edtPasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

end;

//确定按钮点击过程
procedure TfrmLogin.btnOKClick(Sender: TObject);
var
  i: integer;
  vAliasName, vPassword: string;
begin
  vAliasName := edtAliasName.text;
  vPassword  :=edtPassword.Text;
  IF LENGTH(vPassword)=0 then
       vPassword:='ADMIN';
  vPassword := CryptStr(vPassword);
  Logined(vAliasName, vPassword);
  if not vLogined then
  begin
    Application.MessageBox('用户名和密码不正确，请重新输入', '提示信息', mb_iconInformation + mb_defbutton1);
    edtPassword.SetFocus ;
    exit;
  end
  else
  begin
    //向全局记录变量CurrentParam赋值
    CurrentParam.userAliasName := trim(edtAliasName.Text);
    CurrentParam.Host := GetComputerName;
 //   CurrentParam.IP := GetComputerIp;
  end;
  //设置主窗口菜单的有效性
//  SetFuncs;
   query_dwinfo;
   frmmain.Caption :=frmmain.Caption +'      [授于:'+CurrentParam.name+']' ;
   bLogined := true;
  Close;
end;

//设置主窗体菜单的有效性

procedure TfrmLogin.cmbCKnameKeyPress(Sender: TObject; var Key: Char);
begin
IF KEY=#13 THEN
  BTNOK.Click ;
end;

procedure TfrmLogin.edtPasswordKeyPress(Sender: TObject; var Key: Char);
begin
IF KEY=#13 THEN
  BTNOK.Click ;
end;

end.

