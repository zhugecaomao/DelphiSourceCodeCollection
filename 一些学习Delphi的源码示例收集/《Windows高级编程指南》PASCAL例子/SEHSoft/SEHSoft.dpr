
// Module name: SEHSoft.C ->> SEHSoft.dpr
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

program SEHSoft;

{$R 'SEHSoft.res' 'SEHSoft.rc'}

uses
  Windows, Messages,
  Other in '..\Other.pas', CmnHdr in '..\CmnHdr.pas', WindowsX in '..\WindowsX.pas';

const
  g_szModName = 'SEHSoft';
  IDD_SEHSOFT     =   1;
  IDC_NUMACCESSES = 100;
  IDC_LOG         = 101;
  IDI_SEHSOFT     = 101;

  // 数组结构
type
  PElement = ^TElement;
  TElement = record
    bReserved: array[0..4*1024-1] of Byte;
  end;
  PArray = ^TArray;
  TArray = array[0..0] of TElement;

  // 数组长度
const
  NUMELEMENTS  = 50;
  NUMBYTESINARRAY = SizeOf(TElement) * NUMELEMENTS;

  // 自定义异常编码
const
  SE_ZERO_ELEM =
    (ERROR_SEVERITY_ERROR) or // 严重性(31~30)
    (1 shl 29) or             // 客户/微软(29)
    (0 shl 28) or             // 保留(28)
    (FACILITY_NULL shl 16) or // 设备代码(27~16)
    (1);                      // 异常代码(15~0)

  // 扩展的SEH节点
type
  PEstablisherFrame = ^TEstablisherFrame;
  TEstablisherFrame = record
    Prev: PEstablisherFrame;
    Handler: TfnPerThreadExcptionHandler;
    case Byte of
      1: (FinallyEip, FinallyEbp: DWORD);  // LeaveException
      2: (lpbArray: PByte; hWndLog: HWND); // EXCEPTION_ACCESS_VIOLATION
      3: (ExceptEip, ExceptEbp: DWORD; PExceptRec: PExceptionRecord); // SE_ZERO_ELEM
  end;

  // 函数前置声明
function ExpFilter(var lpEP: TExceptionPointers; lpbArray: PByte; lNumBytesInArray: DWORD; hWndLog: HWND): Integer; forward;

  // 线程异常回调
function ExceptHandler(var ExceptionRecord: TExceptionRecord; var EstablisherFrame: TEstablisherFrame;
  var ContextRecord: TContext; DispatcherContext: Pointer): TExceptionDisposition; cdecl;
var
  EPs: TExceptionPointers;
begin
  case ExceptionRecord.ExceptionCode of
    EXCEPTION_ACCESS_VIOLATION:
      begin
        EPs.ExceptionRecord := @ExceptionRecord;
        EPs.ContextRecord := @ContextRecord;
        
        Result := ExpFilter(EPs, EstablisherFrame.lpbArray, NUMBYTESINARRAY, EstablisherFrame.hWndLog) + 1; // **
      end;

    SE_ZERO_ELEM:
      begin
        EstablisherFrame.PExceptRec^ := ExceptionRecord;
        ContextRecord.Ebp := EstablisherFrame.ExceptEbp;
        ContextRecord.Eip := EstablisherFrame.ExceptEip;        
        ContextRecord.Esp := DWORD(@EstablisherFrame);

        Result := ExceptionContinueExecution;
      end;

    LeaveException:
      begin
        ContextRecord.Ebp := EstablisherFrame.FinallyEbp;
        ContextRecord.Eip := EstablisherFrame.FinallyEip;
        ContextRecord.Esp := DWORD(@EstablisherFrame);

        Result := ExceptionContinueExecution;
      end;

    else Result := ExceptionContinueSearch;
  end;
end;

  // 提交物理内存
procedure CommitMemory(hWndLog: HWND; var lpEP: TExceptionPointers; lpbAttemptedAddr: PByte);
var
  fAttemptedWrite: BOOL;
  szBuf: array[0..100] of Char;
begin
  // 读/写导致异常
  fAttemptedWrite := BOOL(lpEP.ExceptionRecord.ExceptionInformation[0]);

  // 显示到ListBox
  _wvsprintf(szBuf, '---> Committing memory (%s attempted)', [DWORD(IfThen(fAttemptedWrite, 'write', 'read'))]);
  ListBox_AddString(hWndLog, szBuf);

  // 分配物理内存
  VirtualAlloc(lpbAttemptedAddr, SizeOf(TElement), MEM_COMMIT, PAGE_READWRITE);

  // 抛出自定异常
  if (fAttemptedWrite = FALSE) then RaiseException(SE_ZERO_ELEM, 0, 1, @lpbAttemptedAddr); // **
end;

  // 异常"过滤器"
function ExpFilter(var lpEP: TExceptionPointers; lpbArray: PByte; lNumBytesInArray: DWORD; hWndLog: HWND): Integer;
label
  FinallyDo, ExceptDo, NoExcept;
var
  lpbAttemptedAddr: PByte;
  dwExceptionCode: DWORD;
  nFilterResult: Integer;
  SavedExceptRec: TExceptionRecord;
  lpArrayElementToZero: PElement;
