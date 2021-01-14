unit PopPrnt;

interface

   // 打印文件
function PopPrntPrintFile(hWnd, hWndEdit: LongWord; const pstrTitleName: PChar): Boolean;

implementation

uses
  Windows, Messages, CommDlg, Math;
  
var
  bUserAbort: Boolean = FALSE; // 取消打印
  hDlgPrint: LongWord = 0; // 对话框句柄

  // 对话框消息接收函数
function PrintDlgProc(hDlg: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  Result := FALSE; // 未处理消息
  case Msg of
    WM_INITDIALOG:
      begin
        EnableMenuItem(GetSystemMenu(hDlg, FALSE), SC_CLOSE, MF_GRAYED); // 禁用关闭菜单
        Result := TRUE;
      end;

    WM_COMMAND:
      begin
        bUserAbort := TRUE; // 用户取消
        EnableWindow(GetParent(hDlg), TRUE); // 启用主窗体
        DestroyWindow(hDlg); // 注销对话框
        hDlgPrint := 0;
        Result := TRUE;
      end;
  end;
end;

  // 放弃回调函数  
function AbortProc(hdcPrn, iCode: Integer): BOOL; stdcall;
var
  Msg: TMSG;
begin
  while (not bUserAbort) and PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do
  begin
    if (hDlgPrint = 0) or (not IsDialogMessage(hDlgPrint, Msg)) then
    begin
      TranslateMessage(Msg); // 这句可以去掉
      DispatchMessage(Msg);
    end;
  end;
  Result:= not bUserAbort;
end;

   // 打印文件
function PopPrntPrintFile(hWnd, hWndEdit: LongWord; const pstrTitleName: PChar): Boolean;
     // 类似于C语言中的条件运算符( ? : )
  function IfThen(AValue: Boolean; const ATrue: Integer; const AFalse: Integer): Integer;
  begin
    if AValue then Result := ATrue else Result := AFalse;
  end;
const
  IDC_FILENAME = 1000;
var
  di: TDocInfo;
  pd: TPrintDlg;
  yChar, iCharsPerLine, iLinesPerPage, iTotalLines, iTotalPages, iPage, iLine, iLineNum: Integer;
  pstrBuffer: PChar;
  szJobName: array[0..64 + MAX_PATH] of Char;
  tm: TTextMetric;
  iColCopy, iNoiColCopy: WORD;
begin
  Result := TRUE;

  pd.lStructSize := SizeOf(TPrintDlg);
  pd.hwndOwner := hWnd;
  pd.hDevMode := 0;
  pd.hDevNames := 0;
  pd.hDC := 0;
  pd.Flags := PD_ALLPAGES or PD_COLLATE or PD_RETURNDC or PD_NOSELECTION;
  pd.nFromPage := 0;
  pd.nToPage := 0;
  pd.nMinPage := 0;
  pd.nMaxPage := 0;
  pd.nCopies := 1;
  pd.hInstance := 0;
  pd.lCustData := 0;
  pd.lpfnPrintHook := nil;
  pd.lpfnSetupHook := nil;
  pd.lpPrintTemplateName := nil;
  pd.lpSetupTemplateName := nil;
  pd.hPrintTemplate := 0;
  pd.hSetupTemplate := 0;
  if (not PrintDlg(pd)) then Exit; // 取消了打印

  iTotalLines := SendMessage(hWndEdit, EM_GETLINECOUNT, 0, 0); // 编辑控件文字行数
  if (iTotalLines = 0) then Exit;

  GetTextMetrics(pd.hDC, tm);
  yChar := tm.tmHeight + tm.tmExternalLeading; // 字符高度
  iCharsPerLine := GetDeviceCaps(pd.hDC, HORZRES) div tm.tmAveCharWidth; // 每行字符数
  iLinesPerPage := GetDeviceCaps(pd.hDC, VERTRES) div yChar; // 每页行数
  iTotalPages := (iTotalLines + iLinesPerPage - 1) div iLinesPerPage; // 页数
  GetMem(pstrBuffer, iCharsPerLine + 4); // 分配内存
  pstrBuffer[0] := '1';
  pstrBuffer[1] := '2';
  pstrBuffer[2] := #0;

  EnableWindow(hWnd, FALSE);
  bUserAbort := FALSE;
  hDlgPrint := CreateDialog(hInstance, 'PrintDlgBox', hWnd, @PrintDlgProc);
  SetDlgItemText(hDlgPrint, IDC_FILENAME, pstrTitleName);
  SetAbortProc(pd.hDC, @AbortProc);
  GetWindowText(hWnd, szJobName, 64 + MAX_PATH);
  di.cbSize := SizeOf(TDocInfo);
  di.lpszDocName := szJobName;

  if (StartDoc(pd.hDC, di) > 0) then
  begin  // Collation requires this loop and iNoiColCopy
    for iColCopy := 0 to IfThen((pd.Flags and PD_COLLATE) <> 0 , pd.nCopies, 1) - 1 do
    begin
      for iPage := 0 to iTotalPages - 1 do
      begin
        for iNoiColCopy := 0 to IfThen((pd.Flags and PD_COLLATE) <> 0 , 1, pd.nCopies) - 1 do
        begin  // Start the page
          if (StartPage(pd.hDC) < 0) then
          begin
            Result := FALSE;
            Break;
          end;
           // For each page, print the lines
          for iLine := 0 to iLinesPerPage - 1 do
          begin
            iLineNum := iLinesPerPage * iPage + iLine;
            if (iLineNum > iTotalLines) then Break;
            PWord(@pstrBuffer[1])^ := iCharsPerLine;
            TextOut(pd.hDC, 0, yChar * iLine, pstrBuffer,
              SendMessage(hWndEdit, EM_GETLINE, iLineNum, Integer(pstrBuffer)));
          end;
          if (EndPage(pd.hDC) < 0) then
          begin
            Result := FALSE;
            Break;
          end;
          if (bUserAbort) then Break;
        end;
        if (not Result) or (bUserAbort) then Break;
      end;
      if (not Result) or (bUserAbort) then Break;
    end;
  end else
    Result := FALSE;

  if (Result) then EndDoc(pd.hDC);

  if (not bUserAbort) then
  begin
    EnableWindow(hwnd, TRUE);
    DestroyWindow(hDlgPrint);
  end;

  FreeMem(pstrBuffer);  
  DeleteDC(pd.hDC);
  Result := Result and not bUserAbort;
end;

end.
