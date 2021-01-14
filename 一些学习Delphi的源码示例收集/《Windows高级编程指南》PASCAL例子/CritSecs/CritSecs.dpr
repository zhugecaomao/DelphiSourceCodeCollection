
// Module name: CritSecs.C ->> CritSecs.dpr
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

program CritSecs;

{$R 'CritSecs.res' 'CritSecs.rc'}

uses
  Windows, Messages,
  Other in '..\Other.pas', CmnHdr in '..\CmnHdr.pas', WindowsX in '..\WindowsX.pas';

const
  IDD_CRITSECS         =    1;
  IDC_PRIORITYCLASS    =  100;
  IDC_DSPYTHRDPRIORITY =  101;
  IDC_CNTRTHRDPRIORITY =  102;
  IDI_CRITSECS         =  102;
  IDC_PAUSE            =  103;
  IDC_SYNCHRONIZE      =  104;
  IDC_SHOWCNTRTHRD     =  105;
  IDC_DATABOX          =  106;

var
  g_fTerminate: BOOL = FALSE; // 线程结束循环
  g_hWnd: HWND;               // 界面窗口句柄
  g_hThread: array[0..1] of THandle; // Counter[0] & Display[1] threads
  g_szNumber: array[0..10] of Char = '0'; // 共享数值串
  g_CriticalSection: TRTLCriticalSection; // 临界区信息

  // 添加字符串
procedure AddToListBox(const szBuffer: PChar);
var
  hWndDataBox: HWND;
  x: Integer;
begin
  hWndDataBox := GetDlgItem(g_hWnd, IDC_DATABOX);

  x := ListBox_AddString(hWndDataBox, szBuffer);
  ListBox_SetCurSel(hWndDataBox, x);

  if (ListBox_GetCount(hWndDataBox) > 100) then
    ListBox_DeleteString(hWndDataBox, 0);
end;

  // 累加线程
function CounterThread(lpThreadParameter: Pointer): Integer;
var
  nNumber, nDigit: DWORD;
  fSyncChecked: BOOL;
begin
  while (not g_fTerminate) do
  begin
    fSyncChecked := (IsDlgButtonChecked(g_hWnd, IDC_SYNCHRONIZE) = BST_CHECKED);

    // 进入临界区
    if (fSyncChecked) then EnterCriticalSection(g_CriticalSection);

    // StrToInt()
    nNumber := Str2Int(g_szNumber);

    // 计数值增加
    Inc(nNumber);

    // IntToStr()
    nDigit := 0;
    while (nNumber <> 0) do
    begin
      g_szNumber[nDigit] := Char($30 + nNumber mod 10);
      Inc(nDigit);
      nNumber := nNumber div 10;
      
      Sleep(1);
    end;
    g_szNumber[nDigit] := #0;
    StrRev(g_szNumber);

    // 离开临界区
    if (fSyncChecked) then LeaveCriticalSection(g_CriticalSection);

    if (IsDlgButtonChecked(g_hWnd, IDC_SHOWCNTRTHRD) = BST_CHECKED) then AddToListBox('Cntr: Increment');
  end;

  Result := 0;
end;

  // 显示线程
function DisplayThread(lpThreadParameter: Pointer): Integer;
var
  fSyncChecked: BOOL;
  szBuffer: array[0..50] of Char;
begin
  while (not g_fTerminate) do
  begin
    fSyncChecked := (IsDlgButtonChecked(g_hWnd, IDC_SYNCHRONIZE) = BST_CHECKED);

    // 进入临界区
    if (fSyncChecked) then EnterCriticalSection(g_CriticalSection);

    // 读取数字串
    _wvsprintf(szBuffer, 'Dspy: %s', [DWORD(@g_szNumber)]);

    // 离开临界区
    if (fSyncChecked) then LeaveCriticalSection(g_CriticalSection);

    AddToListBox(szBuffer);
    
    Sleep(1);
  end;

  Result := 0;  // We get here when the window is dismissed.
end;

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
var
  hWndCtl, dwThreadID: DWORD;
