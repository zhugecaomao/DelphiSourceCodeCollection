library DIPSLib;

{$R 'DIPSLib.res' 'DIPSLib.rc'}

uses
  Windows, Messages, CommCtrl;

type
  TShareMem = record // 共享内存结构
    g_hhook: HHOOK;
    g_dwThreadIdDIPS: DWORD;
  end;

const
  g_szRegSubKey = 'Software\Richter\Desktop Item Position Saver';
  SHARE_NAME = 'DIPSLib_Shared';
  IDD_DIPS = 101;  

var
  hFileMap: THandle;   // 映射文件句柄
  PShared: ^TShareMem; // 映射内存地址

  // 处理WM_CLOSE
procedure Dlg_OnClose(hWnd: HWND);
begin
  DestroyWindow(hWnd);
end;

  // 保存桌面项目位置
procedure SaveListViewItemPositions(hWndLV: HWND);
var
  nMaxItems, nItem: Integer;
  Key: HKEY;
  szName: array[0..MAX_PATH] of Char;
  pt: TPoint;
begin
  // 桌面图标个数
  nMaxItems := ListView_GetItemCount(hWndLV);

  // 重建注册表键
  RegDeleteKey(HKEY_CURRENT_USER, g_szRegSubKey);
  RegCreateKeyEx(HKEY_CURRENT_USER, g_szRegSubKey, 0, nil,
    REG_OPTION_NON_VOLATILE, KEY_SET_VALUE, nil, Key, nil);

  // 处理每个图标
  for nItem := 0 to nMaxItems - 1 do
  begin
    // 名称、位置
    ListView_GetItemText(hWndLV, nItem, 0, szName, MAX_PATH);
    ListView_GetItemPosition(hWndLV, nItem, pt);

    // 存至注册表
    RegSetValueEx(Key, szName, 0, REG_BINARY, @pt, SizeOf(TPoint));
  end;

  RegCloseKey(Key);
end;

  // 恢复桌面项目位置
procedure RestoreListViewItemPositions(hWndLV: HWND);
var
  Key: HKEY;
  nIndex, nItem: Integer;
  dwStyle, cbValueName, cbData, dwType: DWORD;
  szName: array[0..MAX_PATH] of Char;
  pt: TPoint;
  lvfi: TLVFindInfo;
begin
  if (RegOpenKeyEx(HKEY_CURRENT_USER, g_szRegSubKey, 0, KEY_QUERY_VALUE, Key) = ERROR_SUCCESS) then
  begin
    // 关闭自动排列(原先有的話)
    dwStyle := GetWindowLong(hWndLV, GWL_STYLE);
    if (dwStyle and LVS_AUTOARRANGE <> 0) then
      SetWindowLong(hWndLV, GWL_STYLE, dwStyle and not LVS_AUTOARRANGE);

    // 枚举注册表项
    nIndex := 0;
    repeat
      cbValueName := MAX_PATH;
      cbData := SizeOf(TPoint);
      
      if (RegEnumValue(Key, nIndex, szName, cbValueName, nil,
        @dwType, PByte(@pt), @cbData) = ERROR_NO_MORE_ITEMS) then Break;
        
      if (dwType = REG_BINARY) and (cbData = SizeOf(TPoint)) then
      begin
        // 查找名称匹配的桌面图标
        lvfi.flags := LVFI_STRING;
        lvfi.psz := szName;
        nItem := ListView_FindItem(hWndLV, -1, lvfi);

        // 找到则恢复为先前的位置
        if (nItem <> -1) then ListView_SetItemPosition(hWndLV, nItem, pt.X, pt.Y);
      end;

      Inc(nIndex);
    until FALSE;

    // 恢复自动排列(原先有的話)
    SetWindowLong(hWndLV, GWL_STYLE, dwStyle);

    RegCloseKey(Key);
  end;
end;

  // 对话框回调
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  Result := TRUE;
  
  case (uMsg) of
    WM_CLOSE:
      Dlg_OnClose(hWnd);

    WM_APP:
      if (lParam <> 0) then
        SaveListViewItemPositions(wParam)
      else
        RestoreListViewItemPositions(wParam);

    else
      Result := FALSE;
  end;
end;

  // 钩子回调
function GetMsgProc(nCode: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const {$J+}
  fFirstTime: BOOL = TRUE; {$J-} // 首次被调用
begin
  if (fFirstTime = TRUE) then
  begin
    fFirstTime := FALSE;

    // 建立服务端窗口, 接收命令消息用
    CreateDialog(HInstance, MakeIntResource(IDD_DIPS), 0, @Dlg_Proc);

    // 唤醒DIPS.exe, 服务端已准备好了
    PostThreadMessage(PShared.g_dwThreadIdDIPS, WM_NULL, 0, 0);
  end;

  Result := CallNextHookEx(PShared.g_hhook, nCode, wParam, lParam);
end;

  // 装卸钩子
function SetDIPSHook(dwThreadId: DWORD): BOOL; stdcall;
begin
  Result := FALSE;

  // 要求安装~
  if (dwThreadId <> 0) then
  begin
    if (PShared.g_hhook <> 0) then Exit;

    // 保存DIPS.exe线程ID
    PShared.g_dwThreadIdDIPS := GetCurrentThreadId();

    // 向指定线程安装钩子
    PShared.g_hhook := SetWindowsHookEx(WH_GETMESSAGE, @GetMsgProc, HInstance, dwThreadId);

    // 安装钩子是否成功??
    Result := (PShared.g_hhook <> 0);

    // 促使钩子立即被调用
    if (Result) then Result := PostThreadMessage(dwThreadId, WM_NULL, 0, 0);
  end else
  begin
  // 否则卸载~

    // 卸载钩子
    if (PShared.g_hhook <> 0) then
    begin
      Result := UnhookWindowsHookEx(PShared.g_hhook);
      PShared.g_hhook := 0;
    end;
    
  end;
end;

  // DLL 回调
procedure DLLMain(dwReason: DWORD);
begin
  if (dwReason = DLL_PROCESS_DETACH) then
  begin
    UnmapViewOfFile(PShared);
    CloseHandle(hFileMap);
  end;
end;

  // 导出函数
exports
  SetDIPSHook;

  // DLL 入口
begin
  // 设置回调
  DllProc := @DLLMain;

  // 尝试打开
  hFileMap := OpenFileMapping(FILE_MAP_ALL_ACCESS, FALSE, SHARE_NAME);

  // 还未建立
  if (hFileMap = 0) then hFileMap := CreateFileMapping(
    INVALID_HANDLE_VALUE, nil, PAGE_READWRITE, 0, SizeOf(TShareMem), SHARE_NAME);

  // 映至内存  
  PShared := MapViewOfFile(hFileMap, FILE_MAP_ALL_ACCESS, 0, 0, 0);
end.
