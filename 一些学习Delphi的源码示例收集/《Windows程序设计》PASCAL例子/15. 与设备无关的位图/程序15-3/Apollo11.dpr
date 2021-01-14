program  Apollo11;

uses
  Windows, Messages, DibFile;

const
  szAppName = 'Apollo11';

  // 窗体消息处理函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  pbmfh: array[0..1] of PBitmapFileHeader = (nil, nil);
  pbmi: array[0..1] of PBitmapInfo = (nil, nil);
  pBits: array[0..1] of PByte = (nil, nil);
  cxClient: Integer = 0;
  cyClient: Integer = 0;
  cxDib: array[0..1] of Integer = (0, 0);
  cyDib: array[0..1] of Integer = (0, 0);
{$J-}
var
  hWndDc: HDC;
  ps: TPaintStruct;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      begin
        pbmfh[0] := DibLoadImage('Apollo11.bmp');
        pbmfh[1] := DibLoadImage('ApolloTD.bmp');
        if (pbmfh[0] = nil) or (pbmfh[1] = nil) then
        begin
          MessageBox(hWnd, 'Cannot load DIB file', szAppName, 0);
          Exit;
        end;
       // Get pointers to the info structure & the bits
        pbmi[0] := PBitmapInfo(Integer(pbmfh[0]) + 14);
        pbmi[1] := PBitmapInfo(Integer(pbmfh[1]) + 14);
        pBits[0] := PByte(Integer(pbmfh[0]) + pbmfh[0].bfOffBits);
        pBits[1] := PByte(Integer(pbmfh[1]) + pbmfh[1].bfOffBits);
       // Get the DIB width and height (assume BITMAPINFOHEADER)
       // Note that cyDib is the absolute value of the header value!!!
        cxDib[0] := pbmi[0].bmiHeader.biWidth;
        cxDib[1] := pbmi[1].bmiHeader.biWidth;
        cyDib[0] := Abs(pbmi[0].bmiHeader.biHeight);
        cyDib[1] := Abs(pbmi[1].bmiHeader.biHeight);
      end;
    WM_SIZE:
      begin
        cxClient := LOWORD(lParam);
        cyClient := HIWORD(lParam);
      end;
    WM_PAINT:
      begin
        hWndDc := BeginPaint(hWnd, ps);
        
       // Bottom-up DIB full size
        SetDIBitsToDevice(hWndDc,
                          0,              // xDst
                          cyClient div 4, // yDst
                          cxDib[0],       // cxSrc
                          cyDib[0],       // cySrc
                          0,              // xSrc
                          0,              // ySrc
                          0,              // first scan line
                          cyDib[0],       // number of scan lines
                          pBits[0],
                          pbmi[0]^,
                          DIB_RGB_COLORS
                          );
       // Bottom-up DIB partial
        SetDIBitsToDevice(hWndDc,
                          240,            // xDst
                          cyClient div 4, // yDst
                          80,             // cxSrc
                          166,            // cySrc
                          80,             // xSrc
                          60,             // ySrc
                          0,              // first scan line
                          cyDib[0],       // number of scan lines
                          pBits[0],
                          pbmi[0]^,
                          DIB_RGB_COLORS
                          );
       // Top-down DIB full size
        SetDIBitsToDevice(hWndDc,
                          340,            // xDst
                          cyClient div 4, // yDst
                          cxDib[1],       // cxSrc
                          cyDib[1],       // cySrc
                          0,              // xSrc
                          0,              // ySrc
                          0,              // first scan line
                          cyDib[1],       // number of scan lines
                          pBits[1],
                          pbmi[1]^,
                          DIB_RGB_COLORS
                          );
       // Top-down DIB partial
        SetDIBitsToDevice(hWndDc,
                          580,            // xDst
                          cyClient div 4, // yDst
                          80,             // cxSrc
                          166,            // cySrc
                          80,             // xSrc
                          60,             // ySrc
                          0,              // first scan line
                          cyDib[1],       // number of scan lines
                          pBits[1],
                          pbmi[1]^,
                          DIB_RGB_COLORS
                          );
                          
        EndPaint(hWnd, ps);
      end;
    WM_DESTROY:
      begin
        if (pbmfh[0] <> nil) then FreeMem(pbmfh[0]);
        if (pbmfh[1] <> nil) then FreeMem(pbmfh[1]);
        PostQuitMessage(0); // 退出
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
  hWnd := CreateWindow(szAppName, 'Apollo 11',
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
