
// Module name: SprMrkt.C ->> SprMrkt.dpr
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

program SprMrkt;

{$R 'SprMrkt.res' 'SprMrkt.rc'}

uses
  Windows, Messages,
  Other in '..\Other.pas', CmnHdr in '..\CmnHdr.pas', WindowsX in '..\WindowsX.pas';

const
  IDD_SPRMRKT              =    1;
  IDC_MAXOCCUPANCY         =  100;
  IDC_TIMEOPEN             =  101;
  IDI_SPRMRKT              =  101;
  IDC_NUMCOUNTERS          =  102;
  IDC_SHOPPERCREATIONDELAY =  103;
  IDC_DELAYTOGETIN         =  104;
  IDC_TIMETOSHOP           =  105;
  IDC_WAITDELICNTR         =  106;
  IDC_TIMEATDELICNTR       =  107;
  IDC_TIMEATCHECKOUT       =  108;
  IDC_SHOPPEREVENTS        =  109;

var
  g_hWndLB: HWND = 0; // 信息输出ListBox句柄

var
  g_nMaxOccupancy,         // 超市最多可容纳人数
  g_nTimeOpen,             // 超市本次开放时长
  g_nCheckoutCounters,     // 超市结帐柜台数量
  g_nMaxDelayBetweenShopperCreation, // 产生新顾客的最大时间间隔
  g_nMaxWaitToGetInMarket,           // 顾客等待进入超市, 最长等待时间
  g_nMaxTimeShopping,                // 顾客购物, 最多耗费时间
  g_nMaxWaitForDeliCntr,             // 顾客等待购买熟食, 最长等待时间
  g_nMaxTimeSpentAtDeli,             // 顾客购买熟食, 最多耗费时间
  g_nMaxTimeAtCheckout: Integer;     // 顾客结帐, 最多耗费时间

var
  g_hSemEntrance,          // 控制进入超市人数
  g_hMtxDeliCntr,          // 控制一一购买熟食
  g_hSemCheckout: THandle; // 控制柜台结帐人数

  // 向ListBox添加格式化字符串
procedure AddStr(const szFmt: PChar; const va_params: array of DWORD);
var
  szBuf: array[0..150] of Char;
  nIndex: Integer;
begin
  Windows.wvsprintf(szBuf, szFmt, @va_params);

  repeat
    nIndex := ListBox_AddString(g_hWndLB, szBuf);
    if (nIndex = LB_ERR) then ListBox_DeleteString(g_hWndLB, 0) else Break;
  until FALSE;

  ListBox_SetCurSel(g_hWndLB, nIndex);
end;

  // 0 <= Result <= nMaxValue
function Random(nMaxValue: Integer): Integer;
begin
  Result := System.Random(nMaxValue + 1);
end;

  // 顾客线程回调函数
function ThreadShopper(nShopperNum: Integer): Integer;
var
  dwResult: DWORD;
  nDuration: Integer;
begin
  Result := 0;
  Randomize();

  // 进入等待时长
  nDuration := Random(g_nMaxWaitToGetInMarket);
  AddStr('%04lu: Waiting to get in store (%lu).', [nShopperNum, nDuration]);

  // 等待进入超市
  dwResult := WaitForSingleObject(g_hSemEntrance, nDuration);
  if (dwResult = WAIT_TIMEOUT) then
  begin
    AddStr('%04lu: Tired of waiting; went home.', [nShopperNum]); // 超时回家 ^^
    Exit;
  end;

  // 购物一段时间
  nDuration := Random(g_nMaxTimeShopping);
  AddStr('%04lu: In supermarket, shopping for %lu.', [nShopperNum, nDuration]);
  Sleep(nDuration);

  // 可能购买熟食
  if (Random(2) = 0) then
  begin
    // 购买等待时长
    nDuration := Random(g_nMaxWaitForDeliCntr);
    AddStr('%04lu: Waiting for service at Deli Counter (%lu).', [nShopperNum, nDuration]);

    // 等待购买熟食
    dwResult := WaitForSingleObject(g_hMtxDeliCntr, nDuration);
    if (dwResult = STATUS_WAIT_0) then
    begin
      // 购买熟食耗时
      nDuration := Random(g_nMaxTimeSpentAtDeli);
      AddStr('%04lu: Being served at Deli (%lu).', [nShopperNum, nDuration]);
      Sleep(nDuration);

      // 购买熟食完成
      ReleaseMutex(g_hMtxDeliCntr);
    end else
    begin
      AddStr('%04lu: Tired of waiting at Deli.', [nShopperNum]); // 超时离开 ^^
    end;
  end else
  begin
    AddStr('%04lu: Not going to the Deli counter.', [nShopperNum]); // 不买熟食 ^^
  end;

  // 等待柜台结帐
  AddStr('%04lu: Waiting for an empty checkout counter.', [nShopperNum]);
  WaitForSingleObject(g_hSemCheckout, INFINITE);

  // 结帐消耗时间
  nDuration := Random(g_nMaxTimeAtCheckout);
  AddStr('%04lu: Checking out (%lu).', [nShopperNum, nDuration]);
  Sleep(nDuration);

  // 完成柜台结帐
  AddStr('%04lu: Leaving checkout counter.', [nShopperNum]);
  ReleaseSemaphore(g_hSemCheckout, 1, nil);

  // 离开超市回家
  AddStr('%04lu: Left the supermarket.', [nShopperNum]);
  ReleaseSemaphore(g_hSemEntrance, 1, nil);
