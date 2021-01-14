unit APIHook;

interface

uses Windows, ImageHlp, TlHelp32, Toolhelp;

type
  // API Hook 类
  TAPIHook = class(TObject)
  public
    constructor Create(pszCalleeModName, pszFuncName: LPSTR; pfnHook: FARPROC; fExcludeAPIHookMod: BOOL);
    destructor Destroy(); override;
    function OriginProc(): FARPROC; // 被Hook的函数的原始地址
    class function ThisModuleIsAutoLoad(hModCallee, hModCaller: HMODULE): BOOL; // 模块是否自动加载
    class procedure HookLoadLibraryAndGetProcAddress(fInstall: BOOL); stdcall;  // Hook动态引用函数
  private
    m_pNext: TAPIHook;          // 单链表上下一个同类对象
    m_pszCalleeModName: LPCSTR; // 被HOOK函数所在模块名(ANSI)
    m_pszFuncName: LPCSTR;      // 被HOOK函数名(ANSI)
    m_pfnOrig: FARPROC;         // 原始函数地址
    m_pfnHook: FARPROC;         // 替换函数地址
    m_fExcludeAPIHookMod: BOOL; // 不Hook本模块(LastMsgBoxInfoLib.dll)
    class procedure ReplaceIATEntryInAllMods(pszCalleeModName: LPCSTR; pfnCurrent, pfnNew: FARPROC; fExcludeAPIHookMod: BOOL); stdcall;
    class procedure ReplaceIATEntryInOneMod(pszCalleeModName: LPCSTR; pfnCurrent, pfnNew: FARPROC; hModCaller: HMODULE); stdcall;
    class procedure FixupNewlyLoadedModule(hMod: HMODULE; dwFlags: DWORD); stdcall;
  end;

implementation

type
  // DLL数组结构
  TImageImportDescriptor = record
    OriginalFirstThunk: DWORD; // 保存函数信息的TImageThunkData数组的RVA
    TimeDateStamp, ForwarderChain: DWORD;
    Name: DWORD;               // DLL名称字符串的RVA
    FirstThunk: DWORD;         // 另一份TImageThunkData数组的拷贝的RVA, 装载后,
  end;                         // 该TImageThunkData数组被修改为各函数入口地址
  PImageImportDescriptor = ^TImageImportDescriptor;

  // 函数名称信息
  TImageImportByName = packed record
    Hint: Word; // 如果非0, 表示函数的参考序号
    Name: array [0..0] of Char; // 函数名字符串
  end;
  PImageImportByName = ^TImageImportByName;

  // 函数数组结构
  TImageThunkData = record
    case Integer of               // 最高位不是1, 则为TImageImportByName的RVA,
      0: (ForwarderString: PByte);// 否则, 低31位代表引入的函数的序号, 另外,
      1: (Function_: PDWORD);     // 装载后, 此数组的一份拷贝变为各函数入口地址
      2: (Ordinal: ULONG);
      3: (AddressOfData: PImageImportByName);
  end;
  PImageThunkData = ^TImageThunkData;

const
  cPushOpCode: Byte = $68; // 80x86处理器PUSH指令操作码

var
  sm_pHead: TAPIHook = nil; // 链表表头(首个HOOK对象)
  sm_pvMaxAppAddr: Pointer = nil; // 进程最大可用地址
  sm_LoadLibraryA: TAPIHook = nil; // 重要函数Hook对象
  sm_LoadLibraryW: TAPIHook = nil;
  sm_LoadLibraryExA: TAPIHook = nil;
  sm_LoadLibraryExW: TAPIHook = nil;
  sm_GetProcAddress: TAPIHook = nil;

  // Hook目前所有已装载模块对一个DLL函数的静态调用
constructor TAPIHook.Create(pszCalleeModName, pszFuncName: LPSTR; pfnHook: FARPROC; fExcludeAPIHookMod: BOOL);
var
  SI: TSystemInfo;
begin
  // 此代码可放至其他地方 **
  if (sm_pvMaxAppAddr = nil) then
  begin
    GetSystemInfo(SI);
    sm_pvMaxAppAddr := SI.lpMaximumApplicationAddress;
  end;

  // 将自己添加到对象链表
  m_pNext := sm_pHead;
  sm_pHead := Self;

  // 保存所给HOOK相关信息
  m_pszCalleeModName := pszCalleeModName;
  m_pszFuncName := pszFuncName;
  m_pfnHook := pfnHook;
  m_fExcludeAPIHookMod := fExcludeAPIHookMod;
  m_pfnOrig := GetProcAddress(GetModuleHandleA(pszCalleeModName), m_pszFuncName);

  // 准备Hook的函数不存在
  if (m_pfnOrig = nil) then Exit;

  // 取函数实际地址 **
  if (DWORD(m_pfnOrig) > DWORD(sm_pvMaxAppAddr)) then
  begin
    if (PByte(m_pfnOrig)^ = cPushOpCode) then
      m_pfnOrig := PPointer(DWORD(m_pfnOrig) + 1)^;
  end;

  // 对所有已装载模块Hook
  ReplaceIATEntryInAllMods(m_pszCalleeModName, m_pfnOrig, m_pfnHook, m_fExcludeAPIHookMod);
