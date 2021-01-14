program  SineWave;

uses
  Windows, Messages;

 // 窗体消息处理回调函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  NUM = 1000;
  TWOPI = (2 * 3.1415926);
 {$J+}
  cxClient: Integer = 0;  // 窗体宽度
  cyClient: Integer = 0;  // 窗体高度
 {$J-}
var
  hWndDc: HDC;
  PS: TPaintStruct;
  PTs: array [0..NUM-1] of TPoint; // 坐标点
  J: Integer;  
begin
  Result := 0;
  case Msg of
    WM_SIZE     :  begin // 保存新尺寸
                     cxClient := LOWORD(lParam);
                     cyClient := HIWORD(lParam);
                   end;
                   
    WM_PAINT    :  begin
                    // 开始绘制
                     hWndDc := BeginPaint(hWnd, PS);
                    // 绘制中线
                     MoveToEx(hWndDc, 0, cyClient div 2, nil);
                     LineTo(hWndDc, cxClient, cyClient div 2);
                    // 计算各点
                     for J := 0 to NUM-1 do
                     begin
                       PTs[J].X := J * cxClient div NUM ;
                       PTs[J].Y := Trunc(cyClient / 2 * (1 - Sin(TWOPI * J / NUM)));
                     end;
                    // 连接各点(得到正弦波)
                     Polyline(hWndDc, PTs, NUM);
                    // 结束绘制
                     EndPaint(hWndDc, PS);
                   end;
                   
    WM_DESTROY  :  PostQuitMessage(0); // 放置退出消息

    else Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理  
  end;
end;

const  
  AppName = 'SineWave';

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
    MessageBox(0, 'This program requires Windows NT!', AppName, MB_ICONERROR);
    Exit;
  end;
  
 // 建立窗体
  hWnd := CreateWindow(AppName, 'Sine Wave Using Polyline',
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
