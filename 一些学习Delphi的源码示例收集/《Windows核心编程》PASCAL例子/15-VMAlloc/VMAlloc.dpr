program VMAlloc;

{$R 'VMAlloc.res' 'VMAlloc.rc'}

uses Windows, Messages;

const
  IDD_VMALLOC =   1; // 资源ID ~
  IDI_VMALLOC = 101;
  IDC_PAGESIZE       = 100; // 控件ID ~
  IDC_RESERVE        = 101;
  IDC_INDEXTEXT      = 102;
  IDC_INDEX          = 103;
  IDC_USE            = 105;
  IDC_CLEAR          = 106;
  IDC_GARBAGECOLLECT = 107;
  IDC_MEMMAP         = 108;
  MAX_SOMEDATA = 50; // 数组长度

type
  TSomeData = packed record // 数组成员
    fInUse: BOOL;
    bOtherData: array[0..2048 - SizeOf(BOOL) - 1] of Byte;
  end;
  TDataArray = array[0..MAX_SOMEDATA - 1] of TSomeData;
  PDataArray = ^TDataArray;

var
  g_uPageSize: UINT = 0; // 页面长度
  g_pSomeData: PDataArray = nil; // 数组地址
  g_rcMemMap: TRect; // 绘图范围

  // WM_INITDIALOG消息处理
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
var
  szBuf: array[0..10] of Char;
  kSize: DWORD;
begin
  SendMessage(hWnd, WM_SETICON, ICON_BIG, LoadIcon(HInstance, MakeIntResource(IDI_VMALLOC)));
  SendMessage(hWnd, WM_SETICON, ICON_SMALL, LoadIcon(HInstance, MakeIntResource(IDI_VMALLOC)));

  EnableWindow(GetDlgItem(hWnd, IDC_INDEXTEXT), FALSE);
  EnableWindow(GetDlgItem(hWnd, IDC_INDEX), FALSE);
  EnableWindow(GetDlgItem(hWnd, IDC_USE), FALSE);
  EnableWindow(GetDlgItem(hWnd, IDC_CLEAR), FALSE);
  EnableWindow(GetDlgItem(hWnd, IDC_GARBAGECOLLECT), FALSE);

  // 绘图范围
  GetWindowRect(GetDlgItem(hWnd, IDC_MEMMAP), g_rcMemMap);
  MapWindowPoints(0, hWnd, g_rcMemMap, 2);
  DestroyWindow(GetDlgItem(hWnd, IDC_MEMMAP));

  kSize := g_uPageSize div 1024;
  wvsprintf(szBuf, '%d KB', @kSize);
  SetDlgItemText(hWnd, IDC_PAGESIZE, szBuf);

  SetDlgItemInt(hWnd, IDC_INDEX, 0, FALSE);

  Result :=TRUE;
end;

  // WM_DESTROY消息处理
procedure Dlg_OnDestroy(hWnd: HWND);
begin
  if (g_pSomeData <> nil) then VirtualFree(g_pSomeData, 0, MEM_RELEASE);
end;

  // 反提交所有无用页面
procedure GarbageCollect(pvBase: Pointer; dwNum, dwStructSize: DWORD);
var
  uMaxPages, uPage, uIndex, uIndexLast: UINT;
  fAnyAllocsInThisPage: BOOL;
  mbi: TMemoryBasicInformation;
