
// Module name: TLSDyn.C ->> TLSDyn.dpr
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

program TLSDyn;

{$R 'TLSDyn.res' 'TLSDyn.rc'}

uses
  Windows, Messages,
  Other in '..\Other.pas', CmnHdr in '..\CmnHdr.pas', WindowsX in '..\WindowsX.pas';

const
  IDD_TLSDYN  =    1;
  IDC_LOG     =  100;
  IDI_TLSDYN  =  101;

  // ListBox
var
  g_hWndLog: HWND = 0;

  // 外部函数
function LoadResString(): PChar; external '..\SomeLib\SomeLib.dll';  

  // 线程函数
function ThreadFunc(nThreadNum: Integer): Integer;
var
  nNumCycles: Integer; // = 4;
  szBuf: array[0..100] of Char;
  szString: PChar; // = LoadResString();
begin
  szString := LoadResString();

  for nNumCycles := 4 downto 1 do
  begin
    _wvsprintf(szBuf, 'Thread #%d: %s', [nThreadNum, DWORD(szString)]);
    ListBox_AddString(g_hWndLog, szBuf);

    Sleep(nThreadNum * 50);
  end;

  Result := 0;
end;

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
var
  nThreadNum: Integer;
  hThread: THandle;
  dwIDThread: DWORD;
begin
  chSETDLGICONS(hWnd, IDI_TLSDYN, IDI_TLSDYN);

  g_hWndLog := GetDlgItem(hWnd, IDC_LOG);

  for nThreadNum := 1 to 5 do
  begin
    hThread := BeginThread(nil, 0, @ThreadFunc, Pointer(nThreadNum), 0, dwIDThread);
    CloseHandle(hThread);
  end;

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

  // 主线程入口
begin
  chWARNIFUNICODEUNDERWIN95();
  chMB(LoadResString(), 'String Before Dialog Box');
  DialogBox(HInstance, MakeIntResource(IDD_TLSDYN), 0, @Dlg_Proc);
  chMB(LoadResString(), 'String After Dialog Box');
end.
