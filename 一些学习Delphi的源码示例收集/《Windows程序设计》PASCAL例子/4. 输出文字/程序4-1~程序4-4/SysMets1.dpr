program  SysMets1;

uses
  Windows, Messages, SysMets;

  // 窗体过程    { 句柄 }    { 标识 }   { 参数1 }       { 参数2 }
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+} // 允许修改常量
  cxChar: Integer = 0;   // 小写字母宽度
  cxCaps: Integer = 0;   // 大写字母宽度
  cyChar: Integer = 0;   // 小写字母高度
{$J-}
var
  hWndDc: HDC;          // 设备内容句柄
  PS: TPaintStruct;     // 绘图信息结构
  TM: TTextMetric;      // 字体度量信息
  J, OutList: Integer;  // 循环变量, 转换列表(这里只有一个)
  Buffer: array [0..5] of Char; // 输出字符串
begin
  Result := 0;
 // 区别不同的消息 
  case Msg of
    WM_CREATE: begin
                 hWndDc := GetDC(hWnd); // 取得设备内容句柄

                 GetTextMetrics(hWndDc, TM);  // 取得字体度量信息
                 cxChar := TM.tmAveCharWidth; // 小写字母宽度
                 if (TM.tmPitchAndFamily and $1) = 0 // 是否固定宽度字体(推算大写字母宽度)
                 then cxCaps := cxChar
                 else cxCaps := cxChar * 3 div 2;
                 cyChar := TM.tmHeight + TM.tmExternalLeading; // 小写字母高度

                 ReleaseDC(hWnd, hWndDc); // 释放设备内容句柄
               end;

    WM_PAINT: begin
                hWndDc := BeginPaint(hWnd, PS); // 开始绘制

                for J := 0 to NUMLINES-1 do // 依次输出各行信息
                begin
                  TextOut(hWndDc, 0, cyChar * J, SysMetrics[J].szLabel, lstrlen(SysMetrics[J].szLabel));
                  TextOut(hWndDc, 22 * cxCaps, cyChar * J, SysMetrics[J].szDesc, lstrlen(SysMetrics[J].szDesc));
                  SetTextAlign(hWndDc, TA_RIGHT or TA_TOP); // 此后所给坐标视为右上角之坐标
                  OutList := GetSystemMetrics(SysMetrics[J].Index);              {转换并返回长度(这里肯定是5)}
                  TextOut(hWndDc, 22 * cxCaps + 40 * cxChar, cyChar * J, Buffer, wvsprintf(Buffer, '%5d', @OutList));
                  SetTextAlign(hWndDc, TA_LEFT or TA_TOP); // 此后所给坐标视为左上角之坐标
                end;

                EndPaint(hWndDc, PS); // 结束绘制
              end;

    WM_DESTROY: PostQuitMessage(0); // 放置WM_QUIT导致GetMessage返回FALSE

    else Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
  end;
end;

const
  AppName = 'SysMets1'; // 窗体类名
  
var
  hWnd: LongWord;       // 窗体句柄
  Msg: TMsg;            // 消息结构
  WndClass: TWndClass;  // 窗体类结构

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
    MessageBox(0, 'This program requires Windows NT!', AppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗口
  hWnd := CreateWindow(AppName, 'Get System Metrics No. 1',
                       WS_OVERLAPPEDWINDOW,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       0, 0, hInstance, nil);

 // 显示窗口
  ShowWindow(hWnd, CmdShow);
  UpdateWindow(hWnd);
  
 // 消息循环
  while GetMessage(Msg, 0, 0, 0) do
  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end.

