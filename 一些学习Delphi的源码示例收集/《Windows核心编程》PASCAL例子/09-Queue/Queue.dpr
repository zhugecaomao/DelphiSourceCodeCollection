program Queue;

{$R 'Queue.res' 'Queue.rc'}

uses
  Windows, Messages;

const
  ERROR_DATABASE_FULL = 4314; // 数据库已满(错误代码)
  IDD_QUEUE =   1; // 模板资源ID
  IDI_QUEUE = 102; // 图标资源ID
  IDC_CLIENTS = 1000; // 控件ID~
  IDC_SERVERS = 1001;

type
  PElement = ^TElement; // 队列成员
  TElement = record
    m_nThreadNum, m_nRequestNum: Integer;
  end;

  TQueue = class(TObject) // 队列类
  public
    constructor Create(nMaxElements: Integer);
    destructor Destroy(); override;
    function Append(PtElement: PElement; dwTimeout: DWORD): BOOL;
    function Remove(PtElement: PElement; dwTimeout: DWORD): BOOL;
  private
    m_pElements: PElement;   // 数组地址
    m_nMaxElements: Integer; // 数组长度
    m_hmtxQ, m_hsemNumElements: THandle; // Mutex(队列访问权), semaphore(队列长度)
  end;

  // 构造函数
constructor TQueue.Create(nMaxElements: Integer);
begin
  m_pElements := HeapAlloc(GetProcessHeap(), 0, SizeOf(TElement) * nMaxElements);
  m_nMaxElements := nMaxElements;
  m_hmtxQ := CreateMutex(nil, FALSE, nil);
  m_hsemNumElements := CreateSemaphore(nil, 0, nMaxElements, nil);
end;

  // 析构函数
destructor TQueue.Destroy();
begin
  CloseHandle(m_hsemNumElements);
  CloseHandle(m_hmtxQ);
  HeapFree(GetProcessHeap(), 0, m_pElements);
end;

  // 入队操作
function TQueue.Append(PtElement: PElement; dwTimeout: DWORD): BOOL;
var
  dw, lPrevCount: DWORD;
begin
  Result := FALSE;

  // 等待队列访问权
  dw := WaitForSingleObject(m_hmtxQ, dwTimeout);

  // 等待成功
  if (dw = WAIT_OBJECT_0) then
  begin
    // 长度增加
    Result := ReleaseSemaphore(m_hsemNumElements, 1, @lPrevCount);

    // 队列满否
    if (Result) then
      PElement(DWORD(m_pElements) + SizeOf(TElement) * lPrevCount)^ := PtElement^
    else
      SetLastError(ERROR_DATABASE_FULL);

    // 释放队列访问权
    ReleaseMutex(m_hmtxQ);
  end else
  begin
  // 等待超时
    SetLastError(ERROR_TIMEOUT);
  end;
end;

  // 出队操作
function TQueue.Remove(PtElement: PElement; dwTimeout: DWORD): BOOL;
begin
  // 1.等待队列访问权(m_hmtxQ)
  // 2.队列非空(m_hsemNumElements)
  Result := (WaitForMultipleObjects(2, @m_hmtxQ, TRUE, dwTimeout) = WAIT_OBJECT_0);

  // 等待成功
  if (Result) then
  begin
    // 读取队头
    PtElement^ := m_pElements^;

    // 覆盖队头
    MoveMemory(m_pElements, PElement(Integer(m_pElements) + SizeOf(TElement)), SizeOf(TElement) * (m_nMaxElements - 1));

    // 释放队列访问权
    ReleaseMutex(m_hmtxQ);
  end else
  begin
  // 等待超时
    SetLastError(ERROR_TIMEOUT);
  end;
end;

  // 全局变量 :-)
var
  g_q: TQueue;                // 队列对象
  g_fShutdown: BOOL = FALSE;  // 结束信号
  g_hWnd: HWND;               // 主对话框
  g_hThreads: array[0..MAXIMUM_WAIT_OBJECTS-1] of THandle; // 线程句柄
  g_nNumThreads: Integer = 0; // 线程数量

  // 包装API, 便于调用
function wvsprintf(Output: PChar; Format: PChar; Arg_List: array of Integer): Integer;
begin
  Result := Windows.wvsprintf(Output, Format, @Arg_List[Low(Arg_List)]);
