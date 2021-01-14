
// Module name: DIPSLib.c & DIPSLib.h ->> DIPSLib.dpr
// Notices: Copyright (c) 1996 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

library DIPSLib;

{$R 'DIPSLib.res' 'DIPSLib.rc'}

uses
  Windows, Messages, CommCtrl,
  CmnHdr in '..\CmnHdr.pas', WindowsX in '..\WindowsX.pas';

const
  IDD_DIPS = 101;
  g_szModName = 'DIPSLib';
  g_szShareName = 'DIPSLib_ShareMem';
  g_szRegSubKey = 'Software\Richter\Desktop Item Position Saver';

type
  TShareMem = record
    g_hhook: HHOOK;
    g_dwThreadIdDIPS: DWORD;
  end;

var
  hFileMap: THandle;
  pShared: ^TShareMem;

  // 处理 WM_CLOSE
procedure DIPS_OnClose(hWnd: HWND);
begin
  DestroyWindow(hWnd);
end;

  // 保存图标位置
procedure SaveListViewItemPositions(hWndLV: HWND);
var
  nItem, nMaxItems, J: Integer;
  Key: HKEY;
  dwDisposition: DWORD;
  szName: array[0..MAX_PATH] of Char;
  pt: TPoint;
begin
  // 删除重建
  RegDeleteKey(HKEY_CURRENT_USER, g_szRegSubKey);
  J := RegCreateKeyEx(HKEY_CURRENT_USER, g_szRegSubKey, 0, nil, REG_OPTION_NON_VOLATILE, KEY_SET_VALUE, nil, Key, @dwDisposition);
  if (J <> ERROR_SUCCESS) then
  begin
    chMB('RegCreateKeyEx failure', g_szModName);
    Exit;
  end;

  // 保存位置
  nMaxItems := ListView_GetItemCount(hWndLV);
  for nItem := 0 to nMaxItems - 1 do
  begin
    ListView_GetItemText(hWndLV, nItem, 0, szName, chDIMOF(szName));
    ListView_GetItemPosition(hWndLV, nItem, pt);

    J := RegSetValueEx(Key, szName, 0, REG_BINARY, @pt, SizeOf(pt));
    if (J <> ERROR_SUCCESS) then
    begin
      chMB('RegSetValueEx failure', g_szModName);
      Break;
    end;
  end;

  RegCloseKey(Key);
end;

  // 恢复图标位置
procedure RestoreListViewItemPositions(hWndLV: HWND);
var
  Key: HKEY;
  J, nIndex, cbValueName, cbData, nItem: Integer;
  dwStyle, dwType: DWORD;
  szName: array[0..MAX_PATH] of Char;
  pt: TPoint;
  lvfi: TLVFindInfo;
begin
  J := RegOpenKeyEx(HKEY_CURRENT_USER, g_szRegSubKey, 0, KEY_QUERY_VALUE, Key);
  if (J = ERROR_SUCCESS) then
  begin
    dwStyle := GetWindowStyle(hWndLV);
    if (dwStyle and LVS_AUTOARRANGE <> 0) then SetWindowLong(hWndLV, GWL_STYLE, dwStyle and not LVS_AUTOARRANGE);

    // 恢复位置
    nIndex := 0;
    repeat
      cbValueName := chDIMOF(szName);
      cbData := SizeOf(pt);
      
      J := RegEnumValue(Key, nIndex, szName, DWORD(cbValueName), nil, @dwType, @pt, @cbData);
      if (J = ERROR_NO_MORE_ITEMS) then Break;

      if (dwType = REG_BINARY) and (cbData = SizeOf(pt)) then
      begin
        lvfi.flags := LVFI_STRING;
        lvfi.psz := szName;
        nItem := ListView_FindItem(hWndLV, -1, lvfi);
        if (nItem <> -1) then ListView_SetItemPosition(hWndLV, nItem, pt.X, pt.Y);
      end;

      Inc(nIndex);
    until FALSE;

    SetWindowLong(hWndLV, GWL_STYLE, dwStyle);
    RegCloseKey(Key);
  end;
end;

  // 对话框回调
function DIPS_DlgProc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  case (uMsg) of
    WM_CLOSE: DIPS_OnClose(hWnd);
    WM_APP: if (lParam <> 0) then SaveListViewItemPositions(wParam) else RestoreListViewItemPositions(wParam);
  end;
  Result := FALSE;
end;

  // 消息钩子回调
function GetMsgProc(nCode: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const {$J+}
  fFirstTime: BOOL = TRUE; {$J-} // 麻子注: 此变量最好互斥访问
begin
  if (fFirstTime) then
  begin
    fFirstTime := FALSE;
    CreateDialog(HInstance, MakeIntResource(IDD_DIPS), 0, @DIPS_DlgProc);
    PostThreadMessage(pShared.g_dwThreadIdDIPS, WM_NULL, 0, 0);
  end;

  Result := CallNextHookEx(pShared.g_hhook, nCode, wParam, lParam);
end;
  
  // 安装卸载钩子
function SetDIPSHook(dwThreadId: DWORD): BOOL; stdcall;
begin
  Result := FALSE;

  if (dwThreadId <> 0) then
  begin
    if (pShared.g_hhook <> 0) then
    begin
      chMB('Hook is already installed', g_szModName);
      Exit;
    end;

    pShared.g_dwThreadIdDIPS := GetCurrentThreadId();
    pShared.g_hhook := SetWindowsHookEx(WH_GETMESSAGE, @GetMsgProc, HInstance, dwThreadId);

    Result := (pShared.g_hhook <> 0);
    if (Result) then Result := PostThreadMessage(dwThreadId, WM_NULL, 0, 0);
  end else
  begin
    if (pShared.g_hhook = 0) then
    begin
      chMB('Hook has not been install', g_szModName);
      Exit;
    end;

    Result := UnhookWindowsHookEx(pShared.g_hhook);
    pShared.g_hhook := 0;
  end;
end;

  // DLL回调
procedure DLLMain(dwReason: DWORD);
begin
  if (dwReason = DLL_PROCESS_DETACH) then
  begin
    UnmapViewOfFile(pShared);
    CloseHandle(hFileMap);
  end;
end;

  // 导出函数
exports
  SetDIPSHook;

  // DLL入口
begin
  // 设置回调
  DllProc := @DLLMain;

  // 共享内存
  hFileMap := CreateFileMapping(INVALID_HANDLE_VALUE, nil, PAGE_READWRITE, 0, SizeOf(TShareMem), g_szShareName);
  pShared := MapViewOfFile(hFileMap, FILE_MAP_ALL_ACCESS, 0, 0, 0);
end.
