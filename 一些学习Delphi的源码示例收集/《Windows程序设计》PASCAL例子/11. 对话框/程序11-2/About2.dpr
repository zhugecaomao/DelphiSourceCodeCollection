program  About2;

{$R  About2.res}

uses
  Windows, Messages;

const
  IDC_BLACK     = 1000; // 控件ID ...
  IDC_BLUE      = 1001;
  IDC_GREEN     = 1002;
  IDC_CYAN      = 1003;
  IDC_RED       = 1004;
  IDC_MAGENTA   = 1005;
  IDC_YELLOW    = 1006;
  IDC_WHITE     = 1007;
  IDC_RECT      = 1008;
  IDC_ELLIPSE   = 1009;
  IDC_PAINT     = 1010;
  IDM_APP_ABOUT = 40001; // 菜单ID

var
  iCurrentColor: Integer = IDC_BLACK; // 当前图形颜色(主窗体)
  iCurrentFigure: Integer = IDC_RECT; // 当前图形形状(主窗体)

   // 填充图形        // 窗体     // 颜色  // 形状
procedure PaintWindow(hWnd: HWND; iColor, iFigure: Integer);
const
  crColor: array[0..7] of COLORREF = ( 0, $FF0000, $FF00, $FFFF00, $FF, $FF00FF, $FFFF, $FFFFFF); 
var
  hBrush, hWndDc: LongWord;
  Rect: TRect;
begin
  hWndDc := GetDC(hWnd);
  GetClientRect(hWnd, Rect);
  hBrush := CreateSolidBrush(crColor[iColor - IDC_BLACK]);
  hBrush := SelectObject(hWndDc, hBrush);
  if (iFigure = IDC_RECT) then
    Rectangle(hWndDc, Rect.Left, Rect.Top, Rect.Right, Rect.Bottom)
  else
    Ellipse(hWndDc, Rect.Left, Rect.Top, Rect.Right, Rect.Bottom);
  DeleteObject(SelectObject(hWndDc, hBrush));
  ReleaseDC(hWnd, hWndDc);
end;

  // 刷新背景并填充图形(此处用于Static)
procedure PaintTheBlock(hCtrl: HWND; iColor, iFigure: Integer);
begin
  InvalidateRect(hCtrl, nil, TRUE);
  UpdateWindow(hCtrl);
  PaintWindow(hCtrl, iColor, iFigure);
end;

  // 对话框消息接收过程
function AboutDlgProc(hDlg: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
const
{$J+}
  hCtrlBlock: LongWord = 0; // 绘制图形Static句柄
  iColor: Integer = 0;   // 当前图形颜色(Static)
  iFigure: Integer = 0;  // 当前图形形状(Static)
{$J-}
begin
  Result := FALSE;
  case Msg of
    WM_INITDIALOG: // 初始化 ..
      begin
        iColor := iCurrentColor;
        iFigure := iCurrentFigure;
        CheckRadioButton(hDlg, IDC_BLACK, IDC_WHITE, iColor);
        CheckRadioButton(hDlg, IDC_RECT, IDC_ELLIPSE, iFigure);
        hCtrlBlock := GetDlgItem(hDlg, IDC_PAINT);
        SetFocus(GetDlgItem(hDlg, iColor));
      end;

    WM_COMMAND: // 点击按钮 ..
      case LOWORD(wParam) of
        IDOK:
          begin
            iCurrentColor := iColor;
            iCurrentFigure := iFigure;
            EndDialog(hDlg, 1);
            Result := TRUE;
          end;

        IDCANCEL:
          begin
            EndDialog(hDlg, 0);
            Result := TRUE;
          end;

        IDC_BLACK,
        IDC_RED,
        IDC_GREEN,
        IDC_YELLOW,
        IDC_BLUE,
        IDC_MAGENTA,
        IDC_CYAN,
        IDC_WHITE:
          begin
            iColor := LOWORD(wParam); // 控件ID
            CheckRadioButton(hDlg, IDC_BLACK, IDC_WHITE, LOWORD(wParam));
            PaintTheBlock(hCtrlBlock, iColor, iFigure);
            Result := TRUE;
          end;

        IDC_RECT,
        IDC_ELLIPSE:
          begin
            iFigure := LOWORD(wParam); // 控件ID
            CheckRadioButton(hDlg, IDC_RECT, IDC_ELLIPSE, LOWORD (wParam));
            PaintTheBlock(hCtrlBlock, iColor, iFigure);
            Result := TRUE;
          end;
      end;

    WM_PAINT:
      PaintTheBlock(hCtrlBlock, iColor, iFigure);
  end;
end;

   // 主窗体消息处理过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  ps: PAINTSTRUCT;
begin
  Result := 0;
  case Msg of
    WM_COMMAND:
      case LOWORD(wParam) of
        IDM_APP_ABOUT:
          if (DialogBox(hInstance, 'AboutBox', hWnd, @AboutDlgProc) <> 0) then
            InvalidateRect(hWnd, nil, TRUE); // 选择了'OK'则更新
      end;

    WM_PAINT:
      begin
        BeginPaint(hWnd, ps); // 导致填充背景(白色)
        EndPaint(hWnd, ps);
        PaintWindow(hWnd, iCurrentColor, iCurrentFigure); // 绘制图形
      end;

    WM_DESTROY:
      PostQuitMessage(0); // 退出消息循环

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end;      

const
  szAppName = 'About2';
var
  Msg: TMsg;
  hWnd: LongWord;
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
