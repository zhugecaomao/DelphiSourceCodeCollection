program  Bricks1;

{$R  Bricks1.res}

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
  hBitmap: Integer = 0;
{$J-}
var
  bitmap: TBitmap;
  hdcWnd, hdcMem: HDC;
  x, y: Integer;
  ps: TPaintStruct;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      begin
        hBitmap := LoadBitmap(hInstance, 'Bricks');
        GetObject(hBitmap, SizeOf(TBitmap), @bitmap);
        cxSource := bitmap.bmWidth;
        cySource := bitmap.bmHeight;
      end;

    WM_SIZE:
      begin
        cxClient := LOWORD(lParam);
        cyClient := HIWORD(lParam);
      end;

    WM_PAINT:
      begin
        hdcWnd := BeginPaint(hWnd, ps);
        hdcMem := CreateCompatibleDC(hdcWnd);
        SelectObject(hdcMem, hBitmap);
        y := 0;
        while (y < cyClient) do
        begin
          x := 0;
          while (x < cxClient) do
          begin
            BitBlt(hdcWnd, x, y, cxSource, cySource, hdcMem, 0, 0, SRCCOPY);
            Inc(x, cxSource);
          end;
          Inc(y, cySource);
        end;
        DeleteDC(hdcMem);
        EndPaint(hWnd, ps);
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0); // 放一个退出消息WM_QUIT
        DeleteObject(hBitmap);
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end;    
  
const
  szAppName = 'Bricks1';
var
  hWnd: LongWord;
  Msg: TMsg;
  WndClass: TWndClass;
begin
 // 注册窗体类
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
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(szAppName, 'LoadBitmap Demo',
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
