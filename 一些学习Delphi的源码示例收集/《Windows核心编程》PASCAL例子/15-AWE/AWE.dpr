program AWE;

{$R 'AWE.res' 'AWE.rc'}

uses
  Windows, Messages, AddrWindow in 'AddrWindow.pas';

const
  IDD_AWE = 101; // 资源ID
  IDI_AWE = 104;
  IDC_WINDOW0TEXT    = 1006; // 控件ID
  IDC_WINDOW0STORAGE = 1007;
  IDC_WINDOW1STORAGE = 1008;
  IDC_WINDOW1TEXT    = 1009;
  g_nChars = 1024; // 字符串长度

var
  g_aw: array[0..1] of TAddrWindow; // 2 memory address windows
  g_aws: array[0..1] of TAddrWindowStorage; // 2 storage blocks

  // WM_INITDIALOG处理
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
var
  n, id: Integer;
  hWndCB: DWORD; // HWND
begin
  Result := TRUE;
  SendMessage(hWnd, WM_SETICON, ICON_BIG, LoadIcon(HInstance, MakeIntResource(IDI_AWE)));
  SendMessage(hWnd, WM_SETICON, ICON_SMALL, LoadIcon(HInstance, MakeIntResource(IDI_AWE)));

  // 保留地址窗口
  g_aw[0].AW_Create(g_nChars);
  g_aw[1].AW_Create(g_nChars);

  // 分配物理 RAM
  if (g_aws[0].AWS_Allocate(g_nChars) = FALSE) or
     (g_aws[1].AWS_Allocate(g_nChars) = FALSE) then
  begin
    MessageBox(0, 'Failed to allocate RAM.'#13#10'Most likely reason: you are not granted the Lock Pages in Memory user right.', 'AWE', MB_OK);
    EndDialog(hWnd, IDCANCEL);
    Exit;
  end;

  // 写第一块 RAM
  g_aws[0].AWS_MapStorage(g_aw[0]);
  lstrcpy(g_aw[0].AW_Pointer, 'Text in Storage 0');

  // 写第二块 RAM
  g_aws[1].AWS_MapStorage(g_aw[0]);
  lstrcpy(g_aw[0].AW_Pointer, 'Text in Storage 1');

  // 初始化子控件
  for n := 0 to 1 do
  begin
    // 获取句柄
    if (n = 0) then id := IDC_WINDOW0STORAGE else id := IDC_WINDOW1STORAGE;
    hWndCB := GetDlgItem(hWnd, id);

    // 添加项目
    SendMessage(hWndCB, CB_ADDSTRING, 0, LongInt(PChar('No storage')));
    SendMessage(hWndCB, CB_ADDSTRING, 0, LongInt(PChar('Storage 0')));
    SendMessage(hWndCB, CB_ADDSTRING, 0, LongInt(PChar('Storage 1')));

    // 通知改变
    SendMessage(hWndCB, CB_SETCURSEL, n + 1, 0);
    SendMessage(hWnd, WM_COMMAND, MakeWParam(id, CBN_SELCHANGE), hWndCB);

    // 限制长度
    if (n = 0) then
      SendMessage(GetDlgItem(hWnd, IDC_WINDOW0TEXT), EM_LIMITTEXT, g_nChars, 0)
    else
      SendMessage(GetDlgItem(hWnd, IDC_WINDOW1TEXT), EM_LIMITTEXT, g_nChars, 0);
  end;
end;

  // WM_COMMAND处理
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
var
  nWindow, nStorage: Integer;
  hWndText: DWORD; // HWND
  mbi: TMemoryBasicInformation;
begin
  case (id) of
    IDCANCEL:
      begin
        EndDialog(hWnd, id); // 结束模态对话框
      end;

    IDC_WINDOW0STORAGE,
    IDC_WINDOW1STORAGE:
      if (codeNotify = CBN_SELCHANGE) then // ComboBox选项改变
      begin
        // 当前操作地址窗口
        if (id = IDC_WINDOW0STORAGE) then nWindow := 0 else nWindow := 1;
        nStorage := SendMessage(hWndCtl, CB_GETCURSEL, 0, 0) - 1;

        // 选中'No storage'
        // 或没有项目被选中
        if (nStorage = -1) then
        begin
          g_aw[nWindow].AW_UnmapStorage(); // 取消映射
        end else
        begin
          if (g_aws[nStorage].AWS_MapStorage(g_aw[nWindow]) = FALSE) then // 尝试映射
          begin
            g_aw[nWindow].AW_UnmapStorage();
            SendMessage(hWndCtl, CB_SETCURSEL, 0, 0);
            MessageBox(0, 'This storage can be mapped only once.', 'AWE', MB_OK);
          end;
        end;

        // 地址窗口对应Edit
        if (nWindow = 0) then
          hWndText := GetDlgItem(hWnd, IDC_WINDOW0TEXT)
        else
          hWndText := GetDlgItem(hWnd, IDC_WINDOW1TEXT);

        // 查询地址窗口状态 (注: 若为MEM_RESERVE则还未映射)
        VirtualQuery(g_aw[nWindow].AW_Pointer, mbi, SizeOf(TMemoryBasicInformation));
        if (mbi.State = MEM_COMMIT) then
        begin
          EnableWindow(hWndText, TRUE);
          SetWindowText(hWndText, g_aw[nWindow].AW_Pointer);
        end else
        begin
          EnableWindow(hWndText, FALSE);
          SetWindowText(hWndText, '(No storage)');
        end;
      end;

    IDC_WINDOW0TEXT,
    IDC_WINDOW1TEXT:
      if (codeNotify = EN_CHANGE) then // Edit内容改变
      begin
        if (id = IDC_WINDOW0TEXT) then nWindow := 0 else nWindow := 1;
        GetWindowText(hWndCtl, g_aw[nWindow].AW_Pointer, g_nChars); // 保存至RAM
      end;
  end;
end;

  // 对话框回调
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  case (uMsg) of
    WM_INITDIALOG:
      begin
        Result := BOOL( SetWindowLong(hWnd, DWL_MSGRESULT,
          Longint(Dlg_OnInitDialog(hWnd, wParam, lParam))) );
      end;

    WM_COMMAND:
      begin
        Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));
        Result := TRUE;
      end;

    else Result := FALSE;
  end;
end;

  // 程序入口
var
  vi: TOSVersionInfo;
begin
  // 判断系统
  vi.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  GetVersionEx(vi);
  if (vi.dwPlatformId <> VER_PLATFORM_WIN32_NT) and (vi.dwMajorVersion < 5) then
  begin
    MessageBox(0, 'This application requires features present in Windows 2000.', 'AWE', MB_OK);
    Exit;
  end;

  // 定位函数
  if (Initialize_AWE() = FALSE) then
  begin
    MessageBox(0, 'The fixed position function failure.', 'AWE', MB_OK);
    Exit;
  end;

  // 建立对象
  g_aw[0] := TAddrWindow.Create();
  g_aw[1] := TAddrWindow.Create();
  g_aws[0] := TAddrWindowStorage.Create();
  g_aws[1] := TAddrWindowStorage.Create();

  // 显示界面
  DialogBox(HInstance, MakeIntResource(IDD_AWE), 0, @Dlg_Proc);

  // 释放对象
  g_aw[0].Free;
  g_aw[1].Free;
  g_aws[0].Free;
  g_aws[1].Free;
end.
