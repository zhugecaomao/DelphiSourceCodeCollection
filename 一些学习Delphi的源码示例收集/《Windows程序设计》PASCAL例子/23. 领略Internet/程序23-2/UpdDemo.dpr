program UpdDemo;

{$R UpdDemo.Res}

uses
  Windows, Messages, WinInet;

type
 // 文件信息
  TFileInfo = record
    szFilename: PChar;
    szContents: PChar;
  end;

 // 文件列表
  PFileList = ^TFileList;
  TFileList = record
    iNum: Integer;
    Info: array[0..0] of TFileInfo;
  end;

 // 线程参数
  TParams = record
    bContinue: Boolean;
    hWnd: HWND;
  end;

 // 比较回调
  TCmpFun = function (P1, P2: Pointer): Integer;

const
  szAppName = 'UpdDemo';

 // 控件窗体ID
  IDC_STATUS = 40001;

 // 自定义消息
  WM_USER_CHECKFILES = WM_USER + 1;
  WM_USER_GETFILES   = WM_USER + 2;

 // FTP信息
  FTPSERVER = 'ftp.cpetzold.com';
  DIRECTORY: PChar = 'cpetzold.com/ProgWin/UpdDemo';
  TEMPLATE = 'UD??????.TXT';

 // Displays final status message and changes Cancel to OK
procedure ButtonSwitch(hWndStatus, hWndButton: HWND; szText: PChar);
begin
  if (szText <> nil) then
    SetWindowText(hWndStatus, szText)
  else
    SetWindowText(hWndStatus, 'Internet Session Cancelled');
    
  SetWindowText(hWndButton, 'OK');
  SetWindowLong(hWndButton, GWL_ID, IDOK);
end;

 // Reads files from FTP server and copies them to local disk
procedure FtpThread(var Params: TParams); stdcall;
var
  bSuccess: Boolean;
  hIntSession, hFtpSession, hFind: HINTERNET;
  hWndStatus, hWndButton: HWND;
  szBuffer: array[0..64] of Char;
  FindData: WIN32_FIND_DATA;
  List: DWORD;
