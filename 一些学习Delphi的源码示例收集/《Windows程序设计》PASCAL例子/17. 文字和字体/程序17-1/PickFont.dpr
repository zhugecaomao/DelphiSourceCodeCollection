program  PickFont;

{$R  PickFont.res}

uses
  Windows, Messages, CommDlg, Math;

type
  PDlgParams = ^TDlgParams;
  TDlgParams = record // Structure shared between main window and dialog box
    iDevice, iMapMode: Integer;
    fMatchAspect: Boolean;
    fAdvGraphics: Boolean;
    lf: TLogFont;
    tm: TTextMetric;
    szFaceName: array[0..LF_FULLFACESIZE] of Char;
  end;

const
  szAppName = 'PickFont';
  IDC_LF_HEIGHT       = 1000;
  IDC_LF_WIDTH        = 1001;
  IDC_LF_ESCAPE       = 1002;
  IDC_LF_ORIENT       = 1003;
  IDC_LF_WEIGHT       = 1004;
  IDC_MM_TEXT         = 1005;
  IDC_MM_LOMETRIC     = 1006;
  IDC_MM_HIMETRIC     = 1007;
  IDC_MM_LOENGLISH    = 1008;
  IDC_MM_HIENGLISH    = 1009;
  IDC_MM_TWIPS        = 1010;
  IDC_MM_LOGTWIPS     = 1011;
  IDC_LF_ITALIC       = 1012;
  IDC_LF_UNDER        = 1013;
  IDC_LF_STRIKE       = 1014;
  IDC_MATCH_ASPECT    = 1015;
  IDC_ADV_GRAPHICS    = 1016;
  IDC_LF_CHARSET      = 1017;
  IDC_CHARSET_HELP    = 1018;
  IDC_DEFAULT_QUALITY = 1019;
  IDC_DRAFT_QUALITY   = 1020;
  IDC_PROOF_QUALITY   = 1021;
  IDC_LF_FACENAME     = 1022;
  IDC_OUT_DEFAULT     = 1023;
  IDC_OUT_STRING      = 1024;
  IDC_OUT_CHARACTER   = 1025;
  IDC_OUT_STROKE      = 1026;
  IDC_OUT_TT          = 1027;
  IDC_OUT_DEVICE      = 1028;
  IDC_OUT_RASTER      = 1029;
  IDC_OUT_TT_ONLY     = 1030;
  IDC_OUT_OUTLINE     = 1031;
  IDC_DEFAULT_PITCH   = 1032;
  IDC_FIXED_PITCH     = 1033;
  IDC_VARIABLE_PITCH  = 1034;
  IDC_FF_DONTCARE     = 1035;
  IDC_FF_ROMAN        = 1036;
  IDC_FF_SWISS        = 1037;
  IDC_FF_MODERN       = 1038;
  IDC_FF_SCRIPT       = 1039;
  IDC_FF_DECORATIVE   = 1040;
  IDC_TM_HEIGHT       = 1041;
  IDC_TM_ASCENT       = 1042;
  IDC_TM_DESCENT      = 1043;
  IDC_TM_INTLEAD      = 1044;
  IDC_TM_EXTLEAD      = 1045;
  IDC_TM_AVECHAR      = 1046;
  IDC_TM_MAXCHAR      = 1047;
  IDC_TM_WEIGHT       = 1048;
  IDC_TM_OVERHANG     = 1049;
  IDC_TM_DIGASPX      = 1050;
  IDC_TM_DIGASPY      = 1051;
  IDC_TM_FIRSTCHAR    = 1052;
  IDC_TM_LASTCHAR     = 1053;
  IDC_TM_DEFCHAR      = 1054;
  IDC_TM_BREAKCHAR    = 1055;
  IDC_TM_ITALIC       = 1056;
  IDC_TM_UNDER        = 1057;
  IDC_TM_STRUCK       = 1058;
  IDC_TM_VARIABLE     = 1059;
  IDC_TM_VECTOR       = 1060;
  IDC_TM_TRUETYPE     = 1061;
  IDC_TM_DEVICE       = 1062;
  IDC_TM_FAMILY       = 1063;
  IDC_TM_CHARSET      = 1064;
  IDC_TM_FACENAME     = 1065;
  IDM_DEVICE_SCREEN   = 40001;
  IDM_DEVICE_PRINTER  = 40002;

