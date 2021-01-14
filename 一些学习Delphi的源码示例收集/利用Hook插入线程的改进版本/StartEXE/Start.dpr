program  Start;

uses Windows, Messages;

procedure JumpHookOn ; external '..\HookDLL\Insert.dll';
procedure JumpHookOff; external '..\HookDLL\Insert.dll';
  
const
  ExeMutex = 'HookInsert_ExeMutex_Mazi'; // 防止同时进行插入
  DllMutex = 'HookInsert_DllMutex_Mazi'; // 保证只插一个线程
  FileMapName = 'HookInsert_FileMap_Mazi'; // 内存映射文件

var
  MsgStruct: TMsg;
  MutexHandle, FileHandle: THandle;
  PCurThreadID: PDWORD;

begin
  if (OpenMutex(MUTEX_ALL_ACCESS, FALSE, ExeMutex) <> 0) or
     (OpenMutex(MUTEX_ALL_ACCESS, FALSE, DllMutex) <> 0) then Exit;  
  MutexHandle := CreateMutex(nil, FALSE, ExeMutex);

  FileHandle := CreateFileMapping($FFFFFFFF, nil, PAGE_READWRITE, 0, SizeOf(DWORD), FileMapName);
  PCurThreadID := MapViewOfFile(FileHandle, FILE_MAP_WRITE, 0, 0, 0);
  PCurThreadID^ := GetCurrentThreadID();
  UnmapViewOfFile(PCurThreadID);

  JumpHookOn;
  while GetMessage(MsgStruct, 0, 0, 0) do ; // 等待WM_QUIT
  JumpHookOff;
   
  CloseHandle(FileHandle);
  PostMessage(HWND_BROADCAST, WM_WININICHANGE, 0, 0);
  
  CloseHandle(MutexHandle);  
end.
