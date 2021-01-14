program  DevCaps2;

{$R  DevCaps2.Res}

uses
  Windows, Messages, WinSpool;

type
  PtBits = ^TBits;
  TBits = record
    iMask: Integer;
    szDesc: PChar;
  end;

  // "基本信息"(IDM_BASIC)
procedure DoBasicInfo(hWndDc, hdcInfo: HDC; cxChar, cyChar: Integer);
type
  TInfo = record
    nIndex: Integer;
    szDesc: PChar;
  end;
const
  Info: array[0..23] of TInfo = (
    (nIndex: HORZSIZE; szDesc: 'HORZSIZE Width in millimeters:'),
    (nIndex: VERTSIZE; szDesc: 'VERTSIZE Height in millimeters:'),
    (nIndex: HORZRES; szDesc: 'HORZRES Width in pixels:'),
    (nIndex: VERTRES; szDesc: 'VERTRES Height in raster lines:'),
    (nIndex: BITSPIXEL; szDesc: 'BITSPIXEL Color bits per pixel:'),
    (nIndex: PLANES; szDesc: 'PLANES Number of color planes:'),
    (nIndex: NUMBRUSHES; szDesc: 'NUMBRUSHES Number of device brushes:'),
    (nIndex: NUMPENS; szDesc: 'NUMPENS Number of device pens:'),
    (nIndex: NUMMARKERS; szDesc: 'NUMMARKERS Number of device markers:'),
    (nIndex: NUMFONTS; szDesc: 'NUMFONTS Number of device fonts:'),
    (nIndex: NUMCOLORS; szDesc: 'NUMCOLORS Number of device colors:'),
    (nIndex: PDEVICESIZE; szDesc: 'PDEVICESIZESize of device structure:'),
    (nIndex: ASPECTX; szDesc: 'ASPECTX Relative width of pixel:'),
    (nIndex: ASPECTY; szDesc: 'ASPECTY Relative height of pixel:'),
    (nIndex: ASPECTXY; szDesc: 'ASPECTXY Relative diagonal of pixel:'),
    (nIndex: LOGPIXELSX; szDesc: 'LOGPIXELSX Horizontal dots per inch:'),
    (nIndex: LOGPIXELSY; szDesc: 'LOGPIXELSY Vertical dots per inch:'),
    (nIndex: SIZEPALETTE; szDesc: 'SIZEPALETTE Number of palette entries:'),
    (nIndex: NUMRESERVED; szDesc: 'NUMRESERVED Reserved palette entries:'),
    (nIndex: COLORRES; szDesc: 'COLORRES Actual color resolution:'),
    (nIndex: PHYSICALWIDTH; szDesc: 'PHYSICALWIDTH Printer page pixel width:'),
    (nIndex: PHYSICALHEIGHT; szDesc: 'PHYSICALHEIGHT Printer page pixel height:'),
    (nIndex: PHYSICALOFFSETX; szDesc: 'PHYSICALOFFSETX Printer page x offset:'),
    (nIndex: PHYSICALOFFSETY; szDesc: 'PHYSICALOFFSETY Printer page y offset:') );
var
 J: Integer;
 szBuffer: array[0..80] of Char;
 List: array[0..1] of Integer;
begin
  for J := 0 to 23 do
  begin
    List[0] := Integer(Info[J].szDesc);
    List[1] := GetDeviceCaps(hdcInfo, Info[J].nIndex);
    TextOut(hWndDc, cxChar, (J + 1) * cyChar, szBuffer, wvsprintf(szBuffer, '%-45s%8d', @List[0]));
  end;
end;

  // "其他信息"(IDM_OTHER)
