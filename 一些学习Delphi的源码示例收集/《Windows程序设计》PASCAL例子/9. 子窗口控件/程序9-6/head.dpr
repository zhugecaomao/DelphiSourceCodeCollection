program  head;

uses
  Windows, Messages;

var
  szFile: array[0..MAX_PATH] of Char; // 当前选中文件
  OldList: Pointer; // 标准列表框消息处理过程

   // 列表框消息处理过程
function ListProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
begin
  if (Msg = WM_KEYDOWN) and (wParam = VK_RETURN) then // 按回车等于双击
    SendMessage(GetParent(hWnd), WM_COMMAND, MAKELONG(1, LBN_DBLCLK), hWnd);
  Result := CallWindowProc(OldList, hWnd, Msg, wParam, lParam); // 默认处理
end;

   // 主窗体消息处理过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  ID_LIST = 1;
  ID_TEXT = 2;
  DTFLAGS = (DT_WORDBREAK or DT_EXPANDTABS or DT_NOCLIP or DT_NOPREFIX); // 绘制标识
  DIRATTR = (DDL_READWRITE or DDL_READONLY or DDL_HIDDEN or DDL_SYSTEM // 文件属性码
            or DDL_DIRECTORY or DDL_ARCHIVE or DDL_DRIVES);
  MAXREAD = 8192; // 文件内容缓冲区尺寸           
{$J+}
  bValidFile: Boolean = FALSE; // 当前选中了有效文件
  hWndList: LongWord = 0; // ListBox 句柄
  hWndText: LongWord = 0; // Static 句柄
  Rect: TRect = (Left: 0; Top: 0; Right: 0; Bottom: 0); // 文件内容输出范围
{$J-}
var
  hWndDc: HDC;
  ps: PAINTSTRUCT;
  J, cxChar, cyChar: Integer;
  szBuffer: array[0..MAX_PATH] of Char;         
  hFile: THANDLE;
  buffer: array[0..MAXREAD] of Byte; // 文件内容