begin
  uMaxPages := dwNum * dwStructSize div g_uPageSize; // 疑问: 如果除不尽呢 ??
  uPage := 0;
  
  while (uPage < uMaxPages) do // 遍历各页
  begin
    fAnyAllocsInThisPage := FALSE;
    uIndex := uPage * g_uPageSize div dwStructSize;
    uIndexLast := uIndex + g_uPageSize div dwStructSize;

    while (uIndex < uIndexLast) do // 遍历组员
    begin
      // 查询第uIndex个结构是否正使用
      VirtualQuery(@g_pSomeData[uIndex], mbi, SizeOf(mbi)); // **
      fAnyAllocsInThisPage := (mbi.State = MEM_COMMIT) and PBOOL(DWORD(pvBase) + dwStructSize * uIndex)^;
      if (fAnyAllocsInThisPage) then Break;

      Inc(uIndex);
    end;

    // 本页没有任何组员在使用, 则反提交
    if (not fAnyAllocsInThisPage) then
      VirtualFree(@g_pSomeData[uIndexLast - 1], dwStructSize, MEM_DECOMMIT);

    Inc(uPage);
  end;
end;

  // WM_COMMAND消息处理
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; CodeNotify: UINT);
var
  uIndex: UINT;
  mbi: TMemoryBasicInformation;
  fOk: BOOL;
begin
  case (id) of
    IDCANCEL:
      begin
        EndDialog(hWnd, id);
      end;

    IDC_RESERVE:
      begin
        // 保留整个数组内存
        g_pSomeData := VirtualAlloc(nil, MAX_SOMEDATA * SizeOf(TSomeData), MEM_RESERVE, PAGE_READWRITE);

        EnableWindow(GetDlgItem(hWnd, IDC_RESERVE), FALSE);
        EnableWindow(GetDlgItem(hWnd, IDC_INDEXTEXT), TRUE);
        EnableWindow(GetDlgItem(hWnd, IDC_INDEX), TRUE);
        EnableWindow(GetDlgItem(hWnd, IDC_USE), TRUE);
        EnableWindow(GetDlgItem(hWnd, IDC_GARBAGECOLLECT), TRUE);
        SetFocus(GetDlgItem(hWnd, IDC_INDEX));

        InvalidateRect(hWnd, @g_rcMemMap, FALSE);
      end;

    IDC_INDEX:
      begin
        // 并非Edit内容变化
        if (CodeNotify <> EN_CHANGE) then Exit;

        // 根据索引设置按钮
        uIndex := GetDlgItemInt(hWnd, id, PBOOL(nil)^, FALSE);
        if (g_pSomeData <> nil) and (uIndex <= MAX_SOMEDATA - 1) then
        begin
          VirtualQuery(@g_pSomeData[uIndex], mbi, SizeOf(mbi));
          fOk := (mbi.State = MEM_COMMIT);
          if fOk then fOk := g_pSomeData[uIndex].fInUse;

          EnableWindow(GetDlgItem(hWnd, IDC_USE), not fOk);
          EnableWindow(GetDlgItem(hWnd, IDC_CLEAR), fOk);
        end else
        begin
          EnableWindow(GetDlgItem(hWnd, IDC_USE), FALSE);
          EnableWindow(GetDlgItem(hWnd, IDC_CLEAR), FALSE);
        end
      end;

    IDC_USE:
      begin
        uIndex := GetDlgItemInt(hWnd, IDC_INDEX, PBOOL(nil)^, FALSE);
        if (uIndex <= MAX_SOMEDATA - 1) then
        begin
          // 提交指定组员(所在页面), 并为组员标上"正在使用"
          VirtualAlloc(@g_pSomeData[uIndex], SizeOf(TSomeData), MEM_COMMIT, PAGE_READWRITE);
          g_pSomeData[uIndex].fInUse := TRUE;

          EnableWindow(GetDlgItem(hWnd, IDC_USE), FALSE);
          EnableWindow(GetDlgItem(hWnd, IDC_CLEAR), TRUE);
          SetFocus(GetDlgItem(hWnd, IDC_CLEAR));

          InvalidateRect(hWnd, @g_rcMemMap, FALSE);

          // 注1: 提交小块结构内存,实际上会导致其所在的整个页面被提交.
          // 注2: 新提交的页面会被系统清零,故其他组员的fInUse均为FALSE
        end;
      end;

    IDC_CLEAR:
      begin
        uIndex := GetDlgItemInt(hWnd, IDC_INDEX, PBOOL(nil)^, FALSE);
        if (uIndex <= MAX_SOMEDATA - 1) then
        begin
          // 去除指定组员"正在使用"标识
          g_pSomeData[uIndex].fInUse := FALSE;

          EnableWindow(GetDlgItem(hWnd, IDC_USE), TRUE);
          EnableWindow(GetDlgItem(hWnd, IDC_CLEAR), FALSE);
          SetFocus(GetDlgItem(hWnd, IDC_USE));
        end;
      end;

    IDC_GARBAGECOLLECT:
      begin
        // 回收无用内存
        GarbageCollect(g_pSomeData, MAX_SOMEDATA, SizeOf(TSomeData));

        // 重绘内存状态
        InvalidateRect(hWnd, @g_rcMemMap, FALSE);
      end;
  end;
