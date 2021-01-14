
// Module name: VMAlloc.C ->> VMAlloc.dpr
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

program VMAlloc;

{$R 'VMAlloc.res' 'VMAlloc.rc'}

uses
  Windows, Messages,
  Other in '..\Other.pas', CmnHdr in '..\CmnHdr.pas', WindowsX in '..\WindowsX.pas';

const
  IDD_VMALLOC        =  1;
  IDC_PAGESIZE       =  100;
  IDC_RESERVE        =  101;
  IDI_VMALLOC        =  101;
  IDC_INDEXTEXT      =  102;
  IDC_INDEX          =  103;
  IDC_INDEXSCRL      =  104;
  IDC_USE            =  105;
  IDC_CLEAR          =  106;
  IDC_GARBAGECOLLECT =  107;
  IDC_MEMMAP         =  108;

type
  PSomeData = ^TSomeData;
  TSomeData = packed record
    fAllocated: BOOL;
    bOtherData: array[1..2048-SizeOf(BOOL)] of Byte;
  end;

type
  PDataArray = ^TDataArray;
  TDataArray = array[0..0] of TSomeData;

const
  MAX_SOMEDATA = 50;

var
  g_uPageSize: UINT = 0;
  g_pSomeData: PDataArray = nil;
  g_rcMemMap: TRect;

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
var
  szBuf: array[0..10] of Char;
begin
  chSETDLGICONS(hWnd, IDI_VMALLOC, IDI_VMALLOC);

  EnableWindow(GetDlgItem(hWnd, IDC_INDEXTEXT), FALSE);
  EnableWindow(GetDlgItem(hWnd, IDC_INDEX), FALSE);
  ScrollBar_SetRange(GetDlgItem(hWnd, IDC_INDEXSCRL), 0, MAX_SOMEDATA - 1, FALSE);
  ScrollBar_SetPos(GetDlgItem(hWnd, IDC_INDEXSCRL), 0,TRUE);
  EnableWindow(GetDlgItem(hWnd, IDC_INDEXSCRL), FALSE);
  EnableWindow(GetDlgItem(hWnd, IDC_USE), FALSE);
  EnableWindow(GetDlgItem(hWnd, IDC_CLEAR), FALSE);
  EnableWindow(GetDlgItem(hWnd, IDC_GARBAGECOLLECT), FALSE);

  GetWindowRect(GetDlgItem(hWnd, IDC_MEMMAP), g_rcMemMap);
  MapWindowPoints(0, hWnd, g_rcMemMap, 2);
  DestroyWindow(GetDlgItem(hWnd, IDC_MEMMAP));

  SetDlgItemInt(hWnd, IDC_INDEX, 0, FALSE);

  _wvsprintf(szBuf, '%d KB', [ g_uPageSize shr 10 ]);
  SetDlgItemText(hWnd, IDC_PAGESIZE, szBuf);

  Result := TRUE;
end;

  // WM_DESTROY
procedure Dlg_OnDestroy(hWnd: HWND);
begin
  if (g_pSomeData <> nil) then VirtualFree(g_pSomeData, 0, MEM_RELEASE);
end;

  // WM_COMMAND
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
var
  uIndex, uIndexLast, uPage, uMaxPages: UINT;
  fTranslated, fOk, fAnyAllocs: BOOL;
  MemoryBasicInfo: TMemoryBasicInformation;
