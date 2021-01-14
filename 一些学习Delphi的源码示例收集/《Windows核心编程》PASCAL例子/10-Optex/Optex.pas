unit Optex;

interface

uses Windows;

type
  // 共享内存结构
  PSharedInfo = ^TSharedInfo;
  TSharedInfo = record
    m_dwSpinCount: DWORD;  // (循环锁)循环次数
    m_lLockCount: Integer; // 试图进入的次数
    m_dwThreadId: DWORD;   // 拥有者(线程)ID
    m_lRecurseCount: Integer; // 被拥有的次数
  end;

  // 自实现互斥类
  TOptex = class(TObject)
  public
    constructor Create(dwSpinCount: DWORD = 4000); overload;
    constructor Create(pszName: PAnsiChar; dwSpinCount: DWORD = 4000); overload;
    constructor Create(pszName: PWideChar; dwSpinCount: DWORD = 4000); overload;
    destructor Destroy(); override;
    procedure SetSpinCount(dwSpinCount: DWORD); // 循环次数
    procedure Enter(); // 进入临界区
    function TryEnter(): BOOL; // 尝试进入
    procedure Leave(); // 离开临界区
    function IsSingleProcessOptex(): BOOL; // 单进程对象
  private
    m_hevt: THandle;    // 事件对象句柄
    m_hfm: THandle;     // 共享内存句柄
    m_psi: PSharedInfo; // 共享内存地址
    procedure CommonConstructor(dwSpinCount: DWORD; fUnicode: BOOL; pszName: Pointer); // 初始化
    function ConstructObjectName(pszResult, pszPrefix: PChar; fUnicode: BOOL; pszName: Pointer): PChar;
  end;

implementation

{$DEFINE DEBUG}

  // 0=多处理器, 1=单处理器, -1=未定义
var sm_fUniprocessorHost: Integer = -1;

  // 构造函数
constructor TOptex.Create(dwSpinCount: DWORD = 4000);
begin
  CommonConstructor(dwSpinCount, FALSE, nil);
end;

constructor TOptex.Create(pszName: PAnsiChar; dwSpinCount: DWORD = 4000);
begin
  CommonConstructor(dwSpinCount, FALSE, pszName);
end;

constructor TOptex.Create(pszName: PWideChar; dwSpinCount: DWORD = 4000);
begin
  CommonConstructor(dwSpinCount, TRUE, pszName);
end;

  // 单进程对象
function TOptex.IsSingleProcessOptex(): BOOL;
begin
  Result := (m_hfm = 0);
end;

  // 连接字符串(同时也可能作Unicode->Ansi转换)
function TOptex.ConstructObjectName(pszResult, pszPrefix: PChar; fUnicode: BOOL; pszName: Pointer): PChar;
var
  ArgList: array[0..1] of PChar;
begin
  pszResult^ := #0;
  Result := nil;

  if (pszName <> nil) then
  begin
    ArgList[0] := pszPrefix;
    ArgList[1] := pszName;

    if fUnicode then
      wvsprintfA(pszResult, '%s%S', @ArgList[0])
    else
      wvsprintfA(pszResult, '%s%s', @ArgList[0]);

    Result := pszResult;
  end;
end;

  // 初始化动作
procedure TOptex.CommonConstructor(dwSpinCount: DWORD; fUnicode: BOOL; pszName: Pointer);
var
  sinf: TSystemInfo;
  szResult: array[0..100] of Char;
begin
  // 进程中首个TOptex对象被建立
  // 则检查当前机器是否单处理器
  if (sm_fUniprocessorHost = -1) then
  begin
    GetSystemInfo(sinf);
    sm_fUniprocessorHost := Integer(sinf.dwNumberOfProcessors = 1);
  end;

  // 初始化成员
  m_hevt := 0;
  m_hfm := 0;
  m_psi := nil;

  // 单进程对象
  if (pszName = nil) then
  begin
    // 建立局部事件对象
    m_hevt := CreateEventA(nil, FALSE, FALSE, nil);

    // 申请局部结构内存
    New(m_psi);
    ZeroMemory(m_psi, SizeOf(TSharedInfo));
  end else
  begin
  // 多进程对象

    // 建立全局事件对象
    ConstructObjectName(szResult, 'Optex_Event_', fUnicode, pszName);
    m_hevt := CreateEventA(nil, FALSE, FALSE, szResult);

    // 申请全局结构内存
    ConstructObjectName(szResult, 'Optex_MMF_', fUnicode, pszName);
    m_hfm := CreateFileMappingA(INVALID_HANDLE_VALUE, nil, PAGE_READWRITE, 0, SizeOf(TSharedInfo), szResult);
    m_psi := MapViewOfFile(m_hfm, FILE_MAP_WRITE, 0, 0, 0);

    // Note: SHAREDINFO's m_lLockCount, m_dwThreadId, and m_lRecurseCount
    // members need to be initialized to 0. Fortunately, a new pagefile
    // MMF sets all of its data to 0 when created. This saves use from
    // some thread synchronization work.
  end;

  // 循环次数
  SetSpinCount(dwSpinCount);
