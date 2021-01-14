program MDIDemo;

{$R MDIDemo.Res}

uses
  Windows, Messages, Math;

type
  PHelloData = ^HelloData;
  HelloData = record // structure for storing data unique to each Hello child window
    iColor: UINT;
    clrText: COLORREF;
  end;

  PRectData = ^RectData;
  RectData = record // structure for storing data unique to each Rect child window
    cxClient: SHORT;
    cyClient: SHORT;
  end;
  
const
  szAppName = 'MDIDemo';
  szFrameClass = 'MdiFrame';
  szHelloClass = 'MdiHelloChild';
  szRectClass  = 'MdiRectChild';
  HEAP_NO_SERIALIZE          = $00000001; // API函数常量..
  HEAP_GROWABLE              = $00000002;
  HEAP_GENERATE_EXCEPTIONS   = $00000004;
  HEAP_ZERO_MEMORY           = $00000008;
  HEAP_REALLOC_IN_PLACE_ONLY = $00000010;
  IDM_FILE_NEWHELLO   = 40001; // 命令ID ..
  IDM_FILE_NEWRECT    = 40002;
  IDM_APP_EXIT        = 40003;
  IDM_FILE_CLOSE      = 40004;
  IDM_COLOR_BLACK     = 40005;
  IDM_COLOR_RED       = 40006;
  IDM_COLOR_GREEN     = 40007;
  IDM_COLOR_BLUE      = 40008;
  IDM_COLOR_WHITE     = 40009;
  IDM_WINDOW_CASCADE  = 40010;
  IDM_WINDOW_TILE     = 40011;
  IDM_WINDOW_ARRANGE  = 40012;
  IDM_WINDOW_CLOSEALL = 40013;
  INIT_MENU_POS  = 0; // Windows子菜单位置..
  HELLO_MENU_POS = 2;
  RECT_MENU_POS  = 1;
  IDM_FIRSTCHILD = 50000; // 与列表中的第一个窗口相关联的菜单ID
  
var
  hMenuInit, hMenuHello, hMenuRect: HMENU;
  hMenuInitWindow, hMenuHelloWindow, hMenuRectWindow: HMENU;

  // 子窗体枚举回调函数(用于关闭子窗体)
function CloseEnumProc(hWnd: HWND; lParam: LPARAM): BOOL; stdcall;
begin
  Result := TRUE; // 继续枚举
  if (GetWindow(hWnd, GW_OWNER) <> 0) then Exit; // Check for icon title 
  SendMessage(GetParent(hWnd), WM_MDIRESTORE, hWnd, 0);
  if (SendMessage(hWnd, WM_QUERYENDSESSION, 0, 0) = 0) then Exit;
  SendMessage(GetParent(hWnd), WM_MDIDESTROY, hWnd, 0);
end;
  
  // 主框架窗口消息处理回调函数
function FrameWndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  hWndClient: LongWord = 0; // 客户窗口句柄
{$J-}
var
  ClientCreate: TClientCreateStruct; // 客户窗体结构
  hWndChild: LongWord; // MDI子窗口句柄
  MDICreate: TMDICreateStruct; // MDI子窗口结构
