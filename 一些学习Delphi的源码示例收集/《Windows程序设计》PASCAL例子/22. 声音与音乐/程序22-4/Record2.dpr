program  Record2;

{$R ..\程序22-3\Record1.Res}

uses
  Windows, Messages, MMSystem;       

const
  szAppName = 'Record2';
  IDC_RECORD_BEG = 1000; // 控件ID
  IDC_RECORD_END = 1001;
  IDC_PLAY_BEG   = 1002;
  IDC_PLAY_PAUSE = 1003;
  IDC_PLAY_END   = 1004;
  IDC_PLAY_REV   = 1005;
  IDC_PLAY_REP   = 1006;
  IDC_PLAY_SPEED = 1007;

  // 显示错误
procedure ShowError(hWnd: HWND; dwError: DWORD);
var
  szErrorStr: array[0..1024] of Char;
begin
  mciGetErrorString(dwError, szErrorStr, SizeOf(szErrorStr));
  MessageBeep(MB_ICONEXCLAMATION);
  MessageBox(hWnd, szErrorStr, szAppName, MB_OK or MB_ICONEXCLAMATION);
end;

  // 对话框回调
function DlgProc(hDlg: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
const
  szFileName = 'record2.wav';
{$J+}
  bRecording: Boolean = FALSE;
  bPlaying: Boolean = FALSE;
  bPaused: Boolean = FALSE;
  wDeviceID: WORD = 0;
{$J-}
var
  dwError: DWORD;
  mciGeneric: MCI_GENERIC_PARMS;
  mciOpen: MCI_OPEN_PARMS;
  mciPlay: MCI_PLAY_PARMS;
  mciRecord: MCI_RECORD_PARMS;
  mciSave: MCI_SAVE_PARMS;
begin
  Result := TRUE;
  case (Msg) of
    WM_COMMAND:
      begin
        case LOWORD(wParam) of
          IDC_RECORD_BEG:
            begin
             // Delete existing waveform file
              DeleteFile(szFileName);

             // Open waveform audio
              mciOpen.dwCallback := 0;
              mciOpen.wDeviceID := 0;
              mciOpen.lpstrDeviceType := 'waveaudio';
              mciOpen.lpstrElementName := '';
              mciOpen.lpstrAlias := nil;
              dwError := mciSendCommand(0, MCI_OPEN,
                MCI_WAIT or MCI_OPEN_TYPE or MCI_OPEN_ELEMENT, DWORD(@mciOpen));
              if (dwError <> 0) then
              begin
                ShowError(hDlg, dwError);
                Exit;
              end;

             // Save the Device ID
              wDeviceID := mciOpen.wDeviceID;

             // Begin recording
              mciRecord.dwCallback := hDlg;
              mciRecord.dwFrom := 0;
              mciRecord.dwTo := 0;
              mciSendCommand(wDeviceID, MCI_RECORD, MCI_NOTIFY, DWORD(@mciRecord));

             // Enable and disable buttons
              EnableWindow(GetDlgItem(hDlg, IDC_RECORD_BEG), FALSE);
              EnableWindow(GetDlgItem(hDlg, IDC_RECORD_END), TRUE);
              EnableWindow(GetDlgItem(hDlg, IDC_PLAY_BEG), FALSE);
              EnableWindow(GetDlgItem(hDlg, IDC_PLAY_PAUSE), FALSE);
              EnableWindow(GetDlgItem(hDlg, IDC_PLAY_END), FALSE);
              SetFocus(GetDlgItem(hDlg, IDC_RECORD_END));

              bRecording := TRUE;
              Exit;
            end;

          IDC_RECORD_END:
            begin
             // Stop recording
              mciGeneric.dwCallback := 0;
              mciSendCommand(wDeviceID, MCI_STOP, MCI_WAIT, DWORD(@mciGeneric));

             // Save the file
              mciSave.dwCallback := 0;
              mciSave.lpfilename := szFileName;
              mciSendCommand(wDeviceID, MCI_SAVE, MCI_WAIT or MCI_SAVE_FILE, DWORD(@mciSave));

             // Close the waveform device
              mciSendCommand(wDeviceID, MCI_CLOSE, MCI_WAIT, DWORD(@mciGeneric));

             // Enable and disable buttons
              EnableWindow(GetDlgItem(hDlg, IDC_RECORD_BEG), TRUE);
              EnableWindow(GetDlgItem(hDlg, IDC_RECORD_END), FALSE);
              EnableWindow(GetDlgItem(hDlg, IDC_PLAY_BEG), TRUE);
              EnableWindow(GetDlgItem(hDlg, IDC_PLAY_PAUSE), FALSE);
              EnableWindow(GetDlgItem(hDlg, IDC_PLAY_END), FALSE);
              SetFocus(GetDlgItem(hDlg, IDC_PLAY_BEG));

              bRecording := FALSE;
              Exit;
            end;

          IDC_PLAY_BEG:
            begin
             // Open waveform audio
              mciOpen.dwCallback := 0;
              mciOpen.wDeviceID := 0;
              mciOpen.lpstrDeviceType := nil;
              mciOpen.lpstrElementName := szFileName;
              mciOpen.lpstrAlias := nil;
              dwError := mciSendCommand(0, MCI_OPEN, MCI_WAIT or MCI_OPEN_ELEMENT, DWORD(@mciOpen));
              if (dwError <> 0) then
              begin
                ShowError(hDlg, dwError);
                Exit;
              end;

             // Save the Device ID
              wDeviceID := mciOpen.wDeviceID;

             // Begin playing
              mciPlay.dwCallback := hDlg;
              mciPlay.dwFrom := 0;
              mciPlay.dwTo := 0;
              mciSendCommand(wDeviceID, MCI_PLAY, MCI_NOTIFY, DWORD(@mciPlay));

             // Enable and disable buttons
              EnableWindow(GetDlgItem(hDlg, IDC_RECORD_BEG), FALSE);
              EnableWindow(GetDlgItem(hDlg, IDC_RECORD_END), FALSE);
              EnableWindow(GetDlgItem(hDlg, IDC_PLAY_BEG), FALSE);
              EnableWindow(GetDlgItem(hDlg, IDC_PLAY_PAUSE), TRUE);
              EnableWindow(GetDlgItem(hDlg, IDC_PLAY_END), TRUE);
              SetFocus(GetDlgItem(hDlg, IDC_PLAY_END));

              bPlaying := TRUE;
              Exit;
            end;

          IDC_PLAY_PAUSE:
            begin  // Pause the play
              if (bPaused = FALSE) then
              begin
                mciGeneric.dwCallback := 0;
                mciSendCommand(wDeviceID, MCI_PAUSE, MCI_WAIT, DWORD(@mciGeneric));
                SetDlgItemText(hDlg, IDC_PLAY_PAUSE, 'Resume');
                bPaused := TRUE;
              end else
              begin // Begin playing again
                mciPlay.dwCallback := hDlg;
                mciPlay.dwFrom := 0;
                mciPlay.dwTo := 0;
                mciSendCommand(wDeviceID, MCI_PLAY, MCI_NOTIFY, DWORD(@mciPlay));
                SetDlgItemText(hDlg, IDC_PLAY_PAUSE, 'Pause');
                bPaused := FALSE;
              end;
            end;

          IDC_PLAY_END: // Stop and close
            begin
              mciGeneric.dwCallback := 0;
              mciSendCommand(wDeviceID, MCI_STOP, MCI_WAIT, DWORD(@mciGeneric));
              mciSendCommand(wDeviceID, MCI_CLOSE, MCI_WAIT, DWORD(@mciGeneric));

             // Enable and disable buttons
              EnableWindow(GetDlgItem(hDlg, IDC_RECORD_BEG), TRUE);
              EnableWindow(GetDlgItem(hDlg, IDC_RECORD_END), FALSE);
              EnableWindow(GetDlgItem(hDlg, IDC_PLAY_BEG), TRUE);
              EnableWindow(GetDlgItem(hDlg, IDC_PLAY_PAUSE), FALSE);
              EnableWindow(GetDlgItem(hDlg, IDC_PLAY_END), FALSE);
              SetFocus(GetDlgItem(hDlg, IDC_PLAY_BEG));

              bPlaying := FALSE;
              bPaused := FALSE;
            end;

          else Result := FALSE;
        end;
      end;

    MM_MCINOTIFY:
      if (wParam = MCI_NOTIFY_SUCCESSFUL) then
      begin
        if (bPlaying) then SendMessage(hDlg, WM_COMMAND, IDC_PLAY_END, 0);
        if (bRecording) then SendMessage(hDlg, WM_COMMAND, IDC_RECORD_END, 0);
      end;

    WM_SYSCOMMAND:
      if (LOWORD(wParam) = SC_CLOSE) then
      begin
        if (bRecording) then SendMessage(hDlg, WM_COMMAND, IDC_RECORD_END, 0);
        if (bPlaying) then SendMessage(hDlg, WM_COMMAND, IDC_PLAY_END, 0);
        EndDialog(hDlg, 0);
      end else
        Result := FALSE;

    else
      Result := FALSE;
  end;
end;

begin
  if (DialogBox(hInstance, 'Record', 0, @DlgProc) = -1) then
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
end.
