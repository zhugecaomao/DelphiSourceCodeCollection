program  SineWave;

{$R SineWave.Res}

uses
  Windows, Messages, MMSystem, Math;       

const
  szAppName = 'SineWave';
  SAMPLE_RATE = 11025;
  FREQ_MIN  = 20;
  FREQ_MAX  = 5000;
  FREQ_INIT = 440;
  OUT_BUFFER_SIZE = 4096;
  PI = 3.14159;
  IDC_STATIC =  -1;
  IDC_SCROLL = 1000;
  IDC_TEXT   = 1001;
  IDC_ONOFF  = 1002;   

  // 填充Byte数组
procedure FillBuffer(pBuffer: PByte; iFreq: Integer);
const
{$J+}
  fAngle: Double = 0.0;
{$J-}
var
  i: Integer;
begin
  for i := 0 to OUT_BUFFER_SIZE - 1 do
  begin
    PByte(Integer(pBuffer) + i)^ := Trunc(127 + 127 * Sin(fAngle));
    fAngle := fAngle + 2 * PI * iFreq / SAMPLE_RATE;
    if (fAngle > 2 * PI) then fAngle := fAngle - 2 * PI; 
  end;
end;

  // 对话框回调
function DlgProc(hDlg: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
const
{$J+}
  bShutOff: Boolean = FALSE;
  bClosing: Boolean = FALSE;
  hWaveOut: Integer = 0; // HWAVEOUT
  hWndScroll: HWND = 0;
  iFreq: Integer = FREQ_INIT;
  pBuffer1: PByte = nil;
  pBuffer2: PByte = nil;
  pWaveHdr1: PWaveHdr = nil;
  pWaveHdr2: PWaveHdr = nil;
  WaveFormat: TWaveFormatEx = ();
{$J-}
var
  iDummy: Integer;
begin
  Result := TRUE;
  case (Msg) of
    WM_INITDIALOG:
      begin
        hWndScroll := GetDlgItem(hDlg, IDC_SCROLL);
        SetScrollRange(hWndScroll, SB_CTL, FREQ_MIN, FREQ_MAX, FALSE);
        SetScrollPos(hWndScroll, SB_CTL, FREQ_INIT, TRUE);
        SetDlgItemInt(hDlg, IDC_TEXT, FREQ_INIT, FALSE);
      end;

    WM_HSCROLL:
      begin
        case LOWORD(wParam) of
          SB_LINELEFT:
            Dec(iFreq);
          SB_LINERIGHT:
            Inc(iFreq);
          SB_PAGELEFT:
            iFreq := iFreq div 2;
          SB_PAGERIGHT:
            iFreq := iFreq * 2;
          SB_THUMBTRACK:
            iFreq := HIWORD(wParam);
          SB_TOP:
            GetScrollRange(hWndScroll, SB_CTL, iFreq, iDummy);
          SB_BOTTOM:
            GetScrollRange(hWndScroll, SB_CTL, iDummy, iFreq);
        end;
        iFreq := Max(FREQ_MIN, Min(FREQ_MAX, iFreq));
        SetScrollPos(hWndScroll, SB_CTL, iFreq, TRUE);
        SetDlgItemInt(hDlg, IDC_TEXT, iFreq, FALSE);
      end;

    WM_COMMAND:
      begin
        case LOWORD(wParam) of
          IDC_ONOFF:
            if (hWaveOut = 0) then // If turning on waveform, hWaveOut is NULL
            begin
             // Allocate memory for 2 headers and 2 buffers
              GetMem(pWaveHdr1, SizeOf(TWaveHdr));
              GetMem(pWaveHdr2, SizeOf(TWaveHdr));
              GetMem(pBuffer1, OUT_BUFFER_SIZE);
              GetMem(pBuffer2, OUT_BUFFER_SIZE);
              if (pWaveHdr1 = nil) or (pWaveHdr2 = nil) or
                 (pBuffer1 = nil) or (pBuffer2 = nil) then
              begin
                if (pWaveHdr1 <> nil) then FreeMem(pWaveHdr1);
                if (pWaveHdr2 <> nil) then FreeMem(pWaveHdr2);
                if (pBuffer1 <> nil) then FreeMem(pBuffer1);
                if (pBuffer2 <> nil) then FreeMem(pBuffer2);
                MessageBeep(MB_ICONEXCLAMATION);
                MessageBox(hDlg,
                  'Error allocating memory!', szAppName, MB_ICONEXCLAMATION or MB_OK);
                Exit;
              end;

             // Variable to indicate Off button pressed
              bShutOff := FALSE;
              
             // Open waveform audio for output
              WaveFormat.wFormatTag := WAVE_FORMAT_PCM;
              WaveFormat.nChannels := 1;
              WaveFormat.nSamplesPerSec := SAMPLE_RATE;
              WaveFormat.nAvgBytesPerSec := SAMPLE_RATE;
              WaveFormat.nBlockAlign := 1;
              WaveFormat.wBitsPerSample := 8;
              WaveFormat.cbSize := 0;
              if (waveOutOpen(@hWaveOut, WAVE_MAPPER, @WaveFormat,
                hDlg, 0, CALLBACK_WINDOW) <> MMSYSERR_NOERROR) then
              begin
                FreeMem(pWaveHdr1);
                FreeMem(pWaveHdr2);
                FreeMem(pBuffer1);
                FreeMem(pBuffer2);
                hWaveOut := 0;
                MessageBeep(MB_ICONEXCLAMATION);
                MessageBox(hDlg, 'Error opening waveform audio device!',
                  szAppName, MB_ICONEXCLAMATION or MB_OK);
                Exit;
              end;
              
             // Set up headers and prepare them
              pWaveHdr1.lpData := PChar(pBuffer1);
              pWaveHdr1.dwBufferLength := OUT_BUFFER_SIZE;
              pWaveHdr1.dwBytesRecorded := 0;
              pWaveHdr1.dwUser := 0;
              pWaveHdr1.dwFlags := 0;
              pWaveHdr1.dwLoops := 1;
              pWaveHdr1.lpNext := nil;
              pWaveHdr1.reserved := 0;
              waveOutPrepareHeader(hWaveOut, pWaveHdr1, SizeOf(TWaveHdr));                  
              pWaveHdr2.lpData := PChar(pBuffer2);
              pWaveHdr2.dwBufferLength := OUT_BUFFER_SIZE;
              pWaveHdr2.dwBytesRecorded := 0;
              pWaveHdr2.dwUser := 0;
              pWaveHdr2.dwFlags := 0;
              pWaveHdr2.dwLoops := 1;
              pWaveHdr2.lpNext := nil;
              pWaveHdr2.reserved := 0;
              waveOutPrepareHeader(hWaveOut, pWaveHdr2, SizeOf(TWaveHdr));
            end else // If turning off waveform, reset waveform audio
            begin
              bShutOff := TRUE;
              waveOutReset(hWaveOut);
            end;

          else Result := FALSE; // else: case LOWORD(wParam) of
        end;
      end;

    MM_WOM_OPEN:
      begin
        SetDlgItemText(hDlg, IDC_ONOFF, 'Turn Off');

       // Send two buffers to waveform output device..
        FillBuffer(pBuffer1, iFreq);
        waveOutWrite(hWaveOut, pWaveHdr1, SizeOf(TWaveHdr));
        
        FillBuffer(pBuffer2, iFreq);
        waveOutWrite(hWaveOut, pWaveHdr2, SizeOf(TWaveHdr));
      end;

    MM_WOM_DONE:
      begin
        if (bShutOff) then
        begin
          waveOutClose(hWaveOut);
          Exit;
        end;
        
       // Fill and send out a new buffer
        FillBuffer(PByte(PWaveHdr(lParam).lpData), iFreq);
        waveOutWrite(hWaveOut, PWaveHdr(lParam), SizeOf(TWaveHdr));
      end;

    MM_WOM_CLOSE:
      begin
        waveOutUnprepareHeader(hWaveOut, pWaveHdr1, SizeOf(TWaveHdr));
        waveOutUnprepareHeader(hWaveOut, pWaveHdr2, SizeOf(TWaveHdr));
        FreeMem(pWaveHdr1);
        FreeMem(pWaveHdr2);
        FreeMem(pBuffer1);
        FreeMem(pBuffer2);
        hWaveOut := 0;
        SetDlgItemText(hDlg, IDC_ONOFF, 'Turn On');
        if (bClosing) then EndDialog(hDlg, 0);
      end;

    WM_SYSCOMMAND:
      begin
        if (LOWORD(wParam) = SC_CLOSE) then
        begin
          if (hWaveOut <> 0) then
          begin
            bShutOff := TRUE;
            bClosing := TRUE;
            waveOutReset(hWaveOut);
          end else
            EndDialog(hDlg, 0);
        end else
          Result := FALSE;
      end;

    else
      Result := FALSE;
  end;
end;

begin
  if (DialogBox(hInstance, szAppName, 0, @DlgProc) = -1) then
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
end.

