unit Button_Unit;

interface

 //-----建立按钮-----
procedure Create_Button;

implementation     

uses
  Windows, Public_Unit, Enum_Unit;

const
 {--- windows消息 ---}  
  WM_LBUTTONUP = $0202;       // 鼠标左键抬起
  WM_SETREDRAW       = $000B; // 是否允许重绘 
  LVM_DELETEALLITEMS = $1009; // 清空ListView

var
  ButtonHanlde: LongWord;      // Button句柄
  Button_Proc : Pointer;       // 原Button过程

  //----单击事件过程----
procedure ButtonClick;
begin
 {--- 初始化 ---}
  Cur_Item_Index := -1;
  SetLength(Icon_Handle, 0);
  Cur_Item_Count := 0;
 {-- 清除图标 --}
  RefurbishFrom;
 {--- 刷 新 ----}
  SendMessage(ListViewHanlde, WM_SETREDRAW, 0, 0); // 锁定ListView
  SendMessage(ListViewHanlde, LVM_DELETEALLITEMS, 0, 0);// 清空
  EnumWindows(@EnumWindowsProc, 0);                // 遍历窗体
  SendMessage(ListViewHanlde, WM_SETREDRAW, 1, 0); // 解锁ListView
end;

  //----按钮窗体过程-----
function ButtonProc(WinHanlde, MessageID, WParam, LParam: LongWord): Longint; stdcall;
begin
  Result:=CallWindowProc ( Button_Proc, WinHanlde , MessageID, wParam, lParam);
  if (MessageID = WM_LBUTTONUP) then  ButtonClick;  //处理单击事件
end;

  //-----建立按钮-----
procedure Create_Button;
begin
  ButtonHanlde := CreateWindowEx(0,
                                'BUTTON',
                                '刷 新',
                                WS_CHILD or WS_VISIBLE or BS_FLAT,
                                30,
                                10,
                                75,
                                25,
                                WindowHanlde,
                                0,
                                hInstance,
                                nil);
  if (ButtonHanlde = 0) then
  begin
    MessageBox(0, '建立按钮失败', nil, 0);
    Halt;
  end;
 //---设Button字体-----
  SendMessage(ButtonHanlde, WM_SETFONT, MyFont_Hanlde, 0);
 //---设Button过程-----
  Button_Proc := Pointer(SetWindowLong(ButtonHanlde, GWL_WNDPROC, LongWord(@ButtonProc)));
end;

end.
