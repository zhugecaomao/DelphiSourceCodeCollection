unit  HintForm;

interface

    // ---- 返回文字范围 ---- //
function GetTextExtent(const DrawText: string): LongWord;
    // ---- 激活提示窗体 ---- //
procedure Active_HintForm(Left, Top: Integer; const Text: string);
    // ---- 建立提示窗体 ---- //
procedure Create_HintForm;

implementation

uses
  Windows, Messages, ListUnit, PublicUnit;

var
  Hint_Str: string;          // Hint窗体要显示的提示文字
  No_Enter: Boolean = TRUE;  // 鼠标尚未进入Hint窗体内
  DragMove: Integer;         // 拖拽时鼠标在Hint移动次数
  
    // ---- 重新引入函数 ---- //
function GetTabbedTextExtent(hDC: HDC; lpString: PChar; nCount,
  nTabPositions: Integer; pnTabStopPositions: pointer): LongWord; stdcall;
  external user32 name 'GetTabbedTextExtentA';

     // ---- 获取文字长度 ---- //
function GetTextExtent(const DrawText: string): DWORD;
begin
  Result := GetTabbedTextExtent(hHintFormDC, PChar(DrawText), Length(DrawText), 0, nil);
end;

    // ---- 激活提示窗体 ---- //
procedure Active_HintForm(Left, Top: Integer; const Text: string);
var
  Width, Height: Integer;
  ScreenWidth: Integer;
begin
 // 初始化 ..
  Hint_Str := Text;
  No_Enter := TRUE;
  DragMove := 0;
 // 取得范围
  Width := GetTextExtent(Text);
  Height := HIWORD(Width) + 4;
  Width := LOWORD(Width) + 7;
 // 超出屏幕
  ScreenWidth := Word( GetSystemMetrics(SM_CXSCREEN) );
  if ((Left+Width) > ScreenWidth) then Left := ScreenWidth-Width;
 // 显示窗口
  SetWindowPos(hHintForm, HWND_TOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE);
  ShowWindow(hHintForm, SW_SHOWNOACTIVATE);
end;

    // ---- 提示窗体过程 ---- //
function HintProc(hHint, MsgID, WParam, LParam: LongWord): LongWord; stdcall;
var
  CursorPos: TPoint;
begin
  Result := DefWindowProc(hHint, MsgID, WParam, LParam);
  case MsgID of
    WM_PAINT       : TextOut(hHintFormDC, 3, 1, PChar(Hint_Str), Length(Hint_Str));      
    WM_MOUSEMOVE   : begin
                       if No_Enter  then  // 初入HintForm
                       begin
                         No_Enter := FALSE;  SetLeaveEvent(hHint);
                       end;
                       if OnDraging then  // 处于拖拽状态
                       begin
                         SetCursor(hDrapCursor);  Inc(DragMove);
                         if (DragMove>2) then ShowWindow(hHint, SW_HIDE);
                       end;
                     end;
    WM_LBUTTONDOWN,
    WM_RBUTTONDOWN,
    WM_RBUTTONUP   : begin  // 隐藏自己并转发消息给 ListBox
                       CursorPos.X := LOWORD(LParam);
                       CursorPos.Y := HIWORD(LParam);
                       ClientToScreen(hHint, CursorPos);
                       ShowWindow(hHint, SW_HIDE);
                       ScreenToClient(hListBox, CursorPos);
                       LParam := (CursorPos.Y shl 16) or CursorPos.X;
                       SendMessage(hListBox, MsgID, WParam, LParam);
                     end;
    WM_MOUSELEAVE  : begin
                       ShowWindow(hHint, SW_HIDE);
                       ReTest_Enter_List; // 防止拖拽中离开,ListBox感应不到.
                     end;
  end;
end;

    // ---- 注册提示窗体 ---- //
function RegisterHint: Boolean;
var
  HintClass: TWndClass;  
begin
  with HintClass do
  begin
    Style := CS_HREDRAW or CS_VREDRAW;
    lpfnWndProc := @HintProc;
    cbClsExtra := 0;
    cbWndExtra := 0;
    hInstance := SysInit.HInstance;
    hIcon := 0;
    hCursor :=  hArrowCursor;
    hbrBackground := CreateSolidBrush(GetSysColor(COLOR_INFOBK));
    lpszMenuName := nil;
    lpszClassName := 'Splitter_HintForm_Mazi';
  end;                
  Result := RegisterClass(HintClass) <> 0;
end;            

    // ---- 建立提示窗体 ---- //
procedure Create_HintForm;
begin
  if (RegisterHint = FALSE) then
  begin
    MessageBox(0, 'Register HintForm Error !!' , nil, MB_SETFOREGROUND);  Halt;
  end;           
  hHintForm := CreateWindowEx(WS_EX_TOPMOST or WS_EX_TOOLWINDOW,
                              'Splitter_HintForm_Mazi', 'Love_Mazi',
                              WS_POPUP or WS_BORDER, 0, 0, 0, 0,
                              hMainForm, 0, hInstance, nil);
  if (hHintForm = 0) then
  begin
    MessageBox(0, 'Create HintForm Error !!', nil, MB_SETFOREGROUND);  Halt;
  end;

  hHintFormDC := GetDC(hHintForm);
  SetBkMode(hHintFormDC, TRANSPARENT);
  SelectObject(hHintFormDC, hSmallFont);
end;

end.
