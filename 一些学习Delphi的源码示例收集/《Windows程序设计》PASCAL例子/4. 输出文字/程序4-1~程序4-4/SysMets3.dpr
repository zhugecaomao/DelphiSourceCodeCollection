program  SysMets3;

uses
  Windows, Messages, Math, SysMets;

  // 窗体消息处理回调函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
 {$J+}
  cxChar: Integer = 0;    // 小写字母宽度
  cxCaps: Integer = 0;    // 大写字母宽度
  cyChar: Integer = 0;    // 小写字母高度
  cxClient: Integer = 0;  // 窗体客户区宽度
  cyClient: Integer = 0;  // 窗体客户区高度
  iMaxWidth: Integer = 0; // 文字输出总宽度
 {$J-}
var
  X, Y, J, L, iVertPos, iHorzPos, iPaintBeg, iPaintEnd: Integer;
  hWndDc: HDC;      // 设备内容句柄
  PS: TPaintStruct; // 绘图信息结构
  TM: TTextMetric;  // 字体度量信息
  SI: TScrollInfo;  // 卷动条结构体
  Buffer: array [0..5] of Char; // 输出缓冲区  
begin
  Result := 0;
 // 根据不同消息作不同处理
  case Msg of
    WM_CREATE: begin
                 hWndDc := GetDC(hWnd);

                 GetTextMetrics(hWndDc, TM); // 取得默认字体的度量信息
                 cxChar := TM.tmAveCharWidth;
                 if (TM.tmPitchAndFamily and $1) = 0 // 字体宽度固定?
                 then cxCaps := cxChar
                 else cxCaps := cxChar * 3 div 2;
                 cyChar := TM.tmHeight + TM.tmExternalLeading;
                 iMaxWidth := 40 * cxChar + 22 * cxCaps; // 文字输出最大宽度

                 ReleaseDC(hWnd, hWndDc);
               end;

    WM_SIZE: begin
              // 当前窗体客户区尺寸
               cxClient := LOWORD(lParam);
               cyClient := HIWORD(lParam);
              // 重新设置竖直卷动条范围和单页大小
               SI.cbSize := SizeOf(SI);
               SI.fMask := SIF_RANGE or SIF_PAGE;
               SI.nMin := 0;
               SI.nMax := NUMLINES - 1;
               SI.nPage := cyClient div cyChar;
               SetScrollInfo(hWnd, SB_VERT, SI, TRUE);
              // 重新设置横向卷动条范围和单页大小
               SI.cbSize := SizeOf(SI);
               SI.fMask := SIF_RANGE or SIF_PAGE;
               SI.nMin := 0;
               SI.nMax := 2 + iMaxWidth div cxChar;
               SI.nPage := cxClient div cxChar;
               SetScrollInfo(hWnd, SB_HORZ, SI, TRUE);
              (* 注意,某些情况下,卷动条会自动隐藏,比如nPage大于nMax *)
             end;
                   
    WM_VSCROLL: begin
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
                 // 重设卷动条位置(Windows会自动进行范围限制处理)
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

    WM_HSCROLL: begin
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
                 // 重设卷动条位置(Windows会自动进行范围限制处理)                  
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

    WM_PAINT: begin
               // 开始绘制
                hWndDc := BeginPaint(hWnd, PS);
               // 只取卷动条位置信息
                SI.cbSize := SizeOf(SI);
                SI.fMask := SIF_POS;
               // 取得竖直卷动条位置
                GetScrollInfo(hWnd, SB_VERT, SI);
                iVertPos := SI.nPos;
               // 取得横向卷动条位置
                GetScrollInfo(hWnd, SB_HORZ, SI);
                iHorzPos := SI.nPos;
               // 计算需要重绘的范围(行)
                iPaintBeg := Max(0, iVertPos + PS.rcPaint.Top div cyChar);
                iPaintEnd := Min(NUMLINES - 1, iVertPos + PS.rcPaint.Bottom div cyChar);
               // 依次绘制各行
                for J := iPaintBeg to iPaintEnd do
                begin
                  X := cxChar * (1 - iHorzPos); // 计算本行文字横坐标(左上角)
                  Y := cyChar * (J - iVertPos); // 计算本行文字纵坐标(左上角)
                  TextOut(hWndDc, X, Y, SysMetrics[J].szLabel, lstrlen(SysMetrics[J].szLabel));
                  TextOut(hWndDc, X + 22 * cxCaps, Y, SysMetrics[J].szDesc, lstrlen(SysMetrics[J].szDesc));
                  SetTextAlign(hWndDc, TA_RIGHT or TA_TOP); // 设置TextOut所给坐标为右上角之坐标
                  L := GetSystemMetrics(SysMetrics[J].Index);
                  TextOut(hWndDc, X + 22 * cxCaps + 40 * cxChar, Y, Buffer, wvsprintf(Buffer, '%5d', @L));
                  SetTextAlign(hWndDc, TA_LEFT or TA_TOP); // 设置TextOut所给坐标为左上角之坐标
                end;
               // 结束绘制
                EndPaint(hWnd, PS);
              end;

    WM_DESTROY: PostQuitMessage(0);  // 间接导致消息循环结束

    else Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
  end;
end;


const
  AppName = 'SysMets3';

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
    MessageBox(0,'This program requires Windows NT!', AppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(AppName, 'Get System Metrics No. 3',
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

        