begin
  asm
    MOV  nFilterResult, EXCEPTION_CONTINUE_SEARCH
  end;
  dwExceptionCode := lpEP.ExceptionRecord.ExceptionCode;

  // 异常保护 (LeaveException)
  asm
    PUSH EBP                  // TEstablisherFrame.FinallyEbp := EBP
    PUSH OFFSET FinallyDo     // TEstablisherFrame.FinallyEip := FinallyDo
    PUSH OFFSET ExceptHandler // TEstablisherFrame.Handler := @ExceptHandler
    PUSH FS:[0]               // TEstablisherFrame.Prev := TEB.ExceptionList
    MOV  FS:[0], ESP          // TEB.ExceptionList := @TEstablisherFrame
  end;

  // 异常类型
  if (dwExceptionCode <> EXCEPTION_ACCESS_VIOLATION) then _leave;

  // 数组地址
  if (lpbArray = nil) then _leave;

  // 出错地址
  lpbAttemptedAddr := Pointer(lpEP.ExceptionRecord.ExceptionInformation[1]);
  if (DWORD(lpbAttemptedAddr) < DWORD(lpbArray)) or
     (DWORD(lpbArray) + lNumBytesInArray <= DWORD(lpbAttemptedAddr))
  then _leave;

  // 异常保护 (SE_ZERO_ELEM)
  asm
    LEA  EAX, SavedExceptRec
    PUSH EAX                    // TEstablisherFrame.PExceptRec := @SavedExceptRec;
    PUSH EBP                    // TEstablisherFrame.ExceptEbp := EBP
    PUSH OFFSET ExceptDo        // TEstablisherFrame.ExceptEip := ExceptDo
    PUSH OFFSET ExceptHandler   // TEstablisherFrame.Handler := @ExceptHandler
    PUSH FS:[0]                 // TEstablisherFrame.Prev := TEB.ExceptionList
    MOV  FS:[0], ESP            // TEB.ExceptionList := @TEstablisherFrame
  end;

  // 提交内存
  CommitMemory(hWndLog, lpEP, lpbAttemptedAddr);

  // 没有异常
  goto NoExcept;

  // 发生异常
ExceptDo:
  lpArrayElementToZero := PElement(SavedExceptRec.ExceptionInformation[0]);
  chINITSTRUCT(lpArrayElementToZero^, SizeOf(TElement), FALSE);
  ListBox_AddString(hWndLog, '---> Zeroed array element');

  // 去除保护 (SE_ZERO_ELEM)
NoExcept:
  asm
    POP  FS:[0]                 // TEB.ExceptionList := TEstablisherFrame.Prev;
    ADD  ESP, TYPE DWORD * 4    // 恢复栈顶
  end;
  nFilterResult := EXCEPTION_CONTINUE_EXECUTION;

  // 去除保护 (LeaveException)
FinallyDo:
  asm
    POP  FS:[0]               // TEB.ExceptionList := TEstablisherFrame.Prev;
    ADD  ESP, TYPE DWORD * 3  // 恢复栈顶
  end;

  Result := nFilterResult;
end;

  // 访问保留内存
procedure Dlg_ReserveArrayAndAccessIt(hWndLog: HWND; nNumAccesses: Integer);
var
  lpArray: PArray;
  Element: TElement;
  szBuf: array[0..100] of Char;
  nElementNum: Integer;
begin
  // 开始执行
  ListBox_ResetContent(hWndLog);
  ListBox_AddString(hWndLog, 'Execution started');

  // 保留内存
  lpArray := VirtualAlloc(nil, NUMBYTESINARRAY, MEM_RESERVE, PAGE_NOACCESS);

  // 异常保护 (EXCEPTION_ACCESS_VIOLATION)
  asm
    PUSH hWndLog              // TEstablisherFrame.hWndLog := hWndLog
    PUSH lpArray              // TEstablisherFrame.lpbArray := lpbArray
    PUSH OFFSET ExceptHandler // TEstablisherFrame.Handler := @ExceptHandler
    PUSH FS:[0]               // TEstablisherFrame.Prev := TEB.ExceptionList
    MOV  FS:[0], ESP          // TEB.ExceptionList := @TEstablisherFrame
  end;

  // 随机访问
  while (nNumAccesses > 0) do
  begin
    Dec(nNumAccesses);
    nElementNum := Random(NUMELEMENTS);

    // 读或者写
    if (Random(2) = 0) then
    begin
      _wvsprintf(szBuf, 'Reading index: %d', [nElementNum]);
      ListBox_AddString(hWndLog, szBuf);

      Element := lpArray[nElementNum];
    end else
    begin
      _wvsprintf(szBuf, 'Writing index: %d', [nElementNum]);
      ListBox_AddString(hWndLog, szBuf);

      lpArray[nElementNum] := Element;
    end;
  end; // while

  // 去除保护 (EXCEPTION_ACCESS_VIOLATION)
  asm
    POP  FS:[0]               // TEB.ExceptionList := TEstablisherFrame.Prev;
    ADD  ESP, TYPE DWORD * 3  // 恢复栈顶
  end;

  // 释放内存
  VirtualFree(lpArray, 0, MEM_RELEASE);

  // 执行完毕
  ListBox_AddString(hWndLog, 'Execution ended');
end;

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  chSETDLGICONS(hWnd, IDI_SEHSOFT, IDI_SEHSOFT);
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
          chMB('Invalid number of accesses.', g_szModName);
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
  chWARNIFUNICODEUNDERWIN95();
  DialogBox(HInstance, MakeIntResource(IDD_SEHSOFT), 0, @Dlg_Proc);
end.
