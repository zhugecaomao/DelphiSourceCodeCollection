program  Clover;

uses
  Windows, Messages, Math;

  // 窗体消息处理回调函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  TWO_PI = (2.0 * 3.1415926);
 {$J+}
  hRgnClip: HRGN = 0; // 合并后区域之句柄
  cxClient: Integer = 0;  // 窗体当前宽度
  cyClient: Integer = 0;  // 窗体当前高度
 {$J-}
var
  J: Integer;
  PS: TPaintStruct;
  hWndDC: HDC; // 设备内容句柄
  hCursor: LongWord; // 光标句柄
  hRgnTemp: array[0..5] of HRGN; // 临时区域之句柄
  fAngle, fRadius: Extended;  
begin
  Result := 0;
  case Msg of
    WM_SIZE:  begin
                cxClient := LOWORD(lParam);
                cyClient := HIWORD(lParam);

                hCursor := SetCursor(LoadCursor(0, IDC_WAIT));
                ShowCursor(TRUE);

                if (hRgnClip <> 0) then // 删除以前的区域对象
                begin
                  DeleteObject(hRgnClip);  hRgnClip := 0;
                end;
               // 生成4个椭圆区域
                hRgnTemp[0] := CreateEllipticRgn(0, cyClient div 3, cxClient div 2, 2 * cyClient div 3);
                hRgnTemp[1] := CreateEllipticRgn(cxClient div 2, cyClient div 3, cxClient, 2 * cyClient div 3);
                hRgnTemp[2] := CreateEllipticRgn(cxClient div 3, 0, 2 * cxClient div 3, cyClient div 2);
                hRgnTemp[3] := CreateEllipticRgn(cxClient div 3, cyClient div 2, 2 * cxClient div 3, cyClient);
               // 生成3个空的区域
                hRgnTemp[4] := CreateRectRgn(0, 0, 1, 1);
                hRgnTemp[5] := CreateRectRgn(0, 0, 1, 1);
                hRgnClip := CreateRectRgn(0, 0, 1, 1);
               // 合并区域
                CombineRgn(hRgnTemp[4], hRgnTemp[0], hRgnTemp[1], RGN_OR);
                CombineRgn(hRgnTemp[5], hRgnTemp[2], hRgnTemp[3], RGN_OR);
                CombineRgn(hRgnClip, hRgnTemp[4], hRgnTemp[5], RGN_XOR);
               // 删除所有临时区域
                for J := 0 to 5 do DeleteObject(hRgnTemp[J]);

                SetCursor(hCursor);
                ShowCursor(FALSE);
              end;

    WM_PAINT: begin
                hWndDc := BeginPaint(hWnd, PS); // 开始绘制

                SetViewportOrgEx(hWndDc, cxClient div 2, cyClient div 2, nil); // 原点
                SelectClipRgn(hWndDc, hRgnClip); // 设置剪裁区域(区域外不会被绘图)
                fRadius := Hypot(cxClient / 2.0, cyClient / 2.0);
                fAngle := 0;
                while (fAngle < TWO_PI) do  // 旋转一周
                begin
                  MoveToEx(hWndDc, 0, 0, nil);
                  LineTo(hWndDc, Trunc(fRadius*Cos(fAngle)+0.5), Trunc(-fRadius*Sin(fAngle)+0.5));
                  fAngle := fAngle + TWO_PI / 360;
                end;

                EndPaint(hWnd, PS); // 结束绘制
              end;

    WM_DESTROY: begin
                  DeleteObject(hRgnClip); // 删除区域对象
                  PostQuitMessage(0); // 退出消息循环
                end;

    else Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
  end;
end;


const  
  AppName = 'Clover';  // 窗体类名

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
    MessageBox(0, 'This Program requires Windows NT!', AppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(AppName, 'Draw a Clover',
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
