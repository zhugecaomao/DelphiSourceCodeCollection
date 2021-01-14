program  WhatClr;

uses
  Windows, Messages;

  // 消息处理回调函数   
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  ID_TIMER = 1; // 计时器ID
  {$J+}
  ClrCurr: COLORREF = 0; // 当前颜色
  ClrLast: COLORREF = 0; // 上次颜色
  hdcScreen: HDC = 0; // 屏幕'设备内容句柄'
  {$J-}
var
  hWndDc: HDC; // 窗体客户区'设备内容句柄'
  Rect: TRect; // 窗体客户区尺寸范围
  Pt: TPoint;  // 当前鼠标所处屏幕位置
  Ps: TPaintStruct;
  Buffer: array[0..8] of Char; // 输出缓冲区
  List: array[0..2] of Integer; // 转换缓冲区
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      begin
        hdcScreen := CreateDC('DISPLAY', nil, nil, nil); // 取得 屏幕'设备内容句柄'
        SetTimer(hWnd, ID_TIMER, 1000, nil); // 安装定时器, 间隔为一秒.
      end;
      
    WM_TIMER:
      begin
        GetCursorPos(Pt); // 鼠标当前位置
        ClrCurr := GetPixel(hdcScreen, Pt.X, Pt.Y); // 取颜色
        SetPixel(hdcScreen, Pt.X, Pt.Y, 0); // 画黑点
        if (ClrCurr <> ClrLast) then
        begin
          ClrLast := ClrCurr;
          InvalidateRect(hWnd, nil, FALSE);
        end;
      end;
      
    WM_PAINT:
      begin
        hWndDc := BeginPaint(hWnd, Ps);

        GetClientRect(hWnd, Rect);
        List[0] := GetRValue(ClrCurr);
        List[1] := GetGValue(ClrCurr);
        List[2] := GetBValue(ClrCurr);
        wvsprintf(Buffer, '  %02X %02X %02X  ', @List[0]);
        DrawText(hWndDc, Buffer, -1, Rect, DT_SINGLELINE or DT_CENTER or DT_VCENTER);

        EndPaint(hWnd, Ps);
      end;
      
    WM_DESTROY:
      begin
        KillTimer(hWnd, ID_TIMER); // 删除定时器
        DeleteDC(hdcScreen); // 释放 屏幕'设备内容句柄'
        PostQuitMessage(0);  // 放WM_QUIT使GetMessage返回FALSE
      end;
      
    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
  end;
end;

   // 分析窗体合适的尺寸
procedure FindWindowSize(var cxWindow, cyWindow: Integer);
var
  hdcScreen: HDC;
  TM: TTextMetric;
begin
  hdcScreen := CreateIC('DISPLAY', nil, nil, nil); // 取得 屏幕'设备内容句柄'
  GetTextMetrics(hdcScreen, TM); // 取得字体度量信息
  cxWindow := 2 * GetSystemMetrics(SM_CXBORDER) +  12 * TM.tmAveCharWidth;
  cyWindow := 2 * GetSystemMetrics(SM_CYBORDER) + GetSystemMetrics(SM_CYCAPTION) + 2 * tm.tmHeight;
  DeleteDC(hdcScreen); // 释放 屏幕'设备内容句柄'
end;

const
  AppName = 'WhatClr';
var
  hWnd: LongWord;
  cxWindow, cyWindow: Integer;
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
    MessageBox(0, 'This program requires Windows NT!', AppName, MB_ICONERROR);
    Exit;
  end;
 // 建立窗体
  FindWindowSize(cxWindow, cyWindow);
  hWnd := CreateWindow(AppName, 'What Color',
                       WS_OVERLAPPED or WS_CAPTION or WS_SYSMENU or WS_BORDER,
                       CW_USEDEFAULT, CW_USEDEFAULT, cxWindow, cyWindow,
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
