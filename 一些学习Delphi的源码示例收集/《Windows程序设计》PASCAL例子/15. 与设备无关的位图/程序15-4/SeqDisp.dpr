program  SeqDisp;

{$R SeqDisp.res}

uses
  Windows, Messages, CommDlg, Math;

const
  szAppName = 'SeqDisp';

  // 窗体消息处理函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  IDM_FILE_OPEN = 40001;
  szFilter = 'Bitmap Files (*.BMP)'#0'*.bmp'#0'All Files (*.*)'#0'*.*'#0#0;
{$J+}
  pbmi: PBitmapInfo = nil;
  pBits: PByte = nil;
  cxDib: Integer = 0;
  cyDib: Integer = 0;
  cBits: Integer = 0;
  ofn: TOpenFilename =
    (
    lStructSize: SizeOf(TOpenFilename);
    hwndOwner: 0; // 属主窗口
    hInstance: 0;
    lpstrFilter: szFilter;
    lpstrCustomFilter: nil;
    nMaxCustFilter: 0;
    nFilterIndex: 0;
    lpstrFile: nil; // szFileName
    nMaxFile: MAX_PATH;
    lpstrFileTitle: nil; // szTitleName
    nMaxFileTitle: MAX_PATH;
    lpstrInitialDir: nil;
    lpstrTitle: nil;
    Flags: 0;
    nFileOffset: 0;
    nFileExtension: 0;
    lpstrDefExt: 'bmp';
    lCustData: 0;
    lpfnHook: nil;
    lpTemplateName: nil;
    );
  szFileName: PChar = nil;
  szTitleName: PChar = nil;
{$J+}
var
  bmfh: TBitmapFileHeader;
  bSuccess, bTopDown: Boolean;
  dwBytesRead: DWORD;
  hFile: THandle;
  hWndDc: HDC;
  hMenu: DWORD;
  iInfoSize, iBitsSize, iRowLength, y: Integer;
  ps: TPaintStruct;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      begin
        GetMem(szFileName, MAX_PATH);
        GetMem(szTitleName, MAX_PATH);
        ofn.hwndOwner := hWnd; // 属主窗口
        ofn.lpstrFile := szFileName; // 完整路径
        ofn.lpstrFileTitle := szTitleName; // 文件名
      end;    
    WM_COMMAND:
      begin
        hMenu := GetMenu(hWnd);
        case LOWORD(wParam) of
          IDM_FILE_OPEN:
            begin
             // 文件选择对话框
              if (not GetOpenFileName(ofn)) then Exit;
             // 释放以前申请的内存
              if (pbmi <> nil) then
              begin
                FreeMem(pbmi);
                pbmi := nil;
              end;
              if (pBits <> nil) then
              begin
                FreeMem(pBits);
                pBits := nil;
              end;
             // 刷新窗体
              InvalidateRect(hWnd, nil, TRUE);
              UpdateWindow(hwnd);
             // 打开文件
              hFile := CreateFile(szFileName, GENERIC_READ,
                               FILE_SHARE_READ, nil, OPEN_EXISTING,
                               FILE_FLAG_SEQUENTIAL_SCAN, 0);
              if (hFile = INVALID_HANDLE_VALUE) then
              begin
                MessageBox(hWnd, 'Cannot open file.', szAppName, MB_ICONWARNING or MB_OK);
                Exit;
              end;
             // 文件头
              bSuccess := ReadFile(hFile, bmfh, SizeOf(TBitmapFileHeader), dwBytesRead, nil);
              if (not bSuccess) or (dwBytesRead <> SizeOf(TBitmapFileHeader)) then
              begin
                MessageBox(hWnd, 'Cannot read file.', szAppName, MB_ICONWARNING or MB_OK);
                CloseHandle(hFile);
                Exit;
              end;
             // 检验'BM'标志
              if (bmfh.bfType <> PWORD(PChar('BM'))^) then
              begin
                MessageBox(hWnd, 'File is not a bitmap.', szAppName, MB_ICONWARNING or MB_OK);
                CloseHandle(hFile);
                Exit;
              end;
             // 分配内存 for header and bits
              iInfoSize := bmfh.bfOffBits - SizeOf(TBitmapFileHeader);
              iBitsSize := bmfh.bfSize - bmfh.bfOffBits;
              GetMem(pbmi, iInfoSize);
              GetMem(pBits, iBitsSize);
              if (pbmi = nil) or (pBits = nil) then
              begin
                MessageBox(hWnd, 'Cannot allocate memory.', szAppName, MB_ICONWARNING or MB_OK);
                if (pbmi <> nil) then FreeMem(pbmi);
                if (pBits <> nil) then FreeMem(pBits);
                CloseHandle(hFile);
                Exit;
              end;
             // DIB头
              bSuccess := ReadFile(hFile, pbmi^, iInfoSize,  dwBytesRead, nil);
              if (not bSuccess) or (dwBytesRead <> iInfoSize) then
              begin
                MessageBox(hWnd, 'Cannot read file.', szAppName, MB_ICONWARNING or MB_OK);
                if (pbmi <> nil) then FreeMem(pbmi);
                if (pBits <> nil) then FreeMem(pBits);
                CloseHandle(hFile);
                Exit;
              end;
             // DIB宽&高
              bTopDown := FALSE;
              if (pbmi.bmiHeader.biSize = SizeOf(TBitmapCoreHeader)) then
              begin
                cxDib := PBitmapCoreHeader(pbmi).bcWidth;
                cyDib := PBitmapCoreHeader(pbmi).bcHeight;
                cBits := PBitmapCoreHeader(pbmi).bcBitCount;
              end else
              begin
                if (pbmi.bmiHeader.biHeight < 0) then bTopDown := TRUE;
                cxDib := pbmi.bmiHeader.biWidth;
                cyDib := Abs(pbmi.bmiHeader.biHeight);
                cBits := pbmi.bmiHeader.biBitCount;
                if (pbmi.bmiHeader.biCompression <> BI_RGB) and
                   (pbmi.bmiHeader.biCompression <> BI_BITFIELDS) then
                begin
                  MessageBox(hWnd, 'File is compressed.', szAppName, MB_ICONWARNING or MB_OK);
                  if (pbmi <> nil) then FreeMem(pbmi);
                  if (pBits <> nil) then FreeMem(pBits);
                  CloseHandle(hFile);
                  Exit;
                end;
              end;
             // DIB行数
              iRowLength := ((cxDib * cBits + 31) and (not 31)) shr 3;
             // 读入并显示
              SetCursor(LoadCursor(0, IDC_WAIT));
              ShowCursor(TRUE);
              hWndDc := GetDC(hWnd);
              for y := 0 to cyDib - 1 do
              begin
                ReadFile(hFile, PByte(Integer(pBits) + y * iRowLength)^, iRowLength, dwBytesRead, nil);
                SetDIBitsToDevice(hWndDc,
                                  0,      // xDst
                                  0,      // yDst
                                  cxDib,  // cxSrc
                                  cyDib,  // cySrc
                                  0,      // xSrc
                                  0,      // ySrc
                                  IfThen(bTopDown, cyDib - y - 1, y), // number of scan lines
                                  1,
                                  PByte(Integer(pBits) + y * iRowLength),
                                  pbmi^,
                                  DIB_RGB_COLORS
                                  );
              end;
              ReleaseDC(hWnd, hWndDc);
              CloseHandle(hFile);
              ShowCursor(FALSE);
              SetCursor(LoadCursor(0, IDC_ARROW));
            end;
        end;
      end;
    WM_PAINT:
      begin
        hWndDc := BeginPaint(hWnd, ps);
        if (pbmi <> nil) and (pBits <> nil) then
          SetDIBitsToDevice(hWndDc,
                            0,            // xDst
                            0,            // yDst
                            cxDib,        // cxSrc
                            cyDib,        // cySrc
                            0,            // xSrc
                            0,            // ySrc
                            0,            // first scan line
                            cyDib,        // number of scan lines
                            pBits,
                            pbmi^,
                            DIB_RGB_COLORS
                            );
        EndPaint(hWnd, ps);
      end;
    WM_DESTROY:
      begin
        FreeMem(szFileName, MAX_PATH);
        FreeMem(szTitleName, MAX_PATH);
        if (pbmi <> nil) then FreeMem(pbmi);
        if (pBits <> nil) then FreeMem(pBits);
        PostQuitMessage(0); // 退出
      end;
    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end;

var
  hAccel, hWnd: LongWord;
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
  hWnd := CreateWindow(szAppName, 'DIB Sequential Display',
                       WS_OVERLAPPEDWINDOW,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       0, 0, hInstance, nil);
 // 显示窗体
  ShowWindow(hWnd, CmdShow);
  UpdateWindow(hWnd);
 // 载入快捷键 
  hAccel := LoadAccelerators(hInstance, szAppName);    
 // 消息循环
  while GetMessage(Msg, 0, 0, 0) do
  begin
    if (TranslateAccelerator(hWnd, hAccel, Msg) = 0) then
    begin
      TranslateMessage(Msg);
      DispatchMessage(Msg);
    end;
  end;
end.
