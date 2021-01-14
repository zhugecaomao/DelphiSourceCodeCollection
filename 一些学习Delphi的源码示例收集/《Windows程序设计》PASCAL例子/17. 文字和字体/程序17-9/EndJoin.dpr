program  EndJoin;

uses
  Windows, Messages;

  // 窗体过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  iEnd: array[0..2] of Integer = ( PS_ENDCAP_ROUND, PS_ENDCAP_SQUARE, PS_ENDCAP_FLAT );
  iJoin: array[0..2] of Integer = ( PS_JOIN_ROUND, PS_JOIN_BEVEL, PS_JOIN_MITER );
  cxClient: Integer = 0;
  cyClient: Integer = 0;
{$J-}
var
  hdcWnd: HDC;
  I: Integer;
  lb: TLogBrush;
  ps: TPaintStruct;
begin
  Result := 0;
  case Msg of
    WM_SIZE:
      begin
        cxClient := LOWORD(lParam);
        cyClient := HIWORD(lParam);
      end;

    WM_PAINT:
      begin
        hdcWnd := BeginPaint(hWnd, ps);

        SetMapMode(hdcWnd, MM_ANISOTROPIC);
        SetWindowExtEx(hdcWnd, 100, 100, nil);
        SetViewportExtEx(hdcWnd, cxClient, cyClient, nil);
        
        lb.lbStyle := BS_SOLID;
        lb.lbColor := RGB(128, 128, 128);
        lb.lbHatch := 0;
        
        for i := 0 to 2 do
        begin
          SelectObject(hdcWnd, ExtCreatePen(PS_SOLID or
            PS_GEOMETRIC or iEnd[i] or iJoin[i], 10, lb, 0, nil));

          BeginPath(hdcWnd);
          MoveToEx(hdcWnd, 10 + 30 * i, 25, nil);
          LineTo(hdcWnd, 20 + 30 * i, 75);
          LineTo(hdcWnd, 30 + 30 * i, 25);
          EndPath(hdcWnd);
          StrokePath(hdcWnd);

          DeleteObject(SelectObject(hdcWnd, GetStockObject(BLACK_PEN)));
          MoveToEx(hdcWnd, 10 + 30 * i, 25, nil);
          LineTo(hdcWnd, 20 + 30 * i, 75);
          LineTo(hdcWnd, 30 + 30 * i, 25);
        end;

        EndPaint(hWnd, ps);
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0); // 放一个退出消息WM_QUIT
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end; 

const
  szAppName = 'EndJoin';
  
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
  hWnd := CreateWindow(szAppName, 'Ends and Joins Demo',
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
