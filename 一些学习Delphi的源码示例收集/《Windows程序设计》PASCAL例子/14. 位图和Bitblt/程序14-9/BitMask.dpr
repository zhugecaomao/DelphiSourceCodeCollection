program  BitMask;

{$R BitMask.res}

uses
  Windows, Messages;

   // 窗体消息处理函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  hBitmapImag: HBITMAP = 0;
  hBitmapMask: HBITMAP = 0;
  cxClient: Integer = 0;
  cyClient: Integer = 0;
  cxBitmap: Integer = 0;
  cyBitmap: Integer = 0;
{$J+}
var
  Bitmap: TBitmap;
  hdcWnd, hdcMemImag, hdcMemMask: HDC;
  x, y: Integer;
  ps: TPaintStruct;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      begin
       // 装入位图并取其尺寸
        hBitmapImag := LoadBitmap(hInstance, 'BitMask');
        GetObject(hBitmapImag, SizeOf(TBitmap), @Bitmap);
        cxBitmap := Bitmap.bmWidth;
        cyBitmap := Bitmap.bmHeight;

       // 建立 资源位图 内存设备环境
        hdcMemImag := CreateCompatibleDC(0); // 与显示器兼容
        SelectObject(hdcMemImag, hBitmapImag);

       // 建立 屏蔽位图 内存设备环境
        hBitmapMask := CreateBitmap(cxBitmap, cyBitmap, 1, 1, nil);
        hdcMemMask := CreateCompatibleDC(0); // 与显示器兼容
        SelectObject(hdcMemMask, hBitmapMask);

       // 一个黑色包围的椭圆
        SelectObject(hdcMemMask, GetStockObject(BLACK_BRUSH)); // 黑色(0)代表显示背景
        Rectangle(hdcMemMask, 0, 0, cxBitmap, cyBitmap);
        SelectObject(hdcMemMask, GetStockObject(WHITE_BRUSH)); // 白色(1)代表显示位图
        Ellipse(hdcMemMask, 0, 0, cxBitmap, cyBitmap);
        
       // 使(资源)位图四周变黑                                            
        BitBlt(hdcMemImag, 0, 0, cxBitmap, cyBitmap, hdcMemMask, 0, 0, SRCAND); // AND
        
        DeleteDC(hdcMemImag);
        DeleteDC(hdcMemMask);
      end;

    WM_SIZE:
      begin
        cxClient := LOWORD(lParam);
        cyClient := HIWORD(lParam);
      end;

    WM_PAINT:
      begin
        hdcWnd := BeginPaint(hWnd, ps);

       // 选入位图到内存设备
        hdcMemImag := CreateCompatibleDC(hdcWnd);
        SelectObject(hdcMemImag, hBitmapImag);
        hdcMemMask :=CreateCompatibleDC(hdcWnd);
        SelectObject(hdcMemMask, hBitmapMask);

       // 图像位置居中
        x := (cxClient - cxBitmap) div 2 ;
        y := (cyClient - cyBitmap) div 2 ;

       // 先画一个黑色的椭圆
        BitBlt(hdcWnd, x, y, cxBitmap, cyBitmap, hdcMemMask, 0, 0, $0220326); // (D and (not S))
       // 在椭圆部分显示位图
        BitBlt(hdcWnd, x, y, cxBitmap, cyBitmap, hdcMemImag, 0, 0, SRCPAINT); // or

        DeleteDC(hdcMemImag);
        DeleteDC(hdcMemMask);
        EndPaint(hwnd, ps);
      end;

    WM_DESTROY:
      begin
        DeleteObject(hBitmapImag);
        DeleteObject(hBitmapMask);
        PostQuitMessage(0); // 退出
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end;

const
  szAppName = 'BitMask';
var
  hWnd: LongWord;
  Msg: TMsg;
  WndClass: TWndClass;
begin
 // 注册窗体类
  WndClass.style := CS_HREDRAW or CS_VREDRAW;
  WndClass.lpfnWndProc := @WndProc;
  WndClass.cbClsExtra := 0;
  WndClass.cbWndExtra := 0;
  WndClass.hInstance := hInstance;
  WndClass.hIcon := LoadIcon(0, IDI_APPLICATION);
  WndClass.hCursor := LoadCursor(0, IDC_ARROW);
  WndClass.hbrBackground := GetStockObject(LTGRAY_BRUSH);
  WndClass.lpszMenuName := nil;
  WndClass.lpszClassName := szAppName;
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(szAppName, 'Bitmap Masking Demo',
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
