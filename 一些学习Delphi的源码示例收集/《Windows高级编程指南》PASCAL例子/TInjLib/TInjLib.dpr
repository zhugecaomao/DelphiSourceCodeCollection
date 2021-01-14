
// Module name: TInjLib.C ->> TInjLib.dpr
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

program TInjLib;

{$R 'TInjLib.res' 'TInjLib.rc'}

uses
  Windows, Messages, ProcMem in 'ProcMem.pas', InjLib in 'InjLib.pas',
  Other in '..\Other.pas', CmnHdr in '..\CmnHdr.pas', WindowsX in '..\WindowsX.pas';

const
  g_szModName = 'TInjLib';
  IDD_TINJLIB   =  1;
  IDC_INJECT    =  100;
  IDI_TINJLIB   =  101;
  IDC_PROCESSID =  101;

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  chSETDLGICONS(hWnd, IDI_TINJLIB, IDI_TINJLIB);
  Result := TRUE;
end;

  // WM_COMMAND
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
var
  fTranslated: BOOL;
  dwProcessId: DWORD;
  hProcess: THandle;
  szLibFile: array[0..MAX_PATH] of Char;
  pszSearch: PChar;
begin
  case (id) of
    IDC_INJECT:
      begin
        // 目标进程ID
        dwProcessId := GetDlgItemInt(hWnd, IDC_PROCESSID, fTranslated, FALSE);
        if (dwProcessId = 0) then dwProcessId := GetCurrentProcessId();

        // 进程句柄
        hProcess := OpenProcess(
          PROCESS_CREATE_THREAD     or  // For CreateRemoteThread
          PROCESS_QUERY_INFORMATION or  // For VirtualQueryEx
          PROCESS_VM_OPERATION      or  // For VirtualProtectEx
          PROCESS_VM_READ           or  // For ReadProcessMemory
          PROCESS_VM_WRITE,             // For WriteProcessMemory
          FALSE, dwProcessId);

        // 是否成功
        if (hProcess = 0) then
        begin
          chMB(
            IfThen(GetLastError() = ERROR_ACCESS_DENIED, 'Insufficient access to process', 'Invalid process Id'),
            g_szModName
              );
        end else
        begin
          GetModuleFileName(0, szLibFile, SizeOf(szLibFile));

          pszSearch := StrRChr(szLibFile, '\');
          if (pszSearch <> nil) then
          begin
            pszSearch^ := #0;
            pszSearch := StrRChr(szLibFile, '\');
          end;

          if (pszSearch = nil) then
            lstrcpy(szLibFile, '..\ImgWalk\ImgWalk.DLL')
          else
            lstrcpy(pszSearch, '\ImgWalk\ImgWalk.DLL');

          chMB(
            IfThen(InjectLibA(hProcess, szLibFile), 'Remote DLL Loaded', 'Remote DLL failed load'),
            g_szModName
              );

          CloseHandle(hProcess);
        end;
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
  DialogBox(HInstance, MakeIntResource(IDD_TINJLIB), 0, @Dlg_Proc);
end.