procedure DoOtherInfo(hWndDc, hdcInfo: HDC; cxChar, cyChar: Integer);
const
  clip: array[0..0] of TBits =
    ((iMask: CP_RECTANGLE; szDesc: 'CP_RECTANGLE  Can Clip To Rectangle:'));
  raster: array[0..11] of TBits  = (
    (iMask: RC_BITBLT; szDesc: 'RC_BITBLT  Capable of simple BitBlt:'),
    (iMask: RC_BANDING; szDesc: 'RC_BANDING Requires banding support:'),
    (iMask: RC_SCALING; szDesc: 'RC_SCALING Requires scaling support:'),
    (iMask: RC_BITMAP64; szDesc: 'RC_BITMAP64  Supports bitmaps >64K:'),
    (iMask: RC_GDI20_OUTPUT; szDesc: 'RC_GDI20_OUTPUT Has 2.0 output calls:'),
    (iMask: RC_DI_BITMAP; szDesc: 'RC_DI_BITMAP  Supports DIB to memory:'),
    (iMask: RC_PALETTE; szDesc: 'RC_PALETTE      Supports a palette:'),
    (iMask: RC_DIBTODEV; szDesc: 'RC_DIBTODEV Supports bitmap conversion:'),
    (iMask: RC_BIGFONT; szDesc: 'RC_BIGFONT  Supports fonts >64K:'),
    (iMask: RC_STRETCHBLT; szDesc: 'RC_STRETCHBLT Supports StretchBlt:'),
    (iMask: RC_FLOODFILL; szDesc: 'RC_FLOODFILL  Supports FloodFill:'),
    (iMask: RC_STRETCHDIB; szDesc: 'RC_STRETCHDIB Supports StretchDIBits:') );
  szTech: array[0..6] of PChar = (
    'DT_PLOTTER (Vector plotter)',
    'DT_RASDISPLAY (Raster display)',
    'DT_RASPRINTER (Raster printer)',
    'DT_RASCAMERA (Raster camera)',
    'DT_CHARSTREAM (Character stream)',
    'DT_METAFILE (Metafile)',
    'DT_DISPFILE (Display file)' );
var
  J: Integer;
  szBuffer: array[0..80] of Char;
  List: array[0..1] of Integer;
begin
  List[0] := Integer(PChar('DRIVERVERSION:'));
  List[1] := GetDeviceCaps(hdcInfo, DRIVERVERSION);
  TextOut(hWndDc, cxChar, cyChar, szBuffer, wvsprintf(szBuffer, '%-24s%04XH', @List[0]));

  List[0] := Integer(PChar('TECHNOLOGY:'));
  List[1] := Integer(szTech[GetDeviceCaps(hdcInfo, TECHNOLOGY)]);
  TextOut(hWndDc, cxChar, 2 * cyChar, szBuffer, wvsprintf(szBuffer, '%-24s%-40s', @List[0]));
  TextOut(hWndDc, cxChar, 4 * cyChar, szBuffer, wsprintf(szBuffer, 'CLIPCAPS (Clipping capabilities)'));

  for J := 0 to 0 do
  begin
    List[0] := Integer(clip[J].szDesc);
    if (GetDeviceCaps(hdcInfo, CLIPCAPS) and clip[J].iMask) <> 0 then
      List[1] := Integer(PChar('Yes'))
    else
      List[1] := Integer(PChar('No'));
    TextOut(hWndDc, 9 * cxChar, (J + 6) * cyChar, szBuffer, wvsprintf(szBuffer, '%-45s %3s', @List[0]));
  end;

  TextOut(hWndDc, cxChar, 8 * cyChar, szBuffer, wsprintf(szBuffer, 'RASTERCAPS (Raster capabilities)'));

  for J := 0 to 11 do
  begin
    List[0] := Integer(raster[J].szDesc);
    if (GetDeviceCaps(hdcInfo, RASTERCAPS) and raster[J].iMask) <> 0 then
      List[1] := Integer(PChar('Yes'))
    else
      List[1] := Integer(PChar('No'));
    TextOut(hWndDc, 9 * cxChar, (J + 10) * cyChar, szBuffer, wvsprintf(szBuffer, '%-45s %3s', @List[0]));
  end;
end;

  // 其他..(IDM_CURVE ~ IDM_TEXT)
procedure DoBitCodedCaps(hWndDc, hdcInfo: HDC; cxChar, cyChar, iType: Integer);
type
  TBitInfo = record
    iIndex: Integer;
    szTitle: PChar;
    pbits: PtBits;  // 数组首地址
    iSize: Integer; // 数组尾下标
  end;
