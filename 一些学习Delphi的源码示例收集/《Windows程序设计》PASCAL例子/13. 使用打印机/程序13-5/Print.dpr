program  Print;

uses
  Windows, Messages, Print1 in 'Print1.Pas',
  GetPrnDC in '..\程序13-1\GetPrnDC.pas';    

  // 窗体回调函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  cxClient: Integer = 0;
  cyClient: Integer = 0;
{$J-}
var
  hWndDc: HDC;
  hMenu: DWORD;
  Ps: TPaintStruct;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      begin
        hMenu := GetSystemMenu(hWnd, FALSE);
        AppendMenu(hMenu, MF_SEPARATOR, 0, nil);
        AppendMenu(hMenu, 0, 1, '&Print');
      end;

    WM_SIZE:
      begin
        cxClient := LOWORD(lParam);
        cyClient := HIWORD(lParam);
      end;

    WM_SYSCOMMAND:
      begin
        if (wParam = 1) then
        begin
          if (not PrintMyPage(hWnd)) then
            MessageBox(hWnd, 'Could not print page!', szAppName, MB_OK or MB_ICONEXCLAMATION);
        end else
        begin
          Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
        end;
      end;

    WM_PAINT:
      begin
        hWndDc := BeginPaint(hWnd, Ps);
        PageGDICalls(hWndDc, cxClient, cyClient);
        EndPaint(hWnd, Ps);
      end;

    WM_DESTROY:
      PostQuitMessage(0);

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
  end;
end;

var
  hWnd: LongWord;   // 窗体句柄
  Msg: TMsg;        // 消息结构
  WndClass: TWndClass; // 类结构
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
  hWnd := CreateWindow(szAppName, szCaption,
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
