library Insert;

uses
  Windows, Messages,
  Publics in 'Publics.pas',
  Threads in 'Threads.pas',
  JmpHook in 'JmpHook.pas';

exports
  GetMsgHookOn,
  GetMsgHookOff,
  ThreadPro;
    
procedure DLLProcess(dwReason: Integer);
begin    //..退出进程空间..//
  if (dwReason = DLL_PROCESS_DETACH) then
  begin
    if (PtNode <> nil) then UnmapViewOfFile(PtNode);
    if (FileMap <> 0) then CloseHandle(FileMap);
  end;
end;

begin
  DllProc := @DLLProcess;
  
  FileMap := OpenFileMapping(FILE_MAP_ALL_ACCESS, FALSE, FileMapName);
  if (FileMap <> 0) then PtNode := MapViewOfFile(FileMap, FILE_MAP_ALL_ACCESS, 0, 0, 0);
end.
