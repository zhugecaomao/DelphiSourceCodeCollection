unit LGetBackPassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzButton;

type
  TfrmGetBackPassword = class(TForm)
    GroupBox1: TGroupBox;
    Label7: TLabel;
    EditAnswer2: TEdit;
    EditQuiz2: TEdit;
    Label8: TLabel;
    Label6: TLabel;
    EditAnswer1: TEdit;
    EditQuiz1: TEdit;
    Label5: TLabel;
    Label9: TLabel;
    EditAccount: TEdit;
    Label14: TLabel;
    LabelStatus: TLabel;
    Label1: TLabel;
    EditPassword: TEdit;
    Label2: TLabel;
    EditBirthDay: TEdit;
    ButtonOK: TRzButton;
    procedure ButtonOKClick(Sender: TObject);
    procedure Open();
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmGetBackPassword: TfrmGetBackPassword;

implementation

uses Main;
var
  dwOKTick:LongWord;
{$R *.dfm}

{ TfrmGetBackPassword }

procedure TfrmGetBackPassword.Open();
begin
  ButtonOK.Enabled:=True;
  EditPassword.Text:='';
  EditAccount.Text:='';
  EditQuiz1.Text:='';
  EditAnswer1.Text:='';
  EditQuiz2.Text:='';
  EditAnswer2.Text:='';
  EditBirthDay.Text:='';
  ShowModal;
end;
procedure TfrmGetBackPassword.ButtonOKClick(Sender: TObject);
var
  sAccount,sQuest1,sAnswer1,sQuest2,sAnswer2,sBirthDay:String;
begin
  if GetTickCount - dwOKTick < 10000 then begin
    Application.MessageBox('请稍候10秒后再点确定！！！','提示信息',MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  dwOKTick:=GetTickCount();
  sAccount:=Trim(EditAccount.Text);
  sQuest1:=Trim(EditQuiz1.Text);
  sAnswer1:=Trim(EditAnswer1.Text);
  sQuest2:=Trim(EditQuiz2.Text);
  sAnswer2:=Trim(EditAnswer2.Text);
  sBirthDay:=Trim(EditBirthDay.Text);
  if sAccount = '' then begin
    Application.MessageBox('帐号输入不正确！！！','提示信息',MB_OK + MB_ICONINFORMATION);
    EditAccount.SetFocus;
    exit;
  end;
  if (sQuest1 = '') and (sAnswer1 = '') and (sQuest2 = '') and (sAnswer2 = '') then begin
    Application.MessageBox('密码问答输入不正确！！！','提示信息',MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  if (sQuest1 = '') and (sAnswer1 = '') and (sQuest2 = '') and (sAnswer2 = '') then begin
    Application.MessageBox('密码问答输入不正确！！！','提示信息',MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  if (sBirthDay = '') then begin
    Application.MessageBox('出生日期输入不正确！！！','提示信息',MB_OK + MB_ICONINFORMATION);
    EditBirthDay.SetFocus;
    exit;
  end;

  if sQuest1 = '' then sQuest1:='test';
  if sAnswer1 = '' then sAnswer1:='test';
  if sQuest2 = '' then sQuest2:='test';
  if sAnswer2 = '' then sAnswer2:='test';

  MainForm.SendGetBackPassword(sAccount, sQuest1, sAnswer1,sQuest2,sAnswer2,sBirthDay);
  ButtonOK.Enabled:=False;
end;

end.
