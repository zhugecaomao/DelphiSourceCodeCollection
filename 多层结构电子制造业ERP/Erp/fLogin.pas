unit fLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,DB;

type
  TfrmLogin = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCode: TEdit;
    edtName: TEdit;
    edtTheGroup: TEdit;
    edtPw: TEdit;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodeExit(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtPwKeyPress(Sender: TObject; var Key: Char);
  private
  theTruePw:string;
    { Private declarations }
  protected
  procedure LocateCode();
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}
uses fDM,fMain,fSplash;
procedure TfrmLogin.LocateCode;
begin
  if DM.UserInfor.Locate('Code',trim(edtCode.Text),[loPartialKey]) then
  begin
  DM.sysUser:=trim(DM.UserInfor.FieldByName('Name').AsString);
  DM.sysTheGroupInt:=DM.UserInfor.FieldByName('TheGroup').AsInteger;
  edtName.Text:=DM.sysUser;
  case DM.sysTheGroupInt of
  1: dm.sysTheGroupStr:='系统管理员';
  2: dm.sysTheGroupStr:='代管理组';
  else
     dm.sysTheGroupStr:='其他组';
  end;
  edtTheGroup.Text:=dm.sysTheGroupStr;
  theTruePw:=trim(dm.UserInfor.FieldByName('PassWord').AsString);
  edtPw.SetFocus;
  end else
      begin
      edtCode.Clear;
      edtPw.Clear;
      edtName.Clear;
      edtTheGroup.Clear;
      Application.MessageBox('无此工号！','提示',mb_ok);
      end;
end;
procedure TfrmLogin.btnCancelClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
frmMain.pwCheck:=false;
edtCode.SetFocus;
dm.UserInfor.Active:=True;
end;

procedure TfrmLogin.edtCodeKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
 LocateCode();
end;

procedure TfrmLogin.edtCodeExit(Sender: TObject);
begin
 LocateCode();
end;

procedure TfrmLogin.btnOkClick(Sender: TObject);
begin
if length(trim(edtPw.Text))<>0 then
begin
    if trim(edtPw.Text)=theTruePw then
    begin
    frmMain.pwCheck:=True;
    frmMain.StatusBar1.Panels[1].Text:='工作组: '+dm.sysTheGroupStr+'  操作员: '+dm.sysUser;
    frmMain.StatusBar1.Panels[2].Text:='日期: '+formatdatetime('yyyy-mm-dd',date);
        if not frmMain.ChangeUser then
        begin
        frmSplash.Hide;
        frmSplash.Free;
        end;
    Close;
    end else
        begin
        MessageBeep(0);
        Application.MessageBox('密码错误!','提示',mb_iconInformation+mb_Ok);
        end;
end else
    begin
    MessageBeep(0);
    Application.MessageBox('密码不能为空!','提示',mb_iconInformation+mb_Ok);
    end;
end;

procedure TfrmLogin.edtPwKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
 btnOk.Click;
end;

end.