begin
  chSETDLGICONS(hWnd, IDI_CRITSECS, IDI_CRITSECS);
  g_hWnd := hWnd;

  InitializeCriticalSection(g_CriticalSection); // 建立临界区对象
  g_hThread[0] := BeginThread(nil, 0, @CounterThread, nil, 0, dwThreadID);
  g_hThread[1] := BeginThread(nil, 0, @DisplayThread, nil, 0, dwThreadID);

  hWndCtl := GetDlgItem(hWnd, IDC_PRIORITYCLASS);
  ComboBox_AddString(hWndCtl, 'Idle');
  ComboBox_AddString(hWndCtl, 'Normal');
  ComboBox_AddString(hWndCtl, 'High');
  ComboBox_AddString(hWndCtl, 'Realtime');
  ComboBox_SetCurSel(hWndCtl, 1);  // Normal

  hWndCtl := GetDlgItem(hWnd, IDC_DSPYTHRDPRIORITY);
  ComboBox_AddString(hWndCtl, 'Idle');
  ComboBox_AddString(hWndCtl, 'Lowest');
  ComboBox_AddString(hWndCtl, 'Below normal');
  ComboBox_AddString(hWndCtl, 'Normal');
  ComboBox_AddString(hWndCtl, 'Above normal');
  ComboBox_AddString(hWndCtl, 'Highest');
  ComboBox_AddString(hWndCtl, 'Timecritical');
  ComboBox_SetCurSel(hWndCtl, 3);  // Normal

  hWndCtl := GetDlgItem(hWnd, IDC_CNTRTHRDPRIORITY);
  ComboBox_AddString(hWndCtl, 'Idle');
  ComboBox_AddString(hWndCtl, 'Lowest');
  ComboBox_AddString(hWndCtl, 'Below normal');
  ComboBox_AddString(hWndCtl, 'Normal');
  ComboBox_AddString(hWndCtl, 'Above normal');
  ComboBox_AddString(hWndCtl, 'Highest');
  ComboBox_AddString(hWndCtl, 'Timecritical');
  ComboBox_SetCurSel(hWndCtl, 3);  // Normal

  Result := TRUE;
end;

  // WM_DESTROY
procedure Dlg_OnDestroy(hWnd: HWND);
begin
  g_fTerminate := TRUE;

  ResumeThread(g_hThread[0]);
  ResumeThread(g_hThread[1]);
end;

  // WM_COMMAND
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
var
  hThread: THandle;
  dw: DWORD;
begin
  case (id) of
    IDCANCEL:
      begin
        EndDialog(hWnd, id);
      end;

    IDC_PRIORITYCLASS:
      begin
        if (codeNotify <> CBN_SELCHANGE) then Exit;

        case ComboBox_GetCurSel(hWndCtl) of
          0: dw := IDLE_PRIORITY_CLASS;
          1: dw := NORMAL_PRIORITY_CLASS;
          2: dw := HIGH_PRIORITY_CLASS;
          3: dw := REALTIME_PRIORITY_CLASS;
          else dw := NORMAL_PRIORITY_CLASS;
        end;
        SetPriorityClass(GetCurrentProcess(), dw);
      end;

    IDC_DSPYTHRDPRIORITY,
    IDC_CNTRTHRDPRIORITY:
      begin
        if (codeNotify <> CBN_SELCHANGE) then Exit;

        case ComboBox_GetCurSel(hWndCtl) of
          0: dw := DWORD(THREAD_PRIORITY_IDLE);
          1: dw := DWORD(THREAD_PRIORITY_LOWEST);
          2: dw := DWORD(THREAD_PRIORITY_BELOW_NORMAL);
          3: dw := DWORD(THREAD_PRIORITY_NORMAL);
          4: dw := DWORD(THREAD_PRIORITY_ABOVE_NORMAL);
          5: dw := DWORD(THREAD_PRIORITY_HIGHEST);
          6: dw := DWORD(THREAD_PRIORITY_TIME_CRITICAL);
          else dw := DWORD(THREAD_PRIORITY_NORMAL);
        end;
        hThread := IfThen(id = IDC_CNTRTHRDPRIORITY, g_hThread[0], g_hThread[1]);
        SetThreadPriority(hThread, dw);
      end;

    IDC_PAUSE:
      begin
        if (Button_GetCheck(hWndCtl) = BST_CHECKED) then
        begin
          SuspendThread(g_hThread[0]);
          SuspendThread(g_hThread[1]);
        end else
        begin
          ResumeThread(g_hThread[0]);
          ResumeThread(g_hThread[1]);
        end;
      end;
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

    WM_DESTROY:
      begin
        Dlg_OnDestroy(hWnd);
        Result := TRUE;
      end;

    WM_COMMAND:
      begin
        Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));
        Result := TRUE;
      end;

    else Result := FALSE;
  end;
end;

  // 主线程入口
begin
  chWARNIFUNICODEUNDERWIN95();
  DialogBox(HInstance, MakeIntResource(IDD_CRITSECS), 0, @Dlg_Proc);

  // 等待线程结束
  WaitForMultipleObjects(2, @g_hThread, TRUE, INFINITE);

  // 关闭线程句柄
  CloseHandle(g_hThread[0]);
  CloseHandle(g_hThread[1]);

  // 删除临界区对象
  DeleteCriticalSection(g_CriticalSection);
end.
