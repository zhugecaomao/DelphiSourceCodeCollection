program  EmfView;

{$R EmfView.Res}

uses
  Windows, Messages, CommDlg;

const
  szAppName = 'EmfView';  

  // 依据MetaFile建立调色板
function CreatePaletteFromMetaFile(hemf: HENHMetaFile): HPALETTE;
var
  iNum: Integer;
  plp: PLogPalette;
begin
  Result := 0;
  if (hemf = 0) then Exit;

  iNum := GetEnhMetaFilePaletteEntries(hemf, 0, nil);
  if (iNum = 0) then Exit;
  
  GetMem(plp, SizeOf(TLogPalette) + (iNum - 1) * SizeOf(TPaletteEntry));
  plp.palVersion := $0300;
  plp.palNumEntries := iNum;
  GetEnhMetaFilePaletteEntries(hemf, iNum, @plp.palPalEntry[0]);
  
  Result := CreatePalette(plp^);
  FreeMem(plp);
end;

   // 窗体过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  IDM_FILE_OPEN       = 40001; // 菜单或快捷键命令ID
  IDM_FILE_SAVE_AS    = 40002;
  IDM_FILE_PRINT      = 40003;
  IDM_FILE_PROPERTIES = 40004;
  IDM_APP_EXIT        = 40005;
  IDM_EDIT_CUT        = 40006;
  IDM_EDIT_COPY       = 40007;
  IDM_EDIT_PASTE      = 40008;
  IDM_EDIT_DELETE     = 40009;
  IDM_APP_ABOUT       = 40010;
  szFilter = 'Enhanced MetaFiles (*.EMF)'#0'*.emf'#0'All Files (*.*)'#0'*.*'#0#0;
{$J+}
  di: TDocInfo = (); // = { sizeof (DOCINFO), TEXT ("EmfView: Printing") } ;
  hemf: HENHMetaFile = 0;
  ofn: TOpenFilename = ();
  pd: TPrintDlg = (); // = { sizeof (PRINTDLG) } ;
  szFileName: array[0..MAX_PATH] of Char = '';
  szTitleName: array[0..MAX_PATH] of Char = '';
{$J-}
var
  hdcWnd, hdcPrn: HDC;
  ps: TPaintStruct;
  Rect: TRect;
  hemfCopy: HENHMetaFile;
  header: TEnhMetaHeader;
  hMenu: LongWord; // HMENU
  hPalette: LongWord; // HPALETTE
  i, iLength, iEnable: Integer;
  pBuffer: PChar;
  bSuccess: Boolean;
  List: array[0..3] of LongWord;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      begin
       // Initialize OPENFILENAME structure
        ofn.lStructSize := SizeOf(TOpenFilename);
        ofn.hwndOwner := hWnd;
        ofn.hInstance := 0;
        ofn.lpstrFilter := szFilter;
        ofn.lpstrCustomFilter := nil;
        ofn.nMaxCustFilter := 0;
        ofn.nFilterIndex := 0;
        ofn.lpstrFile := szFileName;
        ofn.nMaxFile := MAX_PATH;
        ofn.lpstrFileTitle := szTitleName;
        ofn.nMaxFileTitle := MAX_PATH;
        ofn.lpstrInitialDir := nil;
        ofn.lpstrTitle := nil;
        ofn.Flags := 0;
        ofn.nFileOffset := 0;
        ofn.nFileExtension := 0;
        ofn.lpstrDefExt := 'emf';
        ofn.lCustData := 0;
        ofn.lpfnHook := nil;
        ofn.lpTemplateName := nil;
      end;

    WM_INITMENUPOPUP:
      begin
        hMenu := GetMenu(hWnd);

        if (hemf <> 0) then iEnable := MF_ENABLED else iEnable := MF_GRAYED;
        EnableMenuItem(hMenu, IDM_FILE_SAVE_AS, iEnable);
        EnableMenuItem(hMenu, IDM_FILE_PRINT, iEnable);
        EnableMenuItem(hMenu, IDM_FILE_PROPERTIES, iEnable);
        EnableMenuItem(hMenu, IDM_EDIT_CUT, iEnable);
        EnableMenuItem(hMenu, IDM_EDIT_COPY, iEnable);
        EnableMenuItem(hMenu, IDM_EDIT_DELETE, iEnable);

        if IsClipboardFormatAvailable(CF_ENHMetaFile) then
          EnableMenuItem(hMenu, IDM_EDIT_PASTE, MF_ENABLED)
        else
          EnableMenuItem(hMenu, IDM_EDIT_PASTE, MF_GRAYED);
      end;

    WM_COMMAND:
      begin
        case LOWORD(wParam) of // 有菜单也有快捷键,所以用LOWORD()
          IDM_FILE_OPEN:
            begin
             // Show the File Open dialog box
              ofn.Flags := 0;
              if (not GetOpenFileName(ofn)) then Exit;

             // If there's an existing EMF, get rid of it.
              if (hemf <> 0) then
              begin
                DeleteEnhMetaFile(hemf);
                hemf := 0;
              end;

             // Load the EMF into memory
              SetCursor(LoadCursor(0, IDC_WAIT));
              ShowCursor(TRUE);
              hemf := GetEnhMetaFile(szFileName);
              ShowCursor(FALSE);
              SetCursor(LoadCursor(0, IDC_ARROW));

             // Invalidate the client area for later update
              InvalidateRect(hWnd, nil, TRUE);
              if (hemf = 0) then
              begin
                MessageBox(hWnd,
                  'Cannot load MetaFile', szAppName, MB_ICONEXCLAMATION or MB_OK);
              end;
            end;

          IDM_FILE_SAVE_AS:
             begin
               if (hemf = 0) then Exit;

              // Show the File Save dialog box
               ofn.Flags := OFN_OVERWRITEPROMPT;
               if (not GetSaveFileName(ofn)) then Exit;

              // Save the EMF to disk file
               SetCursor(LoadCursor(0, IDC_WAIT));
               ShowCursor(TRUE);
               hemfCopy := CopyEnhMetaFile(hemf, szFileName);
               ShowCursor(FALSE);
               SetCursor(LoadCursor(0, IDC_ARROW));

               if (hemfCopy <> 0) then
               begin
                 DeleteEnhMetaFile(hemf);
                 hemf := hemfCopy;
               end else
               begin
                 MessageBox(hWnd,
                   'Cannot save MetaFile', szAppName, MB_ICONEXCLAMATION or MB_OK);
               end;
            end;

          IDM_FILE_PRINT:
            begin
             // Show the Print dialog box and get printer DC
              pd.Flags := PD_RETURNDC or PD_NOPAGENUMS or PD_NOSELECTION;
              if (not PrintDlg(pd)) then Exit;

              hdcPrn := pd.hDC;
              if (hdcPrn = 0) then
              begin
                MessageBox(hWnd,
                  'Cannot obtain printer DC', szAppName, MB_ICONEXCLAMATION or MB_OK);
                Exit;
              end;   

             // Get size of printable area of page
              Rect.Left := 0;
              Rect.Right := GetDeviceCaps(hdcPrn, HORZRES);
              Rect.Top := 0;
              Rect.Bottom := GetDeviceCaps(hdcPrn, VERTRES);  
              bSuccess := FALSE;

              // Play the EMF to the printer
              SetCursor(LoadCursor(0, IDC_WAIT));
              ShowCursor(TRUE);
              if (StartDoc(hdcPrn, di) > 0) and (StartPage(hdcPrn) > 0) then
              begin
                PlayEnhMetaFile(hdcPrn, hemf, Rect);
                if (EndPage(hdcPrn) > 0) then
                begin
                  bSuccess := TRUE;
                  EndDoc(hdcPrn);
                end;
              end;
              ShowCursor(FALSE);
              SetCursor(LoadCursor(0, IDC_ARROW));
              DeleteDC(hdcPrn);

              if (bSuccess = FALSE) then
                MessageBox(hWnd,
                  'Could not print MetaFile', szAppName, MB_ICONEXCLAMATION or MB_OK);
            end;

          IDM_FILE_PROPERTIES:
            begin
              if (hemf = 0) then Exit;

              iLength := GetEnhMetaFileDescription(hemf, 0, nil);
              GetMem(pBuffer, iLength + 256);
              GetEnhMetaFileHeader(hemf, SizeOf(TEnhMetaHeader), @header);

             // Format header file information
              List[0] := header.rclBounds.Left;
              List[1] := header.rclBounds.Top;
              List[2] := header.rclBounds.Right;
              List[3] := header.rclBounds.Bottom;
              i := wvsprintf(pBuffer,
                'Bounds = (%i, %i) to (%i, %i) pixels'#13#10, @List[0]);
              List[0] := header.rclFrame.Left;
              List[1] := header.rclFrame.Top;
              List[2] := header.rclFrame.Right;
              List[3] := header.rclFrame.Bottom;
              Inc(i, wvsprintf(pBuffer + i,
                'Frame = (%i, %i) to (%i, %i) mms'#13#10, @List[0]));
              List[0] := header.szlDevice.cx;
              List[1] := header.szlDevice.cy;
              List[2] := header.szlMillimeters.cx;
              List[3] := header.szlMillimeters.cy;
              Inc(i, wvsprintf(pBuffer + i,
                'Resolution = (%i, %i) pixels = (%i, %i) mms'#13#10, @List[0]));
              List[0] := header.nBytes;
              List[1] := header.nRecords;
              List[2] := header.nHandles;
              List[3] := header.nPalEntries;
              Inc(i, wvsprintf(pBuffer + i,
                'Size = %i, Records = %i, Handles = %i, Palette entries = %i'#13#10,
                @List[0]));

              // Include the MetaFile description, if present
              if (iLength <> 0) then
              begin
                Inc(i, wsprintf(pBuffer + i, 'Description = '));
                GetEnhMetaFileDescription(hemf, iLength, pBuffer + i);
                pBuffer[lstrlen(pBuffer)] := #9; // 中间的#0改为Tab
              end;
              MessageBox(hWnd, pBuffer, 'MetaFile Properties', MB_OK);

              FreeMem(pBuffer);
            end;

          IDM_EDIT_COPY,
          IDM_EDIT_CUT:
            begin
              if (hemf = 0) then Exit;

             // Transfer MetaFile copy to the clipboard
              hemfCopy := CopyEnhMetaFile(hemf, nil);
              OpenClipboard(hWnd);
              EmptyClipboard();
              SetClipboardData(CF_ENHMetaFile, hemfCopy);
              CloseClipboard();

             // 用IDM_EDIT_DELETE调用WndProc()
              if (LOWORD(wParam) = IDM_EDIT_CUT) then
                WndProc(hWnd, WM_COMMAND, IDM_EDIT_DELETE, 0);
            end;

          IDM_EDIT_DELETE:
            begin
              if (hemf <> 0) then
              begin
                DeleteEnhMetaFile(hemf);
                hemf := 0;
                InvalidateRect(hWnd, nil, TRUE);
              end;
            end;

          IDM_EDIT_PASTE:
            begin
              OpenClipboard(hWnd);
              hemfCopy := GetClipboardData(CF_ENHMetaFile);
              CloseClipboard();
              if (hemfCopy <> 0) and (hemf <> 0) then
              begin
                DeleteEnhMetaFile(hemf);
                hemf := 0;
              end;
              hemf := CopyEnhMetaFile(hemfCopy, nil);
              InvalidateRect(hWnd, nil, TRUE);
            end;

          IDM_APP_ABOUT:
            begin
              MessageBox(hWnd,
                'Enhanced MetaFile Viewer'#13#10'(c) Charles Petzold, 1998',
                szAppName, MB_OK);
            end;

          IDM_APP_EXIT:
            begin
              SendMessage(hWnd, WM_CLOSE, 0, 0);
            end;
        end;
      end;

    WM_PAINT:
      begin
        hdcWnd := BeginPaint(hWnd, ps);

        if (hemf <> 0) then
        begin
          hPalette := CreatePaletteFromMetaFile(hemf);
          if (hPalette <> 0) then
          begin
            SelectPalette(hdcWnd, hPalette, FALSE);
            RealizePalette(hdcWnd);
          end;
          GetClientRect(hWnd, Rect);
          PlayEnhMetaFile(hdcWnd, hemf, Rect);
          if (hPalette <> 0) then DeleteObject(hPalette);
        end;

        EndPaint(hWnd, ps);
      end;

    WM_QUERYNEWPALETTE:
      begin
        Result := 0; // FALSE

        if (hemf = 0) then Exit;
        hPalette := CreatePaletteFromMetaFile(hemf);
        if (hPalette = 0) then Exit;

        hdcWnd := GetDC(hWnd);
        SelectPalette(hdcWnd, hPalette, FALSE);
        RealizePalette(hdcWnd);
        InvalidateRect(hWnd, nil, FALSE);
        DeleteObject(hPalette);
        ReleaseDC(hWnd, hdcWnd);

        Result := 1; // TRUE
      end;

     WM_PALETTECHANGED:
       begin
         if (wParam = Integer(hWnd)) or (hemf = 0) then Exit;
         hPalette := CreatePaletteFromMetaFile(hemf);
         if (hPalette = 0) then Exit;

         hdcWnd := GetDC(hWnd);
         SelectPalette(hdcWnd, hPalette, FALSE);
         RealizePalette(hdcWnd);
         UpdateColors(hdcWnd);
         DeleteObject(hPalette);
         ReleaseDC(hWnd, hdcWnd);
       end;

    WM_DESTROY:
      begin
        PostQuitMessage(0); // 放一个退出消息WM_QUIT
        if (hemf <> 0) then DeleteEnhMetaFile(hemf);
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end; 

var
  hAccel: LongWord; // HACCEL
  hWnd: LongWord; // HWND
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
  hWnd := CreateWindow(szAppName, 'Enhanced MetaFile Viewer',
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