begin
  case (id) of
    IDC_RESERVE: // 保留
      begin
        g_pSomeData := VirtualAlloc(nil, MAX_SOMEDATA * SizeOf(TSomeData), MEM_RESERVE, PAGE_READWRITE);

        EnableWindow(GetDlgItem(hWnd, IDC_RESERVE), FALSE);
        EnableWindow(GetDlgItem(hWnd, IDC_INDEXTEXT), TRUE);
        EnableWindow(GetDlgItem(hWnd, IDC_INDEX), TRUE);
        EnableWindow(GetDlgItem(hWnd, IDC_INDEXSCRL), TRUE);
        EnableWindow(GetDlgItem(hWnd, IDC_USE), TRUE);
        EnableWindow(GetDlgItem(hWnd, IDC_GARBAGECOLLECT), TRUE);
        SetFocus(GetDlgItem(hWnd, IDC_INDEX));

        InvalidateRect(hWnd, @g_rcMemMap, TRUE);
      end;

    IDC_INDEX: // 下标
      begin
        if (codeNotify <> EN_CHANGE) then Exit;

        uIndex := GetDlgItemInt(hWnd, id, fTranslated, FALSE);
        if (g_pSomeData = nil) or (uIndex >= MAX_SOMEDATA) then fTranslated := FALSE;

        if (fTranslated) then
        begin
          VirtualQuery(@g_pSomeData[uIndex], MemoryBasicInfo, SizeOf(MemoryBasicInfo));
          fOk := (MemoryBasicInfo.State = MEM_COMMIT);
          if (fOk) then fOk := g_pSomeData[uIndex].fAllocated;

          EnableWindow(GetDlgItem(hWnd, IDC_USE), not fOk);
          EnableWindow(GetDlgItem(hWnd, IDC_CLEAR), fOk);
          ScrollBar_SetPos(GetDlgItem(hWnd, IDC_INDEXSCRL), uIndex, TRUE);
        end else
        begin
          EnableWindow(GetDlgItem(hWnd, IDC_USE), FALSE);
          EnableWindow(GetDlgItem(hWnd, IDC_CLEAR), FALSE);
        end;
      end;

    IDC_USE: // 占用
      begin
        uIndex := GetDlgItemInt(hWnd, IDC_INDEX, fTranslated, FALSE);
        if (uIndex >= MAX_SOMEDATA) then fTranslated := FALSE;

        if (fTranslated) then
        begin
          VirtualAlloc(@g_pSomeData[uIndex], SizeOf(TSomeData), MEM_COMMIT, PAGE_READWRITE);
          g_pSomeData[uIndex].fAllocated := TRUE;

          EnableWindow(GetDlgItem(hWnd, IDC_USE), FALSE);
          EnableWindow(GetDlgItem(hWnd, IDC_CLEAR), TRUE);
          SetFocus(GetDlgItem(hWnd, IDC_CLEAR));

          InvalidateRect(hWnd, @g_rcMemMap, FALSE);
        end;
      end;

    IDC_CLEAR: // 丢弃
      begin
        uIndex := GetDlgItemInt(hWnd, IDC_INDEX, fTranslated, FALSE);
        if (uIndex >= MAX_SOMEDATA) then fTranslated := FALSE;

        if (fTranslated) then
        begin
          g_pSomeData[uIndex].fAllocated := FALSE;

          EnableWindow(GetDlgItem(hWnd, IDC_USE), TRUE);
          EnableWindow(GetDlgItem(hWnd, IDC_CLEAR), FALSE);
          
          SetFocus(GetDlgItem(hWnd, IDC_USE));
        end;
      end;

    IDC_GARBAGECOLLECT: // 回收
      begin
        uMaxPages := MAX_SOMEDATA * SizeOf(TSomeData) div g_uPageSize;
        for uPage := 0 to uMaxPages - 1 do
        begin
          fAnyAllocs := FALSE; // 均未占用
          
          uIndex := uPage * g_uPageSize div SizeOf(TSomeData);
          uIndexLast := uIndex + g_uPageSize div SizeOf(TSomeData);

          while (uIndex < uIndexLast) do
          begin
            VirtualQuery(@g_pSomeData[uIndex], MemoryBasicInfo, SizeOf(MemoryBasicInfo));
            if (MemoryBasicInfo.State = MEM_COMMIT) and (g_pSomeData[uIndex].fAllocated) then
            begin
              fAnyAllocs := TRUE;
              Break;
            end;
                    
            Inc(uIndex);
          end;

          if (fAnyAllocs = FALSE) then
            VirtualFree(@g_pSomeData[uIndexLast - 1], SizeOf(TSomeData), MEM_DECOMMIT);
        end;

        InvalidateRect(hWnd, @g_rcMemMap, FALSE);
      end;

    IDCANCEL: // 关闭
      begin
        EndDialog(hWnd, id);
      end;
   end;
