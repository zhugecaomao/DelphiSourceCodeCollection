program  BachTocc;

uses
  Windows, Messages, MMSystem;

const
  szAppName = 'BachTocc';

  // MIDI消息输出
function MidiOutMessage(hMidi: HMIDIOUT; iStatus, iChannel, iData1, iData2: Integer): DWORD;
var
  dwMessage: DWORD;
begin
  dwMessage := iStatus or iChannel or (iData1 shl 8) or (iData2 shl 16);
  Result := midiOutShortMsg(hMidi, dwMessage);
end;

  // 窗体回调过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
type
  Node = record
    iDur: Integer;
    iNote: array[0..1] of Integer;
  end;
const
  ID_TIMER  = 1; // 定时器ID
  noteseq: array[0..19] of Node =  (
   (iDur: 110; iNote: (69, 81)), (iDur: 110; iNote: (67, 79)), (iDur: 990; iNote: (69, 81)),
   (iDur: 220; iNote: (-1, -1)), (iDur: 110; iNote: (67, 79)), (iDur: 110; iNote: (65, 77)),
   (iDur: 110; iNote: (64, 76)), (iDur: 110; iNote: (62, 74)), (iDur: 220; iNote: (61, 73)),
   (iDur: 440; iNote: (62, 74)), (iDur: 1980; iNote: (-1, -1)), (iDur: 110; iNote: (57, 69)),
   (iDur: 110; iNote: (55, 67)), (iDur: 990; iNote: (57, 69)), (iDur: 220; iNote: (-1, -1)),
   (iDur: 220; iNote: (52, 64)), (iDur: 220; iNote: (53, 65)), (iDur: 220; iNote: (49, 61)),
   (iDur: 440; iNote: (50, 62)), (iDur: 1980; iNote: (-1, -1))
                                   );
{$J+}
  hMidiOut: Integer = 0; // HMIDIOUT
  iIndex: Integer = 0;
{$J-}
var
  i: Integer;
begin
  Result := 0;
  case (Msg) of
    WM_CREATE:
      begin
       // Open MIDIMAPPER device
        if (midiOutOpen(@hMidiOut, MIDIMAPPER, 0, 0, 0) <> MMSYSERR_NOERROR) then
        begin
          MessageBeep(MB_ICONEXCLAMATION);
          MessageBox(hWnd,
            'Cannot open MIDI output device!', szAppName, MB_ICONEXCLAMATION or MB_OK);
          Result := -1;
          Exit;
        end;
       // Send Program Change messages for "Church Organ"
        MidiOutMessage(hMidiOut, $C0, 0, 19, 0);
        MidiOutMessage(hMidiOut, $C0, 12, 19, 0);
        SetTimer(hWnd, ID_TIMER, 1000, nil);
      end;

    WM_TIMER:
      begin
       // Loop for 2-note polyphony
        for i := 0 to 1 do
        begin
         // Note Off messages for previous note
          if (iIndex <> 0) and (noteseq[iIndex - 1].iNote[i] <> -1) then
          begin
            MidiOutMessage(hMidiOut, $80, 0, noteseq[iIndex - 1].iNote[i], 0);
            MidiOutMessage(hMidiOut, $80, 12, noteseq[iIndex - 1].iNote[i], 0);
          end;
         // Note On messages for new note
          if (iIndex <> (SizeOf(noteseq) div SizeOf(noteseq[0])))
             and (noteseq[iIndex].iNote[i] <> -1) then
          begin
            MidiOutMessage(hMidiOut, $90, 0, noteseq[iIndex].iNote[i], 127);
            MidiOutMessage(hMidiOut, $90, 12, noteseq[iIndex].iNote[i], 127);
          end;
        end;
        if iIndex <> SizeOf(noteseq) div SizeOf(noteseq[0]) then
        begin
          SetTimer(hWnd, ID_TIMER, noteseq[iIndex].iDur - 1, nil);
          Inc(iIndex);
        end else
        begin
          KillTimer(hWnd, ID_TIMER);
          DestroyWindow(hWnd);
        end;
      end;

    WM_DESTROY:
      begin
        midiOutReset(hMidiOut);
        midiOutClose(hMidiOut);
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
  WndClass.style := CS_HREDRAW or CS_VREDRAW;
  WndClass.lpfnWndProc := @WndProc;
  WndClass.cbClsExtra := 0;
  WndClass.cbWndExtra := 0;
  WndClass.hInstance := hInstance;
  WndClass.hIcon := LoadIcon(0, IDI_APPLICATION);
  WndClass.hCursor := LoadCursor(0, IDC_ARROW);
  WndClass.hbrBackground := GetStockObject(WHITE_BRUSH);
  WndClass.lpszMenuName := nil;
  WndClass.lpszClassName := szAppName;
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

  hWnd := CreateWindow(szAppName, 'Bach Toccata in D Minor (First Bar)',
                    WS_OVERLAPPEDWINDOW,
                    CW_USEDEFAULT, CW_USEDEFAULT,
                    CW_USEDEFAULT, CW_USEDEFAULT,
                    0, 0, hInstance, nil);
  if (hWnd = 0) then Exit;

  ShowWindow(hWnd, CmdShow);
  UpdateWindow(hWnd);

  while GetMessage(Msg, 0, 0, 0) do
  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;

end.
