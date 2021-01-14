program  ChosFont;

{$R ChosFont.Res}

uses
  Windows, Messages, CommDlg;

   // 窗体过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  cf: TChooseFont = ();
  cyChar: Integer = 0;
  lf: TLogFont = ();
{$J-}
  IDM_FONT = 40001;
  szText =
    #$41#$42#$43#$44#$45#$20#$61#$62#$63#$64#$65#$20#$C0#$C1#$C2#$C3#$C4#$C5#$20#$E0#$E1#$E2#$E3#$E4#$E5#$20;
var
  hdcWnd: HDC;
  y: Integer;
  ps: TPaintStruct;
  szBuffer: array[0..64] of Char;
  tm: TTextMetric;
  List: PChar;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      begin
      // Get text height
        cyChar := HIWORD(GetDialogBaseUnits());

      // Initialize the LOGFONT structure
        GetObject(GetStockObject(SYSTEM_FONT), SizeOf(TLogFont), @lf);
        
      // Initialize the CHOOSEFONT structure
        cf.lStructSize := SizeOf(TChooseFont);
        cf.hwndOwner := hWnd ;
        cf.hDC := 0;
        cf.lpLogFont := @lf;
        cf.iPointSize := 0;
        cf.Flags := CF_INITTOLOGFONTSTRUCT or CF_SCREENFONTS or CF_EFFECTS;
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
        case wParam of
          IDM_FONT:
            begin
              if (ChooseFont(cf)) then // 选择了新字体
                InvalidateRect(hWnd, nil, TRUE); // 刷新窗体(重绘)
            end;
        end;
      end;

    WM_PAINT:
      begin
        hdcWnd := BeginPaint(hWnd, ps);

        // Display sample text using selected font
        SelectObject(hdcWnd, CreateFontIndirect(lf));
        GetTextMetrics(hdcWnd, tm);
        SetTextColor(hdcWnd, cf.rgbColors);
        y := tm.tmExternalLeading;
        TextOut(hdcWnd, 0, y, szText, lstrlen(szText));
        
        // Display LOGFONT structure fields using system font
        DeleteObject(SelectObject(hdcWnd, GetStockObject(SYSTEM_FONT)));
        SetTextColor(hdcWnd, 0);

        Inc(y, tm.tmHeight);
        TextOut(hdcWnd, 0, y, szBuffer, wvsprintf(szBuffer, 'lfHeight = %i', @lf.lfHeight));

        Inc(y, cyChar);
        TextOut(hdcWnd, 0, y , szBuffer, wvsprintf(szBuffer, 'lfWidth = %i', @lf.lfWidth));

        Inc(y, cyChar);
        TextOut(hdcWnd, 0, y, szBuffer, wvsprintf(szBuffer, 'lfEscapement = %i', @lf.lfEscapement));

        Inc(y, cyChar);
        TextOut(hdcWnd, 0, y, szBuffer, wvsprintf(szBuffer, 'lfOrientation = %i', @lf.lfOrientation));

        Inc(y, cyChar);
        TextOut(hdcWnd, 0, y, szBuffer, wvsprintf(szBuffer, 'lfWeight = %i', @lf.lfWeight));

        Inc(y, cyChar);
        TextOut(hdcWnd, 0, y, szBuffer, wvsprintf(szBuffer, 'lfItalic = %i', @lf.lfItalic));

        Inc(y, cyChar);
        TextOut(hdcWnd, 0, y, szBuffer, wvsprintf(szBuffer, 'lfUnderline = %i', @lf.lfUnderline));

        Inc(y, cyChar);
        TextOut(hdcWnd, 0, y, szBuffer, wvsprintf(szBuffer, 'lfStrikeOut = %i', @lf.lfStrikeOut));

        Inc(y, cyChar);
        TextOut(hdcWnd, 0, y, szBuffer, wvsprintf(szBuffer, 'lfCharSet = %i', @lf.lfCharSet));

        Inc(y, cyChar);
        TextOut(hdcWnd, 0, y, szBuffer, wvsprintf(szBuffer, 'lfOutPrecision = %i', @lf.lfOutPrecision));

        Inc(y, cyChar);
        TextOut(hdcWnd, 0, y, szBuffer, wvsprintf(szBuffer, 'lfClipPrecision = %i', @lf.lfClipPrecision));

        Inc(y, cyChar);
        TextOut(hdcWnd, 0, y, szBuffer, wvsprintf(szBuffer, 'lfQuality = %i', @lf.lfQuality));

        Inc(y, cyChar);
        TextOut(hdcWnd, 0, y, szBuffer, wvsprintf(szBuffer, 'lfPitchAndFamily = 0x%02X', @lf.lfPitchAndFamily));

        Inc(y, cyChar);
        List := @lf.lfFaceName[0];
        TextOut(hdcWnd, 0, y, szBuffer, wvsprintf(szBuffer, 'lfFaceName = %s', @List));

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

const
  szAppName = 'ChosFont';
  
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
  hWnd := CreateWindow(szAppName, 'ChooseFont',
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
