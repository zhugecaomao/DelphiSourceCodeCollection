program Counter;

{$R 'Counter.res' 'Counter.rc'}

uses Windows, Messages;

const
  IDD_COUNTER =  101; // 资源ID..
  IDI_COUNTER =  102;
  IDC_FIBER  =  1000; // 控件ID..
  IDC_ANSWER =  1001;
  IDC_COUNT  =  1002;

type
  TBkGndProcState = (
    BPS_STARTOVER,    // 重新计算
    BPS_CONTINUE,     // 正在计算
    BPS_DONE       ); // 无须计算

  TFiberInfo = record
    pFiberUI: Pointer;    // 界面纤程执行环境
    hWnd: HWND;           // 界面窗口句柄
    bps: TBkGndProcState; // 后台处理状态
  end;

var
  g_FiberInfo: TFiberInfo;

  // 计算纤程纤程函数
procedure FiberFunc(var pFiberInfo: TFiberInfo); stdcall;
var
  nCount, x: Integer;
begin
  SetDlgItemText(pFiberInfo.hWnd, IDC_FIBER, 'Recalculation');
  nCount := GetDlgItemInt(pFiberInfo.hWnd, IDC_COUNT, PBool(nil)^, FALSE);

  for x := 0 to nCount do
  begin
    // 让用户界面纤程拥有比计算纤程更高的优先权
    // 如果队列有任何的消息, 切换到用户界面纤程
    if (HIWORD(GetQueueStatus(QS_ALLEVENTS)) <> 0) then
    begin
      // 暂停自身执行, 切换至用户界面纤程
      SwitchToFiber(pFiberInfo.pFiberUI);

      // 界面纤程处理消息完毕, 已切换回来
      SetDlgItemText(pFiberInfo.hWnd, IDC_FIBER, 'Recalculation');
    end;

    SetDlgItemInt(pFiberInfo.hWnd, IDC_ANSWER, x, FALSE);
    Sleep(200);
  end;

  // 计算完毕, 切换至界面纤程
  pFiberInfo.bps := BPS_DONE;
  SwitchToFiber(pFiberInfo.pFiberUI);
end;

  // WM_INITDIALOG处理
function Dlg_OnInitDialog(hWnd, hWndFocus: HWND; lParam: LPARAM): Bool;
begin
  SendMessage(hWnd, WM_SETICON, ICON_BIG, LoadIcon(HInstance, MakeIntResource(IDI_COUNTER)));
  SendMessage(hWnd, WM_SETICON, ICON_SMALL, LoadIcon(HInstance, MakeIntResource(IDI_COUNTER)));

  SetDlgItemInt(hWnd, IDC_COUNT, 0, FALSE);

  Result := TRUE;
end;

  // WM_COMMAND处理
procedure Dlg_OnCommand(hWnd: HWND; id: Integer; hWndCtl: HWND; codeNotify: UINT);
begin
  case (id) of
    IDCANCEL: PostQuitMessage(0); // 使得消息循环结束
    IDC_COUNT: if (codeNotify = EN_CHANGE) then g_FiberInfo.bps := BPS_STARTOVER; // 重新计数
  end;
end;

  // 对话框回调函数
function Dlg_Proc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  Result := FALSE;

  case (uMsg) of
    WM_INITDIALOG:
      Result := SetWindowLong(hWnd, DWL_MSGRESULT, Longint(Dlg_OnInitDialog(hWnd, wParam, lParam))) <> 0;

    WM_COMMAND:
      Dlg_OnCommand(hWnd, LOWORD(wParam), lParam, HIWORD(wParam));
  end;
end;

  // 程序主线程入口
var
  pFiberCounter: Pointer = nil; // 计算纤程执行环境
  fQuit: Bool = FALSE; // 停止消息循环
  Msg: TMsg;
begin
  // 转换线程为纤程
  g_FiberInfo.pFiberUI := Pointer(ConvertThreadToFiber(nil));

  // 建立界面主窗口
  g_FiberInfo.hWnd := CreateDialog(HInstance, MakeIntResource(IDD_COUNTER), 0, @Dlg_Proc);

  // 处于"界面纤程"
  SetDlgItemText(g_FiberInfo.hWnd, IDC_FIBER, 'User interface');

  // 目前尚无需计算
  g_FiberInfo.bps := BPS_DONE;

  // 自实现消息循环
  while (not fQuit) do
  begin
    if PeekMessage(Msg, 0, 0, 0, PM_REMOVE) then
    begin
      // 遇WM_QUIT跳出循环
      fQuit := (Msg.message = WM_QUIT);

      // 处理消息(分发转换)
      if (not IsDialogMessage(g_FiberInfo.hWnd, Msg)) then
      begin
        TranslateMessage(Msg);
        DispatchMessage(Msg);
      end;
    end else
    begin
      // 没有消息需要处理

      // 检查后台处理状态
      case (g_FiberInfo.bps) of
        BPS_DONE:
          begin
            WaitMessage(); // 挂起等待, 直至有消息进入队列
          end;

        BPS_STARTOVER,
        BPS_CONTINUE:
          begin
            if (g_FiberInfo.bps = BPS_STARTOVER) then
            begin
              // 删除老的计算纤程
              if (pFiberCounter <> nil) then
              begin
                DeleteFiber(pFiberCounter);
                pFiberCounter := nil;
              end;

              // 建立新的计算纤程
              pFiberCounter := Pointer(CreateFiber(0, @FiberFunc, @g_FiberInfo));

              // 状态为: 正在计算
              g_FiberInfo.bps := BPS_CONTINUE;
            end;

            // 暂停执行, 切换至计算纤程
            SwitchToFiber(pFiberCounter);

            // 此时已从计算纤程切换回来
            SetDlgItemText(g_FiberInfo.hWnd, IDC_FIBER, 'User interface');

            // 计算完毕, 则删除计算纤程
            if (g_FiberInfo.bps = BPS_DONE) then
            begin
              DeleteFiber(pFiberCounter);
              pFiberCounter := nil;
            end;
          end;
      end; // END: case of ..
    end;
  end; // END: while do ..

  // 清除界面主窗口
  DestroyWindow(g_FiberInfo.hWnd);
end.
