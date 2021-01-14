program  BigJob1;

uses
  Windows, Messages, Math;

type
  PParams = ^TParams;
  TParams = record
    hWnd: LongWord;
    bContinue: Boolean;
  end;

const
  REP              =  1000000; // 循环次数
  STATUS_READY     =  0; // 线程状态 ..
  STATUS_WORKING   =  1;
  STATUS_DONE      =  2;
  WM_CALC_DONE     =  WM_USER + 0; // 自定义消息 ..
  WM_CALC_ABORTED  =  WM_USER + 1;

  // 线程回调函数
function Thread(ParamsPt: PParams): DWORD; stdcall;
var
  A: Extended;
  i, lTime: Integer;
begin
  A := 1.0;
  lTime := GetCurrentTime(); // 当前时间

  for i := 0 to REP - 1 do // 所谓的暴力测试
  begin
    if not ParamsPt.bContinue then Break; // 右键终止
    A := Tan(ArcTan(Exp(Log10(Sqrt(A * A))))) + 1.0;
  end;       

  if (i = REP) then
  begin
    lTime := GetCurrentTime() - lTime; // 所用时间
    SendMessage(ParamsPt.hWnd, WM_CALC_DONE, 0, lTime); // 完成
  end else
  begin
    SendMessage(ParamsPt.hWnd, WM_CALC_ABORTED, 0, 0); // 中止
  end;
  
  ExitThread(0); // 退出线程(可省略)
end;  

  // 窗体消息处理回调函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  szMessage: array[0..2] of PChar = ( 'Ready (left mouse button begins)',
    'Working (right mouse button ends)', '%d repetitions in %ld msec' );
{$J+}
  iStatus: Integer = 0; // 0~2
  lTime: Integer = 0; // 计算时间
  Params: TParams = ();
{$J-}
var
  hWndDc: HDC;
  ps: TPaintStruct;
  Rect: TRect;
  szBuffer: array[0..64] of Char;
  List: array[0..1] of Integer;
begin
  case Msg of
    WM_LBUTTONDOWN:
      begin
        if (iStatus = STATUS_WORKING) then // 正在运算
        begin
          MessageBeep(0);
          Exit;
        end;        
        iStatus := STATUS_WORKING;
        Params.hWnd := hWnd;
        Params.bContinue := TRUE;
        CreateThread(nil, 0, @Thread, @Params, 0, Msg); // 建立线程
        InvalidateRect(hWnd, nil, TRUE); // 重绘
      end;

    WM_RBUTTONDOWN:
      begin
        Params.bContinue := FALSE;
      end;

    WM_CALC_DONE:
      begin
        lTime := lParam;
        iStatus := STATUS_DONE;
        InvalidateRect(hWnd, nil, TRUE); // 重绘
      end;

    WM_CALC_ABORTED:
      begin
        iStatus := STATUS_READY;
        InvalidateRect(hWnd, nil, TRUE); // 重绘
      end;

    WM_PAINT:
      begin
        hWndDc := BeginPaint(hWnd, ps);

        List[0] := REP;
        List[1] := lTime;
        wvsprintf(szBuffer, szMessage[iStatus], @List[0]);

        GetClientRect(hWnd, Rect);
        DrawText(hWndDc, szBuffer, -1, Rect, DT_SINGLELINE or DT_CENTER or DT_VCENTER);

        EndPaint(hWnd, ps);
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0);
      end;

    else
      begin
        Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
      end;
  end;
end;

const
  szAppName = 'BigJob1';
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
