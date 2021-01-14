program  BlokOut2;

uses
  Windows, Messages;
  
  // 窗体消息处理回调函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
    // 绘制与屏幕反色的矩形框
  procedure DrawBoxOutline(hWin: DWORD; ptBeg, ptEnd: TPoint);
  var
    hWndDc: HDC;
  begin
    hWndDc := GetDC(hWin);
    SetROP2(hWndDc, R2_NOT); // 设前景混和模式为屏幕颜色取反
    SelectObject(hWndDc, GetStockObject(NULL_BRUSH)); // 仅画边框
    Rectangle(hWndDc, ptBeg.X, ptBeg.Y, ptEnd.X, ptEnd.Y);
    ReleaseDC(hWin, hWndDc);
  end;
const
 {$J+}
  fBlocking: Boolean = FALSE;  // 正在'拖拽'
  ptBeg: TPoint = (X: 0; Y: 0);
  ptEnd: TPoint = (X: 0; Y: 0);
  fValidBox: Boolean = FALSE;  // 有矩形要画
  ptBoxBeg: TPoint = (X: 0; Y: 0);
  ptBoxEnd: TPoint = (X: 0; Y: 0);
 {$J+}
var
  hWndDc: HDC;
  PS: TPaintStruct;
begin
  Result := 0;
  case Msg of
    WM_LBUTTONDOWN:
      begin
        ptBeg.X := LOWORD(lParam);
        ptEnd.X := LOWORD(lParam);
        ptBeg.Y := HIWORD(lParam);
        ptEnd.Y := HIWORD(lParam);
        DrawBoxOutline(hWnd, ptBeg, ptEnd);
        SetCapture(hWnd); // 监视鼠标
        SetCursor(LoadCursor(0, IDC_CROSS)); // 十字光标
        fBlocking := TRUE;
      end;

    WM_MOUSEMOVE:
      begin
        if fBlocking then
        begin
          SetCursor(LoadCursor(0, IDC_CROSS)); // 十字光标
          DrawBoxOutline(hWnd, ptBeg, ptEnd); // 擦除原矩形
          ptEnd.X := LOWORD(lParam);
          ptEnd.Y := HIWORD(lParam);
          DrawBoxOutline(hWnd, ptBeg, ptEnd); // 绘制新矩形
        end;
      end;

    WM_LBUTTONUP:
      begin
        if fBlocking then
        begin
          DrawBoxOutline(hWnd, ptBeg, ptEnd); // 擦除
          ptBoxBeg := ptBeg;
          ptBoxEnd.X := LOWORD(lParam);
          ptBoxEnd.Y := HIWORD(lParam);
          ReleaseCapture; // 取消监视
          SetCursor(LoadCursor(0, IDC_ARROW)); // 正常光标
          fBlocking := FALSE; // 结束拖拽状态
          fValidBox := TRUE;  // 有矩形要画
          InvalidateRect(hWnd, nil, TRUE); // 刷新
        end;
      end;

    WM_CHAR:
      begin                // 按ESC键则取消
        if (fBlocking) and (wParam = VK_ESCAPE) then
        begin
          DrawBoxOutline(hWnd, ptBeg, ptEnd); // 擦除
          ReleaseCapture; // 取消监视
          SetCursor(LoadCursor(0, IDC_ARROW)); // 正常光标
          fBlocking := FALSE; // 结束拖拽状态
        end;
      end;

    WM_PAINT:
      begin
        hWndDc := BeginPaint(hWnd, PS); // 开始绘制

        if fValidBox then // 有矩形要画
        begin
          SelectObject(hWndDc, GetStockObject(BLACK_BRUSH));
          Rectangle(hWndDc, ptBoxBeg.X, ptBoxBeg.Y, ptBoxEnd.X, ptBoxEnd.Y) ;
        end;

        if fBlocking then // 拖拽'状态'
        begin
          SetROP2(hWndDc, R2_NOT);
          SelectObject(hWndDc, GetStockObject(NULL_BRUSH));
          Rectangle(hWndDc, ptBeg.X, ptBeg.Y, ptEnd.X, ptEnd.Y);
        end;

        EndPaint(hWnd, PS); // 结束绘制
      end;

    WM_DESTROY:
       PostQuitMessage(0); // 跳出线程消息循环

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
  end;
end;


const  
  AppName = 'BlokOut2';

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
    MessageBox(0, 'Program requires Windows NT!', AppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(AppName, 'Mouse Button & Capture Demo',
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