const
  curves: array[0..7] of TBits = (
    (iMask: CC_CIRCLES; szDesc: 'CC_CIRCLES     Can do circles:'),
    (iMask: CC_PIE; szDesc: 'CC_PIE         Can do pie wedges:'),
    (iMask: CC_CHORD; szDesc: 'CC_CHORD       Can do chord arcs:'),
    (iMask: CC_ELLIPSES; szDesc: 'CC_ELLIPSES    Can do ellipses:'),
    (iMask: CC_WIDE; szDesc: 'CC_WIDE        Can do wide borders:'),
    (iMask: CC_STYLED; szDesc: 'CC_STYLED      Can do styled borders:'),
    (iMask: CC_WIDESTYLED; szDesc: 'CC_WIDESTYLED  Can do wide and styled borders:'),
    (iMask: CC_INTERIORS; szDesc: 'CC_INTERIORS   Can do interiors:') );
  lines: array[0..6] of TBits = (
    (iMask: LC_POLYLINE; szDesc: 'LC_POLYLINE    Can do polyline:'),
    (iMask: LC_MARKER; szDesc: 'LC_MARKER      Can do markers:'),
    (iMask: LC_POLYMARKER; szDesc: 'LC_POLYMARKER  Can do polymarkers'),
    (iMask: LC_WIDE; szDesc: 'LC_WIDE        Can do wide lines:'),
    (iMask: LC_STYLED; szDesc: 'LC_STYLED      Can do styled lines:'),
    (iMask: LC_WIDESTYLED; szDesc: 'LC_WIDESTYLED  Can do wide and styled lines:'),
    (iMask: LC_INTERIORS; szDesc: 'LC_INTERIORS   Can do interiors:') );
  poly: array[0..7] of TBits = (
    (iMask: PC_POLYGON; szDesc: 'PC_POLYGON      Can do alternate fill polygon:'),
    (iMask: PC_RECTANGLE; szDesc: 'PC_RECTANGLE    Can do rectangle:'),
    (iMask: PC_WINDPOLYGON; szDesc: 'PC_WINDPOLYGON  Can do winding number fill polygon:'),
    (iMask: PC_SCANLINE; szDesc: 'PC_SCANLINE     Can do scanlines:'),
    (iMask: PC_WIDE; szDesc: 'PC_WIDE         Can do wide borders:'),
    (iMask: PC_STYLED; szDesc: 'PC_STYLED       Can do styled borders:'),
    (iMask: PC_WIDESTYLED; szDesc: 'PC_WIDESTYLED   Can do wide and styled borders:'),
    (iMask: PC_INTERIORS; szDesc: 'PC_INTERIORS    Can do interiors:') );
  text: array[0..14] of TBits = (
    (iMask: TC_OP_CHARACTER; szDesc: 'TC_OP_CHARACTER Can do character output precision:'),
    (iMask: TC_OP_STROKE; szDesc: 'TC_OP_STROKE    Can do stroke output precision:'),
    (iMask: TC_CP_STROKE; szDesc: 'TC_CP_STROKE    Can do stroke clip precision:'),
    (iMask: TC_CR_90; szDesc: 'TC_CP_90        Can do 90 degree character rotation:'),
    (iMask: TC_CR_ANY; szDesc: 'TC_CR_ANY       Can do any character rotation:'),
    (iMask: TC_SF_X_YINDEP; szDesc: 'TC_SF_X_YINDEP  Can do scaling independent of X and Y:'),
    (iMask: TC_SA_DOUBLE; szDesc: 'TC_SA_DOUBLE    Can do doubled character for scaling:'),
    (iMask: TC_SA_INTEGER; szDesc: 'TC_SA_INTEGER   Can do integer multiples for scaling:'),
    (iMask: TC_SA_CONTIN; szDesc: 'TC_SA_CONTIN    Can do any multiples for exact scaling:'),
    (iMask: TC_EA_DOUBLE; szDesc: 'TC_EA_DOUBLE    Can do double weight characters:'),
    (iMask: TC_IA_ABLE; szDesc: 'TC_IA_ABLE      Can do italicizing:'),
    (iMask: TC_UA_ABLE; szDesc: 'TC_UA_ABLE      Can do underlining:'),
    (iMask: TC_SO_ABLE; szDesc: 'TC_SO_ABLE      Can do strikeouts:'),
    (iMask: TC_RA_ABLE; szDesc: 'TC_RA_ABLE      Can do raster fonts:'),
    (iMask: TC_VA_ABLE; szDesc: 'TC_VA_ABLE      Can do vector fonts:') );
  BitInfo: array[0..3] of TBitInfo = (
    (iIndex: CURVECAPS; szTitle: 'CURVCAPS (Curve Capabilities)'; pbits: @curves[0]; iSize: 7),
    (iIndex: LINECAPS; szTitle: 'LINECAPS (Line Capabilities)'; pbits: @lines[0]; iSize: 6),
    (iIndex: POLYGONALCAPS; szTitle: 'POLYGONALCAPS (Polygonal Capabilities)'; pbits: @poly[0]; iSize: 7),
    (iIndex: TEXTCAPS; szTitle: 'TEXTCAPS (Text Capabilities)'; pbits: @text[0]; iSize: 14) );
