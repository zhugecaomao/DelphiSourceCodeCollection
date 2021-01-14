unit Publics;

interface

uses
  Windows;

type
  TNode = record        // 内存映射变量结构
    MainThread: DWORD;  // Start.exe线程ID
    ExplorerID: DWORD;  // Explorer 进程ID
  end;
  PNode = ^TNode;

const
  DllMutex = 'JumpInsert_DllMutex_Mazi'; // 保证只插入一个线程
  FileMapName = 'JumpInsert_FileMap_Mazi'; // 内存映射文件名

var
  FileMap: THandle;
  PtNode: PNode;

implementation

end.
