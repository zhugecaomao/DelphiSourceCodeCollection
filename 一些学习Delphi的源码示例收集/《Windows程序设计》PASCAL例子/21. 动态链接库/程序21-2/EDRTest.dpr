program  EDRTest;

uses
  Windows, Messages;

function EdrCenterText(hdc: HDC; prc: PRect; pString: PChar): BOOL; stdcall;
  external '..\程序21-1\EDRLib.dll' name 'EdrCenterTextA';

   // 窗体消息处理过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  hWndDc: HDC;
  ps: TPaintStruct;
  Rect: TRect;
begin
  Result := 0;
  case (Msg) of
    WM_PAINT:
      begin
        hWndDc := BeginPaint(hWnd, ps);
        GetClientRect(hWnd, Rect);
        EdrCenterText(hWndDc, @Rect, 'This string was displayed by a DLL'); // 调用
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
  szAppName = 'EDRTest';
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
  hWnd := CreateWindow(szAppName, 'DLL Demonstration Program',
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

(* 注: 作为演示,本例只调用Ansi版的绘制函数. *)  
end.
