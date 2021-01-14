unit AddrWindow;

interface

uses Windows;

function Initialize_AWE(): BOOL; // 定位函数

type
  TAddrWindow = class(TObject)   // 窗口地址
  public
    constructor Create();
    destructor Destroy(); override;
    function AW_Create(dwBytes: ULONG; pvPreferredWindowBase: Pointer = nil): BOOL;
    function AW_Destroy(): BOOL;
    function AW_UnmapStorage(): BOOL;
    function AW_Pointer(): Pointer;
  private
    m_pvWindow: Pointer;
    sm_sinf: TSystemInfo;
  end;

  TAddrWindowStorage = class(TObject) // RAM 块
  public
    constructor Create();
    destructor Destroy(); override;
    function AWS_Allocate(ulBytes: ULONG): BOOL;
    function AWS_Free(): BOOL;
    function AWS_HowManyPagesAllocated(): ULONG;
    function AWS_MapStorage(aw: TAddrWindow): BOOL;
    function AWS_UnmapStorage(aw: TAddrWindow): BOOL;
  private
    m_ulPages: ULONG;
    m_pulUserPfnArray: PULONG;
    sm_sinf: TSystemInfo;
    function EnablePrivilege(pszPrivName: PChar; fEnable: BOOL = TRUE): BOOL;
  end;

implementation

const
  MEM_PHYSICAL = $400000;
  SE_LOCK_MEMORY_NAME = 'SeLockMemoryPrivilege';

type
  TAllocateUserPhysicalPages = function (hProcess: THandle; NumberOfPages, UserPfnArray: PULONG): BOOL; stdcall;
  TFreeUserPhysicalPages = function (hProcess: THandle; NumberOfPages, UserPfnArray: PULONG): BOOL; stdcall;
  TMapUserPhysicalPages = function (lpAddress: Pointer; NumberOfPages: ULONG; UserPfnArray: PULONG): BOOL; stdcall;

var
  AllocateUserPhysicalPages: TAllocateUserPhysicalPages;
  FreeUserPhysicalPages: TFreeUserPhysicalPages;
  MapUserPhysicalPages: TMapUserPhysicalPages;

  // 定位 AWE 函数
function Initialize_AWE(): BOOL;
var
  hKernel: THandle;
begin
  hKernel := GetModuleHandle(kernel32);
  if (hKernel <> 0) then
  begin
    @AllocateUserPhysicalPages := GetProcAddress(hKernel, 'AllocateUserPhysicalPages');
    @FreeUserPhysicalPages := GetProcAddress(hKernel, 'FreeUserPhysicalPages');
    @MapUserPhysicalPages := GetProcAddress(hKernel, 'MapUserPhysicalPages');
  end;
  Result := (hKernel <> 0) and Assigned(AllocateUserPhysicalPages) and
    Assigned(MapUserPhysicalPages) and Assigned(FreeUserPhysicalPages);
end;

constructor TAddrWindow.Create();
begin
  m_pvWindow := nil;
  GetSystemInfo(sm_sinf);
end;

destructor TAddrWindow.Destroy();
begin
  AW_Destroy();
end;

  // 保留地址窗口
function TAddrWindow.AW_Create(dwBytes: ULONG; pvPreferredWindowBase: Pointer = nil): BOOL;
begin
  m_pvWindow := VirtualAlloc(pvPreferredWindowBase, dwBytes, MEM_RESERVE or MEM_PHYSICAL, PAGE_READWRITE);
  Result := (m_pvWindow <> nil);
end;

  // 释放地址窗口
function TAddrWindow.AW_Destroy(): BOOL;
begin
  if (m_pvWindow <> nil) then
  begin
    Result := VirtualFree(m_pvWindow, 0, MEM_RELEASE);
    m_pvWindow := nil;
  end else
    Result := TRUE;
end;

  // 取消 RAM 映射
function TAddrWindow.AW_UnmapStorage(): BOOL;
var
  mbi: TMemoryBasicInformation;
