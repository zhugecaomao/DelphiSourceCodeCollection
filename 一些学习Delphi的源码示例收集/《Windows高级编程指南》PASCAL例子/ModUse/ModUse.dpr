
// Module name: ModUse.C ->> ModUse.dpr
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

program ModUse;

{$R 'ModUse.res' 'ModUse.rc'}

uses
  Windows, Messages, CmnHdr in '..\CmnHdr.pas', WindowsX in '..\WindowsX.pas';

const
  IDD_MODUSE      =  1;
  IDC_USAGECOUNT  =  100;
  IDI_MODUSE      =  101;

  // 自注册通知消息
var
  g_uMsgModCntChange: UINT = 0;

  // 引入 DLL 函数
function GetModuleUsage(): DWORD; external '..\Module\Module_2.dll';

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  chSETDLGICONS(hWnd, IDI_MODUSE, IDI_MODUSE);
  PostMessage(hWnd, g_uMsgModCntChange, 0, 0);
  Result := TRUE;
end;

  // WM_COMMAND
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
begin
  if (id = IDCANCEL) then EndDialog(hWnd, id);
end;

  // 对话框回调
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  if (uMsg = g_uMsgModCntChange) then
  begin
    SetDlgItemInt(hWnd, IDC_USAGECOUNT, GetModuleUsage(), FALSE);
    Result := TRUE;
  end else
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

      else Result := FALSE;
    end;
  end;  
end;

  // 程序入口
begin
  chWARNIFUNICODEUNDERWIN95();
  g_uMsgModCntChange := RegisterWindowMessage('MsgModUsgCntChange');
  DialogBox(HInstance, MakeIntResource(IDD_MODUSE), 0, @Dlg_Proc);
end.
