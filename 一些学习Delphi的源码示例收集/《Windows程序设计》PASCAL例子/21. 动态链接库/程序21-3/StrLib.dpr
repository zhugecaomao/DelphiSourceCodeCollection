library StrLib;

uses Windows;

const
  MAX_STRINGS = 256; // 字符串个数限制
  MAX_LENGTH  = 63;  // 字符串长度限制
  SHARE_NAME  = 'Share'; // 映射文件名

type
  PShareMem = ^TShareMem;
  TShareMem = record // 内存映射结构
    iTotal: Integer;
    szStrings: array[0..MAX_STRINGS - 1] of array[0..MAX_LENGTH] of WideChar;
  end;
  PGetStrCB = function (pString, pParam: Pointer): BOOL; stdcall; // 回调形式

var
  FileMap: LongWord; // 映射文件句柄
  PShared: PShareMem; // 内存映射指针

  // 添加字符串(Unicode版)
function AddStringW(pStringIn: PWideChar): BOOL; stdcall;
var
  i: Integer;
begin
  Result := FALSE;
  if (PShared.iTotal = MAX_STRINGS - 1) then Exit; // 字符串列表满
  if (pStringIn^ = #0) then Exit; // 参数空串
  for i := PShared.iTotal downto 1 do // 寻找合适插入点, 并移出空位
  begin
    if CompareStringW(LOCALE_USER_DEFAULT, NORM_IGNORECASE, pStringIn, -1,
      @PShared.szStrings[i - 1][0], -1) in [2, 3] then Break; // 不小于
    CopyMemory(@PShared.szStrings[i][0], @PShared.szStrings[i - 1][0], (MAX_LENGTH + 1) * SizeOf(WideChar));
  end;
  CopyMemory(@PShared.szStrings[i][0], pStringIn, (MAX_LENGTH + 1) * SizeOf(WideChar));
  Inc(PShared.iTotal); // 字符串个数增加
  Result := TRUE;
end;

  // 添加字符串(Ansi版)
function AddStringA(pStringIn: PChar): BOOL; stdcall;
var
  iLength: Integer;
  pWideStr: PWideChar;
begin
  iLength := MultiByteToWideChar(CP_ACP, 0, pStringIn, -1, nil, 0) + SizeOf(WideChar);
  GetMem(pWideStr, iLength);
  MultiByteToWideChar(CP_ACP, 0, pStringIn, -1, pWideStr, iLength); // 转换
  Result := AddStringW(pWideStr); // 调用AddStringW()添加
  FreeMem(pWideStr);
end;

  // 删除字符串(Unicode版)
function DeleteStringW(pStringIn: PWideChar): BOOL; stdcall;
var
  i, j: Integer;
begin
  Result := FALSE;
  if (PShared.iTotal = 0) then Exit; // 字符串列表空
  if (pStringIn^ = #0) then Exit; // 参数字串
  for i := 0 to PShared.iTotal - 1 do
  begin
    if CompareStringW(LOCALE_USER_DEFAULT, NORM_IGNORECASE,
      pStringIn, -1, @PShared.szStrings[i][0], -1) = 2 then Break; // 相等
  end;
  if (i = PShared.iTotal) then Exit;  // 不存在
  for j := i to PShared.iTotal - 1 do // 移动覆盖
    CopyMemory(@PShared.szStrings[j][0], @PShared.szStrings[j + 1][0], (MAX_LENGTH + 1) * SizeOf(WideChar));
  Dec(PShared.iTotal); // 字符串数减少
  PShared.szStrings[PShared.iTotal][0] := #0; // 置空
  Result := TRUE;
end;

  // 删除字符串(Ansi版)
function DeleteStringA(pStringIn: PChar): BOOL; stdcall;
var
  iLength: Integer;
  pWideStr: PWideChar;
begin
  iLength := MultiByteToWideChar(CP_ACP, 0, pStringIn, -1, nil, 0) + SizeOf(WideChar);
  GetMem(pWideStr, iLength);
  MultiByteToWideChar(CP_ACP, 0, pStringIn, -1, pWideStr, iLength); // 转换
  Result := DeleteStringW(pWideStr); // 调用DeleteStringW()删除
  FreeMem(pWideStr);
end;

  // 枚举字符串(Unicode版)
function GetStringsW(pfnGetStrCallBack: PGetStrCB; pParam: Pointer): Integer; stdcall;
var
  bReturn: Boolean;
  i: Integer;
begin
  for i := 0 to PShared.iTotal -1 do
  begin
    bReturn := pfnGetStrCallBack(@PShared.szStrings[i][0], pParam); // 调用者提供的回调函数
    if (bReturn = FALSE) then
    begin
      Result := i + 1;  Exit; // 返回实际枚举次数
    end;
  end;
  Result := PShared.iTotal;
end;

  // 枚举字符串(Ansi版)
function GetStringsA(pfnGetStrCallBack: PGetStrCB; pParam: Pointer): Integer; stdcall;
var
  bReturn: Boolean;
  i, iLength: Integer;
  pAnsiStr: PChar;
begin
  for i := 0 to PShared.iTotal - 1 do
  begin
    iLength := WideCharToMultiByte(CP_ACP, 0, @PShared.szStrings[i][0], -1, nil, 0, nil, nil) + SizeOf(Char);
    GetMem(pAnsiStr, iLength);
    WideCharToMultiByte(CP_ACP, 0, @PShared.szStrings[i][0], -1, pAnsiStr, iLength, nil, nil); // 转换
    bReturn := pfnGetStrCallBack(pAnsiStr, pParam); // 调用者提供的回调函数
    FreeMem(pAnsiStr);
    if (bReturn = FALSE) then // 调用者要求停止
    begin
      Result := i + 1;  Exit; // 返回实际枚举次数
    end;
  end;
  Result := PShared.iTotal;
end;

exports
  AddStringW, AddStringA, DeleteStringW, DeleteStringA, GetStringsW, GetStringsA; // 导出

  // 入口函数
procedure DLLMain(dwReason: DWORD);
begin
  if (dwReason = DLL_PROCESS_DETACH) then
  begin
    UnmapViewOfFile(PShared);
    CloseHandle(FileMap);
  end;
end;

begin
  DllProc := @DLLMain; // 设置入口
  FileMap := OpenFileMapping(FILE_MAP_ALL_ACCESS, FALSE, SHARE_NAME); // 尝试打开
  if (FileMap = 0) then // 未建立
  begin
    FileMap :=
      CreateFileMapping($FFFFFFFF, nil, PAGE_READWRITE, 0, SizeOf(TShareMem), SHARE_NAME);
    PShared := MapViewOfFile(FileMap, FILE_MAP_ALL_ACCESS, 0, 0, 0);
    ZeroMemory(PShared, SizeOf(TShareMem));
  end else
    PShared := MapViewOfFile(FileMap, FILE_MAP_ALL_ACCESS, 0, 0, 0);
end.
