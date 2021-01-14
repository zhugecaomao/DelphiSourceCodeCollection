unit ufrmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TfrmLogin = class(TForm)
    Label1: TLabel;
    cmbUserId: TComboBox;
    Label2: TLabel;
    ePassword: TEdit;
    bbtnConfirm: TBitBtn;
    bbtnCancel: TBitBtn;
    Userq: TADOQuery;
    procedure bbtnConfirmClick(Sender: TObject);
    procedure bbtnCancelClick(Sender: TObject);
    procedure cmbUserIdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ePasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Fi_I: Integer; //检验登陆次数
    Fs_UserName: String;
    procedure prip_GetUserId;
    function prif_CheckUser: Boolean;
    procedure prip_IniInterFace;
  public
    procedure pubp_Ini;
    property As_UserName: String read Fs_UserName;
  end;

var
  frmLogin: TfrmLogin;

implementation
uses udmData;
{$R *.dfm}

{ TfrmLogin }

function TfrmLogin.prif_CheckUser: Boolean;
var
  li_I: Integer;
  ls_UserId: String;
begin
  li_I := Pos('-', cmbUserId.Text);
  ls_UserId := Copy(cmbUserId.Text, 1, li_I - 1);
  Userq.Locate('user_id', ls_UserId, []);
  if ePassword.Text = Userq.FieldByName('password').AsString then
  begin
    dmData.ADOCon.Execute(Format('UPDATE sys_user set modify_time = GETDATE()' + //, is_login = 1 ' +
      ' WHERE user_id = ''%s''', [ls_UserId]));
    Fs_UserName := cmbUserId.Text;
    dmData.As_OptName := ls_UserId;
    Result := True;
  end else
  begin
    Application.MessageBox(PChar(Format('密码错误，您还可以重试%d次！', [3 - Fi_I])),
      '错误提示', MB_OK + MB_ICONWARNING);
    Result := False;
  end;
end;

procedure TfrmLogin.prip_GetUserId;
begin
  with Userq do
  begin
    if Active then Close;
    Connection := dmData.ADOCon;
    SQL.Text := 'SELECT * FROM sys_user'; // WHERE is_login = 0 ';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        cmbUserId.Items.Add(FieldByName('user_id').AsString + '-' +
          FieldByName('user_name').AsString);
        Next;
      end;
    end;
  end;
end;

procedure TfrmLogin.prip_IniInterFace;
begin
  Position := poScreenCenter;
end;

procedure TfrmLogin.pubp_Ini;
begin
  Fi_I := 1;
  prip_IniInterFace;
  prip_GetUserId;
end;

procedure TfrmLogin.bbtnConfirmClick(Sender: TObject);
begin
  if prif_CheckUser then ModalResult := mrOk else Inc(Fi_I);
  if Fi_I > 3 then  ModalResult := mrCancel;
end;

procedure TfrmLogin.bbtnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmLogin.cmbUserIdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then ePassWord.SetFocus;
end;

procedure TfrmLogin.ePasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then bbtnConfirm.Click;
end;

end.
