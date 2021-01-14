program Justify2;

{$R Justify2.Res}

uses
  Windows, Messages, CommDlg;

const
  szAppName = 'Justify2';
  OUTWIDTH = 6;   // Width of formatted output in inches
  LASTCHAR = 127; // Last character code used in text   
  IDM_FILE_PRINT   = 40001; // 菜单ID ..
  IDM_FONT         = 40002;
  IDM_ALIGN_LEFT   = 40003;
  IDM_ALIGN_RIGHT  = 40004;
  IDM_ALIGN_CENTER = 40005;
  IDM_ALIGN_JUSTIFIED = 40006;

  // 绘制标尺
procedure DrawRuler(hdc: HDC; prc: PRect);
const
  iRuleSize: array[0..15] of Integer =
    ( 360, 72, 144, 72, 216, 72, 144, 72, 288, 72, 144, 72, 216, 72, 144, 72 );
var
  i, j: Integer;
  ptClient: TPoint;
begin
  SaveDC(hdc);

 // Set Logical Twips mapping mode
  SetMapMode(hdc, MM_ANISOTROPIC);
  SetWindowExtEx(hdc, 1440, 1440, nil);
  SetViewportExtEx(hdc, GetDeviceCaps(hdc, LOGPIXELSX), GetDeviceCaps(hdc, LOGPIXELSY), nil);

 // Move the origin to a half inch from upper left
  SetWindowOrgEx(hdc, -720, -720, nil);

 // Find the right margin (quarter inch from right)
  ptClient.x := prc.Right;
  ptClient.y := prc.Bottom;
  DPtoLP(hdc, ptClient, 1);
  Dec(ptClient.x, 360);
  
 // Draw the rulers
  MoveToEx(hdc, 0, -360, nil);
  LineTo(hdc, OUTWIDTH * 1440, -360);
  MoveToEx(hdc, -360, 0, nil);
  LineTo(hdc, -360, ptClient.y);
  i := 0;
  j := 0;
  while (i <= ptClient.x) and (i <= OUTWIDTH * 1440) do
  begin
    MoveToEx(hdc, i, -360, nil);
    LineTo(hdc, i, -360 - iRuleSize [j mod 16]);
    Inc(i, 1440 div 16);
    Inc(j);
  end;
  i := 0;
  j := 0;
  while (i <= ptClient.y) do
  begin
    MoveToEx(hdc, -360, i, nil);
    LineTo(hdc, -360 - iRuleSize[j mod 16], i);
    Inc(i, 1440 div 16);
    Inc(j);
  end;

  RestoreDC(hdc, -1);
end;

  // Gets character widths for font as large as the original design size
function GetCharDesignWidths(hdc: HDC; uFirst, uLast: UINT; piWidths: PInteger): UINT;
var
  hFont, hFontDesign: LongWord; // HFONT
  lf: TLogFont;
  otm: TOutlineTextmetric;
begin  
  hFont := GetCurrentObject(hdc, OBJ_FONT);
  GetObject(hFont, SizeOf(TLogFont), @lf);

 // Get outline text metrics (we'll only be using a field that is
 //   independent of the DC the font is selected into)
  otm.otmSize := SizeOf(TOutlineTextmetric);
  GetOutlineTextMetrics(hdc, SizeOf(TOutlineTextmetric), @otm);

 // Create a new font based on the design size
  lf.lfHeight := - otm.otmEMSquare;
  lf.lfWidth := 0;
  hFontDesign := CreateFontIndirect(lf);

 // Select the font into the DC and get the character widths
  SaveDC(hdc);
  SetMapMode(hdc, MM_TEXT);
  SelectObject(hdc, hFontDesign);
  GetCharWidth(hdc, uFirst, uLast, piWidths);
  SelectObject(hdc, hFont);
  RestoreDC(hdc, -1);
  
 // Clean up
  DeleteObject(hFontDesign);
  Result := otm.otmEMSquare;
end;

 // Gets floating point character widths for selected font size
