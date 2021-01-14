program  Clock;

uses
  Windows, Messages, Math;

  // 设定映象模式等
procedure SetIsotropic(hWndDc: HDC; cxClient, cyClient: Integer);
begin
  SetMapMode(hWndDc, MM_ISOTROPIC);
  SetWindowExtEx(hWndDc, 1000, 1000, nil);
  SetViewportExtEx(hWndDc, cxClient div 2, -cyClient div 2, nil);
  SetViewportOrgEx(hWndDc, cxClient div 2,  cyClient div 2, nil);
end;

  // '旋转'点         点数组,                  个数, 度数.
procedure RotatePoint(var pt: array of TPoint; iNum, iAngle: Integer);
const
  TWOPI = (2 * 3.1415926);
var
  J: Integer;
  ptTemp: TPoint;
begin
  for J := 0 to iNum - 1 do
  begin
    ptTemp.X := Trunc(pt[J].X * Cos(TWOPI * iAngle / 360) + pt[J].Y * Sin(TWOPI * iAngle / 360));
    ptTemp.Y := Trunc(pt[J].Y * Cos(TWOPI * iAngle / 360) - pt[J].X * Sin(TWOPI * iAngle / 360));
    pt[J] := ptTemp;
   end;
end;

  // 绘钟的'框架' 
procedure DrawClock(hWndDc: HDC);
var
  iAngle: Integer;
  pt: array[0..2] of TPoint;
begin
  iAngle := 0;
  while (iAngle < 360) do
  begin
    pt[0].X := 0;
    pt[0].Y := 900;
    RotatePoint(pt, 1, iAngle);
    if (iAngle mod 5) <> 0 then
    begin
      pt[2].X := 33;
      pt[2].Y := 33;
    end else
    begin
      pt[2].X := 100;
      pt[2].Y := 100;
    end;
    pt[0].X := pt[0].X - pt[2].X div 2;
    pt[0].Y := pt[0].Y - pt[2].Y div 2;
    pt[1].X := pt[0].X + pt[2].X;
    pt[1].Y := pt[0].Y + pt[2].Y;
    SelectObject(hWndDc, GetStockObject(BLACK_BRUSH));
    Ellipse(hWndDc, pt[0].X, pt[0].Y, pt[1].X, pt[1].Y);
    iAngle := iAngle + 6;
  end;
end;

  // 绘制'指针'
procedure DrawHands(hWndDc: HDC; pst: PSystemTime; fChange: Boolean);
const
  pt: array[0..2] of array[0..4] of TPoint =
   ( ( (X: 0; Y: -150), (X: 100; Y: 0), (X: 0; Y: 600), (X: -100; Y: 0), (X: 0; Y: -150) ),
     ( (X: 0; Y: -200), (X: 50; Y: 0), (X: 0; Y: 800), (X: -50; Y: 0), (X: 0; Y: -200) ),
     ( (X: 0; Y: 0), (X: 0; Y: 0), (X: 0; Y: 0), (X: 0; Y: 0), (X: 0; Y: 800) ) ) ;
var
  J: Integer;
  iAngle: array[0..2] of Integer;
  ptTemp: array[0..2] of array[0..4] of TPoint;
begin
  iAngle[0] :=  (pst.wHour * 30) mod 360 + pst.wMinute div 2; 
  iAngle[1] :=  pst.wMinute * 6;
  iAngle[2] :=  pst.wSecond * 6;
  CopyMemory(@ptTemp[0][0], @pt[0][0], SizeOf(pt));
  if fChange then J := 0 else J := 2 ;
  while (J < 3) do
  begin
    RotatePoint(ptTemp[J], 5, iAngle[J]) ;
    Polyline(hWndDc, ptTemp[J], 5) ;
    J := J + 1;    
  end;
end;

  // 窗体消息处理过程   
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  ID_TIMER = 1; // 计时器ID
  {$J+}
  cxClient: Integer = 0;
  cyClient: Integer = 0;
  stPrevious: TSystemTime = (wYear: 0; wMonth: 0; wDayOfWeek: 0; wDay: 0; wHour: 0; wMinute: 0; wSecond: 0; wMilliseconds: 0);
  {$J-}
var
  hWndDc: HDC;
  ps: TPaintStruct;
  st: SystemTime;
  fChange: Boolean;  
begin
  Result := 0;

  case Msg of
    WM_CREATE:
      begin
        SetTimer(hWnd, ID_TIMER, 1000, nil);
        GetLocalTime(stPrevious);
     //   stPrevious = st ;
      end;

    WM_SIZE:
      begin
        cxClient := LOWORD(lParam);
        cyClient := HIWORD(lParam);
      end;


    WM_TIMER:
      begin
        GetLocalTime(st);
        fChange := (st.wHour <> stPrevious.wHour) or (st.wMinute <> stPrevious.wMinute);
        hWndDc := GetDC(hWnd);
        SetIsotropic(hWndDc, cxClient, cyClient);
        SelectObject(hWndDc, GetStockObject(WHITE_PEN)); // 擦除
        DrawHands(hWndDc, @stPrevious, fChange);
        SelectObject(hWndDc, GetStockObject(BLACK_PEN)); // 绘制
        DrawHands(hWndDc, @st, TRUE);
        ReleaseDC(hWnd, hWndDc);
        stPrevious := st;
      end;

    WM_PAINT:
      begin
        hWndDc := BeginPaint(hWnd, PS);
        SetIsotropic(hWndDc, cxClient, cyClient);
        DrawClock(hWndDc);
        DrawHands(hWndDc, @stPrevious, TRUE);
        EndPaint(hWnd, PS);
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0);
        KillTimer(hWnd, ID_TIMER);
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
  end;
end;


const
  AppName = 'Clock';
  
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
  hWnd := CreateWindow(AppName, 'Analog Clock',
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
