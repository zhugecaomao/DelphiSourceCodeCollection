program WindowsOPT;

uses
  Forms,
  windows,
  messages,
  dialogs,
  UMain in 'UMain.pas' {FrmMain},
  UMainFunc in 'UMainFunc.pas',
  URunDosThrd in 'URunDosThrd.pas';

const
  CM_RESTORE=WM_USER+$1000;{自定义的"恢复"消息}
  MYAPPNAME='MyDelphiProgram';
var
  RvHandle:hWnd;

{$R *.res}

begin
  RvHandle:= FindWindow(MYAPPNAME,NIL);
  if RvHandle>0 then
  begin
    ShowMessage('程序已经在运行！ ');
    PostMessage(RvHandle,CM_RESTORE,0,0);
    Exit;
  end;
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
