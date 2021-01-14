program ErrorShow;

{$R 'ErrorShow.res' 'ErrorShow.rc'}

uses
  Windows, Messages;

const
  g_szAppName = 'Error Show';
  ESM_POKECODEANDLOOKUP = WM_USER + 100; // 自定义消息(用于提交错误代码)
  IDD_ERRORSHOW = 101;  // 对话框模板资源ID
  IDI_ERRORSHOW = 102;  // 图标资源ID(此处作对话框图标)
  IDC_ERRORCODE = 1000; // 对话框子控件ID..
  IDC_ERRORTEXT = 1001;
  IDC_ALWAYSONTOP = 1002;

  // 对话框WM_INITDIALOG消息处理
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  // 设置图标
  SendMessage(hWnd, WM_SETICON, ICON_BIG, LoadIcon(HInstance, MakeIntResource(IDI_ERRORSHOW)));
  SendMessage(hWnd, WM_SETICON, ICON_SMALL, LoadIcon(HInstance, MakeIntResource(IDI_ERRORSHOW)));

  // 限制长度
  SendMessage(GetDlgItem(hWnd, IDC_ERRORCODE), EM_LIMITTEXT, 5, 0);

  // 处理参数
  SendMessage(hWnd, ESM_POKECODEANDLOOKUP, lParam, 0);

  // 接受焦点
  Result := TRUE;
end;

  // 对话框WM_COMMAND消息处理
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
    // 此函数转换于C语言宏定义: #define MAKELANGID(p, s) ((((WORD) (s)) << 10) | (WORD) (p))
  function MakeLangID(p, s: Word): DWORD;
  begin
    Result := (s shl 10) or p;
  end;
var
  dwError: DWORD;
  hLocal: THandle; // HLOCAL
  fOk: DWORD; // BOOL
  hDll: HMODULE;
begin
  case (id) of // 子控件(或菜单项)ID
    IDCANCEL:
      begin
        EndDialog(hWnd, id);
      end;

    IDC_ALWAYSONTOP:
      begin
        if (IsDlgButtonChecked(hWnd, IDC_ALWAYSONTOP) = BST_CHECKED) then
          SetWindowPos(hWnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE)
        else
          SetWindowPos(hWnd, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
      end;

    IDC_ERRORCODE:
      begin
        EnableWindow(GetDlgItem(hWnd, IDOK), GetWindowTextLength(hWndCtl) > 0);
      end;

    IDOK:
      begin
        // 取出错误代码
        dwError := GetDlgItemInt(hWnd, IDC_ERRORCODE, PBOOL(nil)^, FALSE);

        // 错误文字内存(将由系统分配)
        hLocal := 0;

        // 取出错误文字
        fOk := FormatMessage(
          FORMAT_MESSAGE_FROM_SYSTEM or FORMAT_MESSAGE_ALLOCATE_BUFFER,
          nil, dwError, MakeLangID(LANG_CHINESE, SUBLANG_CHINESE_SIMPLIFIED),
          PChar(@hLocal), 0, nil);

        // 函数调用失败
        if (fOk = 0) then
        begin
          // 网络相关错误?
          hDll := LoadLibraryEx('NetMsg.dll', 0, DONT_RESOLVE_DLL_REFERENCES);
          if (hDll <> 0) then
          begin
            FormatMessage(
              FORMAT_MESSAGE_FROM_HMODULE or FORMAT_MESSAGE_FROM_SYSTEM,
              Pointer(hDll), dwError, MakeLangID(LANG_CHINESE, SUBLANG_CHINESE_SIMPLIFIED),
              PChar(@hLocal), 0, nil);
            FreeLibrary(hDll);
          end;
        end;

        // 正确分配内存
        if (hLocal <> 0) then
        begin
          SetDlgItemText(hWnd, IDC_ERRORTEXT, PChar(LocalLock(hLocal)));
          LocalFree(hLocal);
        end else
        begin
          SetDlgItemText(hWnd, IDC_ERRORTEXT, 'Error number not found.');
        end;
      end;
  end; // END: case (id) of
end;

  // 对话框消息处理回调
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM):BOOL; stdcall;
begin
  case (uMsg) of // 消息ID
    WM_INITDIALOG:
      begin
        Result := BOOL(SetWindowLong(hWnd, DWL_MSGRESULT, Longint(Dlg_OnInitDialog(hWnd, wParam, lParam))));
      end;

    WM_COMMAND:
      begin
        Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));
        Result := TRUE;
      end;

    ESM_POKECODEANDLOOKUP:
      begin
        SetDlgItemInt(hWnd, IDC_ERRORCODE, wParam, FALSE);
        PostMessage(hWnd, WM_COMMAND, MakeWParam(IDOK, BN_CLICKED), GetDlgItem(hWnd, IDOK));
        SetForegroundWindow(hWnd);
        Result := TRUE;
      end;

    else Result := FALSE;
  end;
end;

  // 字符串转整数
function StrToInt(const S: string): Integer;
var
  P: PByte;
begin
  Result := 0;
  P := @S[1];
  while (P^ <> $00) do
  begin
    if (P^ > $39) or (P^ < $30) then
    begin
      Result := 0;
      Exit;
    end else
    begin
      Result := Result * 10 + (P^ - $30);
      Inc(P);
    end;
  end;
end;

  // 程序入口
var
  hWnd: LongWord; // HWND
begin
  // 如果已存在程序实例, 向其提交新的错误代码, 否则建立模态对话框
  hWnd := FindWindow('#32770', 'Error Show');
  if (IsWindow(hWnd) = FALSE) then
    DialogBoxParam(HInstance, MakeIntResource(IDD_ERRORSHOW), 0, @Dlg_Proc, StrToInt(Paramstr(1)))
  else
    SendMessage(hWnd, ESM_POKECODEANDLOOKUP, StrToInt(Paramstr(1)), 0);
end.



