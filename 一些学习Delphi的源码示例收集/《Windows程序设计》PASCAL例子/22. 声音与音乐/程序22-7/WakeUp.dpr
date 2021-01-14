program  WakeUp;

uses
  Windows, Messages, MMSystem, CommCtrl;

const
  ID_TIMER = 1; // 定时器ID
  ID_TIMEPICK = 0; // 控件ID..
  ID_CHECKBOX = 1;
  ID_PUSHBTN  = 2;
  FTTICKSPERHOUR: LONGLONG = 36000000000;
  SAMPRATE  = 11025;
  NUMSAMPS  = (3 * SAMPRATE);
  HALFSAMPS = (NUMSAMPS div 2);

type
  TWaveForm = record
    chRiff: array[0..3] of Char;
    dwRiffSize: DWORD;
    chWave: array[0..3] of Char;
    chFmt: array[0..3] of Char;
    dwFmtSize: DWORD;
    pwf: TPCMWaveFormat;
    chData: array[0..3] of Char;
    dwDataSize: DWORD;
    byData: array[0..0] of Byte;
  end;
  P_Large_Integer = ^LARGE_INTEGER;

var
  SubbedProc: array[0..2] of Pointer; // 原控件过程
  hWndFocus: HWND; // 当前焦点控件句柄

  // 静态链接comctl32.dll
function InitCommonControlsEx(var ICC: TInitCommonControlsEx): BOOL; stdcall; external comctl32 name 'InitCommonControlsEx';

  // 控件过程(以拦截消息)
function SubProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  idNext, id: Integer;
begin
  id := GetWindowLong(hWnd, GWL_ID); // 控件ID
  Result := CallWindowProc(SubbedProc[id], hWnd, Msg, wParam,lParam); // 标准处理
  case (Msg) of
    WM_CHAR:
      if (wParam = 9) then // Tab键, 焦点跳到下一控件
      begin
        idNext := id;
        repeat
          if (GetKeyState(VK_SHIFT) < 0) then
            idNext := (idNext + 2) mod 3
          else
            idNext := (idNext + 1) mod 3;
        until IsWindowEnabled(GetDlgItem(GetParent(hWnd), idNext)); // 未禁用

        SetFocus(GetDlgItem(GetParent(hWnd), idNext));
      end;

    WM_SETFOCUS:
      hWndFocus := hWnd;
  end;
end;

  // 窗体过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  hWndDTP: LongWord = 0;
  hWndCheck: LongWord = 0;
  hWndPush: LongWord = 0;
  pWaveForm: ^TWaveForm = nil;
  WaveForm: TWaveForm = (
    chRiff: 'RIFF';
    dwRiffSize: NUMSAMPS + $24;
    chWave: 'WAVE';
    chFmt: 'fmt ';
    dwFmtSize: SizeOf(TPCMWaveFormat);
    pwf:
      (
      wf:
        (
          wFormatTag: 1;
          nChannels: 1;
          nSamplesPerSec: SAMPRATE;
          nAvgBytesPerSec: SAMPRATE;
          nBlockAlign: 1;
        );
      wBitsPerSample: 8;
      );
    chData: 'data';
    dwDataSize: NUMSAMPS;
    byData: (0);
      );
{$J-}
var
  ft: TFileTime;
  icex: TInitCommonControlsEx;
  i, cxChar, cyChar: Integer;
  li: LARGE_INTEGER;
  st: TSystemTime;
