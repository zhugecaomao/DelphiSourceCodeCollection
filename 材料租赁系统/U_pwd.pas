unit U_pwd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TfrmPwd = class(TForm)
    GroupBox1: TGroupBox;
    edtNewpwd: TLabeledEdit;
    edtYPWD: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPwd: TfrmPwd;
  strsql:string;
implementation
uses  u_public,U_DM;
{$R *.dfm}

procedure TfrmPwd.BitBtn2Click(Sender: TObject);
begin
CurrentParam.tmpFind:=false;
close;
end;

procedure TfrmPwd.BitBtn1Click(Sender: TObject);
var
  s1,s2:string;
begin
   s1:=trim(edtnewpwd.Text);
   s2:=trim(edtypwd.Text);
 if s1='' then
 begin
    application.MessageBox('人员密码不为空！，请重新输入新的密码!', '材料租赁系统', mb_iconinformation + mb_defbutton1);
    edtnewpwd.SetFocus;
    exit;
 end;

 if (length(s1)<6) or (length(s1)>10) then
 begin
    application.MessageBox('人员密码不能小于六位大于十位！，请重新输入新的密码!', '材料租赁系统', mb_iconinformation + mb_defbutton1);
    edtnewpwd.SetFocus;
    exit;
 end;


  if  s1<>s2 then
  begin
    application.MessageBox('两次输入的密码不相符，请重新输入新的密码!', '材料租赁系统', mb_iconinformation + mb_defbutton1);
    edtnewpwd.SetFocus;
    exit;
  end;

  s1:= CryptStr(s1);
  dm.ADO_USESZ.FieldByName('login_pass').AsString :=s1;
  CurrentParam.tmpFind :=true;
  application.MessageBox('密码设置成功!', '材料租赁系统', mb_iconinformation + mb_defbutton1);
  close;
end;

end.
