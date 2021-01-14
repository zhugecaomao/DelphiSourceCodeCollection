unit VMArray;

interface

uses Windows;

  // TopLevelExceptionFilter返回值含义
const
  EXCEPTION_EXECUTE_HANDLER = 1; // 已处理异常, 请结束程序, (不要显示出错对话框)
  EXCEPTION_CONTINUE_SEARCH = 0; // 未处理异常, 作默认处理, (通常显示出错对话框)
  EXCEPTION_CONTINUE_EXECUTION = -1; // 已修复问题, 线程按ContextRecord继续执行

  // 扩展了的异常帧(系统只使用前两个域)
type
  PExceptionRegistration = ^TExceptionRegistration;
  TExceptionRegistration = record
    PrevStruct: PExceptionRegistration; // 上一节点位置
    ExceptionHandler: Pointer;          // 异常回调地址
    ExceptionAddress: Pointer;          // except块地址
  end;

  // (虚拟内存+异常保护实现的)稀疏数组
type
  TVMArray = class(TObject)
  private
    m_pNext: TVMArray; // 下一个对象
    m_pArray: Pointer; // 数组首地址
    m_cbReserve: DWORD; // 数组尺寸(in bytes)
    m_dwTypeSize: DWORD; // 组员尺寸(in bytes)

  protected
    function OnAccessViolation(pvAddrTouched: Pointer; fAttemptedRead: BOOL; // 负责修复内存访问错误,可覆盖
      var pep: TExceptionPointers; fRetryUntilSuccessful: BOOL): LongInt; virtual;
      
  public
    constructor Create(dwTypeSize, dwReserveElements: DWORD);
    destructor Destroy(); override;

    class procedure RemoveCurrentThreadOtherSEH(); // 用作摘除SetExceptionHandler()增加的SEH回调
    function VMPointer(): Pointer; // 返回数组首地址

    function ExceptionFilter(var pep: TExceptionPointers; // 可在except块中作为"过滤器"函数调用,
      fRetryUntilSuccessful: BOOL = FALSE): LongInt;      // 若没有except块,将由顶层异常回调调用
  end;

implementation

type
  PfnTopLevelExceptionFilter = function (var pep: TExceptionPointers): LongInt; stdcall;

var
  sm_pHead: TVMArray = nil; // 第一个TVMArray对象地址
  sm_pfnUnhandledExceptionFilterPrev: PfnTopLevelExceptionFilter; // 以前的顶层异常回调

  // 顶层异常回调
function TopLevelExceptionFilter(var pep: TExceptionPointers): LongInt; stdcall;
var
  p: TVMArray;
begin
  Result := EXCEPTION_CONTINUE_SEARCH;

  // 我们只修复内存访问错误
  if (pep.ExceptionRecord.ExceptionCode = EXCEPTION_ACCESS_VIOLATION) then
  begin
    // 遍历TVMArray对象链表, 一一调用
    p := sm_pHead;
    while (p <> nil) do
    begin
      // 询问当前节点对象是否修复错误
      Result := p.ExceptionFilter(pep, TRUE);

      // 这个对象修复了问题, 停止循环
      if (Result <> EXCEPTION_CONTINUE_SEARCH) then Break;

      // 单链表上的下一个TVMArray对象
      p := p.m_pNext;

      // 注: 若均不处理则程序就会退出
    end;
  end;

  // 调用以前的顶层异常回调
  if (Result = EXCEPTION_CONTINUE_SEARCH) then
    Result := sm_pfnUnhandledExceptionFilterPrev(pep);
end;

  // 负责修复内存访问错误(被ExceptionFilter调用)
function TVMArray.OnAccessViolation(pvAddrTouched: Pointer; fAttemptedRead: BOOL;
  var pep: TExceptionPointers; fRetryUntilSuccessful: BOOL): LongInt;
var
  fCommittedStorage: BOOL;
