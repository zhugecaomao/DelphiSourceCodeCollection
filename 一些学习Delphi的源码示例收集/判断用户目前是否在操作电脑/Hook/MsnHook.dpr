program MsnHook;

{$R '..\Icon\Icon.Res'} // 图标资源

uses
  Windows, Messages, ShellAPI;

const            
  WM_OURTRAY = WM_USER + 66; // 托盘消息

var
  WM_TaskbarCreated: UINT; // 任务栏重建通知
  RecordHook: HHOOK; // 钩子句柄
  HPopupMenu: HMENU; // 菜单句柄
  IconData: TNotifyIconData; // 托盘结构
  Timer: Integer = 0; // 累计时间, 秒为单位
  State: Boolean = TRUE; // 是否'在线'

  // 窗体函数
function WindowProc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  MousePos: TPoint; // 鼠标位置
begin
  case (uMsg) of
    WM_TIMER:
      if (State = TRUE) then
      begin
        Inc(Timer);
        if (Timer >= 5) then // 超过5秒认为离开
        begin
          State := FALSE;
          IconData.hIcon := LoadIcon(HInstance, 'Leave');
          IconData.uFlags := NIF_ICON;
          Shell_NotifyIcon(NIM_MODIFY, @IconData);
        end;
      end;

    WM_COMMAND: // 处理菜单命令
      case wParam of
        1: MessageBox(0, 'http://liumazi.axdisk.cn'#13#10#13#10'http://liumazi.ys168.com',
             ' MSN那样判断用户是否离开', MB_OK);
             
        2: PostQuitMessage(0);
      end;

    WM_OURTRAY:
      if (lParam = WM_LBUTTONUP) then // 左击托盘时弹出菜单
      begin
        GetCursorPos(MousePos);
        SetForegroundWindow(hWnd);
        TrackPopupMenu(HPopupMenu, TPM_LEFTALIGN or TPM_LEFTBUTTON,
          MousePos.X, MousePos.Y, 0, hWnd, nil);
      end;

    else
      if (uMsg = WM_TaskbarCreated) then // 此时需要重建托盘
      begin
        IconData.uFlags := NIF_ICON or NIF_MESSAGE or NIF_TIP;
        Shell_NotifyIcon(NIM_ADD, @IconData);
      end;
  end;

  Result := DefWindowProc(hWnd, uMsg, wParam, lParam);
end;

  // 钩子函数
function JournalRecordProc(nCode: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  Msg: LongWord;
begin
  if (nCode = HC_ACTION) then // lParam 指向消息结构
  begin
    Msg := PEventMsg(lParam)^.message;
    if ( (Msg >= WM_KEYFIRST) and (Msg <= WM_KEYLAST) ) or // 键盘消息
       ( (Msg >= WM_MOUSEFIRST) and (Msg <= WM_MOUSELAST) ) then // 鼠标消息
    begin
      Timer := 0;
      if (State = FALSE) then // '离开' -> '在线'
      begin
        State := TRUE;
        IconData.hIcon := LoadIcon(HInstance, 'Online');
        IconData.uFlags := NIF_ICON;
        Shell_NotifyIcon(NIM_MODIFY, @IconData);
      end;
    end;
  end;
    
  Result := CallNextHookEx(RecordHook, nCode, wParam, lParam); // 下一个钩子
end;

 // 程序入口
const 
  ClassName = 'MsnHook_Mazi'; // 窗体类名
var
  Msg: TMsg;
  WndClass: TWndClass;
  HMainWnd: HWND;
begin
 // 任务栏建立通知消息
  WM_TaskbarCreated := RegisterWindowMessage('TaskbarCreated');

 // 注册类别
  with WndClass do
  begin
    Style       := 0;           // 类风格
    lpfnWndProc := @WindowProc; // 窗体过程
    cbClsExtra  := 0;           // 类额外内存
    cbWndExtra  := 0;           // 窗体额外内存
    hIcon   := 0;               // 窗体图标
    hCursor := 0;               // 窗体光标
    hbrBackground := 0;         // 背景画刷
    lpszMenuName  := nil;       // 窗体菜单
    lpszClassName := ClassName; // 窗体类名
    hInstance := GetModuleHandle(nil); // 模块句柄
  end;
  RegisterClass(WndClass);

 // 建立窗体
  HMainWnd := CreateWindowEx(0, ClassName, nil, 0, 0, 0, 0, 0, 0, 0, HInstance, nil);

 // 建立菜单
  HPopupMenu := CreatePopupMenu();
  AppendMenu(HPopupMenu, MF_ENABLED or MF_STRING, 1, '&Abort');
  AppendMenu(HPopupMenu, MF_ENABLED or MF_STRING, 2, '&Quit');

 // 添加托盘
  with IconData do
  begin
    cbSize := SizeOf(IconData);
    Wnd := HMainWnd;
    uID := 66;
    uFlags := NIF_ICON or NIF_MESSAGE or NIF_TIP;
    uCallBackMessage := WM_OURTRAY;
    hIcon := LoadIcon(HInstance, 'Online');
    szTip := '象MSN那样判断用户是否离开   by 麻子';
  end;
  Shell_NotifyIcon(NIM_ADD, @IconData);

 // 安装时钟
  SetTimer(HMainWnd, 6, 1000, nil);

 // 安装钩子
  RecordHook := SetWindowsHookEx(WH_JOURNALRECORD, @JournalRecordProc, HInstance, 0);

 // 消息循环
  while GetMessage(Msg, 0, 0, 0) do
  begin
    if (Msg.message = WM_CANCELJOURNAL) then // 此时需要重新挂钩
      RecordHook := SetWindowsHookEx(WH_JOURNALRECORD, @JournalRecordProc, HInstance, 0)
    else
      DispatchMessage(Msg);
  end;

 // 卸载钩子
  UnHookWindowsHookEx(RecordHook);

 // 删除时钟
  KillTimer(HMainWnd, 6);

 // 删除菜单
  DestroyMenu(HPopupMenu);

 // 删除托盘
  Shell_NotifyIcon(NIM_DELETE, @IconData);

 // 删除窗体
  DestroyWindow(HMainWnd);
end.