var
  hdlg: HWND; // 对话框句柄

  // 重新引入 API 以便调用
function GetDlgItemInt(hDlg: HWND; nIDDlgItem: Integer; lpTranslated: PBOOL;
  bSigned: BOOL): UINT; stdcall; external user32 name 'GetDlgItemInt';

  // IfThen()函数PChar版
function IfThenPChar(AValue: Boolean; const ATrue: PChar; const AFalse: PChar = nil): PChar;
begin
  if AValue then Result := ATrue else Result := AFalse;
end;

  // 从对话框上获得数据存入结构
procedure SetLogFontFromFields(hdlg: HWND; pdp: PDlgParams);
begin                      
  pdp.lf.lfHeight := GetDlgItemInt(hdlg, IDC_LF_HEIGHT, nil, TRUE);
  pdp.lf.lfWidth := GetDlgItemInt(hdlg, IDC_LF_WIDTH, nil, TRUE);
  pdp.lf.lfEscapement := GetDlgItemInt(hdlg, IDC_LF_ESCAPE, nil, TRUE);
  pdp.lf.lfOrientation := GetDlgItemInt(hdlg,IDC_LF_ORIENT, nil, TRUE);
  pdp.lf.lfWeight := GetDlgItemInt(hdlg, IDC_LF_WEIGHT, nil, TRUE);
  pdp.lf.lfCharSet := GetDlgItemInt(hdlg, IDC_LF_CHARSET, nil, FALSE);
  pdp.lf.lfItalic := Byte(IsDlgButtonChecked(hdlg, IDC_LF_ITALIC) = BST_CHECKED);
  pdp.lf.lfUnderline := Byte(IsDlgButtonChecked(hdlg, IDC_LF_UNDER) = BST_CHECKED);
  pdp.lf.lfStrikeOut := Byte(IsDlgButtonChecked(hdlg, IDC_LF_STRIKE) = BST_CHECKED);
  GetDlgItemText(hdlg, IDC_LF_FACENAME, pdp.lf.lfFaceName, LF_FACESIZE);
end;

  // 按照结构数据设置对话框
