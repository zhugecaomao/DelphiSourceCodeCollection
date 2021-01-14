program  SysMets2;

uses
  Windows, Messages, Math, SysMets;

 // 窗体消息处理回调函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
 {$J+}
  cxChar: Integer = 0;       // 小写字母宽度
  cxCaps: Integer = 0;       // 大写字母宽度
  cyChar: Integer = 0;       // 小写字母高度
  cyClient: Integer = 0;     // 窗体客户区高度
  iVscrollPos: Integer = 0;  // 卷动条当前位置
 {$J-}
var
  J, Y, L: Integer; // 循环变量, 输出纵坐标, 转换列表(这里只有一个)
  Buffer: array [0..5] of Char; // 转换输出缓冲区
  hWndDc: HDC;      // 设备内容句柄
  PS: TPaintStruct; // 绘图信息结构
  TM: TTextMetric;  // 字体度量信息
begin
  Result := 0;
  case Msg of
    WM_CREATE: begin
                // 取得默认字体的度量信息
                 hWndDc := GetDC(hWnd);
                 GetTextMetrics(hWndDc, TM);
                 cxChar := TM.tmAveCharWidth;
                 if (TM.tmPitchAndFamily and $1) = 0 // 宽度固定?
                 then cxCaps := cxChar
                 else cxCaps := cxChar * 3 div 2;
                 cyChar := TM.tmHeight + TM.tmExternalLeading;
                 ReleaseDC(hWnd, hWndDc);
                // 设卷动条范围及初始位置
                 SetScrollRange(hWnd, SB_VERT, 0, NUMLINES - 1, FALSE) ;
                 SetScrollPos(hWnd, SB_VERT, iVscrollPos, TRUE);
               end;

    WM_SIZE: cyClient := HIWORD(lParam); // 目前窗体客户区高度

    WM_VSCROLL: begin
                  case LOWORD(wParam) of  // 卷动类型
                    SB_LINEUP   : Dec(iVscrollPos); // 上翻一行
                    SB_LINEDOWN : Inc(iVscrollPos); // 下翻一行
                    SB_PAGEUP   : Dec(iVscrollPos, (cyClient div cyChar)); // 上翻一页
                    SB_PAGEDOWN : Inc(iVscrollPos, (cyClient div cyChar)); // 下翻一页
                    SB_THUMBPOSITION: iVscrollPos := HIWORD(wParam); // 拖拽停止
                  end;
                  iVscrollPos := Max(0, Min(iVscrollPos, NUMLINES-1)); // 范围限制
                  if (iVscrollPos <> GetScrollPos(hWnd, SB_VERT)) then // 已经改变
                  begin
                    SetScrollPos(hWnd, SB_VERT, iVscrollPos, TRUE); // 设置滚动条位置
                    InvalidateRect(hWnd, nil, TRUE); // 显示区域失效(从而产生WM_PAINT)
                  end;
                end;

    WM_PAINT: begin
                hWndDc := BeginPaint(hWnd, PS); // 开始绘制

                for J := 0 to NUMLINES-1 do // 绘制各行
                begin
                  Y := cyChar * (J - iVscrollPos);   // 计算本行输出纵坐标
                  TextOut(hWndDc, 0, Y, SysMetrics[J].szLabel, lstrlen(SysMetrics[J].szLabel));
                  TextOut(hWndDc, 22 * cxCaps, Y, SysMetrics[J].szDesc, lstrlen(SysMetrics[J].szDesc));
                  SetTextAlign(hWndDc, TA_RIGHT or TA_TOP); // 此后所给坐标视为右上角之坐标
                  L := GetSystemMetrics(SysMetrics[J].Index);
                  TextOut(hWndDc, 22 * cxCaps + 40 * cxChar, Y, Buffer, wvsprintf(Buffer, '%5d', @L));
                  SetTextAlign(hWndDc, TA_LEFT or TA_TOP); // 此后所给坐标视为左上角之坐标
                end;

                EndPaint(hWnd, PS); // 结束绘制
              end;

    WM_DESTROY: PostQuitMessage(0); // 放置WM_QUIT导致GetMessage返回FALSE

    else Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
  end;
end;

const
  AppName = 'SysMets2'; // 窗体类名

var
  hWnd: LongWord;       // 窗体句柄
  Msg: TMsg;            // 消息结构
  WndClass: TWndClass;  // 窗体类结构

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
  hWnd := CreateWindow(AppName, 'Get System Metrics No. 2',
                       WS_OVERLAPPEDWINDOW or WS_VSCROLL, // 加入垂直滚动条
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

        


