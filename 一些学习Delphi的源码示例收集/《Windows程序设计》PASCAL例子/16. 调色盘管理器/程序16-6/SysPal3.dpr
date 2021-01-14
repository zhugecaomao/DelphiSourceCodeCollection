program  SysPal3;

uses
  Windows, Messages;

const
  szAppName = 'SysPal3';

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
  hBitmap: LongWord = 0;
  cxClient: Integer = 0;
  cyClient: Integer = 0;
{$J-}
var
  hdcWnd, hdcMem: HDC;
  ps: TPaintStruct;
  J: Integer;
  Bits: array[0..255] of Byte;
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
          for J := 0 to 255 do Bits[J] := J;
          hBitmap := CreateBitmap(16, 16, 1, 8, @Bits[0]);
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
        hdcWnd := BeginPaint(hWnd, ps);

        hdcMem := CreateCompatibleDC(hdcWnd);
        SelectObject(hdcMem, hBitmap);
        StretchBlt(hdcWnd, 0, 0, cxClient, cyClient, hdcMem, 0, 0, 16, 16, SRCCOPY);
        DeleteDC(hdcMem);

        EndPaint(hWnd, ps);
      end;

    WM_PALETTECHANGED:
      begin
        if (wParam <> Integer(hWnd)) then InvalidateRect(hWnd, nil, FALSE);
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0); // 退出循环
        DeleteObject(hBitmap);
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
  hWnd := CreateWindow(szAppName, 'System Palette #3',
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
