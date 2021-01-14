program LISLab;

{$R 'LISLab.res' 'LISLab.rc'}

uses Windows, Messages;

const
  IDD_LISLAB = 1; // 资源ID
  IDI_LISLAB = 2;
  IDC_WNDFOCUS      = 100; // 控件ID
  IDC_WNDACTIVE     = 101;
  IDC_WNDFOREGROUND = 102;
  IDC_WNDCAPTURE    = 103;
  IDC_CLIPCURSOR    = 104;
  IDC_WNDFUNC       = 105;
  IDC_FUNCSTART     = 106;
  IDC_DELAY         = 107;
  IDC_WNDS          = 110;
  IDC_THREADATTACH  = 111;
  IDC_THREADDETACH  = 112;
  IDC_MOUSEMSGS     = 113;
  IDC_SETCLIPRECT   = 114;
  IDC_REMOVECLIPRECT= 115;
  IDC_HIDECURSOR    = 116;
  IDC_SHOWCURSOR    = 117;
  IDC_EVENTPENDING  = 118;
  IDC_PREVWND       = 119;
  IDC_INFINITELOOP  = 120;
  TIMER_DELAY = 500; // 半秒

var
  g_uTimerId: DWORD = 1; // 定时器ID
  g_nEventId: DWORD = 0; // 动作编号
  g_dwEventTime: DWORD = 0; // 动作时间
  g_hWndSubject: HWND = 0; // 动作目标
  g_hWndNotepad: HWND = 0; // 记事本

  // 窗口信息放入szBuf
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

  // 用作枚举窗口树
type
  PWalkWindowTreeData = ^TWalkWindowTreeData;
  TWalkWindowTreeData = record
    hWndLB: HWND;        // Handle to the output list box
    hWndParent: HWND;    // Handle to the parent
    nLevel: Integer;     // Nesting depth
    nIndex: Integer;     // List box item index
    szBuf: array[0..100] of Char; // Output buffer
    iBuf: Integer;       // Index into szBuf
  end;

  // 递归枚举窗口结构树
procedure WalkWindowTreeRecurse(var pWWT: TWalkWindowTreeData);
const
  nIndexAmount: Integer = 2; // 空格
var
  hWndChild: HWND;
begin
  // 非法句柄
  if (IsWindow(pWWT.hWndParent) = FALSE) then Exit;

  // 深度增加
  Inc(pWWT.nLevel);

  // 前缀空格
  pWWT.iBuf := 0;
  while (pWWT.iBuf < pWWT.nLevel * nIndexAmount) do
  begin
    pWWT.szBuf[pWWT.iBuf] := ' ';
    Inc(pWWT.iBuf);
  end;

  // 窗口信息
  CalcWndText(pWWT.hWndParent, @pWWT.szBuf[pWWT.iBuf], SizeOf(pWWT.szBuf) - pWWT.iBuf);

  // 加至List
  pWWT.nIndex := SendMessage(pWWT.hWndLB, LB_ADDSTRING, 0, LongInt(@pWWT.szBuf[0]));
  SendMessage(pWWT.hWndLB, LB_SETITEMDATA, pWWT.nIndex, pWWT.hWndParent);

  // 递归调用
  hWndChild := GetTopWindow(pWWT.hWndParent);
  while (hWndChild <> 0) do
  begin
    pWWT.hWndParent := hWndChild;
    WalkWindowTreeRecurse(pWWT);
    hWndChild := GetWindow(hWndChild, GW_HWNDNEXT);
  end;

  // 深度减少
  Dec(pWWT.nLevel);
end;

  // 枚举窗口结构树(至hWndLB)
procedure WalkWindowTree(hWndLB, hWndParent: HWND);
var
  WWT: TWalkWindowTreeData;
begin
  // 从顶层开始枚举
  WWT.hWndLB := hWndLB;
  WWT.hWndParent := hWndParent;
  WWT.nLevel := -1;
  WalkWindowTreeRecurse(WWT);
end;

  // 处理WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
const
  szCommandLine = 'Notepad';
var
  hWndT: DWORD; // HWND
  si: TStartupInfo;
  pi: TProcessInformation;
