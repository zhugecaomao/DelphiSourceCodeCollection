
// Module name: VMQuery.H & VMQuery.C ->> VMQuery.pas
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: 刘麻子, Liu_mazi@126.com

unit VMQuery;

interface

uses Windows;

type
  PVMQuery = ^TVMQuery;
  TVMQuery = record
    // 1. 区域信息
    pvRgnBaseAddress: Pointer;
    dwRgnProtection: DWORD; // PAGE_*
    dwRgnSize: DWORD;
    dwRgnStorage: DWORD;    // MEM_*: Free, Image, Mapped, Private
    dwRgnBlocks: DWORD;
    dwRgnGuardBlks: DWORD;  // If > 0, region contains thread stack
    fRgnIsAStack: BOOL;     // TRUE if region contains thread stack

    // 2. 块信息
    pvBlkBaseAddress: Pointer;
    dwBlkProtection: DWORD; // PAGE_*
    dwBlkSize: DWORD;
    dwBlkStorage: DWORD;    // MEM_*: Free, Reserve, Image, Mapped, Private
  end;

  // VirtualQuery增强版
function VM_Query(pvAddress: Pointer; var pVMQ: TVMQuery): BOOL;

implementation

uses CmnHdr, Other;

type
  TVMQueryHelp = record
    dwRgnSize: DWORD;
    dwRgnStorage: DWORD;   // MEM_*: Free, Image, Mapped, Private
    dwRgnBlocks: DWORD;
    dwRgnGuardBlks: DWORD; // If > 0, region contains thread stack
    fRgnIsAStack: BOOL;    // TRUE if region contains thread stack
  end;

  // 分配粒度
var gs_dwAllocGran: DWORD = 0;

{$Define NtBug_VirtualQuery}

{$IfDef NtBug_VirtualQuery}
  // 修正 Windows.VirtualQuery
function VirtualQuery(lpvAddress: Pointer; var pmbiBuffer: TMemoryBasicInformation; cbLength: DWORD): DWORD;
begin
  Result := Windows.VirtualQuery(lpvAddress, pmbiBuffer, cbLength);

  if (Result = cbLength) then
  begin
    if (DWORD(pmbiBuffer.AllocationBase) mod $1000 = $0FFF) then Inc(PByte(pmbiBuffer.AllocationBase));
    if (DWORD(pmbiBuffer.RegionSize) mod $1000 = $0FFF) then Inc(pmbiBuffer.RegionSize);
    if (pmbiBuffer.State <> MEM_FREE) and (pmbiBuffer.AllocationProtect = 0) then
      pmbiBuffer.AllocationProtect := PAGE_READONLY;
  end;
end;
{$EndIf}

  // 遍历区域内各块(以得到需要的信息)
function VMQueryHelp(pvAddress: Pointer; var pVMQHelp: TVMQueryHelp): BOOL;
var
  MBI: TMemoryBasicInformation;
  pvRgnBaseAddress, pvAddressBlk: Pointer;
  dwProtectBlock: array[0..3] of DWORD;
begin
  chINITSTRUCT(dwProtectBlock, SizeOf(dwProtectBlock), FALSE);
  chINITSTRUCT(pVMQHelp, SizeOf(pVMQHelp), FALSE);

  Result := VirtualQuery(pvAddress, MBI, SizeOf(MBI)) = SizeOf(MBI);
  if (Result = FALSE) then Exit;

  pvRgnBaseAddress := MBI.AllocationBase;
  pvAddressBlk := MBI.AllocationBase;
  pVMQHelp.dwRgnStorage := MBI.Type_9;

  while TRUE do
  begin
    // 查询当前"块"
    Result := VirtualQuery(pvAddressBlk, MBI, SizeOf(MBI)) = SizeOf(MBI);
    if (Result = FALSE) or (MBI.AllocationBase <> pvRgnBaseAddress) then Break;

    // 最后4块状态
    if (pVMQHelp.dwRgnBlocks < 4) then
    begin
      dwProtectBlock[pVMQHelp.dwRgnBlocks] := IfThen(MBI.State = MEM_RESERVE, 0, MBI.Protect);
    end else
    begin
      MoveMemory(@dwProtectBlock[0], @dwProtectBlock[1], SizeOf(dwProtectBlock) - SizeOf(DWORD));
      dwProtectBlock[3] := IfThen(MBI.State = MEM_RESERVE, 0, MBI.Protect);
    end;

    Inc(pVMQHelp.dwRgnBlocks);
    Inc(pVMQHelp.dwRgnSize, MBI.RegionSize);
    if (MBI.Protect and PAGE_GUARD <> 0) then Inc(pVMQHelp.dwRgnGuardBlks);
    if (pVMQHelp.dwRgnStorage = MEM_PRIVATE) then pVMQHelp.dwRgnStorage := MBI.Type_9;

    // 下一"块"地址
    Inc(PByte(pvAddressBlk), MBI.RegionSize);
  end;

  // 是否堆栈空间
  pVMQHelp.fRgnIsAStack :=
    (pVMQHelp.dwRgnGuardBlks > 0) or
    (
      (pVMQHelp.dwRgnBlocks >= 4) and
      (dwProtectBlock[0] = 0) and
      (dwProtectBlock[1] = PAGE_NOACCESS) and
      (dwProtectBlock[2] = PAGE_READWRITE) and
      (dwProtectBlock[3] = 0)
    );

  Result := TRUE;
