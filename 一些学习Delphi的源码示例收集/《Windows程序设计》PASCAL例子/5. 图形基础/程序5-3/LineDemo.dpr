program  LineDemo;

uses
  Windows, Messages;

 // 窗体消息处理回调函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  cxClient: Integer = 0; // 窗体宽度
  cyClient: Integer = 0; // 窗体高度
{$J-}  
var
  hWndDc: HDC;
  PS: TPaintStruct;
begin
  Result := 0;
  case Msg of
    WM_SIZE     :  begin
                     cxClient := LOWORD(lParam);
                     cyClient := HIWORD(lParam);
                   end;
                   
    WM_PAINT    :  begin
                     hWndDc := BeginPaint(hWnd, PS);
                     
                    // 直角矩形
                     Rectangle(hWndDc, cxClient div 8, cyClient div 8,
                       7 * cxClient div 8, 7 * cyClient div 8);
                    // 两根直线
                     MoveToEx(hWndDc, 0, 0, nil);
                     LineTo(hWndDc, cxClient, cyClient);
                     MoveToEx(hWndDc, 0, cyClient, nil);
                     LineTo(hWndDc, cxClient, 0);
                    // 椭圆
                     Ellipse(hWndDc, cxClient div 8, cyClient div 8,
                       7 * cxClient div 8, 7 * cyClient div 8);
                    // 圆角矩形
                     RoundRect(hWndDc, cxClient div 4, cyClient div 4, 3 * cxClient div 4,
                       3 * cyClient div 4, cxClient div 4, cyClient div 4);

                     EndPaint(hWndDc, PS);
                   end;
                   
    WM_DESTROY  :  PostQuitMessage(0); // 放置WM_QUIT消息
    
    else Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理 
  end;
end;

const  
  AppName = 'LineDemo';

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
  hWnd := CreateWindow(AppName, 'Line Demonstration',
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
