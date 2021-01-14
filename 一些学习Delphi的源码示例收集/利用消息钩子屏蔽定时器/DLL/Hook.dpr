library Hook;

uses Windows, Messages;

var HookHandle: HHOOK;

   // 钩子回调
function GetMsgProc(nCode: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
begin
  if (PMsg(lParam).message = WM_TIMER) then PMsg(lParam).message := 0;
  Result := CallNextHookEx(HookHandle, nCode, Wparam, lParam);
end;

   // 挂钩
procedure HookOn;
begin
  HookHandle := SetWindowsHookEx(WH_GETMESSAGE, @GetMsgProc, HInstance, 0);
end;

   // 脱钩
procedure HookOff;
begin
  UnHookWindowsHookEx(HookHandle);
end;     

  //导出函数
exports HookOn,HookOff;
  
begin
end.