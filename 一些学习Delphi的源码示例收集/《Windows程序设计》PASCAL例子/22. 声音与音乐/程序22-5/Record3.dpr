program  Record3;

{$R ..\程序22-3\Record1.Res}

uses
  Windows, Messages, MMSystem;       

const
  szAppName = 'Record3';
  IDC_RECORD_BEG = 1000;
  IDC_RECORD_END = 1001;
  IDC_PLAY_BEG   = 1002;
  IDC_PLAY_PAUSE = 1003;
  IDC_PLAY_END   = 1004;
  IDC_PLAY_REV   = 1005;
  IDC_PLAY_REP   = 1006;
  IDC_PLAY_SPEED = 1007;

  // 执行命令
function mciExecute(szCommand: PChar): Boolean;
var
  Error: MCIERROR;
  szErrorStr: array[0..1024] of Char;
begin
  Error := mciSendString(szCommand, nil, 0, 0);
  if (Error <> 0) then
  begin
    mciGetErrorString(Error, szErrorStr, SizeOf(szErrorStr));
    MessageBeep(MB_ICONEXCLAMATION);
    MessageBox(0, szErrorStr, 'MCI Error', MB_OK or MB_ICONEXCLAMATION);
  end;
  Result := Error = 0;
end;

  // 对话框回调
function DlgProc(hDlg: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
const
{$J+}
  bRecording: Boolean = FALSE;
  bPlaying: Boolean = FALSE;
  bPaused: Boolean = FALSE;
{$J-}
begin
  Result := TRUE;
  case (Msg) of
    WM_COMMAND:
      begin
        case LOWORD(wParam) of
          IDC_RECORD_BEG:
            begin
             // Delete existing waveform file
              DeleteFile('record3.wav');
             // Open waveform audio and record
              if (not mciExecute('open new type waveaudio alias mysound')) then Exit;
              mciExecute('record mysound');
             // Enable and disable buttons
              EnableWindow(GetDlgItem(hDlg, IDC_RECORD_BEG), FALSE);
              EnableWindow(GetDlgItem(hDlg, IDC_RECORD_END), TRUE);
              EnableWindow(GetDlgItem(hDlg, IDC_PLAY_BEG), FALSE);
              EnableWindow(GetDlgItem(hDlg, IDC_PLAY_PAUSE), FALSE);
              EnableWindow(GetDlgItem(hDlg, IDC_PLAY_END), FALSE);
              SetFocus(GetDlgItem(hDlg, IDC_RECORD_END));
              bRecording := TRUE;
            end;

          IDC_RECORD_END:
            begin
             // Stop, save, and close recording
              mciExecute('stop mysound');
              mciExecute('save mysound record3.wav');
              mciExecute('close mysound');
             // Enable and disable buttons
              EnableWindow(GetDlgItem(hDlg, IDC_RECORD_BEG), TRUE);
              EnableWindow(GetDlgItem(hDlg, IDC_RECORD_END), FALSE);
              EnableWindow(GetDlgItem(hDlg, IDC_PLAY_BEG), TRUE);
              EnableWindow(GetDlgItem(hDlg, IDC_PLAY_PAUSE), FALSE);
              EnableWindow(GetDlgItem(hDlg, IDC_PLAY_END), FALSE);
              SetFocus(GetDlgItem(hDlg, IDC_PLAY_BEG));
              bRecording := FALSE;
            end;

          IDC_PLAY_BEG:
            begin
             // Open waveform audio and play
              if (not mciExecute('open record3.wav alias mysound')) then Exit;
              mciExecute('play mysound');
             // Enable and disable buttons
              EnableWindow(GetDlgItem(hDlg, IDC_RECORD_BEG), FALSE);
              EnableWindow(GetDlgItem(hDlg, IDC_RECORD_END), FALSE);
              EnableWindow(GetDlgItem(hDlg, IDC_PLAY_BEG), FALSE);
              EnableWindow(GetDlgItem(hDlg, IDC_PLAY_PAUSE), TRUE);
              EnableWindow(GetDlgItem(hDlg, IDC_PLAY_END), TRUE);
              SetFocus(GetDlgItem(hDlg, IDC_PLAY_END));
              bPlaying := TRUE;
            end;

          IDC_PLAY_PAUSE:
            begin
              if (bPaused = FALSE) then
              begin // Pause the play
                mciExecute('pause mysound');
                SetDlgItemText(hDlg, IDC_PLAY_PAUSE, 'Resume');
                bPaused := TRUE;
              end else
              begin // Begin playing again
                mciExecute('play mysound');
                SetDlgItemText(hDlg, IDC_PLAY_PAUSE, 'Pause');
                bPaused := FALSE;
              end;
            end;

          IDC_PLAY_END:
            begin
             // Stop and close
              mciExecute('stop mysound');
              mciExecute('close mysound');
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