begin
  // 设置图标
  SendMessage(hWnd, WM_SETICON, ICON_BIG, LoadIcon(HInstance, MakeIntResource(IDI_LISLAB)));
  SendMessage(hWnd, WM_SETICON, ICON_SMALL, LoadIcon(HInstance, MakeIntResource(IDI_LISLAB)));

  // 设置光标
  SetClassLong(hWnd, GCL_HCURSOR, LoadCursor(0, IDC_UPARROW));

  // 安装时钟
  g_uTimerId := SetTimer(hWnd, g_uTimerId, TIMER_DELAY, nil);

  // 动作列表
  hWndT := GetDlgItem(hWnd, IDC_WNDFUNC);
  SendMessage(hWndT, CB_ADDSTRING, 0, LongInt(PChar('SetFocus')));
  SendMessage(hWndT, CB_ADDSTRING, 0, LongInt(PChar('SetActiveWindow')));
  SendMessage(hWndT, CB_ADDSTRING, 0, LongInt(PChar('SetForegroundWnd')));
  SendMessage(hWndT, CB_ADDSTRING, 0, LongInt(PChar('BringWindowToTop')));
  SendMessage(hWndT, CB_ADDSTRING, 0, LongInt(PChar('SetWindowPos-TOP')));
  SendMessage(hWndT, CB_ADDSTRING, 0, LongInt(PChar('SetWindowPos-BTM')));
  SendMessage(hWndT, CB_SETCURSEL, 0, 0);

  // 本对话框
  hWndT := GetDlgItem(hWnd, IDC_WNDS);
  SendMessage(hWndT, LB_ADDSTRING, 0, LongInt(PChar('---> This dialog box <---')));
  SendMessage(hWndT, LB_SETITEMDATA, 0, hWnd);
  SendMessage(hWndT, LB_SETCURSEL, 0, 0);

  // 找记事本
  g_hWndNotepad := FindWindow('Notepad', nil);
  if (g_hwndNotepad = 0) then
  begin
    // 未找到则新开一个线程
    ZeroMemory(@si, SizeOf(si));
    si.cb := SizeOf(si);
    if CreateProcess(nil, szCommandLine, nil, nil, FALSE, 0, nil, nil, si, pi) then
    begin
      WaitForInputIdle(pi.hProcess, INFINITE);
      CloseHandle(pi.hProcess);
      CloseHandle(pi.hThread);
      g_hWndNotepad := FindWindow('Notepad', nil);
    end;
  end;

  // 窗口结构
  WalkWindowTree(hWndT, g_hWndNotepad);

  Result := TRUE;
end;

  // WM_COMMAND
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
var
  hWndT: DWORD; // HWND
  rc: TRect;
begin
  case (id) of
    IDCANCEL: // 要求退出
      begin
        // 删除定时器
        if (g_uTimerId <> 0) then KillTimer(hWnd, g_uTimerId);

        // 结束对话框
        EndDialog(hWnd, 0);
      end;

    IDC_FUNCSTART: // Delay 按钮
      begin
        // 动作延时
        g_dwEventTime := GetTickCount() + 1000 *  GetDlgItemInt(hWnd, IDC_DELAY, PBOOL(nil)^, FALSE);

        // 目标窗口
        hWndT := GetDlgItem(hWnd, IDC_WNDS);
        g_hWndSubject := SendMessage(hWndT, LB_GETITEMDATA, SendMessage(hWndT, LB_GETCURSEL, 0, 0), 0);

        // 动作编号
        g_nEventId := SendMessage(GetDlgItem(hWnd, IDC_WNDFUNC), CB_GETCURSEL, 0, 0);

        // 正在延时
        SetWindowText(GetDlgItem(hWnd, IDC_EVENTPENDING), 'Pending');
      end;

    IDC_THREADATTACH: // (与记事本)共享输入
      begin
        AttachThreadInput(GetWindowThreadProcessId(g_hWndNotepad), GetCurrentThreadId(), TRUE);
      end;

    IDC_THREADDETACH: // 取消(与记事本)共享输入
      begin
        AttachThreadInput(GetWindowThreadProcessId(g_hwndNotepad), GetCurrentThreadId(), FALSE);
      end;

    IDC_REMOVECLIPRECT: // 取消鼠标移动范围限制
      begin
        ClipCursor(nil);
      end;

    IDC_HIDECURSOR: // 隐藏鼠标光标
      begin
        ShowCursor(FALSE);
      end;

    IDC_SHOWCURSOR: // 显示鼠标光标
      begin
        ShowCursor(TRUE);
      end;

    IDC_INFINITELOOP: // 1.修改光标 2.作死循环
      begin
        SetCursor(LoadCursor(0, IDC_NO));
        while TRUE do Sleep(1);
      end;

    IDC_SETCLIPRECT: // 限制鼠标移动范围
      begin
        SetRect(rc, 0, 0, GetSystemMetrics(SM_CXSCREEN) div 2, GetSystemMetrics(SM_CYSCREEN) div 2);
        ClipCursor(@rc);
      end;
  end; // END: case of
