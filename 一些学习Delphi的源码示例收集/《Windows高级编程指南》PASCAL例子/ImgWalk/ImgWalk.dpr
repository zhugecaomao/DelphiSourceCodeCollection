
// Module name: ImgWalk.C ->> ImgWalk.dpr
// Notices: Copyright (c) 1995-1997 Jeffrey Richter
// Translator: ÁõÂé×Ó, Liu_mazi@126.com

library ImgWalk;

uses Windows, CmnHdr in '..\CmnHdr.pas', Other in '..\Other.pas';

var
  lp: PByte = nil;
  nLen: Integer;
  mbi: TMemoryBasicInformation;
  szBuf: array[0..MAX_PATH * 30] of Char = '';
  szModName: array[0..MAX_PATH] of Char = '';

  // DLL Èë¿Ú
begin
  while VirtualQuery(lp, mbi, SizeOf(mbi)) = SizeOf(mbi) do
  begin
    if (mbi.State = MEM_FREE) then mbi.AllocationBase := mbi.BaseAddress;

    if (DWORD(mbi.AllocationBase) = HInstance) or // 1. If this region contains this DLL
       (mbi.AllocationBase <> mbi.BaseAddress) or // 2. If this block is NOT the beginning of a region
       (mbi.AllocationBase = nil) then            // 3. If the address is NULL
    begin
      nLen := 0;
    end else
    begin
      nLen := GetModuleFileName(DWORD(mbi.AllocationBase), szModName, chDIMOF(szModName));
    end;

    if (nLen > 0) then
    begin
      _wvsprintf(StrChr(szBuf, #0), #13#10'%08X-%s', [ DWORD(mbi.AllocationBase), DWORD(@szModName) ]);
    end;  

    Inc(lp, mbi.RegionSize);
  end;

  chMB(szBuf, 'ImgWalk');
end.
