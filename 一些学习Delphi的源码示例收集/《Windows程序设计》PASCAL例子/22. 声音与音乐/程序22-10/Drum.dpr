program Drum;

{$R Drum.Res}

uses
  Windows, Messages, Math, DrumTime in 'DrumTime.pas', DrumFile in 'DrumFile.pas';

const
  szAppName: PChar = 'Drum';
  szUntitled: PChar = '(Untitled)';
  szPerc: array[0..NUM_PERC - 1] of PChar =
    ( 'Acoustic Bass Drum', 'Bass Drum 1', 'Side Stick', 'Acoustic Snare',
      'Hand Clap', 'Electric Snare', 'Low Floor Tom', 'Closed High Hat',
      'High Floor Tom', 'Pedal High Hat', 'Low Tom', 'Open High Hat', 'Low-Mid Tom',
      'High-Mid Tom', 'Crash Cymbal 1', 'High Tom', 'Ride Cymbal 1', 'Chinese Cymbal',
      'Ride Bell', 'Tambourine', 'Splash Cymbal', 'Cowbell', 'Crash Cymbal 2',
      'Vibraslap', 'Ride Cymbal 2', 'High Bongo', 'Low Bongo', 'Mute High Conga',
      'Open High Conga', 'Low Conga', 'High Timbale', 'Low Timbale', 'High Agogo',
      'Low Agogo', 'Cabasa', 'Maracas', 'Short Whistle', 'Long Whistle',
      'Short Guiro', 'Long Guiro', 'Claves', 'High Wood Block', 'Low Wood Block',
      'Mute Cuica', 'Open Cuica', 'Mute Triangle', 'Open Triangle' );
  IDM_FILE_NEW         = 40001; // 菜单ID..
  IDM_FILE_OPEN        = 40002;
  IDM_FILE_SAVE        = 40003;
  IDM_FILE_SAVE_AS     = 40004;
  IDM_APP_EXIT         = 40005;
  IDM_SEQUENCE_RUNNING = 40006;
  IDM_SEQUENCE_STOPPED = 40007;
  IDM_APP_ABOUT        = 40008;

var  
  szBuffer: array[0..80 + MAX_PATH - 1] of Char;
  cxChar, cyChar: Integer;

  // 填充方格
procedure DrawRectangle(hWndDc: HDC; x, y: Integer; dwSeqPerc, dwSeqPian: PDWORD);
    // DWORD组员
  function DWORDpt(Header: PDWORD; Index: Integer): DWORD;
  begin
    Result := PDWORD(Integer(Header) + Index * SizeOf(DWORD))^;
  end;
var
  iBrush: Integer;
begin
  if ( DWORDpt(dwSeqPerc, y) and DWORDpt(dwSeqPian, y) and (1 shl x) ) <> 0 then
  begin
    iBrush := BLACK_BRUSH;
  end else
  begin
    if ( DWORDpt(dwSeqPerc, y) and (1 shl x) ) <> 0 then
    begin
      iBrush := DKGRAY_BRUSH;
    end else
    begin
     if ( DWORDpt(dwSeqPian, y) and (1 shl x) ) <> 0 then
     begin
       iBrush := LTGRAY_BRUSH;
     end else
     begin
       iBrush := WHITE_BRUSH;
     end;
    end;
  end;
  SelectObject(hWndDc, GetStockObject(iBrush));
  Rectangle(hWndDc, (x + 40) * cxChar , (2 * y + 4) * cyChar div 4,
    (x + 41) * cxChar + 1, (2 * y + 6) * cyChar div 4 + 1);
end;

  // 显示错误