var
  pBits: PtBits;
  i, iDevCaps: Integer;
  List: array[0..1] of Integer;
  szBuffer: array[0..80] of Char;  
begin
  pBits := BitInfo[iType].pbits;
  iDevCaps := GetDeviceCaps(hdcInfo, BitInfo[iType].iIndex);
  TextOut(hWndDc, cxChar, cyChar, BitInfo[iType].szTitle, lstrlen(BitInfo[iType].szTitle));
  for i := 0 to BitInfo[iType].iSize do
  begin
    List[0] := Integer(PtBits(Integer(pbits) + SizeOf(TBits) * i).szDesc);
    if (iDevCaps and PtBits(Integer(pbits) + SizeOf(TBits) * i).iMask) <> 0 then
      List[1] := Integer(PChar('Yes'))
    else
      List[1] := Integer(PChar('No'));
    TextOut(hWndDc, cxChar, (i + 3) * cyChar, szBuffer, wvsprintf(szBuffer, '%-55s %3s', @List[0]));
  end;
end;    

  // 窗体回调函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  IDM_DEVMODE = 1000;
  IDM_SCREEN = 40001;
  IDM_BASIC  = 40002;
  IDM_OTHER  = 40003;
  IDM_CURVE  = 40004;
  IDM_LINE   = 40005;
  IDM_POLY   = 40006;
  IDM_TEXT   = 40007;
{$J+}
  cxChar: Integer = 0;
  cyChar: Integer = 0;
  nCurrentDevice: Integer = IDM_SCREEN; // 当前选中设备
  nCurrentInfo: Integer = IDM_BASIC; // 当前选中信息
{$J-}
var
  hMenu, hPrint, hWndDc, hdcInfo, dwNeeded, dwReturned: DWORD;
  pInfo4: PPrinterInfo4;
  pInfo5: PPrinterInfo5;
  szDevice: array[0..32] of Char;
  szWindowText: array[0..64] of Char;
  PS: TPaintStruct;
  TM: TTextMetric;
  J: Integer;
