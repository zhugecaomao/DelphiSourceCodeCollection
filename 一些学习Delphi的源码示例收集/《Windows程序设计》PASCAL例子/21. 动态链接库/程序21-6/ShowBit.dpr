program  ShowBit;

uses
  Windows, Messages;

const
  szAppName = 'ShowBit';  

  // 绘制位图
procedure DrawBitmap(hWndDc, xStart, yStart, hBitmap: Integer);
var
  bm: TBitmap;
  hMemDC: HDC;
  pt: TPoint;
begin
  hMemDC := CreateCompatibleDC(hWndDc);
  SelectObject(hMemDC, hBitmap);
  GetObject(hBitmap, SizeOf(TBitmap), @bm);
  pt.x := bm.bmWidth;
  pt.y := bm.bmHeight;
  BitBlt(hWndDc, xStart, yStart, pt.x, pt.y, hMemDC, 0, 0, SRCCOPY);
  DeleteDC(hMemDC);
end;

   // 窗体过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  hLibrary: Integer = 0;
  iCurrent: Integer = 1;
{$J-}
var
  hBitmap: LongWord; // HBITMAP
  hWndDc: HDC;
  ps: TPaintStruct;
begin
  Result := 0;
  case (Msg) of
    WM_CREATE:
      begin
        hLibrary := LoadLibrary('..\程序21-5\BITLIB.DLL'); // 资源DLL
        if (hLibrary = 0) then
        begin
          MessageBox(hWnd, 'Can'#$27't load BITLIB.DLL.', szAppName, 0);
          Result:= -1; // 阻止建立窗口
        end;
      end;

    WM_CHAR:
      begin
        if (hLibrary <> 0) then
        begin
          Inc(iCurrent); // 下一幅
          InvalidateRect(hWnd, nil, TRUE);
        end;
      end;

    WM_PAINT:
      begin
        hWndDc := BeginPaint(hWnd, ps);

        if (hLibrary <> 0) then
        begin
          hBitmap := LoadBitmap(hLibrary, MakeIntResource(iCurrent));
          if (hBitmap = 0) then
          begin
            iCurrent := 1;
            hBitmap := LoadBitmap(hLibrary, MakeIntResource(iCurrent));
          end;
          if (hBitmap <> 0) then
          begin
            DrawBitmap(hWndDc, 0, 0, hBitmap);
            DeleteObject(hBitmap);
          end;
        end;

        EndPaint(hWnd, ps);
      end;

    WM_DESTROY:
      begin
        if (hLibrary <> 0) then FreeLibrary(hLibrary);
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
  WndClass.lpszMenuName := nil;
  WndClass.lpszClassName := szAppName;

 // 注册类别
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(szAppName,
                       'Show Bitmaps from BITLIB (Press Key)',
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