end;

  // WM_PAINT消息处理
procedure Dlg_OnPaint(hWnd: HWND);
var
  ps: TPaintStruct;
  uMaxPages, uMemMapWidth, uPage, uIndex, uIndexLast: UINT;
  mbi: TMemoryBasicInformation;
  nBrush: Integer;
begin
  BeginPaint(hWnd, ps);

  uMaxPages := MAX_SOMEDATA * SizeOf(TSomeData) div g_uPageSize; // 疑问: 不考虑除不尽 ??
  uMemMapWidth := g_rcMemMap.Right - g_rcMemMap.Left;

  if (g_pSomeData = nil) then
  begin
    // 还未保留数组内存, 只画个框

    Rectangle(ps.hdc, g_rcMemMap.Left, g_rcMemMap.Top,
      g_rcMemMap.Right - Integer(uMemMapWidth mod uMaxPages), g_rcMemMap.Bottom);
  end else
  begin
    // 遍历数组内存, 依其状态画图

    uPage := 0;
    while (uPage < uMaxPages) do // 遍历各页
    begin
      uIndex := uPage * g_uPageSize div SizeOf(TSomeData);
      uIndexLast := uIndex + g_uPageSize div SizeOf(TSomeData);

      while (uIndex < uIndexLast) do // 遍历组员
      begin
        VirtualQuery(@g_pSomeData[uIndex], mbi, SizeOf(mbi));

        case (mbi.State) of
          MEM_FREE:    nBrush := WHITE_BRUSH;
          MEM_RESERVE: nBrush := GRAY_BRUSH;
          MEM_COMMIT:  nBrush := BLACK_BRUSH;
          else nBrush := 0; // WHITE_BRUSH = 0;
        end;

        SelectObject(ps.hdc, GetStockObject(nBrush));
        Rectangle(ps.hdc,
          g_rcMemMap.Left + Integer(uMemMapWidth div uMaxPages * uPage),
          g_rcMemMap.Top,
          g_rcMemMap.Left + Integer(uMemMapWidth div uMaxPages * (uPage + 1)),
          g_rcMemMap.Bottom);

        Inc(uIndex);
      end;

      Inc(uPage);
    end;
  end;

  EndPaint(hWnd, ps);
end;

  // 对话框回调
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  Result := TRUE;

  case (uMsg) of
    WM_INITDIALOG:
      Result := BOOL(SetWindowLong(hWnd,
        DWL_MSGRESULT, Longint(Dlg_OnInitDialog(hWnd, wParam, lParam))));

    WM_COMMAND:
      Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));

    WM_PAINT:
      Dlg_OnPaint(hWnd);

    WM_DESTROY:
      Dlg_OnDestroy(hWnd);

    else Result := FALSE;  
  end;
end;

  // 程序入口点
var
  si: TSystemInfo;
begin
  GetSystemInfo(si);
  g_uPageSize := si.dwPageSize;

  DialogBox(HInstance, MakeIntResource(IDD_VMALLOC), 0, @Dlg_Proc);
end.
