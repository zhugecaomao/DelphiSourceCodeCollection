program MMFShare;

{$R 'MMFShare.res' 'MMFShare.rc'}

uses Windows, Messages;

const
  IDD_MMFSHARE   = 1;
  IDI_MMFSHARE   = 102;
  IDC_DATA       = 100;
  IDC_CREATEFILE = 101;
  IDC_OPENFILE   = 102;
  IDC_CLOSEFILE  = 103;

  // WM_INITDIALOG 处理
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  SendMessage(hWnd, WM_SETICON, ICON_BIG, LoadIcon(HInstance, MakeIntResource(IDI_MMFSHARE)));
  SendMessage(hWnd, WM_SETICON, ICON_SMALL, LoadIcon(HInstance, MakeIntResource(IDI_MMFSHARE)));

  SetWindowText(GetDlgItem(hWnd, IDC_DATA), 'Some test data');
  EnableWindow(GetDlgItem(hWnd, IDC_CLOSEFILE), FALSE);

  Result := TRUE;
end;

  // WM_COMMAND 处理
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
const {$J+}
  s_hFileMap: THandle = 0; {$J-}
var
  pView: Pointer;
  hFileMapT: THandle;
begin
  case (id) of
    IDCANCEL:
      begin
        EndDialog(hWnd, id);
      end;

    IDC_CREATEFILE:
      begin
        // 并非按钮单击通知
        if (codeNotify <> BN_CLICKED) then Exit;

        // 建立内存映射文件
        s_hFileMap := CreateFileMapping(INVALID_HANDLE_VALUE, nil, PAGE_READWRITE, 0, 4 * 1024, 'MMFSharedData');

        // 建立(或打开)成功
        if (s_hFileMap <> 0) then
        begin
          // 是否之前已存在
          if (GetLastError() = ERROR_ALREADY_EXISTS) then
          begin
            MessageBox(0, 'Mapping already exists - not created.', 'MMFShare', MB_OK);
            CloseHandle(s_hFileMap);
          end else
          begin
            // 建立成功 ^^

            // 映射至内存空间
            pView := MapViewOfFile(s_hFileMap, FILE_MAP_READ or FILE_MAP_WRITE, 0, 0, 0);
            
            if (pView <> nil) then
            begin
              // Edit -> MMF
              GetWindowText(GetDlgItem(hWnd, IDC_DATA), pView, 4 * 1024);

              // 取消内存映射
              UnmapViewOfFile(pView);

              // 不允许再建立
              EnableWindow(hWndCtl, FALSE);

              // 允许关闭文件
              EnableWindow(GetDlgItem(hWnd, IDC_CLOSEFILE), TRUE);
            end else
            begin
              MessageBox(0, 'Can'#39't map view of file.', 'MMFShare', MB_OK);
            end;
          end;
        end else
        begin
          MessageBox(0, 'Can'#39't create file mapping.', 'MMFShare', MB_OK);
        end;
      end;

    IDC_CLOSEFILE:
      begin
        // 并非按钮单击通知
        if (codeNotify <> BN_CLICKED) then Exit;

        // 关闭内存映射文件
        if CloseHandle(s_hFileMap) then
        begin
          EnableWindow(GetDlgItem(hWnd, IDC_CREATEFILE), TRUE);
          EnableWindow(hWndCtl, FALSE);
        end;
      end;

    IDC_OPENFILE:
      begin
        // 并非按钮单击通知
        if (codeNotify <> BN_CLICKED) then Exit;

        // 打开已存在的对象
        hFileMapT := OpenFileMapping(FILE_MAP_READ or FILE_MAP_WRITE, FALSE, 'MMFSharedData');

        if (hFileMapT <> 0) then
        begin
          // 映射至内存空间
          pView := MapViewOfFile(hFileMapT, FILE_MAP_READ or FILE_MAP_WRITE, 0, 0, 0);

          // 映射是否成功 ?
          if (pView <> nil) then
          begin
            // MMF -> Edit
            SetWindowText(GetDlgItem(hWnd, IDC_DATA), pView);

            // 取消内存映射
            UnmapViewOfFile(pView);
          end else
          begin
            MessageBox(0, 'Can'#39't map view.', 'MMFShare', MB_OK);
          end;

          CloseHandle(hFileMapT);
        end else
        begin
          MessageBox(0, 'Can'#39't open mapping.', 'MMFShare', MB_OK);
        end;
      end;
  end; // END case of
end;

  // 对话框消息回调
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  Result := FALSE;

  case (uMsg) of
    WM_INITDIALOG:
      Result := SetWindowLong(hWnd,
        DWL_MSGRESULT, Longint(Dlg_OnInitDialog(hWnd, wParam, lParam))) <> 0;

    WM_COMMAND:
      Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));
  end;
end;

  // 程序主线程入口
begin
  DialogBox(HInstance, MakeIntResource(IDD_MMFSHARE), 0, @Dlg_Proc);
end.
