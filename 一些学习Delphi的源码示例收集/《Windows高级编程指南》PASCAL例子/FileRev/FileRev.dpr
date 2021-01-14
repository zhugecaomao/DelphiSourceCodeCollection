
// Module name: FileRev.C ->> FileRev.dpr
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

program FileRev;

{$R 'FileRev.res' 'FileRev.rc'}

uses
  Windows, Messages, CommDlg,
  Other in '..\Other.pas', CmnHdr in '..\CmnHdr.pas', WindowsX in '..\WindowsX.pas';

const
  g_szModName  = 'FileRev';
  g_szFileName = 'FileRev.Dat';

const  
  IDD_FILEREV    =  1;
  IDC_FILESELECT =  101;
  IDI_FILEREV    =  102;
  IDC_FILENAME   =  1000;
  IDC_REVERSE    =  1001;
  IDC_TEXTTYPE   =  1002;

  // 反转Ansi字符串
procedure ReverseString_Ansi(const pString: PChar; iLength: Integer);
var
  SwapChar: Char;
  J: Integer;
begin
  for J := 0 to iLength div 2 - 1 do
  begin
    SwapChar := pString[J];
    pString[J] := pString[iLength - J - 1];
    pString[iLength - J - 1] := SwapChar;
  end;

  J := 0;
  while (J < iLength - 1) do
  begin
    if (pString[J] = #10) and (pString[J + 1] = #13) then // 回车换行
    begin
      pString[J] := #13;
      pString[J + 1] := #10;
      Inc(J, 2);
    end else
    begin
      if IsDBCSLeadByte( Byte(pString[J]) ) then // 汉字前导
      begin
        SwapChar := pString[J];
        pString[J] := pString[J + 1];
        pString[J + 1] := SwapChar;
        Inc(J, 2);
      end else
        Inc(J);
    end;
  end;
end;

  // 反转Unicode字符串
procedure ReverseString_Unicode(const pString: PWideChar; iLength: Integer);
var
  SwapChar: WideChar;
  J: Integer;
begin
  for J := 0 to iLength div 2 - 1 do
  begin
    SwapChar := pString[J];
    pString[J] := pString[iLength - J - 1];
    pString[iLength - J - 1] := SwapChar;
  end;

  J := 0;
  while (J < iLength - 1) do
  begin
    if (pString[J] = #10) and (pString[J + 1] = #13) then
    begin
      pString[J] := #13;
      pString[J + 1] := #10;
      Inc(J , 2);
    end else
      Inc(J);
  end;
end;

  // 反转文件内容
function FileReverse(const pszPathname: PChar; pfIsTextUnicode: PBOOL): BOOL;
var
  hFile, hFileMap: THandle;
  dwFileSize: DWORD;
  pvFile: Pointer;
  iUnicodeTestFlags: Integer;
begin
  Result := FALSE;
  pfIsTextUnicode^ := FALSE;

  // 打开文件
  hFile := CreateFile(pszPathname, GENERIC_WRITE or GENERIC_READ, 0, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if (hFile = INVALID_HANDLE_VALUE) then
  begin
    chMB('File could not be opened', g_szModName);
    Exit;
  end;

  // 文件大小
  dwFileSize := GetFileSize(hFile, nil);
  if (dwFileSize and $80000000 <> 0) then
  begin
    chMB('The file size is too long', g_szModName);
    CloseHandle(hFile);
    Exit;
  end;

  // 文件映射
  hFileMap := CreateFileMapping(hFile, nil, PAGE_READWRITE, 0, dwFileSize, nil);
  if (hFileMap = 0) then
  begin
    chMB('File map could not open', g_szModName);
    CloseHandle(hFile);
    Exit;
  end;

  // 映射内存
  pvFile := MapViewOfFile(hFileMap, FILE_MAP_WRITE, 0, 0, 0);
  if (pvFile = nil) then
  begin
    chMB('Could not map view of file', g_szModName);
    CloseHandle(hFileMap);
    CloseHandle(hFile);
    Exit;
  end;

  // 编码类型
  iUnicodeTestFlags := -1;
  pfIsTextUnicode^ := IsTextUnicode(pvFile, dwFileSize, @iUnicodeTestFlags);

  // 倒置文本
  if (pfIsTextUnicode^ = FALSE) then
  begin
    ReverseString_Ansi(pvFile, dwFileSize);
  end else
  begin
    if (iUnicodeTestFlags and IS_TEXT_UNICODE_SIGNATURE <> 0) then
    begin
      Inc(PWideChar(pvFile));
      Dec(dwFileSize, SizeOf(WideChar));
    end;
    ReverseString_Unicode(pvFile, dwFileSize div 2);
  end;

  // 关闭映射
  UnmapViewOfFile(pvFile);
  CloseHandle(hFileMap);

  // 保存文件
  CloseHandle(hFile);

  Result := TRUE;
end;

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  chSETDLGICONS(hWnd, IDI_FILEREV, IDI_FILEREV);
  EnableWindow(GetDlgItem(hWnd, IDC_REVERSE), FALSE);
  Result := TRUE;
end;

  // WM_COMMAND
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
var
  szPathname: array[0..MAX_PATH] of Char;
  ofn: TOpenFilename;
  fIsTextUnicode: BOOL;
  si: TStartupInfo;
  pi: TProcessInformation;
begin
  case (id) of
    IDC_FILENAME: // 路径变化
      begin
        EnableWindow(GetDlgItem(hWnd, IDC_REVERSE), Edit_GetTextLength(hWndCtl) > 0);
      end;

    IDC_FILESELECT: // 选择文件
      begin
        chINITSTRUCT(ofn, SizeOf(ofn), TRUE);
        ofn.hWndOwner := hWnd;
        ofn.lpstrFile := szPathname;
        ofn.lpstrFile[0] := #0;
        ofn.nMaxFile := chDIMOF(szPathname);
        ofn.lpstrTitle := 'Select file for reversing';
        ofn.Flags := OFN_EXPLORER or OFN_FILEMUSTEXIST;

        GetOpenFileName(ofn);

        SetDlgItemText(hWnd, IDC_FILENAME, ofn.lpstrFile);
        SetFocus(GetDlgItem(hWnd, IDC_REVERSE));
      end;

    IDC_REVERSE: // 反转内容
      begin
        GetDlgItemText(hWnd, IDC_FILENAME, szPathname, chDIMOF(szPathname));

        if (CopyFile(szPathname, g_szFileName, FALSE) = FALSE) then
        begin
          chMB('New file could not be created', g_szModName);
          Exit;
        end;

        if (FileReverse(g_szFileName, @fIsTextUnicode)) then
        begin
          SetDlgItemText(hWnd, IDC_TEXTTYPE, IfThen(fIsTextUnicode, 'Unicode', 'ANSI'));

          chINITSTRUCT(si, SizeOf(si), TRUE);
          if CreateProcess(nil, 'NOTEPAD.EXE ' + g_szFileName, nil, nil, FALSE, 0, nil, nil, si, pi) then
          begin
            CloseHandle(pi.hThread);
            CloseHandle(pi.hProcess);
          end;
        end;
      end;

    IDCANCEL: // 关闭程序
      begin
        EndDialog(hWnd, id);
      end;
  end;
end;

  // 对话框回调
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  case (uMsg) of
    WM_INITDIALOG:
      begin
        Result := SetDlgMsgResult(hWnd, LRESULT(Dlg_OnInitDialog(hWnd, wParam, lParam)));
      end;

    WM_COMMAND:
      begin
        Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));
        Result := TRUE;
      end;

    else Result := FALSE;
  end;
end;

  // 程序入口
begin
  chWARNIFUNICODEUNDERWIN95();
  DialogBox(HInstance, MakeIntResource(IDD_FILEREV), 0, @Dlg_Proc);
end.