begin
  VirtualQuery(m_pvWindow, mbi, SizeOf(mbi));
  Result := MapUserPhysicalPages(m_pvWindow, mbi.RegionSize div sm_sinf.dwPageSize, nil);
end;

  // 返回窗口地址
function TAddrWindow.AW_Pointer(): Pointer;
begin
  Result := m_pvWindow;
end;

constructor TAddrWindowStorage.Create();
begin
  m_ulPages := 0;
  m_pulUserPfnArray := nil;
  GetSystemInfo(sm_sinf);
end;

destructor TAddrWindowStorage.Destroy();
begin
  AWS_Free();
end;

  // 分配物理 RAM
function TAddrWindowStorage.AWS_Allocate(ulBytes: ULONG): BOOL;
begin
  // 清除以前的分配
  AWS_Free();

  // 计算内存页面数
  m_ulPages := (ulBytes + sm_sinf.dwPageSize) div sm_sinf.dwPageSize;

  // 分配页框号数组
  m_pulUserPfnArray := HeapAlloc(GetProcessHeap(), 0, m_ulPages * SizeOf(ULONG));
  
  if (m_pulUserPfnArray <> nil) then
  begin
    // 分配 RAM 页面
    EnablePrivilege(SE_LOCK_MEMORY_NAME, TRUE);
    Result := AllocateUserPhysicalPages(GetCurrentProcess(), @m_ulPages, m_pulUserPfnArray);
    EnablePrivilege(SE_LOCK_MEMORY_NAME, FALSE);
  end else
    Result := FALSE;
end;

  // 释放物理 RAM
function TAddrWindowStorage.AWS_Free(): BOOL;
begin
  if (m_pulUserPfnArray <> nil) then
  begin
    // 释放 RAM 页面
    if FreeUserPhysicalPages(GetCurrentProcess(), @m_ulPages, m_pulUserPfnArray) then
    begin
      // 释放页框号数组
      HeapFree(GetProcessHeap(), 0, m_pulUserPfnArray);

      m_ulPages := 0;
      m_pulUserPfnArray := nil;

      Result := TRUE;
    end else
      Result := FALSE;
  end else
    Result := TRUE;  
end;

  // 物理页面数量
function TAddrWindowStorage.AWS_HowManyPagesAllocated(): ULONG;
begin
  Result := m_ulPages;
end;

  // 映射RAM至窗口
function TAddrWindowStorage.AWS_MapStorage(aw: TAddrWindow): BOOL;
begin
  Result := MapUserPhysicalPages(aw.AW_Pointer, AWS_HowManyPagesAllocated(), m_pulUserPfnArray);
end;

  // 取消 RAM 映射
function TAddrWindowStorage.AWS_UnmapStorage(aw: TAddrWindow): BOOL;
begin
  Result := MapUserPhysicalPages(aw.AW_Pointer, AWS_HowManyPagesAllocated(), nil);
end;

  // 提升用户权限
function TAddrWindowStorage.EnablePrivilege(pszPrivName: PChar; fEnable: BOOL = TRUE): BOOL;
var
  hToken: THandle;
  tp: TTokenPrivileges;
begin
  // 打开进程令牌
  if OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES, hToken) then
  begin
    // 读出权限Luid
    tp.PrivilegeCount := 1;
    LookupPrivilegeValue(nil, pszPrivName, tp.Privileges[0].Luid);

    // 激活或者禁止
    if fEnable then
      tp.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED
    else
      tp.Privileges[0].Attributes := 0;

    // 设置用户权限
    AdjustTokenPrivileges(hToken, FALSE, tp, SizeOf(TTokenPrivileges), PTokenPrivileges(nil)^, PULONG(nil)^);
    Result := (GetLastError() = ERROR_SUCCESS);

    CloseHandle(hToken);
  end else
    Result := FALSE;
end;

  // 注, 在麻子的Window XP上打开"Lock Pages in Memory"权限, 步骤如下:
  // 开始 -> 设置 -> 控制面板 -> 管理工具 -> 本地安全策略 -> 本地策略 ->
  // 用户权利指派 -> 内存中锁定页 -> 属性 -> 添加用户或组, 即可....
end.
