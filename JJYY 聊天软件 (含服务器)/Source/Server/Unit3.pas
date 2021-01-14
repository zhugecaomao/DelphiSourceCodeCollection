unit Unit3;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons;

type
  TPasswordDlg = class(TForm)
    Label1: TLabel;
    Password: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
  PasswordStr='jjyy';

var
  PasswordDlg: TPasswordDlg;

implementation

uses Unit1, ChatSource;

{$R *.DFM}

procedure TPasswordDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure TPasswordDlg.FormDestroy(Sender: TObject);
begin
  PasswordDlg:=nil;
end;

procedure TPasswordDlg.OKBtnClick(Sender: TObject);
begin
  if PasswordDlg.Password.Text=PasswordStr then
  begin
    Screen.Cursor :=crHourGlass;
    PasswordDlg.close;
    form1.Logined:=true;
    if not form1.Locked then
    begin
      form1.s.Port :=strtoint(form1.ini.ReadString('Port','Num1','10111'));
      form1.s.Active :=true;
      chat.con.Connected :=true;
      MessageBox(handle,'登录成功！','提示',MB_ICONINFORMATION);
    end;
    form1.UpdateState;
    Screen.Cursor :=crDefault;
  end
  else
    MessageBox(handle,'密码错误！','警告',MB_ICONWARNING);
end;

end.
 
