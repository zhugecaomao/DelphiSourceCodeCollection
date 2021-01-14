program  SysMets;

uses
  Windows, Messages, Math, uSysMets;

   // 窗体消息处理回调函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  cxChar: Integer = 0;       // 小写字母宽度
  cxCaps: Integer = 0;       // 大写字母宽度
  cyChar: Integer = 0;       // 小写字母高度
  cxClient: Integer = 0;     // 窗体客户区宽度
  cyClient: Integer = 0;     // 窗体客户区高度
  iMaxWidth: Integer = 0;    // 文字输出行宽度
  iDeltaPerLine: Integer = 0; // 滚动一行所需要的delta值
  iAccumDelta: Integer = 0;  // 目前滚动值 
{$J-}  
var
  X, Y, J, L, iVertPos, iHorzPos, iPaintBeg, iPaintEnd: Integer;
  Buffer: array [0..5] of Char; // 输出缓冲区 
  hWndDc: HDC;
  PS: TPaintStruct;
  TM: TTextMetric;
  SI: TScrollInfo;
  ScrollLines: DWORD;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      begin
        hWndDc := GetDC(hWnd);
        GetTextMetrics(hWndDc, TM); // 取得字体度量信息
        cxChar := TM.tmAveCharWidth;
        if (TM.tmPitchAndFamily and $1) = 0 // 宽度固定?
        then cxCaps := cxChar
        else cxCaps := cxChar * 3 div 2;
        cyChar := TM.tmHeight + TM.tmExternalLeading;
        iMaxWidth := 40 * cxChar + 22 * cxCaps;
        ReleaseDC(hWnd, hWndDc);

        SendMessage(hWnd, WM_SETTINGCHANGE, 0, 0); // 使得WM_SETTINGCHANGE分支得以执行
      end;

    WM_SETTINGCHANGE:
      begin                 // 每次滚动行数, 此值可在'控制面板'设置
        SystemParametersInfo(SPI_GETWHEELSCROLLLINES, 0, @ScrollLines, 0);
        if (ScrollLines <> 0) then
          iDeltaPerLine := WHEEL_DELTA div ScrollLines // 滚动一行所需要的delta值
        else
          iDeltaPerLine := 0 ; // 不滚动
      end; 

    WM_SIZE:
      begin
        cxClient := LOWORD(lParam);
        cyClient := HIWORD(lParam);
           // 设竖直卷动条范围和单页大小
        SI.cbSize := SizeOf(SI);
        SI.fMask  := SIF_RANGE or SIF_PAGE;
        SI.nMin := 0;
        SI.nMax := NUMLINES - 1;
        SI.nPage := cyClient div cyChar;
        SetScrollInfo(hWnd, SB_VERT, SI, TRUE);
           // 设横向卷动条范围和单页大小
        SI.cbSize := SizeOf(SI);
        SI.fMask := SIF_RANGE or SIF_PAGE;
        SI.nMin := 0;
        SI.nMax := 2 + iMaxWidth div cxChar;
        SI.nPage := cxClient div cxChar;
        SetScrollInfo(hWnd, SB_HORZ, SI, TRUE);
      end;

    WM_VSCROLL:
      begin
           // 取得竖直卷动条全部信息
        SI.cbSize := SizeOf(SI);
        SI.fMask := SIF_ALL;
        GetScrollInfo(hWnd, SB_VERT, SI);
           // 暂存竖直卷动条位置信息
        iVertPos := SI.nPos;
           // 区分不同的卷动类型
        case LOWORD(wParam) of
          SB_TOP       : SI.nPos := SI.nMin;
          SB_BOTTOM    : SI.nPos := SI.nMax;
          SB_LINEUP    : SI.nPos := SI.nPos-1;
          SB_LINEDOWN  : SI.nPos := SI.nPos+1;
          SB_PAGEUP    : SI.nPos := SI.nPos-SI.nPage;
          SB_PAGEDOWN  : SI.nPos := SI.nPos+SI.nPage;
          SB_THUMBTRACK: SI.nPos := SI.nTrackPos;
        end;
        SI.fMask := SIF_POS;
        SetScrollInfo(hWnd, SB_VERT, SI, TRUE);
        GetScrollInfo(hWnd, SB_VERT, SI);
           // 与以前不同则上下滚动(产生无效区域)
        if (SI.nPos <> iVertPos) then
        begin
          ScrollWindow(hWnd, 0, cyChar * (iVertPos - SI.nPos),  nil, nil);
          UpdateWindow(hWnd);
        end;
      end;

    WM_HSCROLL:
      begin
           // 取得横向卷动条全部信息
        SI.cbSize := SizeOf(SI);
        SI.fMask := SIF_ALL;
        GetScrollInfo(hWnd, SB_HORZ, SI);
           // 暂存横向卷动条位置信息
        iHorzPos := SI.nPos;
           // 区分不同的卷动类型
        case LOWORD(wParam) of
          SB_LINELEFT  : SI.nPos := SI.nPos-1;
          SB_LINERIGHT : SI.nPos := SI.nPos+1;
          SB_PAGELEFT  : SI.nPos := SI.nPos-SI.nPage;
          SB_PAGERIGHT : SI.nPos := SI.nPos+SI.nPage;
          SB_THUMBPOSITION: SI.nPos := SI.nTrackPos;
        end;
        SI.fMask := SIF_POS;
        SetScrollInfo(hWnd, SB_HORZ, SI, TRUE);
        GetScrollInfo(hWnd, SB_HORZ, SI);
           // 与以前不同则左右滚动(产生无效区域)
        if (SI.nPos <> iHorzPos) then
        begin
          ScrollWindow(hWnd, cxChar * (iHorzPos - SI.nPos), 0, nil, nil);
          UpdateWindow(hWnd);
        end;
      end;

    WM_KEYDOWN:
      begin // 转发滚动消息
        case wParam of
          VK_HOME  :  SendMessage(hWnd, WM_VSCROLL, SB_TOP, 0);
          VK_END   :  SendMessage(hWnd, WM_VSCROLL, SB_BOTTOM, 0);
          VK_PRIOR :  SendMessage(hWnd, WM_VSCROLL, SB_PAGEUP, 0);
          VK_NEXT  :  SendMessage(hWnd, WM_VSCROLL, SB_PAGEDOWN, 0);
          VK_UP    :  SendMessage(hWnd, WM_VSCROLL, SB_LINEUP, 0);
          VK_DOWN  :  SendMessage(hWnd, WM_VSCROLL, SB_LINEDOWN, 0);
          VK_LEFT  :  SendMessage(hWnd, WM_HSCROLL, SB_PAGEUP, 0);
          VK_RIGHT :  SendMessage(hWnd, WM_HSCROLL, SB_PAGEDOWN, 0);
        end;
      end;

    WM_MOUSEWHEEL:
       begin
         if (iDeltaPerLine = 0) then Exit;
                                     // 滚动量(2字节带符号整数),比如该值可以是120或-120(代表向上或向下滚动3行)
         iAccumDelta := iAccumDelta + ShortInt(HIWORD(wParam));

         while (iAccumDelta >= iDeltaPerLine) do // 滚轮向前(上)滚动
         begin
           SendMessage(hWnd, WM_VSCROLL, SB_LINEUP, 0);
           iAccumDelta := iAccumDelta - iDeltaPerLine;
         end;

         while (iAccumDelta <= -iDeltaPerLine) do // 滚轮向后(下)滚动
         begin
           SendMessage(hwnd, WM_VSCROLL, SB_LINEDOWN, 0);
           iAccumDelta := iAccumDelta + iDeltaPerLine ;
         end;

         (* 注意, 通常情况下iAccumDelta到此都会再次等于0 *)
       end;
       
    WM_PAINT:
      begin
        hWndDc := BeginPaint(hWnd, PS);

        SI.cbSize := SizeOf(SI) ;
        SI.fMask := SIF_POS;
           // 取得竖直卷动条位置
        GetScrollInfo(hWnd, SB_VERT, SI);
        iVertPos := SI.nPos ;
           // 取得横向卷动条位置
        GetScrollInfo(hWnd, SB_HORZ, SI);
        iHorzPos := SI.nPos;
           // 计算需要重绘的范围(行)
        iPaintBeg := Max(0, iVertPos + PS.rcPaint.Top div cyChar);
        iPaintEnd := Min(NUMLINES - 1, iVertPos + PS.rcPaint.Bottom div cyChar);
           // 依次绘制各行
        for J := iPaintBeg to iPaintEnd do
        begin
          X := cxChar * (1 - iHorzPos); // 本行横坐标(左上角)
          Y := cyChar * (J - iVertPos); // 本行纵坐标(左上角)
          TextOut(hWndDc, X, Y, SysMetrics[J].szLabel, lstrlen(SysMetrics[J].szLabel));
          TextOut(hWndDc, X + 22 * cxCaps, Y, SysMetrics[J].szDesc, lstrlen(SysMetrics[J].szDesc));
          SetTextAlign(hWndDc, TA_RIGHT or TA_TOP);  // 右上对齐
          L := GetSystemMetrics(SysMetrics[J].Index);
          TextOut(hWndDc, X + 22 * cxCaps + 40 * cxChar , Y, Buffer, wvsprintf(Buffer, '%5d', @L));
          SetTextAlign(hWndDc, TA_LEFT or TA_TOP); // 左上对齐
        end;

        EndPaint(hWnd, PS);
      end;

    WM_DESTROY:
      PostQuitMessage(0); // 退出消息循环

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
  end;
end;


const
  AppName = 'SysMets';
  
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
    MessageBox(0,'Program requires Windows NT!', AppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(AppName, 'Get System Metrics',
                       WS_OVERLAPPEDWINDOW or WS_VSCROLL or WS_HSCROLL,
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
