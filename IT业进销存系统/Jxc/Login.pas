unit Login;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, iniFiles;

type
  TfrmLogin = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    cbCode: TComboBox;
    edtPassword: TEdit;
    Label1: TLabel;
    Image1: TImage;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cbCodeChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses Dm, Main, Common;

{$R *.DFM}

//Form.Create
procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  //Append User 'SYS'
  with Data.Tmp do
  begin
    Close;
    CommandText := 'select * from AppUser where uCode=''SYS''';
    Open;
    if IsEmpty then
    begin
      Close;
      CommandText := 'insert into AppUser (uCode, uName) values (''SYS'',''管理员'')';
      Execute;
    end;
  end;
  //Set cbCode
  with Data.Tmpl do
  begin
    Close;
    CommandText := 'select uCode from AppUser order by uCode';
    Open;
    cbCode.Items.Clear;
    while not Eof do
    begin
      cbCode.Items.Add(Fields[0].AsString);
      Next;
    end;
    Close;
  end;
end;

//Form.Show
procedure TfrmLogin.FormShow(Sender: TObject);
var
  iniFile: TIniFile;
begin
  //Computer Name
  pstrComputerName := GetComputerName;
  //Load cbCode
  iniFile := TiniFile.Create(ExtractFilePath(Application.ExeName) +
    'System\Login.ini');
  cbCode.Text :=  iniFile.ReadString(pstrComputerName, 'uCode', '');
  btnOk.Enabled := cbCode.Text <> '';
end;

//Form.KeyDown
procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

//Form.Close
procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
var
  iniFile: TIniFile;
begin
  iniFile := TiniFile.Create(ExtractFilePath(Application.ExeName) +
    'System\Login.ini');
  iniFile.WriteString(pstrComputerName, 'uCode', cbCode.Text);
end;

//btnOk.Click
procedure TfrmLogin.btnOkClick(Sender: TObject);
begin
  with Data.Tmp do
  begin
    Close;
    CommandText := 'select * from AppUser ' +
      'where uCode = ''' + cbCode.Text + '''';
    Open;
    if not Eof then
    begin
      if edtPassword.Text = FieldByName('uPassword').AsString Then
      begin
        //Set Public Var
        pintUserID := FieldByName('ID').AsInteger;
        pstrUserCode := FieldByName('uCode').AsString;
        pstrUserName := FieldByName('uName').AsString;
        pstrUserPassword := FieldByName('uPassword').AsString;
        pstrUserGroup := FieldByName('gName').AsString;
        //Log
        Close;
        CommandText := 'insert into AppLog (uName, cName, CZ, RQ, SJ) ' +
          'values (''' + pstrUserName + ''', ' +
          '''' + pstrComputerName + ''', ' +
          '''进入系统'', ' +
          '''' + FormatDateTime('yyyy-mm-dd', Date) + ''', ' +
          '''' + FormatDateTime('hh:nn', Time) + ''')';
        Execute;
        //Ok
        self.ModalResult := MROK;
        Close;
      end
      else
      begin
        Application.Messagebox('无效的密码, 请重新输入!', '系统登录', MB_OK+MB_ICONERROR);
        edtPassword.Tag := edtPassword.Tag + 1;
        edtPassword.SetFocus ;
      end
    end
    else
    begin
      Application.Messagebox('无效的用户代码,请重新输入!', '系统登录', MB_OK+MB_ICONERROR);
      cbCode.Tag := cbCode.Tag + 1;
      cbCode.SetFocus;
    end;
  end;
  if ( cbCode.Tag > 4 ) or ( edtPassword.Tag > 4 ) Then
    Close;
end;

//cbCode.Change
procedure TfrmLogin.cbCodeChange(Sender: TObject);
begin
  btnOk.Enabled := cbCode.Text <> '';
end;

end.
