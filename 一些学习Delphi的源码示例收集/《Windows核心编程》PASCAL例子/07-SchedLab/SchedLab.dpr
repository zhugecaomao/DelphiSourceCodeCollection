program SchedLab;

{$R 'SchedLab.res' 'SchedLab.rc'}

uses
  Windows, Messages;

const
  // 线程权限
  THREAD_SUSPEND_RESUME = $0002;

  // 优先级类
  BELOW_NORMAL_PRIORITY_CLASS = $4000;
  ABOVE_NORMAL_PRIORITY_CLASS = $8000;

  // 模板ID
  IDD_SCHEDLAB = 101;

  // 图标ID
  IDI_SCHEDLAB = 103;

  // 控件ID
  IDC_PROCESSPRIORITYCLASS   = 1015;
  IDC_THREADRELATIVEPRIORITY = 1016;
  IDC_SLEEPTIME              = 1017;
  IDC_SUSPEND                = 1018;
  IDC_WORK                   = 1020;

  // 线程函数
function ThreadFunc(pvParam: Pointer): Integer;
var
  hThreadPrimary: THandle;
begin
  // 挂起主线程
  hThreadPrimary := THandle(pvParam);
  SuspendThread(hThreadPrimary);

  // 弹出消息框
  MessageBox(GetActiveWindow(),
    'The Primary thread is suspended.'#13#10 +
    'It no longer responds to input and produces no output.'#13#10 +
    'Press OK to resume the primary thread & exit this secondary thread.'#13#10,
    'SchedLab', 0);

  // 恢复主线程
  ResumeThread(hThreadPrimary);
  CloseHandle(hThreadPrimary);

  // 再恢复按钮
  EnableWindow(GetDlgItem(FindWindow(nil, 'Scheduling Lab'), IDC_SUSPEND), TRUE);
  
  Result := 0;
end;

  // 对话框WM_INITDIALOG消息处理
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
var
  hWndCtl: LongWord; // HWND
  n, nNormal: Integer;
  dwpc: DWORD;
begin
  // 设置对话框图标
  SendMessage(hWnd, WM_SETICON, ICON_BIG, LoadIcon(HInstance, MakeIntResource(IDI_SCHEDLAB)));
  SendMessage(hWnd, WM_SETICON, ICON_SMALL, LoadIcon(HInstance, MakeIntResource(IDI_SCHEDLAB)));


  // 1.
  // 基本优先级列表
  hWndCtl := GetDlgItem(hWnd, IDC_PROCESSPRIORITYCLASS);

  // 添加'高'优先级
  n := SendMessage(hWndCtl, CB_ADDSTRING, 0, Integer(PChar('High')));
  SendMessage(hWndCtl, CB_SETITEMDATA, n, HIGH_PRIORITY_CLASS);

  // 当前基本优先级
  dwpc := GetPriorityClass(GetCurrentProcess());

  // 支持新的优先级
  if SetPriorityClass(GetCurrentProcess(), BELOW_NORMAL_PRIORITY_CLASS) then
  begin
    // 恢复基本优先级
    SetPriorityClass(GetCurrentProcess(), dwpc);

    // 添加'高于正常'优先级
    n := SendMessage(hWndCtl, CB_ADDSTRING, 0, Integer(PChar('Above normal')));
    SendMessage(hWndCtl, CB_SETITEMDATA, n, ABOVE_NORMAL_PRIORITY_CLASS);

    // 支持新的优先级
    dwpc := 0;
  end;

  // 添加'正常'优先级
  n := SendMessage(hWndCtl, CB_ADDSTRING, 0, Integer(PChar('Normal')));
  SendMessage(hWndCtl, CB_SETITEMDATA, n, NORMAL_PRIORITY_CLASS);
  nNormal := n;

  // 支持新的优先级, 则添加'低于正常'优先级
  if (dwpc = 0) then
  begin
    n := SendMessage(hWndCtl, CB_ADDSTRING, 0, Integer(PChar('Below normal')));
    SendMessage(hWndCtl, CB_SETITEMDATA, n, BELOW_NORMAL_PRIORITY_CLASS);
  end;

  // 添加'空闲'优先级
  n := SendMessage(hWndCtl, CB_ADDSTRING, 0, Integer(PChar('Idle')));
  SendMessage(hWndCtl, CB_SETITEMDATA, n, IDLE_PRIORITY_CLASS);

  // 选中'正常'优先级
  SendMessage(hWndCtl, CB_SETCURSEL, nNormal, 0);


  // 2.
  // 线程优先级列表
  hWndCtl := GetDlgItem(hWnd, IDC_THREADRELATIVEPRIORITY);

  // 添加'关键时间'优先级
  n := SendMessage(hWndCtl, CB_ADDSTRING, 0, Integer(PChar('Time critical')));
  SendMessage(hWndCtl, CB_SETITEMDATA, n, THREAD_PRIORITY_TIME_CRITICAL);

  // 添加'最高'优先级
  n := SendMessage(hWndCtl, CB_ADDSTRING, 0, Integer(PChar('Highest')));
  SendMessage(hWndCtl, CB_SETITEMDATA, n, THREAD_PRIORITY_HIGHEST);

  // 添加'高于正常'优先级
  n := SendMessage(hWndCtl, CB_ADDSTRING, 0, Integer(PChar('Above normal')));
  SendMessage(hWndCtl, CB_SETITEMDATA, n, THREAD_PRIORITY_ABOVE_NORMAL);

  // 添加'正常'优先级
  n := SendMessage(hWndCtl, CB_ADDSTRING, 0, Integer(PChar('Normal')));
  SendMessage(hWndCtl, CB_SETITEMDATA, n, THREAD_PRIORITY_NORMAL);
  nNormal := n;

  // 添加'低于正常'优先级
  n := SendMessage(hWndCtl, CB_ADDSTRING, 0, Integer(PChar('Below normal')));
  SendMessage(hWndCtl, CB_SETITEMDATA, n, THREAD_PRIORITY_BELOW_NORMAL);

  // 添加'最低'优先级
  n := SendMessage(hWndCtl, CB_ADDSTRING, 0, Integer(PChar('Lowest')));
  SendMessage(hWndCtl, CB_SETITEMDATA, n, THREAD_PRIORITY_LOWEST);

  // 添加'空闲'优先级
  n := SendMessage(hWndCtl, CB_ADDSTRING, 0, Integer(PChar('Idle')));
  SendMessage(hWndCtl, CB_SETITEMDATA, n, THREAD_PRIORITY_IDLE);

  // 选中'正常'优先级
  SendMessage(hWndCtl, CB_SETCURSEL, nNormal, 0);


  // 限制Edit长度
  SendMessage(GetDlgItem(hWnd, IDC_SLEEPTIME), EM_LIMITTEXT, 4, 0);

  // 接受默认焦点
  Result := TRUE;
