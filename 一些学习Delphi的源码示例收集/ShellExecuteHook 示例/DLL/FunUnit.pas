unit FunUnit;

interface

uses Windows;

function ExtractFileName(const FullName: string): string; // 解出文件名
function CompareAnsiText(const Str1, Str2: string): Boolean; // 字符串比较
procedure SetRegStr(RootKey: HKEY; const StrPath, StrName, StrData: PChar); // 设置键值
procedure DelRegStr(RootKey: HKEY; const StrPath, StrValue: PChar); // 删除键值
function QueryRegStr(RootKey: HKEY; const StrPath, StrValue: PChar): Boolean; // 查询键值
procedure DeleteFileRestart(const FileName: string); // 删除文件(重启后)

implementation

  // 解出文件名
function ExtractFileName(const FullName: string): string;
var
  P: Integer;
begin
  P := Length(FullName);
  while (P > 0) and (FullName[P] <> '\') and (FullName[P] <> ':') do Dec(P);
  Result := Copy(FullName, P + 1, Length(FullName) - P);
end;

  // 字符串比较
function CompareAnsiText(const Str1, Str2: string): Boolean;
begin
  Result :=
    CompareString(LOCALE_USER_DEFAULT, NORM_IGNORECASE, @Str1[1], -1, @Str2[1], -1) = 2;
end;

  // 设置注册表键值
procedure SetRegStr(RootKey: HKEY; const StrPath, StrName, StrData: PChar);
    // 返回字符串长度
  function StrLen(const Str: PChar): Cardinal; assembler;
  asm
        MOV     EDX,EDI
        MOV     EDI,EAX
        MOV     ECX,0FFFFFFFFH
        XOR     AL,AL
        REPNE   SCASB
        MOV     EAX,0FFFFFFFEH
        SUB     EAX,ECX
        MOV     EDI,EDX
  end;
var
  TempKey: HKEY;
  Disposition, DataSize: LongWord;
begin
 // 打开
  TempKey := 0;
  Disposition := REG_CREATED_NEW_KEY;
  RegCreateKeyEx(RootKey, StrPath, 0, nil, 0, KEY_ALL_ACCESS, nil, TempKey, @Disposition);

 // 添加
  DataSize := StrLen(StrData) + 1;
  RegSetValueEx(TempKey, StrName, 0, REG_SZ, StrData, DataSize);
  
 // 关闭
  RegCloseKey(TempKey);
end;

  // 删除注册表键值
procedure DelRegStr(RootKey: HKEY; const StrPath, StrValue: PChar);
var
  TempKey: HKEY;
  Disposition: LongWord;
begin
 // 打开
	TempKey := 0;
  Disposition := REG_OPENED_EXISTING_KEY;
	RegCreateKeyEx(RootKey, StrPath, 0, nil, 0, KEY_ALL_ACCESS, nil, TempKey, @Disposition);

 // 删除
	RegDeleteValue(TempKey, StrValue);
  
 // 关闭
	RegCloseKey(TempKey);
end;

  // 查询注册表键值
function QueryRegStr(RootKey: HKEY; const StrPath, StrValue: PChar): Boolean;
var
  TempKey: Hkey;
  Disposition, ValueType: LongWord;
begin
 // 打开
	TempKey := 0;
  Disposition := REG_OPENED_EXISTING_KEY;
	RegCreateKeyEx(RootKey, StrPath, 0, nil, 0, KEY_ALL_ACCESS, nil, TempKey, @Disposition);

 // 查询
	ValueType := REG_SZ;
	Result := RegQueryValueEx(TempKey, StrValue, nil, @ValueType, nil, nil) = ERROR_SUCCESS;
  
 // 关闭
	RegCloseKey(TempKey);
end;

  // 删除文件(重启后)
procedure DeleteFileRestart(const FileName: string);
    // 是否9x操作系统
  function IsWindows9x(): Boolean;
  var
    Osi: TOSVersionInfo;
  begin
    Osi.dwOSVersionInfoSize := SizeOf(Osi);
    GetVersionEx(Osi);
    Result := Osi.dwPlatformId <> VER_PLATFORM_WIN32_NT;
  end;
var
  PathBuff: array[0..MAX_PATH] of Char;
begin
  if (IsWindows9x() = FALSE) then
    MoveFileEx(@FileName[1], nil, MOVEFILE_DELAY_UNTIL_REBOOT) // 由该函数写注册表
  else begin
    GetShortPathName(@FileName[1], @PathBuff[0], MAX_PATH); // 转为"8.3命名法"短文件名
    WritePrivateProfileString('rename', 'NUL', @PathBuff[0], 'wininit.ini'); // 写wininit文件
  end;
end;

end.