procedure SetFieldsFromTextMetric(hdlg: HWND; pdp: PDlgParams);
const
  szYes = 'Yes';
  szNo  = 'No';
  BCHARFORM = '0x%02X'; // Formatting for BCHAR fields of TEXTMETRIC structure  
  szFamily: array[0..6] of PChar =
    ( 'Don'#$27't Know', 'Roman', 'Swiss', 'Modern', 'Script', 'Decorative', 'Undefined' );
var
  szBuffer: array[0..10] of Char;
begin
  SetDlgItemInt(hdlg, IDC_TM_HEIGHT, pdp.tm.tmHeight, TRUE);
  SetDlgItemInt(hdlg, IDC_TM_ASCENT, pdp.tm.tmAscent, TRUE);
  SetDlgItemInt(hdlg, IDC_TM_DESCENT, pdp.tm.tmDescent, TRUE);
  SetDlgItemInt(hdlg, IDC_TM_INTLEAD, pdp.tm.tmInternalLeading, TRUE);
  SetDlgItemInt(hdlg, IDC_TM_EXTLEAD, pdp.tm.tmExternalLeading, TRUE);
  SetDlgItemInt(hdlg, IDC_TM_AVECHAR, pdp.tm.tmAveCharWidth, TRUE);
  SetDlgItemInt(hdlg, IDC_TM_MAXCHAR, pdp.tm.tmMaxCharWidth, TRUE);
  SetDlgItemInt(hdlg, IDC_TM_WEIGHT, pdp.tm.tmWeight, TRUE);
  SetDlgItemInt(hdlg, IDC_TM_OVERHANG, pdp.tm.tmOverhang, TRUE);
  SetDlgItemInt(hdlg, IDC_TM_DIGASPX, pdp.tm.tmDigitizedAspectX, TRUE);
  SetDlgItemInt(hdlg, IDC_TM_DIGASPY, pdp.tm.tmDigitizedAspectY, TRUE);
  wvsprintf(szBuffer, BCHARFORM, @pdp.tm.tmFirstChar);
  SetDlgItemText(hdlg, IDC_TM_FIRSTCHAR, szBuffer);
  wvsprintf(szBuffer, BCHARFORM, @pdp.tm.tmLastChar);
  SetDlgItemText(hdlg, IDC_TM_LASTCHAR, szBuffer);
  wvsprintf(szBuffer, BCHARFORM, @pdp.tm.tmDefaultChar);
  SetDlgItemText(hdlg, IDC_TM_DEFCHAR, szBuffer);
  wvsprintf(szBuffer, BCHARFORM, @pdp.tm.tmBreakChar);
  SetDlgItemText(hdlg, IDC_TM_BREAKCHAR, szBuffer);
  SetDlgItemText(hdlg, IDC_TM_ITALIC, IfThenPChar(pdp.tm.tmItalic <> 0, szYes, szNo));
  SetDlgItemText(hdlg, IDC_TM_UNDER, IfThenPChar(pdp.tm.tmUnderlined <> 0, szYes, szNo));
  SetDlgItemText(hdlg, IDC_TM_STRUCK, IfThenPChar(pdp.tm.tmStruckOut <> 0, szYes, szNo));
  SetDlgItemText(hdlg, IDC_TM_VARIABLE, IfThenPChar((TMPF_FIXED_PITCH and pdp.tm.tmPitchAndFamily) <> 0, szYes, szNo));
  SetDlgItemText(hdlg, IDC_TM_VECTOR, IfThenPChar((TMPF_VECTOR and pdp.tm.tmPitchAndFamily) <> 0, szYes, szNo));
  SetDlgItemText(hdlg, IDC_TM_TRUETYPE, IfThenPChar((TMPF_TRUETYPE and pdp.tm.tmPitchAndFamily) <> 0, szYes, szNo));
  SetDlgItemText(hdlg, IDC_TM_DEVICE, IfThenPChar((TMPF_DEVICE and pdp.tm.tmPitchAndFamily) <> 0, szYes, szNo));
  SetDlgItemText(hdlg, IDC_TM_FAMILY, szFamily[Min(6, pdp.tm.tmPitchAndFamily shr 4)]);
  SetDlgItemInt(hdlg, IDC_TM_CHARSET, pdp.tm.tmCharSet, FALSE);
  SetDlgItemText(hdlg, IDC_TM_FACENAME, pdp.szFaceName);
end;

  // 设置窗体映射模式
procedure MySetMapMode(hdc: HDC; iMapMode: Integer);
begin
  case (iMapMode) of
    IDC_MM_TEXT:
      begin
        SetMapMode(hdc, MM_TEXT);
      end;

    IDC_MM_LOMETRIC:
      begin
        SetMapMode(hdc, MM_LOMETRIC);
      end;

    IDC_MM_HIMETRIC:
      begin
        SetMapMode(hdc, MM_HIMETRIC);
      end;

    IDC_MM_LOENGLISH:
      begin
        SetMapMode(hdc, MM_LOENGLISH);
      end;

    IDC_MM_HIENGLISH:
      begin
        SetMapMode(hdc, MM_HIENGLISH);
      end;

    IDC_MM_TWIPS:
      begin
        SetMapMode(hdc, MM_TWIPS);
      end;
      
    IDC_MM_LOGTWIPS:
      begin
        SetMapMode(hdc, MM_ANISOTROPIC) ;
        SetWindowExtEx(hdc, 1440, 1440, nil);
        SetViewportExtEx(hdc, GetDeviceCaps(hdc, LOGPIXELSX), GetDeviceCaps(hdc, LOGPIXELSY), nil);
      end;
  end;
end;

  // 对话框消息接收过程
function DlgProc(hdlg: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
const
{$J+}
  pdp: PDlgParams = nil;
  pd: TPrintDlg = (); // = { sizeof (PRINTDLG) } ;
{$J-}  
var
  hdcDevice: HDC;
  hFont: LongWord; // HFONT
begin
  Result := TRUE; // 已经处理消息
  case Msg of
    WM_INITDIALOG:
      begin
        pd.lStructSize := SizeOf(TPrintDlg);
        pdp := PDlgParams(lParam); // lParam 为主窗体传来的dp地址
        SendDlgItemMessage(hdlg, IDC_LF_FACENAME, EM_LIMITTEXT, LF_FACESIZE - 1, 0);
        CheckRadioButton(hdlg, IDC_OUT_DEFAULT, IDC_OUT_OUTLINE, IDC_OUT_DEFAULT);
        CheckRadioButton(hdlg, IDC_DEFAULT_QUALITY, IDC_PROOF_QUALITY, IDC_DEFAULT_QUALITY);
        CheckRadioButton(hdlg, IDC_DEFAULT_PITCH, IDC_VARIABLE_PITCH, IDC_DEFAULT_PITCH);
        CheckRadioButton(hdlg, IDC_FF_DONTCARE, IDC_FF_DECORATIVE, IDC_FF_DONTCARE);
        CheckRadioButton(hdlg, IDC_MM_TEXT, IDC_MM_LOGTWIPS, IDC_MM_TEXT);
        SendMessage(hdlg, WM_COMMAND, IDOK, 0); // 设定..
        Result := DlgProc(hdlg, WM_SETFOCUS, 0, 0); // fall through
      end;

    WM_SETFOCUS:
      begin
        SetFocus(GetDlgItem(hdlg, IDC_LF_HEIGHT));
        Result := FALSE;
      end;

    WM_COMMAND:
      begin
        case LOWORD(wParam) of
          IDC_CHARSET_HELP:
            begin
              MessageBox(hdlg,
                PChar(
                '0           =      Ansi'#13#10 +
                '1           =      Default'#13#10 +
                '2           =      Symbol'#13#10 +
                '128 =      Shift JIS (Japanese)'#13#10 +
                '129 =      Hangul (Korean)'#13#10 +
                '130 =      Johab (Korean)'#13#10 +
                '134 =      GB 2312 (Simplified Chinese)'#13#10 +
                '136 =      Chinese Big 5 (Traditional Chinese)'#13#10 +
                '177 =      Hebrew'#13#10 +
                '178 =      Arabic'#13#10 +
                '161 =      Greek'#13#10 +
                '162 =      Turkish'#13#10 +
                '163 =      Vietnamese'#13#10 +
                '204 =      Russian'#13#10 +
                '222 =      Thai'#13#10 +
                '238 =      East European'#13#10 +
                '255 =      OEM'),
                szAppName, MB_OK or MB_ICONINFORMATION);
            end;

          // These radio buttons set the lfOutPrecision field
          IDC_OUT_DEFAULT:
            begin
              pdp.lf.lfOutPrecision := OUT_DEFAULT_PRECIS;
            end;

          IDC_OUT_STRING:
            begin
              pdp.lf.lfOutPrecision := OUT_STRING_PRECIS;
            end;

          IDC_OUT_CHARACTER:
            begin
              pdp.lf.lfOutPrecision := OUT_CHARACTER_PRECIS;
            end;

          IDC_OUT_STROKE:
            begin
              pdp.lf.lfOutPrecision := OUT_STROKE_PRECIS;
            end;

          IDC_OUT_TT:
            begin
              pdp.lf.lfOutPrecision := OUT_TT_PRECIS;
            end;

          IDC_OUT_DEVICE:
            begin
              pdp.lf.lfOutPrecision := OUT_DEVICE_PRECIS;
            end;

          IDC_OUT_RASTER:
            begin
              pdp.lf.lfOutPrecision := OUT_RASTER_PRECIS;
            end;

          IDC_OUT_TT_ONLY:
            begin
              pdp.lf.lfOutPrecision := OUT_TT_ONLY_PRECIS;
            end;

          IDC_OUT_OUTLINE:
            begin
              pdp.lf.lfOutPrecision := OUT_OUTLINE_PRECIS;
            end;

          // These three radio buttons set the lfQuality field
          IDC_DEFAULT_QUALITY:
            begin
              pdp.lf.lfQuality := DEFAULT_QUALITY;
            end;

          IDC_DRAFT_QUALITY:
            begin
              pdp.lf.lfQuality := DRAFT_QUALITY;
            end;

          IDC_PROOF_QUALITY:
            begin
              pdp.lf.lfQuality := PROOF_QUALITY;
            end;

          // These three radio buttons set the lower nibble
          //   of the lfPitchAndFamily field
          IDC_DEFAULT_PITCH:
            begin
              pdp.lf.lfPitchAndFamily :=
                ($F0 and pdp.lf.lfPitchAndFamily) or DEFAULT_PITCH;
            end;

          IDC_FIXED_PITCH:
            begin
              pdp.lf.lfPitchAndFamily :=
                ($F0 and pdp.lf.lfPitchAndFamily) or FIXED_PITCH;
            end;

          IDC_VARIABLE_PITCH:
            begin
              pdp.lf.lfPitchAndFamily :=
                ($F0 and pdp.lf.lfPitchAndFamily) or VARIABLE_PITCH;
            end;

          // These six radio buttons set the upper nibble
          //   of the lfPitchAndFamily field
          IDC_FF_DONTCARE:
            begin
              pdp.lf.lfPitchAndFamily :=
                ($0F and pdp.lf.lfPitchAndFamily) or FF_DONTCARE;
            end;

          IDC_FF_ROMAN:
            begin
              pdp.lf.lfPitchAndFamily :=
                ($0F and pdp.lf.lfPitchAndFamily) or FF_ROMAN;
            end;

          IDC_FF_SWISS:
            begin
              pdp.lf.lfPitchAndFamily :=
                ($0F and pdp.lf.lfPitchAndFamily) or FF_SWISS;
            end;

          IDC_FF_MODERN:
            begin
              pdp.lf.lfPitchAndFamily :=
                ($0F and pdp.lf.lfPitchAndFamily) or FF_MODERN;
            end;

          IDC_FF_SCRIPT:
            begin
              pdp.lf.lfPitchAndFamily :=
                ($0F and pdp.lf.lfPitchAndFamily) or FF_SCRIPT;
            end;

          IDC_FF_DECORATIVE:
            begin
              pdp.lf.lfPitchAndFamily :=
                ($0F and pdp.lf.lfPitchAndFamily) or FF_DECORATIVE;
            end;

          // Mapping mode:
          IDC_MM_TEXT,
          IDC_MM_LOMETRIC,
          IDC_MM_HIMETRIC,
          IDC_MM_LOENGLISH,
          IDC_MM_HIENGLISH,
          IDC_MM_TWIPS,
          IDC_MM_LOGTWIPS:
            begin
              pdp.iMapMode := LOWORD(wParam);
            end;

          // OK button pressed
          IDOK:
            begin
             // Get LOGFONT structure
              SetLogFontFromFields(hdlg, pdp);
             // Set Match-Aspect and Advanced Graphics flags
              pdp.fMatchAspect := Boolean(IsDlgButtonChecked(hdlg, IDC_MATCH_ASPECT));
              pdp.fAdvGraphics := Boolean(IsDlgButtonChecked(hdlg, IDC_ADV_GRAPHICS));
             // Get Information Context
              if (pdp.iDevice = IDM_DEVICE_SCREEN) then
              begin
                hdcDevice := CreateIC('DISPLAY', nil, nil, nil);
              end else
              begin
                pd.hwndOwner := hdlg;
                pd.Flags := PD_RETURNDEFAULT or PD_RETURNIC;
                pd.hDevNames := 0;
                pd.hDevMode := 0;
                PrintDlg(pd);
                hdcDevice := pd.hDC;
              end;
             // Set the mapping mode and the mapper flag
              MySetMapMode(hdcDevice, pdp.iMapMode);
              SetMapperFlags(hdcDevice, Cardinal(pdp.fMatchAspect));
             // Create font and select it into IC
              hFont := CreateFontIndirect(pdp.lf);
              SelectObject(hdcDevice, hFont);
             // Get the text metrics and face name
              GetTextMetrics(hdcDevice, pdp.tm);
              GetTextFace(hdcDevice, LF_FULLFACESIZE, pdp.szFaceName);
              DeleteDC(hdcDevice);
              DeleteObject(hFont);
             // Update dialog fields and invalidate main window
              SetFieldsFromTextMetric(hdlg, pdp);
              InvalidateRect(GetParent (hdlg), nil, TRUE);
            end;

          else
            begin
              Result := FALSE;
            end;
        end; // END case LOWORD(wParam) of ..
      end; // END WM_COMMAND ..

    else
      begin
        Result := FALSE;
      end;
  end; // END case Msg of ..
end;


  // 窗体消息处理函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  dp: TDlgParams =
   (
    iDevice: IDM_DEVICE_SCREEN;
    iMapMode: 0;
    fMatchAspect: FALSE;
    fAdvGraphics: FALSE;
    lf: ();
    tm: ();
    szFaceName: '';
   );
{$J-}
  szText =
    #$41#$42#$43#$44#$45#$20#$61#$62#$63#$64#$65#$20#$C0#$C1#$C2#$C3#$C4#$C5#$20#$E0#$E1#$E2#$E3#$E4#$E5#$20;
var
  hdcWnd: HDC;
  ps: TPaintStruct;
  Rect: TRect;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      begin
        hdlg := CreateDialogParam(HInstance, szAppName, hWnd, @DlgProc, Integer(@dp));
      end;

    WM_SETFOCUS:
      begin
        SetFocus(hdlg);
      end;  

    WM_COMMAND:
      begin
        case LOWORD(wParam) of
          IDM_DEVICE_SCREEN,
          IDM_DEVICE_PRINTER:
            begin
              CheckMenuItem(GetMenu(hWnd), dp.iDevice, MF_UNCHECKED);
              dp.iDevice := LOWORD(wParam);
              CheckMenuItem(GetMenu(hWnd), dp.iDevice, MF_CHECKED);
              SendMessage(hWnd, WM_COMMAND, IDOK, 0);
            end;
        end;
      end;

    WM_PAINT:
      begin
        hdcWnd := BeginPaint(hWnd, ps);
        
      // Set graphics mode so escapement works in Windows NT
        SetGraphicsMode(hdcWnd, IfThen(dp.fAdvGraphics, GM_ADVANCED, GM_COMPATIBLE));
      // Set the mapping mode and the mapper flag
        MySetMapMode(hdcWnd, dp.iMapMode);
        SetMapperFlags(hdcWnd, Cardinal(dp.fMatchAspect));
      // Find the point to begin drawing text
        GetClientRect(hdlg, Rect);
        Inc(Rect.Bottom);
        DPtoLP(hdcWnd, Rect, 2);
      // Create and select the font; display the text
        SelectObject(hdcWnd, CreateFontIndirect(dp.lf));
        TextOut(hdcWnd, Rect.Left, Rect.Bottom, szText, lstrlen(szText));
        DeleteObject(SelectObject(hdcWnd, GetStockObject(SYSTEM_FONT)));

        EndPaint(hWnd, ps);
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0); // 退出消息循环
      end;
      
    else
      begin
        Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
      end;
  end;
end;

var
  hWnd: LongWord;
  Msg: TMsg;
  WndClass: TWndClass;
begin
 // 注册窗体类
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
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(szAppName, 'PickFont: Create Logical Font',
                       WS_OVERLAPPEDWINDOW or WS_CLIPCHILDREN,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       0, 0, hInstance, nil);

 // 显示窗体
  ShowWindow(hWnd, CmdShow);
  UpdateWindow(hWnd);
  
 // 消息循环
  while GetMessage(Msg, 0, 0, 0) do
  begin
    if (hdlg = 0) or (not IsDialogMessage(hdlg, Msg)) then
    begin
      TranslateMessage(Msg);
      DispatchMessage(Msg);
    end;  
  end;
end.
