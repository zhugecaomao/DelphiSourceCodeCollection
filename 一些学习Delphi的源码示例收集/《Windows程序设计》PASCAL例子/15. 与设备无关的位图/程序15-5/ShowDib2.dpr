program  ShowDib2;

{$R ShowDib2.res}

uses
  Windows, Messages, CommDlg, DibFile;

const
  szAppName = 'ShowDib2';
  IDM_FILE_OPEN = 40001;
  IDM_SHOW_NORMAL = 40002;
  IDM_SHOW_CENTER = 40003;
  IDM_SHOW_STRETCH = 40004;
  IDM_SHOW_ISOSTRETCH = 40005;
  IDM_FILE_PRINT = 40006;
  IDM_EDIT_COPY = 40007;
  IDM_EDIT_CUT = 40008;
  IDM_EDIT_DELETE = 40009;
  IDM_FILE_SAVE = 40010; 

  // 绘制DIB
function ShowDib(hWndDc: HDC; pbmi: PBitmapInfo; pBits: PByte; cxDib, cyDib,
  cxClient, cyClient: Integer; wShow: WORD): Integer;
begin
  case wShow of
    IDM_SHOW_NORMAL:
      Result := SetDIBitsToDevice(hWndDc, 0, 0, cxDib, cyDib, 0, 0, 0, cyDib,
        pBits, pbmi^, DIB_RGB_COLORS);

    IDM_SHOW_CENTER:
      Result := SetDIBitsToDevice(hWndDc, (cxClient - cxDib) div 2, (cyClient - cyDib) div 2,
        cxDib, cyDib, 0, 0, 0, cyDib, pBits, pbmi^, DIB_RGB_COLORS);

    IDM_SHOW_STRETCH:
      begin
        SetStretchBltMode(hWndDc, COLORONCOLOR);
        Result := StretchDIBits(hWndDc, 0, 0, cxClient, cyClient, 0, 0, cxDib,
          cyDib, pBits, pbmi^, DIB_RGB_COLORS, SRCCOPY);
      end;

    IDM_SHOW_ISOSTRETCH:
      begin
        SetStretchBltMode(hWndDc, COLORONCOLOR);
        SetMapMode(hWndDc, MM_ISOTROPIC);
        SetWindowExtEx(hWndDc, cxDib, cyDib, nil);
        SetViewportExtEx(hWndDc, cxClient, cyClient, nil);
        SetWindowOrgEx(hWndDc, cxDib div 2, cyDib div 2, nil);
        SetViewportOrgEx(hWndDc, cxClient div 2, cyClient div 2, nil);
        Result := StretchDIBits(hWndDc,0, 0, cxDib, cyDib, 0, 0, cxDib, cyDib,
          pBits, pbmi^, DIB_RGB_COLORS, SRCCOPY);
      end;

    else
      Result := 0;
  end;