begin     
  Result := 0;
  case (Msg) of
    WM_CREATE:
      begin // 为自己建立客户窗口
        ClientCreate.hWindowMenu := hMenuInitWindow; // 要加入列表的菜单
        ClientCreate.idFirstChild := IDM_FIRSTCHILD; // 与列表中的第一个窗口相关联的菜单ID
        hWndClient := CreateWindow('MDICLIENT', nil,
          WS_CHILD or WS_CLIPCHILDREN or WS_VISIBLE,
          0, 0, 0, 0, hWnd, 1, hInstance, @ClientCreate);
      end;

    WM_COMMAND: // 菜单(or快捷键命令)
      begin
        case LOWORD(wParam) of
          IDM_FILE_NEWHELLO:  // 建立Hello子窗口
            begin
              MDICreate.szClass := szHelloClass;
              MDICreate.szTitle := 'Hello';
              MDICreate.hOwner := hInstance;
              MDICreate.x := Integer(CW_USEDEFAULT);
              MDICreate.y := Integer(CW_USEDEFAULT);
              MDICreate.cx := Integer(CW_USEDEFAULT);
              MDICreate.cy := Integer(CW_USEDEFAULT);
              MDICreate.style := 0;
              MDICreate.lParam := 0;
              hWndChild :=
                SendMessage(hWndClient, WM_MDICREATE, 0, LongInt(@MDICreate));
            end;

          IDM_FILE_NEWRECT: // 建立Rect子窗口
            begin
              MDICreate.szClass := szRectClass ;
              MDICreate.szTitle := 'Rectangles';
              MDICreate.hOwner := hInstance;
              MDICreate.x := Integer(CW_USEDEFAULT);
              MDICreate.y := Integer(CW_USEDEFAULT);
              MDICreate.cx := Integer(CW_USEDEFAULT);
              MDICreate.cy := Integer(CW_USEDEFAULT);
              MDICreate.style := 0;
              MDICreate.lParam := 0;
              hWndChild :=
                SendMessage(hWndClient, WM_MDICREATE, 0, LongInt(@MDICreate));
            end;

          IDM_FILE_CLOSE: // 关闭活动子窗口
            begin
              hWndChild := SendMessage(hWndClient, WM_MDIGETACTIVE, 0, 0); // 取活动子窗口
              if (SendMessage(hWndChild, WM_QUERYENDSESSION, 0, 0) <> 0) then //询问是否可以关闭
                SendMessage(hWndClient, WM_MDIDESTROY, hWndChild, 0); // 关闭
            end;

          IDM_APP_EXIT: // 退出程序
            begin
              SendMessage(hWnd, WM_CLOSE, 0, 0); // 关闭自身
            end;

          IDM_WINDOW_TILE: // 排列方式..
            begin
              SendMessage(hWndClient, WM_MDITILE, 0, 0);
            end;

          IDM_WINDOW_CASCADE:
            begin
              SendMessage(hWndClient, WM_MDICASCADE, 0, 0);
            end;

          IDM_WINDOW_ARRANGE:
            begin
              SendMessage(hWndClient, WM_MDIICONARRANGE, 0, 0);
            end;

          IDM_WINDOW_CLOSEALL: // 关闭所有子窗体
            begin
              EnumChildWindows(hWndClient, @CloseEnumProc, 0); // 遍历关闭
            end;

          else
            begin // 传递WM_COMMAND消息到活动的子窗体
              hWndChild := SendMessage(hWndClient, WM_MDIGETACTIVE, 0, 0);
              if IsWindow(hWndChild) then SendMessage(hWndChild, WM_COMMAND, wParam, lParam);
              Result := DefFrameProc(hWnd, hWndClient, Msg, wParam, lParam);
            end;
        end;
      end;

    WM_QUERYENDSESSION,
    WM_CLOSE:
      begin
        SendMessage(hWnd, WM_COMMAND, IDM_WINDOW_CLOSEALL, 0); // 关闭所有子窗体
        if (GetWindow(hWndClient, GW_CHILD) <> 0) then
          Exit // 仍有子窗体, 则不调用DefFrameProc(), 以阻止关闭..
        else
          Result := DefFrameProc(hWnd, hWndClient, Msg, wParam, lParam);
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0); // 向当前线程的消息队列放一个WM_QUIT
      end;

    else
      begin
        Result := DefFrameProc(hWnd, hWndClient, Msg, wParam, lParam); // 标准框架消息处理
      end;
  end;
end;

  // Hello子窗体消息处理回调函数
function HelloWndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  clrTextArray: array[0..4] of COLORREF = // RGB(x, y, z) -> $0 z y x
    ( $000000, $0000FF, $00FF00, $FF0000, $FFFFFF );
{$J+}
  hWndClient: LongWord = 0;
  hWndFrame: LongWord = 0;
{$J+}
var
  hWndDc: HDC;
  hMenu: LongWord; // HMENU
  HelloDataPt: PHelloData;
  ps: TPaintStruct;
  Rect: TRect;