begin
  Result := 0;
 // 区分不同的消息
  case Msg of
    WM_CREATE:
      begin
        cxChar := LOWORD(GetDialogBaseUnits());
        cyChar := HIWORD(GetDialogBaseUnits());
        Rect.Left := 20 * cxChar;
        Rect.Top := 3 * cyChar;

        hWndList := CreateWindow('listbox', nil,
                          WS_CHILDWINDOW or WS_VISIBLE or LBS_STANDARD,
                          cxChar, cyChar * 3,
                          cxChar * 15 + GetSystemMetrics(SM_CXVSCROLL),
                          cyChar * 20,
                          hWnd, ID_LIST,
                          GetWindowLong(hWnd, GWL_HINSTANCE),
                          nil);
        SendMessage(hWndList, LB_DIR, DIRATTR, Integer(PChar('*.*'))); // 列举
        OldList := Pointer(SetWindowLong(hWndList, GWL_WNDPROC, Integer(@ListProc)));

        GetCurrentDirectory(MAX_PATH + 1, szBuffer); // 当前路径
        hWndText := CreateWindow('static', szBuffer,
                          WS_CHILDWINDOW or WS_VISIBLE or SS_LEFT,
                          cxChar, cyChar, cxChar * MAX_PATH, cyChar,
                          hWnd, ID_TEXT,
                          GetWindowLong(hWnd, GWL_HINSTANCE),
                          nil);
      end;

    WM_SIZE:
      begin
        Rect.Right := LOWORD(lParam);
        Rect.Bottom := HIWORD(lParam);
      end;

    WM_SETFOCUS:
      begin
        SetFocus(hWndList);
      end;

    WM_COMMAND:           // ListBox                     // 双击鼠标
      if (LOWORD(wParam) = ID_LIST) and (HIWORD(wParam) = LBN_DBLCLK) then
      begin
        J := SendMessage(hWndList, LB_GETCURSEL, 0, 0); // 当前选中项目
        if (J = LB_ERR) then Exit;
        
        SendMessage(hWndList, LB_GETTEXT, J, Integer(@szBuffer[0])); // 取出选项
        hFile := CreateFile(szBuffer, GENERIC_READ, FILE_SHARE_READ, // 打开文件
                          nil, OPEN_EXISTING, 0, 0);
        if (INVALID_HANDLE_VALUE <> hFile) then
        begin
          CloseHandle(hFile); // 关闭文件
          
          bValidFile := TRUE; // 选中了有效文件
          lstrcpy(szFile, szBuffer); // 复制文件名字符串

          GetCurrentDirectory(MAX_PATH + 1, szBuffer); // 当前路径
          if (szBuffer[lstrlen(szBuffer) - 1] <> '\') then  // '\' 结尾
            lstrcat(szBuffer, '\');

          SetWindowText(hWndText, lstrcat(szBuffer, szFile)); // 路径+文件名
        end else
        begin
          bValidFile := FALSE; // 未选中有效文件
          szBuffer[lstrlen(szBuffer) - 1] := #0; // 截去最后一个字符']'

          if not SetCurrentDirectory(szBuffer + 1) then // 盘符(有'-')
          begin
           // '[-x-]' --> '[-x:'
            szBuffer[3] := ':';
            szBuffer[4] := #0;
           // 参数为 'x:' 
            SetCurrentDirectory(szBuffer + 2);
          end;
          
          GetCurrentDirectory(MAX_PATH + 1, szBuffer); // 当前目录
          SetWindowText(hWndText, szBuffer);
          
          SendMessage(hWndList, LB_RESETCONTENT, 0, 0); // 清空
          SendMessage(hWndList, LB_DIR, DIRATTR, Integer(PChar('*.*'))); // 列举
        end;
        InvalidateRect(hWnd, nil, TRUE); // 刷新(产生WM_PAINT)
      end;

    WM_PAINT:
      begin
        if (not bValidFile) then // 未选中有效文件
        begin
          Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 只填充背景
          Exit;
        end;
        hFile := CreateFile(szFile, GENERIC_READ, FILE_SHARE_READ,
                         nil, OPEN_EXISTING, 0, 0);
        if (INVALID_HANDLE_VALUE = hFile) then // 文件打开失败
        begin
          Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 只填充背景
          bValidFile := FALSE;    Exit;
        end;
        ReadFile(hFile, buffer, MAXREAD, DWORD(J), nil); // 读入文件
        CloseHandle(hFile); // 关闭文件

        hWndDc := BeginPaint(hWnd, ps);
        SelectObject(hWndDc, GetStockObject(SYSTEM_FIXED_FONT));
        SetTextColor(hWndDc, GetSysColor(COLOR_BTNTEXT));
        SetBkColor(hWndDc, GetSysColor(COLOR_BTNFACE));
        DrawTextA(hWndDc, @buffer[0], DWORD(J), Rect, DTFLAGS);         
        EndPaint(hWnd, ps);
      end;


    WM_DESTROY:
      PostQuitMessage(0); // 放一个退出消息WM_QUIT

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end; 

  
const
  szAppName = 'head';

var
  hWnd: LongWord;
  Msg: TMsg;
  WndClass: TWndClass;
  
begin
 // 填充结构体
  WndClass.style := CS_HREDRAW or CS_VREDRAW;
  WndClass.lpfnWndProc := @WndProc;
  WndClass.cbClsExtra := 0;
  WndClass.cbWndExtra := 0;
  WndClass.hInstance := hInstance;
  WndClass.hIcon := LoadIcon(0, IDI_APPLICATION);
  WndClass.hCursor := LoadCursor(0, IDC_ARROW);
  WndClass.hbrBackground :=  COLOR_WINDOW + 1;
  WndClass.lpszMenuName := nil;
  WndClass.lpszClassName := szAppName;

 // 注册窗体类
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(szAppName, 'head',
                       WS_OVERLAPPEDWINDOW or WS_CLIPCHILDREN,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       0, 0, hInstance, nil);

 // 显示窗体
  ShowWindow(hWnd, CmdShow);
  UpdateWindow(hWnd);
    
 // 消息循环
  while GetMessage(Msg, 0, 0, 0) do
  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;

(*  注意,此程序遇到打开文件失败,一律当作目录or盘符处理 *)  
end.