end;

  // 超市线程回调函数
function ThreadSuperMarket(hWnd: HWND): Integer;
var
  dwCloseTime: DWORD;
  hThread: THandle;
  dwThreadId: DWORD;
  nShopperNum: Integer; // = 0
  nMaxOccupancy: Integer;
begin
  nShopperNum := 0; // 顾客数量?

  // 顾客进入限制
  g_hSemEntrance := CreateSemaphore(nil, 0, g_nMaxOccupancy, nil);

  // 熟食购买限制
  g_hMtxDeliCntr := CreateMutex(nil, FALSE, nil);

  // 结帐柜台限制
  g_hSemCheckout := CreateSemaphore(nil, g_nCheckoutCounters, g_nCheckoutCounters, nil);

  // 打开超市大门
  AddStr('---> Opening the supermarket to shoppers.', []);
  ReleaseSemaphore(g_hSemEntrance, g_nMaxOccupancy, nil);

  // 超市关门时间
  dwCloseTime := GetTickCount() + DWORD(g_nTimeOpen);

  // 超市开始运转
  while (GetTickCount() < dwCloseTime) do
  begin
    // 产生一位顾客
    hThread := BeginThread(nil, 0, @ThreadShopper, Pointer(nShopperNum), 0, dwThreadId);
    CloseHandle(hThread);
    Inc(nShopperNum);

    // 下位来临间隔
    Sleep(Random(g_nMaxDelayBetweenShopperCreation));
  end;

  // 超市准备关门
  AddStr('---> Waiting for shoppers to check out ', [DWORD(PChar('so store can close.'))]);

  // 等待顾客离开
  for nMaxOccupancy := 1 to g_nMaxOccupancy - 1 do
  begin
    WaitForSingleObject(g_hSemEntrance, INFINITE);
    AddStr('---> %d shoppers NOT in store.', [nMaxOccupancy]);
  end;

  // 关闭超市大门
  AddStr('---> Store closed--end of simulation.', []);

  // 清除内核对象
  CloseHandle(g_hSemCheckout);
  CloseHandle(g_hMtxDeliCntr);
  CloseHandle(g_hSemEntrance);

  // 通知界面更新
  SendMessage(hWnd, WM_USER, 0, 0);

  Result := 0;
end;

  // WM_INITDIALOG
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): BOOL;
var
  hWndSB: DWORD; // HWND
begin
  chSETDLGICONS(hWnd, IDI_SPRMRKT, IDI_SPRMRKT);

  g_hWndLB := GetDlgItem(hWnd, IDC_SHOPPEREVENTS);

  hWndSB := GetDlgItem(hWnd, IDC_MAXOCCUPANCY);
  ScrollBar_SetRange(hWndSB, 0, 500, TRUE);
  FORWARD_WM_HSCROLL(hWnd, hWndSB, SB_THUMBTRACK, 30);

  hWndSB := GetDlgItem(hWnd, IDC_TIMEOPEN);
  ScrollBar_SetRange(hWndSB, 0, 5000, TRUE);
  FORWARD_WM_HSCROLL(hWnd, hWndSB, SB_THUMBTRACK, 5000);

  hWndSB := GetDlgItem(hWnd, IDC_NUMCOUNTERS);
  ScrollBar_SetRange(hWndSB, 0, 30, TRUE);
  FORWARD_WM_HSCROLL(hWnd, hWndSB, SB_THUMBTRACK, 5);

  hWndSB := GetDlgItem(hWnd, IDC_SHOPPERCREATIONDELAY);
  ScrollBar_SetRange(hWndSB, 0, 1000, TRUE);
  FORWARD_WM_HSCROLL(hWnd, hWndSB, SB_THUMBTRACK, 300);

  hWndSB := GetDlgItem(hWnd, IDC_DELAYTOGETIN);
  ScrollBar_SetRange(hWndSB, 0, 100, TRUE);
  FORWARD_WM_HSCROLL(hWnd, hWndSB, SB_THUMBTRACK, 20);

  hWndSB := GetDlgItem(hWnd, IDC_TIMETOSHOP);
  ScrollBar_SetRange(hWndSB, 0, 100, TRUE);
  FORWARD_WM_HSCROLL(hWnd, hWndSB, SB_THUMBTRACK, 80);

  hWndSB := GetDlgItem(hWnd, IDC_WAITDELICNTR);
  ScrollBar_SetRange(hWndSB, 0, 100, TRUE);
  FORWARD_WM_HSCROLL(hWnd, hWndSB, SB_THUMBTRACK, 20);

  hWndSB := GetDlgItem(hWnd, IDC_TIMEATDELICNTR);
  ScrollBar_SetRange(hWndSB, 0, 100, TRUE);
  FORWARD_WM_HSCROLL(hWnd, hWndSB, SB_THUMBTRACK, 70);

  hWndSB := GetDlgItem(hWnd, IDC_TIMEATCHECKOUT);
  ScrollBar_SetRange(hWndSB, 0, 100, TRUE);
  FORWARD_WM_HSCROLL(hWnd, hWndSB, SB_THUMBTRACK, 60);

  Result := TRUE;
