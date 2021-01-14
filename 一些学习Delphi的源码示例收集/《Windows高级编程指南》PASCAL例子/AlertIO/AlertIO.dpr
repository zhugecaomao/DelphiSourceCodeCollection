
// Module name: AlertIO.C ->> AlertIO.dpr
// Notices: Copyright (c) 1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

program AlertIO;

{$R 'AlertIO.res' 'AlertIO.rc'}

uses
  Windows, Messages, CommDlg,
  Other in '..\Other.pas', CmnHdr in '..\CmnHdr.pas', WindowsX in '..\WindowsX.pas';

const
  g_szModName = 'AlertIO';
  IDD_ALERTIO     =    1;
  IDC_BROWSE      =  100;
  IDC_SRCFILE     =  101;
  IDC_SRCFILESIZE =  102;
  IDI_ALERTIO     =  102;

  // 拷贝预处理
function PrepareDstFile(const pszFileSrc, pszFileDst: PChar; var phFileSrc,
  phFileDst: THandle; var pulFileSize: TULargeInteger; dwPageSize: DWORD): BOOL;
label
  ErrorLeave;
var
  ulFileSizeDst: TULargeInteger;
  dwError: DWORD;
begin
  Result := FALSE;

  // 打开源文件
  phFileSrc := CreateFile(pszFileSrc, GENERIC_READ, FILE_SHARE_READ,
     nil, OPEN_EXISTING, FILE_FLAG_NO_BUFFERING or FILE_FLAG_OVERLAPPED, 0);
  if (phFileSrc = INVALID_HANDLE_VALUE) then goto ErrorLeave;

  // 建立目标文件
  phFileDst := CreateFile(pszFileDst, GENERIC_WRITE, 0, nil,
    CREATE_ALWAYS, FILE_FLAG_NO_BUFFERING or FILE_FLAG_OVERLAPPED, phFileSrc);
  if (phFileDst = INVALID_HANDLE_VALUE) then goto ErrorLeave;

  // 源文件尺寸
  pulFileSize.LowPart := GetFileSize(phFileSrc, @pulFileSize.HighPart);

  // 按页面圆整
  ulFileSizeDst.QuadPart := (pulFileSize.QuadPart + dwPageSize - 1) and not (dwPageSize - 1);

  // 目标文件尺寸
  dwError := SetFilePointer(phFileDst, ulFileSizeDst.LowPart, @ulFileSizeDst.HighPart, FILE_BEGIN);
  if (dwError = $FFFFFFFF) and (GetLastError() <> NO_ERROR) then goto ErrorLeave;
  if (SetEndOfFile(phFileDst) = FALSE) then goto ErrorLeave;

  // Return(TRUE)
  Result := TRUE;
  Exit;

  // 出错时执行
ErrorLeave:
  if (phFileSrc <> INVALID_HANDLE_VALUE) then
  begin
    CloseHandle(phFileSrc);
    phFileSrc := INVALID_HANDLE_VALUE;
  end;

  if (phFileSrc <> INVALID_HANDLE_VALUE) then
  begin
    CloseHandle(phFileDst);
    phFileDst := INVALID_HANDLE_VALUE;
  end;
end;

  // 拷贝后清除
procedure CopyCleanup(const pszFileDst: PChar; hFileSrc, hFileDst: THandle; const pulFileSize: TULargeInteger);
begin
  CloseHandle(hFileDst);
  CloseHandle(hFileSrc);

  // 正确长度
  hFileDst := CreateFile(pszFileDst, GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, 0, 0);
  if (hFileDst <> INVALID_HANDLE_VALUE) then
  begin
    SetFilePointer(hFileDst, pulFileSize.LowPart, @pulFileSize.HighPart, FILE_BEGIN);
    SetEndOfFile(hFileDst);
    CloseHandle(hFileDst);
  end;
end;

  // 复制状态信息结构
type
  PCopyState = ^TCopyState;
  TCopyState = record
    dwPageSize: DWORD;           // 页面尺寸
    hFileSrc, hFileDst: THandle; // 文件句柄
    ulFileSize, ulNextReadOffset: TULargeInteger; // 文件尺寸, 读取偏移
    nReadsInProgress, nWritesInProgress: Integer; // 未决请求
  end;

  // 复制状态共享信息
