unit FUnit;

interface

uses Windows;

type
  TNode = record       // 内存映射变量结构
    MainThread: DWORD; // Start.exe线程ID
    ExplorerID: DWORD; // Explorer 进程ID
  end;
  PNode = ^TNode;

const
  ExeMutex = 'JumpInsert_ExeMutex_Mazi'; // 防止多个进程同时进行插入
  DllMutex = 'JumpInsert_DllMutex_Mazi'; // 保证只插入一个线程
  FileMapName = 'JumpInsert_FileMap_Mazi'; // 内存映射文件名

var
  HMutex: THandle;  // 互斥对象
  Msg: TMsg;        // 标准消息结构
  FileMap: THandle; // 内存映射文件句柄
  PtNode: PNode;    // 映射内存地址
  ExplorerPID: DWORD; // Explorer进程ID

    //----寻找指定进程,返回其ID----//
function FindProcess(ExeName: string): DWORD;
    //------------ DLL ------------//
procedure  GetMsgHookOn; external '..\JumpDLL\Insert.dll';
procedure GetMsgHookOff; external '..\JumpDLL\Insert.dll';
    //------------ DLL ------------//

implementation

type //----进程信息结构----//
  TProcessEntry32 = packed record
    dwSize: DWORD;              // 结构尺寸
    cntUsage: DWORD;
    th32ProcessID: DWORD;       // this process
    th32DefaultHeapID: DWORD;
    th32ModuleID: DWORD;        // associated exe
    cntThreads: DWORD;
    th32ParentProcessID: DWORD; // this process's parent process
    pcPriClassBase: Longint;    // Base priority of process's threads
    dwFlags: DWORD;
    szExeFile: array[0..MAX_PATH - 1] of Char;
  end;
    //---------Tool API----------//
function CreateToolhelp32Snapshot(dwFlags, th32ProcessID: DWORD): THandle stdcall; external 'kernel32.dll';
function Process32First(hSnapshot: THandle; var lppe: TProcessEntry32): BOOL stdcall; external 'kernel32.dll';
function Process32Next(hSnapshot: THandle; var lppe: TProcessEntry32): BOOL stdcall; external 'kernel32.dll';
    //---------Tool API----------//

    //----寻找指定进程,返回其ID----//
function FindProcess(ExeName: string): DWORD;
var
  sphandle: THandle;  Found: BOOL;
  PStruct: TProcessEntry32;
     // 尾串是否匹配,不分大小写
  function AnsiEndsText(const ASubText, AText: string): Boolean;
  var
    P: PChar;
    L, L2: Integer;
  begin
    P := PChar(AText);
    L := Length(ASubText);
    L2 := Length(AText);
    Inc(P, L2 - L);
    if (L > L2) then
      Result := FALSE
    else
      Result := CompareString(LOCALE_USER_DEFAULT, NORM_IGNORECASE,P, L, PChar(ASubText), L) = 2;
  end;       
begin                                      	
  Result := 0;
    	        	
  sphandle := CreateToolhelp32Snapshot($00000002, 0);
  PStruct.dwSize := Sizeof(PStruct);
  Found := Process32First(sphandle, PStruct);

  while Found do
  begin
    if AnsiEndsText(ExeName, PStruct.szExefile) then
    begin
      Result := PStruct.th32ProcessID;
      Break;
    end;
    
    Found := Process32Next(sphandle, PStruct);
  end;
  
  CloseHandle(sphandle);
end;

end.
