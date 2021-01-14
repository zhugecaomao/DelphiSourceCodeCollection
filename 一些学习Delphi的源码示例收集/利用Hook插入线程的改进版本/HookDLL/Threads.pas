unit  Threads;

interface

  // 待插线程回调函数
procedure ThreadPro(X: Integer); stdcall;

implementation

uses Windows, Messages, MainForm, Publics;

  // 待插线程回调函数
procedure ThreadPro(X: Integer); stdcall;
var
  MsgStruct: TMsg;
  hMutexObj: DWORD;
begin
  hMutexObj := CreateMutex(nil, FALSE, DllMutex);

  Register_MainForm;
  Create_MainForm;
  while GetMessage(MsgStruct, 0, 0, 0) do
  begin
    TranslateMessage(MsgStruct);
    DispatchMessage(MsgStruct);
  end;
  Unregister_MainForm;
  
  CloseHandle(hMutexObj);
  FreeLibraryAndExitThread(HInstance, 0);            
end;

(* 注,这个线程有窗体,也可以用FindWindow来防止重复运行 *)
end.
