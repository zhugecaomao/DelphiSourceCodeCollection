
// Module name: DocStats.C ->> DocStats.dpr
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

program DocStats;

{$R 'DocStats.res' 'DocStats.rc'}

uses
  Windows, Messages, CommDlg,
  Other in '..\Other.pas', CmnHdr in '..\CmnHdr.pas', WindowsX in '..\WindowsX.pas';

const
  g_szModName = 'DocStats';
  IDD_DOCSTATS    =     1;
  IDC_FILESELECT  =   101;
  IDI_DOCSTATS    =   102;
  IDC_FILENAME    =  1000;
  IDC_DODOCSTATS  =  1001;
  IDC_NUMLETTERS  =  1002;
  IDC_NUMWORDS    =  1003;
  IDC_NUMLINES    =  1004;

const
  STAT_LETTERS = 0;
  STAT_WORDS   = 1;
  STAT_LINES   = 2;
  STAT_FIRST = STAT_LETTERS;
  STAT_LAST  = STAT_LINES;

type
  TStatType = STAT_FIRST..STAT_LAST;

var
  g_hEventsDataReady: array[TStatType] of THandle; // 数据已经准备好
  g_hEventsProcIdle: array[TStatType] of THandle;  // 数据已经处理过
  g_bFileBuf: array[0..1023] of Byte; // 文件内容缓冲区
  g_dwNumBytesInBuf: DWORD;           // 缓冲区数据长度

  // 处理线程
function StatThreadFunc(StatType: TStatType): Integer;
var
  dwByteIndex: Integer;
  bByte: Byte;
  fInWord, fIsWordSep: BOOL;
