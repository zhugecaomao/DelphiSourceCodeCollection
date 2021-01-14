program  BitBlt;

uses
  Windows, Messages;

   // 窗体消息处理过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  cxClient: Integer = 0;
  cyClient: Integer = 0;
  cxSource: Integer = 0;
  cySource: Integer = 0;
{$J-}  
var
  hdcClient, hdcWindow: HDC;
  x, y: Integer;
  ps: TPaintStruct;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      begin 
        cxSource := GetSystemMetrics(SM_CXSIZEFRAME) + GetSystemMetrics(SM_CXSIZE);
        cySource := GetSystemMetrics(SM_CYSIZEFRAME) + GetSystemMetrics(SM_CYCAPTION);
      end;

    WM_SIZE:
      begin
        cxClient := LOWORD(lParam);
        cyClient := HIWORD(lParam);
      end;

    WM_PAINT:
      begin
        hdcClient := BeginPaint(hWnd, ps);
        hdcWindow := GetWindowDC(hWnd);
        y := 0;
        while (y < cyClient) do
        begin
          x := 0;
          while (x < cxClient) do
          begin
            Windows.BitBlt(hdcClient, x, y, cxSource, cySource, hdcWindow, 0, 0, SRCCOPY);
            Inc(x, cxSource);
          end;
          Inc(y, cySource);
        end;
        ReleaseDC(hWnd, hdcWindow);
        EndPaint(hWnd, ps);
      end;   

    WM_DESTROY:
      PostQuitMessage(0); // 放一个退出消息WM_QUIT

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end;    
  
const
  szAppName = 'BitBlt';
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
  WndClass.hIcon := LoadIcon(0, IDI_INFORMATION);
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
  hWnd := CreateWindow(szAppName, 'BitBlt Demo',
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
