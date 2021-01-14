
// Module name: TLSStat.C ->> TLSStat.dpr
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

program TLSStat;

{$R 'TLSStat.res' 'TLSStat.rc'}

uses
  Windows, Messages,
  Other in '..\Other.pas', CmnHdr in '..\CmnHdr.pas', WindowsX in '..\WindowsX.pas';

const
  g_szModName = 'TLSStat';
  IDD_TLSSTAT    =  1;
  IDC_CLEAR      =  100;
  IDC_THREADNUM  =  101;
  IDI_TLSSTAT    =  101;
  IDC_NUMCYCLES  =  102;
  IDC_CYCLETIME  =  103;
  IDC_LOG        =  104;

  // 线程参数
type
  PThreadData = ^TThreadData;
  TThreadData = record
    nThreadNum: Integer;  // 线程编号
    nNumCycles: Integer;  // 循环次数
    dwCycleTime: DWORD;   // 挂起时间
  end;

  // ListBox
var
  g_hWndLogLB: HWND = 0;

  // TLS变量
threadvar
  gt_dwStartTime: DWORD;

  // 线程函数
function ThreadFunc(var lpThreadData: TThreadData): Integer;
var
  szBuf: array[0..100] of Char;
begin
  // 开始时间
  gt_dwStartTime := GetTickCount();

  // 显示开始
  _wvsprintf(szBuf, 'Thread started: %d', [lpThreadData.nThreadNum]);
  ListBox_AddString(g_hWndLogLB, szBuf);
  ListBox_SetCurSel(g_hWndLogLB, 0);

  // 循环工作
  while (lpThreadData.nNumCycles > 0) do
  begin
    Dec(lpThreadData.nNumCycles);

    // 显示状态
    _wvsprintf(szBuf, 'Thread %d, Cycles left=%d, time running=%d',
      [lpThreadData.nThreadNum, lpThreadData.nNumCycles, GetTickCount() - gt_dwStartTime]);
    ListBox_AddString(g_hWndLogLB, szBuf);

    // 挂起一会
    Sleep(lpThreadData.dwCycleTime);
  end;

  // 显示结束
  _wvsprintf(szBuf, 'Thread ended: %d, total time=%d',
    [lpThreadData.nThreadNum, GetTickCount() - gt_dwStartTime]);
  ListBox_AddString(g_hWndLogLB, szBuf);

  // 释放结构
  HeapFree(GetProcessHeap(), 0, @lpThreadData);

  Result := 0;
end;

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  chSETDLGICONS(hWnd, IDI_TLSSTAT, IDI_TLSSTAT);

  SetDlgItemInt(hWnd, IDC_THREADNUM, 1, FALSE);
  SetDlgItemInt(hWnd, IDC_NUMCYCLES, 10, FALSE);
  SetDlgItemInt(hWnd, IDC_CYCLETIME, 3, FALSE);

  g_hWndLogLB := GetDlgItem(hWnd, IDC_LOG);

  SetFocus(GetDlgItem(hWnd, IDOK));
  Result := TRUE;
end;

  // WM_COMMAND
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
var
  dwIDThread: DWORD;
  hThread: THandle;
  lpThreadData: PThreadData;
begin
  case (id) of
    IDC_CLEAR:
      begin
        SetDlgItemInt(hWnd, IDC_THREADNUM, 1, FALSE);
        ListBox_ResetContent(g_hWndLogLB);
      end;

    IDOK:
      begin
        // 分配结构
        lpThreadData := HeapAlloc(GetProcessHeap(), 0, SizeOf(TThreadData));
        if (lpThreadData = nil) then
        begin
          chMB('Error creating ThreadData', g_szModName);
          Exit;
        end;

        // 填写结构
        lpThreadData.nThreadNum := GetDlgItemInt(hWnd, IDC_THREADNUM, PBOOL(nil)^, FALSE);
        lpThreadData.nNumCycles := GetDlgItemInt(hWnd, IDC_NUMCYCLES, PBOOL(nil)^, FALSE);
        lpThreadData.dwCycleTime := 1000 * GetDlgItemInt(hWnd, IDC_CYCLETIME, PBOOL(nil)^, FALSE);

        // 编号增加
        SetDlgItemInt(hWnd, IDC_THREADNUM, lpThreadData.nThreadNum + 1, FALSE);

        // 建立线程
        hThread := BeginThread(nil, 0, @ThreadFunc, lpThreadData, 0, dwIDThread);

        // 释放资源
        if (hThread <> 0) then
        begin
          CloseHandle(hThread);
        end else
        begin
          chMB('Error creating the new thread', g_szModName);
          HeapFree(GetProcessHeap(), 0, lpThreadData);
        end;
      end;

    IDCANCEL:
      begin
        EndDialog(hWnd, id);
      end;
  end;
end;

  // 对话框回调
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  case (uMsg) of
    WM_INITDIALOG:
      Result := SetDlgMsgResult(hWnd, LRESULT(Dlg_OnInitDialog(hWnd, wParam, lParam)));

    WM_COMMAND:
    begin
      Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));
      Result := TRUE;
    end;

    else Result := FALSE;
  end;
end;

  // 主线程入口
var
  szBuf: array[0..100] of Char;
begin
  // 记录开始时间
  gt_dwStartTime := GetTickCount();

  chWARNIFUNICODEUNDERWIN95();
  DialogBox(HInstance, MakeIntResource(IDD_TLSSTAT), 0, @Dlg_Proc);

  // 显示运行时间
  _wvsprintf(szBuf, 'Total time running application=%d.', [GetTickCount() - gt_dwStartTime]);
  chMB(szBuf, g_szModName);
end.