var
  g_cs: TCopyState;

  // 扩展TOverlapped
type
  PIoReq = ^TIoReq;
  TIoReq = record
	  Overlapped: TOverlapped;
	  pbData: PByte;
  end;

const
  MAX_PENDING_IO_REQS = 4;
  BUFFSIZE = (64 * 1024);

  // 方便调用
function WriteFileEx(hFile: THandle; lpBuffer: Pointer; nNumberOfBytesToWrite: DWORD; var IoReq: TIoReq;
  lpCompletionRoutine: TPROverlappedCompletionRoutine): BOOL; stdcall; external kernel32 name 'WriteFileEx';
function ReadFileEx(hFile: THandle; lpBuffer: Pointer; nNumberOfBytesToRead: DWORD; var IoReq: TIoReq;
  lpCompletionRoutine: TPROverlappedCompletionRoutine): BOOL; stdcall; external kernel32 name 'ReadFileEx';

  // 前置声明
procedure WriteCompletionRoutine(dwErrorCode, dwNumberOfBytesTransferred: DWORD; var IoReq: TIoReq); stdcall; forward;

  // 读取完成
procedure ReadCompletionRoutine(dwErrorCode, dwNumberOfBytesTransferred: DWORD; var IoReq: TIoReq); stdcall;
begin
  if (dwErrorCode <> NO_ERROR) then
  begin
    chMB('dwErrorCode <> NO_ERROR', g_szModName);
    Exit;
  end;
  Dec(g_cs.nReadsInProgress);

  // 圆整尺寸
  dwNumberOfBytesTransferred := (dwNumberOfBytesTransferred + g_cs.dwPageSize - 1) and not(g_cs.dwPageSize - 1);

  // 请求写入
  if WriteFileEx(g_cs.hFileDst, IoReq.pbData, dwNumberOfBytesTransferred, IoReq, @WriteCompletionRoutine) = FALSE then
  begin
    chMB('WriteFileEx() failure', g_szModName);
    Exit;
  end;
  Inc(g_cs.nWritesInProgress);
end;

  // 写入完成
procedure WriteCompletionRoutine(dwErrorCode, dwNumberOfBytesTransferred: DWORD; var IoReq: TIoReq); stdcall;
begin
  if (dwErrorCode <> NO_ERROR) then
  begin
    chMB('dwErrorCode <> NO_ERROR', g_szModName);
    Exit;
  end;
  Dec(g_cs.nWritesInProgress);

  // 未拷贝完
  if (g_cs.ulNextReadOffset.QuadPart < g_cs.ulFileSize.QuadPart) then
  begin
    IoReq.Overlapped.Offset := g_cs.ulNextReadOffset.LowPart;
    IoReq.Overlapped.OffsetHigh := g_cs.ulNextReadOffset.HighPart;

    // 请求读取
    if ReadFileEx(g_cs.hFileSrc, IoReq.pbData, BUFFSIZE, IoReq, @ReadCompletionRoutine) = FALSE then
    begin
      chMB('ReadFileEx() failure', g_szModName);
      Exit;
    end;
    Inc(g_cs.nReadsInProgress);

    Inc(g_cs.ulNextReadOffset.QuadPart, BUFFSIZE);
  end;
end;

  // 文件拷贝
function FileCopy(const pszFileSrc, pszFileDst: PChar): BOOL;
var
  IoReqArray: array[0..MAX_PENDING_IO_REQS - 1] of TIoReq; // = { 0 }
  SI: TSystemInfo;
  nIOReq: Integer;
