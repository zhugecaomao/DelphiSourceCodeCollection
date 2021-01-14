unit VMQuery;

interface

uses Windows;

type
  TVMQuery = record
    // 1. Region information
    pvRgnBaseAddress: Pointer;
    dwRgnProtection: DWORD; // PAGE_*
    RgnSize: DWORD;
    dwRgnStorage: DWORD;    // MEM_*: Free, Image, Mapped, Private
    dwRgnBlocks: DWORD;
    dwRgnGuardBlks: DWORD;  // If > 0, region contains thread stack
    fRgnIsAStack: BOOL;     // TRUE if region contains thread stack

    // 2. Block information
    pvBlkBaseAddress: Pointer;
    dwBlkProtection: DWORD; // PAGE_*
    BlkSize: DWORD;
    dwBlkStorage: DWORD;    // MEM_*: Free, Reserve, Image, Mapped, Private
  end;

function VM_Query(hProcess: THandle; pvAddress: Pointer; var pVMQ: TVMQuery): BOOL;

implementation

type
  TVMQuery_Help = record
    RgnSize: DWORD;
    dwRgnStorage: DWORD;   // MEM_*: Free, Image, Mapped, Private
    dwRgnBlocks: DWORD;
    dwRgnGuardBlks: DWORD; // If > 0, region contains thread stack
    fRgnIsAStack: BOOL;    // TRUE if region contains thread stack
  end;

  // 分配粒度
var gs_dwAllocGran: DWORD = 0;

  // 遍历一个"区域"中的所有块
function VMQueryHelp(hProcess: THandle; pvAddress: Pointer; var pVMQHelp: TVMQuery_Help): BOOL;
var
  dwProtectBlock: array[0..3] of DWORD;
  mbi: TMemoryBasicInformation;
  pvRgnBaseAddress, pvAddressBlk: Pointer;
begin
  ZeroMemory(@dwProtectBlock, SizeOf(dwProtectBlock));
  ZeroMemory(@pVMQHelp, SizeOf(pVMQHelp));

  // 查询内存信息
  Result := VirtualQueryEx(hProcess, pvAddress, mbi, SizeOf(mbi)) = SizeOf(mbi);
  if (not Result) then Exit;

  // "区域"基地址
  pvRgnBaseAddress := mbi.AllocationBase;
  
  pvAddressBlk := pvRgnBaseAddress;
  pVMQHelp.dwRgnStorage := mbi.Type_9;

  // 遍历该"区域"
  while TRUE do
  begin
    // 查询当前"块"信息
    Result := VirtualQueryEx(hProcess, pvAddressBlk, mbi, SizeOf(mbi)) = SizeOf(mbi);
    if (not Result) then Break;

    // 已超出"区域"范围
    if (mbi.AllocationBase <> pvRgnBaseAddress) then Break;

    // Windows98线程堆栈所在"区域"的最后4个"块"看起来象这样:
    // 1. reserved, 2. no access, 3. read-write, 4. reserved
    // 所以, 我们用一个数组来保存最后4"块"的相关信息 :)
    if (pVMQHelp.dwRgnBlocks < 4) then
    begin
      if (mbi.State = MEM_RESERVE) then
        dwProtectBlock[pVMQHelp.dwRgnBlocks] := 0
      else
        dwProtectBlock[pVMQHelp.dwRgnBlocks] := mbi.Protect;
    end else
    begin
      MoveMemory(@dwProtectBlock[0], @dwProtectBlock[1], SizeOf(dwProtectBlock) - SizeOf(DWORD));
      if (mbi.State = MEM_RESERVE) then
        dwProtectBlock[3] := 0
      else
        dwProtectBlock[3] := mbi.Protect;
    end;

    // 包含"块"计数
    Inc(pVMQHelp.dwRgnBlocks);

    // "区域"总长度
    Inc(pVMQHelp.RgnSize, mbi.RegionSize);

    // 保护"块"计数
    if ((mbi.Protect and PAGE_GUARD) = PAGE_GUARD) then Inc(pVMQHelp.dwRgnGuardBlks);

    // **
    if (pVMQHelp.dwRgnStorage = MEM_PRIVATE) then pVMQHelp.dwRgnStorage := mbi.Type_9;

    // 跳到下一"块"
    Inc(PByte(pvAddressBlk), mbi.RegionSize);
  end;

  // 现在猜测此"区域"是否堆栈空间
  // 1. Windows 9x: 见上, 不再复述
  // 2. Windows 2k: 至少有一"块"具有PAGE_GUARD属性
  pVMQHelp.fRgnIsAStack :=
    (pVMQHelp.dwRgnGuardBlks > 0) or
    (
      (pVMQHelp.dwRgnBlocks >= 4) and
      (dwProtectBlock[0] = 0)     and
      (dwProtectBlock[1] = PAGE_NOACCESS)  and
      (dwProtectBlock[2] = PAGE_READWRITE) and
      (dwProtectBlock[3] = 0)
    );

  Result := TRUE;
