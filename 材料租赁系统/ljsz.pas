unit ljsz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ComCtrls, ImgList, ExtCtrls, Registry, Spin, Db,
  DBClient, variants;

type
  TfrmLjsz = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Label1: TLabel;
    edtAppHost: TEdit;
    Label2: TLabel;
    edtAppIP: TEdit;
    btnAppName: TBitBtn;
    Label3: TLabel;
    edtPort: TEdit;
    btnOK: TSpeedButton;
    btnCancel: TSpeedButton;
    procedure btnOKClick(Sender: TObject);
    procedure edtAppHostExit(Sender: TObject);
    procedure edtAppIPExit(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAppNameClick(Sender: TObject);
    procedure edtAppHostKeyPress(Sender: TObject; var Key: Char);
    procedure edtAppIPKeyPress(Sender: TObject; var Key: Char);
    procedure edtPortKeyPress(Sender: TObject; var Key: Char);
  private
    //向注册表写入应用配置信息
    procedure WriteToReg(const bAppHost, bAppIP, aPort: string);
    { Private declarations }
  public
    { Public declarations }
  end;

//打开配置窗口，并测试是否连接成功
function LjszExecute(aFormClass: TFormClass): boolean;

var
  frmLjsz: TfrmLjsz;
  Connected: boolean= false; //代表是否连接成功 。
implementation
uses u_main,U_NET,u_public;
{$R *.DFM}

//打开配置窗口，并测试是否连接成功
function LjszExecute(aFormClass: TFormClass): boolean;
begin
  with aFormClass.Create(Application) do
  begin
    Connected := False;
    try
      showModal;
    finally
      free;
    end;
    result := Connected;
  end;
end;

//向注册表里写入应用服务器的配置信息
procedure TfrmLjsz.WriteToReg(const bAppHost, bAppIP, aPort: string);
var
  Reg: Tregistry;
begin
  reg := Tregistry.create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  if not Reg.OpenKey('\Software\仓储管理', False) then
  begin
    reg.createkey('\Software\仓储管理');
    Reg.OpenKey('\Software\仓储管理', False);
  end;
  Reg.WriteString('Host', bAppHost);
  Reg.WriteString('Address', bAppIP);
  Reg.WriteString('Port', aPort);
  reg.free;
end;

procedure TfrmLjsz.btnOKClick(Sender: TObject);
begin
  if ((edtAppHost.text = null) or (edtAppHost.text = '')) and ((edtAppIP.text = null) or (edtAPPIP.text = '')) then
  begin
    Application.MessageBox('请输入应用服务器名字或IP！', '输入错误..', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  try
    strtoint(edtPort.text);
  except
    Application.MessageBox('请输入正确的端口号', '输入错误..', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  statusbar1.panels[0].text := '正在连接应用程序服务器，请稍候..';
  statusbar1.refresh;
  Screen.cursor := crHourGlass;
//  frmMain.SocketConnection.Connected := false;
//  frmMain.SocketConnection.Host := edtAppHost.text;
//  frmMain.SocketConnection.Address := edtAppIP.text;
//  frmMain.SocketConnection.Port := strtoint(edtPort.text);
  try
//    frmMain.SocketConnection.Connected := true;
    screen.Cursor := crDefault;
    application.MessageBox('连接成功', '物资管理系统', mb_iconinformation + mb_defbutton1);
    Connected := True;
  except
    screen.cursor := crdefault;
    application.MessageBox('连接失败', '物资管理系统', mb_iconinformation + mb_defbutton1);
    statusbar1.panels[0].text := '连接失败，请重试..';
    statusbar1.refresh;
    exit;
  end;
  //连接成功向注册表里写入应用服务器配置信息
  CurrentParam.IP :=edtappip.Text;
  CurrentParam.Host := edtAppHost.Text;
  WriteToReg(edtAppHost.Text, edtAppIP.Text, edtPort.Text);
  close;
end;

//关闭窗口
procedure TfrmLjsz.btnCancelClick(Sender: TObject);
begin
  close;
end;

//利用可视化窗体来选择计算机
procedure TfrmLjsz.btnAppNameClick(Sender: TObject);
begin
  edtAppIP.clear;
  edtAppHost.text := NetExecute(TFrmNet);
end;

//当应用服务器名输入后，自动将应用服务器IP地址输入框置空
procedure TfrmLjsz.edtAppHostExit(Sender: TObject);
begin
//  if edtAppHost.Text <> '' then
//    edtAppIP.Text := '';
end;

//当应用服务器IP地址输入后，自动将应用服务器名输入框置空
procedure TfrmLjsz.edtAppIPExit(Sender: TObject);
begin
//  if edtAppIP.Text <> '' then
//    edtAppHost.Text := '';
end;

//应用服务器名输入框按键事件，当按下“回车”键后，将输入焦点转移到输入端口号输入框
procedure TfrmLjsz.edtAppHostKeyPress(Sender: TObject; var Key: Char);
begin
//  edtAppIP.clear;
//  if key = #13 then
//    edtPort.SetFocus;
end;

//应用服务器IP地址输入框按键事件，当按下“回车”键后，将输入焦点转移到输入端口号输入框
procedure TfrmLjsz.edtAppIPKeyPress(Sender: TObject; var Key: Char);
begin
//  edtAppHost.clear;
//  if key = #13 then
//    edtPort.SetFocus;
end;

//端口号输入框按键事件，当按下“回车”键后，调用“确定”按钮的Click方法
procedure TfrmLjsz.edtPortKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    btnOK.click;
end;

end.

