program  KBMidi;

uses
  Windows, Messages, MMSystem, Math;

type
  INSTRUMENT = record
    szInst: PChar;
    iVoice: Integer;
  end;

  FAMILY = record
    szFam: PChar;
    inst: array[0..7] of INSTRUMENT;
  end;

  Tkey = record
    iOctave: Integer;
    iNote, yPos, xPos: Integer;
    szKey: PChar;
  end;

const
  szAppName: PChar = 'KBMidi';
  
  IDM_OPEN: DWORD = $100;
  IDM_CLOSE: DWORD = $101;
  IDM_DEVICE: DWORD = $200;
  IDM_CHANNEL: DWORD = $300;
  IDM_VOICE: DWORD = $400;

  fam: array[0..15] of FAMILY = (
    (szFam: 'Piano';
     inst:
      ((szInst: 'Acoustic Grand Piano';  iVoice: 0),
       (szInst: 'Bright Acoustic Piano'; iVoice: 1),
       (szInst: 'Electric Grand Piano';  iVoice: 2),
       (szInst: 'Honky-tonk Piano';      iVoice: 3),
       (szInst: 'Rhodes Piano';          iVoice: 4),
       (szInst: 'Chorused Piano';        iVoice: 5),
       (szInst: 'Harpsichord';           iVoice: 6),
       (szInst: 'Clavinet';              iVoice: 7))),
    (szFam: 'Chromatic Percussion';
     inst:
      ((szInst: 'Celesta';       iVoice: 8),
       (szInst: 'Glockenspiel';  iVoice: 9),
       (szInst: 'Music Box';     iVoice: 10),
       (szInst: 'Vibraphone';    iVoice: 11),
       (szInst: 'Marimba';       iVoice: 12),
       (szInst: 'Xylophone';     iVoice: 13),
       (szInst: 'Tubular Bells'; iVoice: 14),
       (szInst: 'Dulcimer';      iVoice: 15))),
    (szFam: 'Organ';
     inst:
      ((szInst: 'Hammond Organ';    iVoice: 16),
       (szInst: 'Percussive Organ'; iVoice: 17),
       (szInst: 'Rock Organ';       iVoice: 18),
       (szInst: 'Church Organ';     iVoice: 19),
       (szInst: 'Reed Organ';       iVoice: 20),
       (szInst: 'Accordian';        iVoice: 21),
       (szInst: 'Harmonica';        iVoice: 22),
       (szInst: 'Tango Accordian';  iVoice: 23))),
    (szFam: 'Guitar';
     inst:
      ((szInst: 'Acoustic Guitar (nylon)'; iVoice: 24),
       (szInst: 'Acoustic Guitar (steel)'; iVoice: 25),
       (szInst: 'Electric Guitar (jazz)';  iVoice: 26),
       (szInst: 'Electric Guitar (clean)'; iVoice: 27),
       (szInst: 'Electric Guitar (muted)'; iVoice: 28),
       (szInst: 'Overdriven Guitar';       iVoice: 29),
       (szInst: 'Distortion Guitar';       iVoice: 30),
       (szInst: 'Guitar Harmonics';        iVoice: 31))),
    (szFam: 'Bass';
     inst:
      ((szInst: 'Acoustic Bass';         iVoice: 32),
       (szInst: 'Electric Bass (finger)'; iVoice: 33),
       (szInst: 'Electric Bass (pick)';   iVoice: 34),
       (szInst: 'Fretless Bass';          iVoice: 35),
       (szInst: 'Slap Bass 1';            iVoice: 36),
       (szInst: 'Slap Bass 2';            iVoice: 37),
       (szInst: 'Synth Bass 1';           iVoice: 38),
       (szInst: 'Synth Bass 2';           iVoice: 39))),
    (szFam: 'Strings';
     inst:
      ((szInst: 'Violin';            iVoice: 40),
       (szInst: 'Viola';             iVoice: 41),
       (szInst: 'Cello';             iVoice: 42),
       (szInst: 'Contrabass';        iVoice: 43),
       (szInst: 'Tremolo Strings';   iVoice: 44),
       (szInst: 'Pizzicato Strings'; iVoice: 45),
       (szInst: 'Orchestral Harp';   iVoice: 46),
       (szInst: 'Timpani';           iVoice: 47))),
    (szFam: 'Ensemble';
     inst:
      ((szInst: 'String Ensemble 1'; iVoice: 48),
       (szInst: 'String Ensemble 2'; iVoice: 49),
       (szInst: 'Synth Strings 1';   iVoice: 50),
       (szInst: 'Synth Strings 2';   iVoice: 51),
       (szInst: 'Choir Aahs';        iVoice: 52),
       (szInst: 'Voice Oohs';        iVoice: 53),
       (szInst: 'Synth Voice';       iVoice: 54),
       (szInst: 'Orchestra Hit';     iVoice: 55))),
    (szFam: 'Brass';
     inst:
      ((szInst: 'Trumpet';       iVoice: 56),
       (szInst: 'Trombone';      iVoice: 57),
       (szInst: 'Tuba';          iVoice: 58),
       (szInst: 'Muted Trumpet'; iVoice: 59),
       (szInst: 'French Horn';   iVoice: 60),
       (szInst: 'Brass Section'; iVoice: 61),
       (szInst: 'Synth Brass 1'; iVoice: 62),
       (szInst: 'Synth Brass 2'; iVoice: 63))),
    (szFam: 'Reed';
     inst:
      ((szInst: 'Soprano Sax';  iVoice: 64),
       (szInst: 'Alto Sax';     iVoice: 65),
       (szInst: 'Tenor Sax';    iVoice: 66),
       (szInst: 'Baritone Sax'; iVoice: 67),
       (szInst: 'Oboe';         iVoice: 68),
       (szInst: 'English Horn'; iVoice: 69),
       (szInst: 'Bassoon';      iVoice: 70),
       (szInst: 'Clarinet';     iVoice: 71))),
    (szFam: 'Pipe';
     inst:
      ((szInst: 'Piccolo';     iVoice: 72),
       (szInst: 'Flute ';      iVoice: 73),
       (szInst: 'Recorder';    iVoice: 74),
       (szInst: 'Pan Flute';   iVoice: 75),
       (szInst: 'Bottle Blow'; iVoice: 76),
       (szInst: 'Shakuhachi';  iVoice: 77),
       (szInst: 'Whistle';     iVoice: 78),
       (szInst: 'Ocarina';     iVoice: 79))),
    (szFam: 'Synth Lead';
     inst:
      ((szInst: 'Lead 1 (square)';       iVoice: 80),
       (szInst: 'Lead 2 (sawtooth)';     iVoice: 81),
       (szInst: 'Lead 3 (caliope lead)'; iVoice: 82),
       (szInst: 'Lead 4 (chiff lead)';   iVoice: 83),
       (szInst: 'Lead 5 (charang)';      iVoice: 84),
       (szInst: 'Lead 6 (voice)';        iVoice: 85),
       (szInst: 'Lead 7 (fifths)';       iVoice: 86),
       (szInst: 'Lead 8 (brass + lead)'; iVoice: 87))),
    (szFam: 'Synth Pad';
     inst:
      ((szInst: 'Pad 1 (new age)';   iVoice: 88),
       (szInst: 'Pad 2 (warm)';      iVoice: 89),
       (szInst: 'Pad 3 (polysynth)'; iVoice: 90),
       (szInst: 'Pad 4 (choir)';     iVoice: 91),
       (szInst: 'Pad 5 (bowed)';     iVoice: 92),
       (szInst: 'Pad 6 (metallic)';  iVoice: 93),
       (szInst: 'Pad 7 (halo)';      iVoice: 94),
       (szInst: 'Pad 8 (sweep)';     iVoice: 95))),
    (szFam: 'Synth Effects';
     inst:
      ((szInst: 'FX 1 (rain)';       iVoice: 96),
       (szInst: 'FX 2 (soundtrack)'; iVoice: 97),
       (szInst: 'FX 3 (crystal)';    iVoice: 98),
       (szInst: 'FX 4 (atmosphere)'; iVoice: 99),
       (szInst: 'FX 5 (brightness)'; iVoice: 100),
       (szInst: 'FX 6 (goblins)';    iVoice: 101),
       (szInst: 'FX 7 (echoes)';     iVoice: 102),
       (szInst: 'FX 8 (sci-fi)';     iVoice: 103))),
    (szFam: 'Ethnic';
     inst:
      ((szInst: 'Sitar';    iVoice: 104),
       (szInst: 'Banjo';    iVoice: 105),
       (szInst: 'Shamisen'; iVoice: 106),
       (szInst: 'Koto';     iVoice: 107),
       (szInst: 'Kalimba';  iVoice: 108),
       (szInst: 'Bagpipe';  iVoice: 109),
       (szInst: 'Fiddle';   iVoice: 110),
       (szInst: 'Shanai';   iVoice: 111))),
    (szFam: 'Percussive';
     inst:
      ((szInst: 'Tinkle Bell';    iVoice: 112),
       (szInst: 'Agogo';          iVoice: 113),
       (szInst: 'Steel Drums';    iVoice: 114),
       (szInst: 'Woodblock';      iVoice: 115),
       (szInst: 'Taiko Drum';     iVoice: 116),
       (szInst: 'Melodic Tom';    iVoice: 117),
       (szInst: 'Synth Drum';     iVoice: 118),
       (szInst: 'Reverse Cymbal'; iVoice: 119))),
    (szFam: 'Sound Effects';
     inst:
      ((szInst: 'Guitar Fret Noise'; iVoice: 120),
       (szInst: 'Breath Noise';      iVoice: 121),
       (szInst: 'Seashore';          iVoice: 122),
       (szInst: 'Bird Tweet';        iVoice: 123),
       (szInst: 'Telephone Ring';    iVoice: 124),
       (szInst: 'Helicopter';        iVoice: 125),
       (szInst: 'Applause';          iVoice: 126),
       (szInst: 'Gunshot';           iVoice: 127)))
                                );

  NUMSCANS = 54;
  key: array[0..NUMSCANS - 1] of Tkey =   (
    (iOctave: -1; iNote: -1; yPos: 1;  xPos: -1; szKey: nil),  // 0   None
    (iOctave: -1; iNote: -1; yPos: -1; xPos: -1; szKey: nil),  // 1   Esc
    (iOctave: -1; iNote: -1; yPos: 0;  xPos: 0;  szKey: ''),   // 2   1
    (iOctave: 5;  iNote: 1;  yPos: 0;  xPos: 2;  szKey: 'C#'), // 3   2  5  C#
    (iOctave: 5;  iNote: 3;  yPos: 0;  xPos: 4;  szKey: 'D#'), // 4   3  5  D#
    (iOctave: -1; iNote: -1; yPos: 0;  xPos: 6;  szKey: ''),   // 5   4
    (iOctave: 5;  iNote: 6;  yPos: 0;  xPos: 8;  szKey: 'F#'), // 6   5  5  F#
    (iOctave: 5;  iNote: 8;  yPos: 0;  xPos: 10; szKey: 'G#'), // 7   6  5  G#
    (iOctave: 5;  iNote: 10; yPos: 0;  xPos: 12; szKey: 'A#'), // 8   7  5  A#
    (iOctave: -1; iNote: -1; yPos: 0;  xPos: 14; szKey: ''),   // 9   8
    (iOctave: 6;  iNote: 1;  yPos: 0;  xPos: 16; szKey: 'C#'), // 10  9  6  C#
    (iOctave: 6;  iNote: 3;  yPos: 0;  xPos: 18; szKey: 'D#'), // 11  0  6  D#
    (iOctave: -1; iNote: -1; yPos: 0;  xPos: 20; szKey: ''),   // 12  -
    (iOctave: 6;  iNote: 6;  yPos: 0;  xPos: 22; szKey: 'F#'), // 13  =  6  F#
    (iOctave: -1; iNote: -1; yPos: -1; xPos: -1; szKey: nil),  // 14  Back
    (iOctave: -1; iNote: -1; yPos: -1; xPos: -1; szKey: nil),  // 15  Tab
    (iOctave: 5;  iNote: 0;  yPos: 1;  xPos: 1;  szKey: 'C'),  // 16  q  5  C
    (iOctave: 5;  iNote: 2;  yPos: 1;  xPos: 3;  szKey: 'D'),  // 17  w  5  D
    (iOctave: 5;  iNote: 4;  yPos: 1;  xPos: 5;  szKey: 'E'),  // 18  e  5  E
    (iOctave: 5;  iNote: 5;  yPos: 1;  xPos: 7;  szKey: 'F'),  // 19  r  5  F
    (iOctave: 5;  iNote: 7;  yPos: 1;  xPos: 9;  szKey: 'G'),  // 20  t  5  G
    (iOctave: 5;  iNote: 9;  yPos: 1;  xPos: 11; szKey: 'A'),  // 21  y  5  A
    (iOctave: 5;  iNote: 11; yPos: 1;  xPos: 13; szKey: 'B'),  // 22  u  5  B
    (iOctave: 6;  iNote: 0;  yPos: 1;  xPos: 15; szKey: 'C'),  // 23  i  6  C
    (iOctave: 6;  iNote: 2;  yPos: 1;  xPos: 17; szKey: 'D'),  // 24  o  6  D
    (iOctave: 6;  iNote: 4;  yPos: 1;  xPos: 19; szKey: 'E'),  // 25  p  6  E
    (iOctave: 6;  iNote: 5;  yPos: 1;  xPos: 21; szKey: 'F'),  // 26  [  6  F
    (iOctave: 6;  iNote: 7;  yPos: 1;  xPos: 23; szKey: 'G'),  // 27  ]  6  G
    (iOctave: -1; iNote: -1; yPos: -1; xPos: -1; szKey: nil),  // 28  Ent
    (iOctave: -1; iNote: -1; yPos: -1; xPos: -1; szKey: nil),  // 29  Ctrl
    (iOctave: 3;  iNote: 8;  yPos: 2;  xPos: 2;  szKey: 'G#'), // 30  a  3  G#
    (iOctave: 3;  iNote: 10; yPos: 2;  xPos: 4;  szKey: 'A#'), // 31  s  3  A#
    (iOctave: -1; iNote: -1; yPos: 2;  xPos: 6;  szKey: ''),   // 32  d
    (iOctave: 4;  iNote: 1;  yPos: 2;  xPos: 8;  szKey: 'C#'), // 33  f  4  C#
    (iOctave: 4;  iNote: 3;  yPos: 2;  xPos: 10; szKey: 'D#'), // 34  g  4  D#
    (iOctave: -1; iNote: -1; yPos: 2;  xPos: 12; szKey: ''),   // 35  h
    (iOctave: 4;  iNote: 6;  yPos: 2;  xPos: 14; szKey: 'F#'), // 36  j  4  F#
    (iOctave: 4;  iNote: 8;  yPos: 2;  xPos: 16; szKey: 'G#'), // 37  k  4  G#
    (iOctave: 4;  iNote: 10; yPos: 2;  xPos: 18; szKey: 'A#'), // 38  l  4  A#
    (iOctave: -1; iNote: -1; yPos: 2;  xPos: 20; szKey: ''),   // 39  ;
    (iOctave: 5;  iNote: 1;  yPos: 2;  xPos: 22; szKey: 'C#'), // 40  '  5  C#
    (iOctave: -1; iNote: -1; yPos: -1; xPos: -1; szKey: nil),  // 41  `
    (iOctave: -1; iNote: -1; yPos: -1; xPos: -1; szKey: nil),  // 42  Shift
    (iOctave: -1; iNote: -1; yPos: -1; xPos: -1; szKey: nil),  // 43  \   (not line continuation)
    (iOctave: 3;  iNote: 9;  yPos: 3;  xPos: 3;  szKey: 'A'),  // 44  z  3  A
    (iOctave: 3;  iNote: 11; yPos: 3;  xPos: 5;  szKey: 'B'),  // 45  x  3  B
    (iOctave: 4;  iNote: 0;  yPos: 3;  xPos: 7;  szKey: 'C'),  // 46  c  4  C
    (iOctave: 4;  iNote: 2;  yPos: 3;  xPos: 9;  szKey: 'D'),  // 47  v  4  D
    (iOctave: 4;  iNote: 4;  yPos: 3;  xPos: 11; szKey: 'E'),  // 48  b  4  E
    (iOctave: 4;  iNote: 5;  yPos: 3;  xPos: 13; szKey: 'F'),  // 49  n  4  F
    (iOctave: 4;  iNote: 7;  yPos: 3;  xPos: 15; szKey: 'G'),  // 50  m  4  G
    (iOctave: 4;  iNote: 9;  yPos: 3;  xPos: 17; szKey: 'A'),  // 51  ,  4  A
    (iOctave: 4;  iNote: 11; yPos: 3;  xPos: 19; szKey: 'B'),  // 52  .  4  B
    (iOctave: 5;  iNote: 0;  yPos: 3;  xPos: 21; szKey: 'C')   // 53  /  5  C
                                          );
                                          
