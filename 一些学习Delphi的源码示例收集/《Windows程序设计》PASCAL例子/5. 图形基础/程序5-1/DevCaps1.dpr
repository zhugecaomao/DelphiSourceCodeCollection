program  DevCaps1;

uses
  Windows, Messages;          

  // 窗体消息处理回调函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
type
  TDevCap = record
    iIndex: Integer;
    szLabel: PChar;
    szDesc: PChar;
  end;
const
  NUMLINES = 19;
  DevCaps: array[0..NUMLINES] of TDevCap =  (
    (iIndex: HORZSIZE; szLabel: 'HORZSIZE'; szDesc: 'Width in millimeters:'),
    (iIndex: VERTSIZE; szLabel: 'VERTSIZE'; szDesc: 'Height in millimeters:'),
    (iIndex: HORZRES; szLabel: 'HORZRES'; szDesc: 'Width in pixels:'),
    (iIndex: VERTRES; szLabel: 'VERTRES'; szDesc: 'Height in raster lines:'),
    (iIndex: BITSPIXEL; szLabel: 'BITSPIXEL'; szDesc: 'Color bits per pixel:'),
    (iIndex: PLANES; szLabel: 'PLANES'; szDesc: 'Number of color planes:'),
    (iIndex: NUMBRUSHES; szLabel: 'NUMBRUSHES'; szDesc: 'Number of device brushes:'),
    (iIndex: NUMPENS; szLabel: 'NUMPENS'; szDesc: 'Number of device pens:'),
    (iIndex: NUMMARKERS; szLabel: 'NUMMARKERS'; szDesc: 'Number of device markers:'),
    (iIndex: NUMFONTS; szLabel: 'NUMFONTS'; szDesc: 'Number of device fonts:'),
    (iIndex: NUMCOLORS; szLabel: 'NUMCOLORS'; szDesc: 'Number of device colors:'),
    (iIndex: PDEVICESIZE; szLabel: 'PDEVICESIZE'; szDesc: 'Size of device structure:'),
    (iIndex: ASPECTX; szLabel: 'ASPECTX'; szDesc: 'Relative width of pixel:'),
    (iIndex: ASPECTY; szLabel: 'ASPECTY'; szDesc: 'Relative height of pixel:'),
    (iIndex: ASPECTXY; szLabel: 'ASPECTXY'; szDesc: 'Relative diagonal of pixel:'),
    (iIndex: LOGPIXELSX; szLabel: 'LOGPIXELSX'; szDesc: 'Horizontal dots per inch:'),
    (iIndex: LOGPIXELSY; szLabel: 'LOGPIXELSY'; szDesc: 'Vertical dots per inch:'),
    (iIndex: SIZEPALETTE; szLabel: 'SIZEPALETTE'; szDesc: 'Number of palette entries:'),
    (iIndex: NUMRESERVED; szLabel: 'NUMRESERVED'; szDesc: 'Reserved palette entries:'),
    (iIndex: COLORRES; szLabel: 'COLORRES'; szDesc: 'Actual color resolution:') );
 {$J+}
const
  cxChar: Integer = 0;   // 小写字母宽度
  cxCaps: Integer = 0;   // 大写字母宽度
  cyChar: Integer = 0;   // 小写字母高度
 {$J-}
var
  Buffer: array [0..5] of Char;
  hWndDc: HDC;
  J, L: Integer;
  PS: TPaintStruct;
  TM: TTextMetric;
begin
  Result := 0;
 // 不同的消息标识
  case Msg of
    WM_CREATE   :  begin
                     hWndDc := GetDC(hWnd); // 取窗体设备内容句柄

                     GetTextMetrics(hWndDc, TM); // 取得字体度量信息
                     cxChar := TM.tmAveCharWidth;
                     if (TM.tmPitchAndFamily and $1) = 0 // 宽度固定?
                     then cxCaps := cxChar
                     else cxCaps := cxChar * 3 div 2;
                     cyChar := TM.tmHeight + TM.tmExternalLeading;

                     ReleaseDC(hWnd, hWndDc); // 释放设备内容句柄
                   end;
                   
    WM_PAINT    :  begin
                     hWndDc := BeginPaint(hWnd, PS); // 开始绘制

                     for J := 0 to NUMLINES do // 输出各行
                     begin
                       TextOut(hWndDc, 0, cyChar * J, DevCaps[J].szLabel, lstrlen(DevCaps[J].szLabel));
                       TextOut(hWndDc, 14 * cxCaps, cyChar * J, DevCaps[J].szDesc, lstrlen(DevCaps[J].szDesc));
                       SetTextAlign(hWndDc, TA_RIGHT or TA_TOP);  // 设右上对齐
                       L := GetDeviceCaps(hWndDc, DevCaps[J].iIndex);
                       TextOut(hWndDc, 14 * cxCaps + 35 * cxChar, cyChar * J, Buffer, wvsprintf(Buffer, '%5d', @L));
                       SetTextAlign(hWndDc, TA_LEFT or TA_TOP); // 设左上对齐
                     end;

                     EndPaint(hWndDc, PS); // 结束绘制
                   end;
                   
    WM_DESTROY  :  PostQuitMessage(0); // 退出消息循环
    
    else Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理 
  end;
end;


const  
  AppName = 'DevCaps1'; // 窗体类名

var
  hWnd: LongWord;   // 窗体句柄
  Msg: TMsg;        // 消息结构
  WndClass: TWndClass; // 类结构
   
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

 // 建立窗体
  hWnd := CreateWindow(AppName, 'Device Capabilities',
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