end;

  // 向ListBox增加字符串(满了则先进先出)
procedure AddStr(hWndLB: HWND; szBuf: LPCTSTR);
var
  nIndex: Integer;
begin
  nIndex := SendMessage(hWndLB, LB_ADDSTRING, 0, LongInt(szBuf));
  while (nIndex = LB_ERR) do
  begin
    SendMessage(hWndLB, LB_DELETESTRING, 0, 0);
    nIndex := SendMessage(hWndLB, LB_ADDSTRING, 0, LongInt(szBuf));
  end;        

  SendMessage(hWndLB, LB_SETCURSEL, nIndex, 0);
end;

  // WM_RBUTTONDOWN & WM_RBUTTONDBLCLK
function Dlg_OnRButtonDown(hWnd: HWND; fDoubleClick: BOOL; x, y: Integer; keyFlags: UINT): Integer;
var
  szBuf: array[0..100] of Char;
  ArgList: array[1..4] of PChar;
begin
  if (GetCapture() = 0) then ArgList[1] := 'No' else ArgList[1] := 'Yes';
  if (not fDoubleClick) then ArgList[2] := 'No' else ArgList[2] := 'Yes';
  ArgList[3] := PChar(x);
  ArgList[4] := PChar(y);

  wvsprintf(szBuf, 'Capture=%-3s, Msg=RButtonDown, DblClk=%-3s, x=%5d, y=%5d', @ArgList);
  AddStr(GetDlgItem(hWnd, IDC_MOUSEMSGS), szBuf);

  if (fDoubleClick = FALSE) then SetCapture(hWnd) else ReleaseCapture();

  Result := 0;
end;

  // WM_RBUTTONUP
function Dlg_OnRButtonUp(hWnd: HWND; x, y: Integer; keyFlags: UINT): Integer;
var
  szBuf: array[0..100] of Char;
  ArgList: array[1..3] of PChar;
begin
  if (GetCapture() = 0) then ArgList[1] := 'No' else ArgList[1] := 'Yes';
  ArgList[2] := PChar(x);
  ArgList[3] := PChar(y);

  wvsprintf(szBuf, 'Capture=%-3s, Msg=RButtonUp,   x=%5d, y=%5d', @ArgList);
  AddStr(GetDlgItem(hWnd, IDC_MOUSEMSGS), szBuf);

  Result := 0;
end;

  // WM_LBUTTONDOWN & WM_LBUTTONDBLCLK
function Dlg_OnLButtonDown(hWnd: HWND; fDoubleClick: BOOL; x, y: Integer; keyFlags: UINT): Integer;
var
  szBuf: array[0..100] of Char;
  ArgList: array[1..4] of PChar;
begin
  if (GetCapture() = 0) then ArgList[1] := 'No' else ArgList[1] := 'Yes';
  if (not fDoubleClick) then ArgList[2] := 'No' else ArgList[2] := 'Yes';
  ArgList[3] := PChar(x);
  ArgList[4] := PChar(y);

  wvsprintf(szBuf, 'Capture=%-3s, Msg=LButtonDown, DblClk=%-3s, x=%5d, y=%5d', @ArgList);
  AddStr(GetDlgItem(hWnd, IDC_MOUSEMSGS), szBuf);

  Result := 0;
end;

  // WM_LBUTTONUP
procedure Dlg_OnLButtonUp(hWnd: HWND; x, y: Integer; keyFlags: UINT);
var
  szBuf: array[0..100] of Char;
  ArgList: array[1..3] of PChar;
begin
  if (GetCapture() = 0) then ArgList[1] := 'No' else ArgList[1] := 'Yes';
  ArgList[2] := PChar(x);
  ArgList[3] := PChar(y);

  wvsprintf(szBuf, 'Capture=%-3s, Msg=LButtonUp,   x=%5d, y=%5d', @ArgList);
  AddStr(GetDlgItem(hWnd, IDC_MOUSEMSGS), szBuf);
end;

  // WM_MOUSEMOVE
procedure Dlg_OnMouseMove(hWnd: HWND; x, y, keyFlags: UINT);
var
  szBuf: array[0..100] of Char;
  ArgList: array[1..3] of PChar;