begin
  Result := 0;
  case (Msg) of
    WM_CREATE:
      begin
       // 默认堆上分配结构内存,初始化,并保存指针于窗口额外内存
        HelloDataPt := HeapAlloc(GetProcessHeap(), HEAP_ZERO_MEMORY, SizeOf(HelloData));
        HelloDataPt.iColor := IDM_COLOR_BLACK;
        HelloDataPt.clrText := 0; // RGB(0, 0, 0)
        SetWindowLong(hWnd, 0, LongWord(HelloDataPt));

       // 保存框架窗口和客户窗口句柄
        hWndClient := GetParent(hWnd);
        hWndFrame := GetParent(hWndClient);
      end;

    WM_COMMAND:
      begin
        case wParam of
          IDM_COLOR_BLACK,
          IDM_COLOR_RED,
          IDM_COLOR_GREEN,
          IDM_COLOR_BLUE,
          IDM_COLOR_WHITE:
            begin
              HelloDataPt := PHelloData(GetWindowLong(hWnd, 0)); // 数据指针
              hMenu := GetMenu(hWndFrame); // 框架窗口菜单
              CheckMenuItem(hMenu, HelloDataPt.iColor, MF_UNCHECKED);
              HelloDataPt.iColor := wParam; // 当前勾选菜单项
              CheckMenuItem(hMenu, HelloDataPt.iColor, MF_CHECKED);
              HelloDataPt.clrText := clrTextArray[wParam - IDM_COLOR_BLACK]; // 当前颜色
              InvalidateRect(hWnd, nil, FALSE); // 刷新
            end;
        end;
      end;

    WM_PAINT:
      begin
        hWndDc := BeginPaint(hWnd, ps);

        HelloDataPt := PHelloData(GetWindowLong(hWnd, 0)); // 数据指针
        SetTextColor(hWndDc, HelloDataPt.clrText); // 文字颜色
        GetClientRect(hWnd, Rect);
        DrawText(hWndDc, 'Hello, World!', -1, Rect, DT_SINGLELINE or DT_CENTER or DT_VCENTER);

        EndPaint(hWnd, ps);
      end;

    WM_MDIACTIVATE: // WM_MDISETMENU用来设置菜单和列表子菜单
      begin
       // Set the Hello menu if gaining focus
        if (lParam = Integer(hWnd)) then
          SendMessage(hWndClient, WM_MDISETMENU, hMenuHello, hMenuHelloWindow);

       // Check or uncheck menu item
        HelloDataPt := PHelloData(GetWindowLong(hWnd, 0));
        if (lParam = Integer(hWnd)) then
          CheckMenuItem(hMenuHello, HelloDataPt.iColor, MF_CHECKED)
        else
          CheckMenuItem(hMenuHello, HelloDataPt.iColor, MF_UNCHECKED);

       // Set the Init menu if losing focus
        if (lParam <> Integer(hWnd)) then
          SendMessage(hWndClient, WM_MDISETMENU, hMenuInit, hMenuInitWindow);

        DrawMenuBar(hWndFrame);
      end;

    WM_QUERYENDSESSION,
    WM_CLOSE:
      begin
        if (IDOK = MessageBox(hWnd, 'OK to close window?',
          'Hello', MB_ICONQUESTION or MB_OKCANCEL)) then // 确认关闭
        begin
          Result := DefMDIChildProc(hWnd, Msg, wParam, lParam);
        end else
        begin
          Exit; // 不调用DefMDIChildProc(), 从而阻止关闭
        end;
      end;

    WM_DESTROY:
      begin
        HelloDataPt := PHelloData(GetWindowLong(hWnd, 0));
        HeapFree(GetProcessHeap(), 0, HelloDataPt); // 释放内存
      end;

    else
      begin
        Result := DefMDIChildProc(hWnd, Msg, wParam, lParam); // 标准MDI子窗口消息处理
      end;
  end;
