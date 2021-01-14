program  Grays1;

uses
  Windows, Messages, Math;

   // 窗体消息处理函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  cxClient: Integer = 0;
  cyClient: Integer = 0;
{$J-}  
var
  hBrush: DWORD;
  hWndDc: HDC;
  i: Integer;
  ps: TPaintStruct;
  Rect: TRect;
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
       hWndDc := BeginPaint(hWnd, ps);
       for i := 0 to 64 do
       begin
         Rect.Left := i * cxClient div 65;
         Rect.Top := 0 ;
         Rect.Right := (i + 1) * cxClient div 65;
         Rect.Bottom := cyClient;
         hBrush := CreateSolidBrush(RGB(Min(255, 4 * i), Min(255, 4 * i), Min(255, 4 * i)));
         FillRect(hWndDc, Rect, hBrush);
         DeleteObject(hBrush);
       end;
       EndPaint(hWnd, ps);
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0); // 退出
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end;

const
  szAppName = 'Grays1';
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
  WndClass.hbrBackground := GetStockObject(WHITE_BRUSH);
  WndClass.lpszMenuName := nil;
  WndClass.lpszClassName := szAppName;
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(szAppName, 'Shades of Gray #1',
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