begin
  Result := 0;
  fInWord := FALSE;

  repeat
    WaitForSingleObject(g_hEventsDataReady[StatType], INFINITE); // 等待数据

    case (StatType) of
      STAT_LETTERS: // 字母
        for dwByteIndex := 0 to g_dwNumBytesInBuf - 1 do
        begin
          bByte := g_bFileBuf[dwByteIndex];
          if IsCharAlpha(Char(bByte)) then Inc(Result);
        end;

      STAT_WORDS: // 单词
        for dwByteIndex := 0 to g_dwNumBytesInBuf - 1 do
        begin
          bByte := g_bFileBuf[dwByteIndex];
          fIsWordSep := StrChr(' '#9#13#10, Char(bByte)) <> nil; // 是否分隔符
          if (fInWord = FALSE) and (fIsWordSep = FALSE) then // 遇到新的单词
          begin
            Inc(Result);
            fInWord := TRUE; // 当前处于单词中
          end else
            if (fInWord) and (fIsWordSep) then fInWord := FALSE; // 遇到单词后第一个分隔符
        end;

      STAT_LINES: // 行
        for dwByteIndex := 0 to g_dwNumBytesInBuf - 1 do
        begin
          bByte := g_bFileBuf[dwByteIndex];
          if (bByte = 13) then Inc(Result);
        end;
    end;

    SetEvent(g_hEventsProcIdle[StatType]); // 处理完毕
  until (g_dwNumBytesInBuf = 0);
end;

  // 统计文档
function Doc_Stats(const pszPathname: PChar; var pdwNumLetters, pdwNumWords, pdwNumLines: DWORD): BOOL;
var
  hFile: THandle;
  hThreads: array[TStatType] of THandle;
  dwThreadID: DWORD;
  StatType: TStatType;
begin
  Result := FALSE;
  pdwNumLetters := 0;
  pdwNumWords := 0;
  pdwNumLines := 0;

  // 以只读方式打开文件
  hFile := CreateFile(pszPathname, GENERIC_READ, 0, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if (hFile = INVALID_HANDLE_VALUE) then
  begin
    chMB('File could not be opened ', g_szModName);
    Exit;
  end;

  // 建立事件对象和线程
  for StatType := STAT_FIRST to STAT_LAST do
  begin
    g_hEventsDataReady[StatType] := CreateEvent(nil, FALSE, FALSE, nil); // 数据还未准备好
    g_hEventsProcIdle[StatType] := CreateEvent(nil, FALSE, TRUE, nil);   // 没有数据未处理
    hThreads[StatType] := BeginThread(nil, 0, @StatThreadFunc, Pointer(StatType), 0, dwThreadID);
  end;

  // 分批读出文件并处理
  repeat
    // 等待处理完毕
    WaitForMultipleObjects(STAT_LAST - STAT_FIRST + 1, @g_hEventsProcIdle, TRUE, INFINITE);

    // 读出部分内容
    ReadFile(hFile, g_bFileBuf, chDIMOF(g_bFileBuf), g_dwNumBytesInBuf, nil);

    // 唤醒处理线程
    for StatType := STAT_FIRST to STAT_LAST do SetEvent(g_hEventsDataReady[StatType]);
  until (g_dwNumBytesInBuf = 0);

  // 关闭文件句柄
  CloseHandle(hFile);

  // 等待线程结束
  WaitForMultipleObjects(STAT_LAST - STAT_FIRST + 1, @hThreads, TRUE, INFINITE);

  // 取得统计结果
  GetExitCodeThread(hThreads[STAT_LETTERS], pdwNumLetters);
  GetExitCodeThread(hThreads[STAT_WORDS], pdwNumWords);
  GetExitCodeThread(hThreads[STAT_LINES], pdwNumLines);

  // 清除内核对象
  for StatType := STAT_FIRST to STAT_LAST do
  begin
    CloseHandle(hThreads[StatType]);
    CloseHandle(g_hEventsDataReady[StatType]);
    CloseHandle(g_hEventsProcIdle[StatType]);
  end;

  Result := TRUE;
end;

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
begin
  chSETDLGICONS(hWnd, IDI_DOCSTATS, IDI_DOCSTATS);
  EnableWindow(GetDlgItem(hWnd, IDC_DODOCSTATS), FALSE);
  Result := TRUE;
end;

  // WM_COMMAND
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
var
  szPathname: array[0..MAX_PATH] of Char;
  ofn: TOpenFilename;
  dwNumLetters, dwNumWords, dwNumLines: DWORD;
begin
  case (id) of
    IDC_FILENAME: // 文件名Edit
      begin
        EnableWindow(GetDlgItem(hWnd, IDC_DODOCSTATS), Edit_GetTextLength(hWndCtl) > 0);
      end;

    IDC_FILESELECT: // 选择文件
      begin
        chINITSTRUCT(ofn, SizeOf(ofn), TRUE);
        ofn.hWndOwner := hWnd;
        ofn.lpstrFile := szPathname;
        ofn.lpstrFile[0] := #0;
        ofn.nMaxFile := chDIMOF(szPathname);
        ofn.lpstrTitle := 'Select file for reversing';
        ofn.Flags := OFN_EXPLORER or OFN_FILEMUSTEXIST;
        GetOpenFileName(ofn);

        SetDlgItemText(hWnd, IDC_FILENAME, ofn.lpstrFile);
        SetFocus(GetDlgItem(hWnd, IDC_DODOCSTATS));
      end;

    IDC_DODOCSTATS: // 统计
      begin
        GetDlgItemText(hWnd, IDC_FILENAME, szPathname, chDIMOF(szPathname));
        if Doc_Stats(szPathname, dwNumLetters, dwNumWords, dwNumLines) then
        begin
          SetDlgItemInt(hWnd, IDC_NUMLETTERS, dwNumLetters, FALSE);
          SetDlgItemInt(hWnd, IDC_NUMWORDS, dwNumWords, FALSE);
          SetDlgItemInt(hWnd, IDC_NUMLINES, dwNumLines, FALSE);
        end;
      end;

    IDCANCEL: // 退出程序
      begin
        EndDialog(hWnd, id);
      end;
  end;
end;

  // 对话框回调
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  case (uMsg) of
    WM_INITDIALOG:
      begin
        Result := SetDlgMsgResult(hWnd, LRESULT(Dlg_OnInitDialog(hWnd, wParam, lParam)));
      end;
      
    WM_COMMAND:
      begin
        Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));
        Result := TRUE;
      end;

    else Result := FALSE;
  end;
end;

  // 主线程入口
begin
  chWARNIFUNICODEUNDERWIN95();
  DialogBox(HInstance, MakeIntResource(IDD_DOCSTATS), 0, @Dlg_Proc);
end.