var
  hMidiOut: Integer; // HMIDIOUT
  iDevice: Integer = Integer(MIDIMAPPER);
  iChannel: Integer = 0;
  iVoice: Integer = 0;
  iVelocity: Integer = 64;
  cxCaps, cyChar, xOffset, yOffset: Integer;

  // 建立菜单
function CreateTheMenu(iNumDevs: Integer): HMENU;
var
  szBuffer:array[0..32] of Char;
  hMenuPopup, hMenuSubPopup: HMENU;
  i, iFam, iIns: Integer;
  moc: TMidiOutCaps;
  List: array[0..1] of DWORD;
begin
  Result := CreateMenu();

 // Create "On/Off" popup menu
  hMenuPopup := CreateMenu();
  AppendMenu(hMenuPopup, MF_STRING, IDM_OPEN, '&Open');
  AppendMenu(hMenuPopup, MF_STRING or MF_CHECKED, IDM_CLOSE, '&Closed');
  AppendMenu(Result, MF_STRING or MF_POPUP, hMenuPopup, '&Status');

 // Create "Device" popup menu
  hMenuPopup := CreateMenu();
 // Put MIDI Mapper on menu if it's installed
  if (midiOutGetDevCaps(MIDIMAPPER, @moc, SizeOf(moc)) = MMSYSERR_NOERROR) then
    AppendMenu(hMenuPopup, MF_STRING, IDM_DEVICE + MIDIMAPPER, @moc.szPname[0])
  else
    iDevice := 0;
 // Add the rest of the MIDI devices
  for i := 0 to iNumDevs - 1 do
  begin
    midiOutGetDevCaps(i, @moc, SizeOf(moc));
    AppendMenu(hMenuPopup, MF_STRING, IDM_DEVICE + DWORD(i), @moc.szPname[0]);
  end;
  CheckMenuItem(hMenuPopup, 0, MF_BYPOSITION or MF_CHECKED);
  AppendMenu(Result, MF_STRING or MF_POPUP, hMenuPopup, '&Device');

 // Create "Channel" popup menu
  hMenuPopup := CreateMenu();
  for i := 1 to 16 do
  begin
    wvsprintf(szBuffer, '%d', @i);
    if (i = 1) then
      AppendMenu(hMenuPopup, MF_STRING or MF_CHECKED, IDM_CHANNEL + DWORD(i) - 1, szBuffer)
    else
      AppendMenu(hMenuPopup, MF_STRING or MF_UNCHECKED, IDM_CHANNEL + DWORD(i) - 1, szBuffer);
  end;
  AppendMenu(Result, MF_STRING or MF_POPUP, hMenuPopup, '&Channel');

 // Create "Voice" popup menu
  hMenuPopup := CreateMenu();
  for iFam := 0 to 15 do
  begin
    hMenuSubPopup := CreateMenu();
    for iIns := 0 to 7 do
    begin
      List[0] := iIns + 1;
      List[1] := DWORD(fam[iFam].inst[iIns].szInst);
      wvsprintf(szBuffer, '&%d.'#9'%s', @List[0]);

      if (fam[iFam].inst[iIns].iVoice = 0) then
        AppendMenu(hMenuSubPopup, MF_STRING or MF_CHECKED,
          DWORD(fam[iFam].inst[iIns].iVoice) + IDM_VOICE, szBuffer)
      else
        AppendMenu(hMenuSubPopup, MF_STRING or MF_UNCHECKED,
          DWORD(fam[iFam].inst[iIns].iVoice) + IDM_VOICE, szBuffer);
    end;
    List[0] := Byte('A') + iFam;
    List[1] := DWORD(fam[iFam].szFam);
    wvsprintf(szBuffer, '&%c.'#9'%s', @List[0]);
    AppendMenu(hMenuPopup, MF_STRING or MF_POPUP, hMenuSubPopup, szBuffer);
  end;
  AppendMenu(Result, MF_STRING or MF_POPUP, hMenuPopup, '&Voice');
end;

  // 发送消息
function MidiOutMessage(hMidi: Integer; iStatus, iChannel, iData1, iData2: Integer): DWORD;
var
  dwMessage: DWORD;
begin
  dwMessage := iStatus or iChannel or (iData1 shl 8) or (iData2 shl 16);
  Result := midiOutShortMsg(hMidi, dwMessage);
end;      

  // Note Off
function MidiNoteOff(hMidi: Integer; iChannel, iOct, iNote, iVel: Integer): DWORD;
begin
  Result := MidiOutMessage(hMidi, $080, iChannel, 12 * iOct + iNote, iVel);
end;

  // Note On
function MidiNoteOn(hMidi: Integer; iChannel, iOct, iNote, iVel: Integer): DWORD;
begin
  Result := MidiOutMessage(hMidi, $090, iChannel, 12 * iOct + iNote, iVel);
end;

  // Program Change
function MidiSetPatch(hMidi: Integer; iChannel, iVoice: Integer): DWORD;
begin
  Result := MidiOutMessage(hMidi, $0C0, iChannel, iVoice, 0);
end;

  // Pitch Wheel Change
function MidiPitchBend(hMidi: Integer; iChannel, iBend: Integer): DWORD;
begin
  Result := MidiOutMessage(hMidi, $0E0, iChannel, iBend and $7F, iBend shr 7);
end;

  // Draw a single key on window
procedure DrawKey(hWndDc: HDC; iScanCode: Integer; fInvert: Boolean);
var
  Rect: TRect;
begin
  Rect.Left := 3 * cxCaps * key[iScanCode].xPos div 2 + xOffset;
  Rect.Top := 3 * cyChar * key[iScanCode].yPos div 2 + yOffset;
  Rect.Right := Rect.Left + 3 * cxCaps;
  Rect.Bottom := Rect.Top  + 3 * cyChar div 2;

  if fInvert then
  begin
    SetTextColor(hWndDc, $FFFFFF);
    SetBkColor(hWndDc, $00000000);
    FillRect(hWndDc, Rect, GetStockObject(BLACK_BRUSH));
  end else
  begin
    SetTextColor(hWndDc, 0);
    SetBkColor(hWndDc, $00FFFFFF);
    FillRect(hWndDc, Rect, GetStockObject(WHITE_BRUSH));
  end;
  DrawText(hWndDc, key[iScanCode].szKey, -1, Rect, DT_SINGLELINE or DT_CENTER or DT_VCENTER);
  FrameRect(hWndDc, Rect, GetStockObject(BLACK_BRUSH));
end;

  // Process a Key Up or Key Down message
procedure ProcessKey(hWndDc: HDC; Msg: UINT; lParam: LPARAM);
var
  iScanCode, iOctave, iNote: Integer;
begin
  iScanCode := $FF and HIWORD(lParam);
  if (iScanCode >= NUMSCANS) then Exit; // No scan codes over 53

  iOctave := key[iScanCode].iOctave;
  if (iOctave = -1) then Exit; // Non-music key

  if (GetKeyState(VK_SHIFT) < 0) then
    if ((lParam and $20000000) <> 0) then
      Inc(iOctave, 2) else Inc(iOctave, 1);

  if (GetKeyState(VK_CONTROL) < 0) then
    if ((lParam and $20000000) <> 0) then
      Dec(iOctave, 2) else Dec(iOctave, 1);

  iNote := key[iScanCode].iNote;

  if (Msg = WM_KEYUP) then // For key up
  begin
     MidiNoteOff(hMidiOut, iChannel, iOctave, iNote, 0); // Note off
     DrawKey(hWndDc, iScanCode, FALSE);
     Exit;
  end;

  if ((lParam and $40000000) <> 0) then Exit; // ignore typematics

  MidiNoteOn(hMidiOut, iChannel, iOctave, iNote, iVelocity); // Note on
  DrawKey(hWndDc, iScanCode, TRUE); // Draw the inverted key
end;

  // 窗体回调过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  bOpened: Boolean = FALSE;
{$J-}
var
  hWndDc: HDC;
  hMenu: DWORD; // HMENU
  i, iNumDevs, iPitchBend, cxClient, cyClient: Integer;
  moc: TMidiOutCaps;
  ps: TPaintStruct;
  Size: TSize;
  szBuffer: array[0..16] of Char;
begin
  Result := 0;
  
  case (Msg) of
    WM_CREATE:
      begin
       // Get size of capital letters in system font
        hWndDc := GetDC(hWnd);
        GetTextExtentPoint(hWndDc, 'M', 1, Size);
        cxCaps := Size.cx;
        cyChar := Size.cy;
        ReleaseDC(hWnd, hWndDc);

       // Initialize "Volume" scroll bar
        SetScrollRange(hWnd, SB_HORZ, 1, 127, FALSE);
        SetScrollPos(hWnd, SB_HORZ, iVelocity, TRUE);

       // Initialize "Pitch Bend" scroll bar
        SetScrollRange(hWnd, SB_VERT, 0, 16383, FALSE);
        SetScrollPos(hWnd, SB_VERT, 8192, TRUE);

       // Get number of MIDI output devices and set up menu
        iNumDevs := midiOutGetNumDevs();
        if (iNumDevs = 0) then
        begin
          MessageBeep(MB_ICONSTOP);
          MessageBox(hWnd, 'No MIDI output devices!', szAppName, MB_OK or MB_ICONSTOP);
          Result := -1;
        end else
          SetMenu(hWnd, CreateTheMenu(iNumDevs));
      end;

    WM_SIZE:
      begin
        cxClient := LOWORD(lParam);
        cyClient := HIWORD(lParam);
        xOffset := (cxClient - 25 * 3 * cxCaps div 2) div 2;
        yOffset := (cyClient - 11 * cyChar) div 2 + 5 * cyChar;
      end;

    WM_COMMAND:
      begin
        hMenu := GetMenu(hWnd);
        if (LOWORD(wParam) = IDM_OPEN) and (bOpened = FALSE) then // "Open" menu command
        begin
          if (midiOutOpen(@hMidiOut, iDevice, 0, 0, 0) <> MMSYSERR_NOERROR) then
          begin
            MessageBeep(MB_ICONEXCLAMATION);
            MessageBox(hWnd,
              'Cannot open MIDI device', szAppName, MB_OK or MB_ICONEXCLAMATION);
          end else
          begin
            CheckMenuItem(hMenu, IDM_OPEN,  MF_CHECKED);
            CheckMenuItem(hMenu, IDM_CLOSE, MF_UNCHECKED);
            MidiSetPatch(hMidiOut, iChannel, iVoice);
            bOpened := TRUE;
          end;
        end else
          if (LOWORD(wParam) = IDM_CLOSE) and (bOpened = TRUE) then // "Close" menu command
          begin
            CheckMenuItem(hMenu, IDM_OPEN,  MF_UNCHECKED);
            CheckMenuItem(hMenu, IDM_CLOSE, MF_CHECKED);
           // Turn all keys off and close device
            for i := 0 to 15 do MidiOutMessage(hMidiOut, $B0, i, 123, 0);
            midiOutClose(hMidiOut);
            bOpened := FALSE;
          end
          else
            if (LOWORD(wParam) >= IDM_DEVICE - 1) and // **
               (LOWORD(wParam) < IDM_CHANNEL) then // Change MIDI "Device" menu command
            begin
              CheckMenuItem(hMenu, IDM_DEVICE + DWORD(iDevice), MF_UNCHECKED);
              iDevice := LOWORD(wParam) - IDM_DEVICE;
              CheckMenuItem(hMenu, IDM_DEVICE + DWORD(iDevice), MF_CHECKED);
              if (bOpened) then // Close and reopen MIDI device (重新打开)
              begin
                SendMessage(hWnd, WM_COMMAND, IDM_CLOSE, 0);
                SendMessage(hWnd, WM_COMMAND, IDM_OPEN, 0);
              end;
            end else
              if (LOWORD(wParam) >= IDM_CHANNEL) and
                (LOWORD(wParam) < IDM_VOICE) then // Change MIDI "Channel" menu command
              begin
                CheckMenuItem(hMenu, IDM_CHANNEL + DWORD(iChannel), MF_UNCHECKED);
                iChannel := LOWORD(wParam) - IDM_CHANNEL;
                CheckMenuItem(hMenu, IDM_CHANNEL + DWORD(iChannel), MF_CHECKED);
                if (bOpened) then MidiSetPatch(hMidiOut, iChannel, iVoice);
              end
              else
                if (LOWORD(wParam) >= IDM_VOICE) then // Change MIDI "Voice" menu command
                begin
                  CheckMenuItem(hMenu, IDM_VOICE + DWORD(iVoice), MF_UNCHECKED);
                  iVoice := LOWORD(wParam) - IDM_VOICE;
                  CheckMenuItem(hMenu, IDM_VOICE + DWORD(iVoice), MF_CHECKED);
                  if (bOpened) then MidiSetPatch(hMidiOut, iChannel, iVoice);
                end;
        InvalidateRect(hWnd, nil, TRUE);
      end;

    WM_KEYUP,
    WM_KEYDOWN:
      begin
        hWndDc := GetDC(hWnd);
        if (bOpened) then ProcessKey(hWndDc, Msg, lParam);
        ReleaseDC(hWnd, hWndDc);
      end;

    WM_CHAR:
      begin
        if (bOpened) and (wParam = 27) then
        begin
          for i := 0 to 5 do MidiOutMessage(hMidiOut, $B0, i, 123, 0);
          InvalidateRect(hWnd, nil, TRUE);
        end;
      end;

    WM_HSCROLL:
      begin
        case LOWORD(wParam) of
          SB_LINEUP:
            Dec(iVelocity, 1);
          SB_LINEDOWN:
            Inc(iVelocity, 1);
          SB_PAGEUP:
            Dec(iVelocity, 8);
          SB_PAGEDOWN:
            Inc(iVelocity, 8);
          SB_THUMBPOSITION:
            iVelocity := HIWORD(wParam);
          else Exit;
        end;
        iVelocity := Max(1, Min(iVelocity, 127));
        SetScrollPos(hWnd, SB_HORZ, iVelocity, TRUE);
      end;

    WM_VSCROLL:
      begin
        case LOWORD(wParam) of
          SB_THUMBTRACK: iPitchBend := 16383 - HIWORD(wParam);
          SB_THUMBPOSITION: iPitchBend := 8191;
          else Exit;
        end;
        iPitchBend := Max(0, Min(iPitchBend, 16383));
        SetScrollPos(hWnd, SB_VERT, 16383 - iPitchBend, TRUE);
        if (bOpened) then MidiPitchBend(hMidiOut, iChannel, iPitchBend);
      end;

    WM_PAINT:
      begin
        hWndDc := BeginPaint(hWnd, ps);

        for i := 0 to NUMSCANS - 1 do
          if (key[i].xPos <> -1) then DrawKey(hWndDc, i, FALSE);

        midiOutGetDevCaps(iDevice, @moc, SizeOf(TMidiOutCaps));

        Inc(iChannel);
        wvsprintf(szBuffer, 'Channel %i', @iChannel);
        Dec(iChannel);
           
        if bOpened then
          TextOut(hWndDc, cxCaps, 1 * cyChar, 'Open', 4)
        else
          TextOut(hWndDc, cxCaps, 1 * cyChar, 'Closed', 6);

        TextOut(hWndDc, cxCaps, 2 * cyChar, moc.szPname, lstrlen(moc.szPname));
        TextOut(hWndDc, cxCaps, 3 * cyChar, szBuffer, lstrlen(szBuffer));
        TextOut(hWndDc, cxCaps, 4 * cyChar, fam[iVoice div 8].inst[iVoice mod 8].szInst,
          lstrlen(fam[iVoice div 8].inst[iVoice mod 8].szInst));

        EndPaint(hWnd, ps);
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0);
        SendMessage(hWnd, WM_COMMAND, IDM_CLOSE, 0);
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

  hWnd := CreateWindow(szAppName, 'Keyboard MIDI Player',
                    WS_OVERLAPPEDWINDOW,
                    Integer(CW_USEDEFAULT), Integer(CW_USEDEFAULT),
                    Integer(CW_USEDEFAULT), Integer(CW_USEDEFAULT),
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
