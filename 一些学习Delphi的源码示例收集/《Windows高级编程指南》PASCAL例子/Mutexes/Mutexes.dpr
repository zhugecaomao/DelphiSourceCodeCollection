
// Module name: Mutexes.C ->> Mutexes.dpr
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

program Mutexes;

{$R 'Mutexes.res' 'Mutexes.rc'}

uses
  Windows, Messages,
  Other in '..\Other.pas', CmnHdr in '..\CmnHdr.pas', WindowsX in '..\WindowsX.pas';

const
  IDD_MUTEXES          =  1;
  IDC_PRIORITYCLASS    =  100;
  IDC_DSPYTHRDPRIORITY =  101;
  IDI_MUTEXES          =  101;
  IDC_CNTRTHRDPRIORITY =  102;
  IDC_PAUSE            =  103;
  IDC_SYNCHRONIZE      =  104;
  IDC_SHOWCNTRTHRD     =  105;
  IDC_DATABOX          =  106;

var
  g_hWnd: HWND;                      // 界面句柄
  g_fTerminate: BOOL = FALSE;        // 结束线程
  g_hThread: array[0..1] of THandle; // 线程句柄
  g_szNumber: array[0..10] of Char = '0'; // 共享数据
  g_hMutex: THandle;                      // 互斥对象

  // 向ListBox添加字串
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
  nNumber, nDigit: Integer;
  fSyncChecked: BOOL;
begin
  // 继续循环
  while (not g_fTerminate) do
  begin
    // 是否同步
    fSyncChecked := IsDlgButtonChecked(g_hWnd, IDC_SYNCHRONIZE) = BST_CHECKED;
    if (fSyncChecked) then WaitForSingleObject(g_hMutex, INFINITE);

    // Str转Int
    nNumber := Str2Int(g_szNumber);

    // 数值增加
    Inc(nNumber);

    // Int转Str
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

    // 释放对象
    if (fSyncChecked) then ReleaseMutex(g_hMutex);

    // 显示累加
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
  // 继续循环
  while (not g_fTerminate) do
  begin
    // 是否同步
    fSyncChecked := IsDlgButtonChecked(g_hWnd, IDC_SYNCHRONIZE) = BST_CHECKED;
    if (fSyncChecked) then WaitForSingleObject(g_hMutex, INFINITE);

    // 读出字串
    _wvsprintf(szBuffer, 'Dspy: %s', [DWORD(@g_szNumber)]);

    // 释放对象
    if (fSyncChecked) then ReleaseMutex(g_hMutex);

    // 显示数字
    AddToListBox(szBuffer);

    Sleep(1);
  end;

  Result := 0;
end;

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
var
  dwThreadID, hWndCtl: DWORD; // HWND
begin
  chSETDLGICONS(hWnd, IDI_MUTEXES, IDI_MUTEXES);

  g_hWnd := hWnd;
  g_hMutex := CreateMutex(nil, FALSE, nil);
  g_hThread[0] := BeginThread(nil, 0, @CounterThread, nil, 0, dwThreadID);
  g_hThread[1] := BeginThread(nil, 0, @DisplayThread, nil, 0, dwThreadID);

  hWndCtl := GetDlgItem(hWnd, IDC_PRIORITYCLASS);
  ComboBox_AddString(hWndCtl, 'Idle');
  ComboBox_AddString(hWndCtl, 'Normal');
  ComboBox_AddString(hWndCtl, 'High');
  ComboBox_AddString(hWndCtl, 'Realtime');
  ComboBox_SetCurSel(hWndCtl, 1); // Normal

  hWndCtl := GetDlgItem(hWnd, IDC_DSPYTHRDPRIORITY);
  ComboBox_AddString(hWndCtl, 'Idle');
  ComboBox_AddString(hWndCtl, 'Lowest');
  ComboBox_AddString(hWndCtl, 'Below normal');
  ComboBox_AddString(hWndCtl, 'Normal');
  ComboBox_AddString(hWndCtl, 'Above normal');
  ComboBox_AddString(hWndCtl, 'Highest');
  ComboBox_AddString(hWndCtl, 'Timecritical');
  ComboBox_SetCurSel(hWndCtl, 3); // Normal

  hWndCtl := GetDlgItem(hWnd, IDC_CNTRTHRDPRIORITY);
  ComboBox_AddString(hWndCtl, 'Idle');
  ComboBox_AddString(hWndCtl, 'Lowest');
  ComboBox_AddString(hWndCtl, 'Below normal');
  ComboBox_AddString(hWndCtl, 'Normal');
  ComboBox_AddString(hWndCtl, 'Above normal');
  ComboBox_AddString(hWndCtl, 'Highest');
  ComboBox_AddString(hWndCtl, 'Timecritical');
  ComboBox_SetCurSel(hWndCtl, 3); // Normal

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
  hThread: THANDLE;
  dw: Integer;
begin
  case (id) of
    IDCANCEL:
      begin
        EndDialog(hWnd, id);
      end;

    IDC_PRIORITYCLASS: // 进程优先级
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

    IDC_DSPYTHRDPRIORITY, // 线程优先级
    IDC_CNTRTHRDPRIORITY:
      begin
        if (codeNotify <> CBN_SELCHANGE) then Exit;

        case ComboBox_GetCurSel(hWndCtl) of
          0: dw := THREAD_PRIORITY_IDLE;
          1: dw := THREAD_PRIORITY_LOWEST;
          2: dw := THREAD_PRIORITY_BELOW_NORMAL;
          3: dw := THREAD_PRIORITY_NORMAL;
          4: dw := THREAD_PRIORITY_ABOVE_NORMAL;
          5: dw := THREAD_PRIORITY_HIGHEST;
          6: dw := THREAD_PRIORITY_TIME_CRITICAL;
          else dw := THREAD_PRIORITY_NORMAL;
        end;
        hThread := IfThen(id = IDC_CNTRTHRDPRIORITY, g_hThread[0], g_hThread[1]);
        SetThreadPriority(hThread, dw);
      end;

    IDC_PAUSE: // 暂停or恢复
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
   end; // END: case (id) of ..
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
  DialogBox(HInstance, MakeIntResource(IDD_MUTEXES), 0, @Dlg_Proc);

  // 等待线程结束
  WaitForMultipleObjects(2, @g_hThread, TRUE, INFINITE);

  // 关闭对象句柄
  CloseHandle(g_hThread[0]);
  CloseHandle(g_hThread[1]);
  CloseHandle(g_hMutex);
end.
