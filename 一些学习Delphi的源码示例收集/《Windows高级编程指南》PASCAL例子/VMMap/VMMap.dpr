
// Module name: VMMap.C ->> VMMap.dpr
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

program VMMap;

{$R 'VMMap.res' 'VMMap.rc'}

uses
  Windows, Messages, VMQuery in 'VMQuery.pas',
  Other in '..\Other.pas', CmnHdr in '..\CmnHdr.pas', WindowsX in '..\WindowsX.pas';

const
  g_szModName = 'VMMap';
  IDD_VMMAP   =    1;
  IDC_LISTBOX =  100;
  IDI_VMMAP   =  101;

{$Define CopyToClipBoard}

{$IfDef CopyToClipBoard}
  // ListBox -> 剪贴板
procedure CopyControlToClipboard(hWnd: HWND);
var
  nCount, nNum: Integer;
  szClipData: array[0..20000] of Char;
  szLine: array[0..1000] of Char;
  hClipData: HGLOBAL;
  lpClipData: LPTSTR;
  fOk: BOOL;
begin
  szClipData[0] := #0;
  nCount := ListBox_GetCount(hWnd);
  for nNum := 0 to nCount - 1 do
  begin
    ListBox_GetText(hWnd, nNum, szLine);
    lstrcat(szClipData, szLine);
    lstrcat(szClipData, #13#10);
  end;

  hClipData := GlobalAlloc(GMEM_MOVEABLE or GMEM_DDESHARE, SizeOf(Char) * (lstrlen(szClipData) + 1));
  lpClipData := GlobalLock(hClipData);
  lstrcpy(lpClipData, szClipData);

  OpenClipboard(0);
  EmptyClipboard();
{$IfDef UniCode}
  fOk := SetClipboardData(CF_UNICODETEXT, hClipData) = hClipData;
{$Else}
  fOk := SetClipboardData(CF_TEXT, hClipData) = hClipData;
{$EndIf}
  CloseClipboard();

  if (fOk = FALSE) then
  begin
    GlobalFree(hClipData);
    chMB('Error putting text on the clipboard', g_szModName, MB_OK or MB_ICONINFORMATION);
  end;
end;
{$EndIf}

  // 页面状态属性
function GetMemStorageText(dwStorage: DWORD): LPCTSTR;
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

  // 页面保护属性
function GetProtectText(dwProtect: DWORD; const szBuf: LPTSTR; fShowFlags: BOOL): LPTSTR;
begin
  case ( dwProtect and (not(PAGE_GUARD or PAGE_NOCACHE)) ) of
    PAGE_READONLY:
      Result := '-R--';

    PAGE_READWRITE:
      Result := '-RW-';

    PAGE_WRITECOPY:
      Result := '-RWC';

    PAGE_EXECUTE:
      Result := 'E---';

    PAGE_EXECUTE_READ:
      Result := 'ER--';

    PAGE_EXECUTE_READWRITE:
      Result := 'ERW-';

    PAGE_EXECUTE_WRITECOPY:
      Result := 'ERWC';

    PAGE_NOACCESS:
      Result := '----';

    else
      Result := 'Unknown';
  end;
  lstrcpy(szBuf, Result);

  if (fShowFlags) then
  begin
    lstrcat(szBuf, ' ');
    lstrcat(szBuf, IfThen(dwProtect and PAGE_GUARD <> 0, 'G', '-'));
    lstrcat(szBuf, IfThen(dwProtect and PAGE_NOCACHE <> 0, 'N', '-'));
  end;

  Result := szBuf;
end;

  // 区域信息 ->> szLine
procedure ConstructRgnInfoLine(var pVMQ: TVMQuery; const szLine: LPTSTR; nMaxLen: Integer);
var
  nLen: Integer;
begin
  _wvsprintf(szLine, '%08X     %s  %10u  ',
    [ DWORD(pVMQ.pvRgnBaseAddress), DWORD(GetMemStorageText(pVMQ.dwRgnStorage)), pVMQ.dwRgnSize ] );

  if (pVMQ.dwRgnStorage <> MEM_FREE) then
  begin
    _wvsprintf(StrChr(szLine, #0), '%5u  ', [ pVMQ.dwRgnBlocks ]);
    GetProtectText(pVMQ.dwRgnProtection, StrChr(szLine, #0), FALSE);
  end;

  lstrcat(szLine, '     ');

  nLen := lstrlen(szLine);
  if (pVMQ.pvRgnBaseAddress <> nil) then GetModuleFileName(DWORD(pVMQ.pvRgnBaseAddress), szLine + nLen, nMaxLen - nLen);

  if (DWORD(pVMQ.pvRgnBaseAddress) = GetProcessHeap()) then lstrcat(szLine, 'Default Process Heap');
  if (pVMQ.fRgnIsAStack) then lstrcat(szLine, 'Thread Stack');
end;

  // 块信息 ->> szLine
procedure ConstructBlkInfoLine(var pVMQ: TVMQuery; const szLine: LPTSTR; nMaxLen: Integer);
begin
  _wvsprintf(szLine, '   %08X  %s  %10u         ',
    [ DWORD(pVMQ.pvBlkBaseAddress), DWORD(GetMemStorageText(pVMQ.dwBlkStorage)), pVMQ.dwBlkSize ]);

  if (pVMQ.dwBlkStorage <> MEM_FREE) then GetProtectText(pVMQ.dwBlkProtection, StrChr(szLine, #0), TRUE);
end;

  // WM_SIZE
procedure Dlg_OnSize(hWnd: HWND; state: UINT; cx, cy: Integer);
begin
  SetWindowPos(GetDlgItem(hWnd, IDC_LISTBOX), 0, 0, 0, cx, cy, SWP_NOZORDER);
end;

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
var
  hWndLB: DWORD; // HWND
  pvAddress: Pointer;
  szLine: array[0..200] of Char;
  rc: TRect;
  dwBlock: DWORD;
  VMQ: TVMQuery;
begin
  chSETDLGICONS(hWnd, IDI_VMMAP, IDI_VMMAP);

  hWndLB := GetDlgItem(hWnd, IDC_LISTBOX);
  ListBox_SetHorizontalExtent(hWndLB, 150 * LOWORD(GetDialogBaseUnits()));
  GetClientRect(hWnd, rc);
  SetWindowPos(hWndLB, 0, 0, 0, rc.Right, rc.Bottom, SWP_NOZORDER);

  pvAddress := nil;
  Result := TRUE;
  while (Result) do
  begin
    Result := VM_Query(pvAddress, VMQ);

    if (Result) then
    begin
      ConstructRgnInfoLine(VMQ, szLine, SizeOf(szLine));
      ListBox_AddString(hWndLB, szLine);
      
{$IfNDef NoExpandRegions}
      dwBlock := 0;
      while (Result) and (dwBlock < VMQ.dwRgnBlocks) do
      begin
        ConstructBlkInfoLine(VMQ, szLine, SizeOf(szLine));
        ListBox_AddString(hWndLB, szLine);

        Inc(dwBlock);

        if (dwBlock < VMQ.dwRgnBlocks) then
        begin
          Inc(PByte(pvAddress), VMQ.dwBlkSize);
          Result := VM_Query(pvAddress, VMQ);
        end;
      end;
{$EndIf}

      pvAddress := Pointer(DWORD(VMQ.pvRgnBaseAddress) + VMQ.dwRgnSize);
    end;
  end;

{$IfDef CopyToClipBoard}
   CopyControlToClipboard(hWndLB);
{$EndIf}

  Result := TRUE;
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

    WM_SIZE:
      begin
        Dlg_OnSize(hWnd, wParam, LOWORD(lParam), HIWORD(lParam));
        Result := TRUE;
      end;

    else
      Result := FALSE;
  end;
end;

  // 程序入口
begin
  chWARNIFUNICODEUNDERWIN95();
  DialogBox(HInstance, MakeIntResource(IDD_VMMAP), 0, @Dlg_Proc);
end.
