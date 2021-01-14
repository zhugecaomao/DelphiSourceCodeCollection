unit EditUserLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ExtCtrls, SUIForm, SUIButton, StdCtrls, myClass;

type
  TfrmEditUserLogin = class(TBaseFrm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    chkEnabled: TCheckBox;
    edtUserLoginId: TEdit;
    edtDescription: TEdit;
    edtPassword: TEdit;
    edtPassword1: TEdit;
    btnSave: TsuiButton;
    btnCancel: TsuiButton;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    fUserLogin:TUserLogin;
    procedure SetUserLogin(value:TUserLogin);
    procedure BuildUserLogin;
  public
    { Public declarations }
    partyId:String;
    property UserLogin:TUserLogin read fUserLogin write SetUserLogin;
  end;

var
  frmEditUserLogin: TfrmEditUserLogin;

implementation

uses DataModule;

{$R *.dfm}

{ TfrmEditUserLogin }

procedure TfrmEditUserLogin.BuildUserLogin;
begin
  if not Assigned(fUserLogin) then fUserLogin:=TUserLogin.Create;
  fUserLogin.partyId:=partyId;
  with fUserLogin do
  begin
    userLoginId:=edtUserLoginId.Text;
    description:=edtDescription.Text;
    password:=edtPassword.Text;
    enabled:=chkEnabled.Checked;
  end;
end;

procedure TfrmEditUserLogin.FormShow(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmEditUserLogin.SetUserLogin(value: TUserLogin);
begin
  fUserLogin:=value;
  edtUserLoginId.Enabled:=true;
  edtUserLoginId.Text:='';
  edtDescription.Text:='';
  edtPassword.Text:='';
  edtPassword1.Text:='';
  chkEnabled.Checked:=true;
  if Assigned(value) then
  begin
    edtUserLoginId.Enabled:=false;
    edtUserLoginId.Text:=value.userLoginId;
    edtDescription.Text:=value.description;
    edtPassword.Text:=value.password;
    edtPassword1.Text:=value.password;
    chkEnabled.Checked:=value.enabled;
  end;
end;

procedure TfrmEditUserLogin.btnSaveClick(Sender: TObject);
var
  userlogin:TUserLogin;
begin
  inherited;
  if Assigned(fUserLogin) then
  begin
    BuildUserLogin;
    DataModule_frm.update_UserLogin(fUserLogin);
  end
  else
  begin
    BuildUserLogin;
    userlogin:=DataModule_frm.GetUserLogin(fUserLogin.userLoginId);
    if Assigned(userlogin) then
    begin
      Application.MessageBox(PChar(''''+userLogin.userLoginId+'''登录名已存在'),'提示',MB_OK +MB_ICONWARNING);
      exit;
    end;
    DataModule_frm.insert_UserLogin(fUserLogin);
  end;
  Close;
end;

procedure TfrmEditUserLogin.btnCancelClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
