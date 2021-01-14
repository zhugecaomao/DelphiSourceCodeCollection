program  WhatSize;

uses
  Windows, Messages;

  // 窗体消息处理回调函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
    // 绘制单行文字信息 
  procedure Show(hWin, hDc, xText, yText, iMapMode: Integer; szMapMode: PChar);
  var
    Buffer: array[0..60] of Char;     // 输出(转换后的字符串)缓冲区
    List: array[0..4] of LongWord; // 待(wvsprintf)转换列表
    Rect: TRect;
  begin
    SaveDC(hDc); // 保存设备内容
    SetMapMode(hDc, iMapMode); // 设定新的映像方式
    GetClientRect(hWin, Rect); // 取得显示区域坐标
    DPtoLP(hDc, Rect, 2); // 转换为逻辑坐标
    RestoreDC(hDc, -1); // 恢复设备内容(包括原映像方式)
    List[0] := LongWord(szMapMode); // 填写转换列表 ..
    List[1] := Rect.Left;
    List[2] := Rect.Right;
    List[3] := Rect.Top;
    List[4] := Rect.Bottom;            { 转换后存入Buffer再由TextOut输出 }
    TextOut(hDc, xText, yText, Buffer, wvsprintf(Buffer, '%-20s %7d %7d %7d %7d', @List));
  end;
const
{$J+}
  cxChar: Integer = 0; // 字体宽度
  cyChar: Integer = 0; // 字体高度
{$J-}
 Heading = 'Mapping Mode            Left   Right     Top  Bottom';
 UndLine = '------------            ----   -----     ---  ------';
var
  hWndDc: HDC;
  PS: TPaintStruct;
  TM: TTextMetric;
begin
  Result := 0;
  case Msg of
    WM_CREATE   :  begin
                     hWndDc := GetDC(hWnd);
                                                        // 等宽字体
                     SelectObject(hWndDc, GetStockObject(SYSTEM_FIXED_FONT));
                     GetTextMetrics(hWndDc, TM);  // 取得字体度量信息
                     cxChar := TM.tmAveCharWidth;
                     cyChar := TM.tmHeight + TM.tmExternalLeading;

                     ReleaseDC(hWnd, hWndDc);
                   end;

    WM_PAINT    :  begin
                     hWndDc := BeginPaint(hWnd, PS);
                                                        // 等宽字体
                     SelectObject(hWndDc, GetStockObject(SYSTEM_FIXED_FONT));
                    // 设置 xViewPort = xWindow * cxChar , yViewPort = yWindow * cyChar
                     SetMapMode(hWndDc, MM_ANISOTROPIC);
                     SetWindowExtEx(hWndDc, 1, 1, nil);
                     SetViewportExtEx(hWndDc, cxChar, cyChar, nil);
                    // 输出各行, 坐标给行列号即可
                     TextOut(hWndDc, 1, 1, Heading, lstrlen(Heading));
                     TextOut(hWndDc, 1, 2, UndLine, lstrlen(UndLine));
                     Show(hWnd, hWndDc, 1, 3, MM_TEXT, 'TEXT (pixels)');
                     Show(hWnd, hWndDc, 1, 4, MM_LOMETRIC, 'LOMETRIC (.1 mm)');
                     Show(hWnd, hWndDc, 1, 5, MM_HIMETRIC, 'HIMETRIC (.01 mm)');
                     Show(hWnd, hWndDc, 1, 6, MM_LOENGLISH, 'LOENGLISH (.01 in)');
                     Show(hWnd, hWndDc, 1, 7, MM_HIENGLISH, 'HIENGLISH (.001 in)');
                     Show(hWnd, hWndDc, 1, 8, MM_TWIPS, 'TWIPS (1/1440 in)');

                     EndPaint(hWnd, PS);
                   end;

    WM_DESTROY  :  PostQuitMessage(0); // 退出消息循环

    else Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理  
  end;
end;


const  
  AppName = 'WhatSize';

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
    MessageBox(0, 'This Program requires Windows NT!', AppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(AppName, 'What Size is the Window?',
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
