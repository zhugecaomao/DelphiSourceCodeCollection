
// Module name: SEHExcpt.C ->> SEHExcpt.dpr
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

program SEHExcpt;

{$R 'SEHExcpt.res' 'SEHExcpt.rc'}

uses
  Windows, Messages,
  Other in '..\Other.pas', CmnHdr in '..\CmnHdr.pas', WindowsX in '..\WindowsX.pas';

const
  g_szModName = 'SEHExcpt';
  IDD_SEHEXCPT     =    1;
  IDC_NUMACCESSES  =  100;
  IDC_LOG          =  101;
  IDI_SEHEXCPT     =  101;

  // 数组结构
type
  TElement = record
    bReserved: array[0..4*1024-1] of Byte;
  end;
  PElement = ^TElement;
  TArray = array[0..0] of TElement;
  PArray = ^TArray;

  // 数组长度
const
  NUMELEMENTS  =  50;
  NUMBYTESINARRAY = SizeOf(TElement) * NUMELEMENTS;

  // 提交物理内存
procedure CommitMemory(hWndLog: HWND; var lpEP: TExceptionPointers; lpbAttemptedAddr: PByte);
var
  fAttemptedWrite: BOOL;
  szBuf: array[0..100] of Char;
begin
  // 显示异常类型(读/写)
  fAttemptedWrite := BOOL(lpEP.ExceptionRecord.ExceptionInformation[0]);
  _wvsprintf(szBuf, '---> Committing memory (%s attempted)', [DWORD(IfThen(fAttemptedWrite, 'write', 'read'))]);
  ListBox_AddString(hWndLog, szBuf);

  // 为异常地址提交内存
  VirtualAlloc(lpbAttemptedAddr, SizeOf(TElement), MEM_COMMIT, PAGE_READWRITE);
end;

  // 扩展的SEH节点
type
  PEstablisherFrame = ^TEstablisherFrame;
  TEstablisherFrame = record
    Prev: PEstablisherFrame;
    Handler: Pointer;
    SafeEip: DWORD; // 出错跳转地址
  end;

  // 线程异常回调
function PerThreadExcptionHandler(var ExceptionRecord: TExceptionRecord; var EstablisherFrame: TEstablisherFrame;
  var ContextRecord: TContext; DispatcherContext: Pointer): TExceptionDisposition; cdecl;
begin
  if (ExceptionRecord.ExceptionCode = LeaveException) then
  begin
    ContextRecord.Eip := EstablisherFrame.SafeEip; // 跳到后面
    ContextRecord.Esp := DWORD(@EstablisherFrame); // 恢复栈顶
    Result := ExceptionContinueExecution; // 已经处理, 线程按ContextRecord继续执行
  end else
    Result := ExceptionContinueSearch;    // 没有处理, 系统继续"询问"后面的SEH节点
end;

  // 异常"过滤器"
function ExpFilter(var lpEP: TExceptionPointers; lpbArray: PByte; lNumBytesInArray: DWORD; hWndLog: HWND): Integer;
label
  FinallyDo;
var
  lpbAttemptedAddr: PByte;
  dwExceptionCode: DWORD;
  nFilterResult: Integer;
begin
  asm
    MOV  nFilterResult, EXCEPTION_CONTINUE_SEARCH
  end;
  dwExceptionCode := lpEP.ExceptionRecord.ExceptionCode;

  // 异常保护 (_try)
  asm
    PUSH EBP                   // 备份 EBP
    PUSH OFFSET FinallyDo      // TEstablisherFrame.SafeEip := @FinallyDo
    PUSH OFFSET PerThreadExcptionHandler // TEstablisherFrame.Handler := @PerThreadExcptionHandler
    PUSH FS:[0]                // TEstablisherFrame.Prev := TEB.ExceptionList
    MOV  FS:[0], ESP           // TEB.ExceptionList := @TEstablisherFrame
  end;

  // 异常编码
  if (dwExceptionCode <> EXCEPTION_ACCESS_VIOLATION) then _leave;

  // 数组地址
  if (lpbArray = nil) then _leave;

  // 异常地址
  lpbAttemptedAddr := Pointer(lpEP.ExceptionRecord.ExceptionInformation[1]);

  // 在数组外
  if (DWORD(lpbAttemptedAddr) < DWORD(lpbArray)) or
     (DWORD(lpbArray) + lNumBytesInArray <= DWORD(lpbAttemptedAddr))
  then _leave;

  // 提交内存
  CommitMemory(hWndLog, lpEP, lpbAttemptedAddr);

  // 重新执行
  nFilterResult := EXCEPTION_CONTINUE_EXECUTION;

  // 去除保护 (_finally)
