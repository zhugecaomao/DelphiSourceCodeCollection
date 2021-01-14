library KeyHook;

uses Windows, Messages;

const
  Buffer1: PChar = '驿外断桥边，寂寞开无主。已是黄昏独自愁，更著风和雨。';
  Buffer2: PChar = '无意苦争春，一任群芳妒。零落成泥碾作尘，只有香如故。';

 // 交换高低字节
function Swap(x: Word): Word;
asm
  XCHG AH, AL;
end;

 // 字母对应汉字
function AsciiToGB(Letter: Char): Word;
begin
  case Letter of
    'A'..'Z': Result := Swap(  PWord( @Buffer2[ (Ord(Letter) - Ord('A')) shl 1] )^  );
    'a'..'z': Result := Swap(  PWord( @Buffer1[ (Ord(Letter) - Ord('a')) shl 1] )^  );
    else Result := 0;
  end;
end;

 // 键盘钩子句柄
var KeyboardHook: HHOOK = 0;

 // 键盘钩子回调
function KeyHookPro(nCode: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  State: TKeyboardState;  // 键盘状态
  Ascii: array[0..1] of Char; // 字符
  HFocus: HWND; // 焦点控件
  GBCode: Word; // 汉字内码
begin
 // 交下一钩子处理
  Result := CallNextHookEx(KeyboardHook, nCode, wParam, lParam);

  if (nCode = HC_ACTION) and // 键盘消息将移出队列
     (lParam and $80000000 = 0) and // 键盘正被按下
     IsCharUpper(Char(wParam)) then // 英文字母
  begin
   // 键盘状态
    GetKeyboardState(State);

   // 转成字符
    if ToAscii(wParam, (lParam and $FF0000) shr 16, State, Ascii, 0) = 1 then
      GBCode := AsciiToGB(Ascii[0])
    else
      GBCode := 0;

   // 转换成功
    if (GBCode <> 0) then
    begin
      HFocus := GetFocus();
      if (HFocus <> 0) then
      begin
        SendMessage(HFocus, WM_IME_CHAR, GBCode, 0); // 发送汉字
        Result := 1; // 返回TRUE, 屏蔽按键
      end;
    end;
  end;
end;

 // 卸载钩子
procedure HookOff();
begin
  UnHookWindowsHookEx(KeyboardHook);
  KeyboardHook := 0;
end;

 // 安装钩子
procedure HookOn();
begin
  if (KeyboardHook <> 0) then HookOff();
  KeyboardHook := SetWindowsHookEx(WH_KEYBOARD, KeyHookPro, HInstance, 0);
end;

 // 导出函数
exports HookOn, HookOff;
  
begin
end.        
