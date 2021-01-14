program  PopPad2;

{$R  PopPad2.res}

uses
  Windows, Messages;

const
  szAppName = 'PopPad2';   

   // 窗体消息处理过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
     // 关闭确认子函数 ..
  function AskConfirmation(hWnd: LongWord): Integer;
  begin
    Result := MessageBox(hWnd, 'Really want to close PopPad2?',
                       szAppName, MB_YESNO or MB_ICONQUESTION);
  end;
const
  ID_EDIT = 1; // 控件ID
  IDM_FILE_NEW   = 40001; // 命令ID ..
  IDM_FILE_OPEN  = 40002;
  IDM_FILE_SAVE  = 40003;
  IDM_FILE_SAVE_AS = 40004;
  IDM_FILE_PRINT = 40005;
  IDM_APP_EXIT   = 40006;
  IDM_EDIT_UNDO  = 40007;
  IDM_EDIT_CUT   = 40008;
  IDM_EDIT_COPY  = 40009;
  IDM_EDIT_PASTE = 40010;
  IDM_EDIT_CLEAR = 40011;
  IDM_EDIT_SELECT_ALL = 40012;
  IDM_HELP_HELP = 40013;
  IDM_APP_ABOUT = 40014;
{$J+}
  hWndEdit: LongWord = 0; // 编辑方块控件句柄
{$J-}
var
  iSelect, iEnable: Integer;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      hWndEdit := CreateWindow('edit', nil, // 建立编辑方块控件
                    WS_CHILD or WS_VISIBLE or WS_HSCROLL or WS_VSCROLL or WS_BORDER
                    or ES_LEFT or ES_MULTILINE or ES_AUTOHSCROLL or ES_AUTOVSCROLL,
                    0, 0, 0, 0, hWnd, ID_EDIT, PCreateStruct(lParam).hInstance, nil);

    WM_SETFOCUS:
      SetFocus(hWndEdit); // 焦点始终在编辑方块中

    WM_SIZE:
      MoveWindow(hWndEdit, 0, 0, LOWORD(lParam), HIWORD(lParam), TRUE); // 调整编辑方块尺寸

    WM_INITMENUPOPUP:
      if (lParam = 1) then // LOWORD(lParam)=1 and HIWORD(lParam)=0 , Edit菜单
      begin
        if SendMessage(hWndEdit, EM_CANUNDO, 0, 0) <> 0 then // 可以撤销
          EnableMenuItem(wParam, IDM_EDIT_UNDO, MF_ENABLED)
        else
          EnableMenuItem(wParam, IDM_EDIT_UNDO, MF_GRAYED);

        if IsClipboardFormatAvailable(CF_TEXT) then // 剪贴板中含有文字
          EnableMenuItem(wParam, IDM_EDIT_PASTE, MF_ENABLED)
        else
          EnableMenuItem(wParam, IDM_EDIT_PASTE, MF_GRAYED);

        iSelect := SendMessage(hWndEdit, EM_GETSEL, 0, 0);
        if (HIWORD(iSelect) = LOWORD(iSelect)) then // 开始与结束相同
          iEnable := MF_GRAYED
        else
          iEnable := MF_ENABLED; 
        EnableMenuItem(wParam, IDM_EDIT_CUT, iEnable);
        EnableMenuItem(wParam, IDM_EDIT_COPY, iEnable);
        EnableMenuItem(wParam, IDM_EDIT_CLEAR, iEnable);
      end else
       Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理

    WM_COMMAND:
      if (lParam <> 0) then // 编辑方块控件(句柄肯定不为0)
      begin
        if (LOWORD(lParam) = ID_EDIT) and
           ((HIWORD(wParam) = EN_ERRSPACE) or (HIWORD(wParam) = EN_MAXTEXT)) then
          MessageBox(hWnd, 'Edit control out of space.', szAppName, MB_OK or MB_ICONSTOP)
        else
          Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理 
      end else
      begin
        case LOWORD(wParam) of // 菜单(或快捷键)消息
          IDM_FILE_NEW,
          IDM_FILE_OPEN,
          IDM_FILE_SAVE,
          IDM_FILE_SAVE_AS,
          IDM_FILE_PRINT:
            MessageBeep(0);

          IDM_APP_EXIT:
            SendMessage(hWnd, WM_CLOSE, 0, 0);

          IDM_EDIT_UNDO:
            SendMessage(hWndEdit, WM_UNDO, 0, 0);

          IDM_EDIT_CUT:
            SendMessage(hWndEdit, WM_CUT, 0, 0);

          IDM_EDIT_COPY:
            SendMessage(hWndEdit, WM_COPY, 0, 0);

          IDM_EDIT_PASTE:
            SendMessage(hWndEdit, WM_PASTE, 0, 0);

          IDM_EDIT_CLEAR:
            SendMessage(hWndEdit, WM_CLEAR, 0, 0);

          IDM_EDIT_SELECT_ALL:
            SendMessage(hWndEdit, EM_SETSEL, 0, -1);

          IDM_HELP_HELP:
            MessageBox(hWnd, 'Help not yet implemented!',
                     szAppName, MB_OK or MB_ICONEXCLAMATION);

          IDM_APP_ABOUT:
            MessageBox(hWnd, 'POPPAD2 (c) Charles Petzold, 1998',
                     szAppName, MB_OK or MB_ICONINFORMATION);

          else
            Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
        end;         
      end;

    WM_CLOSE:
      if (IDYES = AskConfirmation(hWnd)) then DestroyWindow(hWnd); // 程序关闭确认

    WM_QUERYENDSESSION:
      if (IDYES = AskConfirmation(hWnd)) then Result := 1 else Result := 0; // 系统关闭

    WM_DESTROY:
      PostQuitMessage(0); // 退出循环

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end;

var
  Msg: TMsg;
  hWnd, hAccel: LongWord;
  WndClass: TWndClass;          
begin
 // 填充结构体
  WndClass.style := CS_HREDRAW or CS_VREDRAW;
  WndClass.lpfnWndProc := @WndProc;
  WndClass.cbClsExtra := 0;
  WndClass.cbWndExtra := 0;
  WndClass.hInstance := hInstance;
  WndClass.hIcon := LoadIcon(hInstance, szAppName);
  WndClass.hCursor := LoadCursor(0, IDC_ARROW);
  WndClass.hbrBackground := GetStockObject(WHITE_BRUSH);
  WndClass.lpszMenuName := szAppName;
  WndClass.lpszClassName := szAppName;

 // 注册窗体类
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(szAppName, szAppName,
                       WS_OVERLAPPEDWINDOW,
                       GetSystemMetrics(SM_CXSCREEN) div 4,
                       GetSystemMetrics(SM_CYSCREEN) div 4,
                       GetSystemMetrics(SM_CXSCREEN) div 2,
                       GetSystemMetrics(SM_CYSCREEN) div 2,
                       0, 0, hInstance, nil);

 // 显示窗体
  ShowWindow(hWnd, CmdShow);
  UpdateWindow(hWnd);

 // 载入快捷键列表
  hAccel := LoadAccelerators(hInstance, szAppName);

 // 消息循环
  while GetMessage(Msg, 0, 0, 0) do
  begin
    if (TranslateAccelerator(hWnd, hAccel, Msg) = 0) then
    begin
      TranslateMessage(Msg);
      DispatchMessage(Msg);
    end;
  end;

(* 注意: "如果快捷键与一个菜单项对应，那么窗口消息处理程序还会收到 ..." *)
end.
