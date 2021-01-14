program  Checker4;

uses
  Windows, Messages, Math;

const
  ChildClass = 'Checker4_Child'; // 子窗体类名

var
  idFocus: Integer = 0; // 当前焦点子控件ID

  // 主窗体消息处理回调函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  DIVISIONS = 5;
 {$J+}
  hWndChild: array[0..DIVISIONS-1] of array [0..DIVISIONS-1] of DWORD = // 子窗口句柄数组
   ( (0, 0, 0, 0, 0), (0, 0, 0, 0, 0), (0, 0, 0, 0, 0), (0, 0, 0, 0, 0), (0, 0, 0, 0, 0) );
 {$J+}
var
  cxBlock, cyBlock, X, Y: Integer;
begin
  Result := 0;

  case Msg of
    WM_CREATE:
        for X := 0 to DIVISIONS - 1 do // 建立子窗口
          for Y := 0 to DIVISIONS - 1 do
            hWndChild[X][Y] := CreateWindow(ChildClass, nil, WS_CHILD or WS_VISIBLE,
                                    0, 0, 0, 0, hWnd, Y shl 8 or X, hInstance, nil);

    WM_SIZE:
      begin  // 重设各子窗口位置和大小
        cxBlock := LOWORD(lParam) div DIVISIONS;
        cyBlock := HIWORD(lParam) div DIVISIONS;
        for X := 0 to DIVISIONS - 1 do
          for Y := 0 to DIVISIONS - 1 do
            MoveWindow(hwndChild[X][Y], X * cxBlock, Y * cyBlock, cxBlock, cyBlock, TRUE);
      end;

    WM_LBUTTONDOWN:
      MessageBeep(0); // 超出范围则鸣笛

    WM_SETFOCUS:
      SetFocus(GetDlgItem(hWnd, idFocus)); // 转交焦点到子窗口

    WM_KEYDOWN: // 按键消息是子控件转发来的
      begin
       // 当前焦点
        X := idFocus and $FF;
        Y := idFocus shr 8;
       // 调整位置
        case wParam of
          VK_UP   : Dec(Y);
          VK_DOWN : Inc(Y);
          VK_LEFT : Dec(X);
          VK_RIGHT: Inc(X);
          VK_HOME : begin X := 0;  Y := 0 ;  end;
          VK_END  : begin X := DIVISIONS - 1;  Y := DIVISIONS - 1; end;
          else Exit;
        end;
       // 重设焦点
        X := (X + DIVISIONS) mod DIVISIONS;
        Y := (Y + DIVISIONS) mod DIVISIONS;
        idFocus := Y shl 8 or X;
        SetFocus(GetDlgItem(hWnd, idFocus)); // SetFocus(hWndChild[X][Y]);
      end;

    WM_DESTROY:
      PostQuitMessage(0); // 跳出消息循环
      
    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
  end;  //  END 'case Msg of'  ...
end;
       
  // 子窗体消息处理回调函数
function ChildWndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  hWndDc: HDC;
  PS: TPaintStruct;
  Rect: TRect;
begin
  Result := 0;
  case Msg of
   // WM_CREATE:
     // SetWindowLong(hWnd, 0	, 0);
   (* 注意: Windows会自动将窗体实例附加空间中各字节初始化为0 *)

    WM_KEYDOWN:
      begin
        if (wParam <> VK_RETURN) and (wParam <> VK_SPACE) then
          SendMessage(GetParent(hWnd), Msg, wParam, lParam) // 转发按键消息
        else
        begin
          SetWindowLong(hWnd, 0 , 1 xor GetWindowLong(hWnd, 0)); // 标志取反
          InvalidateRect(hWnd, nil, FALSE); // 刷新
        end;
      end;

    WM_LBUTTONDOWN:
      begin
        SetWindowLong(hWnd, 0 , 1 xor GetWindowLong(hWnd, 0)); // 标志取反
        SetFocus(hWnd);
        InvalidateRect(hWnd, nil, FALSE); // 刷新
      end;

    WM_SETFOCUS:
      begin
        InvalidateRect(hWnd, nil, TRUE);      
        idFocus := GetWindowLong(hWnd, GWL_ID);
      end;

    WM_KILLFOCUS:
      InvalidateRect(hWnd, nil, TRUE);

    WM_PAINT:
      begin
        hWndDc := BeginPaint(hWnd, PS);

        GetClientRect(hWnd, Rect);
        Rectangle(hWndDc, 0, 0, Rect.Right, Rect.Bottom); // 画边框
        if (GetWindowLong(hWnd, 0) <> 0) then // 画叉叉
        begin
          MoveToEx(hWndDc, 0, 0, nil) ;
          LineTo(hWndDc, Rect.Right, Rect.Bottom);
          MoveToEx(hWndDc, 0, Rect.Bottom, nil);
          LineTo(hWndDc, Rect.Right, 0);
        end;

        if (hWnd = GetFocus) then // 虚线框
        begin
          Rect.Left := Rect.Left + Rect.Right div 10;
          Rect.Right := Rect.Right - Rect.Left;
          Rect.Top := Rect.Top + Rect.Bottom div 10;
          Rect.Bottom := Rect.Bottom - Rect.Top;
          SelectObject(hWndDc, GetStockObject(NULL_BRUSH));
          SelectObject(hWndDc, CreatePen(PS_DASH, 0, 0));
          Rectangle(hWndDc, Rect.Left, Rect.Top, Rect.Right, Rect.Bottom);
          DeleteObject(SelectObject(hWndDc, GetStockObject(BLACK_PEN)));
        end;

        EndPaint(hWnd, PS);
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
  end;
end; 

const
  AppName = 'Checker4';   
var
  hWnd: LongWord;
  Msg: TMsg;
  WndClass: TWndClass;         
begin
 // 填充主窗体类结构
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

 // 注册主窗体窗体类
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'Program requires Windows NT!', AppName, MB_ICONERROR);
    Exit;
  end;

 // 填充子窗体类结构
  WndClass.lpfnWndProc := @ChildWndProc;
  WndClass.cbWndExtra := SizeOf(DWORD); // 额外窗体内存空间尺寸
  WndClass.hIcon := 0;
  WndClass.lpszClassName := ChildClass;

 // 注册子窗体窗体类
  RegisterClass(WndClass); 

 // 建立主窗体
  hWnd := CreateWindow(AppName, 'Checker4 Mouse Hit-Test Demo',
                       WS_OVERLAPPEDWINDOW,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       0, 0, hInstance, nil);

 // 显示主窗体
  ShowWindow(hWnd, CmdShow);
  UpdateWindow(hWnd);
  
 // 消息循环
  while GetMessage(Msg, 0, 0, 0) do
  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end.
