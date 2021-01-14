program  SysPal2;

uses
  Windows, Messages;

const
  szAppName = 'SysPal2';

  // 是否支持调色板  
function CheckDisplay(hWnd: HWND): Boolean;
var
  hWndDc: HDC;
  iPalSize: Integer;
begin
  hWndDc := GetDC(hWnd);
  iPalSize := GetDeviceCaps(hWndDc, SIZEPALETTE);
  ReleaseDC(hWnd, hWndDc);
  if (iPalSize <> 256) then // 256色
  begin
    MessageBox(hWnd,
      'This program requires that the video '#13#10'display mode have a 256-color palette.',
      szAppName, MB_ICONERROR);
    Result := FALSE;
  end else
  begin
    Result := TRUE;
  end;  
end;

   // 窗体过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  hPalette: DWORD = 0;
  cxClient: Integer = 0;
  cyClient: Integer = 0;
{$J-}
var
  hBrush: DWORD;
  hWndDc: HDC;
  ps: TPaintStruct;
  Rect: TRect;
  i, x, y: Integer;
  plp: PLogPalette;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      begin
        if (CheckDisplay(hWnd) = FALSE) then
        begin
          Result := -1; // CreateWindow 返回 0
        end else
        begin
          GetMem(plp, SizeOf(TLogPalette) + 255 * SizeOf(TPaletteEntry));
          plp.palVersion := $0300 ;
          plp.palNumEntries := 256;
          for i := 0 to 255 do
          begin
            plp.palPalEntry[i].peRed := i;
            plp.palPalEntry[i].peGreen := 0;
            plp.palPalEntry[i].peBlue := 0;
            plp.palPalEntry[i].peFlags := PC_EXPLICIT;
          end;
          hPalette := CreatePalette(plp^); // 建立调色板
          FreeMem(plp);
        end;
      end;

    WM_DISPLAYCHANGE:
      begin
        if (CheckDisplay(hWnd) = FALSE) then DestroyWindow(hWnd);
      end;

    WM_SIZE:
      begin
        cxClient := LOWORD(lParam);
        cyClient := HIWORD(lParam);
      end;

    WM_PAINT:
      begin
        hWndDc := BeginPaint(hWnd, ps);

        SelectPalette(hWndDc, hPalette, FALSE);
        RealizePalette(hWndDc);
        for y := 0 to 15 do
          for x := 0 to 15 do
          begin
            hBrush := CreateSolidBrush(PaletteIndex(16 * y + x));
            SetRect(Rect, x * cxClient div 16, y * cyClient div 16,
              (x + 1) * cxClient div 16, (y + 1) * cyClient div 16);
            FillRect(hWndDc, Rect, hBrush);
            DeleteObject(hBrush);
          end;
          
        EndPaint(hWnd, ps);
      end;

    WM_PALETTECHANGED:
      begin
        if (wParam <> Integer(hWnd)) then InvalidateRect(hWnd, nil, FALSE);
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0); // 退出循环
        DeleteObject(hPalette);
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
 // 注册窗体类
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
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(szAppName, 'System Palette #2',
                       WS_OVERLAPPEDWINDOW,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       0, 0, hInstance, nil);   
  if (hWnd = 0) then Exit;

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
