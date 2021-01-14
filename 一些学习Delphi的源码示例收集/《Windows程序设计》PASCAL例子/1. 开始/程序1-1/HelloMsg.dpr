program HelloMsg;

uses Windows; // 引用此单元,以便调用常用的Win32 API函数

begin
  MessageBox (0, 'Hello, Windows 98!', 'HelloMsg', 0);
  (* 注: 表面来看, 此处MessageBox()至少作了两件事, 1.建立窗口, 2.消息循环*)
end.