procedure ErrorMessage(hWnd: HWND; szError, szTitleName: PChar);
begin
  if (szTitleName[0] <> #0) then
    wvsprintf(szBuffer, szError, @szTitleName)
  else
    wvsprintf(szBuffer, szError, @szUntitled);    
  MessageBeep(MB_ICONEXCLAMATION);
  MessageBox(hWnd, szBuffer, szAppName, MB_OK or MB_ICONEXCLAMATION);
end;

  // 设置标题
procedure DoCaption(hWnd: HWND; szTitleName: PChar);
begin
  if (szTitleName[0] <> #0) then
    wvsprintf(szBuffer, 'MIDI Drum Machine - %s', @szTitleName)
  else
    wvsprintf(szBuffer, 'MIDI Drum Machine - %s', @szUntitled);
  SetWindowText(hWnd, szBuffer);
end;

  // 保存确认
function AskAboutSave(hWnd: HWND; szTitleName: PChar): Integer;
begin
  if (szTitleName[0] <> #0) then
    wvsprintf(szBuffer, 'Save current changes in %s?', @szTitleName)
  else
    wvsprintf(szBuffer, 'Save current changes in %s?', @szUntitled);

  Result := MessageBox(hWnd, szBuffer, szAppName, MB_YESNOCANCEL or MB_ICONQUESTION);

  if (Result = IDYES) and (SendMessage(hWnd, WM_COMMAND, IDM_FILE_SAVE, 0) = 0) then
    Result := IDCANCEL;
end;

  // '关于'回调
function AboutProc(hDlg: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  Result := FALSE;
  case (Msg) of
    WM_INITDIALOG:
      Result := TRUE;

    WM_COMMAND:
      if (LOWORD(wParam) = IDOK) then
      begin
        EndDialog(hDlg, 0);
        Result := TRUE;
      end;
  end;
end;

  // 窗体回调
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  bNeedSave: Boolean = FALSE;
  Drum: TDrum = ();
  hMenu: LongWord = 0; // HMENU
  iTempo: Integer = 50;
  iIndexLast: Integer = 0;
  szFileName: array[0..MAX_PATH] of Char = '';
  szTitleName: array[0..MAX_PATH] of Char = '';
{$J-}
var
  hWndDc: HDC;
  i, x, y: Integer;
  ps: TPaintStruct;
  Point: TPoint;
  Rect: TRect;
  szError: PChar;
begin
  Result := 0;
  case (Msg) of
    WM_CREATE:
      begin
       // Initialize DRUM structure
        Drum.iMsecPerBeat := 100;
        Drum.iVelocity := 64;
        Drum.iNumBeats := 32;
        DrumSetParams(@Drum);

       // Other initialization
        cxChar := LOWORD(GetDialogBaseUnits());
        cyChar := HIWORD(GetDialogBaseUnits());
        GetWindowRect(hWnd, Rect);
        MoveWindow(hWnd, Rect.Left, Rect.Top, 77 * cxChar, 29 * cyChar, FALSE);
        hMenu := GetMenu(hWnd);

       // Initialize "Volume" scroll bar
        SetScrollRange(hWnd, SB_HORZ, 1, 127, FALSE);
        SetScrollPos(hWnd, SB_HORZ, drum.iVelocity, TRUE);

       // Initialize "Tempo" scroll bar
        SetScrollRange(hWnd, SB_VERT, 0, 100, FALSE);
        SetScrollPos(hWnd, SB_VERT, iTempo, TRUE);
        DoCaption(hWnd, szTitleName);
      end;

    WM_COMMAND:
      begin
        case LOWORD(wParam) of
          IDM_FILE_NEW:
            begin
              if (bNeedSave) and (AskAboutSave(hWnd, szTitleName) = IDCANCEL) then Exit;

              for i := 0 to NUM_PERC - 1 do // Clear drum pattern
              begin
                Drum.dwSeqPerc[i] := 0;
                Drum.dwSeqPian[i] := 0;
              end;
              
              InvalidateRect(hWnd, nil, FALSE);
              DrumSetParams(@Drum);
              bNeedSave := FALSE;
            end;

          IDM_FILE_OPEN:
            begin
             // Save previous file
              if (bNeedSave) and (AskAboutSave(hWnd, szTitleName) = IDCANCEL) then Exit;

             // Open the selected file
              if DrumFileOpenDlg(hWnd, szFileName, szTitleName) then
              begin
                szError := DrumFileRead(@Drum, szFileName);
                if (szError <> nil) then
                begin
                  ErrorMessage(hWnd, szError, szTitleName);
                  szTitleName[0] := #0;
                end else
                begin // Set new parameters
                  iTempo := Trunc(50 *(log10(Drum.iMsecPerBeat) - 1));
                  SetScrollPos(hWnd, SB_VERT, iTempo, TRUE);
                  SetScrollPos(hWnd, SB_HORZ, Drum.iVelocity, TRUE);
                  DrumSetParams(@Drum);
                  InvalidateRect(hWnd, nil, FALSE);
                  bNeedSave := FALSE;
                end;
                DoCaption(hWnd, szTitleName);
              end;
            end;

          IDM_FILE_SAVE,
          IDM_FILE_SAVE_AS:
            begin
             // Save the selected file
              if ( (LOWORD(wParam) = IDM_FILE_SAVE) and (szTitleName[0] <> #0) )
                 or DrumFileSaveDlg(hWnd, szFileName, szTitleName) then
              begin
                szError := DrumFileWrite(@Drum, szFileName);
                if (szError <> nil) then
                begin
                  ErrorMessage(hWnd, szError, szTitleName);
                  szTitleName[0] := #0;
                end else
                  bNeedSave := FALSE;
                DoCaption(hWnd, szTitleName);
              end;
            end;

          IDM_APP_EXIT:
            begin
              SendMessage(hWnd, WM_SYSCOMMAND, SC_CLOSE, 0);
            end;

          IDM_SEQUENCE_RUNNING:
            begin
             // Begin sequence
              if (not DrumBeginSequence(hWnd)) then
              begin
                ErrorMessage(hWnd,
                  'Could not start MIDI sequence -- MIDI Mapper device is unavailable!',
                  szTitleName);
              end else
              begin
                CheckMenuItem(hMenu, IDM_SEQUENCE_RUNNING, MF_CHECKED);
                CheckMenuItem(hMenu, IDM_SEQUENCE_STOPPED, MF_UNCHECKED);
              end;
            end;

          IDM_SEQUENCE_STOPPED:
            begin
              DrumEndSequence(FALSE); // Finish at end of sequence
            end;

          IDM_APP_ABOUT:
            begin
              DialogBox(hInstance, 'AboutBox', hWnd, @AboutProc);
            end;
        end;
      end;

    WM_LBUTTONDOWN,
    WM_RBUTTONDOWN:
      begin
        hWndDc := GetDC(hWnd);

       // Convert mouse coordinates to grid coordinates
        x := LOWORD(lParam) div cxChar - 40;
        y := 2 * HIWORD (lParam) div cyChar - 2;
        
       // Set a new number of beats of sequence
        if (x > 0) and (x <= 32) and (y < 0) then
        begin
           SetTextColor(hWndDc, RGB(255, 255, 255)); // 白色
           TextOut(hWndDc, (40 + Drum.iNumBeats) * cxChar, 0, ':|', 2);

           SetTextColor(hWndDc, RGB(0, 0, 0)); // 黑色
           if (Drum.iNumBeats mod 4 = 0) then
             TextOut(hWndDc, (40 + Drum.iNumBeats) * cxChar, 0, '.', 1);
             
           Drum.iNumBeats := x;
           TextOut(hWndDc, (40 + drum.iNumBeats) * cxChar, 0, ':|', 2);
           
           bNeedSave := TRUE;
        end;
        
       // Set or reset a percussion instrument beat
        if (x >= 0) and (x < 32) and (y >= 0) and (y < NUM_PERC) then
        begin
          if (Msg = WM_LBUTTONDOWN) then
            Drum.dwSeqPerc[y] := Drum.dwSeqPerc[y] xor (1 shl x) // 左键
          else
            Drum.dwSeqPian[y] := Drum.dwSeqPian[y] xor (1 shl x); // 右键
          DrawRectangle(hWndDc, x, y, @Drum.dwSeqPerc[0], @Drum.dwSeqPian[0]);
          bNeedSave := TRUE; 
        end;
        
        ReleaseDC(hWnd, hWndDc);
        DrumSetParams(@Drum);
      end;

    WM_HSCROLL:
      begin
       // Change the note velocity
        case LOWORD(wParam) of
          SB_LINEUP:
            Dec(Drum.iVelocity, 1);
          SB_LINEDOWN:
            Inc(Drum.iVelocity, 1);
          SB_PAGEUP:
            Dec(Drum.iVelocity, 8);
          SB_PAGEDOWN:
            Inc(Drum.iVelocity, 8);
          SB_THUMBPOSITION:
            Drum.iVelocity := HIWORD(wParam);
          else Exit;
        end;
        Drum.iVelocity := Max(1, Min(Drum.iVelocity, 127));
        SetScrollPos(hWnd, SB_HORZ, Drum.iVelocity, TRUE);
        DrumSetParams(@Drum);
        bNeedSave := TRUE;
      end;

    WM_VSCROLL:
      begin
       // Change the tempo
        case LOWORD(wParam) of
          SB_LINEUP:
            Dec(iTempo, 1);
          SB_LINEDOWN:
            Inc(iTempo, 1);
          SB_PAGEUP:
            Dec(iTempo, 10);
          SB_PAGEDOWN:
            Inc(iTempo, 10);
          SB_THUMBPOSITION:
            iTempo := HIWORD(wParam);
          else
            Exit;
        end;
        iTempo := Max(0, Min(iTempo, 100));
        SetScrollPos(hWnd, SB_VERT, iTempo, TRUE);
        Drum.iMsecPerBeat := Trunc(10 * Power(100, iTempo / 100.0));
        DrumSetParams(@Drum);
        bNeedSave := TRUE;
      end;

    WM_PAINT:
      begin
        hWndDc := BeginPaint(hWnd, ps);

        SetTextAlign(hWndDc, TA_UPDATECP);
        SetBkMode(hWndDc, TRANSPARENT);

       // Draw the text strings and horizontal lines
        for i := 0 to NUM_PERC - 1 do
        begin
          MoveToEx(hWndDc, IfThen((i and 1) <> 0, 20 * cxChar, cxChar),
            (2 * i + 3) * cyChar div 4, nil);
          TextOut(hWndDc, 0, 0, szPerc[i], lstrlen(szPerc[i]));
          GetCurrentPositionEx(hWndDc, @Point);
          MoveToEx(hWndDc, Point.x + cxChar, point.y + cyChar div 2, nil);
          LineTo(hWndDc, 39 * cxChar, point.y + cyChar div 2);
        end;

        SetTextAlign(hWndDc, TA_TOP);
       // Draw rectangular grid, repeat mark, and beat marks
        for x := 0 to 31 do
        begin
          for y := 0 to NUM_PERC - 1 do
            DrawRectangle(hWndDc, x, y, @Drum.dwSeqPerc[0], @Drum.dwSeqPian[0]);
          SetTextColor(hWndDc, IfThen(x = Drum.iNumBeats - 1, 0, $FFFFFF));
          TextOut(hWndDc, (41 + x) * cxChar, 0, ':|', 2);
          SetTextColor(hWndDc, RGB(0, 0, 0));
          if ((x mod 4) = 0) then TextOut(hWndDc, (40 + x) * cxChar, 0, '.', 1);
        end;
        
        EndPaint(hWnd, ps);
      end;

    WM_USER_NOTIFY:
      begin
       // Draw the "bouncing ball"
        hWndDc := GetDC(hWnd);
        SelectObject(hWndDc, GetStockObject(NULL_PEN));
        SelectObject(hWndDc, GetStockObject(WHITE_BRUSH));
        for i := 0 to 1 do
        begin
          x := iIndexLast;
          y := NUM_PERC + 1;
          Ellipse(hWndDc, (x + 40) * cxChar, (2 * y + 3) * cyChar div 4,
            (x + 41) * cxChar, (2 * y + 5) * cyChar div 4);
          iIndexLast := wParam;
          SelectObject(hWndDc, GetStockObject(BLACK_BRUSH));
        end;
        ReleaseDC(hWnd, hWndDc);
      end;

    WM_USER_ERROR:
      begin
        ErrorMessage(hWnd, 'Can'#39't set timer event for tempo', szTitleName);
        WndProc(hWnd, WM_USER_FINISHED, 0, 0); // 转下一分支
      end;

    WM_USER_FINISHED:
      begin
        DrumEndSequence(TRUE);
        CheckMenuItem(hMenu, IDM_SEQUENCE_RUNNING, MF_UNCHECKED);
        CheckMenuItem(hMenu, IDM_SEQUENCE_STOPPED, MF_CHECKED);
      end;

    WM_CLOSE:
      begin
        if (not bNeedSave) or (AskAboutSave(hWnd, szTitleName) <> IDCANCEL) then
          DestroyWindow(hWnd);
      end;

    WM_QUERYENDSESSION:
      begin
        if (not bNeedSave) or (AskAboutSave(hWnd, szTitleName) <> IDCANCEL) then
          Result := 1;
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0);
        DrumEndSequence(TRUE);
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam);
  end;
end;

var
  hWnd: LongWord;
  Msg: TMsg;
  WndClass: TWndClass;
begin
 // 填充结构
  WndClass.style := CS_HREDRAW or CS_VREDRAW;
  WndClass.lpfnWndProc := @WndProc;
  WndClass.cbClsExtra := 0;
  WndClass.cbWndExtra := 0;
  WndClass.hInstance := hInstance;
  WndClass.hIcon := LoadIcon(hInstance, szAppName);
  WndClass.hCursor := LoadCursor(0, IDC_ARROW);
  WndClass.hbrBackground := GetStockObject(WHITE_BRUSH);
  WndClass.lpszMenuName := szAppName;
  WndClass.lpszClassName := szAppName;

 // 注册窗体
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体 
  hWnd := CreateWindow(szAppName, nil,
    WS_OVERLAPPED or WS_CAPTION or WS_SYSMENU or WS_MINIMIZEBOX or WS_HSCROLL or WS_VSCROLL,
    CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, 0, 0, hInstance, CmdLine);

 // 显示窗体
  ShowWindow(hWnd, CmdShow);
  UpdateWindow(hWnd);

 // 消息循环 
  while (GetMessage(Msg, 0, 0, 0)) do
  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end.
