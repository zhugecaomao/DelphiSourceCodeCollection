unit WinUnit;

interface

procedure RegWinClass(); // 注册窗口类
procedure DesWinClass(); // 注销窗口类
procedure CreateMyWin(); // 建立窗口

implementation

uses Windows, Messages, ShellAPI, FunUnit;

  // 窗口回调
function WindowProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  CurChoose: Integer = 9; // 当前选中(背景)菜单项
{$J-}
  HookName = '{5EED7056-B89D-4DE8-A060-D285EA746799}';
  HookPath = 'SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellExecuteHooks';
  SysBrush: array[5..9] of Integer =
   (WHITE_BRUSH, LTGRAY_BRUSH, GRAY_BRUSH, DKGRAY_BRUSH, BLACK_BRUSH);
var
  HMenu: LongWord;
begin
  Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理

  case Msg of
    WM_CREATE:
      begin
        WindowProc(hWnd, WM_COMMAND, 9, 0); // 初始化(菜单勾选和背景画刷)
      end;

    WM_INITMENUPOPUP:
      if (lParam = 0) then // LOWORD(lParam)=0 and HIWORD(lParam)=0, "清除"菜单
      begin
        if QueryRegStr(HKEY_LOCAL_MACHINE, HookPath, HookName) then
          EnableMenuItem(wParam, 2, MF_ENABLED) // 启用
        else
          EnableMenuItem(wParam, 2, MF_GRAYED); // 禁用
      end;

    WM_COMMAND:
      begin
        case wParam of
          1: // "定位表项"
          begin
           // 设置 LastKey
            SetRegStr(HKEY_CURRENT_USER,
              'Software\Microsoft\Windows\CurrentVersion\Applets\Regedit',
              'LastKey', '我的电脑\HKEY_LOCAL_MACHINE\' + HookPath);
              
           // 打开 Regedit
            ShellExecute(0, 'open', 'Regedit.exe', nil, nil, SW_SHOW);
          end;

          2: // "删除键值"
          begin
            DelRegStr(HKEY_LOCAL_MACHINE, HookPath, HookName);
          end;

          3: // "定位文件"
          begin
            ShellExecute(0, 'open', 'Explorer.exe',
              '/e,/select,C:\Liu_Mazi.DLL', nil, SW_SHOW);
          end;

          4: // "删除文件"
          begin
            if QueryRegStr(HKEY_LOCAL_MACHINE, HookPath, HookName) then
              MessageBox(hWnd,
                #13#10'请先"删除键值",以取消挂钩   ', 'ShellExecuteHook', 0)
            else begin
              DeleteFileRestart('C:\Liu_Mazi.DLL');
              MessageBox(hWnd,
                #13#10'好的,文件将在重启时被删除   ', 'ShellExecuteHook', 0);
            end
          end;

          5, 6, 7, 8, 9: // "背景"
          begin
           // 设置勾选
            HMenu := GetMenu(hWnd);
            CheckMenuItem(HMenu, CurChoose, MF_UNCHECKED);
            CurChoose := wParam;
            CheckMenuItem(HMenu, CurChoose, MF_CHECKED);
            
           // 设置背景
            SetClassLong(hWnd, GCL_HBRBACKGROUND, GetStockObject(SysBrush[CurChoose]));
            InvalidateRect(hWnd, nil, TRUE);
          end;

          10:
          begin // "帮助"
            MessageBox(hWnd,
              #13#10'选中"删除键值"菜单项即可清除   ', 'ShellExecuteHook', 0);
          end;

          11:
          begin // "关于"
            MessageBox(hWnd,
              #13#10'ShellExecuteHook示例代码    By 麻子    '#13#10, 'ShellExecuteHook', 0);
          end;

          12:
          begin // "资源"
            ShellExecute(0, 'open', 'http://www.2ccc.com/', nil, nil, SW_SHOW);
          end;
        end;
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0); // 放一个WM_QUIT消息到调用此函数的线程的消息队列
      end;
  end;
end;

  // 注册窗口类
procedure RegWinClass();
var
  WinClass: TWndClass;
begin
 // 填充
  WinClass.Style := 0;
  WinClass.lpfnWndProc := @WindowProc;
  WinClass.cbClsExtra := 0;
  WinClass.cbWndExtra := 0;
  WinClass.hInstance := HInstance;
  WinClass.hIcon := LoadIcon(HInstance, 'Liu_mazi');
  WinClass.hCursor := LoadCursor(0, IDC_ARROW);
  WinClass.hbrBackground := GetStockObject(BLACK_BRUSH);
  WinClass.lpszMenuName := 'Liu_mazi';
  WinClass.lpszClassName := 'Liu_mazi';
 // 注册
  RegisterClass(WinClass);
end;

 // 注销窗口类
procedure DesWinClass();
begin
  UnregisterClass('Liu_mazi', HInstance);
end;

  // 建立窗口
procedure CreateMyWin();
begin
  CreateWindowEx(WS_EX_TOPMOST, 'Liu_mazi', ' ShellExecuteHook示例     By 麻子',
    WS_OVERLAPPEDWINDOW or WS_VISIBLE, 100, 100, 300, 150, 0, 0, HInstance, nil);
end;

(* 注1: 好像LastKey功能在2000以上的RegEdit才有 *)
(* 注2: 菜单触发的WM_COMMAND, HIWORD(wParam)=0 *)
end.