begin
  if (GetCapture() = 0) then ArgList[1] := 'No' else ArgList[1] := 'Yes';
  ArgList[2] := PChar(x);
  ArgList[3] := PChar(y);

  wvsprintf(szBuf, 'Capture=%-3s, Msg=MouseMove,  x=%5d, y=%5d', @ArgList);
  AddStr(GetDlgItem(hWnd, IDC_MOUSEMSGS), szBuf);
end;

  // WM_TIMER
procedure Dlg_OnTimer(hWnd: HWND; id: UINT);
var
  szBuf: array[0..100] of Char;
  rc: TRect;
  hWndT: DWORD; // HWND
begin
  CalcWndText(GetFocus(), szBuf, SizeOf(szBuf));
  SetWindowText(GetDlgItem(hWnd, IDC_WNDFOCUS), szBuf);

  CalcWndText(GetCapture(), szBuf, SizeOf(szBuf));
  SetWindowText(GetDlgItem(hWnd, IDC_WNDCAPTURE), szBuf);

  CalcWndText(GetActiveWindow(), szBuf, SizeOf(szBuf));
  SetWindowText(GetDlgItem(hWnd, IDC_WNDACTIVE), szBuf);

  CalcWndText(GetForegroundWindow(), szBuf, SizeOf(szBuf));
  SetWindowText(GetDlgItem(hWnd, IDC_WNDFOREGROUND), szBuf);

  GetClipCursor(rc);
  wvsprintf(szBuf, 'left=%d, top=%d, right=%d, bottom=%d', @rc);
  SetWindowText(GetDlgItem(hWnd, IDC_CLIPCURSOR), szBuf);

  if (g_dwEventTime = 0) or (GetTickCount() < g_dwEventTime) then Exit;

  case (g_nEventId) of
    0: g_hWndSubject := SetFocus(g_hWndSubject);

    1: g_hWndSubject := SetActiveWindow(g_hWndSubject);

    2: begin
         hWndT := GetForegroundWindow();
         SetForegroundWindow(g_hWndSubject);
         g_hWndSubject := hWndT;
       end;

    3: BringWindowToTop(g_hWndSubject);

    4: begin
         SetWindowPos(g_hWndSubject, HWND_TOP, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
         g_hwndSubject := 1;
       end;

    5: begin
         SetWindowPos(g_hWndSubject, HWND_BOTTOM, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
         g_hwndSubject := 1;
       end;
  end;

  if (g_hWndSubject = 1) then
     SetWindowText(GetDlgItem(hWnd, IDC_PREVWND), 'Can''t tell.')
  else begin
    CalcWndText(g_hWndSubject, szBuf, SizeOf(szBuf));
    SetWindowText(GetDlgItem(hWnd, IDC_PREVWND), szBuf);
  end;

  g_hWndSubject := 0;
  g_nEventId := 0;
  g_dwEventTime := 0;
  
  SetWindowText(GetDlgItem(hWnd, IDC_EVENTPENDING), 'Executed');
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

    WM_MOUSEMOVE:
      Dlg_OnMouseMove(hWnd, LOWORD(lParam), HIWORD(lParam), wParam);

    WM_LBUTTONDOWN:
      Dlg_OnLButtonDown(hWnd, FALSE, LOWORD(lParam), HIWORD(lParam), wParam);

    WM_LBUTTONDBLCLK:
      Dlg_OnLButtonDown(hWnd, TRUE, LOWORD(lParam), HIWORD(lParam), wParam);

    WM_LBUTTONUP:
      Dlg_OnLButtonUp(hWnd, LOWORD(lParam), HIWORD(lParam), wParam);

    WM_RBUTTONDOWN:
      Dlg_OnRButtonDown(hWnd, FALSE, LOWORD(lParam), HIWORD(lParam), wParam);

    WM_RBUTTONDBLCLK:
      Dlg_OnRButtonDown(hWnd, TRUE, LOWORD(lParam), HIWORD(lParam), wParam);

    WM_RBUTTONUP:
      Dlg_OnRButtonUp(hWnd, LOWORD(lParam), HIWORD(lParam), wParam);

    WM_TIMER:
      Dlg_OnTimer(hWnd, wParam);

    else
      Result := FALSE;
  end;
end;

  // 程序入口
begin
  DialogBox(HInstance, MakeIntResource(IDD_LISLAB), 0, @Dlg_Proc);
end.
