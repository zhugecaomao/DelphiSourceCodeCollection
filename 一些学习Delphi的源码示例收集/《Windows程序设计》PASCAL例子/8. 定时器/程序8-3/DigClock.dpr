program  DigClock;

uses
  Windows, Messages;

  // 重新引入API以便调用  { var -> const }
function Polygon(DC: HDC; const Points; Count: Integer): BOOL; stdcall; external gdi32 name 'Polygon';

  // 绘制一个十进制位
procedure DisplayDigit(hdc: HDC; iNumber: Integer);
const
  fSevenSegment: array[0..9] of array[0..6] of Boolean = // 0~9 七段码
  ( (TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, TRUE),
    (FALSE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE),
    (TRUE, FALSE, TRUE, TRUE, TRUE, FALSE, TRUE),
    (TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, TRUE),
    (FALSE, TRUE, TRUE, TRUE, FALSE, TRUE, FALSE),
    (TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE),
    (TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, TRUE),
    (TRUE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE),
    (TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE),
    (TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE) );
  ptSegment: array[0..6] of array[0..5] of TPoint = // 各段六个角坐标
  ( ( (X: 7; Y: 6), (X: 11; Y: 2), (X: 31; Y: 2), (X: 35; Y: 6), (X: 31; Y: 10), (X: 11; Y: 10) ),
    ( (X: 6; Y: 7), (X: 10; Y: 11), (X: 10; Y: 31), (X: 6; Y: 35), (X: 2; Y: 31), (X: 2; Y: 11) ),
    ( (X: 36; Y: 7), (X: 40; Y: 11), (X: 40; Y: 31), (X: 36; Y: 35), (X: 32; Y: 31), (X: 32; Y: 11) ),
    ( (X: 7; Y: 36), (X: 11; Y: 32), (X: 31; Y: 32), (X: 35; Y: 36), (X: 31; Y: 40), (X: 11; Y: 40) ),
    ( (X: 6; Y: 37), (X: 10; Y: 41), (X: 10; Y: 61), (X: 6; Y: 65), (X: 2; Y: 61), (X: 2; Y: 41) ),
    ( (X: 36; Y: 37), (X: 40; Y: 41), (X: 40; Y: 61), (X: 36; Y: 65), (X: 32; Y: 61), (X: 32; Y: 41) ),
    ( (X: 7; Y: 66), (X: 11; Y: 62), (X: 31; Y: 62), (X: 35; Y: 66), (X: 31; Y: 70), (X: 11; Y: 70) ) );
var
  iSeg : Integer;
begin
  for iSeg := 0 to 6 do
    if fSevenSegment[iNumber][iSeg] then
      Polygon(hdc, ptSegment[iSeg][0], 6);
end;

  // 绘制两个十进制位                                  { 高位不补0 }
procedure DisplayTwoDigits(hdc: HDC; iNumber: Integer; fSuppress: Boolean);
begin
  if (not fSuppress)or(iNumber div 10 <> 0) then DisplayDigit(hdc, iNumber div 10); // 绘制十位数字
  OffsetWindowOrgEx(hdc, -42, 0, nil); // 原点右移
  DisplayDigit(hdc, iNumber mod 10); // 绘制个位数字
  OffsetWindowOrgEx(hdc, -42, 0, nil); // 原点右移
end;

  // 绘制冒号
procedure DisplayColon(hdc: HDC);
const
  ptColon: array[0..1] of array[0..3] of TPoint =
  (   ( (X: 2; Y: 21), (X: 6; Y: 17), (X: 10; Y: 21), (X: 6; Y: 25) ),
      ( (X: 2; Y: 51), (X: 6; Y: 47), (X: 10; Y: 51), (X: 6; Y: 55) )   );
begin
  Polygon(hdc, ptColon[0][0], 4);
  Polygon(hdc, ptColon[1][0], 4);
  OffsetWindowOrgEx(hdc, -12, 0, nil); // 原点右移
end;

  // 绘制当前时间               
procedure DisplayTime(hdc: HDC; f24Hour, fSuppress: Boolean);
var
 st: TSystemTime;
begin
  GetLocalTime(st);
  if f24Hour then
    DisplayTwoDigits(hdc, st.wHour, fSuppress)
  else begin
    st.wHour := st.wHour mod 12;
    if (st.wHour = 0) then st.wHour := 12;
    DisplayTwoDigits(hdc, st.wHour, fSuppress);
  end;               
  DisplayColon(hdc);
  DisplayTwoDigits(hdc, st.wMinute, FALSE);
  DisplayColon(hdc);
  DisplayTwoDigits(hdc, st.wSecond, FALSE);
end; 

  // 窗体消息处理过程   
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  ID_TIMER = 1; // 计时器ID
  {$J+}
  f24Hour: Boolean = FALSE;
  fSuppress: Boolean = FALSE;
  hBrushRed: HBRUSH = 0;
  cxClient: Integer = 0;
  cyClient: Integer = 0;
  {$J-}
var
  hWndDc: HDC;
  PS: TPaintStruct;
  Buffer: array[0..1] of Char;
begin
  Result := 0;

  case Msg of
    WM_CREATE:
      begin
        hBrushRed := CreateSolidBrush(RGB(255, 0, 0));  // 创建画刷
        SetTimer(hWnd, ID_TIMER, 1000, nil); // 安装时钟
        SendMessage(hWnd, WM_SETTINGCHANGE, 0, 0); // 使WM_SETTINGCHANGE分支执行
      end;

    WM_SETTINGCHANGE:
      begin
        GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_ITIME, Buffer, 2); // 使用24小时格式
        f24Hour := (Buffer[0] = '1');
        GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_ITLZERO, Buffer, 2); // 禁止小时前补0
        fSuppress := (Buffer[0] = '0');
        InvalidateRect(hWnd, nil, TRUE);
      end;

    WM_SIZE:
      begin
        cxClient := LOWORD(lParam);
        cyClient := HIWORD(lParam);
      end;


    WM_TIMER:
      InvalidateRect(hWnd, nil, TRUE); // 刷新

    WM_PAINT:
      begin
        hWndDc := BeginPaint(hWnd, PS);

        SetMapMode(hWndDc, MM_ISOTROPIC);
        SetWindowExtEx(hWndDc, 276, 72, nil); // 窗口尺寸
        SetViewportExtEx(hWndDc, cxClient, cyClient, nil); // 视口尺寸
        SetWindowOrgEx(hWndDc, 138, 36, nil); // 窗口原点
        SetViewportOrgEx(hWndDc, cxClient div 2, cyClient div 2, nil); // 视口原点
        SelectObject(hWndDc, GetStockObject(NULL_PEN));
        SelectObject(hWndDc, hBrushRed);
        DisplayTime(hWndDc, f24Hour, fSuppress);
        
        EndPaint(hWnd, PS);
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0); // 导致GetMessage返回FALSE
        KillTimer(hWnd, ID_TIMER); // 删除定时器
        DeleteObject(hBrushRed); // 删除画刷对象
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
  end;
end;


const
  AppName = 'DigClock';

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
  hWnd := CreateWindow(AppName, 'Digital Clock',
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
