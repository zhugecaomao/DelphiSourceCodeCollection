program  Checker1;

uses
  Windows, Messages;

  // 窗体消息处理回调函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  DIVISIONS = 5;
 {$J+}
  fState: array[0..DIVISIONS-1] of array [0..DIVISIONS-1] of Boolean = (
    (FALSE, FALSE, FALSE, FALSE, FALSE), (FALSE, FALSE, FALSE, FALSE, FALSE),
    (FALSE, FALSE, FALSE, FALSE, FALSE), (FALSE, FALSE, FALSE, FALSE, FALSE),
    (FALSE, FALSE, FALSE, FALSE, FALSE) );
  cxBlock: Integer = 0; // 单块宽度
  cyBlock: Integer = 0; // 单块高度
 {$J+}
var
  hWndDc: HDC;
  PS: TPaintStruct;
  Rect: TRect; // 失效范围
  X, Y: Integer;
begin
  Result := 0;
  case Msg of
    WM_SIZE : begin // 方格尺寸
                cxBlock := LOWORD(lParam) div DIVISIONS;
                cyBlock := HIWORD(lParam) div DIVISIONS;
              end;

    WM_LBUTTONDOWN: begin
                      X := LOWORD(lParam) div cxBlock;
                      Y := HIWORD(lParam) div cyBlock;
                      if (X < DIVISIONS)and(Y < DIVISIONS) then
                      begin
                        fState[X][Y] := not fState[X][Y];
                        Rect.Left := X * cxBlock;
                        Rect.Top := Y * cyBlock;
                        Rect.Right := (X + 1) * cxBlock;
                        Rect.Bottom := (y + 1) * cyBlock;
                        InvalidateRect(hWnd, @Rect, FALSE); // 刷新
                      end else
                        MessageBeep(0); // 超出范围则鸣笛
                    end;

    WM_PAINT: begin
                hWndDc := BeginPaint(hWnd, PS); // 开始绘制
                for X := 0 to DIVISIONS - 1 do
                  for Y := 0 to DIVISIONS - 1 do
                  begin     // 绘制边框
                    Rectangle(hWndDc, X * cxBlock, Y * cyBlock, (X + 1) * cxBlock, (Y + 1) * cyBlock);
                    if fState[X][Y] then // 绘制叉叉
                    begin
                      MoveToEx(hWndDc, X * cxBlock,  Y * cyBlock, nil);
                      LineTo(hWndDc, (X+1) * cxBlock, (Y+1) * cyBlock);
                      MoveToEx(hWndDc, X * cxBlock, (Y+1) * cyBlock, nil);
                      LineTo(hWndDc, (X+1) * cxBlock, Y  * cyBlock);
                    end;
                  end;
                EndPaint(hWnd, PS); // 结束绘制
              end;

    WM_DESTROY: PostQuitMessage(0); // 跳出线程消息循环

    else Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
  end;
end;


const  
  AppName = 'Checker1';

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
  hWnd := CreateWindow(AppName, 'Checker1 Mouse Hit-Test Demo',
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
