
// Module name: DIPS.c ->> DIPS.dpr
// Notices: Copyright (c) 1996 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

program DIPS;

{$R 'DIPS.res' 'DIPS.rc'}

uses
  Windows, Messages,
  CmnHdr in '..\CmnHdr.pas', WindowsX in '..\WindowsX.pas';

const
  g_szModName = 'DIPS';
  IDC_RESTORE =    3;
  IDI_DIPS    =  101;
  IDD_DIPS    =  102;
  IDC_SAVE    = 1000;

  // 引入DLL函数
function SetDIPSHook(dwThreadId: DWORD): BOOL; stdcall; external '..\DIPSLib\DIPSLib.dll';

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  chSETDLGICONS(hWnd, IDI_DIPS, IDI_DIPS);
  Result := TRUE;
end;

  // WM_COMMAND
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
begin
  case (id) of
    IDC_SAVE, IDC_RESTORE, IDCANCEL: EndDialog(hWnd, id);
  end;
end;

  // 对话框回调
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  case (uMsg) of
    WM_INITDIALOG:
      begin
        Result := SetDlgMsgResult(hWnd, LRESULT(Dlg_OnInitDialog(hWnd, wParam, lParam)));
      end;
      
    WM_COMMAND:
      begin
        Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));
        Result := TRUE;
      end;

    else
      Result := FALSE;
  end;
end;

  // 程序入口
var
  hWndDIPS, hWndLV: HWND;
  msg: TMsg;
  cWhatToDo: Char;
begin
  chWARNIFUNICODEUNDERWIN95();

  // 后跟参数
  if (ParamCount() = 0) then
    cWhatToDo := #0
  else begin
    cWhatToDo := ParamStr(1)[1];
    CharUpperBuff(@cWhatToDo, 1);
    if (cWhatToDo <> 'S') and (cWhatToDo <> 'R') then cWhatToDo := #0;
  end;

  // 界面选择
  if (cWhatToDo = #0) then
  begin
    case DialogBox(HInstance, MakeIntResource(IDD_DIPS), 0, @Dlg_Proc) of
      IDC_SAVE: cWhatToDo := 'S';
      IDC_RESTORE: cWhatToDo := 'R';
    end;
  end;

  // 无须动作
  if (cWhatToDo = #0) then Exit;

  // 桌面窗口
  hWndLV := GetFirstChild(GetFirstChild(FindWindow('ProgMan', nil)));
  if (IsWindow(hWndLV) = FALSE) then
  begin
    chMB('Find desktop failure', g_szModName);
    Exit;
  end;

  // 安装钩子
  if (SetDIPSHook(GetWindowThreadProcessId(hWndLV)) = FALSE) then
  begin
    chMB('Install hook failure', g_szModName);
    Exit;
  end;

  // 等待插入
  GetMessage(msg, 0, 0, 0);

  // 服务窗口
  hWndDIPS := FindWindow(nil, 'Richter DIPS');
  if (IsWindow(hWndDIPS) = FALSE) then
  begin
    chMB('Find DIPS Window failure', g_szModName);
    Exit;
  end;

  // 发送命令
  SendMessage(hWndDIPS, WM_APP, hWndLV, Integer(cWhatToDo = 'S'));

  // 通知关闭
  SendMessage(hWndDIPS, WM_CLOSE, 0, 0);
  if IsWindow(hWndDIPS) then
  begin
    chMB('Close DIPS Window failure', g_szModName);
    Exit;
  end;

  // 卸载钩子
  SetDIPSHook(0);
end.
