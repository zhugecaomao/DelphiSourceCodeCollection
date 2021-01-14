program  RandRect;

uses
  Windows, Messages;

var
  cxClient, cyClient: Integer; // 窗体当前尺寸

  // 窗体消息处理回调函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
begin
  Result := 0;
  case Msg of
    WM_SIZE     :  begin
                     cxClient := LOWORD(lParam);
                     cyClient := HIWORD(lParam);
                   end;

    WM_DESTROY  :  PostQuitMessage(0);  // 放置WM_QUIT消息至线程消息队列

    else Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
  end;
end;

  // 在窗口上填充随机矩形
procedure DrawRectangle(hWnd: HWND);
var
  hWndDC: LongWord;
  hBrush: LongWord;
  Rect: TRect;
begin  
  if (cxClient = 0)or(cyClient = 0) then Exit;
 // 生成随机矩形
  SetRect(Rect, Random(cxClient), Random(cyClient), Random(cxClient), Random(cyClient));
 // 随机颜色画刷
  hBrush := CreateSolidBrush(RGB(Random(257), Random(257), Random(257)));
 // 填充矩形
  hWndDC := GetDC(hWnd);
  FillRect(hWndDC, Rect, hBrush);
  ReleaseDC(hWnd, hWndDC);
 // 删除画刷
  DeleteObject(hBrush);
end;

const  
  AppName = 'RandRect';

var
  WndClass: TWndClass;
  hWnd: LongWord;
  Msg: TMsg;
      
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
  hWnd := CreateWindow(AppName, 'Random Rectangles',
                       WS_OVERLAPPEDWINDOW,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       0, 0, hInstance, nil);

 // 显示窗体
  ShowWindow(hWnd, CmdShow);
  UpdateWindow(hWnd);
  
 // 消息循环
  while TRUE do
  begin  // 取到消息则返回TRUE
    if PeekMessage(Msg, 0, 0, 0, PM_REMOVE) then
    begin
      if (Msg.message = WM_QUIT) then Break; // 跳出循环
      TranslateMessage(Msg); // 按键转字符
      DispatchMessage(Msg);  // 分发消息
    end else
    begin // 没有消息要处理的时候则画随机矩形
      DrawRectangle(hWnd);
      Sleep(5); // 这里我加了一句延时函数
    end;
  end;
end.
