program WfMETest;

{$R 'WfMETest.res' 'WfMETest.rc'}

uses Windows, Messages, WaitForMultExp in 'WaitForMultExp.pas';

const
  IDI_WFMETEXT = 101; // 资源相关ID
  IDD_WFMETEST = 102;
  IDC_NUMOBJS    = 1000; // 窗口控件ID
  IDC_TIMEOUT    = 1001;
  IDC_EXPRESSION = 1002;
  IDC_OBJLIST    = 1003;
  IDC_RESULT     = 1004;
  MAX_KERNEL_OBJS = 1000; // 事件对象数量限制
  MAX_EXPRESSION_SIZE = ((64 * 63) + 63); // m_ahExpObjs数组长度
  WM_WAITEND = (WM_USER + 101); // 自定义消息, 用作递交等待结果

type
  TAWFME = record
    m_hWnd: HWND;            // 结果递交目标窗口句柄
    m_dwMilliseconds: DWORD; // 毫秒为单位的超时间隔
    m_nExpObjects: DWORD;    // m_ahExpObjs 实际使用长度
    m_ahExpObjs: array[0..MAX_EXPRESSION_SIZE - 1] of THandle; // 句柄列表组成的表达式
  end;

var
  g_ahObjs: array[0..MAX_KERNEL_OBJS - 1] of THandle; // 事件对象句柄列表
  g_awfme: TAWFME;

  // 异步等待线程函数
function AsyncWaitForMultipleExpressions(const pawfme: TAWFME): Integer;
begin
  // 挂起等待
  Result := WaitForMultipleExpressions(
    pawfme.m_nExpObjects, @pawfme.m_ahExpObjs[0], pawfme.m_dwMilliseconds);

  // 通知结果
  PostMessage(pawfme.m_hWnd, WM_WAITEND, Result, 0);
end;

  // 十进制字串转整数
function StrToInt(const S: PChar): Integer;
var
  P: PByte;
begin
  Result := 0;
  P := PByte(S);
  while (P^ <> $00) do
  begin
    if (P^ > $39) or (P^ < $30) then // 越界
    begin
      Result := 0;
      Exit;
    end else
    begin
      Result := Result * 10 + (P^ - $30);
      Inc(P); // 指针后移
    end;
  end;
end;

  // s1中首个未存在于s2的字符的偏移
function StrSpn(const s1, s2: PChar): Integer;
var
  p1, p2: PChar;
