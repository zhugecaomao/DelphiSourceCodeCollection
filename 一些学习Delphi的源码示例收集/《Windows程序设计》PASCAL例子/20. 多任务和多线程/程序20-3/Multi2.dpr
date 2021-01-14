program Multi2;

uses
  Windows, Messages, Math;  

type
  PParams = ^TParams;
  TParams = record
    hWnd: LongWord; // 句柄
    cxClient: Integer;
    cyClient: Integer;
    cyChar: Integer;
    bKill: Boolean;
  end;

  // 当前行数, 到底部则返0
function CheckBottom(hWnd: HWND; cyClient, cyChar, iLine: Integer): Integer;
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
function Thread1(ParamsPt: PParams): DWORD; stdcall;
var
  hWndDc: HDC;
  iNum: Integer;
  iLine: Integer;
  szBuffer: array[0..16] of Char;
begin
  iNum := 0;
  iLine := 0;
  while (ParamsPt.bKill = FALSE) do
  begin
    if (iNum < 0) then iNum := 0;
    iLine := CheckBottom(ParamsPt.hWnd, ParamsPt.cyClient, ParamsPt.cyChar, iLine);

    hWndDc := GetDC(ParamsPt.hWnd);
    TextOut(hWndDc, 0, iLine * ParamsPt.cyChar, szBuffer, wvsprintf(szBuffer, '%d', @iNum));
    ReleaseDC(ParamsPt.hWnd, hWndDc);

    Inc(iNum);
    Inc(iLine); 
    Sleep(50);
  end;
  ExitThread(0);
end;

  // Window 1: Display increasing sequence of numbers
