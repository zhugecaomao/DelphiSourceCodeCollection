unit Window;

interface

uses Windows, Messages, Public;
  
function CreateWindow: HWND;

implementation        

     //窗体过程(回调)
function WindowProc(WinHanlde, MessageID, WParam, LParam: DWORD): DWORD; stdcall;
begin
  case MessageID of
    WM_COMMAND: DoCommand(WParam, LParam);
    WM_DESTROY: PostQuitMessage(0);
  end;
  Result := DefWindowProc(WinHanlde, MessageID, WParam, LParam);  
end;

     //注册窗体类
function RegWindowClass: Boolean;
var
  WindowClass: TWndClass;
begin
  WindowClass.Style := CS_HREDRAW or CS_VREDRAW;
  WindowClass.lpfnWndProc := @WindowProc;
  WindowClass.cbClsExtra := 0;
  WindowClass.cbWndExtra := 0;
  WindowClass.hInstance := HInstance;
  WindowClass.hIcon := LoadIcon(HInstance, 'Liumazi');
  WindowClass.hCursor :=  LoadCursor(0, IDC_ARROW);
  WindowClass.hbrBackground := COLOR_3DFACE + 1;
  WindowClass.lpszMenuName := nil;
  WindowClass.lpszClassName := 'TimerHook_Mazi';
  
  Result := RegisterClass(WindowClass) <> 0;
end;

     //建立窗体
function CreateWindow: HWND;
begin
  if (RegWindowClass = FALSE) then
  begin
    MessageBox(0, 'RegisterClass error !!' , nil, 0); Halt;
  end;

  Result := CreateWindowEx(0, 'TimerHook_Mazi', ' TimerHook_Mazi',
    WS_TILED or WS_VISIBLE or WS_SYSMENU, 320, 180, 160, 70, 0, 0, HInstance, nil);
    
  if (Result = 0) then
  begin
    MessageBox(0, 'Create Window error !!', nil, 0); Halt;
  end;      
end;  

end.
