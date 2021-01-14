program NetTime;

{$R NetTime.Res}

uses
  Windows, Messages, WinSock;

type
  P_LARGE_INTEGER = ^LARGE_INTEGER;

const
  IDC_TEXTOUT  = 101;
  IDC_SERVER1  = 1001;
  IDC_SERVER2  = 1002;
  IDC_SERVER3  = 1003;
  IDC_SERVER4  = 1004;
  IDC_SERVER5  = 1005;
  IDC_SERVER6  = 1006;
  IDC_SERVER7  = 1007;
  IDC_SERVER8  = 1008;
  IDC_SERVER9  = 1009;
  IDC_SERVER10 = 1010;
  IDC_SERVER   = 1011;
  IDC_CLOSE    = 1012;
  WM_SOCKET_NOTIFY = WM_USER + 1;
  ID_TIMER = 1;
  
var
  hWndModeless: HWND; // 对话框句柄

  // 输出格式化字符
procedure EditPrintf(hWndEdit: HWND; szFormat: PChar; List: array of Integer);
var
  szBuffer: array[0..1024] of Char;
begin
  wvsprintf(szBuffer, szFormat, @List[0]);
  SendMessage(hWndEdit, EM_SETSEL, -1, -1);
  SendMessage(hWndEdit, EM_REPLACESEL, WPARAM(FALSE), LPARAM(@szBuffer[0]));
  SendMessage(hWndEdit, EM_SCROLLCARET, 0, 0);
end;

  // 输出格式化时间
procedure FormatUpdatedTime(hWndEdit: HWND; pstOld, pstNew: PSystemTime);
var
  szDateOld: array[0..64] of Char;
  szTimeOld: array[0..64] of Char;
  szDateNew: array[0..64] of Char;
  szTimeNew: array[0..64] of Char;
begin
  GetDateFormat(LOCALE_USER_DEFAULT,
    LOCALE_NOUSEROVERRIDE or DATE_SHORTDATE, pstOld, nil, szDateOld, SizeOf(szDateOld));

  GetTimeFormat(LOCALE_USER_DEFAULT,
    LOCALE_NOUSEROVERRIDE or TIME_NOTIMEMARKER or TIME_FORCE24HOURFORMAT,
    pstOld, nil, szTimeOld, SizeOf(szTimeOld));

  GetDateFormat(LOCALE_USER_DEFAULT,
    LOCALE_NOUSEROVERRIDE or DATE_SHORTDATE, pstNew, nil, szDateNew, SizeOf(szDateNew));

  GetTimeFormat(LOCALE_USER_DEFAULT,
    LOCALE_NOUSEROVERRIDE or TIME_NOTIMEMARKER or TIME_FORCE24HOURFORMAT,
    pstNew, nil, szTimeNew, SizeOf(szTimeNew));
    
  EditPrintf(hWndEdit,
    'System date and time successfully changed from'#13#10#9'%s, %s.%03i to'#13#10#9'%s, %s.%03i.',
    [Integer(@szDateOld[0]), Integer(@szTimeOld[0]), Integer(pstOld.wMilliseconds),
    Integer(@szDateNew[0]), Integer(@szTimeNew[0]), Integer(pstNew.wMilliseconds)]);
end;

  // 修改系统时间
procedure ChangeSystemTime(hWndEdit: HWND;  ulTime: ULONG);
var
  ftNew: TFileTime;
  li: LARGE_INTEGER;
  stOld, stNew: TSystemTime;
begin
  GetLocalTime(stOld);

  stNew.wYear := 1900;
  stNew.wMonth := 1;
  stNew.wDay := 1;
  stNew.wHour := 0;
  stNew.wMinute := 0;
  stNew.wSecond := 0;
  stNew.wMilliseconds := 0;
  
  SystemTimeToFileTime(stNew, ftNew);
  li := P_LARGE_INTEGER(@ftNew)^;
  li.QuadPart := li.QuadPart + LONGLONG(10000000) * ulTime;
  ftNew := PFileTime(@li)^;
  FileTimeToSystemTime(ftNew, stNew);
  
  if SetSystemTime(stNew) then
  begin
    GetLocalTime(stNew);
    FormatUpdatedTime(hWndEdit, @stOld, @stNew);
  end else
    EditPrintf(hWndEdit, 'Could NOT set new date and time.', [66]);
end;

  // 对话框回调