end;

  // WM_HSCROLL
procedure Dlg_OnHScroll(hWnd, hWndCtl: HWND; code: UINT; nPos: Integer);
var
  nScrlPos: Integer;
begin
  if (GetDlgItem(hWnd, IDC_INDEXSCRL) <> hWndCtl) then Exit;

  nScrlPos := ScrollBar_GetPos(hWndCtl);
  case (code) of
    SB_LINELEFT  : Dec(nScrlPos);
    SB_LINERIGHT : Inc(nScrlPos);
    SB_PAGELEFT  : Dec(nScrlPos, g_uPageSize div SizeOf(TSomeData));
    SB_PAGERIGHT : Inc(nScrlPos, g_uPageSize div SizeOf(TSomeData));
    SB_THUMBTRACK: nScrlPos := nPos;
    SB_LEFT      : nScrlPos := 0;
    SB_RIGHT     : nScrlPos := MAX_SOMEDATA - 1;
  end;

  if (nScrlPos < 0) then
    nScrlPos := 0
  else
    if (nScrlPos >= MAX_SOMEDATA) then
      nScrlPos := MAX_SOMEDATA - 1;

  ScrollBar_SetPos(hWndCtl, nScrlPos, TRUE);
  SetDlgItemInt(hWnd, IDC_INDEX, nScrlPos, TRUE);
end;

  // WM_PAINT
procedure Dlg_OnPaint(hWnd: HWND);
var
  uPage, uIndex, uIndexLast, uMemMapWidth, uMaxPages: UINT;
  MemoryBasicInfo: TMemoryBasicInformation;
  ps: TPaintStruct;
begin
  uMaxPages := MAX_SOMEDATA * SizeOf(TSomeData) div g_uPageSize;

  BeginPaint(hWnd, ps);

  if (g_pSomeData = nil) then
  begin
    Rectangle(ps.hdc, g_rcMemMap.Left, g_rcMemMap.Top, g_rcMemMap.Right, g_rcMemMap.Bottom);
  end else
  begin
    for uPage := 0 to uMaxPages - 1 do
    begin
      uIndex := uPage * g_uPageSize div SizeOf(TSomeData);
      uIndexLast := uIndex + g_uPageSize div SizeOf(TSomeData);

      while (uIndex < uIndexLast) do
      begin
        VirtualQuery(@g_pSomeData[uIndex], MemoryBasicInfo, SizeOf(MemoryBasicInfo));
        case (MemoryBasicInfo.State) of
          MEM_FREE:    SelectObject(ps.hdc, GetStockObject(WHITE_BRUSH));
          MEM_RESERVE: SelectObject(ps.hdc, GetStockObject(GRAY_BRUSH));
          MEM_COMMIT:  SelectObject(ps.hdc, GetStockObject(BLACK_BRUSH));
        end;

        uMemMapWidth := g_rcMemMap.Right - g_rcMemMap.Left;
        Rectangle(ps.hdc,
          g_rcMemMap.Left + Integer(uMemMapWidth div uMaxPages * uPage),
          g_rcMemMap.Top,
          g_rcMemMap.Left + Integer(uMemMapWidth div uMaxPages * (uPage + 1)),
          g_rcMemMap.Bottom);
              
        Inc(uIndex);
      end;
    end; // END: for .. 
  end;

  EndPaint(hWnd, ps);
end;

  // 对话回调
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

    WM_PAINT:
      begin
        Dlg_OnPaint(hWnd);
        Result := TRUE;
      end;

    WM_DESTROY:
      begin
        Dlg_OnDestroy(hWnd);
        Result := TRUE;
      end;

    else Result := FALSE;  
  end;
end;

  // 程序入口
var
  SystemInfo: TSystemInfo;
begin
  chWARNIFUNICODEUNDERWIN95();

  GetSystemInfo(SystemInfo);
  g_uPageSize := SystemInfo.dwPageSize;

  DialogBox(HInstance, MakeIntResource(IDD_VMALLOC), 0, @Dlg_Proc);
end.
