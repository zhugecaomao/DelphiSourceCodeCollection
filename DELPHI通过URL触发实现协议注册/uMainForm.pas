{
*
*
* 文件名称：uMainForm.pas
* 文件类别：delphi 代码文件
*
* 文件版本：0.1
* 作    者：俞伟
* 完成时间；2008-01-28
* 联系方式: yu924@hotmail.com
* QQ:       183088201
*
*
}

unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Registry, ExtCtrls;

type
  TMainForm = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    btnRegProtocol: TButton;
    btnUnRegProtocol: TButton;
    btnClose: TButton;
    Label1: TLabel;
    Label2: TLabel;
    txtProtocolName: TEdit;
    txtProtocolApplication: TEdit;
    btnBrowser: TButton;
    chkUseAsParams: TCheckBox;
    pnlProtocolUrl: TPanel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnBrowserClick(Sender: TObject);
    procedure btnRegProtocolClick(Sender: TObject);
    procedure btnUnRegProtocolClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function RegUrlProtocol(aProtocolName, aProtocolApplicationName: string; aUseParam: Boolean): Boolean;
    function UnRegUrlProtocl(aProtocolName: string): Boolean;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.btnBrowserClick(Sender: TObject);
var
  OpenDlg: TOpenDialog;
  strFileName: string;
begin
  OpenDlg := TOpenDialog.Create(nil);
  try
    OpenDlg.Filter := '协议文件(*.EXE)|*.EXE|全部文件(*.*)|*.*';
    OpenDlg.DefaultExt := '*.EXE';
    if OpenDlg.Execute then
    begin
      strFileName := Trim(OpenDlg.FileName);
      if strFileName <> '' then
      begin
        txtProtocolApplication.Text := strFileName;
      end;
    end;
  finally
    FreeAndNil(OpenDlg);
  end;
end;

procedure TMainForm.btnRegProtocolClick(Sender: TObject);
var
  strProtocolName, strProtocolApplication: string;
begin
  strProtocolName := Trim(txtProtocolName.Text);
  strProtocolApplication := Trim(txtProtocolApplication.Text);
  if strProtocolName = '' then
  begin
    MessageBox(Handle, '请输入协议名称.', '提醒', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  if strProtocolApplication = '' then
  begin
    MessageBox(Handle, '请设置协议程序.', '提醒', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  if RegUrlProtocol(strProtocolName, strProtocolApplication, chkUseAsParams.Checked) then
  begin
    MessageBox(Handle, '注册用户自定义协议成功.', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
end;

function TMainForm.RegUrlProtocol(aProtocolName,
  aProtocolApplicationName: string; aUseParam: Boolean): Boolean;
var
  objReg: TRegistry;
begin
  Result := False;
  objReg := TRegistry.Create;
  try
    objReg.RootKey := HKEY_CLASSES_ROOT;
    if objReg.OpenKey('\' + aProtocolName, True) then
    begin
      objReg.WriteString('', aProtocolName + 'Protocol');
      objReg.WriteString('URL Protocol', aProtocolApplicationName);
      if objReg.OpenKey('\' + aProtocolName + '\DefaultIcon', True) then
      begin
        objReg.WriteString('', aProtocolApplicationName + ',1');
      end;
      if objReg.OpenKey('\' + aProtocolName + '\shell\open\command', True) then
      begin
        if aUseParam then
          objReg.WriteString('', '"' + aProtocolApplicationName + '" "%1"')
        else
          objReg.WriteString('', '"' + aProtocolApplicationName + '"');
      end;
      Result := True;
    end;
  finally
    FreeAndNil(objReg);
  end;
end;

function TMainForm.UnRegUrlProtocl(aProtocolName: string): Boolean;
var
  objReg: TRegistry;
begin
  Result := False;
  objReg := TRegistry.Create;
  try
    objReg.RootKey := HKEY_CLASSES_ROOT;
    objReg.DeleteKey(aProtocolName);
    Result := True;
  finally
    FreeAndNil(objReg);
  end;
end;

procedure TMainForm.btnUnRegProtocolClick(Sender: TObject);
var
  strProtocolName: string;
begin
  strProtocolName := Trim(txtProtocolName.Text);
  if strProtocolName = '' then
  begin
    MessageBox(Handle, '请输入协议名称.', '提醒', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  if UnRegUrlProtocl(strProtocolName) then
  begin
    MessageBox(Handle, '卸载用户自定义协议成功.', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  pnlProtocolUrl.Caption := ParamStr(1);
end;

end.
