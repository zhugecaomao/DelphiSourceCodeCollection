program Handshake;

{$R 'Handshake.res' 'Handshake.rc'}

uses
  Windows, Messages;

const
  IDD_HANDSHAKE = 101; // 模板资源ID
  IDI_HANDSHAKE = 102; // 图标资源ID
  IDC_REQUEST  = 1000; // 子控件ID..
  IDC_RESULT   = 1001;
  IDC_SUBMIT   = 1002;
  g_szServerShutdown = 'Server Shutdown'; // (服务线程)结束标识

var
  g_hevtRequestSubmitted: THandle; // 服务线程等待客户线程请求(事件对象)
  g_hevtResultReturned: THandle;   // 客户线程等待服务线程返回(事件对象)
  g_szSharedRequestAndResultBuffer: array[0..1024] of Char; // (线程间)共享内存块

  // 反转字符串
procedure ReverseString(S: PChar);
var
  T: Char;
  E: PChar;
begin
  E := S;
  while (E^ <> #0) do Inc(E);
  Dec(E);

  while (S < E) do
  begin
    T  := S^;
    S^ := E^;
    E^ := T;

    Dec(E);
    Inc(S);
  end;
end;

  // 服务线程回调
function ServerThread(pvParam: Pointer): Integer;
var
  fShutdown: BOOL;
begin
  fShutdown := FALSE;

  while (fShutdown = FALSE) do
  begin
    // 等待提交请求
    WaitForSingleObject(g_hevtRequestSubmitted, INFINITE);

    // 是否结束标识
    fShutdown := (lstrcmpi(g_szSharedRequestAndResultBuffer, g_szServerShutdown) = 0);

    // 处理反转请求
    if (fShutdown = FALSE) then ReverseString(g_szSharedRequestAndResultBuffer);

    // 返回客户线程
    SetEvent(g_hevtResultReturned);
  end;

  Result := 0;
end;

  // 对话框WM_INITDIALOG处理
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  // 设置窗口图标
  SendMessage(hWnd, WM_SETICON, ICON_BIG, LoadIcon(HInstance, MakeIntResource(IDI_HANDSHAKE)));
  SendMessage(hWnd, WM_SETICON, ICON_SMALL, LoadIcon(HInstance, MakeIntResource(IDI_HANDSHAKE)));

  // 设置控件文字
  SetWindowText(GetDlgItem(hWnd, IDC_REQUEST), 'Some test data');

  // 接受默认焦点
  Result := TRUE;
end;

  // 对话框WM_COMMAND处理
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
begin
  case (id) of
    IDCANCEL: // 要求关闭
      begin
        EndDialog(hWnd, id);
      end;

    IDC_SUBMIT: // 按钮
      begin
        // 读入待处理字符串
        GetWindowText(GetDlgItem(hWnd, IDC_REQUEST), g_szSharedRequestAndResultBuffer, 1024);

        // 通知服务线程处理
        SetEvent(g_hevtRequestSubmitted);

        // 挂起等待处理完毕
        WaitForSingleObject(g_hevtResultReturned, INFINITE);

        // 显示已处理字符串
        SetWindowText(GetDlgItem(hWnd, IDC_RESULT),  g_szSharedRequestAndResultBuffer);
      end;
  end;
end;

  // 对话框消息回调
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

  // 主线程(客户线程)入口
var
  dwThreadID: DWORD;
  hThreadServer: THandle;
  h: array[0..1] of THandle;
begin
  // 建立两个自动重置事件对象并预置为'未通知'状态
  g_hevtRequestSubmitted := CreateEvent(nil, FALSE, FALSE, nil);
  g_hevtResultReturned := CreateEvent(nil, FALSE, FALSE, nil);

  // 建立一个服务线程
  hThreadServer := BeginThread(nil, 0, @ServerThread, nil, 0, dwThreadID);

  // 显示客户线程界面
  DialogBox(HInstance, MakeIntResource(IDD_HANDSHAKE), 0, @Dlg_Proc);

  // 通知服务线程结束
  lstrcpy(g_szSharedRequestAndResultBuffer, g_szServerShutdown);
  SetEvent(g_hevtRequestSubmitted);

  // 等待服务线程结束
  h[0] := g_hevtResultReturned;
  h[1] := hThreadServer;
  WaitForMultipleObjects(2, @h[0], TRUE, INFINITE);

  // 关闭内核对象句柄
  CloseHandle(hThreadServer);
  CloseHandle(g_hevtRequestSubmitted);
  CloseHandle(g_hevtResultReturned);
end.