end;             

  // 窗体回调
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  pbmfh: PBitmapFileHeader = nil;
  pbmi: PBitmapInfo = nil;
  pBits: PByte = nil;
  di: TDocInfo =
    (
    cbSize: SizeOf(TDocInfo);
    lpszDocName: 'ShowDib2: Printing';
    lpszOutput: nil;
    lpszDatatype: nil;
    fwType: 0;
    );
  pd: TPrintDlg =
    (
    lStructSize: SizeOf(TPrintDlg);
    hWndOwner: 0;
    hDevMode: 0;
    hDevNames: 0;
    hDC: 0;
    Flags: 0;
    nFromPage: 0;
    nToPage: 0;
    nMinPage: 0;
    nMaxPage: 0;
    nCopies: 0;
    hInstance: 0;
    lCustData: 0;
    lpfnPrintHook: nil;
    lpfnSetupHook: nil;
    lpPrintTemplateName: nil;
    lpSetupTemplateName: nil;
    hPrintTemplate: 0;
    hSetupTemplate: 0;
    );
  cxClient: Integer = 0;
  cyClient: Integer = 0;
  cxDib: Integer = 0;
  cyDib: Integer = 0;
  szFileName: PChar = nil;
  szTitleName: PChar = nil;
  wShow: WORD = IDM_SHOW_NORMAL;
{$J-}
var
  hdcWnd, hdcPrn: HDC;
  ps: TPaintStruct;
  hGlobal, hMenu: DWORD;
  pGlobal: PByte;
  cxPage, cyPage, iEnable: Integer;
  bSuccess: Boolean;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      begin
        DibFileInitialize(hWnd);
        GetMem(szFileName, MAX_PATH);
        GetMem(szTitleName, MAX_PATH);
      end;

    WM_SIZE:
      begin
        cxClient := LOWORD(lParam);
        cyClient := HIWORD(lParam);
      end;

    WM_INITMENUPOPUP:
      begin
        hMenu := GetMenu(hWnd);
        if (pbmfh <> nil) then iEnable := MF_ENABLED else iEnable := MF_GRAYED;
        EnableMenuItem(hMenu, IDM_FILE_SAVE, iEnable);
        EnableMenuItem(hMenu, IDM_FILE_PRINT, iEnable);
        EnableMenuItem(hMenu, IDM_EDIT_CUT, iEnable);
        EnableMenuItem(hMenu, IDM_EDIT_COPY, iEnable);
        EnableMenuItem(hMenu, IDM_EDIT_DELETE, iEnable);
      end;

    WM_COMMAND:
      begin
        hMenu := GetMenu(hWnd);
        case LOWORD(wParam) of
          IDM_FILE_OPEN:
            begin
             // 文件选择对话框
              if (not DibFileOpenDlg(hWnd, szFileName, szTitleName)) then Exit;
             // 释放以前申请的内存
              if (pbmfh <> nil) then
              begin
                FreeMem(pbmfh);
                pbmfh := nil;
              end;
             // 装入DIB文件
              SetCursor(LoadCursor(0, IDC_WAIT));
              ShowCursor(TRUE);
              pbmfh := DibLoadImage(szFileName);
              ShowCursor(FALSE);
              SetCursor(LoadCursor(0, IDC_ARROW));
             // 刷新窗体(重绘)
              InvalidateRect(hWnd, nil, TRUE);
             // 装入出错
              if (pbmfh = nil) then
              begin
                MessageBox(hwnd, 'Cannot load DIB file', szAppName, 0);
                Exit;
              end;
             // 两处地址
              pbmi := PBitmapInfo(Integer(pbmfh) + 14);
              pBits := PByte(Integer(pbmfh) + pbmfh.bfOffBits);
             // DIB 尺寸
              if (pbmi.bmiHeader.biSize = SizeOf(TBitmapCoreHeader)) then
              begin
                cxDib := PBitmapCoreHeader(pbmi).bcWidth;
                cyDib := PBitmapCoreHeader(pbmi).bcHeight;
              end else
              begin
                cxDib := pbmi.bmiHeader.biWidth;
                cyDib := abs(pbmi.bmiHeader.biHeight);
              end;
            end;

          IDM_FILE_SAVE:
            begin
             // 文件保存对话框
              if (not DibFileSaveDlg(hWnd, szFileName, szTitleName)) then Exit;
             // 保存DIB文件
              SetCursor(LoadCursor(0, IDC_WAIT));
              ShowCursor(TRUE);
              bSuccess := DibSaveImage(szFileName, pbmfh);
              ShowCursor(FALSE);
              SetCursor(LoadCursor(0, IDC_ARROW));
              if (not bSuccess) then
                MessageBox(hWnd, 'Cannot save DIB file', szAppName, 0);
            end;

          IDM_FILE_PRINT:
            begin
              if (pbmfh = nil) then Exit;
             // Get printer DC
              pd.Flags := PD_RETURNDC or PD_NOPAGENUMS or PD_NOSELECTION;
              if (not PrintDlg(pd)) then Exit;
              hdcPrn := pd.hDC;
              if (pd.hDC = 0) then
              begin
                MessageBox(hWnd, 'Cannot obtain Printer DC', szAppName,
                  MB_ICONEXCLAMATION or MB_OK);
                Exit;
              end;
             // Check whether the printer can print bitmaps
              if (RC_BITBLT and GetDeviceCaps(hdcPrn, RASTERCAPS)) = 0 then
              begin
                DeleteDC(hdcPrn);
                MessageBox(hWnd, 'Printer cannot print bitmaps', szAppName,
                  MB_ICONEXCLAMATION or MB_OK);
                Exit;
              end;
             // Get size of printable area of page
              cxPage := GetDeviceCaps(hdcPrn, HORZRES);
              cyPage := GetDeviceCaps(hdcPrn, VERTRES);
              bSuccess := FALSE;
             // Send the DIB to the printer
              SetCursor(LoadCursor(0, IDC_WAIT));
              ShowCursor(TRUE);
              if (StartDoc(hdcPrn, di) > 0) and (StartPage(hdcPrn) > 0) then
              begin
                ShowDib(hdcPrn, pbmi, pBits, cxDib, cyDib, cxPage, cyPage, wShow);
                if (EndPage(hdcPrn) > 0) then
                begin
                   bSuccess := TRUE;
                   EndDoc(hdcPrn);
                end;
              end;
              ShowCursor(FALSE);
              SetCursor(LoadCursor(0, IDC_ARROW));
              DeleteDC(hdcPrn);
              if (not bSuccess) then
                MessageBox(hWnd, 'Could not print bitmap', szAppName,
                  MB_ICONEXCLAMATION or MB_OK);
            end;

          IDM_EDIT_COPY,
          IDM_EDIT_CUT:
            begin
              if (pbmfh = nil) then Exit;
             // Make a copy of the packed DIB
              hGlobal := GlobalAlloc(GHND or GMEM_SHARE,
                pbmfh.bfSize - SizeOf(TBitmapFileHeader));
              pGlobal := GlobalLock(hGlobal);
              CopyMemory(pGlobal, PByte(Integer(pbmfh) + SizeOf(TBitmapFileHeader)),
                pbmfh.bfSize - SizeOf(TBitmapFileHeader));
              GlobalUnlock(hGlobal);
             // Transfer it to the clipboard
              OpenClipboard(hWnd);
              EmptyClipboard();
              SetClipboardData(CF_DIB, hGlobal);
              CloseClipboard();
              if (LOWORD(wParam) = IDM_EDIT_CUT) then
                WndProc(hWnd, WM_COMMAND, IDM_EDIT_DELETE, 0);
            end;

          IDM_EDIT_DELETE:
            if (pbmfh <> nil) then
            begin
              FreeMem(pbmfh);
              pbmfh := nil;
              InvalidateRect(hWnd, nil, TRUE);
            end;

          IDM_SHOW_NORMAL,
          IDM_SHOW_CENTER,
          IDM_SHOW_STRETCH,
          IDM_SHOW_ISOSTRETCH:
            begin
              CheckMenuItem(hMenu, wShow, MF_UNCHECKED);
              wShow := LOWORD(wParam);
              CheckMenuItem(hMenu, wShow, MF_CHECKED);
              InvalidateRect(hWnd, nil, TRUE);
            end;
        end;
      end;
      
    WM_PAINT:
      begin
        hdcWnd := BeginPaint(hWnd, ps);
        if (pbmfh <> nil) then
          ShowDib(hdcWnd, pbmi, pBits, cxDib, cyDib, cxClient, cyClient, wShow);
        EndPaint(hWnd, ps);
      end;
      
    WM_DESTROY:
      begin
        FreeMem(szFileName, MAX_PATH);
        FreeMem(szTitleName, MAX_PATH);
        if (pbmfh <> nil) then FreeMem(pbmfh);
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
  hWnd := CreateWindow(szAppName, 'Show DIB #2',
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