FinallyDo:
  asm
    POP  FS:[0]                // TEB.ExceptionList := TEstablisherFrame.Prev
    ADD  ESP, TYPE Pointer * 2 // 恢复栈顶
    POP  EBP                   // 恢复 EBP
  end;

  Result := nFilterResult;
end;

  // 顶层异常回调
function TopLevelExceptionHandler(var pep: TExceptionPointers): LongInt; stdcall;
begin
  Result := ExpFilter(pep, PByte(pep.ContextRecord.Ebp), NUMBYTESINARRAY, PDWORD(pep.ContextRecord.Esp)^);
  // 注: 此处参数依Dlg_ReserveArrayAndAccessIt()函数的汇编代码而定
end;

  // 访问保留内存
procedure Dlg_ReserveArrayAndAccessIt(hWndLog: HWND; nNumAccesses: Integer);
var
  lpArray: PArray;
  Element: TElement;
  szBuf: array[0..100] of Char;
  nElementNum: Integer;
begin
  ListBox_ResetContent(hWndLog);
  ListBox_AddString(hWndLog, 'Execution started');

  // 保留内存
  lpArray := VirtualAlloc(nil, NUMBYTESINARRAY, MEM_RESERVE, PAGE_NOACCESS);

  // 随机访问
  while (nNumAccesses > 0) do
  begin
    Dec(nNumAccesses);

    // 数组下标
    nElementNum := Random(NUMELEMENTS);

    // 正要访问
    _wvsprintf(szBuf, 'Writing index: %d', [nElementNum]);
    ListBox_AddString(hWndLog, szBuf);

    // 尝试写入
    lpArray[nElementNum] := Element;
  end;

  ListBox_AddString(hWndLog, 'Execution ended');

  // 释放内存
  VirtualFree(lpArray, 0, MEM_RELEASE);
end;

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  chSETDLGICONS(hWnd, IDI_SEHEXCPT, IDI_SEHEXCPT);
  SetDlgItemInt(hWnd, IDC_NUMACCESSES, 100, FALSE);
  Result := TRUE;
end;

  // WM_COMMAND
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
var
  nNumAccesses: Integer;
  fTranslated: BOOL;
begin
  case (id) of
    IDOK:
      begin
        nNumAccesses := GetDlgItemInt(hWnd, IDC_NUMACCESSES, fTranslated, FALSE);

        if (fTranslated) then
          Dlg_ReserveArrayAndAccessIt(GetDlgItem(hWnd, IDC_LOG), nNumAccesses)
        else
          chMB('Invalid number of accesses ', g_szModName);
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
      begin
        Result := SetDlgMsgResult(hWnd, LRESULT(Dlg_OnInitDialog(hWnd, wParam, lParam)));
      end;

    WM_COMMAND:
      begin
        Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));
        Result := TRUE;
      end;

    else Result := FALSE;
  end;
end;

  // 程序入口
begin
  RemoveCurrentThreadOtherSEH(); // 去掉SetExceptionHandler()安装的线程异常处理节点
  SetUnhandledExceptionFilter(@TopLevelExceptionHandler); // 安装顶层异常处理回调

  chWARNIFUNICODEUNDERWIN95();
  DialogBox(HInstance, MakeIntResource(IDD_SEHEXCPT), 0, @Dlg_Proc);
end.
