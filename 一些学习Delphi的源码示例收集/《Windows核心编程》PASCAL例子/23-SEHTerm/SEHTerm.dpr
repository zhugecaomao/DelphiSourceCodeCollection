program SEHTerm;

{$R 'SEHTerm.res' 'SEHTerm.rc'}

uses Windows;

type
  TExceptionDisposition = DWORD; // 异常回调返回值类型(C语言中的枚举型占4字节, 而PASCAL只占1字节)
  
  PExceptionFrame = ^TExceptionFrame; // 扩展的异常帧结构(增加了FinallyAddress字段来实现Finally)
  TExceptionFrame = record
    PrevStruct: PExceptionFrame; // 上一节点位置(线程异常帧链表)
    ExceptionHandler: Pointer;   // 异常回调地址(由操作系统调用)
    FinallyAddress: procedure;   // 结束执行地址(由我们自己调用)
  end;

  // 异常回调
function FinallyHandler(var ExceptionRecord: TExceptionRecord; var EstablisherFrame: TExceptionFrame;
  var ContextRecord: TContext; DispatcherContext: Pointer): TExceptionDisposition; Cdecl;
const
  ExceptionContinueSearch = $00000001;
  StatusUnwind = $C0000027;
  ExceptionUnwinding = $00000002;
  ExceptionUnwindingForExit = $00000004;
begin
  if (ExceptionRecord.ExceptionCode = StatusUnwind) or
     (ExceptionRecord.ExceptionFlags = ExceptionUnwinding) or
     (ExceptionRecord.ExceptionFlags = ExceptionUnwindingForExit) then
  begin
    EstablisherFrame.FinallyAddress();
  end;

  Result := ExceptionContinueSearch;
end;

  // 程序入口
const
  lpText1: PChar = 'Perform invalid memory access?';
  lpCaption1: PChar = 'SEHTerm: In try block';

  lpText2: PChar = 'Abnormal termination';
  lpText3: PChar = 'Normal termination';
  lpCaption2: PChar = 'SEHTerm: In finally block';

  lpText4: PChar = 'Normal process termination';
  lpCaption4: PChar = 'SEHTerm: After finally block';

asm
  // 构造TExceptionFrame并将其插入链表
  PUSH OFFSET  @@Finally     // TExceptionFrame.FinallyAddress
  PUSH OFFSET  FinallyHandler// TExceptionFrame.ExceptionHandler
  PUSH FS:[0]                // TExceptionFrame.PrevStruct
  MOV  FS:[0], ESP           // FS:[0]乃TIB.ExceptionList(链表头)

  // MessageBox(0, 'Perform invalid memory access?', 'SEHTerm: In try block', MB_YESNO);
  PUSH $00000004             // MB_YESNO
  PUSH lpCaption1            // 'SEHTerm: In try block'
  PUSH lpText1               // 'Perform invalid memory access?'
  PUSH $00000000
  CALL MessageBox

  // if (n = IDYES) then PByte(0)^ := 5;
  CMP  EAX, $00000006        // (n = ID_YES) ???
  JNZ  @@NoAccess            // 返回值不是IDYES
  MOV  [0], $00000005        // 故意访问非法地址

@@NoAccess:

  // 如果能执行到这里说明没有出错, ^.^
  POP  FS:[0]                // 将我们节点从异常帧链表摘除
  ADD  ESP, $00000008        // 修改栈顶指针(出栈简化动作)
  PUSH OFFSET @@Other        // 准备后面RET指令的跳转地址

@@Finally:

  // 1.如果没有出错, 则会顺序执行到这里, :-)
  // 2.如果出错, 也会从ExceptHandler()转过来

  // if AbnormalTermination() then .. ;
  CMP [ESP], OFFSET @@Other  // 根据栈顶内容是否等于@@Other, 判断之前是否出错
  JNZ @@Abnormal             // (从而使得MessageBox()显示不同内容)

  // MessageBox(0, 'Normal termination', 'SEHTerm: In finally block', MB_OK)
  PUSH $00000000             // MB_OK
  PUSH lpCaption2            // 'SEHTerm: In finally block'
  PUSH lpText3               // 'Normal termination'
  PUSH $00000000
  CALL MessageBox

  JMP @@Return

@@Abnormal:

  // MessageBox(0, 'Abnormal termination', 'SEHTerm: In finally block', MB_OK)
  PUSH $00000000             // MB_OK
  PUSH lpCaption2            // 'SEHTerm: In finally block'
  PUSH lpText2               // 'Abnormal termination'
  PUSH $00000000
  CALL MessageBox

@@Return:

  RET                        // 没发生异常则顺序执行, 否则返回ExceptHandler()

@@Other:

  // MessageBox(0, 'Normal process termination', 'SEHTerm: After finally block', MB_OK);
  PUSH $00000000             // MB_OK
  PUSH lpCaption4            // 'SEHTerm: After finally block'
  PUSH lpText4               // 'Normal process termination'
  PUSH $00000000
  CALL MessageBox
end.