end;

  // 扩展的VirtualQuery()
function VM_Query(hProcess: THandle; pvAddress: Pointer; var pVMQ: TVMQuery): BOOL;
var
  sinf: TSystemInfo;
  mbi: TMemoryBasicInformation;
  VMQHelp: TVMQuery_Help;
begin
  if (gs_dwAllocGran = 0) then
  begin
    GetSystemInfo(sinf);
    gs_dwAllocGran := sinf.dwAllocationGranularity;
  end;
  ZeroMemory(@pVMQ, SizeOf(pVMQ));

  // 查询内存信息
  Result := VirtualQueryEx(hProcess, pvAddress, mbi, SizeOf(mbi)) = SizeOf(mbi);
  if (not Result) then Exit;

  // 填写"块"信息
  case (mbi.State) of
    MEM_FREE:       // Free block (not reserved)
      begin
        pVMQ.pvBlkBaseAddress := nil;
        pVMQ.BlkSize := 0;
        pVMQ.dwBlkProtection := 0;
        pVMQ.dwBlkStorage := MEM_FREE;
      end;
    MEM_RESERVE:    // Reserved block without committed storage in it.
      begin
        pVMQ.pvBlkBaseAddress := mbi.BaseAddress;
        pVMQ.BlkSize := mbi.RegionSize;
        pVMQ.dwBlkProtection := mbi.AllocationProtect;
        pVMQ.dwBlkStorage := MEM_RESERVE;
      end;
    MEM_COMMIT:     // Reserved block with committed storage in it.
      begin
        pVMQ.pvBlkBaseAddress := mbi.BaseAddress;
        pVMQ.BlkSize := mbi.RegionSize;
        pVMQ.dwBlkProtection := mbi.Protect;
        pVMQ.dwBlkStorage := mbi.Type_9;
      end;

    else Exit;
  end;

  // 填写"区域"信息
  case (mbi.State) of
    MEM_FREE:       // Free block (not reserved)
      begin
        pVMQ.pvRgnBaseAddress := mbi.BaseAddress;
        pVMQ.dwRgnProtection := mbi.AllocationProtect;
        pVMQ.RgnSize := mbi.RegionSize;
        pVMQ.dwRgnStorage := MEM_FREE;
        pVMQ.dwRgnBlocks := 0;
        pVMQ.dwRgnGuardBlks := 0;
        pVMQ.fRgnIsAStack := FALSE;
      end;
    MEM_RESERVE:    // Reserved block without committed storage in it.
      begin
        pVMQ.pvRgnBaseAddress := mbi.AllocationBase;
        pVMQ.dwRgnProtection := mbi.AllocationProtect;

        VMQueryHelp(hProcess, pvAddress, VMQHelp);
        pVMQ.RgnSize := VMQHelp.RgnSize;
        pVMQ.dwRgnStorage := VMQHelp.dwRgnStorage;
        pVMQ.dwRgnBlocks := VMQHelp.dwRgnBlocks;
        pVMQ.dwRgnGuardBlks := VMQHelp.dwRgnGuardBlks;
        pVMQ.fRgnIsAStack := VMQHelp.fRgnIsAStack;
      end;
    MEM_COMMIT:     // Reserved block with committed storage in it.
      begin
        pVMQ.pvRgnBaseAddress := mbi.AllocationBase;
        pVMQ.dwRgnProtection := mbi.AllocationProtect;

        VMQueryHelp(hProcess, pvAddress, VMQHelp);
        pVMQ.RgnSize := VMQHelp.RgnSize;
        pVMQ.dwRgnStorage := VMQHelp.dwRgnStorage;
        pVMQ.dwRgnBlocks := VMQHelp.dwRgnBlocks;
        pVMQ.dwRgnGuardBlks := VMQHelp.dwRgnGuardBlks;
        pVMQ.fRgnIsAStack := VMQHelp.fRgnIsAStack;
      end;
      
    else Exit;
  end;
end;

end.
