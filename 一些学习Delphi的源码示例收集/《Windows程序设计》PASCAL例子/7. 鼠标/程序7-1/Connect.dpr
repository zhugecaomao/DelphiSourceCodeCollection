program  Connect;

uses
  Windows, Messages;

  // 窗体消息处理回调函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  MAXPOINTS = 1000;
 {$J+}
  Points: PPoint = nil;
  iCount: Integer = 0;
 {$J+}
var
  hWndDc: HDC;
  PS: TPaintStruct;
  I, J: Integer;
 // 返回TPoint数组成员地址子函数 
  function Pt(X: Integer): PPoint;
  begin
    Result := PPoint( DWORD(Points) + X * SizeOf(TPoint) );
  end;
begin
  Result := 0;
  case Msg of
    WM_CREATE: GetMem(Points, MAXPOINTS * SizeOf(TPoint)); // 申请数组空间

    WM_LBUTTONDOWN: begin
                      iCount := 0 ; // 清空
                      InvalidateRect(hWnd, nil, TRUE);
                    end;

    WM_MOUSEMOVE: begin        // 左键按下               // 数组未满
                    if (wParam and MK_LBUTTON <>0) and (iCount < 1000) then
                    begin
                     // 添加到数组
                      Pt(iCount)^.X := LOWORD(lParam);
                      Pt(iCount)^.Y := HIWORD(lParam);
                      iCount := iCount + 1;
                     // 绘制一个点
                      hWndDc := GetDC(hWnd);
                      SetPixel(hWndDc, LOWORD(lParam), HIWORD(lParam), 0);
                      ReleaseDC(hWnd, hWndDc);
                    end;
                  end;

    WM_LBUTTONUP: InvalidateRect(hWnd, nil, FALSE); // 产生WM_PAINT

    WM_PAINT:  begin
                 hWndDc := BeginPaint(hWnd, PS);
                 SetCursor(LoadCursor(0, IDC_WAIT));
                 ShowCursor(TRUE);

                 for I := 0 to iCount - 2 do
                   for J := I + 1 to iCount-1 do
                   begin
                     MoveToEx(hWndDc, Pt(I)^.X, Pt(I)^.Y, nil);
                     LineTo(hWndDc, Pt(J)^.X, Pt(J)^.Y);
                   end;

                 ShowCursor(FALSE);
                 SetCursor(LoadCursor(0, IDC_ARROW));
                 EndPaint(hWnd, PS) ;
               end;

    WM_DESTROY: begin
                  PostQuitMessage(0); // 跳出线程消息循环
                  FreeMem(Points, MAXPOINTS * SizeOf(TPoint));
                end;

    else Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
  end;
end;


const  
  AppName = 'Connect';

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
  hWnd := CreateWindow(AppName, 'Connect-the-Points Mouse Demo',
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
