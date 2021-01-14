program  Bezier;

uses
  Windows, Messages;

  // 窗体消息处理回调函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
    // 绘制贝塞尔曲线及两条直线
  procedure DrawBezier(hWndDc: HDC; const Points: array of TPoint);
  begin
    PolyBezier(hWndDc, Points, 4);

    MoveToEx(hWndDc, Points[0].X, Points[0].Y, nil);
    LineTo(hWndDc, Points[1].X, Points[1].Y);
    
    MoveToEx(hWndDc, Points[2].X, Points[2].Y, nil);
    LineTo(hWndDc, Points[3].X, Points[3].Y);
  end;
const
{$J+}
  Points: array[0..3] of TPoint = ( (X: 0; Y: 0), (X: 0; Y: 0), (X: 0; Y: 0), (X: 0; Y: 0) );
{$J+}  
var
  hWndDc: HDC;
  PS: TPaintStruct;
  cxClient, cyClient: Integer;
begin
  Result := 0;
  case Msg of
    WM_SIZE     :  begin
                     cxClient := LOWORD(lParam);
                     cyClient := HIWORD(lParam);
                     Points[0].X := cxClient div 4;
                     Points[0].Y := cyClient div 2;
                     Points[1].X := cxClient div 2;
                     Points[1].Y := cyClient div 4;
                     Points[2].X := cxClient div 2;
                     Points[2].Y := 3 * cyClient div 4;
                     Points[3].X := 3 * cxClient div 4;
                     Points[3].Y := cyClient div 2;
                   end;

    WM_LBUTTONDOWN,
    WM_RBUTTONDOWN,
    WM_MOUSEMOVE:  begin
                     if (wParam and MK_LBUTTON <> 0) or  // 左键或右键按下
                        (wParam and MK_RBUTTON <> 0) then
                     begin
                       hWndDc := GetDC(hWnd);

                      // 选入白笔擦除以前图形
                       SelectObject(hWndDc, GetStockObject(WHITE_PEN));
                       DrawBezier(hWndDc, Points);
                      // 左键按下??
                       if (wParam and MK_LBUTTON <>0) then
                       begin
                         Points[1].X := LOWORD(lParam);
                         Points[1].Y := HIWORD(lParam);
                       end;
                      // 右键按下??
                       if (wParam and MK_RBUTTON <> 0) then
                       begin
                         Points[2].X := LOWORD(lParam);
                         Points[2].Y := HIWORD(lParam);
                       end;
                      // 选入黑笔画新图形
                       SelectObject(hWndDc, GetStockObject(BLACK_PEN));
                       DrawBezier(hWndDc, Points);
                       
                       ReleaseDC(hWnd, hWndDc);
                     end;
                   end;

    WM_PAINT    :  begin  
                     InvalidateRect(hWnd, nil, TRUE); // 使整个区域无效,并擦除背景
                     hWndDc := BeginPaint(hWnd, PS); // 使整个区域有效,并返回句柄
                     DrawBezier(hWndDc, Points); // 绘图
                     EndPaint(hWnd, PS); // 释放设备内容句柄
                   end;

    WM_DESTROY  :  PostQuitMessage(0); // 跳出消息循环

    else Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
  end;
end;


const  
  AppName = 'Bezier';

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
  hWnd := CreateWindow(AppName, 'Bezier Splines',
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