function WndProc1(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  Params: TParams = ();
{$J-}
begin
  Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理

  case (Msg) of
    WM_CREATE:
      begin
        Params.hWnd := hWnd;
        Params.cyChar := HIWORD(GetDialogBaseUnits());
        Params.bKill := FALSE;
        CreateThread(nil, 0, @Thread1, @Params, 0, Msg);
      end;

    WM_SIZE:
      begin
        Params.cyClient := HIWORD(lParam);
      end;

    WM_DESTROY:
      begin
        Params.bKill := TRUE;
      end;
  end;
end;

  // Window 2: Display increasing sequence of prime numbers
function Thread2(ParamsPt: PParams): DWORD; stdcall;
var
  hWndDc: HDC;
  iNum, iLine, i, iSqrt: Integer;
  szBuffer: array[0..16] of Char;
begin
  iNum := 1;
  iLine := 0;
  
  while (ParamsPt.bKill = FALSE) do
  begin
    repeat
      Inc(iNum);
      if (iNum < 0) then iNum := 0;
      iSqrt := Trunc(Sqrt(iNum));
      for i := 2 to iSqrt do if (iNum mod i = 0) then Break;
    until (i > iSqrt);

    iLine := CheckBottom(ParamsPt.hWnd, ParamsPt.cyClient, ParamsPt.cyChar, iLine);

    hWndDc := GetDC(ParamsPt.hWnd);
    TextOut(hWndDc, 0, iLine * ParamsPt.cyChar, szBuffer, wvsprintf(szBuffer, '%d', @iNum));
    ReleaseDC(ParamsPt.hWnd, hWndDc);

    Inc(iLine);
    Sleep(50);
  end;
  
  ExitThread(0);
end;

  // Window 2: Display increasing sequence of prime numbers
function WndProc2(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  Params: TParams = ();
{$J-}
begin
  Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理

  case (Msg) of
    WM_CREATE:
      begin
        Params.hWnd := hWnd;
        Params.cyChar := HIWORD(GetDialogBaseUnits());
        Params.bKill := FALSE;        
        CreateThread(nil, 0, @Thread2, @Params, 0, Msg);
      end;

    WM_SIZE:
      begin
        Params.cyClient := HIWORD(lParam);
      end;

    WM_DESTROY:
      begin
        Params.bKill := TRUE;
      end;
  end;
end;

  // Window 3: Display increasing sequence of Fibonacci numbers
function Thread3(ParamsPt: PParams): DWORD; stdcall;
var
  hWndDc: HDC;
  iNum, iNext, iLine, iTemp: Integer;
  szBuffer: array[0..16] of Char;
begin
  iNum := 0;
  iNext := 1;
  iLine := 0;

  while (ParamsPt.bKill = FALSE) do
  begin
    if (iNum < 0) then
    begin
      iNum := 0;
      iNext := 1;
    end;
    iLine := CheckBottom(ParamsPt.hWnd, ParamsPt.cyClient, ParamsPt.cyChar, iLine);

    hWndDc := GetDC(ParamsPt.hWnd);
    TextOut(hWndDc, 0, iLine * ParamsPt.cyChar, szBuffer, wvsprintf(szBuffer, '%d', @iNum));
    ReleaseDC(ParamsPt.hWnd, hWndDc);
    
    iTemp := iNum;
    iNum := iNext;
    Inc(iNext, iTemp);
    Inc(iLine);
    Sleep(50);
  end;
  
  ExitThread(0);
end;

  // Window 3: Display increasing sequence of Fibonacci numbers
function WndProc3(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  Params: TParams = ();
{$J-}
begin
  Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  
  case (Msg) of
    WM_CREATE:
      begin
        Params.hWnd := hWnd;
        Params.cyChar := HIWORD(GetDialogBaseUnits());
        Params.bKill := FALSE;        
        CreateThread(nil, 0, @Thread3, @Params, 0, Msg);
      end;

    WM_SIZE:
      begin
        Params.cyClient := HIWORD(lParam);
      end;

    WM_DESTROY:
      begin
        Params.bKill := TRUE;
      end;
  end;
end;

// Window 4: Display circles of random radii
function Thread4(ParamsPt: PParams): DWORD; stdcall;
var
  hWndDc: HDC;
  iDiameter: Integer;
begin
  while (ParamsPt.bKill = FALSE) do
  begin
    InvalidateRect(ParamsPt.hWnd, nil, TRUE);
    UpdateWindow(ParamsPt.hWnd);

    iDiameter := Random(Max(1, Min(ParamsPt.cxClient, ParamsPt.cyClient)));

    hWndDc := GetDC(ParamsPt.hWnd);
    Ellipse(hWndDc,
      (ParamsPt.cxClient - iDiameter) div 2,
      (ParamsPt.cyClient - iDiameter) div 2,
      (ParamsPt.cxClient + iDiameter) div 2,
      (ParamsPt.cyClient + iDiameter) div 2);
    ReleaseDC(ParamsPt.hWnd, hWndDc);

    Sleep(50);    
  end;
  
  ExitThread(0);
end;

  // Window 4: Display circles of random radii
function WndProc4(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  Params: TParams = ();
{$J-}
begin
  Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  
  case (Msg) of
    WM_CREATE:
      begin
        Params.hWnd := hWnd;
        Params.cyChar := HIWORD(GetDialogBaseUnits());
        Params.bKill := FALSE;        
        CreateThread(nil, 0, @Thread4, @Params, 0, Msg);
      end;

    WM_SIZE:
      begin
        Params.cxClient := LOWORD(lParam);
        Params.cyClient := HIWORD(lParam);
      end;

    WM_DESTROY:
      begin
        Params.bKill := TRUE;
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
      end;

    WM_SIZE:
      begin
        cxClient := LOWORD(lParam);
        cyClient := HIWORD(lParam);
        for i := 0 to 3 do
          MoveWindow(hWndChild[i], (i mod 2) * cxClient div 2,
            IfThen(i > 1, 1, 0) * cyClient div 2, cxClient div 2, cyClient div 2, TRUE);
      end;
      
    WM_CHAR:
      begin
        if (wParam = $1B) then DestroyWindow(hWnd);
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0); // 跳出消息循环
      end;
  end;
end;

const
  szAppName = 'Multi2';
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