end;

  // 对目前所有已装载模块取消之前的函数Hook
destructor TAPIHook.Destroy();
var
  p: TAPIHook;
begin
  // 对所有已装载模块反Hook
  ReplaceIATEntryInAllMods(m_pszCalleeModName, m_pfnHook, m_pfnOrig, m_fExcludeAPIHookMod);

  // 将自己从对象链表中摘下
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
    end; // END while ..
  end;
end;

  // 替换所有已装载模块的引入表中的一个函数的地址
class procedure TAPIHook.ReplaceIATEntryInAllMods(pszCalleeModName: LPCSTR;
  pfnCurrent, pfnNew: FARPROC; fExcludeAPIHookMod: BOOL); stdcall;
var
  hModThisMod: HMODULE;
  th: TToolhelp;
  me: TModuleEntry32;
  fOk: BOOL;
begin
  // 是否Hook本DLL (LastMsgBoxInfoLib.dll)
  if fExcludeAPIHookMod then hModThisMod := HInstance else hModThisMod := 0;

  // 快照当前所处进程的模块列表
  th := TToolhelp.Create(TH32CS_SNAPMODULE, GetCurrentProcessId());

  // 枚举各模块, 分别作Hook处理
  me.dwSize := SizeOf(TModuleEntry32);
  fOk := th.ModuleFirst(@me);
  while (fOk) do
  begin
    if (me.hModule <> hModThisMod) then
      ReplaceIATEntryInOneMod(pszCalleeModName, pfnCurrent, pfnNew, me.hModule);

    fOk := th.ModuleNext(@me);
  end;

  th.Free;
end;

  // 替换指定的一个模块的引入表中的一个函数的地址
class procedure TAPIHook.ReplaceIATEntryInOneMod(pszCalleeModName: LPCSTR;
  pfnCurrent, pfnNew: FARPROC; hModCaller: HMODULE); stdcall;
var
  ulSize: ULONG;
  pImportDesc: PImageImportDescriptor;
  pThunk: PImageThunkData;
  pszModName: LPSTR;
  ppfn: ^FARPROC;
  fFound: BOOL;
  dwProtect, dwTemp: DWORD;
begin
  // 定位至函数引入表
  pImportDesc := ImageDirectoryEntryToData(Pointer(hModCaller), TRUE, IMAGE_DIRECTORY_ENTRY_IMPORT, ulSize);
  if (pImportDesc = nil) then Exit;

  // 遍历TImageImportDescriptor数组 (寻找名称匹配的DLL)
  // 注: Delphi生成的PE文件, 并非一个DLL只占数组的一项
  while (pImportDesc.Name <> 0) do
  begin
    pszModName := LPSTR(hModCaller + pImportDesc.Name);
    if (lstrcmpiA(pszModName, pszCalleeModName) = 0) then // DLL名字匹配
    begin
      // 定位至函数地址表
      pThunk := PImageThunkData(hModCaller + pImportDesc.FirstThunk);

      // 遍历TImageThunkData数组 (寻找地址匹配的函数)
      while (pThunk.Function_ <> nil) do
      begin
        // 函数地址变量地址
        ppfn := @pThunk.Function_;

        // 是否要Hook的地址
        fFound := (ppfn^ = pfnCurrent);

        // 取函数真实地址 **
        if (fFound = FALSE) and (DWORD(ppfn^) > DWORD(sm_pvMaxAppAddr)) then
        begin
          if (PByte(ppfn^)^ = cPushOpCode) then
          begin
            ppfn := Pointer(DWORD(ppfn^) + 1);
            fFound := (ppfn^ = pfnCurrent);
          end;
        end;

        // 找到则改写Function_
        if (fFound) then
        begin
          VirtualProtect(ppfn, SizeOf(FARPROC), PAGE_EXECUTE_WRITECOPY, dwProtect);
          WriteProcessMemory(GetCurrentProcess(), ppfn, @pfnNew, SizeOf(FARPROC), dwTemp);
          VirtualProtect(ppfn, SizeOf(FARPROC), dwProtect, dwTemp);
          Break;
        end;

        // 下一个TImageThunkData
        Inc(pThunk);
      end;
    end;

    // 下一个TImageImportDescriptor
    Inc(pImportDesc);
  end;
end;

  // 对新装载的DLL进行Hook处理
class procedure TAPIHook.FixupNewlyLoadedModule(hMod: HMODULE; dwFlags: DWORD); stdcall;
var
  p: TAPIHook;
begin
  if (hMod <> 0) and (hMod <> HInstance) and (dwFlags and LOAD_LIBRARY_AS_DATAFILE = 0) then
  begin
    p := sm_pHead;
    while (p <> nil) do
    begin
      ReplaceIATEntryInOneMod(p.m_pszCalleeModName, p.m_pfnOrig, p.m_pfnHook, hMod);
      p := p.m_pNext;
    end;
  end;
