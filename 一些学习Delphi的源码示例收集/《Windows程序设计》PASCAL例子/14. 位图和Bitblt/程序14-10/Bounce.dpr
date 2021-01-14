program  Bounce;

uses
  Windows, Messages, Math;

   // 窗体消息处理函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  ID_TIMER = 1; // 定时器ID
{$J+}
  hBitmap: Integer = 0; // 位图句柄
  cxClient: Integer = 0;
  cyClient: Integer = 0;
  xCenter: Integer = 0;
  yCenter: Integer = 0;
  cxTotal: Integer = 0;
  cyTotal: Integer = 0;
  cxRadius: Integer = 0;
  cyRadius: Integer = 0;
  cxMove: Integer = 0;
  cyMove: Integer = 0;
  xPixel: Integer = 0;
  yPixel: Integer = 0;
{$J-}
var
  hBrush: LongWord; // 画刷句柄
  hdcWnd, hdcMem: HDC;
  iScale: Integer;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      begin
        hdcWnd := GetDC(hWnd);
        xPixel := GetDeviceCaps(hdcWnd, ASPECTX);
        yPixel := GetDeviceCaps(hdcWnd, ASPECTY);
        ReleaseDC(hWnd, hdcWnd);
        SetTimer(hWnd, ID_TIMER, 50, nil);
      end;

    WM_SIZE:
      begin
        cxClient := LOWORD(lParam);
        cyClient := HIWORD(lParam);
        xCenter := cxClient div 2;
        yCenter := cyClient div 2;
        iScale := Min(cxClient * xPixel, cyClient * yPixel) div 16;
        cxRadius := iScale div xPixel;
        cyRadius := iScale div yPixel;
        cxMove := Max(1, cxRadius div 2);
        cyMove := Max(1, cyRadius div 2);
        cxTotal := 2 * (cxRadius + cxMove);
        cyTotal := 2 * (cyRadius + cyMove);
        if (hBitmap <> 0) then DeleteObject(hBitmap);
        hdcWnd := GetDC(hWnd);
        hdcMem := CreateCompatibleDC(hdcWnd);
        hBitmap := CreateCompatibleBitmap(hdcWnd, cxTotal, cyTotal);
        ReleaseDC(hWnd, hdcWnd);
        SelectObject(hdcMem, hBitmap);
        Rectangle(hdcMem, -1, -1, cxTotal + 1, cyTotal + 1);
        hBrush := CreateHatchBrush(HS_DIAGCROSS, 0);
        SelectObject(hdcMem, hBrush);
        SetBkColor(hdcMem, RGB(255, 0, 255));
        Ellipse(hdcMem, cxMove, cyMove, cxTotal - cxMove, cyTotal - cyMove);
        DeleteDC(hdcMem);
        DeleteObject(hBrush);
      end;

    WM_TIMER:
      begin
       if (hBitmap = 0) then Exit;
       hdcWnd := GetDC(hWnd);
       hdcMem := CreateCompatibleDC(hdcWnd);
       SelectObject(hdcMem, hBitmap);
       BitBlt(hdcWnd, xCenter - cxTotal div 2, yCenter - cyTotal div 2,
         cxTotal, cyTotal, hdcMem, 0, 0, SRCCOPY);
       ReleaseDC(hWnd, hdcWnd);
       DeleteDC(hdcMem);
       Inc(xCenter, cxMove);
       Inc(yCenter, cyMove);
       if (xCenter + cxRadius >= cxClient) or (xCenter - cxRadius <= 0) then
         cxMove := -cxMove;
       if (yCenter + cyRadius >= cyClient) or (yCenter - cyRadius <= 0) then
         cyMove := -cyMove;
      end;

    WM_DESTROY:
      begin
        if (hBitmap <> 0) then DeleteObject(hBitmap);
        KillTimer(hWnd, ID_TIMER);
        PostQuitMessage(0); // 退出
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end;

const
  szAppName = 'Bounce';
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
  hWnd := CreateWindow(szAppName, 'Bouncing Ball',
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
