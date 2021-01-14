unit DrumTime;

interface

uses Windows, Messages;

const
  NUM_PERC = 47;
  WM_USER_NOTIFY   = WM_USER + 1;
  WM_USER_FINISHED = WM_USER + 2;
  WM_USER_ERROR    = WM_USER + 3;

type
  PDRUM = ^TDRUM;
  TDRUM = packed record
    iMsecPerBeat: Short;
    iVelocity: Short;
    iNumBeats: Short;
    dwSeqPerc: array[0..NUM_PERC - 1] of DWORD;
    dwSeqPian: array[0..NUM_PERC - 1] of DWORD;
  end;

function DrumBeginSequence(hWnd: HWND): Boolean;
procedure DrumEndSequence(bRightAway: Boolean);
procedure DrumSetParams(pDrum: PDRUM);

implementation

uses MMSystem, Math;

const
  TIMER_RES = 5;

var
  bSequenceGoing, bEndSequence: Boolean;
  Drum: TDrum;
  hMidiOut: DWORD; // HMIDIOUT            
  hWndNotify: HWND;
  iIndex: Integer;
  uTimerRes, uTimerID: UINT; 

  // 发送消息
function MidiOutMessage(hMidi, iStatus, iChannel, iData1, iData2: Integer): DWORD;
var
  dwMessage: DWORD;
begin
  dwMessage := iStatus or iChannel or (iData1 shl 8) or (iData2 shl 16);
  Result := midiOutShortMsg(hMidi, dwMessage);
end;

  // 时钟回调
var
  dwSeqPercLast: array[0..NUM_PERC - 1] of DWORD;
  dwSeqPianLast: array[0..NUM_PERC - 1] of DWORD;
procedure DrumTimerFunc(uID, uMsg, dwUser, dw1, dw2: DWORD); stdcall;
var
  i: Integer;
begin
 // Note Off messages for channels 9 and 0
  if (iIndex <> -1) then
  begin
    for i := 0 to NUM_PERC - 1 do
    begin
      if (dwSeqPercLast[i] and (1 shl iIndex) <> 0) then
        MidiOutMessage(hMidiOut, $80, 9, i + 35, 0);
      if (dwSeqPianLast[i] and (1 shl iIndex) <> 0) then
        MidiOutMessage(hMidiOut, $80, 0, i + 35, 0);
    end;
  end;

 // Increment index and notify window to advance bouncing ball
  iIndex := (iIndex + 1) mod drum.iNumBeats;
  PostMessage(hWndNotify, WM_USER_NOTIFY, iIndex, timeGetTime());

 // Check if ending the sequence
  if (bEndSequence) and (iIndex = 0) then
  begin
    PostMessage(hWndNotify, WM_USER_FINISHED, 0, 0);
    Exit;
  end;

 // Note On messages for channels 9 and 0
  for i := 0 to NUM_PERC - 1 do
  begin
    if ((Drum.dwSeqPerc[i] and (1 shl iIndex)) <> 0) then
      MidiOutMessage(hMidiOut, $90, 9, i + 35, Drum.iVelocity);
    if ((Drum.dwSeqPian[i] and (1 shl iIndex)) <> 0) then
      MidiOutMessage(hMidiOut, $90, 0, i + 35, Drum.iVelocity);
    dwSeqPercLast[i] := Drum.dwSeqPerc[i];
    dwSeqPianLast[i] := Drum.dwSeqPian[i];
  end;
  
 // Set a new timer event
  uTimerID := timeSetEvent(Max(uTimerRes, Drum.iMsecPerBeat),
    uTimerRes, DrumTimerFunc, 0, TIME_ONESHOT);
  if (uTimerID = 0) then PostMessage(hWndNotify, WM_USER_ERROR, 0, 0);
end;

  // Running..
function DrumBeginSequence(hWnd: HWND): Boolean;
  function MinMax(a, x, b: Integer): Integer;
  begin
    Result := Min(Max(x, a), b);
  end;
var
  tc: TTimeCaps;
begin
  Result := FALSE;

 // Save window handle for notification
  hWndNotify := hWnd;

 // Stop current sequence if running
  DrumEndSequence(TRUE);
  
 // Open the MIDI Mapper output port
  if (midiOutOpen(@hMidiOut, MIDIMAPPER, 0, 0, 0) <> MMSYSERR_NOERROR) then Exit;

 // Send Program Change messages for channels 9 and 0
  MidiOutMessage(hMidiOut, $C0, 9, 0, 0);
  MidiOutMessage(hMidiOut, $C0, 0, 0, 0);

 // Begin sequence by setting a timer event
  timeGetDevCaps(@tc, SizeOf(TTimeCaps));
  uTimerRes := MinMax(tc.wPeriodMin, TIMER_RES, tc.wPeriodMax);
  timeBeginPeriod(uTimerRes);
  uTimerID := timeSetEvent( Max(uTimerRes, Drum.iMsecPerBeat),
    uTimerRes, @DrumTimerFunc, 0, TIME_ONESHOT );
  if (uTimerID = 0) then
  begin
    timeEndPeriod(uTimerRes);
    midiOutClose(hMidiOut);
    Exit;
  end;

  iIndex := -1;
  bEndSequence := FALSE;
  bSequenceGoing := TRUE;

  Result := TRUE;
end;

  // Stopped..      
procedure DrumEndSequence(bRightAway: Boolean);
begin
  if (bRightAway) then
  begin
    if (bSequenceGoing) then
    begin
     // stop the timer
      if (uTimerID <> 0) then timeKillEvent(uTimerID);
      timeEndPeriod(uTimerRes);

     // turn off all notes
      MidiOutMessage(hMidiOut, $B0, 9, 123, 0);
      MidiOutMessage(hMidiOut, $B0, 0, 123, 0);
      
     // close the MIDI port
      midiOutClose(hMidiOut);
      bSequenceGoing := FALSE;
    end;
  end else
    bEndSequence := TRUE;
end;

  // 拷贝结构
procedure DrumSetParams(pDrum: PDRUM);
begin
  CopyMemory(@Drum, pDrum, SizeOf(TDRUM));
end;

end.
