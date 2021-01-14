program  About1;

{$R  About1.res}

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
        IDOK, IDCANCEL:
          begin
            EndDialog(hDlg, 0);
            Result := TRUE;
          end;
      end;
  end;
end;

   // 主窗体消息处理过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  IDM_APP_ABOUT = 40001;
begin
  Result := 0;
  case Msg of
//  WM_CREATE:
//    hInstance = ((LPCREATESTRUCT) lParam)->hInstance ;
//  注: SysInit.hInstance已事先被初始化为本模块句柄

    WM_COMMAND:
      if (LOWORD(wParam) = IDM_APP_ABOUT) then
        DialogBox(hInstance, 'AboutBox', hWnd, @AboutDlgProc)
      else
        Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理

    WM_DESTROY:
      PostQuitMessage(0); // 退出循环

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end;      

const
  szAppName = 'About1';
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