end;

  // 客户线程, 不断入队
function ClientThread(nThreadNum: Integer): Integer;
var
  hWndLB: HWND;
  e: TElement;
  nRequestNum: Integer;
  sz: array[0..1024] of Char;
begin
  hWndLB := GetDlgItem(g_hWnd, IDC_CLIENTS);
  nRequestNum := 1;

  while (g_fShutdown = FALSE) do
  begin
    // 待添成员
    e.m_nThreadNum := nThreadNum;
    e.m_nRequestNum := nRequestNum;

    // 尝试入队
    if g_q.Append(@e, 200) then
    begin
      wvsprintf(sz, 'Sending %d:%d', [nThreadNum, nRequestNum]);
    end else
    begin
      if (GetLastError() = ERROR_TIMEOUT) then
        wvsprintf(sz, 'Sending %d:%d (timeout)', [nThreadNum, nRequestNum])
      else
        wvsprintf(sz, 'Sending %d:%d (full)', [nThreadNum, nRequestNum]);
    end;

    // 显示信息
    SendMessage(hWndLB, LB_SETCURSEL, SendMessage(hWndLB, LB_ADDSTRING, 0, Integer(@sz[0])), 0);

    Sleep(2500);
    Inc(nRequestNum);
  end;

  Result := 0;
end;

  // 服务线程, 不断出队
function ServerThread(nThreadNum: Integer): Integer;
var
  hWndLB: HWND;
  sz: array[0..1024] of Char;
  e: TElement;
begin
  hWndLB := GetDlgItem(g_hWnd, IDC_SERVERS);

  while (g_fShutdown = FALSE) do
  begin
    // 尝试出队
    if g_q.Remove(@e, 5000) then
    begin
      wvsprintf(sz, '%d: Processing %d:%d', [nThreadNum, e.m_nThreadNum, e.m_nRequestNum]);
      Sleep(2000 * e.m_nThreadNum);
    end else
      Windows.wvsprintf(sz, '%d: (timeout)', @nThreadNum);

    // 显示信息
    SendMessage(hWndLB, LB_SETCURSEL, SendMessage(hWndLB, LB_ADDSTRING, 0, Integer(@sz[0])), 0);
  end;

  Result := 0;
end;

  // 对话框WM_INITDIALOG处理
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
var
  dwThreadID: DWORD;
  x: Integer;
begin
  // 设置窗口图标
  SendMessage(hWnd, WM_SETICON, ICON_BIG, LoadIcon(HInstance, MakeIntResource(IDI_QUEUE)));
  SendMessage(hWnd, WM_SETICON, ICON_SMALL, LoadIcon(HInstance, MakeIntResource(IDI_QUEUE)));

  // 主对话框句柄
  g_hWnd := hWnd;

  // 建立客户线程
  for x := 0 to 3 do
  begin
    g_hThreads[g_nNumThreads] := BeginThread(nil, 0, @ClientThread, Pointer(x), 0, dwThreadID);
    Inc(g_nNumThreads);
  end;

  // 建立服务线程
  for x := 0 to 1 do
  begin
    g_hThreads[g_nNumThreads] := BeginThread(nil, 0, @ServerThread, Pointer(x), 0, dwThreadID);
    Inc(g_nNumThreads);
  end;

  // 接受默认焦点
  Result := TRUE;
end;

  // 对话框WM_COMMAND消息处理
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
begin
  if (id = IDCANCEL) then EndDialog(hWnd, id);
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

  // 程序'主线程'入口点
begin
  // 建立队列对象
  g_q := TQueue.Create(10);

  // 建立显示窗口
  DialogBox(HInstance, MakeIntResource(IDD_QUEUE), 0, @Dlg_Proc);

  // 通知线程结束
  InterlockedExchange(Integer(g_fShutdown), 1);

  // 等待线程结束
  WaitForMultipleObjects(g_nNumThreads, @g_hThreads[0], TRUE, INFINITE);

  // 关闭线程句柄
  while (g_nNumThreads > 0) do
  begin
    Dec(g_nNumThreads);
    CloseHandle(g_hThreads[g_nNumThreads]);
  end;

  // 释放队列对象
  g_q.Free;
end.