begin
  repeat
    // 为出错地址提交物理内存
    fCommittedStorage := (VirtualAlloc(pvAddrTouched, m_dwTypeSize, MEM_COMMIT, PAGE_READWRITE) <> nil);

    // 分配内存失败, 通知用户
    if (not fCommittedStorage) and (fRetryUntilSuccessful) then
    begin
      MessageBox(0, 'Please close some other applications and Press OK.',
        'Insufficient Memory Available', MB_ICONWARNING or MB_OK);
    end;
  until (fCommittedStorage) or (not fRetryUntilSuccessful);

  // 1.分配成功, 从出错指令处继续执行
  // 2.分配失败, 让系统安静地关闭程序(or 跳至except块执行)
  if fCommittedStorage then
    Result := EXCEPTION_CONTINUE_EXECUTION
  else
    Result := EXCEPTION_EXECUTE_HANDLER;
end;

  // TVMArray对象初始化
constructor TVMArray.Create(dwTypeSize, dwReserveElements: DWORD);
begin
  // 第一个类建立时安装顶层异常回调
  if (sm_pHead = nil) then
    sm_pfnUnhandledExceptionFilterPrev := SetUnhandledExceptionFilter(@TopLevelExceptionFilter);

  // 将自己接到TVMArray对象链表表头
  m_pNext := sm_pHead;
  sm_pHead := Self;

  // 需要为数组保留的虚拟内存的长度
  m_dwTypeSize := dwTypeSize;
  m_cbReserve := m_dwTypeSize * dwReserveElements;

  // 为数组保留虚拟内存空间(不提交)
  m_pArray := VirtualAlloc(nil, m_cbReserve, MEM_RESERVE or MEM_TOP_DOWN, PAGE_READWRITE);

  // chASSERT(m_pArray <> NULL);
end;

  // TVMArray对象结束化
destructor TVMArray.Destroy();
var
  p: TVMArray;
begin
  // 释放数组对应的虚拟内存空间
  if (m_pArray <> nil) then VirtualFree(m_pArray, 0, MEM_RELEASE);

  // 从TVMArray对象链表摘除自己
  if (sm_pHead = Self) then
    sm_pHead := sm_pHead.m_pNext
  else begin
    p := sm_pHead;
    while (p.m_pNext <> nil) do
    begin
      if (p.m_pNext = Self) then
      begin
        p.m_pNext := p.m_pNext.m_pNext;
        Break;
      end;
      p := p.m_pNext;
    end;
  end; // END: else
end;

  // 返回数组首地址
function TVMArray.VMPointer(): Pointer;
begin
  Result := m_pArray;
end;

  // 摘除当前线程所有SEH节点, 慎用!
class procedure TVMArray.RemoveCurrentThreadOtherSEH();
asm
  // p := TEB.ExceptionList;
  MOV EDX, FS:[0]

  // if (p = $FFFFFFFF) then Exit;
  CMP EDX, -1
  JZ  @@QUIT

  // while (p.PrevStruct <> $FFFFFFFF) do p := p.PrevStruct;
@@LOOP:
  MOV EAX, EDX
  MOV EDX, [EAX].TExceptionRegistration.PrevStruct
  CMP EDX, -1
  JNZ @@LOOP

  // TEB.ExceptionList := p;
  MOV FS:[0], EAX

@@QUIT:
end;

  // 异常过滤函数(被TopLevelExceptionFilter或except块调用)
function TVMArray.ExceptionFilter(var pep: TExceptionPointers; fRetryUntilSuccessful: BOOL = FALSE): LongInt;
var
  pvAddrTouched: DWORD;
  fAttemptedRead: BOOL;
begin
  Result := EXCEPTION_CONTINUE_SEARCH;

  // 我们只修复内存访问错误
  if (pep.ExceptionRecord.ExceptionCode <> EXCEPTION_ACCESS_VIOLATION) then Exit;

  // 发生读写异常的内存地址
  pvAddrTouched := pep.ExceptionRecord.ExceptionInformation[1];

  // 导致异常的动作(读or写)
  fAttemptedRead := (pep.ExceptionRecord.ExceptionInformation[0] = 0);

  // 如果该地址在数组范围内
  if (DWORD(m_pArray) <= pvAddrTouched) and (DWORD(pvAddrTouched) < (DWORD(m_pArray) + m_cbReserve)) then
    Result := OnAccessViolation(Pointer(pvAddrTouched), fAttemptedRead, pep, fRetryUntilSuccessful);
end;

end.
