program  Sketch;

uses
  Windows, Messages, Math;

  // 取得最大的'分辨率'
procedure GetLargestDisplayMode(pcxBitmap, pcyBitmap: PInteger);
var
  DevMode: TDevMode;
  iModeNum: Integer;
begin
  pcxBitmap^ := 0;
  pcyBitmap^ := 0;
  iModeNum := 0;
  ZeroMemory(@DevMode, SizeOf(TDevMode));
  DevMode.dmSize := SizeOf(TDevMode);
  while (EnumDisplaySettings(nil, iModeNum, DevMode)) do
  begin
    pcxBitmap^ := Max(pcxBitmap^, Integer(devmode.dmPelsWidth));
    pcyBitmap^ := Max(pcyBitmap^, Integer(devmode.dmPelsHeight));
    Inc(iModeNum);
  end;
end;

   // 窗体消息处理过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  fLeftButtonDown: Boolean = FALSE;
  fRightButtonDown: Boolean = FALSE;
  hBitmap: DWORD = 0;
  hdcMem: HDC = 0;
  cxBitmap: Integer = 0;
  cyBitmap: Integer = 0;
  cxClient: Integer = 0;
  cyClient: Integer = 0;
  xMouse: Integer = 0;
  yMouse: Integer = 0;
{$J-}
var
  hdcWnd: HDC;
  ps: TPaintStruct;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      begin      
        GetLargestDisplayMode(@cxBitmap, @cyBitmap); // 最大尺寸
        hdcWnd := GetDC(hWnd);
        hBitmap := CreateCompatibleBitmap(hdcWnd, cxBitmap, cyBitmap);
        hdcMem := CreateCompatibleDC(hdcWnd);
        ReleaseDC(hWnd, hdcWnd);
        if (hBitmap = 0) then // no memory for bitmap
        begin
          DeleteDC(hdcMem);
          Result := -1;
          Exit;
        end;
        SelectObject(hdcMem, hBitmap);
        PatBlt(hdcMem, 0, 0, cxBitmap, cyBitmap, WHITENESS); // 填充白色
      end;

    WM_SIZE:
      begin
        cxClient := LOWORD(lParam);
        cyClient := HIWORD(lParam);
      end;

    WM_LBUTTONDOWN:
      begin
        if (not fRightButtonDown) then SetCapture(hWnd);
        xMouse := LOWORD(lParam);
        yMouse := HIWORD(lParam);
        fLeftButtonDown := TRUE;
      end;

    WM_LBUTTONUP:
      begin
        if (fLeftButtonDown) then SetCapture(0);
        fLeftButtonDown := FALSE;
      end;

    WM_RBUTTONDOWN:
      begin
        if (not fLeftButtonDown) then SetCapture(hWnd);
        xMouse := LOWORD(lParam);
        yMouse := HIWORD(lParam);
        fRightButtonDown := TRUE;
      end;

    WM_RBUTTONUP:
      begin
        if (fRightButtonDown) then SetCapture(0);
        fRightButtonDown := FALSE;
      end;

    WM_MOUSEMOVE:
      begin
        if (not fLeftButtonDown) and (not fRightButtonDown) then Exit;
        hdcWnd := GetDC(hWnd);
        SelectObject(hdcWnd, GetStockObject(IfThen(fLeftButtonDown, BLACK_PEN, WHITE_PEN)));
        SelectObject(hdcMem, GetStockObject(IfThen(fLeftButtonDown, BLACK_PEN, WHITE_PEN)));
        MoveToEx(hdcWnd, xMouse, yMouse, nil);
        MoveToEx(hdcMem, xMouse, yMouse, nil);
        xMouse := LOWORD(lParam);
        yMouse := HIWORD(lParam);
        LineTo(hdcWnd, xMouse, yMouse);
        LineTo(hdcMem, xMouse, yMouse);
        ReleaseDC(hWnd, hdcWnd);
      end;
        
    WM_PAINT:
      begin
        hdcWnd := BeginPaint(hWnd, ps);
        BitBlt(hdcWnd, 0, 0, cxClient, cyClient, hdcMem, 0, 0, SRCCOPY);
        EndPaint(hWnd, ps);
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0); // 放一个WM_QUIT消息到队列
        DeleteDC(hdcMem);
        DeleteObject(hBitmap);
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end;    
  
const
  szAppName = 'Sketch';
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
  hWnd := CreateWindow(szAppName, 'Sketch',
                       WS_OVERLAPPEDWINDOW,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       0, 0, hInstance, nil);
  if (hWnd = 0) then
  begin
    MessageBox(0, 'Not enough memory to create bitmap!', szAppName, MB_ICONERROR);
    Exit;
  end;

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
