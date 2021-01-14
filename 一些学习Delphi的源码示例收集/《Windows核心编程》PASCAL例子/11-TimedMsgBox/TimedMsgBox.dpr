program TimedMsgBox;

{$R 'TimedMsgBox.res' 'TimedMsgBox.rc'}

uses Windows;

const g_szCaption = 'Timed Message Box';

var g_nSecLeft: Integer = 0;

  // 工作回调
procedure MsgBoxTimeout(pvContext: Pointer; fTimeout: Bool); stdcall;
const
  ID_MSGBOX_STATIC_TEXT = $FFFF; // MessageBox()窗口文字控件ID
var
  hWndMsgBox: HWND; // MessageBox()窗口句柄
  sz: array[0..100] of Char;
begin
  hWndMsgBox := FindWindow(nil, g_szCaption);
  if (hWndMsgBox = 0) then Exit;

  if (g_nSecLeft = 0) then
    EndDialog(hWndMsgBox, IDOK) // 结束MessageBox()模态对话框
  else begin
    wvsprintf(sz, 'You have %d seconds to respond ..', @g_nSecLeft);
    SetDlgItemText(hWndMsgBox, ID_MSGBOX_STATIC_TEXT, sz);
    Dec(g_nSecLeft);
  end;
end;

  // 系统版本
function IsWindows9x(): Bool;
var
  vi: TOSVersionInfo;
begin
  vi.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  GetVersionEx(vi);
  Result := (vi.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS);
end;

  // 程序入口
type
  TCreateTimerQueueTimer = function (var phNewTimer: THandle; hTimerQueue: THandle;
    pfnCallback, pvContext: Pointer; dwDueTime, dwPeriod, dwFlags: DWORD): Bool; stdcall;
  TDeleteTimerQueueTimer = function (hTimerQueue, hTimer, hCompletionEvent: THandle): Bool; stdcall;
var
  KernelHandle, hTimerQTimer: THandle;
  CreateTimerQueueTimer: TCreateTimerQueueTimer;
  DeleteTimerQueueTimer: TDeleteTimerQueueTimer;
begin
  // 判断系统
  if IsWindows9x() then
  begin
    MessageBox(0, 'This application requires features not present in Windows 9x.', 'TimedMsgBox', 0);
    Exit;
  end;

  // 定位函数
  KernelHandle := GetModuleHandle(kernel32);
  @CreateTimerQueueTimer := GetProcAddress(KernelHandle, 'CreateTimerQueueTimer');
  @DeleteTimerQueueTimer := GetProcAddress(KernelHandle, 'DeleteTimerQueueTimer');
  if (@CreateTimerQueueTimer = nil) or (@DeleteTimerQueueTimer = nil) then
  begin
    MessageBox(0, 'The fixed position function failure.', 'TimedMsgBox', 0);
    Exit;
  end;

  // 等待秒数
  g_nSecLeft := 10;

  // 建立定时
  CreateTimerQueueTimer(hTimerQTimer, 0, @MsgBoxTimeout, nil, 1000, 1000, 0);

  // 显示界面
  MessageBox(0, 'You have 10 seconds to respond ..', g_szCaption, MB_OK);

  // 删除定时
  DeleteTimerQueueTimer(0, hTimerQTimer, 0);

  // 为何返回
  if (g_nSecLeft = 0) then
    MessageBox(0, 'Timeout', 'Result', MB_OK)          // 超过10秒
  else
    MessageBox(0, 'User responded', 'Result', MB_OK);  // 手动停止
end.