begin
  hWndStatus := GetDlgItem(Params.hWnd, IDC_STATUS);
  hWndButton := GetDlgItem(Params.hWnd, IDCANCEL);

 // Open an internet session
  hIntSession := InternetOpen(szAppName,
    INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, INTERNET_FLAG_ASYNC);
  if (hIntSession = nil) then
  begin
    List := GetLastError();
    wvsprintf(szBuffer, 'InternetOpen error %i', @List);
    ButtonSwitch(hWndStatus, hWndButton, szBuffer);
    ExitThread(66);
  end;
  SetWindowText(hWndStatus, 'Internet session opened...');

 // Check if user has pressed Cancel
  if (Params.bContinue = FALSE) then
  begin
    InternetCloseHandle(hIntSession);
    ButtonSwitch(hWndStatus, hWndButton, nil);
    ExitThread(66);
  end;

 // Open an FTP session.
  hFtpSession := InternetConnect(hIntSession,
    FTPSERVER, INTERNET_DEFAULT_FTP_PORT, nil, nil, INTERNET_SERVICE_FTP, 0, 0);
  if (hFtpSession = nil) then
  begin
    InternetCloseHandle(hIntSession);
    List := GetLastError;
    wvsprintf(szBuffer, 'InternetConnect error %i', @List);
    ButtonSwitch(hWndStatus, hWndButton, szBuffer);
    ExitThread(66);
  end;
  SetWindowText(hWndStatus, 'FTP Session opened...');

 // Check if user has pressed Cancel
  if (Params.bContinue = FALSE) then
  begin
    InternetCloseHandle(hFtpSession);
    InternetCloseHandle(hIntSession);
    ButtonSwitch(hWndStatus, hWndButton, nil);
    ExitThread(66);
  end;

 // Set the directory
  bSuccess := FtpSetCurrentDirectory(hFtpSession, DIRECTORY);
  if (bSuccess = FALSE) then
  begin
    InternetCloseHandle(hFtpSession);
    InternetCloseHandle(hIntSession);
    wvsprintf(szBuffer, 'Cannot set directory to %s', @DIRECTORY);
    ButtonSwitch(hWndStatus, hWndButton, szBuffer);
    ExitThread(66);
  end;
  SetWindowText(hWndStatus, 'Directory found...');

 // Check if user has pressed Cancel
  if (Params.bContinue = FALSE) then
  begin
    InternetCloseHandle(hFtpSession);
    InternetCloseHandle(hIntSession);
    ButtonSwitch(hWndStatus, hWndButton, nil);
    ExitThread(66);
  end;

 // Get the first file fitting the template
  hFind := FtpFindFirstFile(hFtpSession, TEMPLATE, FindData, 0, 0);
  if (hFind = nil) then
  begin
    InternetCloseHandle(hFtpSession);
    InternetCloseHandle(hIntSession);
    ButtonSwitch(hWndStatus, hWndButton, 'Cannot find files');
    ExitThread(66);
  end;

  repeat
   // Check if user has pressed Cancel
    if (Params.bContinue = FALSE) then
    begin
      InternetCloseHandle(hFind);
      InternetCloseHandle(hFtpSession);
      InternetCloseHandle(hIntSession);
      ButtonSwitch(hWndStatus, hWndButton, nil);
      ExitThread(66);
    end;
   // Copy file from internet to local hard disk, but fail
   // if the file already exists locally
    wvsprintf(szBuffer, 'Reading file %s...', @FindData.cFileName);
    SetWindowText(hWndStatus, szBuffer);
    FtpGetFile(hFtpSession, FindData.cFileName, FindData.cFileName, TRUE,
      FILE_ATTRIBUTE_NORMAL, FTP_TRANSFER_TYPE_BINARY, 0);
  until (InternetFindNextFile(hFind, @FindData) = FALSE);

  InternetCloseHandle(hFind);
  InternetCloseHandle(hFtpSession);
  InternetCloseHandle(hIntSession);
  ButtonSwitch(hWndStatus, hWndButton, 'Internet Download Complete');
end;

 // 比较回调函数
function Compare(var pInfo1, pInfo2: TFileInfo): Integer;
begin
  Result := lstrcmp(pinfo2.szFilename, pinfo1.szFilename);
end;

 // 通用排序过程
procedure qSort(pData: Pointer; iNum, iSize: Integer; CmpFun: TCmpFun);
  function ptData(Index: Integer): Pointer;
  begin
    Result := Pointer(Integer(pData) + Index * iSize);
  end;
var
  I, J: Integer;
  Swap: Pointer;
begin
  GetMem(Swap, iSize);
  iNum := iNum - 1;
  I := 0;
  while (I < iNum) do
  begin
    J := 0;
    while (J < iNum - I) do
    begin
      if CmpFun(ptData(J), ptData(J + 1)) > 0 then
      begin
        CopyMemory(Swap, ptData(J), iSize);
        CopyMemory(ptData(J), ptData(J + 1), iSize);
        CopyMemory(ptData(J + 1), Swap, iSize);
      end;
      Inc(J);
    end;
    Inc(I);
  end;
  FreeMem(Swap);
end;

 // Reads files from disk and saves their names and contents
function GetFileList(): PFileList;
var
  dwRead: DWORD;
  hFile, hFind: THandle;
  iSize, iNum: Integer;
  FindData: WIN32_FIND_DATA;
