program UseHook;

{$R '..\Res\Icon.Res'} // 图标资源

uses
  Windows, Messages, ShellAPI;

const
  WM_TRAY = WM_USER + 66; // 自定义托盘消息

var
  WM_TaskbarCreated: UINT; // 任务栏重建通知
  HPopupMenu: HMENU; // 弹出式菜单句柄
  IconData: TNotifyIconData; // 托盘结构

 // 引入动态链接库函数
procedure  HookOn(); external '..\DLL\KeyHook.dll';
procedure HookOff(); external '..\DLL\KeyHook.dll';

 // 窗体过程回调函数
function WindowProc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  MousePos: TPoint; // 鼠标位置
begin
  case (uMsg) of
    WM_COMMAND:
      case (wParam)  of
        1: begin
             EnableMenuItem(HPopupMenu, 1, MF_GRAYED);  // 禁用
             EnableMenuItem(HPopupMenu, 2, MF_ENABLED); // 启用

             IconData.hIcon := LoadIcon(HInstance, 'Enable');
             IconData.uFlags := NIF_ICON;
             Shell_NotifyIcon(NIM_MODIFY, @IconData);

             HookOn();
           end;

        2: begin
             EnableMenuItem(HPopupMenu, 1, MF_ENABLED); // 启用
             EnableMenuItem(HPopupMenu, 2, MF_GRAYED);  // 禁用

             IconData.hIcon := LoadIcon(HInstance, 'Disable');
             IconData.uFlags := NIF_ICON;
             Shell_NotifyIcon(NIM_MODIFY, @IconData);

             HookOff();
             PostMessage(HWND_BROADCAST, WM_WININICHANGE, 0, 0);
           end;

        3: MessageBox(0,
             ' http://liumazi.axdisk.cn'#13#10#13#10' http://liumazi.ys168.com',
             '模拟输入法小程序  by 麻子', MB_OK);

        4: PostQuitMessage(0);
      end;

    WM_TRAY:
      if (lParam = WM_LBUTTONUP) or (lParam = WM_RBUTTONUP) then
      begin
        GetCursorPos(MousePos);
        
        SetForegroundWindow(hWnd);

        TrackPopupMenu(HPopupMenu, TPM_LEFTALIGN or TPM_LEFTBUTTON,
          MousePos.X, MousePos.Y, 0, hWnd, nil);
      end;

    else
      if (uMsg = WM_TaskbarCreated) then
      begin
        IconData.uFlags := NIF_ICON or NIF_MESSAGE or NIF_TIP;
        Shell_NotifyIcon(NIM_ADD, @IconData);
      end;
  end;
  
  Result := DefWindowProc(hWnd, uMsg, wParam, lParam);
end;

 // 程序入口
const
  ClassName = 'ShuRuFa_Mazi';
var
  Msg: TMsg;
  WndClass: TWndClass;
  HMainWnd: HWND;
begin
 // 防止重复运行
  if (Findwindow(ClassName, nil) <> 0) then
  begin
    MessageBox(0, '程序已运行.... :-)  ', '', MB_OK);
    Exit;
  end;

 // 任务栏建立
  WM_TaskbarCreated := RegisterWindowMessage('TaskbarCreated');

 // 注册窗体类
  with WndClass do
  begin
    Style       := 0;     // 类风格
    lpfnWndProc := @WindowProc; // 窗体过程
    cbClsExtra  := 0;     // 类额外空间
    cbWndExtra  := 0;     // 窗体额外空间
    hIcon   := 0;         // 窗体图标
    hCursor := 0;         // 窗体光标
    hbrBackground := 0;   // 背景画刷
    lpszMenuName  := nil; // 窗体菜单
    lpszClassName := ClassName; // 类名
    hInstance := SysInit.HInstance; // 实例句柄
  end;
  RegisterClass(WndClass);

 // 建立窗体
  HMainWnd := CreateWindow(ClassName, nil, 0, 0, 0, 0, 0, 0, 0, HInstance, nil);

 // 建立菜单
  HPopupMenu := CreatePopupMenu();
  AppendMenu(HPopupMenu, MF_GRAYED or MF_STRING, 1, '&Enable');
  AppendMenu(HPopupMenu, MF_ENABLED or MF_STRING, 2, '&Disable');
  AppendMenu(HPopupMenu, MF_ENABLED or MF_STRING, 3, '&Abort');
  AppendMenu(HPopupMenu, MF_ENABLED or MF_STRING, 4, 'E&xit');

 // 添加托盘
  with IconData do
  begin
    cbSize := SizeOf(IconData);
    Wnd := HMainWnd;
    uID := 66;
    uFlags := NIF_ICON or NIF_MESSAGE or NIF_TIP;
    uCallBackMessage := WM_TRAY;
    hIcon := LoadIcon(HInstance, 'Enable');
    szTip := '模拟输入法小程序   by 麻子';
  end;
  Shell_NotifyIcon(NIM_ADD, @IconData);

 // 安装钩子
  HookOn();

 // 消息循环
  while GetMessage(Msg, 0, 0, 0) do DispatchMessage(Msg);

 // 卸载钩子
  HookOff();
  PostMessage(HWND_BROADCAST, WM_WININICHANGE, 0, 0);  

 // 清除托盘
  Shell_NotifyIcon(NIM_DELETE, @IconData);

 // 清除菜单
  DestroyMenu(HPopupMenu);

 // 清除窗体
  DestroyWindow(HMainWnd);
end.
