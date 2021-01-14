program Multi1;

uses
  Windows, Messages, Math;

var
  cyChar: Integer;

  // 当前行数, 到底部则返0
function CheckBottom(hWnd: HWND; cyClient, iLine: Integer): Integer;
begin
  if (iLine * cyChar + cyChar > cyClient) then
  begin
    InvalidateRect(hWnd, nil, TRUE); // 清空窗口..
    UpdateWindow(hWnd);
    iLine := 0;
  end;
  Result := iLine;
end;

  // Window 1: Display increasing sequence of numbers
function WndProc1(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  iNum: Integer = 0;
  iLine: Integer = 0;
  cyClient: Integer = 0;
{$J-}
var
  hWndDc: HDC;
  szBuffer: array[0..16] of Char;
begin
  Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理

  case (Msg) of
    WM_SIZE:
      begin
        cyClient := HIWORD(lParam);
      end;

    WM_TIMER:
      begin
        if (iNum < 0) then iNum := 0;
        iLine := CheckBottom(hWnd, cyClient, iLine);
        
        hWndDc := GetDC(hWnd);
        TextOut(hWndDc, 0, iLine * cyChar, szBuffer, wvsprintf(szBuffer, '%d', @iNum));
        ReleaseDC(hWnd, hWndDc);

        Inc(iNum);
        Inc(iLine);
      end;
  end;
end;

  // Window 2: Display increasing sequence of prime numbers
function WndProc2(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  iNum: Integer = 1;
  iLine: Integer = 0;
  cyClient: Integer = 0;
{$J-}
var
  hWndDc: HDC;
  i, iSqrt: Integer;
  szBuffer: array[0..16] of Char;
begin
  Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理

  case (Msg) of
    WM_SIZE:
      begin
        cyClient := HIWORD(lParam);
      end;

    WM_TIMER:
      begin
        repeat
          Inc(iNum);
          if (iNum < 0) then iNum := 0;
          iSqrt := Trunc(Sqrt(iNum));
          for i := 2 to iSqrt do if (iNum mod i = 0) then Break;
        until (i > iSqrt);

        iLine := CheckBottom(hWnd, cyClient, iLine);
        hWndDc := GetDC(hWnd);
        TextOut(hWndDc, 0, iLine * cyChar, szBuffer, wvsprintf(szBuffer, '%d', @iNum));
        ReleaseDC(hWnd, hWndDc);
        
        Inc(iLine);
      end;
  end;
end;

  // Window 3: Display increasing sequence of Fibonacci numbers
function WndProc3(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  iNum: Integer = 0;
  iNext: Integer = 1;
  iLine: Integer = 0;
  cyClient: Integer = 0;
{$J-}
var
  hWndDc: HDC;
  iTemp: Integer;
  szBuffer: array[0..16] of Char;
begin
  Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  
  case (Msg) of
    WM_SIZE:
      begin
        cyClient := HIWORD(lParam);
      end;

    WM_TIMER:
      begin
        if (iNum < 0) then
        begin
          iNum := 0;
          iNext := 1;
        end;
        iLine := CheckBottom(hWnd, cyClient, iLine);

        hWndDc := GetDC(hWnd);
        TextOut(hWndDc, 0, iLine * cyChar, szBuffer, wvsprintf(szBuffer, '%d', @iNum));
        ReleaseDC(hWnd, hWndDc);
        
        iTemp := iNum;
        iNum := iNext;
        Inc(iNext, iTemp);
        Inc(iLine);
      end;
  end;
end;

  // Window 4: Display circles of random radii
function WndProc4(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  cxClient: Integer = 0;
  cyClient: Integer = 0;
{$J-}
var
  hWndDc: HDC;
  iDiameter: Integer;
begin
  Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理

  case (Msg) of
    WM_SIZE:
      begin
        cxClient := LOWORD(lParam);
        cyClient := HIWORD(lParam);
      end;

    WM_TIMER:
      begin
        InvalidateRect(hWnd, nil, TRUE);
        UpdateWindow(hWnd);

        iDiameter := Random(Max(1, Min(cxClient, cyClient)));
        
        hWndDc := GetDC(hWnd);
        Ellipse(hWndDc, (cxClient - iDiameter) div 2, (cyClient - iDiameter) div 2,
          (cxClient + iDiameter) div 2, (cyClient + iDiameter) div 2);
        ReleaseDC(hWnd, hWndDc);
      end;
  end;
end;

  // 主窗体消息处理回调函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  hWndChild: array[0..3] of LongWord = (0, 0, 0, 0);
{$J-}
  szChildClass: array[0..3] of PChar = ( 'Child1', 'Child2', 'Child3', 'Child4' );
  ChildProc: array[0..3] of Pointer = ( @WndProc1, @WndProc2, @WndProc3, @WndProc4 );
var                                           
  i, cxClient, cyClient: Integer;
  WndClass: TWndClass;
begin
  Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  
  case Msg of
    WM_CREATE:
      begin                                      
        WndClass.style := CS_HREDRAW or CS_VREDRAW;
        WndClass.cbClsExtra := 0;
        WndClass.cbWndExtra := 0;
        WndClass.hInstance := hInstance;
        WndClass.hIcon := 0;
        WndClass.hCursor := LoadCursor (0, IDC_ARROW);
        WndClass.hbrBackground := GetStockObject(WHITE_BRUSH);
        WndClass.lpszMenuName := nil;

        for i := 0 to 3 do
        begin
          WndClass.lpfnWndProc := ChildProc[i];
          WndClass.lpszClassName := szChildClass[i];
          RegisterClass(WndClass);
          
          hWndChild[i] := CreateWindow(szChildClass[i], nil,
            WS_CHILDWINDOW or WS_BORDER or WS_VISIBLE,
            0, 0, 0, 0, hWnd, i, hInstance, nil);
        end;

        cyChar := HIWORD(GetDialogBaseUnits());
        SetTimer(hWnd, 1, 10, nil);
      end;

    WM_SIZE:
      begin
        cxClient := LOWORD(lParam);
        cyClient := HIWORD(lParam);
        for i := 0 to 3 do
          MoveWindow(hWndChild[i], (i mod 2) * cxClient div 2,
            IfThen(i > 1, 1, 0) * cyClient div 2, cxClient div 2, cyClient div 2, TRUE);
      end;

    WM_TIMER:
      begin
        for i := 0 to 3 do
          SendMessage(hWndChild[i], WM_TIMER, wParam, lParam);
      end;

    WM_CHAR:
      begin
        if (wParam = $1B) then DestroyWindow(hWnd);
      end;

    WM_DESTROY:
      begin
        KillTimer(hWnd, 1); // 删除定时器
        PostQuitMessage(0); // 跳出循环
      end;
  end;
end;

const
  szAppName = 'Multi1';
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
  hWnd := CreateWindow(szAppName, 'Multitasking Demo',
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
