program  HelloWin;

uses
  Windows, Messages, MMSystem;

  // 窗体过程    {窗体句柄}  {消息标识} {消息参数1}     {消息参数2}
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  hWndDc: HDC;  // 设备内容句柄
  Rect: TRect;  // 客户区域范围
  PS: TPaintStruct; 
begin
  Result := 0;
 // 区分不同的消息 
  case Msg of
    WM_CREATE   :  PlaySound('HelloWin.Wav', 0, SND_FILENAME or SND_ASYNC);
    
    WM_PAINT    :  begin
                    // 开始绘制(使整个区域有效并返回设备内容句柄)
                     hWndDc := BeginPaint(hWnd, PS);

                    // 取得当前窗体客户区范围,并在中间绘制文字 
                     GetClientRect(hWnd, Rect);
                     DrawText(hWndDc, 'Hello, Windows 98!', -1, Rect,
                       DT_SINGLELINE or DT_CENTER or DT_VCENTER);
                       
                    // 结束绘制(释放设备内容句柄)   
                     EndPaint(hWnd, PS);
                   end;
                   
    WM_DESTROY  :  PostQuitMessage(0); // 放置WM_QUIT导致GetMessage返回FALSE

    else Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
  end;
end;

const
  AppName = 'HelloWin';
  
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
  hWnd := CreateWindow(AppName, 'The Hello Program',
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

 (* 书中判断RegisterClass()结果, 主要为了预见UniCode版函数在98调用失败 *)
end.