function ServerDlg(hDlg: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
const
{$J+}
  szServer: PChar = nil; // IP字符串
  wServer: WORD = IDC_SERVER1; // 所选服务器
{$J-}
var
  szLabel: array[0..64] of Char;
  iPos: Integer;
begin
  Result := TRUE;
  case (Msg) of
    WM_INITDIALOG:
      begin
        szServer := PChar(lParam);
        CheckRadioButton(hDlg, IDC_SERVER1, IDC_SERVER10, wServer);
      end;

    WM_COMMAND:
      begin
        case LOWORD(wParam) of
          IDC_SERVER1,
          IDC_SERVER2,
          IDC_SERVER3,
          IDC_SERVER4,
          IDC_SERVER5,
          IDC_SERVER6,
          IDC_SERVER7,
          IDC_SERVER8,
          IDC_SERVER9,
          IDC_SERVER10:
            begin
              wServer := LOWORD(wParam);
            end;

          IDOK:
            begin
              GetDlgItemTextA(hDlg, wServer, szLabel, SizeOf(szLabel));

              iPos := Pos('(', szLabel);
              MoveMemory(@szLabel[0], @szLabel[iPos], 65 - iPos);

              iPos := Pos(')', szLabel);
              szLabel[iPos - 1] := #0;
              CopyMemory(szServer, @szLabel[0], iPos);

              EndDialog(hDlg, 1); // TRUE
            end;

          IDCANCEL:
            begin
              EndDialog(hDlg, 0); // FALSE
            end;

          else Result := FALSE;
        end;
      end;
        
    else Result := FALSE;
  end;
end;

  // 对话框回调
function MainDlg(hDlg: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
const
  szIPAddr: array[0..31] of Char = '132.163.135.130';
{$J+}
  hWndButton: HWND = 0;
  hWndEdit: HWND = 0;
  sock: TSocket = 0;
  sa: TSockAddrIn = ();
  szOKLabel: array[0..32] of Char = '';
var
  iError: Integer;
  ulTime: LongWord; // unsigned long
  wEvent, wError: WORD;
  WSAData: TWSAData;
begin
  Result := TRUE;
  case (Msg) of
    WM_INITDIALOG:
      begin
        hWndButton := GetDlgItem(hDlg, IDOK);
        hWndEdit := GetDlgItem(hDlg, IDC_TEXTOUT);
      end;

    WM_COMMAND:
      case LOWORD(wParam) of
        IDC_SERVER:
          begin
            DialogBoxParam(hInstance, 'Servers', hDlg, @ServerDlg, Integer(@szIPAddr[0]));
          end;

        IDOK:
          begin
           // Call "WSAStartup" and display description text
            iError := WSAStartup(MakeWord(2, 0), WSAData);
            if (iError <> 0) then
            begin
              EditPrintf(hWndEdit, 'Startup error #%i.'#13#10, iError);
              Exit;
            end;
            EditPrintf(hWndEdit,'Started up %hs'#13#10, [Integer(@WSAData.szDescription[0])]);

           // Call "socket"
            sock := socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
            if (sock = INVALID_SOCKET) then
            begin
              EditPrintf(hWndEdit, 'Socket creation error #%i.'#13#10, [WSAGetLastError()]);
              WSACleanup();
              Exit;
            end;
            EditPrintf(hWndEdit, 'Socket %i created.'#13#10, sock);

           // Call "WSAAsyncSelect"
            if (WSAAsyncSelect(sock, hDlg, WM_SOCKET_NOTIFY, FD_CONNECT or FD_READ) = SOCKET_ERROR) then
            begin
              EditPrintf(hWndEdit, 'WSAAsyncSelect error #%i.'#13#10, [WSAGetLastError()]);
              closesocket(sock);
              WSACleanup();
              Exit;
            end;
            
           // Call "connect" with IP address and time-server port
            sa.sin_family := AF_INET;
            sa.sin_port := htons(IPPORT_TIMESERVER);
            sa.sin_addr.S_addr := inet_addr(szIPAddr);
            connect(sock, sa, SizeOf(sa));

           // "connect" will return SOCKET_ERROR because even if it
           // succeeds, it will require blocking. The following only
           // reports unexpected errors.
            iError := WSAGetLastError();
            if (iError <> WSAEWOULDBLOCK) then
            begin
              EditPrintf(hWndEdit, 'Connect error #%i.'#13#10, iError);
              closesocket(sock);
              WSACleanup();
              Exit;
            end;
            EditPrintf(hWndEdit, 'Connecting to %hs...', [Integer(@szIPAddr[0])]);

           // The result of the "connect" call will be reported
           // through the WM_SOCKET_NOTIFY message.
           // Set timer and change the button to "Cancel"
            SetTimer(hDlg, ID_TIMER, 1000, nil);
            GetWindowText(hWndButton, szOKLabel, SizeOf(szOKLabel));
            SetWindowText(hWndButton, 'Cancel');
            SetWindowLong(hWndButton, GWL_ID, IDCANCEL);
          end;

        IDCANCEL:
          begin
            closesocket(sock);
            sock := 0;
            WSACleanup();
            
            SetWindowText(hWndButton, szOKLabel);
            SetWindowLong(hWndButton, GWL_ID, IDOK);
            KillTimer(hDlg, ID_TIMER);
            EditPrintf(hWndEdit, #13#10'Socket closed.'#13#10, [66]);
          end;

        IDC_CLOSE:
          begin
            if (sock <> 0) then SendMessage(hDlg, WM_COMMAND, IDCANCEL, 0);
            DestroyWindow(GetParent(hDlg));
          end;

        else Result := FALSE;
      end;

    WM_TIMER:
      begin
        EditPrintf(hWndEdit, '.', [66]);
      end;

    WM_SOCKET_NOTIFY:
      begin
        wEvent := WSAGETSELECTEVENT(lParam); // ie, LOWORD
        wError := WSAGETSELECTERROR(lParam); // ie, HIWORD
        
       // Process two events specified in WSAAsyncSelect
        case (wEvent) of
          FD_CONNECT: // This event occurs as a result of the "connect" call
            begin
              EditPrintf(hWndEdit, #13#10, [66]);

              if (wError <> 0) then
              begin
                EditPrintf(hWndEdit, 'Connect error #%i.', [wError]);
                SendMessage(hDlg, WM_COMMAND, IDCANCEL, 0);
                Exit;
              end;
              EditPrintf(hWndEdit, 'Connected to %hs.'#13#10, [Integer(@szIPAddr[0])]);

             // Try to receive data. The call will generate an error
             // of WSAEWOULDBLOCK and an event of FD_READ
              recv(sock, ulTime, 4, MSG_PEEK);
              EditPrintf(hWndEdit, 'Waiting to receive...', [66]);
              Exit;
            end;

          FD_READ: // This even occurs when the "recv" call can be made
            begin
              KillTimer(hDlg, ID_TIMER);
              EditPrintf(hWndEdit, #13#10, [66]);

              if (wError <> 0) then
              begin
                EditPrintf(hWndEdit, 'FD_READ error #%i.', [wError]);
                SendMessage(hDlg, WM_COMMAND, IDCANCEL, 0);
                Exit;
              end;
              
             // Get the time and swap the bytes
              recv(sock, ulTime, 4, 0);
              ulTime := ntohl(ulTime);
              EditPrintf(hWndEdit,
                'Received current time of %u seconds since Jan. 1 1900.'#13#10,
                [ulTime]);
                
             // Change the system time
              ChangeSystemTime(hWndEdit, ulTime);
              SendMessage(hDlg, WM_COMMAND, IDCANCEL, 0);
            end;

          else Result := FALSE;
        end; // END: case (wEvent) of
      end;

    else Result := FALSE;
  end;
end;

  // 窗体回调
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
begin
  case (Msg) of
    WM_SETFOCUS: SetFocus(hWndModeless);
    WM_DESTROY: PostQuitMessage(0);
  end;
  Result := DefWindowProc(hWnd, Msg, wParam, lParam);
end;

const
  szAppName = 'NetTime';
var
  hWnd: LongWord;
  Msg: TMsg;
  WndClass: TWndClass;
  Rect: TRect;
begin
 // 填充结构
  WndClass.style := 0;
  WndClass.lpfnWndProc := @WndProc;
  WndClass.cbClsExtra := 0;
  WndClass.cbWndExtra := 0;
  WndClass.hInstance := hInstance;
  WndClass.hIcon := LoadIcon(0, IDI_APPLICATION);
  WndClass.hCursor := 0;
  WndClass.hbrBackground := 0;
  WndClass.lpszMenuName := nil;
  WndClass.lpszClassName := szAppName;

 // 注册窗体类
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体 
  hWnd := CreateWindow(szAppName, 'Set System Clock from Internet',
    WS_OVERLAPPED or WS_CAPTION or WS_SYSMENU or WS_BORDER or WS_MINIMIZEBOX,
    CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, 0, 0, hInstance, nil);

 // 建立对话框
  hWndModeless := CreateDialog(hInstance, szAppName, hWnd, @MainDlg);

 // 调整窗体 
  GetWindowRect(hWndModeless, Rect);
  AdjustWindowRect(Rect, WS_CAPTION or WS_BORDER, FALSE);
  SetWindowPos(hWnd, 0, 0, 0, Rect.Right - Rect.Left, Rect.Bottom - Rect.Top, SWP_NOMOVE);

 // 显示窗体
  ShowWindow(hWndModeless, SW_SHOW);   
  ShowWindow(hWnd, CmdShow);
  UpdateWindow(hWnd);

 // 消息循环 
  while (GetMessage(Msg, 0, 0, 0)) do
  begin
    if (hWndModeless = 0) or (IsDialogMessage(hWndModeless, Msg) = FALSE) then
    begin
      TranslateMessage(Msg);
      DispatchMessage(Msg);
    end;
  end;
end.
