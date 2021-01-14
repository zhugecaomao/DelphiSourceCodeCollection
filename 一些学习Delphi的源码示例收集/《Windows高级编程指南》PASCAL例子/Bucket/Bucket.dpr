
// Module name: Bucket.C ->> Bucket.dpr
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

program Bucket;

{$R 'Bucket.res' 'Bucket.rc'}

uses
  Windows, Messages, SWMRG in 'SWMRG.pas',
  Other in '..\Other.pas', CmnHdr in '..\CmnHdr.pas', WindowsX in '..\WindowsX.pas';

const
  IDD_BUCKET     =      1;
  IDC_WRITE1NUM  =    100;
  IDC_WRITE1SCRL =    101;
  IDC_WRITE2NUM  =    102;
  IDI_BUCKET     =    102;
  IDC_WRITE2SCRL =    103;
  IDC_READ1NUM   =    104;
  IDC_READ1SCRL  =    105;
  IDC_READ1LIST  =    106;
  IDC_READ2NUM   =    107;
  IDC_READ2SCRL  =    108;
  IDC_READ2LIST  =    109;
  IDC_READ3NUM   =    110;
  IDC_READ3SCRL  =    111;
  IDC_READ3LIST  =    112;

var
  g_SWMRG: TSWMRG;                    // 同步对象
  g_hThreads: array[0..4] of THandle; // 线程对象
  g_lTerminate: Integer = 0;          // 退出标志
  g_hWndDlg: HWND;                    // 界面窗口

type
  TBallColor =
    (
    BC_NULL, BC_BLACK, BC_RED, BC_GREEN, BC_BLUE, BC_WHITE, BC_YELLOW, BC_ORANGE, BC_CYAN, BC_GRAY,
    BC_FIRSTBALLCLR = BC_NULL, BC_LASTBALLCLR  = BC_GRAY
    );

const
  szBallColors: array[TBallColor] of PChar =
    ( nil, 'Black', 'Red', 'Green', 'Blue', 'White', 'Yellow', 'Orange', 'Cyan', 'Gray' );
  MAX_BALLS = 100;

var
  g_Bucket: array[0..MAX_BALLS - 1] of TBallColor; // = { BC_NULL }

  // 随机存取
procedure Bucket_AlterContents();
begin
  g_Bucket[Random(MAX_BALLS)] := TBallColor(Random(10));
end;

  // 数量统计
procedure Bucket_DumpToLB(hWndLB: HWND);
var
  BallColor: TBallColor;
  nBallNum, nBlank: Integer;
  nBallColor: array[TBallColor] of Integer; // = { 0 }
  szBuf, szBlank: array[0..50] of Char;
begin
  // 分类统计
  ZeroMemory(@nBallColor, SizeOf(nBallColor));
  for nBallNum := 0 to MAX_BALLS - 1 do
  begin
    BallColor := g_Bucket[nBallNum]; // nBallNum号球的颜色
    Inc(nBallColor[BallColor]);      // 对应颜色计数值增加
  end;

  // 刷新列表
  ListBox_ResetContent(hWndLB);
  for BallColor := BC_FIRSTBALLCLR to BC_LASTBALLCLR do
  begin
    if (szBallColors[BallColor] <> nil) then
    begin
      nBlank := 7 - lstrlen(szBallColors[BallColor]);
      szBlank[nBlank] := #0;
      FillMemory(@szBlank, nBlank, $20);

      _wvsprintf(szBuf, '%s: %s%2d', [ DWORD(szBallColors[BallColor]), DWORD(@szBlank), nBallColor[BallColor] ]);
    end else
      _wvsprintf(szBuf, 'Total:   %2d', [ MAX_BALLS - nBallColor[BallColor] ]);

    ListBox_AddString(hWndLB, szBuf);
  end;
end;

  // 写入线程
function Writer(nWriterNum: Integer): Integer; // **
var
  nNumID: DWORD;
begin
  case (nWriterNum) of
    1: nNumID := IDC_WRITE1NUM;
    2: nNumID := IDC_WRITE2NUM;
    else nNumID := 0;
  end;

  while (g_lTerminate = 0) do
  begin
    // 挂起指定时间
    Sleep(1000 * GetDlgItemInt(g_hWndDlg, nNumID, PBOOL(nil)^, FALSE));

    // 等待写入权限
    SWMRGWaitToWrite(g_SWMRG, INFINITE);

    // 修改共享数据
    Bucket_AlterContents();

    // 释放写入权限
    SWMRGDoneWriting(g_SWMRG);
  end;

  Result := 0;
end;

  // 读取线程
function Reader(nReaderNum: Integer): Integer;
var
  nNumID: DWORD;
  hWndLB: HWND;
begin
  case (nReaderNum) of
    1: begin
         nNumID := IDC_READ1NUM;
         hWndLB := GetDlgItem(g_hWndDlg, IDC_READ1LIST);
       end;

    2: begin
         nNumID := IDC_READ2NUM;
         hWndLB := GetDlgItem(g_hWndDlg, IDC_READ2LIST);
       end;

    3: begin
         nNumID := IDC_READ3NUM;
         hWndLB := GetDlgItem(g_hWndDlg, IDC_READ3LIST);
       end;

    else begin
         nNumID := 0;
         hWndLB := 0;
       end;
  end;

  while (g_lTerminate = 0) do
  begin
    // 挂起指定时间
    Sleep(1000 * GetDlgItemInt(g_hWndDlg, nNumID, PBOOL(nil)^, FALSE));

    // 等待读取权限
    SWMRGWaitToRead(g_SWMRG, INFINITE);

    // 读出共享数据
    Bucket_DumpToLB(hWndLB);

    // 释放读取权限
    SWMRGDoneReading(g_SWMRG);
  end;

  Result := 0;
