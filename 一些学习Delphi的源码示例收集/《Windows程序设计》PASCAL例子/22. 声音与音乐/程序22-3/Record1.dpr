program  Record1;

{$R Record1.Res}

uses
  Windows, Messages, MMSystem;       

const
  szAppName = 'Record1';
  INP_BUFFER_SIZE = 16384;
  IDC_RECORD_BEG = 1000;
  IDC_RECORD_END = 1001;
  IDC_PLAY_BEG   = 1002;
  IDC_PLAY_PAUSE = 1003;
  IDC_PLAY_END   = 1004;
  IDC_PLAY_REV   = 1005;
  IDC_PLAY_REP   = 1006;
  IDC_PLAY_SPEED = 1007; 

  // 数组首尾调换
procedure ReverseMemory(pBuffer: PByte; iLength: Integer);
var
  b: Byte;
  i: Integer;
begin
  for i := 0 to iLength div 2 -1 do
  begin
    b := PByte(Integer(pBuffer) + i)^;
    PByte(Integer(pBuffer) + i)^ := PByte(Integer(pBuffer) + iLength - i - 1)^;
    PByte(Integer(pBuffer) + iLength - i - 1)^ := b;
  end;
end;

  // 对话框回调函数
function DlgProc(hDlg: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
const
{$J+}
  bRecording: Boolean = FALSE;
  bPlaying: Boolean = FALSE;
  bReverse: Boolean = FALSE;
  bPaused: Boolean = FALSE;
  bEnding: Boolean = FALSE;
  bTerminating: Boolean = FALSE;
  dwDataLength: DWORD = 0;
  dwRepetitions: DWORD = 1;
  hWaveIn: Integer = 0; // HWAVEIN
  hWaveOut: Integer = 0; // HWAVEOUT
  pBuffer1: PByte = nil;
  pBuffer2: PByte = nil;
  pSaveBuffer: PByte = nil;
  pWaveHdr1: PWaveHdr = nil;
  pWaveHdr2: PWaveHdr = nil;
  waveform: TWaveFormatEx = ();
{$J-}
  szOpenError = 'Error opening waveform audio!';
  szMemError  = 'Error allocating memory!';
begin
  Result := TRUE;
  case (Msg) of
    WM_INITDIALOG:
      begin
       // Allocate memory for wave header
        GetMem(pWaveHdr1, SizeOf(TWaveHdr));
        GetMem(pWaveHdr2, SizeOf(TWaveHdr));
       // Allocate memory for save buffer
        GetMem(pSaveBuffer, 1);
      end;

    WM_COMMAND:
      begin
        case LOWORD(wParam) of
          IDC_RECORD_BEG:
            begin
             // Allocate buffer memory
              GetMem(pBuffer1, INP_BUFFER_SIZE);
              GetMem(pBuffer2, INP_BUFFER_SIZE);
              if (pBuffer1 = nil) or (pBuffer2 = nil) then
              begin
                if (pBuffer1 <> nil) then FreeMem(pBuffer1);
                if (pBuffer2 <> nil) then FreeMem(pBuffer2);
                MessageBeep(MB_ICONEXCLAMATION);
                MessageBox(hDlg, szMemError, szAppName, MB_ICONEXCLAMATION or MB_OK);
                Exit;
              end; 

             // Open waveform audio for input
              waveform.wFormatTag := WAVE_FORMAT_PCM;
              waveform.nChannels := 1;
              waveform.nSamplesPerSec := 11025;
              waveform.nAvgBytesPerSec := 11025;
              waveform.nBlockAlign := 1;
              waveform.wBitsPerSample := 8;
              waveform.cbSize := 0;
              if (waveInOpen(@hWaveIn, WAVE_MAPPER, @waveform, hDlg,
                0, CALLBACK_WINDOW) <> MMSYSERR_NOERROR) then
              begin
                FreeMem(pBuffer1);
                FreeMem(pBuffer2);
                MessageBeep(MB_ICONEXCLAMATION);
                MessageBox(hDlg, szOpenError, szAppName, MB_ICONEXCLAMATION or MB_OK);
              end;

             // Set up headers and prepare them
              pWaveHdr1.lpData := PChar(pBuffer1);
              pWaveHdr1.dwBufferLength := INP_BUFFER_SIZE;
              pWaveHdr1.dwBytesRecorded := 0;
              pWaveHdr1.dwUser := 0;
              pWaveHdr1.dwFlags := 0;
              pWaveHdr1.dwLoops := 1;
              pWaveHdr1.lpNext := nil;
              pWaveHdr1.reserved := 0;
              waveInPrepareHeader(hWaveIn, pWaveHdr1, SizeOf(TWaveHdr));
              pWaveHdr2.lpData := PChar(pBuffer2);
              pWaveHdr2.dwBufferLength := INP_BUFFER_SIZE;
              pWaveHdr2.dwBytesRecorded := 0;
              pWaveHdr2.dwUser := 0;
              pWaveHdr2.dwFlags := 0;
              pWaveHdr2.dwLoops := 1;
              pWaveHdr2.lpNext := nil;
              pWaveHdr2.reserved := 0;
              waveInPrepareHeader(hWaveIn, pWaveHdr2, SizeOf(TWaveHdr));
            end;

          IDC_RECORD_END:
            begin // Reset input to return last buffer
              bEnding := TRUE;
              waveInReset(hWaveIn);
            end;

          IDC_PLAY_BEG:
            begin
             // Open waveform audio for output
              waveform.wFormatTag := WAVE_FORMAT_PCM;
              waveform.nChannels := 1;
              waveform.nSamplesPerSec := 11025;
              waveform.nAvgBytesPerSec := 11025;
              waveform.nBlockAlign := 1;
              waveform.wBitsPerSample := 8;
              waveform.cbSize := 0;
              if (waveOutOpen(@hWaveOut, WAVE_MAPPER, @waveform,
                hDlg, 0, CALLBACK_WINDOW) <> MMSYSERR_NOERROR) then
              begin
                MessageBeep(MB_ICONEXCLAMATION);
                MessageBox(hDlg, szOpenError, szAppName, MB_ICONEXCLAMATION or MB_OK);
              end;
            end;

          IDC_PLAY_PAUSE:
            begin
              if (bPaused = FALSE) then // Pause or restart output
              begin
                waveOutPause(hWaveOut);
                SetDlgItemText(hDlg, IDC_PLAY_PAUSE, 'Resume');
                bPaused := TRUE;
              end else
              begin
                waveOutRestart(hWaveOut);
                SetDlgItemText(hDlg, IDC_PLAY_PAUSE, 'Pause');
                bPaused := FALSE;
              end;
            end;

          IDC_PLAY_END:
            begin // Reset output for close preparation
              bEnding := TRUE;
              waveOutReset(hWaveOut);
            end;

          IDC_PLAY_REV:
            begin // Reverse save buffer and play
              bReverse := TRUE;
              ReverseMemory(pSaveBuffer, dwDataLength);
              SendMessage(hDlg, WM_COMMAND, IDC_PLAY_BEG, 0);
            end;

          IDC_PLAY_REP:
            begin // Set infinite repetitions and play
              dwRepetitions := DWORD(-1);
              SendMessage(hDlg, WM_COMMAND, IDC_PLAY_BEG, 0);
            end;

          IDC_PLAY_SPEED:
            begin // Open waveform audio for fast output
              waveform.wFormatTag := WAVE_FORMAT_PCM;
              waveform.nChannels := 1;
              waveform.nSamplesPerSec := 22050;
              waveform.nAvgBytesPerSec := 22050;
              waveform.nBlockAlign := 1;
              waveform.wBitsPerSample := 8;
              waveform.cbSize := 0;
              if (waveOutOpen(@hWaveOut, 0, @waveform, hDlg, 0,
                CALLBACK_WINDOW)  <> MMSYSERR_NOERROR)then
              begin
                MessageBeep(MB_ICONEXCLAMATION);
                MessageBox(hDlg, szOpenError, szAppName, MB_ICONEXCLAMATION or MB_OK);
              end
            end;

          else Result := FALSE;
        end;
      end;

    MM_WIM_OPEN:
      begin
       // Shrink down the save buffer
        ReallocMem(pSaveBuffer, 1);

       // Enable and disable buttons
        EnableWindow(GetDlgItem(hDlg, IDC_RECORD_BEG), FALSE);
        EnableWindow(GetDlgItem(hDlg, IDC_RECORD_END), TRUE);
        EnableWindow(GetDlgItem(hDlg, IDC_PLAY_BEG), FALSE);
        EnableWindow(GetDlgItem(hDlg, IDC_PLAY_PAUSE), FALSE);
        EnableWindow(GetDlgItem(hDlg, IDC_PLAY_END), FALSE);
        EnableWindow(GetDlgItem(hDlg, IDC_PLAY_REV), FALSE);
        EnableWindow(GetDlgItem(hDlg, IDC_PLAY_REP), FALSE);
        EnableWindow(GetDlgItem(hDlg, IDC_PLAY_SPEED), FALSE);
        SetFocus(GetDlgItem(hDlg, IDC_RECORD_END));

       // Add the buffers
        waveInAddBuffer(hWaveIn, pWaveHdr1, SizeOf(TWaveHdr));
        waveInAddBuffer(hWaveIn, pWaveHdr2, SizeOf(TWaveHdr));

       // Begin sampling
        bRecording := TRUE;
        bEnding := FALSE;
        dwDataLength := 0;
        waveInStart(hWaveIn);
      end;

    MM_WIM_DATA:
      begin
       // Reallocate save buffer memory
        ReallocMem(pSaveBuffer, dwDataLength + PWaveHdr(lParam).dwBytesRecorded);
        if (pSaveBuffer = nil) then
        begin
          waveInClose(hWaveIn);
          MessageBeep(MB_ICONEXCLAMATION);
          MessageBox(hDlg, szMemError, szAppName, MB_ICONEXCLAMATION or MB_OK);
          Exit;
        end;
        CopyMemory(PByte(DWORD(pSaveBuffer) + dwDataLength), PWaveHdr(lParam).lpData,
                   PWaveHdr(lParam).dwBytesRecorded);
        Inc(dwDataLength, PWaveHdr(lParam).dwBytesRecorded);
        if (bEnding) then
        begin
          waveInClose(hWaveIn);
          Exit;
        end;
       // Send out a new buffer
        waveInAddBuffer(hWaveIn, PWaveHdr(lParam), SizeOf(TWaveHdr));
      end;

    MM_WIM_CLOSE:
      begin
       // Free the buffer memory
        waveInUnprepareHeader(hWaveIn, pWaveHdr1, SizeOf(TWaveHdr));
        waveInUnprepareHeader(hWaveIn, pWaveHdr2, SizeOf(TWaveHdr));
        FreeMem(pBuffer1);
        FreeMem(pBuffer2);

       // Enable and disable buttons
        EnableWindow(GetDlgItem(hDlg, IDC_RECORD_BEG), TRUE);
        EnableWindow(GetDlgItem(hDlg, IDC_RECORD_END), FALSE);
        SetFocus(GetDlgItem(hDlg, IDC_RECORD_BEG));
        if (dwDataLength > 0) then
        begin
          EnableWindow(GetDlgItem(hDlg, IDC_PLAY_BEG), TRUE);
          EnableWindow(GetDlgItem(hDlg, IDC_PLAY_PAUSE), FALSE);
          EnableWindow(GetDlgItem(hDlg, IDC_PLAY_END), FALSE);
          EnableWindow(GetDlgItem(hDlg, IDC_PLAY_REP), TRUE);
          EnableWindow(GetDlgItem(hDlg, IDC_PLAY_REV), TRUE);
          EnableWindow(GetDlgItem(hDlg, IDC_PLAY_SPEED), TRUE);
          SetFocus(GetDlgItem(hDlg, IDC_PLAY_BEG));
        end;
        bRecording := FALSE;
        if (bTerminating) then SendMessage(hDlg, WM_SYSCOMMAND, SC_CLOSE, 0);
      end;

    MM_WOM_OPEN:
      begin
       // Enable and disable buttons
        EnableWindow(GetDlgItem(hDlg, IDC_RECORD_BEG), FALSE);
        EnableWindow(GetDlgItem(hDlg, IDC_RECORD_END), FALSE);
        EnableWindow(GetDlgItem(hDlg, IDC_PLAY_BEG), FALSE);
        EnableWindow(GetDlgItem(hDlg, IDC_PLAY_PAUSE), TRUE);
        EnableWindow(GetDlgItem(hDlg, IDC_PLAY_END), TRUE);
        EnableWindow(GetDlgItem(hDlg, IDC_PLAY_REP), FALSE);
        EnableWindow(GetDlgItem(hDlg, IDC_PLAY_REV), FALSE);
        EnableWindow(GetDlgItem(hDlg, IDC_PLAY_SPEED), FALSE);
        SetFocus(GetDlgItem(hDlg, IDC_PLAY_END));

       // Set up header
        pWaveHdr1.lpData := PChar(pSaveBuffer);
        pWaveHdr1.dwBufferLength := dwDataLength;
        pWaveHdr1.dwBytesRecorded := 0;
        pWaveHdr1.dwUser := 0;
        pWaveHdr1.dwFlags := WHDR_BEGINLOOP or WHDR_ENDLOOP;
        pWaveHdr1.dwLoops := dwRepetitions;
        pWaveHdr1.lpNext := nil;
        pWaveHdr1.reserved := 0;

       // Prepare and write
        waveOutPrepareHeader(hWaveOut, pWaveHdr1, SizeOf(TWaveHdr));
        waveOutWrite(hWaveOut, pWaveHdr1, SizeOf(TWaveHdr));
        bEnding := FALSE;
        bPlaying := TRUE;
      end;

    MM_WOM_DONE:
      begin
        waveOutUnprepareHeader(hWaveOut, pWaveHdr1, SizeOf(TWaveHdr));
        waveOutClose(hWaveOut);
      end;

    WM_SYSCOMMAND:
      begin
        if (LOWORD(wParam) = SC_CLOSE) then
        begin
          if (bRecording) then
          begin
            bTerminating := TRUE;
            bEnding := TRUE;
            waveInReset(hWaveIn);
            Exit;
          end;
          if (bPlaying) then
          begin
            bTerminating := TRUE;
            bEnding := TRUE;
            waveOutReset(hWaveOut);
            Exit;
          end;
          FreeMem(pWaveHdr1);
          FreeMem(pWaveHdr2);
          FreeMem(pSaveBuffer);
          EndDialog(hDlg, 0);
        end else
          Result := FALSE;
      end;

    else
      Result := FALSE;
  end;
end;

begin
  if (DialogBox(hInstance, 'Record', 0, @DlgProc) = -1) then
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
end.

