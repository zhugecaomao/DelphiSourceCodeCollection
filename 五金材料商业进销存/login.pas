unit login;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  ExtCtrls, TFlatEditUnit, TFlatComboBoxUnit, KvLabel, inifiles,
  TFlatButtonUnit, ComCtrls, Mask, TFlatMaskEditUnit, jpeg,
  TFlatCheckBoxUnit, RegControls;

type
  TfrmLogin = class(TForm)
    Label3: TKvLabel;
    labServer: TKvLabel;
    btnConnect: TFlatButton;
    btnQuit: TFlatButton;
    cbUser: TFlatComboBox;
    edPassword: TFlatMaskEdit;
    Bevel3: TBevel;
    Bevel4: TBevel;
    KvLabel1: TKvLabel;
    Panel1: TPanel;
    title: TKvLabel;
    Label4: TLabel;
    copyright: TKvLabel;
    username: TKvLabel;
    userpass: TKvLabel;
    Image1: TImage;
    btnChange: TFlatButton;
    Bevel2: TBevel;
    panChange: TPanel;
    Bevel1: TBevel;
    KvLabel2: TKvLabel;
    KvLabel3: TKvLabel;
    KvLabel4: TKvLabel;
    pr: TProgressBar;
    edOld: TFlatMaskEdit;
    edNew: TFlatMaskEdit;
    edVerify: TFlatMaskEdit;
    RegForm1: TRegForm;
    procedure btnQuitClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    function GetIsLogined(): boolean;
    procedure btnChangeClick(Sender: TObject);
    procedure cbUserKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function GetPassWord(const empid: string): string;
  private
    logined: boolean; //是否成功
    logintimes: integer; //login次数
    FLoginPrompt: boolean; //是否自动登录 ,yes 为否
    { Private declarations }
  public
    isquit: boolean; //是退出

    { Public declarations }
  end;

const maxtimes = 3;

var
  frmLogin: TfrmLogin;

implementation

uses data;

{$R *.DFM}

function TfrmLogin.GetIsLogined(): boolean;
begin
  result := logined;
end;

procedure TfrmLogin.btnQuitClick(Sender: TObject);
begin
  isquit := true;
  logined := true;
end;

procedure TfrmLogin.FormDestroy(Sender: TObject);
var MyPath: string;
begin
  mypath := extractfilepath(application.exename);
  with TiniFile.create(Mypath + 'frmLogin.ini') do
    begin
      writeInteger(name, 'left', left);
      writeInteger(name, 'top', top);
      writeInteger(name, 'width', width);
      writeInteger(name, 'Height', height);
      writeString('combobox', 'Text', cbUser.Text);
    end;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
var mypath: string;
begin
  isquit := false; //不是退出
  logined := false;
  logintimes := 0;
  mypath := extractfilepath(Application.exename);
  panChange.Visible := false;
  height := 243;
  with Tinifile.create(mypath + 'frmLogin.ini') do
    if readinteger(name, 'left', -1) = -1 then //没有的话，可能INI文件不存在
      begin
        left := 100;
        top := 100;
      end
    else
      begin
        left := readinteger(name, 'left', left);
        top := readinteger(name, 'top', top);
        width := readinteger(name, 'width', width);
        cbUser.Text := readString('combobox', 'Text', cbUser.Text);
      end;
  //把用户表加入到下拉表里。

  if not dm.db.connected then dm.db.connected := true;
  with dm.tabEmp do
    begin
      if not Active then open;
      first;
      cbUser.Items.Clear;
      while not eof do
        begin
          cbuser.items.Add(fieldbyname('name').asstring);
          next;
        end; //end of while
    end; //end of with
end;

procedure TfrmLogin.btnConnectClick(Sender: TObject);
begin
  if trim(cbUser.Text) = '' then
    begin
      cbuser.setfocus;
      application.MessageBox('请选择用户,不能为空', '警告', MB_OK);
    end;

  with dm.tabEmp do
    begin
      if not dm.db.connected then dm.db.connected := true;
      if not Active then open;
      if locate('name', cbuser.text, []) then
        if not (uppercase(trim(edpassword.text)) = uppercase(trim(fieldbyname('password').asstring))) then
          begin
            application.MessageBox('口令不对，请重试', '警告', MB_OK);
            edpassword.SetFocus;
          end
        else
          with dm do
            begin
              SetCurrentEmpID(fieldbyname('EmpID').asstring);
              SetCurrentUser(cbuser.text);
              logined := true;
              modalresult := mrok;
              close;
            end;
    end; //end of with tabemp
end;

function TfrmLogin.GetPassWord(const empid: string): string;
begin
  if trim(empid) <> '' then
    with dm.tabEmp do
      begin
        if not dm.db.connected then dm.db.connected := true;
        if not Active then open;
        if locate('name', empid, []) then
          Result := fieldbyname('password').asstring;
      end;
end;

procedure TfrmLogin.btnChangeClick(Sender: TObject);
begin
  if not panChange.Visible then
    begin
      panChange.visible := true;
      height := 294;
      edOld.SetFocus;
    end;

  if panChange.Visible then //已经填写了数据，是修改password
    begin
      if ednew.text <> edVerify.text then
        begin
          application.MessageBox('两次输入的密码不相同！', '警告', MB_OK);
          exit;
        end;
      with dm.tabemp do
        if not Locate('name', cbUser.text, []) then
          begin
            application.MessageBox('没有这个职工！', '警告', MB_OK);
            cbUser.setfocus;
            exit;
          end
        else
          begin
            if edOld.text <> GetPassWord(trim(cbuser.text)) then
              begin
                application.MessageBox('密码错误!', '警告', MB_OK);
                exit;
              end;
            edit;
            fieldbyname('password').value := edNew.text;
            post;
            height := 243;
            panchange.Visible := false;
          end;
    end;
end;

procedure TfrmLogin.cbUserKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN, VK_DOWN:
      begin
        key := word(#0);
        if ssShift in Shift then
          Perform(WM_NEXTDLGCTL, 1, 0)
        else
          Perform(WM_NEXTDLGCTL, 0, 0);
      end;
    VK_UP:
      begin
        key := word(#0);
        Perform(WM_NEXTDLGCTL, 1, 0);
      end;
  end; //end of case
end;

end.
