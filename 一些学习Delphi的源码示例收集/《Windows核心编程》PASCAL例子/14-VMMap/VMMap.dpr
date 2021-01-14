program VMMap;

{$R 'VMMap.res' 'VMMap.rc'}

uses
  Windows, Messages, TlHelp32, PsAPI,
  VMQuery in 'VMQuery.pas', Toolhelp in '..\04-ProcessInfo\Toolhelp.pas';

const
  IDD_VMMAP   =   1;
  IDI_VMMAP   = 101;
  IDC_LISTBOX = 100;

const
  ID_REFRESH         = 40001;
  ID_EXPANDREGIONS   = 40002;
  ID_COPYTOCLIPBOARD = 40003;
  
const
  PAGE_WRITECOMBINE = $400;

var
  g_dwProcessId: DWORD = 0;
  g_fExpandRegions: BOOL = FALSE;
  g_Toolhelp: TToolhelp;

  // 简单包装API
function wvsprintf(const Output, Format: PChar; const Arg_List: array of Integer): Integer;
begin
  Result := Windows.wvsprintf(Output, Format, @Arg_List[Low(Arg_List)]);
end;

  // 定位字符串尾
function SeachEnd(const S: PChar): PChar;
begin
  Result := S;
  while (Result^ <> #0) do Inc(Result);
end;

  // 字符串转整数
function StrToInt(const S: string): Integer;
var
  P: PByte;
begin
  Result := 0;
  P := @S[1];
  
  while (P^ <> $00) do
  begin
    if (P^ > $39) or (P^ < $30) then
    begin
      Result := 0;
      Exit;
    end else
    begin
      Result := Result * 10 + (P^ - $30);
      Inc(P);
    end;
  end;

end;

  // 拷贝ListBox内容至剪贴板
procedure CopyControlToClipboard(hWndLB: HWND);
var
  szClipData: array[0..128 * 1024] of Char;
  szLine: array[0..1000] of Char;
  nNum: Integer;
  hClipData: HGLOBAL;
  pClipData: PChar;
  fOk: BOOL;
begin
  // 读取ListBox内容
  szClipData[0] := #0;
  for nNum := 0 to SendMessage(hWndLB, LB_GETCOUNT, 0, 0) - 1 do
  begin
    SendMessage(hWndLB, LB_GETTEXT, nNum, Integer(@szLine));
    lstrcat(szClipData, szLine);
    lstrcat(szClipData, #13#10);
  end;

  // 配置剪贴板内存
  hClipData := GlobalAlloc(GMEM_MOVEABLE or GMEM_DDESHARE, lstrlen(szClipData) + 1);
  pClipData := GlobalLock(hClipData);
  lstrcpy(pClipData, szClipData);

  // 设置剪贴板内容
  OpenClipboard(0);
  EmptyClipboard();
  fOk := (SetClipboardData(CF_TEXT, hClipData) = hClipData);
  CloseClipboard();

  // 检查设置成功否
  if (not fOk) then
  begin
    GlobalFree(hClipData);
    MessageBox(GetActiveWindow(), 'Error putting text on the clipboard', 'VMMap', 0);
  end;
end;

  // 内存状态对应文字
function GetMemStorageText(dwStorage: DWORD): PChar;
begin
  case (dwStorage) of
    MEM_FREE:
      Result := 'Free   ';

    MEM_RESERVE:
      Result := 'Reserve';

    MEM_IMAGE:
      Result := 'Image  ';

    MEM_MAPPED:
      Result := 'Mapped ';
      
    MEM_PRIVATE:
      Result := 'Private';

    else
      Result := 'Unknown';
  end;
end;

  // 保护属性对应文字
function GetProtectText(dwProtect: DWORD; const szBuf: PChar; fShowFlags: BOOL): PChar;
var
  p: PChar;
begin
  case (dwProtect and (not (PAGE_GUARD or PAGE_NOCACHE or PAGE_WRITECOMBINE)) ) of
    PAGE_READONLY:
      p := '-R--';

    PAGE_READWRITE:
      p := '-RW-';

    PAGE_WRITECOPY:
      p := '-RWC';

    PAGE_EXECUTE:
      p := 'E---';

    PAGE_EXECUTE_READ:
      p := 'ER--';

    PAGE_EXECUTE_READWRITE:
      p := 'ERW-';

    PAGE_EXECUTE_WRITECOPY:
      p := 'ERWC';

    PAGE_NOACCESS:
      p := '----';

    else
      p := 'Unknown';
  end;
  lstrcpy(szBuf, p);
  
  if (fShowFlags) then
  begin
    lstrcat(szBuf, ' ');

    if ((dwProtect and PAGE_GUARD) <> 0) then
      lstrcat(szBuf, 'G')
    else
      lstrcat(szBuf, '-');

    if ((dwProtect and PAGE_NOCACHE) <> 0) then
      lstrcat(szBuf, 'N')
    else
      lstrcat(szBuf, '-');

    if ((dwProtect and PAGE_WRITECOMBINE) <> 0) then
      lstrcat(szBuf, 'W')
    else
      lstrcat(szBuf, '-');
  end;

  Result := szBuf;
end;

  // 转换"区域"信息为字符串
procedure ConstructRgnInfoLine(hProcess: THandle; const pVMQ: TVMQuery; const szLine: PChar; nMaxLen: Integer);
var
  nLen: Integer;
  me: TModuleEntry32;
  d: DWORD;
begin
  // 基本信息
  wvsprintf(szLine, '%p     %s  %16u  ',
    [ Integer(pVMQ.pvRgnBaseAddress),
      Integer(GetMemStorageText(pVMQ.dwRgnStorage)),
      pVMQ.RgnSize ]);
      
  if (pVMQ.dwRgnStorage <> MEM_FREE) then
  begin
    wvsprintf(SeachEnd(szLine), '%5u  ', [ pVMQ.dwRgnBlocks ]);
    GetProtectText(pVMQ.dwRgnProtection, SeachEnd(szLine), FALSE);
  end;

  lstrcat(szLine, '     ');

  // 取模块名
  nLen := lstrlen(szLine);
  if (pVMQ.pvRgnBaseAddress <> nil) then
  begin
    me.dwSize := SizeOf(me);
    if g_Toolhelp.ModuleFind_BaseAddr(pVMQ.pvRgnBaseAddress, @me) then
    begin
      lstrcat(@szLine[nLen], me.szExePath);
    end else
    begin
      d := GetMappedFileName(hProcess, pVMQ.pvRgnBaseAddress, szLine + nLen, nMaxLen - nLen);
      if (d = 0) then szLine[nLen] := #0;
    end;
  end;

  // 堆栈空间
  if (pVMQ.fRgnIsAStack) then lstrcat(szLine, 'Thread Stack');
end;

  // 转换"块"信息为字符串
procedure ConstructBlkInfoLine(const pVMQ: TVMQuery; const szLine: PChar; nMaxLen: Integer);
begin
  wvsprintf(szLine, '   %p  %s  %16u         ',
    [ Integer(pVMQ.pvBlkBaseAddress),
      Integer(GetMemStorageText(pVMQ.dwBlkStorage)),
      pVMQ.BlkSize ]);

  if (pVMQ.dwBlkStorage <> MEM_FREE) then
    GetProtectText(pVMQ.dwBlkProtection, SeachEnd(szLine), TRUE);
end;

  // 显示内存信息至ListBox
procedure Refresh(hWndLB: HWND; dwProcessId: DWORD; fExpandRegions: BOOL);
var
  hProcess: THandle;
  fOk: BOOL;
  pvAddress: Pointer;
  vmq: TVMQuery;
  szLine: array[0..1024] of Char;
  dwBlock: DWORD;
begin
  // 初始化ListBox
  SendMessage(hWndLB, LB_RESETCONTENT, 0, 0);
  SendMessage(hWndLB, LB_SETHORIZONTALEXTENT, 300 * LOWORD(GetDialogBaseUnits()), 0);

  // 尝试打开进程
  hProcess := OpenProcess(PROCESS_QUERY_INFORMATION,  FALSE, dwProcessId);
  if (hProcess = 0) then
  begin
    SendMessage(hWndLB, LB_ADDSTRING, 0, Integer(PChar('')));
    SendMessage(hWndLB, LB_ADDSTRING, 0, Integer(PChar('    The process ID identifies a process that is not running')));
    Exit;
  end;

  // 抓取系统快照
  g_Toolhelp.CreateSnapshot(TH32CS_SNAPALL, dwProcessId);

  // 遍历虚拟空间
  SendMessage(hWndLB, WM_SETREDRAW, 0, 0);
  pvAddress := nil;
  repeat
    fOk := VM_Query(hProcess, pvAddress, vmq);

    if (fOk) then
    begin
      // 添加"区域"信息
      ConstructRgnInfoLine(hProcess, vmq, szLine, SizeOf(szLine));
      SendMessage(hWndLB, LB_ADDSTRING, 0, Integer(@szLine));

      // "块"信息
      if (fExpandRegions) then
      begin
        dwBlock := 0;
        while (fOk) and (dwBlock < vmq.dwRgnBlocks) do
        begin
          // 添加"块"信息
          ConstructBlkInfoLine(vmq, szLine, SizeOf(szLine));
          SendMessage(hWndLB, LB_ADDSTRING, 0, Integer(@szLine));

          // 准备下一"块"
          pvAddress := Pointer(DWORD(pvAddress) + vmq.BlkSize);
          Inc(dwBlock);

          // 未超出"区域"
          if (dwBlock < vmq.dwRgnBlocks) then
            fOk := VM_Query(hProcess, pvAddress, vmq);
        end;
      end;

      // 下一"区域"
      pvAddress := Pointer(DWORD(vmq.pvRgnBaseAddress) + vmq.RgnSize);
    end;
  until (not fOk);

  SendMessage(hWndLB, WM_SETREDRAW, 1, 0);
  CloseHandle(hProcess);
end;

  // 对话框WM_INITDIALOG处理
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
var
  szCaption: array[0..MAX_PATH * 2] of Char;
  pe: TProcessEntry32;
begin
  // 设置图标
  SendMessage(hWnd, WM_SETICON, ICON_BIG, LoadIcon(HInstance, MakeIntResource(IDI_VMMAP)));
  SendMessage(hWnd, WM_SETICON, ICON_SMALL, LoadIcon(HInstance, MakeIntResource(IDI_VMMAP)));

  // 修改标题
  pe.dwSize := SizeOf(pe);
  GetWindowText(hWnd, szCaption, SizeOf(szCaption));
  g_Toolhelp.CreateSnapshot(TH32CS_SNAPALL, g_dwProcessId);
  if g_Toolhelp.ProcessFind(g_dwProcessId, @pe) then
    wvsprintf(@szCaption[lstrlen(szCaption)], ' (PID=%u "%s")', [ g_dwProcessId, Integer(@pe.szExeFile) ])
  else
    wvsprintf(@szCaption[lstrlen(szCaption)], ' (PID=%u "%s")', [ g_dwProcessId, Integer(PChar('unknown')) ]);
  SetWindowText(hWnd, szCaption);

  // 最大窗口
  ShowWindow(hWnd, SW_MAXIMIZE);

  // 首次刷新
  Refresh(GetDlgItem(hWnd, IDC_LISTBOX), g_dwProcessId, g_fExpandRegions);

  Result := TRUE;
end;

  // 对话框WM_SIZE处理
procedure Dlg_OnSize(hWnd: HWND; state: UINT; cx, cy: Integer);
begin
  SetWindowPos(GetDlgItem(hWnd, IDC_LISTBOX), 0, 0, 0, cx, cy, SWP_NOZORDER);
end;

  // 对话框WM_COMMAND处理
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
begin
  case (id) of
    IDCANCEL:
      begin
        EndDialog(hWnd, id);
      end;

    ID_REFRESH:
      begin
        Refresh(GetDlgItem(hWnd, IDC_LISTBOX), g_dwProcessId, g_fExpandRegions);
      end;

    ID_EXPANDREGIONS:
      begin
        g_fExpandRegions := not g_fExpandRegions;
        Refresh(GetDlgItem(hWnd, IDC_LISTBOX), g_dwProcessId, g_fExpandRegions);
      end;

    ID_COPYTOCLIPBOARD:
      begin
        CopyControlToClipboard(GetDlgItem(hWnd, IDC_LISTBOX));
      end;
  end;
end;

  // 对话框消息回调
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  Result := FALSE;

  case (uMsg) of
    WM_INITDIALOG:
      Result := SetWindowLong(hWnd, DWL_MSGRESULT, Longint(Dlg_OnInitDialog(hWnd, wParam, lParam))) <> 0;

    WM_COMMAND:
      Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));

    WM_SIZE:
      Dlg_OnSize(hWnd, wParam, LOWORD(lParam), HIWORD(lParam));
  end;
end;

  // 程序主线程入口
begin
  g_Toolhelp := TToolhelp.Create();
  g_Toolhelp.EnableDebugPrivilege(TRUE);

  g_dwProcessId := StrToInt( ParamStr(1) );
  if (g_dwProcessId = 0) then
    g_dwProcessId := GetCurrentProcessId();

  DialogBox(HInstance, MakeIntResource(IDD_VMMAP), 0, @Dlg_Proc);

  g_Toolhelp.EnableDebugPrivilege(FALSE);
  g_Toolhelp.Free;
end.
