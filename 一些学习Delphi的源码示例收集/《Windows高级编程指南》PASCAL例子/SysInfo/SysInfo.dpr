
// Module name: SysInfo.C ->> SysInfo.dpr
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

program SysInfo;

{$R 'SysInfo.res' 'SysInfo.rc'}

uses
  Windows, Messages,
  Other in '..\Other.pas', CmnHdr in '..\CmnHdr.pas', WindowsX in '..\WindowsX.pas';

const                
  IDD_SYSINFO        =    1;
  IDC_PROCARCH       =  100;
  IDC_PAGESIZE       =  101;
  IDI_SYSINFO        =  101;
  IDC_MINAPPADDR     =  102;
  IDC_MAXAPPADDR     =  103;
  IDC_ACTIVEPROCMASK =  104;
  IDC_NUMOFPROCS     =  105;
  IDC_PROCTYPE       =  106;
  IDC_ALLOCGRAN      =  107;
  IDC_PROCLEVEL      =  108;
  IDC_PROCREV        =  109;

var
  g_fWin95IsHost: BOOL = FALSE;

  // 整数转十进制字符串
function BigNumToString(lNum: LongInt; const szBuf: LPTSTR): LPTSTR;
var
  wNumDigits, wNumChars: Word;
begin
  wNumDigits := 0;
  wNumChars := 0;

  repeat
    // 最低位数字
    szBuf[wNumChars] := Char(lNum mod 10 + $30);
    Inc(wNumChars);

    // 十进制位数
    Inc(wNumDigits);

    // 逢3加一","
    if (wNumDigits mod 3 = 0) then
    begin
      szBuf[wNumChars] := ',';
      Inc(wNumChars);
    end;

    // 向右移一位
    lNum := lNum div 10;
  until (lNum = 0);

  // 置结束符号
  if (szBuf[wNumChars - 1] = ',') then szBuf[wNumChars - 1] := #0 else szBuf[wNumChars] := #0;

  // 反转字符串
  StrRev(szBuf);

  Result := szBuf;
end;

  // CPU信息显示到hWnd
procedure ShowCPUInfo(hWnd: HWND; wProcessorArchitecture, wProcessorLevel, wProcessorRevision: Word);
var
  szCPUArch, szCPULevel, szCPURev: array[0..64] of Char;
begin
  szCPULevel[0] := #0;
  szCPURev[0] := #0;

  case (wProcessorArchitecture) of
    PROCESSOR_ARCHITECTURE_INTEL:
      begin
        lstrcpy(szCPUArch, 'Intel');
        case (wProcessorLevel) of
          3, 4:
          begin
            _wvsprintf(szCPULevel, '80%c86', [ wProcessorLevel + $30 ]);
            if (g_fWin95IsHost = FALSE) then
              _wvsprintf(szCPURev, '%c%d', [ HiByte(wProcessorRevision) + $41, LoByte(wProcessorRevision) ]) 
            else
              lstrcpy(szCPURev, '(unknown)');
          end;
          5:
          begin
            _wvsprintf(szCPULevel, 'Pentium', [ ]);
            if (g_fWin95IsHost = FALSE) then
              _wvsprintf(szCPURev, 'Model %d, Stepping %d', [ HiByte(wProcessorRevision), LoByte(wProcessorRevision) ])
            else
              lstrcpy(szCPURev, '(unknown)');
          end;
        end; // END: case (wProcessorLevel) of
      end;

    PROCESSOR_ARCHITECTURE_MIPS:
      begin
        lstrcpy(szCPUArch, 'MIPS');
        _wvsprintf(szCPULevel, 'R%04d', [ LoByte(wProcessorLevel) * 1000 ]);
        _wvsprintf(szCPURev, '%d', [ LoByte(wProcessorRevision) ]);
      end;

    PROCESSOR_ARCHITECTURE_ALPHA:
      begin
        lstrcpy(szCPUArch, 'Alpha');
        _wvsprintf(szCPULevel, '%d', [ wProcessorLevel ]);
        _wvsprintf(szCPURev, 'Model %c, Pass %d', [ HiByte(wProcessorRevision) + $41, LoByte(wProcessorRevision) ]);
      end;

    PROCESSOR_ARCHITECTURE_PPC:
      begin
        lstrcpy(szCPUArch, 'PowerPC');
        case (wProcessorLevel) of
          1, 3, 4, 20: _wvsprintf(szCPULevel, '%d', [ 600 + wProcessorLevel ]);
          6: _wvsprintf(szCPULevel, '603+', [ wProcessorLevel ]);
          9: _wvsprintf(szCPULevel, '604+', [ wProcessorLevel ]);
        end;
        _wvsprintf(szCPURev, '%d.%d', [ HiByte(wProcessorRevision), LoByte(wProcessorRevision) ]);
      end;

    else _wvsprintf(szCPUArch, 'Unknown', []);
  end;

  SetDlgItemText(hWnd, IDC_PROCARCH, szCPUArch);
  SetDlgItemText(hWnd, IDC_PROCLEVEL, szCPULevel);
  SetDlgItemText(hWnd, IDC_PROCREV, szCPURev);
end;

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
var
  szBuf: array[0..50] of Char;
  sinf: TSystemInfo;
begin
  chSETDLGICONS(hWnd, IDI_SYSINFO, IDI_SYSINFO);

  GetSystemInfo(sinf);
  if (g_fWin95IsHost) then sinf.wProcessorLevel := sinf.dwProcessorType div 100;
  ShowCPUInfo(hWnd, sinf.wProcessorArchitecture, sinf.wProcessorLevel, sinf.wProcessorRevision);

  SetDlgItemText(hWnd, IDC_PAGESIZE, BigNumToString(sinf.dwPageSize, szBuf));
  SetDlgItemText(hWnd, IDC_MINAPPADDR, BigNumToString(LongInt(sinf.lpMinimumApplicationAddress), szBuf));
  SetDlgItemText(hWnd, IDC_MAXAPPADDR, BigNumToString(LongInt(sinf.lpMaximumApplicationAddress), szBuf));

  _wvsprintf(szBuf, '0x%08X', sinf.dwActiveProcessorMask);
  SetDlgItemText(hWnd, IDC_ACTIVEPROCMASK, szBuf);
  SetDlgItemText(hWnd, IDC_NUMOFPROCS, BigNumToString(sinf.dwNumberOfProcessors, szBuf));
  SetDlgItemText(hWnd, IDC_ALLOCGRAN, BigNumToString(sinf.dwAllocationGranularity, szBuf));

  Result := TRUE;
end;

  // WM_COMMAND
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
begin
  if (id = IDCANCEL) then EndDialog(hWnd, id);
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
var
  osvi: TOSVersionInfo;
begin
  chWARNIFUNICODEUNDERWIN95();

  osvi.dwOSVersionInfoSize := SizeOf(osvi);
  GetVersionEx(osvi);
  g_fWin95IsHost := (osvi.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS);

  DialogBox(HInstance, MakeIntResource(IDD_SYSINFO), 0, @Dlg_Proc);
end.