end;

  // 析构函数
destructor TOptex.Destroy();
begin
{$IFDEF DEBUG}
  // 单进程对象,当仍有线程拥有它时,不能释放
  if IsSingleProcessOptex() and (m_psi.m_dwThreadId <> 0) then
  begin
    {DebugBreak();}
  end;

  // 多进程对象. 当本线程拥有它时,不能释放
  if (IsSingleProcessOptex() = FALSE) and (m_psi.m_dwThreadId = GetCurrentThreadId()) then
  begin
    {DebugBreak()};
  end;
{$ENDIF}

  if IsSingleProcessOptex() then
    Dispose(m_psi)
  else begin
    UnmapViewOfFile(m_psi);
    CloseHandle(m_hfm);
  end;
  
  CloseHandle(m_hevt);
end;

  // 设置循环次数
procedure TOptex.SetSpinCount(dwSpinCount: DWORD);
begin
  // 多处理器机器
  if (sm_fUniprocessorHost = 0) then
    InterlockedExchange(Integer(m_psi.m_dwSpinCount), Integer(dwSpinCount));
end;

  // 进入临界区
procedure TOptex.Enter();
var
  dwThreadId: DWORD;
begin
  // 循环中已成功进入
  if TryEnter() then Exit;

  dwThreadId := GetCurrentThreadId();

  // 1.增加进入计数
  // 2.之前未曾进入
  if (InterlockedIncrement(m_psi.m_lLockCount) = 1) then
  begin
    m_psi.m_dwThreadId := dwThreadId;
    m_psi.m_lRecurseCount := 1;
  end else
  begin
    // 拥有对象的是本线程
    if (m_psi.m_dwThreadId = dwThreadId) then
    begin
      // 增加拥有计数
      Inc(m_psi.m_lRecurseCount);
    end else
    begin
      // 等待其他线程离开
      WaitForSingleObject(m_hevt, INFINITE);

      // 此时才可拥有对象
      m_psi.m_dwThreadId := dwThreadId;
      m_psi.m_lRecurseCount := 1;
    end;
  end;
end;

  // (循环)尝试进入
function TOptex.TryEnter(): BOOL;
var
  dwThreadId, dwSpinCount: DWORD;
begin
  dwThreadId := GetCurrentThreadId();

  // 循环次数
  dwSpinCount := m_psi.m_dwSpinCount;

  repeat
    // 若 m_lLockCount = 0, 则 m_lLockCount := 1, 且 Result = TRUE
    Result := (InterlockedCompareExchange(Pointer(m_psi.m_lLockCount), Pointer(1), Pointer(0)) = Pointer(0));

    // 对象未被拥有(没有线程进入临界区)
    if (Result) then
    begin
      m_psi.m_dwThreadId := dwThreadId;
      m_psi.m_lRecurseCount := 1;
    end else
    begin
      if (m_psi.m_dwThreadId = dwThreadId) then
      begin
        InterlockedIncrement(m_psi.m_lLockCount);
        Inc(m_psi.m_lRecurseCount);
        Result := TRUE;
      end;
    end;

    // $FFFFFFFF = -1 
    Dec(dwSpinCount);
  until (Result) or (dwSpinCount = $FFFFFFFF);
end;

  // 离开临界区
procedure TOptex.Leave();
begin
{$IFDEF DEBUG}
  // 只有拥有者线程可以离开
  if (GetCurrentThreadId() <> m_psi.m_dwThreadId) then {DebugBreak()};
{$ENDIF}

  // 减少引用计数
  Dec(m_psi.m_lRecurseCount);
  if (m_psi.m_lRecurseCount > 0) then
  begin
    // 依然拥有对象
    InterlockedDecrement(m_psi.m_lLockCount);
  end else
  begin
    // 不再拥有对象
    m_psi.m_dwThreadId := 0;

    // 1.减少进入计数
    // 2.放行其他线程
    if (InterlockedDecrement(m_psi.m_lLockCount) > 0) then SetEvent(m_hevt);
  end;
end;

end.