begin
  Result := 0;
 // 不同的消息ID
  case Msg of
    WM_CREATE:
      begin
        hWndDc := GetDC(hWnd);
        SelectObject(hWndDc, GetStockObject(SYSTEM_FIXED_FONT));
        GetTextMetrics(hWndDc, TM);
        cxChar := TM.tmAveCharWidth;
        cyChar := TM.tmHeight + TM.tmExternalLeading;
        ReleaseDC(hWnd, hWndDc);

        WndProc(hWnd, WM_SETTINGCHANGE, 0, 0); // 下一分支
      end;

    WM_SETTINGCHANGE:
      begin
        hMenu := GetSubMenu(GetMenu(hWnd), 0); // 取第一个弹出菜单'&Device'
        while (GetMenuItemCount(hMenu) > 1) do // 只留第一个菜单项'&Screen'
          DeleteMenu(hMenu, 1, MF_BYPOSITION);
        if (GetVersion() and $80000000) <> 0 then // Windows 98
        begin
          EnumPrinters(PRINTER_ENUM_LOCAL, nil, 5, nil, 0, dwNeeded, dwReturned);
          GetMem(pInfo5, dwNeeded);
          EnumPrinters(PRINTER_ENUM_LOCAL, nil, 5, pInfo5, dwNeeded, dwNeeded, dwReturned);
          for J := 0 to dwReturned-1 do // 枚举打印并添加到菜单'&Device'
          begin
            if ((J + 1) mod 16) <> 0 then // 16项一列
              AppendMenu(hMenu, 0 , J + 1,
                PPrinterInfo5(Integer(pInfo5) + J * SizeOf(TPrinterInfo5)).pPrinterName)
            else
              AppendMenu(hMenu, MF_MENUBARBREAK, J + 1,
                PPrinterInfo5(Integer(pInfo5) + J * SizeOf(TPrinterInfo5)).pPrinterName);
          end;
          FreeMem(pInfo5);
        end else // Windows NT
        begin
          EnumPrinters(PRINTER_ENUM_LOCAL, nil, 4, nil, 0, dwNeeded, dwReturned);
          GetMem(pInfo4, dwNeeded);
          EnumPrinters(PRINTER_ENUM_LOCAL, nil, 4, pInfo4, dwNeeded, dwNeeded, dwReturned);
          for J := 0 to dwReturned - 1 do // 枚举打印并添加到菜单'&Device'
          begin
            if ((J + 1) mod 16) <> 0 then // 16项一列
              AppendMenu(hMenu, 0, J + 1,
                PPrinterInfo4(Integer(pInfo4) + J * SizeOf(TPrinterInfo4)).pPrinterName)
            else
              AppendMenu(hMenu, MF_MENUBARBREAK, J + 1,
                PPrinterInfo4(Integer(pInfo4) + J * SizeOf(TPrinterInfo4)).pPrinterName);
          end;
          FreeMem(pInfo4);
        end;
        AppendMenu(hMenu, MF_SEPARATOR, 0, nil); // 分隔符
        AppendMenu(hMenu, 0, IDM_DEVMODE, 'Properties'); // 打印机对话框
        
        WndProc(hWnd, WM_COMMAND, IDM_SCREEN, 0); // 下一分支
      end;

    WM_COMMAND:
      begin  (* 注,菜单消息 HIWORD(wParam) = 0, 所以下面直接使用wParam *)
        hMenu := GetMenu(hWnd);
        if (wParam = IDM_SCREEN) or (wParam < IDM_DEVMODE) then // 选择某个设备(互斥)
        begin
          CheckMenuItem(hMenu, nCurrentDevice, MF_UNCHECKED);
          nCurrentDevice := wParam;
          CheckMenuItem(hMenu, nCurrentDevice, MF_CHECKED);
        end else
        begin
          if (wParam = IDM_DEVMODE) then // Properties selection(打印机对话框)
          begin
            GetMenuString(hMenu, nCurrentDevice, szDevice, 32, MF_BYCOMMAND); // 打印机名
            if OpenPrinter(szDevice, hPrint, nil) then
            begin
              PrinterProperties(hWnd, hPrint); // 打印机对话框
              ClosePrinter(hPrint);
            end;
          end else // 选择某类信息(互斥)
          begin
            CheckMenuItem(hMenu, nCurrentInfo, MF_UNCHECKED);
            nCurrentInfo := wParam;
            CheckMenuItem(hMenu, nCurrentInfo, MF_CHECKED);
          end;
        end;
        InvalidateRect(hWnd, nil, TRUE); // 重绘
      end;

    WM_INITMENUPOPUP:
      begin
        if (lParam = 0) then // 不是系统菜单且是第一个弹出子菜单
        begin
          if (nCurrentDevice = IDM_SCREEN) then // 屏幕设备无对话框
            EnableMenuItem(GetMenu(hWnd), IDM_DEVMODE, MF_GRAYED)
          else
            EnableMenuItem(GetMenu(hWnd), IDM_DEVMODE, MF_ENABLED);
        end;
      end;

    WM_PAINT:
      begin
        lstrcpy(szWindowText, 'Device Capabilities: ');
        if (nCurrentDevice = IDM_SCREEN) then // 当前设备
        begin
          lstrcpy(szDevice, 'DISPLAY');
          hdcInfo := CreateIC(szDevice, nil, nil, nil);
        end else
        begin
          hMenu := GetMenu(hWnd);
          GetMenuString(hMenu, nCurrentDevice, szDevice, 32, MF_BYCOMMAND); // 打印机名
          hdcInfo := CreateIC(nil, szDevice, nil, nil);
        end;
        lstrcat(szWindowText, szDevice); // 连接
        SetWindowText(hWnd, szWindowText);

        hWndDc := BeginPaint(hWnd, PS);
        SelectObject(hWndDc, GetStockObject(SYSTEM_FIXED_FONT));
        if (hdcInfo <> 0) then
        begin
          case (nCurrentInfo) of
            IDM_BASIC:
              DoBasicInfo(hWndDc, hdcInfo, cxChar, cyChar);

            IDM_OTHER:
              DoOtherInfo(hWndDc, hdcInfo, cxChar, cyChar);

            IDM_CURVE,
            IDM_LINE,
            IDM_POLY,
            IDM_TEXT:
              DoBitCodedCaps(hWndDc, hdcInfo, cxChar, cyChar, nCurrentInfo - IDM_CURVE);
          end;
        end;
        DeleteDC(hdcInfo);
        EndPaint(hWndDc, PS);
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0); // 退出消息循环
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
  end;
end;

const
  szAppName = 'DevCaps2';
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
  WndClass.lpszMenuName := szAppName;
  WndClass.lpszClassName := szAppName;

 // 注册窗体类
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(szAppName, nil,
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
