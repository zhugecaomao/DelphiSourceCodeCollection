unit PrjMisc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Forms, Dialogs,
  Controls, StdCtrls, Global;

procedure CheckPrevInstance;

implementation

uses MainFrm;

//-----------------------------------------------------------------------------
// 描述: 防止启动第二个进程实体
//-----------------------------------------------------------------------------
procedure CheckPrevInstance;
var
  Handle, Ret: HWND;
begin
  CreateMutex(nil, False, SSoftName);
  // 如果之前已经运行了一个实例
  if GetLastError = ERROR_ALREADY_EXISTS then
  begin
    Handle := GetDesktopWindow;
    Handle := GetWindow(Handle, GW_CHILD);
    while IsWindow(Handle) do
    begin
      // 判断此窗口属性标志
      Ret := GetProp(Handle, PChar(SSoftName));
      if Ret = Handle then
      begin
        SetForegroundWindow(Handle);
        PostMessage(Handle, WM_SHOW_MAIN_WIN, 0, 0);
        Break;
      end;
      // 转到窗口列表中下一个窗口.
      Handle := GetWindow(Handle, GW_HWNDNEXT);
    end;
    Halt;
  end;
end;

end.
