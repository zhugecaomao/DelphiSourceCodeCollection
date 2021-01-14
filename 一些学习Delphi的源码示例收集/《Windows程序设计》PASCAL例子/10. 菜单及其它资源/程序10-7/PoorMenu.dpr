program  PoorMenu;

uses
  Windows, Messages;

const
  szAppName = 'PoorMenu';
  IDM_SYS_ABOUT = 1;
  IDM_SYS_HELP = 2;
  IDM_SYS_REMOVE = 3; 

   // 窗体消息处理过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
begin
  Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理;
  if (Msg = WM_SYSCOMMAND) then
  begin
    case LOWORD(wParam) of
      IDM_SYS_ABOUT:
        MessageBox(hWnd, 'A Poor-Person'#$27's Menu Program'#13#10'(c) Charles Petzold, 1998',
                 szAppName, MB_OK or MB_ICONINFORMATION);

      IDM_SYS_HELP:
        MessageBox(hWnd, 'Help not yet implemented!',
                szAppName, MB_OK or MB_ICONEXCLAMATION);

      IDM_SYS_REMOVE:
        GetSystemMenu(hWnd, TRUE);  
    end;
  end else
    if (Msg = WM_DESTROY) then PostQuitMessage(0); // 放一个退出消息WM_QUIT           
end;     


var
  Msg: TMsg;
  hWnd, hMenu: LongWord;
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
  WndClass.hbrBackground := GetStockObject(WHITE_BRUSH);
  WndClass.lpszMenuName := nil;
  WndClass.lpszClassName := szAppName;

 // 注册窗体类
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(szAppName, 'The Poor-Person'#$27's Menu',
                       WS_OVERLAPPEDWINDOW,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       0, 0, hInstance, nil);

 // 添加菜单项
  hMenu := GetSystemMenu(hWnd, FALSE);
  AppendMenu(hMenu, MF_SEPARATOR, 0, nil);
  AppendMenu(hMenu, MF_STRING, IDM_SYS_ABOUT, 'About...');
  AppendMenu(hMenu, MF_STRING, IDM_SYS_HELP, 'Help...');
  AppendMenu(hMenu, MF_STRING, IDM_SYS_REMOVE, 'Remove Additions');

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