procedure GetScaledWidths(hdc: HDC; pdWidths: PDouble);
var
  dScale: Double;
  hFont: LongWord; // HFONT
  aiDesignWidths: array[0..LASTCHAR] of Integer;
  i: Integer;
  lf: TLogFont;
  uEMSquare: UINT;
begin
 // Call function above
  uEMSquare := GetCharDesignWidths(hdc, 0, LASTCHAR, @aiDesignWidths[0]);

 // Get LOGFONT for current font in device context
  hFont := GetCurrentObject (hdc, OBJ_FONT);
  GetObject(hFont, SizeOf(TLogFont), @lf);

 // Scale the widths and store as floating point values
  dScale := - lf.lfHeight / uEMSquare;
  for i := 0 to LASTCHAR do
    PDouble(Integer(pdWidths) + SizeOf(Double) * i)^ := dScale * aiDesignWidths[i];
end;

  //  Calculates text width in floating point
function GetTextExtentFloat(pdWidths: PDouble; psText: PChar; iCount: Integer): Double;
var
  i: Integer;
begin
  Result := 0.0;
  for i := 0 to iCount - 1 do
    Result := Result + PDouble(Integer(pdWidths) + SizeOf(Double) * Integer(psText[i]))^;
end;

  // Based on design units for screen/printer compatibility
procedure Justify(hdc: HDC; pText: PChar; prc: PRect; iAlign: Integer);
var
  dWidth: Double;
  adWidths: array[0..LASTCHAR] of Double;
  xStart, yStart, cSpaceChars: Integer;
  pBegin, pEnd: PChar;
  Size: TSize;
