program Spreadsheet;

{$R 'Spreadsheet.res' 'Spreadsheet.rc'}

uses Windows, Messages, VMArray in 'VMArray.pas';

const
  IDD_SPREADSHEET = 1;
  IDI_SPREADSHEET = 102;
  IDC_LOG       = 101;
  IDC_ROW       = 1001;
  IDC_COLUMN    = 1002;
  IDC_VALUE     = 1003;
  IDC_READCELL  = 1004;
  IDC_WRITECELL = 1005;
  g_nNumRows = 256;
  g_nNumCols = 1024;

  // 界面窗口句柄
var g_hWnd: HWND;

  // 电子表格单元
type
  PCell = ^TCell;
  TCell = packed record
    dwValue: DWORD;
    bDummy: array[1..1020] of Byte;
  end;

  // 电子表格数组
type
  PSpreadSheet = ^TSpreadSheet;
  TSpreadSheet = array[0..g_nNumRows-1] of array[0..g_nNumCols-1] of TCell;

  // 电子表格类
type
  TVMSpreadsheet = class(TVMArray)
  public
    constructor Create();
  protected
    function OnAccessViolation(pvAddrTouched: Pointer; fAttemptedRead: BOOL; // 新的修复动作
      var pep: TExceptionPointers; fRetryUntilSuccessful: BOOL): LongInt; override;
  end;

constructor TVMSpreadsheet.Create();
begin
  inherited Create(SizeOf(TCell), g_nNumRows * g_nNumCols);
end;

function TVMSpreadsheet.OnAccessViolation(pvAddrTouched: Pointer; fAttemptedRead: BOOL;
  var pep: TExceptionPointers; fRetryUntilSuccessful: BOOL): LongInt;
begin
  if fAttemptedRead then
  begin
    SetDlgItemText(g_hWnd, IDC_LOG, 'Violation: Attempting to Read');
    Result := EXCEPTION_EXECUTE_HANDLER;
  end else
  begin
    SetDlgItemText(g_hWnd, IDC_LOG, 'Violation: Attempting to Write');
    Result := inherited OnAccessViolation(pvAddrTouched, fAttemptedRead, pep, fRetryUntilSuccessful);
  end;
end;

var
  g_ssObject: TVMSpreadsheet; // 电子表格对象
  g_ss: PSpreadSheet = nil; // 表格数组首地址

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  SendMessage(hWnd, WM_SETICON, ICON_BIG, LoadIcon(HInstance, MakeIntResource(IDI_SPREADSHEET)));
  SendMessage(hWnd, WM_SETICON, ICON_SMALL, LoadIcon(HInstance, MakeIntResource(IDI_SPREADSHEET)));

  g_hWnd := hWnd;

  SendMessage(GetDlgItem(hWnd, IDC_ROW), EM_LIMITTEXT, 3, 0);
  SendMessage(GetDlgItem(hWnd, IDC_COLUMN), EM_LIMITTEXT, 4, 0);
  SendMessage(GetDlgItem(hWnd, IDC_VALUE), EM_LIMITTEXT, 7, 0);
  SetDlgItemInt(hWnd, IDC_ROW, 100, FALSE);
  SetDlgItemInt(hWnd, IDC_COLUMN, 100, FALSE);
  SetDlgItemInt(hWnd, IDC_VALUE, 12345, FALSE);

  Result := TRUE;
end;

  // 数值范围判断
function chInRange(const AMin, AValue, AMax: Integer): Boolean;
begin
  Result := (AValue >= AMin) and (AValue <= AMax);
end;

  // 线程异常回调
function ThreadExceptHandler(var ExceptionRecord: TExceptionRecord; var EstablisherFrame: TExceptionRegistration;
  var ContextRecord: TContext; DispatcherContext: Pointer): DWORD; Cdecl;
const
  ExceptionContinueExecution = 0;
  ExceptionContinueSearch = 1;
var
  ExceptionPointers: TExceptionPointers;
  FilterResult: LongInt;
begin
  ExceptionPointers.ExceptionRecord := @ExceptionRecord;
  ExceptionPointers.ContextRecord := @ContextRecord;
  FilterResult := g_ssObject.ExceptionFilter(ExceptionPointers, FALSE);

  case FilterResult of
    EXCEPTION_EXECUTE_HANDLER: // 跳至except块后执行
      begin
        ContextRecord.Eip := DWORD(EstablisherFrame.ExceptionAddress);
        ContextRecord.Esp := DWORD(@EstablisherFrame);
        Result := ExceptionContinueExecution;
      end;

    EXCEPTION_CONTINUE_EXECUTION: // 重新执行出错指令
      begin
        Result := ExceptionContinueExecution;
      end;

    EXCEPTION_CONTINUE_SEARCH: // 未作处理
      begin
        Result := ExceptionContinueSearch;
      end;

    else Result := ExceptionContinueSearch;
  end;