begin
  GetSystemInfo(SI);
  g_cs.dwPageSize := SI.dwPageSize;
  g_cs.ulNextReadOffset.QuadPart := 0;
  g_cs.nReadsInProgress := 0;
  g_cs.nWritesInProgress := 0;

  // 打开文件
  Result := PrepareDstFile(pszFileSrc, pszFileDst, g_cs.hFileSrc, g_cs.hFileDst, g_cs.ulFileSize, g_cs.dwPageSize);
  if (Result = FALSE) then Exit;

  // 请求读取
  for nIOReq := 0 to MAX_PENDING_IO_REQS - 1 do
  begin
    IoReqArray[nIOReq].Overlapped.Internal := 0;
    IoReqArray[nIOReq].Overlapped.InternalHigh := 0;
    IoReqArray[nIOReq].Overlapped.Offset := g_cs.ulNextReadOffset.LowPart;
    IoReqArray[nIOReq].Overlapped.OffsetHigh := g_cs.ulNextReadOffset.HighPart;
    IoReqArray[nIOReq].Overlapped.hEvent := 0;
    IoReqArray[nIOReq].pbData := VirtualAlloc(nil, BUFFSIZE, MEM_RESERVE or MEM_COMMIT, PAGE_READWRITE);

    // 未到尾部
    if (g_cs.ulNextReadOffset.QuadPart < g_cs.ulFileSize.QuadPart) then
    begin
      if ReadFileEx(g_cs.hFileSrc, IoReqArray[nIOReq].pbData, BUFFSIZE, IoReqArray[nIOReq], @ReadCompletionRoutine) = FALSE then
      begin
        chMB('ReadFileEx() failure', g_szModName);
        Exit;
      end;
      Inc(g_cs.nReadsInProgress);

      Inc(g_cs.ulNextReadOffset.QuadPart, BUFFSIZE);
    end;
  end;

  // 等待处理
  while (g_cs.nReadsInProgress > 0) or (g_cs.nWritesInProgress > 0) do SleepEx(INFINITE, TRUE);

  // 释放内存
  for nIOReq := 0 to MAX_PENDING_IO_REQS - 1 do VirtualFree(IoReqArray[nIOReq].pbData, 0, MEM_RELEASE);

  // 收尾工作
  CopyCleanup(pszFileDst, g_cs.hFileSrc, g_cs.hFileDst, g_cs.ulFileSize);

  Result := TRUE;
end;

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  chSETDLGICONS(hWnd, IDI_ALERTIO, IDI_ALERTIO);
  EnableWindow(GetDlgItem(hWnd, IDOK), FALSE);
  Result := TRUE;
end;

  // WM_COMMAND
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
var
  szPathname: array[0..MAX_PATH] of Char;
  ofn: TOpenFilename;
  hFile: THandle;
begin
  case (id) of
    IDOK:        // 拷贝
      begin
        Edit_GetText(GetDlgItem(hWnd, IDC_SRCFILE), szPathname, SizeOf(szPathname));
        SetCursor(LoadCursor(0, IDC_WAIT));
        FileCopy(szPathname, 'AlertIO.CPY');
      end;

    IDC_BROWSE:  // 选择
      begin
        szPathname := '*.*';

        chINITSTRUCT(ofn, SizeOf(ofn), TRUE);
        ofn.hWndOwner := hWnd;
        ofn.lpstrFilter := '*.*'#0;
        ofn.lpstrFile := szPathname;
        ofn.nMaxFile := SizeOf(szPathname);
        ofn.Flags := OFN_FILEMUSTEXIST;

        if GetOpenFileName(ofn) then
        begin
          Edit_SetText(GetDlgItem(hWnd, IDC_SRCFILE), szPathname);
          FORWARD_WM_NEXTDLGCTL(hWnd, GetDlgItem(hWnd, IDOK), TRUE);
        end;
      end;

    IDC_SRCFILE: // 变化
      begin
        if (codeNotify <> EN_CHANGE) then Exit; // 其他通知

        SetDlgItemInt(hWnd, IDC_SRCFILESIZE, 0, FALSE);
        EnableWindow(GetDlgItem(hWnd, IDOK), FALSE);

        Edit_GetText(GetDlgItem(hWnd, IDC_SRCFILE), szPathname, SizeOf(szPathname));

        if (PathFileExists(szPathname) = FALSE) then Exit;
        if (GetFileAttributes(szPathname) and FILE_ATTRIBUTE_DIRECTORY <> 0) then Exit;

        hFile := CreateFile(szPathname, GENERIC_READ, 0, nil, OPEN_EXISTING, 0, 0);
        if (hFile = INVALID_HANDLE_VALUE) then Exit;

        SetDlgItemInt(hWnd, IDC_SRCFILESIZE, GetFileSize(hFile, nil), FALSE);
        CloseHandle(hFile);
        EnableWindow(GetDlgItem(hWnd, IDOK), TRUE);
      end;

    IDCANCEL:    // 退出
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
  DialogBox(HInstance, MakeIntResource(IDD_ALERTIO), 0, @Dlg_Proc);
end.