begin
  Result := nil;

  hFind := FindFirstFile(TEMPLATE, FindData);
  if (hFind = INVALID_HANDLE_VALUE) then Exit;

  iNum := 0;
  repeat
   // Open the file and get the size
    hFile := CreateFile(FindData.cFileName, GENERIC_READ, FILE_SHARE_READ,
      nil, OPEN_EXISTING, 0, 0);
    if (hFile = INVALID_HANDLE_VALUE) then Continue;

    iSize := GetFileSize(hFile, nil);
    if (iSize = -1) then
    begin
      CloseHandle(hFile);
      Continue;
    end;

   // Realloc the FILELIST structure for a new entry
    ReallocMem(Result, SizeOf(TFileList) + iNum * SizeOf(TFileList));

   // Allocate space and save the filename
    GetMem(Result.Info[iNum].szFilename, lstrlen(FindData.cFileName));
    lstrcpy(Result.Info[iNum].szFilename, FindData.cFileName);

   // Allocate space and save the contents
    GetMem(Result.Info[iNum].szContents, iSize + 1);
    ReadFile(hFile, Result.Info[iNum].szContents^, iSize, dwRead, nil);
    Result.Info[iNum].szContents[iSize] := #0;
    CloseHandle(hFile);
    iNum := iNum + 1;
  until (FindNextFile(hFind, FindData) = FALSE);

  FindClose(hFind);

 // Sort the files by filename
  qSort(@Result.Info[0], iNum, SizeOf(TFileInfo), @Compare);
  Result.iNum := iNum;
end;

 // 对话框回调
function DlgProc(hDlg: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
const
{$J+}
  Params: TParams = ();
{$J-}
begin
  Result := TRUE;
  case (Msg) of
    WM_INITDIALOG:
      begin
        Params.bContinue := TRUE;
        Params.hWnd := hDlg;
        CreateThread(nil, 0, @FtpThread, @Params, 0, PDWORD(nil)^);
      end;

    WM_COMMAND:
      begin
        case LOWORD(wParam) of
          IDCANCEL: // button for user to abort download
            Params.bContinue := FALSE;

          IDOK: // button to make dialog box go away
            EndDialog(hDlg, 0);

          else Result := FALSE;
        end;
      end;
        
    else Result := FALSE;
  end;
end;

 // 窗体回调
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}    
  pList: PFileList = nil;
  cxClient: Integer = 0;
  cyClient: Integer = 0;
  cxChar: Integer = 0;
  cyChar: Integer = 0;
{$J-}  
var
  hWndDc: HDC;
  j: Integer;
  ps: TPaintStruct;
  si: TScrollInfo;
  st: TSystemTime;
  szFilename: array[0..MAX_PATH] of Char;
  List: array[0..1] of DWORD;
