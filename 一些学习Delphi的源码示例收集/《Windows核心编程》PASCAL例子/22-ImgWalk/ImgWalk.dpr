library ImgWalk;

uses Windows;

var
  szBuf: array[0..MAX_PATH * 100] of Char = '';
  szEnd: PAnsiChar = szBuf;
  szModName: array[0..MAX_PATH] of Char;
  mbi: TMemoryBasicInformation;
  pb: PByte = nil;
  nLen: Integer;
  ArgList: array[1..2] of PChar;
begin
  while (VirtualQuery(pb, mbi, SizeOf(TMemoryBasicInformation)) = SizeOf(TMemoryBasicInformation)) do
  begin
    if (mbi.State = MEM_FREE) then mbi.AllocationBase := mbi.BaseAddress;

    if (DWORD(mbi.AllocationBase) = HInstance) or
       (mbi.AllocationBase <> mbi.BaseAddress) or
       (mbi.AllocationBase = nil) then
      nLen := 0
    else
      nLen := GetModuleFileNameA(DWORD(mbi.AllocationBase), szModName, MAX_PATH);

    if (nLen > 0) then
    begin
      ArgList[1] := mbi.AllocationBase;
      ArgList[2] := szModName;
      Inc(szEnd, wvsprintfA(szEnd, #13#10'%p-%s', @ArgList));
    end;

    Inc(pb, mbi.RegionSize);
  end;

  MessageBox(0, szBuf, 'ImgWalk', MB_OK);
end.
