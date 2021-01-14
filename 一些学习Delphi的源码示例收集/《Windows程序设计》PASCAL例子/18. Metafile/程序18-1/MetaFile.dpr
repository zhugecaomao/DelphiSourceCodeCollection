program  MetaFile;

uses
  Windows, Messages;

   // 窗体消息处理过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  hmf: HMetaFile = 0;
  cxClient: Integer = 0;
  cyClient: Integer = 0;
{$J-}
var
  hBrush: LongWord; // HBRUSH
  hdcWnd, hdcMeta: HDC;
  x, y: Integer;
  ps: TPaintStruct;
begin
  Result := 0;
 // 区分不同的消息
  case Msg of
    WM_CREATE:
      begin
        hdcMeta := CreateMetaFile(nil);
        hBrush := CreateSolidBrush(RGB(0, 0, 255));

        Rectangle(hdcMeta, 0, 0, 100, 100);

        MoveToEx(hdcMeta, 0, 0, nil);
        LineTo(hdcMeta, 100, 100);
        MoveToEx(hdcMeta, 0, 100, nil);
        LineTo(hdcMeta, 100, 0);

        SelectObject(hdcMeta, hBrush);
        Ellipse(hdcMeta, 20, 20, 80, 80);

        hmf := CloseMetaFile(hdcMeta);        
        DeleteObject(hBrush);
      end;

    WM_SIZE:
      begin
        cxClient := LOWORD(lParam);
        cyClient := HIWORD(lParam);
      end;

    WM_PAINT:
      begin
        hdcWnd := BeginPaint(hWnd, ps);

        SetMapMode(hdcWnd, MM_ANISOTROPIC);
        SetWindowExtEx(hdcWnd, 1000, 1000, nil);
        SetViewportExtEx(hdcWnd, cxClient, cyClient, nil);
        for x := 0 to 9 do
          for y := 0 to 9 do
          begin
            SetWindowOrgEx(hdcWnd, -100 * x, -100 * y, nil); // 修改原点
            PlayMetaFile(hdcWnd, hmf);
          end;

        EndPaint(hWnd, ps);
      end;


    WM_DESTROY:
      begin
        PostQuitMessage(0); // 退出
        DeleteMetaFile(hmf);
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end; 

  
const
  szAppName = 'MetaFile';

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
  WndClass.lpszClassName := szAppName;

 // 注册窗体类
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(szAppName, 'MetaFile Demonstration',
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
