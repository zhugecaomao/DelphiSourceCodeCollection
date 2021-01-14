program LISWatch;

{$R 'LISWatch.res' 'LISWatch.rc'}

uses Windows, Messages;

const
  IDD_LISWATCH = 101; // 资源
  IDC_EYES     = 102;
  IDI_LISWATCH = 103;
  IDC_WNDFOCUS    = 1000; // 控件
  IDC_WNDACTIVE   = 1001;
  IDC_WNDFOREGRND = 1002;
  IDC_THREADID    = 1003;
  IDC_WNDCAPTURE  = 1004;
  TIMER_DELAY = 500; // 毫秒

var
  g_uTimerId: UINT = 1; // 定时器ID
  g_dwThreadIdAttachTo: DWORD = 0; // 绑定线程 ( 0 = System-wide; Non-zero = specifc thread )

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  SendMessage(hWnd, WM_SETICON, ICON_BIG, LoadIcon(HInstance, MakeIntResource(IDI_LISWATCH)));
  SendMessage(hWnd, WM_SETICON, ICON_SMALL, LoadIcon(HInstance, MakeIntResource(IDI_LISWATCH)));

  g_uTimerId := SetTimer(hWnd, g_uTimerId, TIMER_DELAY, nil);

  SetWindowPos(hWnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);

  Result := TRUE;
end;

  // WM_RBUTTONDOWN
procedure Dlg_OnRButtonDown(hWnd: HWND; fDoubleClick: BOOL; x, y: Integer; keyFlags: UINT);
begin
  MessageBox(0, 'To monitor a specific thread, click the left mouse button in ' +
    'the main window and release it in the desired window.'#13#10 +
    'To monitor all threads, double-click the left mouse button in the main window.',
    'LISWatch', MB_OK);
end;

  // WM_LBUTTONDOWN
procedure Dlg_OnLButtonDown(hWnd: HWND; fDoubleClick: BOOL; x, y: Integer; keyFlags: UINT);
begin
  // 取消绑定
  if (g_dwThreadIdAttachTo <> 0) then
    AttachThreadInput(GetCurrentThreadId(), g_dwThreadIdAttachTo, FALSE);

  // 捕捉鼠标
  SetCapture(hWnd);

  // 改变光标
  SetCursor(LoadCursor(HInstance, MakeIntResource(IDC_EYES)));
end;

  // WM_LBUTTONUP
procedure Dlg_OnLButtonUp(hWnd: HWND; x, y: Integer; keyFlags: UINT);
var
  pt: TPoint;
begin
  if (GetCapture() = hWnd) then
  begin
    // 绑定鼠标抬起处对应窗口的线程

    pt.x := LOWORD(GetMessagePos());
    pt.y := HIWORD(GetMessagePos());
    
    ReleaseCapture();
    
    g_dwThreadIdAttachTo := GetWindowThreadProcessId(
      ChildWindowFromPointEx(GetDesktopWindow(), pt, CWP_SKIPINVISIBLE),
      nil);

    if (g_dwThreadIdAttachTo = GetCurrentThreadId()) then
      g_dwThreadIdAttachTo := 0
    else
      AttachThreadInput(GetCurrentThreadId(), g_dwThreadIdAttachTo, TRUE);
  end;
end;

  // 窗口信息
procedure CalcWndText(hWnd: HWND; szBuf: LPTSTR; nLen: Integer);
var
  szClass: array[0..50] of Char;
  szCaption: array[0..50] of Char;
  szBufT: array[0..150] of Char;
  ArgList: array[1..2] of PChar;
begin
  if (hWnd = 0) then
  begin
    lstrcpy(szBuf, '(no window)');
    Exit;
  end;

  if (IsWindow(hWnd) = FALSE) then
  begin
    lstrcpy(szBuf, '(invalid window)');
    Exit;
  end;

  GetClassName(hWnd, szClass, SizeOf(szClass));
  GetWindowText(hWnd, szCaption, SizeOf(szCaption));

  ArgList[1] := szClass;
  if (szCaption[0] = #0) then ArgList[2] := '(no caption)' else ArgList[2] := szCaption;
  wvsprintf(szBufT, '[%s] %s', @ArgList);

  lstrcpyn(szBuf, szBufT, nLen - 1);
  szBuf[nLen - 1] := #0;
end;

  // WM_TIMER
procedure Dlg_OnTimer(hWnd: HWND; id: UINT);
var
  szBuf: array[0..200] of Char;
  hWndForeground: DWORD; // HWND
  dwThreadIdAttachTo: DWORD;
begin
  hWndForeground := GetForegroundWindow();
  dwThreadIdAttachTo := g_dwThreadIdAttachTo;

  // 绑定对象
  if (dwThreadIdAttachTo = 0) then
  begin
    dwThreadIdAttachTo := GetWindowThreadProcessId(hWndForeground, nil);
    AttachThreadInput(GetCurrentThreadId(), dwThreadIdAttachTo, TRUE);
    szBuf := 'System-wide';
  end else
    wvsprintf(szBuf, '0x%08x', @dwThreadIdAttachTo);
  SetWindowText(GetDlgItem(hWnd, IDC_THREADID), szBuf);

  // 焦点控件
  CalcWndText(GetFocus(), szBuf, SizeOf(szBuf));
  SetWindowText(GetDlgItem(hWnd, IDC_WNDFOCUS), szBuf);

  // 活动窗口(本线程)
  CalcWndText(GetActiveWindow(), szBuf, SizeOf(szBuf));
  SetWindowText(GetDlgItem(hWnd, IDC_WNDACTIVE), szBuf);

  // 鼠标捕获权
  CalcWndText(GetCapture(), szBuf, SizeOf(szBuf));
  SetWindowText(GetDlgItem(hWnd, IDC_WNDCAPTURE), szBuf);

  // 活动窗口(全局)
  CalcWndText(hWndForeground, szBuf, SizeOf(szBuf));
  SetWindowText(GetDlgItem(hWnd, IDC_WNDFOREGRND), szBuf);

  // 取消绑定
  if (g_dwThreadIdAttachTo = 0) then
    AttachThreadInput(GetCurrentThreadId(), dwThreadIdAttachTo, FALSE);
end;

  // WM_COMMAND
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
begin
  case (id) of
    IDCANCEL: EndDialog(hWnd, id);
  end;
end;

  // 对话框回调
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM):BOOL; stdcall;
begin
  Result := TRUE;

  case (uMsg) of
    WM_INITDIALOG:
      Result := BOOL(SetWindowLong(hWnd, DWL_MSGRESULT, Longint(Dlg_OnInitDialog(hWnd, wParam, lParam))));

    WM_COMMAND:
      Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));

    WM_TIMER:
      Dlg_OnTimer(hWnd, wParam);

    WM_RBUTTONDOWN:
      Dlg_OnRButtonDown(hWnd, FALSE, LOWORD(lParam), HIWORD(lParam), wParam);

    WM_LBUTTONDOWN:
      Dlg_OnLButtonDown(hWnd, FALSE, LOWORD(lParam), HIWORD(lParam), wParam);

    WM_LBUTTONUP:
      Dlg_OnLButtonUp(hWnd, LOWORD(lParam), HIWORD(lParam), wParam);

    else
      Result := FALSE;
  end;
end;

  // 程序入口
begin
  DialogBox(HInstance, MakeIntResource(IDD_LISWATCH), 0, @Dlg_Proc);
end.
