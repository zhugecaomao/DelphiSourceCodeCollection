unit PopFile;

interface

   // 初始化'文件选择对话框'结构体
procedure PopFileInitialize(hWnd: LongWord);
   // '打开文件'对话框
function PopFileOpenDlg(hWnd: LongWord; const pstrFileName, pstrTitleName: PChar): Boolean;
   // '保存文件'对话框
function PopFileSaveDlg(hWnd: LongWord; const pstrFileName, pstrTitleName: PChar): Boolean;
   // 文件装入Edit控件
function PopFileRead(hWndEdit: LongWord; const pstrFileName: PChar): Boolean;
   // Edit内容保存至文件
function PopFileWrite(hWndEdit: LongWord; const pstrFileName: PChar): Boolean;

implementation

uses
  Windows, CommDlg;

var
  ofn: TOpenFilename;

   // 初始化'文件选择对话框'结构体
procedure PopFileInitialize(hWnd: LongWord);
const
  szFilter = 'Text Files (*.TXT)'#0'*.txt'#0'ASCII Files (*.ASC)'#0'*.asc'#0'All Files (*.*)'#0'*.*'#0#0;
begin
  ofn.lStructSize := SizeOf(TOpenFilename);
  ofn.hwndOwner := hWnd;
  ofn.hInstance := 0;
  ofn.lpstrFilter := szFilter;
  ofn.lpstrCustomFilter := nil;
  ofn.nMaxCustFilter := 0;
  ofn.nFilterIndex := 0;
  ofn.lpstrFile := nil;
  ofn.nMaxFile := MAX_PATH;
  ofn.lpstrFileTitle := nil;
  ofn.nMaxFileTitle := MAX_PATH;
  ofn.lpstrInitialDir := nil;
  ofn.lpstrTitle := nil;
  ofn.Flags := 0;
  ofn.nFileOffset := 0;
  ofn.nFileExtension := 0;
  ofn.lpstrDefExt := 'txt';
  ofn.lCustData := 0;
  ofn.lpfnHook := nil;
  ofn.lpTemplateName := nil;
end;

   // '打开文件'对话框
function PopFileOpenDlg(hWnd: LongWord; const pstrFileName, pstrTitleName: PChar): Boolean;
begin
  ofn.hWndOwner := hWnd;
  ofn.lpstrFile := pstrFileName;
  ofn.lpstrFileTitle := pstrTitleName;
  ofn.Flags := OFN_HIDEREADONLY or OFN_CREATEPROMPT;
  Result := GetOpenFileName(ofn);
end;

   // '保存文件'对话框
function PopFileSaveDlg(hWnd: LongWord; const pstrFileName, pstrTitleName: PChar): Boolean;
begin
  ofn.hWndOwner := hWnd;
  ofn.lpstrFile := pstrFileName;
  ofn.lpstrFileTitle := pstrTitleName;
  ofn.Flags := OFN_OVERWRITEPROMPT;
  Result := GetSaveFileName(ofn);
end;

   // 文件装入Edit控件
function PopFileRead(hWndEdit: LongWord; const pstrFileName: PChar): Boolean;
const
  IS_TEXT_UNICODE_SIGNATURE = $08;
  IS_TEXT_UNICODE_REVERSE_SIGNATURE = $80;
var
  bySwap: Char;
  dwBytesRead, hFile: DWORD;
  i, iFileLength, iUniTest: Integer;
  pBuffer, pText, pConv: PChar;
begin
  Result := FALSE;   
 // 打开文件    
  hFile := CreateFile(pstrFileName, GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
  if (hFile = INVALID_HANDLE_VALUE) then Exit;
 // 分配空间
  iFileLength := GetFileSize(hFile, nil);
  GetMem(pBuffer, iFileLength + 2);
 // 读入文件
  ReadFile(hFile, pBuffer^, iFileLength, dwBytesRead, nil);
  CloseHandle(hFile);
 // 添加结束符 
  pBuffer[iFileLength] := #0;
  pBuffer[iFileLength + 1] := #0;
 // 测试编码
  iUniTest := IS_TEXT_UNICODE_SIGNATURE or IS_TEXT_UNICODE_REVERSE_SIGNATURE;
  if (IsTextUnicode(pBuffer, iFileLength, @iUniTest)) then // 文件内容是Unicode
  begin
   // 去掉UNICODE标志头
    pText := pBuffer + 2;
    Dec(iFileLength, 2);
   // 交换高低字节 
    if (iUniTest and IS_TEXT_UNICODE_REVERSE_SIGNATURE) <> 0 then
    begin
      for i := 0 to iFileLength div 2 - 1 do
      begin
        bySwap := pText[2 * i];
        pText[2 * i] := pText[2 * i + 1];
        pText[2 * i + 1] := bySwap;
      end;
    end;
   // 申请内存 .. 
    GetMem(pConv, iFileLength + 2);
{$ifndef UNICODE} // 程序不是Unicode版
    WideCharToMultiByte(CP_ACP, 0, PWideChar(pText), -1, pConv, iFileLength + 2, nil, nil); // 转换
{$else}
    lstrcpy(pConv, pText); // 直接拷贝
{$endif}
  end else // 否则,文件内容不是Unicode
  begin
    pText := pBuffer;
    GetMem(pConv, 2 * iFileLength + 2);
{$ifdef UNICODE} // 程序是Unicode版
    MultiByteToWideChar(CP_ACP, 0, pText, -1, PWideChar(pConv), iFileLength + 1); // 转换
{$else}
    lstrcpy(pConv, pText); // 直接拷贝
{$endif}
  end;    
  SetWindowText(hWndEdit, pConv);
  FreeMem(pBuffer);
  FreeMem(pConv);
  Result := TRUE;
end;     

   // Edit内容保存至文件
function PopFileWrite(hWndEdit: LongWord; const pstrFileName: PChar): Boolean;
const
  wByteOrderMark: WORD = $FEFF; // 注意,在内存中的顺序是 FFFE
var
  dwBytesWritten: DWORD;
  hFile: LongWord;
  iLength: Integer;
  pstrBuffer: PChar;
begin
  Result := FALSE;
 // 打开文件
  hFile := CreateFile(pstrFileName, GENERIC_WRITE, 0, nil, CREATE_ALWAYS, 0, 0);
  if (hFile = INVALID_HANDLE_VALUE) then Exit;
 // 申请内存
  iLength := GetWindowTextLength(hWndEdit);
  GetMem(pstrBuffer, iLength + 1);
  if (pstrBuffer = nil) then
  begin
    CloseHandle(hFile);  Exit;
  end;
 // Unicode 标志
{$ifdef UNICODE}
  WriteFile(hFile, wByteOrderMark, 2, dwBytesWritten, nil);
{$endif}
 // 取出Edit控件内容并写到文件中
  GetWindowText(hWndEdit, pstrBuffer, iLength + 1);
  WriteFile(hFile, pstrBuffer^, iLength, dwBytesWritten, nil);
  CloseHandle(hFile);
  FreeMem(pstrBuffer);
  if (iLength = dwBytesWritten) then Result := TRUE;
end;   

end.
