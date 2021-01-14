unit LNewAccount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Grobal2, RzButton, Main;

type
  TfrmNewAccount = class(TForm)
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    EditPassword: TEdit;
    EditAccount: TEdit;
    Label1: TLabel;
    EditConfirm: TEdit;
    Label2: TLabel;
    EditYourName: TEdit;
    Label3: TLabel;
    EditSSNo: TEdit;
    Label4: TLabel;
    EditBirthDay: TEdit;
    Label5: TLabel;
    EditQuiz1: TEdit;
    Label6: TLabel;
    EditAnswer1: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    EditQuiz2: TEdit;
    EditAnswer2: TEdit;
    MemoHelp: TMemo;
    Label11: TLabel;
    EditPhone: TEdit;
    Label12: TLabel;
    EditMobPhone: TEdit;
    Label13: TLabel;
    EditEMail: TEdit;
    Label14: TLabel;
    LabelStatus: TLabel;
    Label15: TLabel;
    ButtonOK: TRzButton;
    procedure EditEnter(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
  private
    function CheckUserEntrys():Boolean;
    function NewIdCheckBirthDay():Boolean;
    { Private declarations }

  public
    procedure Open();
    { Public declarations }
  end;

var
  frmNewAccount: TfrmNewAccount;
  NewIdRetryUE:TUserEntry;
  NewIdRetryAdd:TUserEntryAdd;
implementation

uses HUtil32{, EDecode};
var
  dwOKTick:LongWord;

{$R *.dfm}

function TfrmNewAccount.CheckUserEntrys: Boolean;
begin
   Result:=False;
   EditAccount.Text:=Trim(EditAccount.Text);
   EditQuiz1.Text := Trim(EditQuiz1.Text);
   EditYourName.Text := Trim(EditYourName.Text);
   if Length(EditAccount.Text) < 3 then begin
      Application.MessageBox('登录帐号的长度必须大于3位。','提示信息', MB_OK + MB_ICONINFORMATION);
      Beep;
      EditAccount.SetFocus;
      exit;
   end;
   if not NewIdCheckBirthday then exit;
   if Length(EditPassword.Text) < 3 then begin
      EditPassword.SetFocus;
      exit;
   end;
   if EditPassword.Text <> EditConfirm.Text then begin
      EditConfirm.SetFocus;
      exit;
   end;
   if Length(EditQuiz1.Text) < 1 then begin
      EditQuiz1.SetFocus;
      exit;
   end;
   if Length(EditAnswer1.Text) < 1 then begin
      EditAnswer1.SetFocus;
      exit;
   end;
   if Length(EditQuiz2.Text) < 1 then begin
      EditQuiz2.SetFocus;
      exit;
   end;
   if Length(EditAnswer2.Text) < 1 then begin
      EditAnswer2.SetFocus;
      exit;
   end;
   if Length(EditYourName.Text) < 1 then begin
      EditYourName.SetFocus;
      exit;
   end;
   Result:=True;
end;

procedure TfrmNewAccount.EditEnter(Sender: TObject);
begin
   if Sender = EditAccount then begin
      MemoHelp.Clear;
      MemoHelp.Lines.Add ('您的帐号名称可以包括：');
      MemoHelp.Lines.Add ('字符、数字的组合。');
      MemoHelp.Lines.Add ('帐号名称长度必须为4或以上。');
      MemoHelp.Lines.Add ('登陆帐号并游戏中的人物名称。');
      MemoHelp.Lines.Add ('请仔细输入创建帐号所需信息。');
      MemoHelp.Lines.Add ('您的登陆帐号可以登陆游戏');
      MemoHelp.Lines.Add ('及我们网站，以取得一些相关信息。');
      MemoHelp.Lines.Add ('');
      MemoHelp.Lines.Add ('建议您的登陆帐号不要与游戏中的角');
      MemoHelp.Lines.Add ('色名相同，');
      MemoHelp.Lines.Add ('以确保你的密码不会被爆力破解。');
      exit;
   end;
   if Sender = EditPassword then begin
      MemoHelp.Clear;
      MemoHelp.Lines.Add ('您的密码可以是字符及数字的组合，');
      MemoHelp.Lines.Add ('但密码长度必须至少4位。');
      MemoHelp.Lines.Add ('建议您的密码内容不要过于简单，');
      MemoHelp.Lines.Add ('以防被人猜到。');
      MemoHelp.Lines.Add ('请记住您输入的密码，如果丢失密码');
      MemoHelp.Lines.Add ('将无法登录游戏。');
   end;
   if Sender = EditConfirm then begin
      MemoHelp.Clear;
      MemoHelp.Lines.Add ('再次输入密码');
      MemoHelp.Lines.Add ('以确认。');
   end;
   if Sender = EditYourName then begin
      MemoHelp.Clear;
      MemoHelp.Lines.Add ('请输入您的全名.');
   end;
   if Sender = EditSSNo then begin
      MemoHelp.Clear;
      MemoHelp.Lines.Add ('请输入你的身份证号');
      MemoHelp.Lines.Add ('例如： 720101-146720');
   end;
   if Sender = EditBirthDay then begin
      MemoHelp.Clear;
      MemoHelp.Lines.Add ('请输入您的生日');
      MemoHelp.Lines.Add ('例如：1977/10/15');
   end;
   if Sender = EditQuiz1 then begin
      MemoHelp.Clear;
      MemoHelp.Lines.Add ('请输入第一个密码提示问题');
      MemoHelp.Lines.Add ('这个提示将用于密码丢失后找');
      MemoHelp.Lines.Add ('回密码用。');
      MemoHelp.Lines.Add ('');
   end;
   if Sender = EditAnswer1 then begin
      MemoHelp.Clear;
      MemoHelp.Lines.Add ('请输入上面问题的');
      MemoHelp.Lines.Add ('答案。');
      MemoHelp.Lines.Add ('');
   end;
   if Sender = EditQuiz2 then begin
      MemoHelp.Clear;
      MemoHelp.Lines.Add ('请输入第二个密码提示问题');
      MemoHelp.Lines.Add ('这个提示将用于密码丢失后找');
      MemoHelp.Lines.Add ('回密码用。');
      MemoHelp.Lines.Add ('');
   end;
   if Sender = EditAnswer2 then begin
      MemoHelp.Clear;
      MemoHelp.Lines.Add ('请输入上面问题的');
      MemoHelp.Lines.Add ('答案。');
      MemoHelp.Lines.Add ('');
   end;
   if Sender = EditPhone then begin
      MemoHelp.Clear;
      MemoHelp.Lines.Add ('请输入您的电话');
      MemoHelp.Lines.Add ('号码。');
      MemoHelp.Lines.Add ('');
   end;
   if Sender = EditMobPhone then begin
      MemoHelp.Clear;
      MemoHelp.Lines.Add ('请输入您的手机号码。');
      MemoHelp.Lines.Add ('');
   end;
   if Sender = EditEMail then begin
      MemoHelp.Clear;
      MemoHelp.Lines.Add ('请输入您的邮件地址。您的邮件将被');
      MemoHelp.Lines.Add ('接收最近更新的一些信息');
      MemoHelp.Lines.Add ('');
   end;
end;

function TfrmNewAccount.NewIdCheckBirthDay: Boolean;
var
   str, t1, t2, t3, syear, smon, sday: string;
   ayear, amon, aday, sex: integer;
   flag: Boolean;
begin
   Result := TRUE;
   flag := TRUE;
   str := EditBirthDay.Text;
   str := GetValidStr3 (str, syear, ['/']);
   str := GetValidStr3 (str, smon, ['/']);
   str := GetValidStr3 (str, sday, ['/']);
   ayear := Str_ToInt(syear, 0);
   amon := Str_ToInt(smon, 0);
   aday := Str_ToInt(sday, 0);
   if (ayear <= 1890) or (ayear > 2101) then flag := FALSE;
   if (amon <= 0) or (amon > 12) then flag := FALSE;
   if (aday <= 0) or (aday > 31) then flag := FALSE;
   if not flag then begin
      Beep;
      EditBirthDay.SetFocus;
      Result := FALSE;
   end;
end;

procedure TfrmNewAccount.ButtonOKClick(Sender: TObject);
var
   ue: TUserEntry;
   ua: TUserEntryAdd;
begin
  if GetTickCount - dwOKTick < 5000 then begin
    Application.MessageBox('请稍候再点确定！！！','提示信息',MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  if CheckUserEntrys then begin
    FillChar(ue, sizeof(TUserEntry), #0);
    FillChar(ua, sizeof(TUserEntryAdd), #0);
    ue.sAccount:= LowerCase(EditAccount.Text);
    ue.sPassword:= EditPassword.Text;
    ue.sUserName:= EditYourName.Text;
    ue.sSSNo:= '650101-1455111';
    ue.sQuiz:= EditQuiz1.Text;
    ue.sAnswer:= Trim(EditAnswer1.Text);
    ue.sPhone:= EditPhone.Text;
    ue.sEMail:= Trim(EditEMail.Text);
    ua.sQuiz2:= EditQuiz2.Text;
    ua.sAnswer2:= Trim(EditAnswer2.Text);
    ua.sBirthday:= EditBirthday.Text;
    ua.sMobilePhone:= EditMobPhone.Text;
    NewIdRetryUE := ue;
    NewIdRetryUE.sAccount := '';
    NewIdRetryUE.sPassword := '';
    NewIdRetryAdd := ua;
    MainForm.SendUpdateAccount(ue, ua);
    ButtonOK.Enabled:=False;
    dwOKTick:=GetTickCount();    
  end;
end;


procedure TfrmNewAccount.Open;
begin
  ButtonOK.Enabled:=True;
  EditAccount.Text:='';
  EditPassword.Text:='';
  EditConfirm.Text:='';
  EditYourName.Text:='';
  EditBirthDay.Text:='';
  EditQuiz1.Text:='';
  EditAnswer1.Text:='';
  EditQuiz2.Text:='';
  EditAnswer2.Text:='';
  EditEMail.Text:='';
  EditPhone.Text:='';
  EditMobPhone.Text:='';
  ShowModal;
end;

end.