begin
  Result := 0;
  case (Msg) of
    WM_CREATE:
      begin
       // Some initialization stuff
        icex.dwSize := SizeOf(icex);
        icex.dwICC := ICC_DATE_CLASSES;
        InitCommonControlsEx(icex);

       // Create the waveform file with alternating square waves
        GetMem(pWaveForm, SizeOf(TWaveForm) + NUMSAMPS);
        pWaveForm^ := WaveForm;
        for i := 0 to HALFSAMPS - 1 do
        begin
          if (i mod 600 < 300) then
          begin
            if (i mod 16 < 8) then
              pWaveForm.byData[i] := 25
            else
              pWaveForm.byData[i] := 230;
          end else
          begin
            if (i mod 8 < 4) then
              pWaveForm.byData[i] := 25
            else
              pWaveForm.byData[i] := 230;
          end;
        end;

       // Get character size and set a fixed window size.
        cxChar := LOWORD(GetDialogBaseUnits());
        cyChar := HIWORD(GetDialogBaseUnits());
        SetWindowPos(hWnd, 0, 0, 0, 42 * cxChar, 10 * cyChar div 3 + 2 *
          GetSystemMetrics(SM_CYBORDER) + GetSystemMetrics(SM_CYCAPTION),
          SWP_NOMOVE or SWP_NOZORDER or SWP_NOACTIVATE);

       // Create the three child windows
        hWndDTP := CreateWindow(DATETIMEPICK_CLASS, nil,
          WS_BORDER or WS_CHILD or WS_VISIBLE or DTS_TIMEFORMAT, 2 * cxChar, cyChar,
          12 * cxChar, 4 * cyChar div 3, hWnd, ID_TIMEPICK, hInstance, nil);

        hWndCheck := CreateWindow('Button', 'Set Alarm',
          WS_CHILD or WS_VISIBLE or BS_AUTOCHECKBOX, 16 * cxChar, cyChar,
          12 * cxChar, 4 * cyChar div 3, hWnd, ID_CHECKBOX, hInstance, nil);

        hWndPush := CreateWindow('Button', 'Turn Off',
          WS_CHILD or WS_VISIBLE or BS_PUSHBUTTON or WS_DISABLED, 28 * cxChar,
          cyChar, 12 * cxChar, 4 * cyChar div 3, hWnd, ID_PUSHBTN, hInstance, nil);
          
        hWndFocus := hWndDTP;

       // Subclass the three child windows
        SubbedProc[ID_TIMEPICK] :=
          Pointer(SetWindowLong(hWndDTP, GWL_WNDPROC, DWORD(@SubProc)));

        SubbedProc[ID_CHECKBOX] :=
          Pointer(SetWindowLong(hWndCheck, GWL_WNDPROC, DWORD(@SubProc)));

        SubbedProc[ID_PUSHBTN] :=
          Pointer(SetWindowLong(hWndPush, GWL_WNDPROC, DWORD(@SubProc)));

       // Set the date and time picker control to the current time
       // plus 9 hours, rounded down to next lowest hour
        GetLocalTime(st);
        SystemTimeToFileTime(st, ft);
        li := P_Large_Integer(@ft)^;
        Inc(li.QuadPart, 9 * FTTICKSPERHOUR);
        ft := PFileTime(@li)^;
        FileTimeToSystemTime(ft, st);
        st.wMinute := 0;
        st.wSecond := 0;
        st.wMilliseconds := 0;
        SendMessage(hWndDTP, DTM_SETSYSTEMTIME, 0, Longint(@st));
      end;

    WM_SETFOCUS:
      begin
        SetFocus(hWndFocus);
      end;

    WM_COMMAND:
      begin
        case LOWORD(wParam) of
          ID_CHECKBOX:
            begin
             // When the user checks the "Set Alarm" button, get the
             // time in the date and time control and subtract from
             // it the current PC time.
              if (SendMessage(hWndCheck, BM_GETCHECK, 0, 0) <> BST_UNCHECKED) then
              begin
                SendMessage(hWndDTP, DTM_GETSYSTEMTIME, 0, Longint(@st));
                SystemTimeToFileTime(st, ft);
                li := P_Large_Integer(@ft)^;
                GetLocalTime(st);
                SystemTimeToFileTime(st, ft);
                Dec(li.QuadPart, P_Large_Integer(@ft).QuadPart);
               // Make sure the time is between 0 and 24 hours!
               // These little adjustments let us completely ignore
               // the date part of the SYSTEMTIME structures.
                while (li.QuadPart < 0) do Inc(li.QuadPart, 24 * FTTICKSPERHOUR);
                li.QuadPart := li.QuadPart mod (24 * FTTICKSPERHOUR);
               // Set a one-shot timer! (See you in the morning.)
                SetTimer(hWnd, ID_TIMER, Trunc(li.QuadPart / 10000), nil);
              end else // If button is being unchecked, kill the timer.
                KillTimer(hWnd, ID_TIMER);
            end;

           // The "Turn Off" button turns off the ringing alarm, and also
           // unchecks the "Set Alarm" button and disables itself.
            ID_PUSHBTN:
              begin
                PlaySound(nil, 0, 0); // 停止播放
                SendMessage(hWndCheck, BM_SETCHECK, 0, 0);
                EnableWindow(hWndDTP, TRUE);
                EnableWindow(hWndCheck, TRUE);
                EnableWindow(hWndPush, FALSE);
                SetFocus(hwndDTP);
              end;
        end;
      end;

   // The WM_NOTIFY message comes from the date and time picker.
   // If the user has checked "Set Alarm" and then gone back to
   // change the alarm time, there might be a discrepancy between
   // the displayed time and the one-shot timer. So the program
   // unchecks "Set Alarm" and kills any outstanding timer.
    WM_NOTIFY:
      begin
        if (wParam = ID_TIMEPICK) and (PNMHdr(lParam).code = DTN_DATETIMECHANGE) and
           (SendMessage(hWndCheck, BM_GETCHECK, 0, 0) <> BST_UNCHECKED) then
        begin
          KillTimer(hWnd, ID_TIMER);    	
          SendMessage(hWndCheck, BM_SETCHECK, 0, 0);
        end;
      end;

    WM_TIMER:
      begin
       // When the timer message comes, kill the timer (because we only
       // want a one-shot) and start the annoying alarm noise going.
        KillTimer(hWnd, ID_TIMER);
        PlaySound(PChar(pWaveForm), 0, SND_MEMORY or SND_LOOP or SND_ASYNC);
       // Let the sleepy user turn off the timer by slapping the
       // space bar. If the window is minimized, it's restored; then
       // it's brought to the forefront; then the pushbutton is enabled
       // and given the input focus.
        EnableWindow(hWndDTP, FALSE);
        EnableWindow(hWndCheck, FALSE);
        EnableWindow(hWndPush, TRUE);
        hWndFocus := hWndPush;
        ShowWindow(hWnd, SW_RESTORE);
        SetForegroundWindow(hWnd);
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0);
        FreeMem(pWaveForm);
        if IsWindowEnabled(hWndPush) then PlaySound(nil, 0, 0); // 停止播放
        if (SendMessage(hWndCheck, BM_GETCHECK, 0, 0) <> BST_UNCHECKED) then
          KillTimer(hWnd, ID_TIMER);
      end;

    else Result := DefWindowProc(hWnd, Msg, wParam, lParam);
  end;
end;

const
  szAppName = 'WakeUp';
var
  hWnd: LongWord;
  Msg: TMsg;
  WndClass: TWndClass;
begin
  WndClass.style := 0;
  WndClass.lpfnWndProc := @WndProc;
  WndClass.cbClsExtra := 0;
  WndClass.cbWndExtra := 0;
  WndClass.hInstance := hInstance;
  WndClass.hIcon := LoadIcon(0, IDI_APPLICATION);
  WndClass.hCursor := LoadCursor(0, IDC_ARROW);
  WndClass.hbrBackground := (1 + COLOR_BTNFACE);
  WndClass.lpszMenuName := nil;
  WndClass.lpszClassName := szAppName;
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

  hWnd := CreateWindow(szAppName, szAppName,
    WS_OVERLAPPED or WS_CAPTION or WS_SYSMENU or WS_MINIMIZEBOX, CW_USEDEFAULT,
    CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, 0, 0, hInstance, nil);
  ShowWindow(hWnd, CmdShow);
  UpdateWindow(hWnd);

  while GetMessage(Msg, 0, 0, 0) do
  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;

end.
