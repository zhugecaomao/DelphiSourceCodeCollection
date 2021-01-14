unit Window_Unit;

interface

  //----建立主窗体------
procedure Create_Window;  

implementation

uses
  Windows, Public_Unit;

const
  WM_DESTROY = $0002;    // 窗体注销消息
  WM_PAINT   = $000F;    // 窗体刷新消息

var
  WindowIconH: LongWord; //本窗体图标句柄

  //----主窗体消息处理过程-----
function WindowProc(WinHanlde, MessageID, WParam, LParam : Longword):Longint; stdcall;
begin
        //---默认处理过程---
  Result := DefWindowProc(WinHanlde, MessageID, WParam, LParam);
          //--刷新--            //--绘制图标--
  if (MessageID = WM_PAINT) then DrawIconToForm
              //--取图标--
  else if (MessageID = WM_GETICON) then Result:=WindowIconH
                   //--关闭--
       else if (MessageID = WM_DESTROY) then PostQuitMessage(0); 
end;

  //----注册窗体类----
function RegWindowClass: Boolean;
var
  WindowClass: TWndClass;
begin
  WindowIconH := LoadIcon(hInstance, 'LiuMazi');
 {--填充结构体--}
  WindowClass.Style := CS_HREDRAW or CS_VREDRAW;     // 窗体类风格
  WindowClass.lpfnWndProc := @WindowProc;            // 指定窗体过程
  WindowClass.cbClsExtra := 0;                       // 无额外类信息
  WindowClass.cbWndExtra := 0;                       // 无额外窗体信息
  WindowClass.hInstance := hInstance;                // 实例句柄
  WindowClass.hIcon := WindowIconH;                  // 指定图标
  WindowClass.hCursor := LoadCursor(0, IDC_ARROW);   // 没有光标
  WindowClass.hbrBackground := COLOR_WINDOW;         // 预定义颜色
  WindowClass.lpszMenuName := nil;                   // 没有菜单
  WindowClass.lpszClassName := 'EnumDemo_Mazi';          // 欲注册的类名
 {--注册窗体类--}
  Result := RegisterClass(WindowClass) <> 0;
end;

  //----建立主窗体------
procedure Create_Window;
begin      
  if (not RegWindowClass) then
  begin
    MessageBox(0, '注册窗体类失败' , nil, 0);
    Halt;
  end;
  WindowHanlde := CreateWindowEx(0,
                                'EnumDemo_Mazi',
                                '  枚举窗口简单例子      By 麻子',
                                WS_OVERLAPPED or WS_CAPTION or WS_SYSMENU or WS_MINIMIZEBOX or WS_VISIBLE,
                                100,
                                100,
                                455,
                                236,
                                0,
                                0,
                                hInstance,
                                nil);
  if (WindowHanlde = 0) then
  begin
    MessageBox(0, '建立主窗体失败', nil, 0);
    Halt;
  end;
 //--创建字体--
  MyFont_Hanlde := CreateFont(12, 6, 0, 0, FW_EXTRALIGHT, Byte(FALSE),
                              Byte(FALSE), Byte(FALSE), GB2312_CHARSET,
                              OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,
                              DEFAULT_QUALITY, DEFAULT_PITCH, '宋体');
 //--设置字体--
  SendMessage(WindowHanlde, WM_SETFONT, MyFont_Hanlde, 0);
 //--设备环境--
  Window_hdc := GetDC(WindowHanlde);
end;  

end.