begin
  Result := 0;
  case (Msg) of
    WM_CREATE:
      begin
        cxChar := LOWORD(GetDialogBaseUnits());
        cyChar := HIWORD(GetDialogBaseUnits());
      end;

    WM_SIZE:
      begin
        cxClient := LOWORD(lParam);
        cyClient := HIWORD(lParam);

        si.cbSize := SizeOf(TScrollInfo);
        si.fMask := SIF_RANGE or SIF_PAGE;
        si.nMin := 0;
        if (pList <> nil) then si.nMax := pList.iNum - 1 else si.nMax := 0;
        si.nPage := cyClient div cyChar;

        SetScrollInfo(hWnd, SB_VERT, si, TRUE);
      end;

    WM_VSCROLL:
      begin
        si.cbSize := SizeOf(TSCROLLINFO);
        si.fMask := SIF_POS or SIF_RANGE or SIF_PAGE;
        GetScrollInfo(hWnd, SB_VERT, si);
        case LOWORD(wParam) of
          SB_LINEDOWN: Inc(si.nPos, 1);
          SB_LINEUP:   Dec(si.nPos, 1);
          SB_PAGEDOWN: Inc(si.nPos, si.nPage);
          SB_PAGEUP:   Dec(si.nPos, si.nPage);
          SB_THUMBPOSITION: si.nPos := HIWORD(wParam);
          else Exit;
        end;
        si.fMask := SIF_POS;
        SetScrollInfo(hWnd, SB_VERT, si, TRUE);
        InvalidateRect(hWnd, nil, TRUE);
      end;

    WM_USER_CHECKFILES:
      begin
       // Get the system date & form filename from year and month
        GetSystemTime(st);
        List[0] := st.wYear;
        List[1] := st.wMonth;
        wvsprintf(szFilename, 'UD%04i%02i.TXT', @List[0]);

       // Check if the file exists; if so, read all the files
        if (GetFileAttributes(szFilename) <> DWORD(-1)) then
        begin
          SendMessage(hWnd, WM_USER_GETFILES, 0, 0);
          Exit;
        end;
        
       // Otherwise, get files from Internet.
       // But first check so we don't try to copy files to a CD-ROM!
        if (GetDriveType(nil) = DRIVE_CDROM) then
        begin
          MessageBox(hWnd, 'Cannot run this program from CD-ROM!',
            szAppName, MB_OK or MB_ICONEXCLAMATION);
          Exit;
        end;
        
       // Ask user if an Internet connection is desired
        if (IDYES = MessageBox(hWnd, 'Update information from Internet?',
          szAppName, MB_YESNO or MB_ICONQUESTION)) then
        begin
          DialogBox(hInstance, szAppName, hWnd, @DlgProc); // Invoke dialog box
        end;

       // Update display
        SendMessage(hWnd, WM_USER_GETFILES, 0, 0);
      end;

    WM_USER_GETFILES:
      begin
        SetCursor(LoadCursor(0, IDC_WAIT));
        ShowCursor(TRUE);

       // Read in all the disk files
        pList := GetFileList();

        ShowCursor(FALSE);
        SetCursor(LoadCursor(0, IDC_ARROW));

       // Simulate a WM_SIZE message to alter scroll bar & repaint
        SendMessage(hWnd, WM_SIZE, 0, MakeLong(cxClient, cyClient));
        InvalidateRect(hWnd, nil, TRUE);
      end;

    WM_PAINT:
      begin
        hWndDc := BeginPaint(hWnd, ps);

        SetTextAlign(hWndDc, TA_UPDATECP);
        si.cbSize := SizeOf(TScrollInfo);
        si.fMask := SIF_POS;
        GetScrollInfo(hWnd, SB_VERT, si);
        if (pList <> nil) then
        begin
          for j := 0 to pList.iNum - 1 do
          begin
            MoveToEx(hWndDc, cxChar, (j - si.nPos) * cyChar, nil);
            TextOut(hWndDc, 0, 0, pList.Info[j].szFilename, lstrlen(pList.Info[j].szFilename));
            TextOut(hWndDc, 0, 0, ': ', 2);
            TextOutA(hWndDc, 0, 0, pList.Info[j].szContents, lstrlen(pList.Info[j].szContents));
          end;
        end;

        EndPaint(hWnd, ps);
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0);
      end;

    else Result := DefWindowProc(hWnd, Msg, wParam, lParam);
  end;
end;

var
  hWnd: LongWord;
  Msg: TMsg;
  WndClass: TWndClass;
begin
 // 填充结构
  WndClass.style := 0;
  WndClass.lpfnWndProc := @WndProc;
  WndClass.cbClsExtra := 0;
  WndClass.cbWndExtra := 0;
  WndClass.hInstance := hInstance;
  WndClass.hIcon := LoadIcon(0, IDI_APPLICATION);
  WndClass.hCursor := 0;
  WndClass.hbrBackground := GetStockObject(WHITE_BRUSH);
  WndClass.lpszMenuName := nil;
  WndClass.lpszClassName := szAppName;

 // 注册窗体类
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体 
  hWnd := CreateWindow(szAppName, 'Update Demo with Anonymous FTP',
    WS_OVERLAPPEDWINDOW or WS_VSCROLL,
    CW_USEDEFAULT, CW_USEDEFAULT,
    CW_USEDEFAULT, CW_USEDEFAULT,
    0, 0, hInstance, nil);

 // 显示窗体
  ShowWindow(hWnd, CmdShow);
  UpdateWindow(hWnd);

  SendMessage(hWnd, WM_USER_CHECKFILES, 0, 0);

 // 消息循环
  while (GetMessage(Msg, 0, 0, 0)) do
  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end.