end;

  // WM_HSCROLL
procedure Dlg_OnHScroll(hWnd, hWndCtl: HWND; code: UINT; pos: Integer);
var
  szBuf: array[0..10] of Char;
  nPosCrnt, nPosMin, nPosMax: Integer;
begin
  // 范围位置
  nPosCrnt := ScrollBar_GetPos(hWndCtl);
  ScrollBar_GetRange(hWndCtl, @nPosMin, @nPosMax);

  // 动作类型
  case (code) of
    SB_LINELEFT:
      Dec(nPosCrnt);

    SB_LINERIGHT:
      Inc(nPosCrnt);

    SB_PAGELEFT:
      Dec(nPosCrnt, (nPosMax - nPosMin + 1) div 10);

    SB_PAGERIGHT:
      Inc(nPosCrnt, (nPosMax - nPosMin + 1) div 10);

    SB_THUMBTRACK:
      nPosCrnt := pos;

    SB_LEFT:
      nPosCrnt := nPosMin;

    SB_RIGHT:
      nPosCrnt := nPosMax;
  end;

  // 范围限制
  if (nPosCrnt < nPosMin) then
    nPosCrnt := nPosMin
  else
    if (nPosCrnt > nPosMax) then
      nPosCrnt := nPosMax;

  // 设置位置
  ScrollBar_SetPos(hWndCtl, nPosCrnt, TRUE);

  // 显示位置
  _wvsprintf(szBuf, '%d', [nPosCrnt]);
  SetWindowText(GetPrevSibling(hWndCtl), szBuf);
end;

  // WM_COMMAND
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
var
  dwThreadId: DWORD;
  hThread: THandle;
begin
  case (id) of
    IDOK:
      begin
        // 读入参数
        g_nMaxOccupancy := ScrollBar_GetPos(GetDlgItem(hWnd, IDC_MAXOCCUPANCY));
        g_nTimeOpen := ScrollBar_GetPos(GetDlgItem(hWnd, IDC_TIMEOPEN));
        g_nCheckoutCounters := ScrollBar_GetPos(GetDlgItem(hWnd, IDC_NUMCOUNTERS));
        g_nMaxDelayBetweenShopperCreation := ScrollBar_GetPos(GetDlgItem(hWnd, IDC_SHOPPERCREATIONDELAY));
        g_nMaxWaitToGetInMarket := ScrollBar_GetPos(GetDlgItem(hWnd, IDC_DELAYTOGETIN));
        g_nMaxTimeShopping := ScrollBar_GetPos(GetDlgItem(hWnd, IDC_TIMETOSHOP));
        g_nMaxWaitForDeliCntr := ScrollBar_GetPos(GetDlgItem(hWnd, IDC_WAITDELICNTR));
        g_nMaxTimeSpentAtDeli := ScrollBar_GetPos(GetDlgItem(hWnd, IDC_TIMEATDELICNTR));
        g_nMaxTimeAtCheckout := ScrollBar_GetPos(GetDlgItem(hWnd, IDC_TIMEATCHECKOUT));

        // 清空列表
        ListBox_ResetContent(GetDlgItem(hWnd, IDC_SHOPPEREVENTS));

        // 禁用按钮
        EnableWindow(hWndCtl, FALSE);

        // 设置焦点
        if (GetFocus() = 0) then SetFocus(GetDlgItem(hWnd, IDC_MAXOCCUPANCY));

        // 高优先级
        SetPriorityClass(GetCurrentProcess(), HIGH_PRIORITY_CLASS);

        // 超市线程
        hThread := BeginThread(nil, 0, @ThreadSuperMarket, Pointer(hWnd), 0, dwThreadId);
        CloseHandle(hThread);
      end;

    IDCANCEL:
      begin
        EndDialog(hWnd, id);
      end;
  end;
end;

  // 对话框回调函数
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

    WM_USER: // 超市已关门 ^^
      begin
        SetPriorityClass(GetCurrentProcess(), NORMAL_PRIORITY_CLASS);
        EnableWindow(GetDlgItem(hWnd, IDOK), TRUE);

        Result := TRUE;
      end;

    else Result := FALSE;
  end;
end;

  // 主线程入口
begin
  chWARNIFUNICODEUNDERWIN95();
  DialogBox(HInstance, MakeIntResource(IDD_SPRMRKT), 0, @Dlg_Proc);
end.