end;

  // VirtualQuery增强版
function VM_Query(pvAddress: Pointer; var pVMQ: TVMQuery): BOOL;
var
  MBI: TMemoryBasicInformation;
  VMQHelp: TVMQueryHelp;
  SI: TSystemInfo;
begin
  if (gs_dwAllocGran = 0) then
  begin
    GetSystemInfo(SI);
    gs_dwAllocGran := SI.dwAllocationGranularity;
  end;

  chINITSTRUCT(pVMQ, SizeOf(pVMQ), FALSE);
  Result := VirtualQuery(pvAddress, MBI, SizeOf(MBI)) = SizeOf(MBI);
  if (Result = FALSE) then Exit;

  // 块相关信息
  case (MBI.State) of
    MEM_FREE:
      begin
        pVMQ.pvBlkBaseAddress := nil;
        pVMQ.dwBlkSize := 0;
        pVMQ.dwBlkProtection := 0;
        pVMQ.dwBlkStorage := MEM_FREE;
      end;
    MEM_RESERVE:
      begin
        pVMQ.pvBlkBaseAddress := MBI.BaseAddress;
        pVMQ.dwBlkSize := MBI.RegionSize;
        pVMQ.dwBlkProtection := MBI.AllocationProtect;
        pVMQ.dwBlkStorage := MEM_RESERVE;
      end;
    MEM_COMMIT:
      begin
        pVMQ.pvBlkBaseAddress := MBI.BaseAddress;
        pVMQ.dwBlkSize := MBI.RegionSize;
        pVMQ.dwBlkProtection := MBI.Protect;
        pVMQ.dwBlkStorage := MBI.Type_9;
      end;
  end;

  // 区域相关信息
  case (MBI.State) of
    MEM_FREE:
      begin
        pVMQ.pvRgnBaseAddress := MBI.BaseAddress;
        pVMQ.dwRgnProtection := MBI.AllocationProtect;
        pVMQ.dwRgnSize := MBI.RegionSize;
        pVMQ.dwRgnStorage := MEM_FREE;
        pVMQ.dwRgnBlocks := 0;
        pVMQ.dwRgnGuardBlks := 0;
        pVMQ.fRgnIsAStack := FALSE;
      end;
    MEM_RESERVE:
      begin
        pVMQ.pvRgnBaseAddress := MBI.AllocationBase;
        pVMQ.dwRgnProtection := MBI.AllocationProtect;
        VMQueryHelp(pvAddress, VMQHelp); // 辅助查询
        pVMQ.dwRgnSize := VMQHelp.dwRgnSize;
        pVMQ.dwRgnStorage := VMQHelp.dwRgnStorage;
        pVMQ.dwRgnBlocks := VMQHelp.dwRgnBlocks;
        pVMQ.dwRgnGuardBlks := VMQHelp.dwRgnGuardBlks;
        pVMQ.fRgnIsAStack := VMQHelp.fRgnIsAStack;
      end;
    MEM_COMMIT:
      begin
        pVMQ.pvRgnBaseAddress := MBI.AllocationBase;
        pVMQ.dwRgnProtection := MBI.AllocationProtect;
        VMQueryHelp(pvAddress, VMQHelp); // 辅助查询
        pVMQ.dwRgnSize := VMQHelp.dwRgnSize;
        pVMQ.dwRgnStorage := VMQHelp.dwRgnStorage;
        pVMQ.dwRgnBlocks := VMQHelp.dwRgnBlocks;
        pVMQ.dwRgnGuardBlks := VMQHelp.dwRgnGuardBlks;
        pVMQ.fRgnIsAStack := VMQHelp.fRgnIsAStack;
      end;
  end;
end;

end.