begin
 // Fill the adWidths array with floating point character widths
  GetScaledWidths(hdc, @adWidths[0]);
  yStart := prc.Top;
  repeat // for each text line
    cSpaceChars := 0; // initialize number of spaces in line
    while (pText^ = ' ') do Inc(pText); // skip over leading spaces
    pBegin := pText; // set pointer to char at beginning of line
    repeat // until the line is known
      pEnd := pText; // set pointer to char at end of line

      while (pText^ = #0) or (pText^ = ' ') do Inc(pText); // skip to next space
      Inc(pText);
      
      if (pText^ = #0) then Break;

     // after each space encountered, calculate extents
      Inc(cSpaceChars);
      dWidth := GetTextExtentFloat(@adWidths[0], pBegin, pText - pBegin - 1);
    until (dWidth >= (prc.Right - prc.Left));
    
    Dec(cSpaceChars); // discount last space at end of line
    while (PChar(Integer(pEnd) - 1)^ = ' ') do // eliminate trailing spaces
    begin
      Dec(pEnd);
      Dec(cSpaceChars);
    end;
   // if end of text and no space characters, set pEnd to end
    if (pText^ = #0) or (cSpaceChars <= 0)  then pEnd := pText;

   // Now get integer extents
    GetTextExtentPoint32(hdc, pBegin, pEnd - pBegin, Size);

   // use alignment for xStart    
    case (iAlign) of
      IDM_ALIGN_LEFT:
        xStart := prc.Left;

      IDM_ALIGN_RIGHT:
        xStart := prc.Right - Size.cx;

      IDM_ALIGN_CENTER:
        xStart := (prc.Right + prc.Left - Size.cx) div 2;

      IDM_ALIGN_JUSTIFIED:
        begin
          if (pText^ <> #0) and (cSpaceChars > 0) then
            SetTextJustification(hdc, prc.Right - prc.Left - Size.cx, cSpaceChars);
          xStart := prc.Left;
        end;

      else xStart := 0;
    end;
   // display the text
    TextOut(hdc, xStart, yStart, pBegin, pEnd - pBegin);
    
   // prepare for next line
    SetTextJustification(hdc, 0, 0);      
    Inc(yStart, Size.cy);
    pText := pEnd;
  until (pText^ = #0) or (yStart >= prc.Bottom - Size.cy);
end;

  // 窗体过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
    // 初始化字符串
  procedure InitString(var Str: string);
  begin
    Str :=
      'Call me Ishmael. Some years ago -- never ' +
      'mind how long precisely -- having little ' +
      'or no money in my purse, and nothing ' +
      'particular to interest me on shore, I ' +
      'thought I would sail about a little and ' +
      'see the watery part of the world. It is ' +
      'a way I have of driving off the spleen, ' +
      'and regulating the circulation. Whenever ' +
      'I find myself growing grim about the ' +
      'mouth; whenever it is a damp, drizzly ' +
      'November in my soul; whenever I find ' +
      'myself involuntarily pausing before ' +
      'coffin warehouses, and bringing up the ' +
      'rear of every funeral I meet; and ' +
      'especially whenever my hypos get such an ' +
      'upper hand of me, that it requires a ' +
      'strong moral principle to prevent me ' +
      'from deliberately stepping into the ' +
      'street, and methodically knocking ' +
      'people'#39's hats off -- then, I account it ' +
      'high time to get to sea as soon as I ' +
      'can. This is my substitute for pistol ' +
      'and ball. With a philosophical flourish ' +
      'Cato throws himself upon his sword; I ' +
      'quietly take to the ship. There is ' +
      'nothing surprising in this. If they but ' +
      'knew it, almost all men in their degree, ' +
      'some time or other, cherish very nearly ' +
      'the same feelings towards the ocean with ' +
      'me.' ;
  end;
const
{$J+}
  szText: string = '';
  cf: TChooseFont = ();
  iAlign: Integer = IDM_ALIGN_LEFT;
  lf: TLogFont = ();
  di: TDocInfo = (); // = { sizeof (DOCINFO), TEXT ("Justify1: Printing") } ;
  pd: TPrintDlg = ();
{$J-}
var
  hdcWnd, hdcPrn: HDC;
  ps: TPaintStruct;
  Rect: TRect;
  fSuccess: Boolean;
  hMenu: LongWord; // HMENU
  iSavePointSize: Integer;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      begin
        InitString(szText);

        di.cbSize := SizeOf(TDocInfo);
        di.lpszDocName := 'Justify2: Printing';

        hdcWnd := GetDC(hWnd);
        lf.lfHeight := - GetDeviceCaps(hdcWnd, LOGPIXELSY) div 6;
        lf.lfOutPrecision := OUT_TT_ONLY_PRECIS;
        lstrcpy(lf.lfFaceName, 'Times New Roman');
        ReleaseDC(hWnd, hdcWnd);

        cf.lStructSize := SizeOf(TChooseFont) ;
        cf.hwndOwner := hWnd;
        cf.hDC := 0;
        cf.lpLogFont := @lf;
        cf.iPointSize := 120;                                  // TrueType only!
        cf.Flags := CF_INITTOLOGFONTSTRUCT or CF_SCREENFONTS or CF_TTONLY or CF_EFFECTS;
        cf.rgbColors := 0;
        cf.lCustData := 0;
        cf.lpfnHook := nil;
        cf.lpTemplateName := nil;
        cf.hInstance := 0;
        cf.lpszStyle := nil;
        cf.nFontType := 0;
        cf.nSizeMin := 0;
        cf.nSizeMax := 0;
      end;

    WM_COMMAND:
      begin
        hMenu := GetMenu(hWnd);
        case wParam of
          IDM_FILE_PRINT:
            begin
             // Get printer DC
              pd.lStructSize := SizeOf(TPrintDlg);
              pd.hwndOwner := hWnd;
              pd.Flags := PD_RETURNDC or PD_NOPAGENUMS or PD_NOSELECTION;
              if (not PrintDlg(pd)) then Exit; // return 0

              hdcPrn := pd.hDC;
              if (hdcPrn = 0) then
              begin
                MessageBox(hWnd,
                  'Cannot obtain Printer DC', szAppName, MB_ICONEXCLAMATION or MB_OK);
                Exit;
              end;

             // Set margins for OUTWIDTH inches wide
              Rect.Left := (GetDeviceCaps(hdcPrn, PHYSICALWIDTH) -
                GetDeviceCaps(hdcPrn, LOGPIXELSX) * OUTWIDTH) div 2 -
                GetDeviceCaps(hdcPrn, PHYSICALOFFSETX);
              Rect.Right := Rect.Left + GetDeviceCaps(hdcPrn, LOGPIXELSX) * OUTWIDTH;

             // Set margins of 1 inch at top and bottom
              Rect.Top := GetDeviceCaps(hdcPrn, LOGPIXELSY) -
                GetDeviceCaps(hdcPrn, PHYSICALOFFSETY);
              Rect.Bottom := GetDeviceCaps(hdcPrn, PHYSICALHEIGHT) -
                GetDeviceCaps(hdcPrn, LOGPIXELSY) -
                GetDeviceCaps(hdcPrn, PHYSICALOFFSETY);

             // Display text on printer
              SetCursor(LoadCursor(0, IDC_WAIT));
              ShowCursor(TRUE);
              fSuccess := FALSE;
              if (StartDoc(hdcPrn, di) > 0) and (StartPage(hdcPrn) > 0) then
              begin
               // Select font using adjusted lfHeight
                iSavePointSize := lf.lfHeight;
                lf.lfHeight := - (GetDeviceCaps(hdcPrn, LOGPIXELSY) * cf.iPointSize) div 720;
                SelectObject(hdcPrn, CreateFontIndirect(lf));
                lf.lfHeight := iSavePointSize;

               // Set text color
                SetTextColor(hdcPrn, cf.rgbColors);

               // Display text
                Justify(hdcPrn, PChar(szText), @Rect, iAlign);
                if (EndPage(hdcPrn) > 0) then
                begin
                  fSuccess := TRUE;
                  EndDoc(hdcPrn);
                end;
              end;
              ShowCursor(FALSE);
              SetCursor(LoadCursor(0, IDC_ARROW));
              DeleteDC(hdcPrn);
              if (not fSuccess) then
                MessageBox(hWnd, 'Could not print text',
                  szAppName, MB_ICONEXCLAMATION or MB_OK);
            end;

          IDM_FONT:
            begin
              if (ChooseFont(cf)) then // 选择了新字体
                InvalidateRect(hWnd, nil, TRUE); // 刷新窗体(重绘)
            end;

          IDM_ALIGN_LEFT,
          IDM_ALIGN_RIGHT,
          IDM_ALIGN_CENTER,
          IDM_ALIGN_JUSTIFIED:
            begin
              CheckMenuItem(hMenu, iAlign, MF_UNCHECKED);
              iAlign := LOWORD(wParam);
              CheckMenuItem(hMenu, iAlign, MF_CHECKED);
              InvalidateRect(hWnd, nil, TRUE);
            end;
        end;
      end;

    WM_PAINT:
      begin
        hdcWnd := BeginPaint(hWnd, ps);

        GetClientRect(hWnd, Rect);
        DrawRuler(hdcWnd, @Rect);

        Inc(Rect.Left, GetDeviceCaps(hdcWnd, LOGPIXELSX) div 2);
        Inc(Rect.Top, GetDeviceCaps(hdcWnd, LOGPIXELSY) div 2);
        Rect.Right := Rect.Left + OUTWIDTH * GetDeviceCaps(hdcWnd, LOGPIXELSX);

        SelectObject(hdcWnd, CreateFontIndirect(lf));
        SetTextColor(hdcWnd, cf.rgbColors);
        Justify(hdcWnd, PChar(szText), @Rect, iAlign);
        
        DeleteObject(SelectObject(hdcWnd, GetStockObject(SYSTEM_FONT)));

        EndPaint(hWnd, ps);
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0); // 放一个退出消息WM_QUIT
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end; 

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
  WndClass.lpszMenuName := szAppName;
  WndClass.lpszClassName := szAppName;

 // 注册窗体类
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(szAppName, 'Justified Type #2',
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
