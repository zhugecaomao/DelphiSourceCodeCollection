
// Module name: VMStat.C ->> VMStat.dpr
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

program VMStat;

{$R 'VMStat.res' 'VMStat.rc'}

uses
  Windows, Messages,
  Other in '..\Other.pas', CmnHdr in '..\CmnHdr.pas', WindowsX in '..\WindowsX.pas';

const
  IDD_VMSTAT        =  1;
  IDC_MEMLOAD       =  100;
  IDC_TOTALPHYS     =  101;
  IDI_VMSTAT        =  101;
  IDC_AVAILPHYS     =  102;
  IDC_TOTALPAGEFILE =  103;
  IDC_AVAILPAGEFILE =  104;
  IDC_TOTALVIRTUAL  =  105;
  IDC_AVAILVIRTUAL  =  106;

const
  IDT_UPDATE = 1; // 定时器ID

  // IntToStr()
function BigNumToString(lNum: DWORD; const szBuf: PChar): PChar;
var
  wNumDigits, wNumChars: WORD;
begin
  wNumDigits := 0; // 十进制位
  wNumChars := 0;  // 数组指针

  repeat
    // 最低位数字
    szBuf[wNumChars] := Char(lNum mod 10 + $30);
    Inc(wNumChars);

    // 隔3位加逗号
    Inc(wNumDigits);
    if (wNumDigits mod 3 = 0) then
    begin
      szBuf[wNumChars] := ',';
      Inc(wNumChars);
    end;

    // 向右移一位
    lNum := lNum div 10;
  until (lNum = 0);

  // 置结束符
  if (szBuf[wNumChars - 1] = ',') then szBuf[wNumChars - 1] := #0 else szBuf[wNumChars] := #0;

  // 反转字串
  StrRev(szBuf);

  // 方便调用
  Result := szBuf;
end;

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  chSETDLGICONS(hWnd, IDI_VMSTAT, IDI_VMSTAT);

  SetTimer(hWnd, IDT_UPDATE, 1 * 1000, nil);
  SendMessage(hWnd, WM_TIMER, IDT_UPDATE, 0);

  Result := TRUE;
end;

  // WM_TIMER
procedure Dlg_OnTimer(hWnd: HWND; id: UINT);
var
  szBuf: array[0..50] of Char;
  ms: TMemoryStatus;
begin
  ms.dwLength := SizeOf(ms);
  GlobalMemoryStatus(ms);

  SetDlgItemText(hWnd, IDC_MEMLOAD, BigNumToString(ms.dwMemoryLoad, szBuf));
  SetDlgItemText(hWnd, IDC_TOTALPHYS, BigNumToString(ms.dwTotalPhys, szBuf));
  SetDlgItemText(hWnd, IDC_AVAILPHYS, BigNumToString(ms.dwAvailPhys, szBuf));
  SetDlgItemText(hWnd, IDC_TOTALPAGEFILE, BigNumToString(ms.dwTotalPageFile, szBuf));
  SetDlgItemText(hWnd, IDC_AVAILPAGEFILE, BigNumToString(ms.dwAvailPageFile, szBuf));
  SetDlgItemText(hWnd, IDC_TOTALVIRTUAL, BigNumToString(ms.dwTotalVirtual, szBuf));
  SetDlgItemText(hWnd, IDC_AVAILVIRTUAL, BigNumToString(ms.dwAvailVirtual, szBuf));
end;

  // WM_COMMAND
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
begin
  if (id = IDCANCEL) then
  begin
    KillTimer(hWnd, IDT_UPDATE);
    EndDialog(hWnd, id);
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

    WM_TIMER:
      begin
        Dlg_OnTimer(hWnd, wParam);
        Result := TRUE;
      end;
      
    else Result := FALSE;
  end;
end;

  // 程序入口
begin
  chWARNIFUNICODEUNDERWIN95();
  DialogBox(HInstance, MakeIntResource(IDD_VMSTAT), 0, @Dlg_Proc);
end.
