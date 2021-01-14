program  TestMci;

{$R TestMci.Res}

uses
  Windows, Messages, MMSystem;       

const
  ID_TIMER  = 1;
  szAppName = 'TestMci';
  IDC_MAIN_EDIT         = 1000;
  IDC_NOTIFY_MESSAGE    = 1005;
  IDC_NOTIFY_ID         = 1006;
  IDC_NOTIFY_SUCCESSFUL = 1007;
  IDC_NOTIFY_SUPERSEDED = 1008;
  IDC_NOTIFY_ABORTED    = 1009;
  IDC_NOTIFY_FAILURE    = 1010;
  IDC_SIGNAL_MESSAGE    = 1011;
  IDC_SIGNAL_ID         = 1012;
  IDC_SIGNAL_PARAM      = 1013;
  IDC_RETURN_STRING     = 1014;
  IDC_ERROR_STRING      = 1015;
  IDC_DEVICES           = 1016;
  IDC_STATIC            = -1;

  // 对话框回调
function DlgProc(hDlg: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
const
{$J+}
  hWndEdit: LongWord = 0; // HWND
{$J-}
var
  iCharBeg, iCharEnd, iLineBeg, iLineEnd, iChar, iLine, iLength: Integer;
  Error: MCIERROR;
  Rect: TRect;
  szCommand: array[0..1024] of Char;
  szReturn: array[0..1024] of Char;
  szError: array[0..1024] of Char;
  szBuffer: array[0..32] of Char; 
begin
  Result := FALSE;
  case (Msg) of
    WM_INITDIALOG:
      begin
       // 窗口居中
        GetWindowRect(hDlg, Rect);
        SetWindowPos(hDlg, 0,
          (GetSystemMetrics(SM_CXSCREEN) - Rect.Right + Rect.Left) div 2,
          (GetSystemMetrics(SM_CYSCREEN) - Rect.Bottom + Rect.Top) div 2,
          0, 0, SWP_NOZORDER or SWP_NOSIZE);
       // Edit句柄
        hWndEdit := GetDlgItem(hDlg, IDC_MAIN_EDIT);
        SetFocus(hWndEdit);
      end;

     WM_COMMAND:
       begin
         case LOWORD(wParam) of
           IDOK:
             begin
              // 选中范围
               SendMessage(hWndEdit, EM_GETSEL, Integer(@iCharBeg), Integer(@iCharEnd)); // 始末
               iLineBeg := SendMessage(hWndEdit, EM_LINEFROMCHAR, iCharBeg, 0); // 起始行
               iLineEnd := SendMessage(hWndEdit, EM_LINEFROMCHAR, iCharEnd, 0); // 末尾行
              // 处理各行
               for iLine := iLineBeg to iLineEnd do
               begin
                // 取当前行
                 PWORD(@szCommand[0])^ := SizeOf(szCommand);
                 iLength := SendMessage(hWndEdit, EM_GETLINE, iLine, Integer(@szCommand[0]));
                 szCommand[iLength] := #0;
                 if (iLength = 0) then Continue;                 
                // 发送命令
                 Error := mciSendString(szCommand, szReturn,  SizeOf(szReturn), hDlg);
                // 取返回串
                 SetDlgItemText(hDlg, IDC_RETURN_STRING, szReturn);
                // 取错误串
                 mciGetErrorString(Error, szError, SizeOf(szError));
                 SetDlgItemText(hDlg, IDC_ERROR_STRING, szError);
               end;     
              // 移动插入符号到选中文本尾部并插入回车
               iChar := SendMessage(hWndEdit, EM_LINEINDEX,  iLineEnd, 0);
               Inc(iChar, SendMessage(hWndEdit, EM_LINELENGTH, iCharEnd, 0));
               SendMessage(hWndEdit, EM_SETSEL, iChar, iChar);
               SendMessage(hWndEdit, EM_REPLACESEL, 0, Integer(PChar(#13#10)));
               SetFocus(hWndEdit);

               Result := TRUE;
             end;

           IDCANCEL:
             begin
               EndDialog(hDlg, 0);
               Result := TRUE;
             end;

           IDC_MAIN_EDIT:
             begin
               if (HIWORD(wParam) = EN_ERRSPACE) then
               begin
                 MessageBox(hDlg, 'Error control out of space.',
                   szAppName, MB_OK or MB_ICONINFORMATION);
                 Result := TRUE;
               end
             end;
         end; // END: case LOWORD(wParam) of
       end;

     MM_MCINOTIFY:
       begin
         EnableWindow(GetDlgItem(hDlg, IDC_NOTIFY_MESSAGE), TRUE);

         wvsprintf(szBuffer, 'Device ID = %i', @lParam);
         SetDlgItemText(hDlg, IDC_NOTIFY_ID, szBuffer);

         EnableWindow(GetDlgItem(hDlg, IDC_NOTIFY_ID), TRUE);
         EnableWindow(GetDlgItem(hDlg, IDC_NOTIFY_SUCCESSFUL),
           (wParam and MCI_NOTIFY_SUCCESSFUL) <> 0);
         EnableWindow(GetDlgItem(hDlg, IDC_NOTIFY_SUPERSEDED),
           (wParam and MCI_NOTIFY_SUPERSEDED) <> 0);
         EnableWindow(GetDlgItem(hDlg, IDC_NOTIFY_ABORTED),
           (wParam and MCI_NOTIFY_ABORTED) <> 0);
         EnableWindow(GetDlgItem(hDlg, IDC_NOTIFY_FAILURE),
           (wParam and MCI_NOTIFY_FAILURE) <> 0);

         SetTimer(hDlg, ID_TIMER, 5000, nil);

         Result := TRUE;
       end;

     WM_TIMER:
       begin
         KillTimer(hDlg, ID_TIMER);

         EnableWindow(GetDlgItem(hDlg, IDC_NOTIFY_MESSAGE), FALSE);
         EnableWindow(GetDlgItem(hDlg, IDC_NOTIFY_ID), FALSE);
         EnableWindow(GetDlgItem(hDlg, IDC_NOTIFY_SUCCESSFUL), FALSE);
         EnableWindow(GetDlgItem(hDlg, IDC_NOTIFY_SUPERSEDED), FALSE);
         EnableWindow(GetDlgItem(hDlg, IDC_NOTIFY_ABORTED), FALSE);
         EnableWindow(GetDlgItem(hDlg, IDC_NOTIFY_FAILURE), FALSE);

         Result := TRUE;
       end;

     WM_SYSCOMMAND:
       begin
         case LOWORD(wParam) of
           SC_CLOSE:
             begin
               EndDialog(hDlg, 0);
               Result := TRUE;
             end;
         end;
       end;
  end;
end;

begin
  if (DialogBox(hInstance, szAppName, 0, @DlgProc) = -1) then
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
end.

