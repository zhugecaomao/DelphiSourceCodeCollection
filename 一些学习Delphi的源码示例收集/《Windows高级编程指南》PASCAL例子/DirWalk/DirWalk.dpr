
// Module name: DirWalk.C ->> DirWalk.dpr
// Written by: Jim Harkins and Jeffrey Richter
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

program DirWalk;

{$R 'DirWalk.res' 'DirWalk.rc'}

uses
  Windows, Messages,
  Other in '..\Other.pas', CmnHdr in '..\CmnHdr.pas', WindowsX in '..\WindowsX.pas';

const
  IDD_DIRWALK  =    1;
  IDC_TREE     =  100;
  IDI_DIRWALK  =  102;

  // 是否子目录
function IsChildDir(var lpFindData: TWin32FindData): BOOL;
begin
  Result :=
    (lpFindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY <> 0) and
    (lstrcmp(lpFindData.cFileName,  '.') <> 0) and
    (lstrcmp(lpFindData.cFileName, '..') <> 0);
end;

  // 下一个子目录
function FindNextChildDir(hFindFile: THandle; var lpFindData: TWin32FindData): BOOL;
begin
  repeat
    Result := FindNextFile(hFindFile, lpFindData);
  until (not Result) or IsChildDir(lpFindData);
end;

  // 第一个子目录
function FindFirstChildDir(const szPath: Pchar; var lpFindData: TWin32FindData): THandle;
var
  fFound: BOOL;
begin
  Result := FindFirstFile(szPath, lpFindData);
  if (Result <> INVALID_HANDLE_VALUE) then
  begin
    fFound := IsChildDir(lpFindData);

    if (not fFound) then
      fFound := FindNextChildDir(Result, lpFindData);

    if (not fFound) then
    begin
      FindClose(Result);
      Result := INVALID_HANDLE_VALUE;
    end;
  end;
end;

  // 用作遍历目录
type
  PDirWalkData = ^TDirWalkData;
  TDirWalkData = record
    hWndTreeLB: HWND;     // Handle to the output list box
    nDepth: Integer;      // Nesting depth
    fRecurse: BOOL;       // Set to TRUE to list subdirectories.
    szBuf: array[0..1000] of Char; // Output formatting buffer
    nIndent: Integer;     // Indentation character count
    fOk: BOOL;            // Loop control flag
    fIsDir: BOOL;         // Loop control flag
    FindData: TWin32FindData; // File information
  end;

  // 递归遍历目录
procedure DirWalkRecurse(var pDW: TDirWalkData);
var
  hFind: THandle;
  nBlank: Integer;
begin
  // 层次增加
  Inc(pDW.nDepth);

  // 前缀空格
  pDW.nIndent := 3 * pDW.nDepth;
  for nBlank := 0 to pDW.nIndent - 1 do pDW.szBuf[nBlank] := ' ';

  // 当前目录
  GetCurrentDirectory(chDIMOF(pDW.szBuf) - pDW.nIndent, @pDW.szBuf[pDW.nIndent]);
  ListBox_AddString(pDW.hWndTreeLB, pDW.szBuf);

  // 枚举文件
  hFind := FindFirstFile('*.*', pDW.FindData);
  pDW.fOk := (hFind <> INVALID_HANDLE_VALUE);
  while (pDW.fOk) do
  begin
    // 是否目录
    pDW.fIsDir := (pDW.FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY <> 0);

    // 不是目录or不展开下级目录
    if (not pDW.fIsDir) or ((not pDW.fRecurse) and IsChildDir(pDW.FindData)) then
    begin
      // 前缀空格
      for nBlank := 0 to pDW.nIndent - 1 do pDW.szBuf[nBlank] := ' ';

      // 当前文件
      _wvsprintf(@pDW.szBuf[pDW.nIndent], IfThen(pDW.fIsDir, '[%s]', '%s'), [DWORD(@pDW.FindData.cFileName)]);
      ListBox_AddString(pDW.hWndTreeLB, pDW.szBuf);
    end;

    pDW.fOk := FindNextFile(hFind, pDW.FindData);
  end;
  if (hFind <> INVALID_HANDLE_VALUE) then FindClose(hFind);

  // 枚举目录
  if (pDW.fRecurse) then
  begin
    hFind := FindFirstChildDir('*.*', pDW.FindData);
    pDW.fOk := (hFind <> INVALID_HANDLE_VALUE);

    while (pDW.fOk) do
    begin
      if SetCurrentDirectory(pDW.FindData.cFileName) then
      begin
        DirWalkRecurse(pDW);
        SetCurrentDirectory('..');
      end;

      pDW.fOk := FindNextChildDir(hFind, pDW.FindData);
    end;

    if (hFind <> INVALID_HANDLE_VALUE) then FindClose(hFind);
  end;

  // 层次减少
  Dec(pDW.nDepth);
end;

  // 目录结构 -> ListBox
procedure Dir_Walk(hWndTreeLB: HWND; const pszRootPath: PChar; fRecurse: BOOL);
var
  szCurrDir: array[0..MAX_PATH] of Char;
  DW: TDirWalkData;
begin
  GetCurrentDirectory(chDIMOF(szCurrDir), szCurrDir);
  SetCurrentDirectory(pszRootPath);

  SetWindowRedraw(hWndTreeLB, FALSE);
  ListBox_ResetContent(hWndTreeLB);
  DW.nDepth := -1;
  DW.hWndTreeLB := hWndTreeLB;
  DW.fRecurse := fRecurse;
  DirWalkRecurse(DW);
  SetWindowRedraw(hWndTreeLB, TRUE);

  SetCurrentDirectory(szCurrDir);
end;

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
var
  Rc: TRect;
begin
  chSETDLGICONS(hWnd, IDI_DIRWALK, IDI_DIRWALK);

  GetClientRect(hWnd, Rc);
  SetWindowPos(GetDlgItem(hWnd, IDC_TREE), 0, 0, 0, Rc.Right, Rc.Bottom, SWP_NOZORDER);

  Dir_Walk(GetDlgItem(hWnd, IDC_TREE), '..', TRUE);

  Result := TRUE;
end;

  // WM_SIZE
procedure Dlg_OnSize(hWnd: HWND; state: UINT; cx, cy: Integer);
begin
  SetWindowPos(GetDlgItem(hWnd, IDC_TREE), 0, 0, 0, cx, cy, SWP_NOZORDER);
end;

  // WM_COMMAND
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
begin
  case (id) of
    IDCANCEL: EndDialog(hWnd, id);
    IDOK: Dir_Walk(GetDlgItem(hWnd, IDC_TREE), '..', TRUE); // 刷新
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

    WM_SIZE:
      begin
        Dlg_OnSize(hWnd, wParam, LOWORD(lParam), HIWORD(lParam));
        Result := TRUE;
      end;

    WM_COMMAND:
      begin
        Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));
        Result := TRUE;
      end;

    else
      Result := FALSE;
  end;
end;

  // 程序入口
begin
  chWARNIFUNICODEUNDERWIN95();
  DialogBox(HInstance, MakeIntResource(IDD_DIRWALK), 0, @Dlg_Proc);
end.
