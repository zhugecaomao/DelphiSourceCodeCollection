program  About3;

{$R  About3.res}

uses
  Windows, Messages;  

  // 对话框消息接收过程
function AboutDlgProc(hDlg: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  Result := FALSE;
  case Msg of
    WM_INITDIALOG:
      Result := TRUE;

    WM_COMMAND:
      case LOWORD(wParam) of
        IDOK:
          begin
            EndDialog(hDlg, 0);
            Result := TRUE;
          end;
      end;
  end;
end;

   // 控件消息处理过程
function EllipPushWndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  szText: array[0..40] of Char;
  hBrush, hWndDc: LongWord;
  ps: TPaintStruct;
  Rect: TRect;
begin
  Result := 0;
  case Msg of
    WM_PAINT:
      begin
        GetClientRect(hWnd, Rect);
        GetWindowText(hWnd, szText, 40);
        hWndDc := BeginPaint(hWnd, ps);
        hBrush := CreateSolidBrush(GetSysColor(COLOR_WINDOW));
        hBrush := SelectObject(hWndDc, hBrush);
        SetBkColor(hWndDc, GetSysColor(COLOR_WINDOW));
        SetTextColor(hWndDc, GetSysColor(COLOR_WINDOWTEXT));
        Ellipse(hWndDc, Rect.Left, Rect.Top, Rect.Right, Rect.Bottom);
        DrawText(hWndDc, szText, -1, Rect, DT_SINGLELINE or DT_CENTER or DT_VCENTER);
        DeleteObject(SelectObject(hWndDc, hBrush));
        EndPaint(hWnd, ps);
      end;

    WM_KEYUP:
      begin
        if (wParam = VK_SPACE) then
          SendMessage(GetParent(hWnd), WM_COMMAND, GetWindowLong(hWnd, GWL_ID), hWnd)
        else
          Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
      end;

    WM_LBUTTONUP:
      begin
        SendMessage(GetParent(hWnd), WM_COMMAND, GetWindowLong(hWnd, GWL_ID), hWnd);
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end;

   // 窗体消息处理过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  IDM_APP_ABOUT = 40001;
begin
  Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  case Msg of
    WM_COMMAND:
      if (LOWORD(wParam) = IDM_APP_ABOUT) then
        DialogBox(hInstance, 'AboutBox', hWnd, @AboutDlgProc);

    WM_DESTROY:
      PostQuitMessage(0); // 退出消息循环
  end;
end;      

const
  szAppName = 'About3';
var
  Msg: TMsg;
  hWnd: LongWord;
  WndClass: TWndClass;          
begin
 // 注册窗体类
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
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 注册控件类 
  WndClass.lpfnWndProc := @EllipPushWndProc;
  WndClass.hIcon := 0;
  WndClass.hCursor := LoadCursor(0, IDC_ARROW);
  WndClass.hbrBackground := COLOR_BTNFACE + 1;
  WndClass.lpszMenuName := nil;
  WndClass.lpszClassName := 'EllipPush';
  RegisterClass(WndClass);

 // 建立窗体
  hWnd := CreateWindow(szAppName, 'About Box Demo Program',
                       WS_OVERLAPPEDWINDOW,
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
end.