begin
  Result := 0;

  p1 := s1;
  while (p1^ <> #0) do // 遍历s1
  begin
    p2 := s2;
    while (p2^ <> #0) do // 遍历s2
    begin
      if (p1^ = p2^) then Break;
      Inc(p2); // 指针后移
    end;
    if (p2^ = #0) then Exit; // s1当前字符不存在s2中

    Inc(p1); // 指针后移
    Inc(Result);
  end;
end;

  // s1中首次出现s2中任一字符的位置
function StrPBrk(const s1, s2: PChar): PChar;
var
  p1, p2: PChar;
begin
  p1 := s1;
  while (p1^ <> #0) do // 遍历s1
  begin
    p2 := s2;
    while (p2^ <> #0) do // 遍历s2
    begin
      if (p1^ = p2^) then
      begin
        Result := p1; // 首现位置
        Exit;
      end;

      Inc(p2); // 指针后移
    end;

    Inc(p1); // 指针后移
  end;

  Result := nil; // 没找到
end;

  // 以分隔符t来分解s
function StrTok(const s, t: PChar): PChar;
const
{$J+}
  sStrTok: PChar = nil;
{$J-}
var
  sBegin, sEnd: PChar;
begin
  // 确定本次首地址
  if (s = nil) then
    sBegin := sStrTok
  else
    sBegin := s;
  if (sBegin = nil) then
  begin
    Result := nil;
    Exit;
  end;

  // 跳过开头分隔符
  Inc(sBegin, StrSpn(sBegin, t));
  if (sBegin^ = #0) then
  begin
    sStrTok := nil;
    Result := nil;
    Exit;
  end;
  Result := sBegin;

  // 定位下一分隔符
  sEnd := StrPBrk(sBegin, t);
  if (sEnd <> nil) and (sEnd^ <> #0) then
  begin
    sEnd^ := #0;
    Inc(sEnd);
  end;
  sStrTok := sEnd;
end;

  // 对话框WM_INITDIALOG消息处理
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  // 设置窗口图标
  SendMessage(hWnd, WM_SETICON, ICON_BIG, LoadIcon(HInstance, MakeIntResource(IDI_WFMETEXT)));
  SendMessage(hWnd, WM_SETICON, ICON_SMALL, LoadIcon(HInstance, MakeIntResource(IDI_WFMETEXT)));

  // 子控件默认值
  SetDlgItemInt(hWnd, IDC_NUMOBJS, 4, FALSE);
  SetDlgItemInt(hWnd, IDC_TIMEOUT, 30000, FALSE);
  SetDlgItemText(hWnd, IDC_EXPRESSION, '1 2 | 2 3 4 | 1 4');

  // ListBox 列宽
  SendMessage(GetDlgItem(hWnd, IDC_OBJLIST),
    LB_SETCOLUMNWIDTH, LOWORD(GetDialogBaseUnits()) * 4, 0);

  // 接受默认焦点
  Result := TRUE;
end;

  // 对话框WM_WAITEND消息处理
function Dlg_OnWaitEnd(hWnd: HWND; wParam: WPARAM; lParam: LPARAM): LRESULT;
var
  n: Integer;
begin
  // 清除事件对象
  n := 0;
  while (g_ahObjs[n] <> 0) do
  begin
    CloseHandle(g_ahObjs[n]);
    Inc(n);
  end;

  // 显示等待结果
  if (wParam = WAIT_TIMEOUT) then
    SetDlgItemText(hWnd, IDC_RESULT, 'Timeout')
  else
    if (wParam = Longint(WAIT_FAILED)) then
      SetDlgItemText(hWnd, IDC_RESULT, 'Failed') // **
    else
      SetDlgItemInt(hWnd, IDC_RESULT, wParam - WAIT_OBJECT_0, FALSE);

  // 启用窗口控件
  EnableWindow(GetDlgItem(hWnd, IDC_NUMOBJS), TRUE);
  EnableWindow(GetDlgItem(hWnd, IDC_TIMEOUT), TRUE);
  EnableWindow(GetDlgItem(hWnd, IDC_EXPRESSION), TRUE);
  EnableWindow(GetDlgItem(hWnd, IDOK), TRUE);
  SetFocus(GetDlgItem(hWnd, IDC_EXPRESSION));

  Result := 0;
end;

  // 对话框WM_COMMAND消息处理
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
var
  szExpression: array[0..100] of Char;
  szBuf: array[0..20] of Char;
  nObjects, n: Integer;
  dwThreadId: DWORD;
  p: PChar;
begin
  // 表达式串
  GetWindowText(GetDlgItem(hWnd, IDC_EXPRESSION), szExpression, SizeOf(szExpression));

  // 对象数量
  nObjects := GetDlgItemInt(hWnd, IDC_NUMOBJS, PBOOL(nil)^, FALSE);

  case (id) of
    IDCANCEL:
      begin
        EndDialog(hWnd, id);
      end;

    IDC_OBJLIST:
      if (codeNotify = LBN_SELCHANGE) then
      begin
        // ListBox选中项目已经改变

        // 所有事件对象置为非信号
        for n := 0 to nObjects - 1 do ResetEvent(g_ahObjs[n]);

        // 根据选中设事件对象状态
        for n := 0 to nObjects - 1 do
        begin
          if (SendMessage(GetDlgItem(hWnd, IDC_OBJLIST), LB_GETSEL, n, 0) > 0) then
            SetEvent(g_ahObjs[n]);
        end;
      end;

    IDOK:
      begin
        // 对象数量过多
        if (nObjects <= 0) or (nObjects > MAX_KERNEL_OBJS) then Exit;

        // 禁用窗口控件
        SetFocus(GetDlgItem(hWnd, IDC_OBJLIST));
        EnableWindow(GetDlgItem(hWnd, IDC_NUMOBJS), FALSE);
        EnableWindow(GetDlgItem(hWnd, IDC_TIMEOUT), FALSE);
        EnableWindow(GetDlgItem(hWnd, IDC_EXPRESSION), FALSE);
        EnableWindow(GetDlgItem(hWnd, IDOK), FALSE);

        // 表示正在执行
        SetDlgItemText(hWnd, IDC_RESULT, 'Waiting...');

        // 初始化g_awfme
        g_awfme.m_hwnd := hWnd;
        g_awfme.m_dwMilliseconds := GetDlgItemInt(hWnd, IDC_TIMEOUT, PBOOL(nil)^, FALSE);
        g_awfme.m_nExpObjects := 0;
        ZeroMemory(@g_awfme.m_ahExpObjs[0], SizeOf(g_awfme.m_ahExpObjs));

        // 处理对象列表
        SendMessage(GetDlgItem(hWnd, IDC_OBJLIST), LB_RESETCONTENT, 0, 0);
        ZeroMemory(@g_ahObjs[0], SizeOf(g_ahObjs));
        for n := 1 to nObjects do
        begin
          // 建立事件对象
          g_ahObjs[n - 1] := CreateEvent(nil, FALSE, FALSE, nil);

          // 添加List项目
          wvsprintf(szBuf, '  %d', @n);
          SendMessage(GetDlgItem(hWnd, IDC_OBJLIST),
            LB_ADDSTRING, 0, Longint(@szBuf[lstrlen(szBuf) - 3]));
        end;

        // 分析表达式串
        p := StrTok(szExpression, ' ');
        while (p <> nil) do
        begin
          // 当前元素内容
          if (p^ = '|') then                                      
            g_awfme.m_ahExpObjs[g_awfme.m_nExpObjects] := 0   // #0 = '|' = OR
          else begin
            n := StrToInt(p);                                 // 第n个事件对象
            g_awfme.m_ahExpObjs[g_awfme.m_nExpObjects] := g_ahObjs[n - 1];
          end;

          // 数组长度增加
          Inc(g_awfme.m_nExpObjects);

          // 定位下一元素
          p := StrTok(nil, ' ');
        end;

        // 建立等待线程
        CloseHandle(
          BeginThread(nil, 0, @AsyncWaitForMultipleExpressions, @g_awfme, 0, dwThreadId) );
      end;
  end;
end;

  // 对话框消息处理回调
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  Result := FALSE;

  case (uMsg) of
    WM_INITDIALOG:
      Result := SetWindowLong(hWnd, DWL_MSGRESULT,
        Longint(Dlg_OnInitDialog(hWnd, wParam, lParam))) <> 0;

    WM_COMMAND:
      Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));

    WM_WAITEND:
      Result := (Dlg_OnWaitEnd(hwnd, wParam, lParam) <> 0);
  end;
end;

  // 程序主线程入口点
begin
  DialogBox(HInstance, MakeIntResource(IDD_WFMETEST), 0, @Dlg_Proc);
end.
