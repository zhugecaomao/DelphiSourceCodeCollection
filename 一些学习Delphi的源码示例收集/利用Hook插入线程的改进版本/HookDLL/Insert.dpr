library  Insert;

{$R '..\IconRes\LiuMazi.res' '..\IconRes\LiuMazi.txt'} // 窗体图标

uses
  Windows, Messages,
  JumpHook in 'JumpHook.pas', Threads in 'Threads.pas',
  MainForm in 'MainForm.pas', Publics in 'Publics.pas';

exports
  JumpHookOn, JumpHookOff;

const
  FileMapName = 'HookInsert_FileMap_Mazi'; // 内存映射文件
  ProcessName = 'Explorer.exe';     // 插入进程对象
  
var
  PMainThreadID: PDWORD;
  MutexHandle, FileHandle, SubThreadID: DWORD;
  ModuleFileName: array [0..MAX_PATH] of Char;

begin
 // 检查DLL进入的进程
  ModuleFileName[GetModuleFileName(0, @ModuleFileName[0], MAX_PATH)] := #0;
  if CompareAnsiText(ExtractFileName(ModuleFileName), ProcessName) then
  begin
   // 保证只建一个线程
    MutexHandle := OpenMutex(MUTEX_ALL_ACCESS, FALSE, DllMutex);
    if (MutexHandle <> 0) then
    begin
      CloseHandle(MutexHandle)
    end  
    else begin
     // 建sProcess子线程
      CreateThread(nil, 0, @ThreadPro, nil, 0, SubThreadID);
     // 增加自身引用计数
      GetModuleFileName(HInstance, @ModuleFileName[0], MAX_PATH);
      LoadLibrary(@ModuleFileName[0]);
     // 通知Start.exe退出
      FileHandle := OpenFileMapping(FILE_MAP_ALL_ACCESS, False, FileMapName);
      PMainThreadID := MapViewOfFile(FileHandle, FILE_MAP_ALL_ACCESS, 0, 0, 0);
      PostThreadMessage(PMainThreadID^, WM_QUIT, 0, 0);
      UnmapViewOfFile(PMainThreadID);
      CloseHandle(FileHandle);                        
    end;
  end;  
end.