end;

  // 对话框WM_COMMAND消息处理
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
var
  hThreadPrimary: THandle;
  dwThreadID: DWORD;
begin
  case (id) of
    IDCANCEL: // 要求关闭
      begin
        PostQuitMessage(0);
      end;

    IDC_PROCESSPRIORITYCLASS: // 基本优先级
      if (codeNotify = CBN_SELCHANGE) then
      begin
        SetPriorityClass(GetCurrentProcess(),
          SendMessage(hWndCtl, CB_GETITEMDATA, SendMessage(hWndCtl, CB_GETCURSEL, 0, 0), 0));
      end;

    IDC_THREADRELATIVEPRIORITY: // 线程优先级
      if (codeNotify = CBN_SELCHANGE) then
      begin
        SetThreadPriority(GetCurrentThread(),
          SendMessage(hWndCtl, CB_GETITEMDATA, SendMessage(hWndCtl, CB_GETCURSEL, 0, 0), 0));
      end;

    IDC_SUSPEND: // 挂起主线程
      begin
        // 建立线程前禁用按钮
        EnableWindow(hWndCtl, FALSE);

        // 虚拟句柄 -> 实句柄
        DuplicateHandle(
          GetCurrentProcess(), GetCurrentThread(),
          GetCurrentProcess(), @hThreadPrimary,
          THREAD_SUSPEND_RESUME, FALSE, DUPLICATE_SAME_ACCESS);

        // 建立线程并减少计数
        CloseHandle(BeginThread(nil, 0, @ThreadFunc, Pointer(hThreadPrimary), 0, dwThreadID));
      end;
  end;
end;

  // 对话框消息处理回调
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  Result := FALSE;

  case (uMsg) of
    WM_INITDIALOG:
      Result := SetWindowLong(hWnd, DWL_MSGRESULT, Longint(Dlg_OnInitDialog(hWnd, wParam, lParam))) <> 0;

    WM_COMMAND:
      Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));
  end;
end;

  // 程序主线程入口
var
  hWnd, hWndWork: LongWord; // HWND
  Msg: TMsg;
  fQuit: BOOL = FALSE;
  s_n: Integer = -1;
  sz: array[0..20] of Char;
  nSleep: Integer;
begin
  // 建立窗口
  hWnd := CreateDialog(HInstance, MakeIntResource(IDD_SCHEDLAB), 0, @Dlg_Proc);

  // 消息循环
  while (not fQuit) do
  begin
    // 从队列取到消息
    if PeekMessage(Msg, 0, 0, 0, PM_REMOVE) then
    begin
      // 处理'对话框消息'
      if (not IsDialogMessage(hWnd, Msg)) then
      begin
        if (Msg.message <> WM_QUIT) then
        begin
          TranslateMessage(Msg);
          DispatchMessage(Msg);
        end else
          fQuit := TRUE;  // 循环结束标志
      end;
    end else
    begin
      // 添加数字字符串至ListBox
      Inc(s_n);
      wvsprintf(sz, '%u', @s_n);
      hWndWork := GetDlgItem(hWnd, IDC_WORK);
      SendMessage(hWndWork, LB_SETCURSEL, SendMessage(hWndWork, LB_ADDSTRING, 0, Integer(@sz[0])), 0);

      // 移除ListBox多余项目
      while (SendMessage(hWndWork, LB_GETCOUNT, 0, 0) > 100) do
        SendMessage(hWndWork, LB_DELETESTRING, 0, 0);

      // 挂起Edit指定毫秒数
      nSleep := GetDlgItemInt(hWnd, IDC_SLEEPTIME, PBOOL(nil)^, FALSE);
      if (nSleep >= 1) and (nSleep <= 9999) then Sleep(nSleep);
    end;
  end;

  // 清除窗口
  DestroyWindow(hWnd);
end.
