program Summation;

{$R 'Summation.res' 'Summation.rc'}

uses
  Windows, Messages;

const
  IDD_SUMMATION = 101; // 资源ID
  IDI_SUMMATION = 102;
  IDC_SUMNUM = 1000;   // 控件ID
  IDC_CALC   = 1001;
  IDC_ANSWER = 1002;
  UINT_MAX = DWORD(-1); // 非法标识

type
  // 异常回调返回值
  TExceptionDisposition = (
    ExceptionContinueExecution = 0, // 继续执行遇到异常的线程(回调已经作了修复工作)
    ExceptionContinueSearch = 1,    // 回调未作处理, 请在链表上继续寻找其他回调
    ExceptionNestedException = 2,
    ExceptionCollidedUnwind = 3
                          );

  // 标准异常结构体
  PExceptionRegistration = ^TExceptionRegistration;
  TExceptionRegistration = record
    PrevStruct: PExceptionRegistration; // 上一节点位置
    ExceptionHandler: Pointer;          // 异常回调地址
  end;

  // 扩展异常结构体
  PExcFrame = ^TExcFrame;
  TExcFrame = record
    PStruct: PExcFrame; // 上一节点位置
    Handler: Pointer;   // 异常回调地址
    SafeEip: Pointer;   // 安全指令地址
  end;

  // 递归求和
function Sum(uNum: UINT): UINT;
begin
  if (uNum = 0) then Result := 0 else Result := uNum + Sum(uNum - 1);
end;

  // 异常回调
function ExceptHandler(var ExceptionRecord: TExceptionRecord; var EstablisherFrame: TExcFrame;
  var ContextRecord: TContext; DispatcherContext: Pointer): TExceptionDisposition; Cdecl;
begin
  if (ExceptionRecord.ExceptionCode = STATUS_STACK_OVERFLOW) then
  begin
    ContextRecord.Eax := UINT_MAX; // 线程函数返回'错误标识'
    ContextRecord.Eip := DWORD(EstablisherFrame.SafeEip); // 跳到'Call Sum'指令之后执行
    ContextRecord.Esp := DWORD(@EstablisherFrame); // 恢复栈顶为执行'Call Sum'前的位置
    Result := ExceptionContinueExecution;
  end else
    Result := ExceptionContinueSearch;
end;

  // 线程函数
function SumThreadFunc(uSumNum: UINT): DWORD;
asm
  // 在堆栈中构建异常结构
  PUSH OFFSET  @@SafeEip     // TExcFrame.SafeEip
  PUSH OFFSET  ExceptHandler // TExcFrame.Handler
  PUSH FS:[0]                // TExcFrame.PStruct

  // 将该结构插入链表首部
  MOV  FS:[0], ESP           // FS:[0]乃TIB.ExceptionList

  // 参数/返回值均在EAX中
  CALL Sum

  // 遇到异常时的跳转位置
@@SafeEip:

  // 从链表摘除我们的结构
  MOV  EDX   , [ESP]         // 上个节点地址
  MOV  FS:[0], EDX           // 设其为首节点

  // 清除异常结构占用堆栈
  ADD  ESP   , 12            // 修改栈顶指针
end;

  // 对话框WM_INITDIALOG消息处理
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  // 设置窗口图标
  SendMessage(hWnd, WM_SETICON, ICON_BIG, LoadIcon(HInstance, MakeIntResource(IDI_SUMMATION)));
  SendMessage(hWnd, WM_SETICON, ICON_SMALL, LoadIcon(HInstance, MakeIntResource(IDI_SUMMATION)));

  // 限制输入长度
  SendMessage(GetDlgItem(hWnd, IDC_SUMNUM), EM_LIMITTEXT, 9, 0);

  // 接受默认焦点
  Result := TRUE;
end;

  // 对话框WM_COMMAND消息处理
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
var
  dwThreadId: DWORD;
  uSum: UINT;
  hThread: THandle;
begin
  case (id) of
    IDCANCEL:
      begin
        EndDialog(hWnd, id);
      end;

    IDC_CALC:
      begin
        // 取得输入数值
        uSum := GetDlgItemInt(hWnd, IDC_SUMNUM, PBOOL(nil)^, FALSE);

        // 建立计算线程
        hThread := BeginThread(nil, 0, @SumThreadFunc, Pointer(uSum), 0, dwThreadId);

        // 等待线程结束
        WaitForSingleObject(hThread, INFINITE);

        // 线程退出代码 (等于线程函数返回值)
        GetExitCodeThread(hThread, uSum);

        // 关闭内核对象
        CloseHandle(hThread);

        // 堆栈是否溢出
        if (uSum = UINT_MAX) then
        begin
          SetDlgItemText(hWnd, IDC_ANSWER, 'Error');
          MessageBox(0, 'The number is too big, please enter a smaller number', 'Summation', MB_OK);
        end else
          SetDlgItemInt(hWnd, IDC_ANSWER, uSum, FALSE);
      end;
  end;
end;

  // 对话框回调
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  case (uMsg) of
    WM_INITDIALOG:
      begin
        Result := BOOL(SetWindowLong(hWnd,
          DWL_MSGRESULT, Longint(Dlg_OnInitDialog(hWnd, wParam, lParam))));
      end;

    WM_COMMAND:
      begin
        Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));
        Result := TRUE;
      end;

    else
      Result := FALSE; // 未曾处理 
  end;
end;

  // 主线程入口
begin
  DialogBox(HInstance, MakeIntResource(IDD_SUMMATION), 0, @Dlg_Proc);
end.