end;

  // Rect子窗体消息处理回调函数
function RectWndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  hWndClient: LongWord = 0;
  hWndFrame: LongWord = 0;
{$J-}
var
  hBrush: LongWord; // HBRUSH
  hWndDc: HDC;
  RectDataPt: PRectData;
  ps: TPaintStruct;
  xLeft, xRight, yTop, yBottom: Integer;
  nRed, nGreen, nBlue: SHORT;
begin
  Result := 0;
  case (Msg) of
    WM_CREATE:       
      begin
       // 分配结构内存,并保存地址至窗口额外内存
        RectDataPt := PRectData(HeapAlloc(GetProcessHeap(),
          HEAP_ZERO_MEMORY, SizeOf(RectData)));
        SetWindowLong(hWnd, 0, LongWord(RectDataPt));

       // 安装(画图)定时器
        SetTimer(hWnd, 1, 250, nil);

       // 保存父窗体句柄
        hWndClient := GetParent(hWnd);
        hWndFrame := GetParent(hWndClient);
      end;

    WM_SIZE:
      begin
        if (wParam <> SIZE_MINIMIZED) then // If not minimized, save the window size
        begin
          RectDataPt := PRectData(GetWindowLong(hWnd, 0));
          RectDataPt.cxClient := LOWORD(lParam);
          RectDataPt.cyClient := HIWORD(lParam);
        end;
        Result := DefMDIChildProc(hWnd, Msg, wParam, lParam); // 标准处理
      end;

    WM_TIMER: // 绘制一个随机的矩形
      begin
       // 取得指针
        RectDataPt := PRectData(GetWindowLong(hWnd, 0));

       // 随机范围
        xLeft := Random(RectDataPt.cxClient);
        xRight := Random(RectDataPt.cxClient);
        yTop := Random(RectDataPt.cyClient);
        yBottom := Random(RectDataPt.cyClient);

       // 随机颜色
        nRed := Random(255);
        nGreen := Random(255);
        nBlue := Random(255);

       // 填充矩形
        hWndDc := GetDC(hWnd);
        hBrush := CreateSolidBrush(RGB(nRed, nGreen, nBlue));
        SelectObject(hWndDc, hBrush);
        Rectangle(hWndDc, Min(xLeft, xRight),
          Min(yTop, yBottom), Max(xLeft, xRight), Max(yTop, yBottom));
        ReleaseDC(hWnd, hWndDc);
        DeleteObject(hBrush);
      end;

    WM_PAINT:
      begin
        InvalidateRect(hWnd, nil, TRUE); // 全部失效
        BeginPaint(hWnd, ps); // 有效,并用背景色填充(也就是清除)
        EndPaint(hWnd, ps);
      end;

    WM_MDIACTIVATE:  // 得到or失去焦点都会收到此消息
      begin // Set the appropriate menu
        if (lParam = Integer(hWnd)) then
          SendMessage(hWndClient, WM_MDISETMENU, hMenuRect, hMenuRectWindow)
        else
          SendMessage(hWndClient, WM_MDISETMENU, hMenuInit, hMenuInitWindow);
        DrawMenuBar(hWndFrame);
      end;

    WM_DESTROY:
      begin
        RectDataPt := PRectData(GetWindowLong(hWnd, 0)); // 取得指针
        HeapFree(GetProcessHeap(), 0, RectDataPt); // 释放内存
        KillTimer(hWnd, 1); // 删除定时器
      end;

    else
      begin
        Result := DefMDIChildProc(hWnd, Msg, wParam, lParam); // 标准MDI子窗口消息处理
      end;
  end;
end;

var
  hAccel: LongWord; // HACCEL;
  hWndFrame, hWndClient: HWND;
  Msg: TMsg;
  WndClass: TWndClass;
