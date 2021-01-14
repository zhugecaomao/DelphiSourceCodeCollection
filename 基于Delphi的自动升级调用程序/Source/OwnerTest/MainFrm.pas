unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellApi;

const
  WM_EXIT_PROGRAM = WM_USER + 500;

type
  TMainForm = class(TForm)
    UpgradeButton: TButton;
    Label1: TLabel;
    procedure UpgradeButtonClick(Sender: TObject);
  private
    procedure WMExitProgram(var Message: TMessage); message WM_EXIT_PROGRAM;
  public
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

//-----------------------------------------------------------------------------
// 描述: 执行自动升级程序
//-----------------------------------------------------------------------------
procedure RunAutoUpgrader;
const
  SAutoUpgraderFileName = 'AutoUpgrader.exe';
  SScriptURL = 'http://localhost/script.aus';
  SCurVersion = '1.0';
  SSoftName = 'OwnerTest';
var
  FileName, Params: string;
begin
  FileName := ExtractFilePath(Application.ExeName) + SAutoUpgraderFileName;
  Params := Format('"%s" "%s" "%s" %d %d %d', [
    SScriptURL,                // 升级脚本文件的URL
    SCurVersion,               // 宿主程序的当前版本号
    SSoftName,                 // 宿主程序的软件名称
    MainForm.Handle,           // 宿主程序用来接收消息的窗口句柄
    WM_EXIT_PROGRAM,           // 宿主程序收到此消息后应退出程序
    GetCurrentProcessID        // 宿主程序的进程ID 
    ]);
    
  ShellExecute(Application.Handle, nil, PChar(FileName), PChar(Params), '', SW_SHOW);
end;

{ TMainForm }

procedure TMainForm.UpgradeButtonClick(Sender: TObject);
begin
  RunAutoUpgrader;
end;

procedure TMainForm.WMExitProgram(var Message: TMessage);
begin
  Close;
end;

end.