end;

  // LoadLibraryA的替换函数
function Hook_LoadLibraryA(pszModulePath: LPCSTR): HMODULE; stdcall;
begin
  Result := Windows.LoadLibraryA(pszModulePath);
  TAPIHook.FixupNewlyLoadedModule(Result, 0);
end;

  // LoadLibraryW的替换函数
function Hook_LoadLibraryW(pszModulePath: LPCWSTR): HMODULE; stdcall;
begin
  Result := Windows.LoadLibraryW(pszModulePath);
  TAPIHook.FixupNewlyLoadedModule(Result, 0);
end;

  // LoadLibraryExA的替换函数
function Hook_LoadLibraryExA(pszModulePath: LPCSTR; hFile: THandle; dwFlags: DWORD): HMODULE; stdcall;
begin
  Result := Windows.LoadLibraryExA(pszModulePath, hFile, dwFlags);
  TAPIHook.FixupNewlyLoadedModule(Result, dwFlags);
end;

  // LoadLibraryExW的替换函数
function Hook_LoadLibraryExW(pszModulePath: LPCWSTR; hFile: THandle; dwFlags: DWORD): HMODULE; stdcall;
begin
  Result := Windows.LoadLibraryExW(pszModulePath, hFile, dwFlags);
  TAPIHook.FixupNewlyLoadedModule(Result, dwFlags);
end;

  // GetProcAddress()的替换函数
function Hook_GetProcAddress(hMod: HMODULE; pszProcName: LPCSTR): FARPROC; stdcall;
var
  p: TAPIHook;
begin
  // 调用真正的GetProcAddress()
  Result := Windows.GetProcAddress(hMod, pszProcName);

  if (hMod <> HInstance) and (Result <> nil) then
  begin
    p := sm_pHead;
    while (p <> nil) do
    begin
      // 如果这个函数已被Hook, 返回替换函数地址
      if (Result = p.m_pfnOrig) then
      begin
        Result := p.m_pfnHook;
        Break;
      end;
      p := p.m_pNext;
    end;
  end;
  
end;

  // 返回被本对象Hook的DLL函数的实际地址
function TAPIHook.OriginProc(): FARPROC;
begin
  Result := m_pfnOrig;
end;

  // hModCallee是否被hModCaller静态引用
class function TAPIHook.ThisModuleIsAutoLoad(hModCallee, hModCaller: HMODULE): BOOL;
var
  ulSize: ULONG;
  pImportDesc: PImageImportDescriptor;
  pszModName: LPSTR;
begin
  Result := FALSE;

  // 定位至当前进程EXE的函数引入表
  pImportDesc := ImageDirectoryEntryToData(Pointer(hModCaller), TRUE, IMAGE_DIRECTORY_ENTRY_IMPORT, ulSize);
  if (pImportDesc = nil) then Exit;

  // 遍历ImageImportDescriptor数组
  while (pImportDesc.Name <> 0) do
  begin
    // 检查被引用的DLL地址是否匹配
    pszModName := LPSTR(hModCaller + pImportDesc.Name);
    if (GetModuleHandle(pszModName) = hModCallee) then
    begin
      Result := TRUE;
      Exit;
    end;

    // 下一个TImageImportDescriptor
    Inc(pImportDesc);
  end;
end;

  // Hook LoadLibrary和GetProcAddress, 以便监视动态引用
class procedure TAPIHook.HookLoadLibraryAndGetProcAddress(fInstall: BOOL); stdcall;
begin
  if fInstall then
  begin
    if (sm_LoadLibraryA = nil) then
      sm_LoadLibraryA := TAPIHook.Create(Kernel32, 'LoadLibraryA', @Hook_LoadLibraryA, TRUE);

    if (sm_LoadLibraryW = nil) then
      sm_LoadLibraryW := TAPIHook.Create(Kernel32, 'LoadLibraryW', @Hook_LoadLibraryW, TRUE);

    if (sm_LoadLibraryExA = nil) then
      sm_LoadLibraryExA := TAPIHook.Create(Kernel32, 'LoadLibraryExA', @Hook_LoadLibraryExA, TRUE);

    if (sm_LoadLibraryExW = nil) then
      sm_LoadLibraryExW := TAPIHook.Create(Kernel32, 'LoadLibraryExW', @Hook_LoadLibraryExW, TRUE);

    if (sm_GetProcAddress = nil) then
      sm_GetProcAddress := TAPIHook.Create(Kernel32, 'GetProcAddress', @Hook_GetProcAddress, TRUE);
  end else
  begin
    sm_LoadLibraryA.Free;
    sm_LoadLibraryA := nil;

    sm_LoadLibraryW.Free;
    sm_LoadLibraryW := nil;

    sm_LoadLibraryExA.Free;
    sm_LoadLibraryExA := nil;

    sm_LoadLibraryExW.Free;
    sm_LoadLibraryExW := nil;

    sm_GetProcAddress.Free;
    sm_GetProcAddress := nil;
  end;
end;

end.