begin
 // Register the frame window class (注册框架窗口)
  WndClass.style := CS_HREDRAW or CS_VREDRAW;
  WndClass.lpfnWndProc := @FrameWndProc;
  WndClass.cbClsExtra := 0;
  WndClass.cbWndExtra := 0;
  WndClass.hInstance := hInstance;
  WndClass.hIcon := LoadIcon(0, IDI_APPLICATION);
  WndClass.hCursor := LoadCursor(0, IDC_ARROW);
  WndClass.hbrBackground := COLOR_APPWORKSPACE + 1;
  WndClass.lpszMenuName := nil;
  WndClass.lpszClassName := szFrameClass;
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // Register the Hello child window class (注册Hello子窗口)
  WndClass.style := CS_HREDRAW or CS_VREDRAW;
  WndClass.lpfnWndProc := @HelloWndProc;
  WndClass.cbClsExtra := 0;
  WndClass.cbWndExtra := SizeOf(PHelloData); // 窗口实例额外空间
  WndClass.hInstance := hInstance;
  WndClass.hIcon := LoadIcon(0, IDI_APPLICATION);
  WndClass.hCursor := LoadCursor(0, IDC_ARROW);
  WndClass.hbrBackground := GetStockObject(WHITE_BRUSH);
  WndClass.lpszMenuName := nil;
  WndClass.lpszClassName := szHelloClass;
  RegisterClass(WndClass);

 // Register the Rect child window class (注册Rect子窗口)
  WndClass.style := CS_HREDRAW or CS_VREDRAW;
  WndClass.lpfnWndProc := @RectWndProc;
  WndClass.cbClsExtra := 0;
  WndClass.cbWndExtra := SizeOf(PRectData); // 窗口实例额外空间
  WndClass.hInstance := hInstance;
  WndClass.hIcon := LoadIcon(0, IDI_APPLICATION);
  WndClass.hCursor := LoadCursor(0, IDC_ARROW);
  WndClass.hbrBackground := GetStockObject(WHITE_BRUSH);
  WndClass.lpszMenuName := nil;
  WndClass.lpszClassName := szRectClass;
  RegisterClass(WndClass);

 // Obtain handles to three possible menus & submenus (载入菜单)
  hMenuInit := LoadMenu(hInstance, 'MdiMenuInit');
  hMenuHello := LoadMenu(hInstance, 'MdiMenuHello');
  hMenuRect := LoadMenu(hInstance, 'MdiMenuRect');
  hMenuInitWindow := GetSubMenu(hMenuInit, INIT_MENU_POS); // Windows子菜单..
  hMenuHelloWindow := GetSubMenu(hMenuHello, HELLO_MENU_POS);
  hMenuRectWindow := GetSubMenu(hMenuRect, RECT_MENU_POS);

 // Load accelerator table (载入快捷键表)
  hAccel := LoadAccelerators(hInstance, szAppName);

 // Create the frame window (建立框架窗口)
  hWndFrame := CreateWindow(szFrameClass, 'MDI Demonstration',
                   WS_OVERLAPPEDWINDOW or WS_CLIPCHILDREN,
                   Integer(CW_USEDEFAULT), Integer(CW_USEDEFAULT),
                   Integer(CW_USEDEFAULT), Integer(CW_USEDEFAULT),
                   0, hMenuInit, hInstance, nil);
  hWndClient := GetWindow(hWndFrame, GW_CHILD); // 框架窗口消息处理函数建立的客户窗口
  ShowWindow(hWndFrame, CmdShow);
  UpdateWindow(hWndFrame);

 // Enter the modified message loop (消息循环)
  while GetMessage(Msg, 0, 0, 0) do
  begin
    if (not TranslateMDISysAccel(hWndClient, Msg)) and
       (TranslateAccelerator(hWndFrame, hAccel, Msg) = 0) then
    begin
      TranslateMessage(Msg);
      DispatchMessage(Msg);
    end;
  end;

 // Clean up by deleting unattached menus
  DestroyMenu(hMenuHello);
  DestroyMenu(hMenuRect);
end.
