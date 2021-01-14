program VMStat;

{$R 'VMStat.res' 'VMStat.rc'}

uses Windows, Messages;

const
  IDD_VMSTAT = 1;   // 对话框ID
  IDI_VMSTAT = 101; // 图标ID
  IDC_DATA = 1000;  // 控件ID
  IDT_UPDATE = 1;   // 定时器ID

  // WM_INITDIALOG消息处理
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  // 修改对话框图标
  SendMessage(hWnd, WM_SETICON, ICON_BIG, LoadIcon(HInstance, MakeIntResource(IDI_VMSTAT)));
  SendMessage(hWnd, WM_SETICON, ICON_SMALL, LoadIcon(HInstance, MakeIntResource(IDI_VMSTAT)));

  // 安装刷新定时器
  SetTimer(hWnd, IDT_UPDATE, 1 * 1000, nil);

  // 执行一次OnTimer
  SendMessage(hWnd, WM_TIMER, IDT_UPDATE, 0);
  
  Result := TRUE;
end;

  // WM_TIMER消息处理
procedure Dlg_OnTimer(hWnd: HWND; id: UINT);
var
  ms: TMemoryStatus;
  szData: array[0..512] of Char;
  PfList: array[0..11] of DWORD;
begin
  // 当前内存信息
  ms.dwLength := SizeOf(TMemoryStatus);
  GlobalMemoryStatus(ms);

  // 格式化字符串
  ZeroMemory(@PfList, SizeOf(PfList));
  PfList[0] := ms.dwMemoryLoad;
  PfList[1] := ms.dwTotalPhys;
  PfList[2] := ms.dwAvailPhys;
  PfList[4] := ms.dwTotalPageFile;
  PfList[6] := ms.dwAvailPageFile;
  PfList[8] := ms.dwTotalVirtual;
  PfList[10] := ms.dwAvailVirtual;
  wvsprintf(szData,
    '%d'#13#10'%d'#13#10'%I64d'#13#10'%I64d'#13#10'%I64d'#13#10'%I64d'#13#10'%I64d',
    @PfList);

  // 更新文字控件
  SetDlgItemText(hWnd, IDC_DATA, szData);
end;

  // WM_COMMAND消息处理
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
begin
  if (id = IDCANCEL) then
  begin
    KillTimer(hWnd, IDT_UPDATE);
    EndDialog(hWnd, id);
  end;
end;

  // 对话框回调函数
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  case (uMsg) of
    WM_INITDIALOG:
      begin
        Result := SetWindowLong(hWnd, DWL_MSGRESULT,
          Longint(Dlg_OnInitDialog(hWnd, wParam, lParam))) <> 0;
      end;

    WM_COMMAND:
      begin
        Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));
        Result := TRUE;
      end;

    WM_TIMER:
      begin
        Dlg_OnTimer(hWnd, wParam);
        Result := TRUE;        
      end;
      
    else Result := FALSE;
  end;
end;

  // 程序主线程入口
begin
  DialogBox(HInstance, MakeIntResource(IDD_VMSTAT), 0, @Dlg_Proc);
end.
