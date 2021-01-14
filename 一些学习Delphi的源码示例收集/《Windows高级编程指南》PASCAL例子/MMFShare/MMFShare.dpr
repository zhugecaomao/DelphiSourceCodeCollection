
// Module name: MMFShare.C ->> MMFShare.dpr
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

program MMFShare;

{$R 'MMFShare.res' 'MMFShare.rc'}

uses
  Windows, Messages,
  CmnHdr in '..\CmnHdr.pas', WindowsX in '..\WindowsX.pas';

const
  g_szModName = 'MMFShare';
  IDD_MMFSHARE    =  1;
  IDC_DATA        =  100;
  IDC_CREATEFILE  =  101;
  IDC_OPENFILE    =  102;
  IDI_MMFSHARE    =  102;
  IDC_CLOSEFILE   =  103;
  g_szShareName = 'MMFSharedData';  

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  chSETDLGICONS(hWnd, IDI_MMFSHARE, IDI_MMFSHARE);

  Edit_SetText(GetDlgItem(hWnd, IDC_DATA), 'Some test data');
  Button_Enable(GetDlgItem(hWnd, IDC_CLOSEFILE), FALSE);
  
  Result := TRUE;
end;

  // WM_COMMAND
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
const {$J+}
  s_hFileMap: THandle = 0; {$J-}
var
  hFileMapT: THandle;
  lpView: Pointer;
begin
  case (id) of
    IDC_CREATEFILE: // 写入
      begin
        if (codeNotify <> BN_CLICKED) then Exit;

        s_hFileMap := CreateFileMapping($FFFFFFFF, nil, PAGE_READWRITE, 0, 4 * 1024, g_szShareName);

        if (s_hFileMap <> 0) then
        begin
          if (GetLastError() = ERROR_ALREADY_EXISTS) then
          begin
            chMB('Mapping already exists - not created', g_szModName);
            CloseHandle(s_hFileMap);
          end else
          begin
            lpView := MapViewOfFile(s_hFileMap, FILE_MAP_READ or FILE_MAP_WRITE, 0, 0, 0);
            
            if (lpView <> nil) then
            begin
              Edit_GetText(GetDlgItem(hWnd, IDC_DATA), lpView, 4 * 1024);
              UnmapViewOfFile(lpView);
              Button_Enable(hWndCtl, FALSE);
              Button_Enable(GetDlgItem(hWnd, IDC_CLOSEFILE), TRUE);
            end else
            begin
              chMB('Can''t map view of file', g_szModName);
              CloseHandle(s_hFileMap);              
            end;
          end;
        end else
          chMB('Can''t create file mapping', g_szModName);
      end;

    IDC_CLOSEFILE: // 释放
      begin
        if (codeNotify <> BN_CLICKED) then Exit;

        if CloseHandle(s_hFileMap) then
        begin
          Button_Enable(GetDlgItem(hWnd, IDC_CREATEFILE), TRUE);
          Button_Enable(hWndCtl, FALSE);
        end;
      end;

    IDC_OPENFILE: // 读取
      begin
        if (codeNotify <> BN_CLICKED) then Exit;

        hFileMapT := OpenFileMapping(FILE_MAP_READ or FILE_MAP_WRITE, FALSE, g_szShareName);
        if (hFileMapT <> 0) then
        begin
          lpView := MapViewOfFile(hFileMapT, FILE_MAP_READ or FILE_MAP_WRITE, 0, 0, 0);
          
          if (lpView <> nil) then
          begin
            Edit_SetText(GetDlgItem(hWnd, IDC_DATA), lpView);
            UnmapViewOfFile(lpView);
          end else
            chMB('Can''t map view', g_szModName);
            
          CloseHandle(hFileMapT);
        end else
          chMB('Can''t open mapping', g_szModName);
      end;

    IDCANCEL: // 退出
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
  DialogBox(HInstance, MakeIntResource(IDD_MMFSHARE), 0, @Dlg_Proc);
end.