end;
  
  // WM_COMMAND
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
label
  On_Except, No_Except;
var
  nRow, nCol: Integer;
begin
  case (id) of
    IDCANCEL: // 要求关闭
      begin
        EndDialog(hWnd, id);
      end;

    IDC_ROW: // 行号(改变通知)
      begin
        nRow := GetDlgItemInt(hWnd, IDC_ROW, PBOOL(nil)^, FALSE);
        EnableWindow(GetDlgItem(hWnd, IDC_READCELL), chInRange(0, nRow, g_nNumRows - 1));
        EnableWindow(GetDlgItem(hWnd, IDC_WRITECELL), chInRange(0, nRow, g_nNumRows - 1));
      end;

    IDC_COLUMN: // 列号(改变通知)
      begin
        nCol := GetDlgItemInt(hWnd, IDC_COLUMN, PBOOL(nil)^, FALSE);
        EnableWindow(GetDlgItem(hWnd, IDC_READCELL), chInRange(0, nCol, g_nNumCols - 1));
        EnableWindow(GetDlgItem(hWnd, IDC_WRITECELL), chInRange(0, nCol, g_nNumCols - 1));
      end;

    IDC_READCELL: // 读数组
      begin
        SetDlgItemText(g_hWnd, IDC_LOG, 'No violation raised');
        nRow := GetDlgItemInt(hWnd, IDC_ROW, PBOOL(nil)^, FALSE);
        nCol := GetDlgItemInt(hWnd, IDC_COLUMN, PBOOL(nil)^, FALSE);

        // 异常保护
        asm
          PUSH OFFSET On_Except           // TExceptionRegistration.ExceptionAddress := On_Except;
          PUSH OFFSET ThreadExceptHandler // TExceptionRegistration.ExceptionHandler := @ThreadExceptHandler;
          PUSH FS:[0]                     // TExceptionRegistration.PrevStruct := TEB.ExceptionList;
          MOV  FS:[0], ESP                // TEB.ExceptionList := @TExceptionRegistration;
        end;

        // 可能出错
        SetDlgItemInt(hWnd, IDC_VALUE, g_ss[nRow][nCol].dwValue, FALSE);

        // 没有出错
        asm
          JMP No_Except
        end;

        // 异常处理
      On_Except:
        SetDlgItemText(hWnd, IDC_VALUE, ''); // 清空Edit, 以示此处还未分配物理内存

        // 收尾工作
      No_Except:
        asm
          POP  FS:[0]                     // TEB.ExceptionList := TExceptionRegistration.PrevStruct;
          ADD  ESP, TYPE Pointer * 2      // 恢复栈顶(与前面的PUSH对应)
        end;
      end;

    IDC_WRITECELL: // 写数组
      begin
        SetDlgItemText(g_hWnd, IDC_LOG, 'No violation raised');
        nRow := GetDlgItemInt(hWnd, IDC_ROW, PBOOL(nil)^, FALSE);
        nCol := GetDlgItemInt(hWnd, IDC_COLUMN, PBOOL(nil)^, FALSE);

        // 若该地址所处页还未分配物理内存, 执行写入指令将导致异常,
        // 我们的顶层异常处理回调将: 1.提交 2.从出错指令处重新执行
        g_ss[nRow][nCol].dwValue := GetDlgItemInt(hWnd, IDC_VALUE, PBOOL(nil)^, FALSE);
      end;
   end;
end;

  // 对话框回调
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  case (uMsg) of
    WM_INITDIALOG:
      begin
        Result :=
          SetWindowLong(hWnd, DWL_MSGRESULT, Longint(Dlg_OnInitDialog(hWnd, wParam, lParam))) <> 0;
      end;

    WM_COMMAND:
      begin
        Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));
        Result := TRUE;
      end;

    else
      Result := FALSE;
  end;
end;

  // 程序入口
begin
  g_ssObject := TVMSpreadsheet.Create();
  g_ss := g_ssObject.VMPointer;

  if (g_ss = nil) then
    MessageBox(0, 'Reserves a range failure.', 'Spreadsheet', MB_OK)
  else begin
    TVMArray.RemoveCurrentThreadOtherSEH();
    DialogBox(HInstance, MakeIntResource(IDD_SPREADSHEET), 0, @Dlg_Proc);
  end;

  g_ssObject.Free;
end.
