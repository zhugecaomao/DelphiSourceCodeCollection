program  Beeper1;

uses
  Windows, Messages;

  // 窗体消息处理过程   
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  ID_TIMER = 1; // 计时器ID
  {$J+}
  fFlipFlop: Boolean = FALSE;
  {$J-}
var
  hWndDc: HDC;
  Rect: TRect;
  PS: TPaintStruct;
  hBrush: DWORD;
begin
  Result := 0;
 // 区分不同的消息 
  case Msg of
    WM_CREATE   :  SetTimer(hWnd, ID_TIMER, 1000, nil); // 安装时钟

    WM_TIMER    :  begin
                     MessageBeep($80000000); // 响铃
                     fFlipFlop := not fFlipFlop; // 颜色标志取反
                     InvalidateRect(hWnd, nil, FALSE); // 刷新
                   end;

    WM_PAINT    :  begin
                     hWndDc := BeginPaint(hWnd, PS);

                     GetClientRect(hWnd, Rect); // 窗体客户区尺寸
                     if fFlipFlop then
                       hBrush := CreateSolidBrush(RGB(255,0,0)) // 红色
                     else
                       hBrush := CreateSolidBrush(RGB(0,0,255)); // 蓝色
                     FillRect(hWndDc, Rect, hBrush); // 填充
                     DeleteObject(hBrush); // 删除画刷对象

                     EndPaint(hWnd, PS);
                   end;
                   
    WM_DESTROY  :  begin
                     PostQuitMessage(0); // 放置WM_QUIT导致GetMessage返回FALSE
                     KillTimer(hWnd, ID_TIMER); // 删除定时器
                   end;

    else Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
  end;
end;

const
  AppName = 'Beeper1';
  
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
  WndClass.hbrBackground := GetStockObject(WHITE_BRUSH);
  WndClass.lpszMenuName := nil;
  WndClass.lpszClassName := AppName;

 // 注册窗体类
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'Program requires Windows NT!', AppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(AppName, 'Beeper1 Timer Demo',
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
