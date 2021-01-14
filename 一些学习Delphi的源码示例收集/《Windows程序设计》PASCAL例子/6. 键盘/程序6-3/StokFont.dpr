program  StokFont;

uses
  Windows, Messages, Math;

  // 窗体消息处理回调函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
type
  TStokFont = record
    StockFontID: Integer;
    szStockFont: PChar;
  end;
const
  cFonts = 6;
  StokFonts: array[0..cFonts] of TStokFont =  (
    (StockFontID: OEM_FIXED_FONT; szStockFont: 'OEM_FIXED_FONT'),
    (StockFontID: ANSI_FIXED_FONT; szStockFont: 'ANSI_FIXED_FONT'),
    (StockFontID: ANSI_VAR_FONT; szStockFont: 'ANSI_VAR_FONT'),
    (StockFontID: SYSTEM_FONT; szStockFont: 'SYSTEM_FONT'),
    (StockFontID: DEVICE_DEFAULT_FONT; szStockFont: 'DEVICE_DEFAULT_FONT'),
    (StockFontID: SYSTEM_FIXED_FONT; szStockFont: 'SYSTEM_FIXED_FONT'),
    (StockFontID: DEFAULT_GUI_FONT; szStockFont: 'DEFAULT_GUI_FONT') );
{$J+}
  iFont: Integer = 0;  // 当前字体(0..6)
{$J-}
var
  hWndDc: HDC;
  PS: TPaintStruct;
  TM: TTextMetric;
  szFaceName: array [0..LF_FACESIZE] of Char;
  szBuffer: array [0..LF_FACESIZE+64] of Char;
  X, Y, J, cxGrid, cyGrid: Integer;
  OutList: array[1..3] of Integer;
begin
  Result := 0;
  case Msg of
    WM_CREATE :  SetScrollRange(hWnd, SB_VERT, 0, cFonts, TRUE);

    WM_DISPLAYCHANGE :  InvalidateRect(hWnd, nil, TRUE);
                   
    WM_VSCROLL :  begin
                    case LOWORD(wParam) of // 卷动类型
                      SB_TOP       : iFont := 0;

                      SB_BOTTOM    : iFont := cFonts - 1;

                      SB_LINEUP,
                      SB_PAGEUP    : iFont := iFont - 1;

                      SB_LINEDOWN,
                      SB_PAGEDOWN  : iFont := iFont + 1;

                      SB_THUMBPOSITION: iFont := HIWORD(wParam);
                    end;

                    iFont := Max(0, Min(cFonts, iFont)); // 范围限制
                    SetScrollPos(hWnd, SB_VERT, iFont, TRUE);
                    InvalidateRect(hWnd, nil, TRUE);
                  end;

    WM_KEYDOWN :  begin // 转发卷动消息
                    case wParam of
                      VK_HOME :  SendMessage(hWnd, WM_VSCROLL, SB_TOP, 0);

                      VK_END  :  SendMessage(hWnd, WM_VSCROLL, SB_BOTTOM, 0);

                      VK_LEFT, VK_UP,
                      VK_PRIOR:  SendMessage(hWnd, WM_VSCROLL, SB_LINEUP, 0);

                      VK_NEXT, VK_DOWN,
                      VK_RIGHT:  SendMessage(hWnd, WM_VSCROLL, SB_LINEDOWN, 0);
                    end;
                  end;

    WM_PAINT :  begin
                  hWndDc := BeginPaint(hWnd, PS);

                  SelectObject(hWndDc, GetStockObject(StokFonts[iFont].StockFontID));
                  GetTextFace(hWndDc, LF_FACESIZE, szFaceName); // 被选入字体名称
                  GetTextMetrics(hWndDc, TM); // 取字体度量信息

                  OutList[1] := DWORD(StokFonts[iFont].szStockFont);
                  OutList[2] := DWORD(@szFaceName[0]);
                  OutList[3] := TM.tmCharSet;  // 字符集编号
                  TextOut(hWndDc, 0, 0, szBuffer, wvsprintf(szBuffer,
                    ' %s: Face Name = %s, CharSet = %i', @OutList[1]));

                  cyGrid := TM.tmHeight + 3; // 网格尺寸 ....
                  cxGrid := Max(3 * TM.tmAveCharWidth, 2 * TM.tmMaxCharWidth);

                  SetTextAlign(hWndDc, TA_TOP or TA_CENTER); // 居中

                 // 绘制网格
                  for J := 0 to 16 do
                  begin
                    MoveToEx(hWndDc, (J + 2) * cxGrid,  2 * cyGrid, nil);
                    LineTo(hWndDc, (J + 2) * cxGrid, 19 * cyGrid);
                    MoveToEx(hWndDc, cxGrid, (J + 3) * cyGrid, nil);
                    LineTo(hWndDc, 18 * cxGrid, (J + 3) * cyGrid);
                  end;

                 // 填写表头
                  for J := 0 to 15 do
                  begin
                    TextOut(hWndDc, (2 * J + 5) * cxGrid div 2, 2 * cyGrid + 2, szBuffer,
                      wvsprintf(szBuffer, '%X-', @J));
                    TextOut(hWndDc, 3 * cxGrid div 2, (J + 3) * cyGrid + 2, szBuffer,
                      wvsprintf(szBuffer, '-%X', @J));
                  end;

                 // 填写字符
                  for Y := 0 to 15 do // 低4位(半字节)
                    for X := 0 to 15 do // 高4位(半字节)
                    begin
                      OutList[1] := (X shl 4) or Y;
                      TextOut(hWndDc, (2 * X + 5) * cxGrid div 2, (Y + 3) * cyGrid + 2,
                        szBuffer, wvsprintf(szBuffer, '%c', @OutList[1]));
                    end;

                  EndPaint(hWnd, PS);
                end;

    WM_DESTROY :  PostQuitMessage(0); // 退出消息循环

    else Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
  end;
end;


const
  AppName = 'StokFont';
  
var
  WndClass: TWndClass;
  hWnd: LongWord;
  Msg: TMsg;
  
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
    MessageBox(0,'Program requires Windows NT!', AppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(AppName, 'Stock Fonts',
                       WS_OVERLAPPEDWINDOW or WS_VSCROLL,
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

        


