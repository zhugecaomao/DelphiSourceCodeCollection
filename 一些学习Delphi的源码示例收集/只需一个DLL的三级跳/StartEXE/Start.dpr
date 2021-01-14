program Start;

{$R '..\IconRes\Liumazi.res' '..\IconRes\Liumazi.txt'}

uses Windows, FUnit in 'FUnit.pas';

begin
  if (OpenMutex(MUTEX_ALL_ACCESS, FALSE, ExeMutex) <> 0) or
     (OpenMutex(MUTEX_ALL_ACCESS, FALSE, DllMutex) <> 0) then Exit;
     
 // 建立互斥对象              
  HMutex := CreateMutex(nil, TRUE, ExeMutex);
  
 // 寻找Explorer
  ExplorerPID := FindProcess('Explorer.exe');
  if (ExplorerPID = 0) then
  begin
    MessageBox(0, '寻找Explorer出错 ', nil, 0);  Exit;
  end;
  
 // 创建映射文件
  FileMap := CreateFileMapping($FFFFFFFF, nil, PAGE_READWRITE, 0, SizeOf(TNode), FileMapName);
  if (FileMap = 0) then
  begin
    MessageBox(0, '创建映射文件出错 ', nil, 0);  Exit;
  end;
  
 // 映射到本进程
  PtNode := MapViewOfFile(FileMap, FILE_MAP_WRITE, 0, 0, 0);
  if (PtNode = nil) then
  begin
    MessageBox(0, '映射到本进程出错 ', nil, 0);    
    CloseHandle(FileMap);  Exit;
  end;

 // 写入数据
  PtNode^.MainThread := GetCurrentThreadID();
  PtNode^.ExplorerID := ExplorerPID;

 // 关闭映射
  UnmapViewOfFile(PtNode);
  
 // 挂跳板钩子
  GetMsgHookOn;

 // 消息循环(1.线程不立即结束,使得跳板钩子持续有效; 2.等待插入Explorer的新线程发来WM_QUIT)
  while GetMessage(Msg, 0, 0, 0) do;
  
 // 脱跳板钩子
  GetMsgHookOff;

 // 关闭映射文件
  CloseHandle(FileMap);
  
 // 释放互斥对象
  ReleaseMutex(HMutex);
end.
