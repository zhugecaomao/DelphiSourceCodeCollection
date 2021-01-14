program PreViewDlg;

{$R 'PreViewDlg.res' 'PreViewDlg.txt'}

uses Windows, CommDlg, Messages;

  // 文件前500字节载入Memo
procedure LoadFileHead(FileName: PChar; MemoHandle: HWND);
var
  TextBuffer: array[0..500] of Char;
  FileHandle: THandle;
  ReadLength: DWORD;
begin
  SetWindowText(MemoHandle, #13#10'  预览式文件选择对话框示例      By  麻子');

  FileHandle := CreateFile(FileName, GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if (FileHandle = INVALID_HANDLE_VALUE) then Exit;

  ReadFile(FileHandle, TextBuffer[0], 500, ReadLength, nil);
  CloseHandle(FileHandle);

  if (ReadLength > 500) then Exit;
  TextBuffer[ReadLength] := #0;

  SetWindowText(MemoHandle, @TextBuffer[0]);
end;

  // 子对话框消息钩子回调
function OFNHookProc(hDlg: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): UINT; stdcall;
const
{$J+}
  MainHandle: HWND = 0; // 主对话框句柄
  MemoHandle: HWND = 0; // 子编辑框句柄
{$J-}
var
  WndRect, ScnRect: TRect;
  FileName: array[0..MAX_PATH] of Char;
begin
  if (Msg = WM_NOTIFY) then
  begin
    if (PNMHdr(lParam).code = CDN_INITDONE) then
    begin
     // 调整主对话框
      MainHandle := GetParent(hDlg);
      SendMessage(MainHandle, WM_SETICON, ICON_BIG, LoadIcon(HInstance, 'LiuMazi'));
      GetWindowRect(MainHandle, WndRect);
      WndRect.Right := WndRect.Right - WndRect.Left; // 宽度
      WndRect.Bottom := WndRect.Bottom - WndRect.Top + 100; // 高度
      WndRect.Left := (GetSystemMetrics(SM_CXSCREEN) - WndRect.Right) shr 1; // 居中
      SystemParametersInfo(SPI_GETWORKAREA, 0, @ScnRect, 0);
      WndRect.Top  := (ScnRect.Bottom - ScnRect.Top - WndRect.Bottom) shr 1; // 居中
      MoveWindow(MainHandle, WndRect.Left, WndRect.Top, WndRect.Right, WndRect.Bottom, TRUE);

     // 调整子对话框
      GetClientRect(MainHandle, WndRect);
      MoveWindow(hDlg, 0, 0, WndRect.Right, WndRect.Bottom, TRUE);

     // 调整Memo控件
      MemoHandle := GetDlgItem(hDlg, 66);
      MoveWindow(MemoHandle, 5, WndRect.Bottom - 100, WndRect.Right - 10, 95, TRUE);
    end else
    begin
      if (PNMHdr(lParam).code = CDN_SELCHANGE) then
      begin
        SendMessage(MainHandle, CDM_GETFILEPATH, MAX_PATH, Longint(@FileName[0]));
        LoadFileHead(@FileName[0], MemoHandle); // 显示选中文件部分内容
      end;
    end;
  end else
  begin
    if (Msg = WM_SIZE) then
    begin
     // 调整Memo控件
      GetClientRect(MainHandle, WndRect);
      MoveWindow(MemoHandle, 5, WndRect.Bottom - 100, WndRect.Right - 10, 95, TRUE);
    end;
  end;
  Result := 0; // 要求默认对话框过程处理
end;

  // 根据系统决定结构长度
function OpenStructSize(): DWORD;
var
  OSVersionInfo: TOSVersionInfo;
begin
  OSVersionInfo.dwOSVersionInfoSize := SizeOf(OSVersionInfo);
  GetVersionEx(OSVersionInfo);

  if (OSVersionInfo.dwMajorVersion >= 5) and // Windows 2000 以上版本
  (OSVersionInfo.dwPlatformId = VER_PLATFORM_WIN32_NT) then
    Result := SizeOf(TOpenFilename)
  else
    Result := SizeOf(TOpenFilename) - SizeOf(DWORD) * 3; // 没有尾部三个域
end;

  // 弹出'文件选择'对话框
procedure OpenFileDlg();
var
  FileName: array[0..MAX_PATH] of Char;
  OpenStruct: TOpenFilename;
begin
  FileName[0] := #0;
  with OpenStruct do
  begin
    lStructSize := OpenStructSize();
    hWndOwner := 0;
    hInstance := SysInit.HInstance; // 模板资源所处模块
    lpstrFilter := 'Ansi文件'#0'*.TXT'#0'所有文件'#0'*.*'#0#0; // 过滤器
    lpstrCustomFilter := nil;
    nMaxCustFilter := 0;
    nFilterIndex := 0;
    lpstrFile := @FileName[0]; // 文件名缓冲区(初始&结果)
    nMaxFile := MAX_PATH;
    lpstrFileTitle := nil;
    nMaxFileTitle := 0;
    lpstrInitialDir := nil;
    lpstrTitle := '  预览式文件选择对话框示例      By  麻子'; // 标题
    Flags := OFN_EXPLORER or      // 新的Explorer风格
             OFN_ENABLESIZING or  // 允许用户改变大小
             OFN_FILEMUSTEXIST or // 指定文件必须存在
             OFN_HIDEREADONLY or  // 隐藏只读复选框
             OFN_ENABLEHOOK or    // 使用消息钩子函数
             OFN_ENABLETEMPLATE;  // 使用子对话框模板
    nFileOffset := 0;
    nFileExtension := 0;
    lpstrDefExt := 'TXT'; // 默认扩展名
    lCustData := 0;
    lpfnHook := @OFNHookProc; // 消息钩子地址
    lpTemplateName := 'DlgTemplate'; // 模板资源名
    pvReserved := nil;
    dwReserved := 0;
    FlagsEx := 0;
  end;
  GetOpenFileName(OpenStruct); // 建立对话框窗体, 并且作消息循环
end;

begin
  OpenFileDlg();
end.