end;

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
var
  dwThreadID: DWORD;
  x: Integer;
begin
  chSETDLGICONS(hWnd, IDI_BUCKET, IDI_BUCKET);
  g_hWndDlg := hWnd;

  ScrollBar_SetRange(GetDlgItem(hWnd, IDC_WRITE1SCRL), 0, 60, FALSE);
  ScrollBar_SetPos(GetDlgItem(hWnd, IDC_WRITE1SCRL), 1, TRUE);
  SetDlgItemInt(hWnd, IDC_WRITE1NUM, 1, FALSE);

  ScrollBar_SetRange(GetDlgItem(hWnd, IDC_WRITE2SCRL), 0, 60, FALSE);
  ScrollBar_SetPos(GetDlgItem(hWnd, IDC_WRITE2SCRL), 3, TRUE);
  SetDlgItemInt(hWnd, IDC_WRITE2NUM, 3, FALSE);

  ScrollBar_SetRange(GetDlgItem(hWnd, IDC_READ1SCRL), 0, 60, FALSE);
  ScrollBar_SetPos(GetDlgItem(hWnd, IDC_READ1SCRL), 2, TRUE);
  SetDlgItemInt(hWnd, IDC_READ1NUM, 2, FALSE);

  ScrollBar_SetRange(GetDlgItem(hWnd, IDC_READ2SCRL), 0, 60, FALSE);
  ScrollBar_SetPos(GetDlgItem(hWnd, IDC_READ2SCRL), 4, TRUE);
  SetDlgItemInt(hWnd, IDC_READ2NUM, 4, FALSE);
  
  ScrollBar_SetRange(GetDlgItem(hWnd, IDC_READ3SCRL), 0, 60, FALSE);
  ScrollBar_SetPos(GetDlgItem(hWnd, IDC_READ3SCRL), 7, TRUE);
  SetDlgItemInt(hWnd, IDC_READ3NUM, 7, FALSE);

  for x := 0 to 1 do
  begin
    g_hThreads[x] := BeginThread(nil, 0, @Writer, Pointer(x + 1), 0, dwThreadID);
  end;

  for x := 2 to 4 do
  begin
    g_hThreads[x] := BeginThread(nil, 0, @Reader, Pointer(x - 1), 0, dwThreadID);
  end;

  Result := TRUE;
end;

  // WM_HSCROLL
procedure Dlg_OnHScroll(hWnd, hWndCtl: HWND; code: UINT; pos: Integer);
var
  posCrnt, posMin, posMax: Integer;
begin
  posCrnt := ScrollBar_GetPos(hWndCtl);
  ScrollBar_GetRange(hWndCtl, @posMin, @posMax);

  case (code) of
    SB_LINELEFT:
      Dec(posCrnt);

    SB_LINERIGHT:
      Inc(posCrnt);

    SB_PAGELEFT:
      Dec(posCrnt, 10);

    SB_PAGERIGHT:
      Inc(posCrnt, 10);

    SB_THUMBTRACK:
      posCrnt := pos;

    SB_LEFT:
      posCrnt := 0;

    SB_RIGHT:
      posCrnt := posMax;
  end;

  if (posCrnt < 0) then posCrnt := 0 else if (posCrnt > posMax) then posCrnt := posMax;

  ScrollBar_SetPos(hWndCtl, posCrnt, TRUE);
  SetDlgItemInt(hWnd, GetDlgCtrlID(hWndCtl) - 1, posCrnt, FALSE);
end;

  // WM_VSCROLL
procedure Dlg_OnVScroll(hWnd, hWndCtl: HWND; code: UINT; pos: Integer);
var
  posCrnt, posMin, posMax: Integer;
begin
  posCrnt := ScrollBar_GetPos(hWndCtl);
  ScrollBar_GetRange(hWndCtl, @posMin, @posMax);

  case (code) of
    SB_LINEUP:
      Dec(posCrnt);

    SB_LINEDOWN:
      Inc(posCrnt);

    SB_PAGEUP:
      Dec(posCrnt, 10);

    SB_PAGEDOWN:
      Inc(posCrnt, 10);

    SB_THUMBTRACK:
      posCrnt := pos;

    SB_TOP:
      posCrnt := 0;

    SB_BOTTOM:
      posCrnt := posMax;
  end;

  if (posCrnt < 0) then posCrnt := 0 else if (posCrnt > posMax) then posCrnt := posMax;

  ScrollBar_SetPos(hWndCtl, posCrnt, TRUE);
  SetDlgItemInt(hWnd, GetDlgCtrlID(hWndCtl) - 1, posCrnt, FALSE);
end;

  // WM_COMMAND
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
begin
  if (id = IDCANCEL) then EndDialog(hWnd, id);
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

    WM_HSCROLL:
      begin
        Dlg_OnHScroll(hWnd, lParam, LOWORD(wParam), HIWORD(wParam));
        Result := TRUE;
      end;

    WM_VSCROLL:
      begin
        Dlg_OnVScroll(hWnd, lParam, LOWORD(wParam), HIWORD(wParam));
        Result := TRUE;
      end;

    else Result := FALSE;
  end;
end;

  // 主线程入口
var
  x: Integer;
begin
  chWARNIFUNICODEUNDERWIN95();

  SWMRGInitialize(g_SWMRG, nil);

  DialogBox(HInstance, MakeIntResource(IDD_BUCKET), 0, @Dlg_Proc);

  InterlockedIncrement(g_lTerminate);
  WaitForMultipleObjects(chDIMOF(g_hThreads), @g_hThreads, TRUE, INFINITE);
  for x := 0 to chDIMOF(g_hThreads) - 1 do CloseHandle(g_hThreads[x]);
  
  SWMRGDelete(g_SWMRG);
end.
