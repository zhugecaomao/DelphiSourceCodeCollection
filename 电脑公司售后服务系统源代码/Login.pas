unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TFlatPanelUnit, TFlatTitlebarUnit, TFlatButtonUnit,
  StdCtrls, XPMenu, TFlatComboBoxUnit, TFlatEditUnit, DB, ADODB;

type
  TFrmLogin = class(TForm)
    LoginTitlal: TFlatTitlebar;
    FlatPanel1: TFlatPanel;
    BtnExit: TFlatButton;
    EditPwd: TFlatEdit;
    CmbName: TFlatComboBox;
    BtnOk: TFlatButton;
    BtnCancel: TFlatButton;
    Label1: TLabel;
    Label2: TLabel;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    BtnHelp: TFlatButton;
    procedure FormActivate(Sender: TObject);
    procedure EditPwdChange(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure CmbNameChange(Sender: TObject);
    procedure EditPwdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnExitClick(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
  private
    { Private declarations }
    procedure DBConnection;
    Procedure ReadLogin;
    Procedure ReadPwd;
    Procedure Caoji;
    Procedure YiBan;
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;
  Pwd,level:string;

implementation

uses global, Main;

{$R *.dfm}

procedure TFrmLogin.FormActivate(Sender: TObject);
begin
  Editpwd.Clear;  CmbName.Clear;
  EditPwd.PasswordChar:='*';
  BtnOk.Enabled :=False;
  ReadLogin;
  EditPwd.SetFocus;
end;

procedure TFrmLogin.DBConnection;
var
  DataPath:string;
begin
  if ADOConnection1.Connected then ADOConnection1.Close;
  //防止被重复打开而导到数据连接错误

  DataPath:=ExtractFilePath(Application.ExeName)+'Data\mgr.db';
  {登录加密的数据库}

  ADOConnection1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+DataPath+';

  ADOConnection1.Open();

end;

procedure TFrmLogin.ReadLogin;
begin
  DBConnection;
  ADOQuery1.SQL.Clear ;
  ADOQuery1.Close;
  ADOQuery1.SQL.Text :='select * from Login';
  ADOQuery1.Open ;
  ADOQuery1.First;
  While not ADOQuery1.Eof do
    begin
      CmbName.Items.Add(ADOQuery1.FieldValues['user']);
      ADOQuery1.Next ;
    end;
  ADOQuery1.Close;
  cmbName.ItemIndex :=0;
end;

procedure TFrmLogin.EditPwdChange(Sender: TObject);
begin
  if trim(Editpwd.Text)='' then BtnOk.Enabled :=False else BtnOk.Enabled :=True;
end;

procedure TFrmLogin.ReadPwd;
begin
  DBConnection;
  ADOQuery1.SQL.Clear ;
  ADOQuery1.Close;
  ADOQuery1.SQL.Text :='select * from Login where user='+'"'+CmbName.text+'"';
  ADOQuery1.Open ;
  pwd:=ADOQuery1.FieldValues['pwd'];
  level:=ADOQuery1.FieldValues ['level'];
  ADOQuery1.close;
end;

procedure TFrmLogin.BtnOkClick(Sender: TObject);
begin
  ReadPwd;
  if Editpwd.Text=Pwd then
    begin
      if level='0' then
        begin
         Caoji;
         close;
         end;
      if level='1' then
        begin
          YiBan;
          close;
        end;
      exit;
    end;
  showmessage('密码错误');

end;

procedure TFrmLogin.CmbNameChange(Sender: TObject);
begin
  Editpwd.Clear; 
end;

procedure TFrmLogin.Caoji;
begin
  with FrmMain do
    begin
      TBtnLoginOff.Visible:=True;
      PanelLogin.Caption :='当前登录操作员：'+CmbName.Text;
      PanelLevel.Caption :='操作权限等级为：超级管理员';
      TBtnSys1.Visible :=False;
      TBtnSys2.Visible :=True;
      SubCaoZuoRen.Visible :=True;
      SubSystemsetup.Visible :=True;
      TBtnSystemSetup.Visible :=True;

      TBtnMgr.Visible :=True;
{      SubQueryPt.Visible :=True;
      SubQueryTb.Visible :=True;
      SubQueryall.Visible :=True;
      TBtnPt.Visible :=True;
      TBtnTs.Visible :=True;
      TBtnAll.Visible :=True;  }

      TBtnDataMgr.Visible :=True;

      TBtnLogin.Visible :=False;
      TBtnLoginOff.Visible :=True;
      ToolBar3.Visible :=True;;
      Paneltop.Height :=92;

      BtnDel.Enabled :=True;
    end;
end;

procedure TFrmLogin.YiBan;
begin
  with FrmMain do
    begin
      TBtnLoginOff.Visible:=True;
      PanelLogin.Caption :='当前登录操作员：'+CmbName.Text;
      PanelLevel.Caption :='操作权限等级为：一般管理员';
      TBtnSys1.Visible :=False;

      TBtnSys2.Visible :=True;
      SubCaoZuoRen.Visible :=False;
      SubSystemsetup.Visible :=False;
      TBtnSystemSetup.Visible :=False;

      TBtnMgr.Visible :=True;
{      SubQueryPt.Visible :=False;
      SubQueryTb.Visible :=False;
      SubQueryall.Visible :=False;
      TBtnPt.Visible :=False;
      TBtnTs.Visible :=False;
      TBtnAll.Visible :=False;    }

      TBtnDataMgr.Visible :=False;

      TBtnLogin.Visible :=False;
      TBtnLoginOff.Visible :=True;
      ToolBar3.Visible :=True;
      Paneltop.Height :=92;

      BtnDel.Enabled :=False;
    end;
end;

procedure TFrmLogin.EditPwdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then BtnOk.Click;
end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ADOQuery1.Close;
ADOConnection1.Close;
end;

procedure TFrmLogin.BtnExitClick(Sender: TObject);
begin
  close;
end;

procedure TFrmLogin.BtnHelpClick(Sender: TObject);
begin
  showmessage('如果你的第一次使用本系统。默认操作员为：超级用户  默认密码为：123')
end;

end.
