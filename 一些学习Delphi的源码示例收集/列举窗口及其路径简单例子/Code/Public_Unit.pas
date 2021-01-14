unit Public_Unit;

interface

const
  WM_SETFONT = $0030; // 设置控件字体消息
  WM_GETICON = $007F; // 取指定窗口图标消息
  
type
 //----自定义图标句柄结构----
  IconHandle = record
    WindowIcon: Longword;  //窗体标题栏图标句柄
    FileIcon  : Longword;  //进程对应文件的图标
  end;

var
  MyFont_Hanlde : LongWord;      // 逻辑字体句柄

  WindowHanlde  : LongWord;      // Window句柄
  Window_hdc    : LongWord;      // 窗体坐标系设备环境
  ListViewHanlde: LongWord;      // ListView句柄

  Cur_Item_Count: Integer=0;     // 当前列表中item个数
  Cur_Item_Index: Integer=-1;    // 当前被选中item标号

  Icon_Handle   : array of IconHandle ; //图标句柄数组

procedure  RefurbishFrom;  //--刷新窗体特定区域--
procedure  DrawIconToForm; //--画图标到窗体上方--

implementation

uses
  Windows;

const
 //文件图标绘制位置
  FileIconLeft = 190;
  FileIconTop  =  6;
 //窗体图标绘制位置
  WinIconLeft = 320;
  WinIconTop  =  6;
 //刷新窗体局部范围
  RedrawRect: TRect = (Left: 150; Top: 0; Right: 400; Bottom: 45);

  {--刷新窗体特定区域--}
procedure RefurbishFrom;
begin
  InvalidateRect(WindowHanlde, @RedrawRect, TRUE);
end;

  {--绘制图标到窗体--}
procedure  DrawIconToForm;
begin
 //------未选中item----
  if (Cur_Item_Index < 0) then Exit;
 //------绘制图标------
  Drawicon(Window_hdc, FileIconLeft, FileIconTop, Icon_Handle[Cur_Item_Index].FileIcon);
  Drawicon(Window_hdc, WinIconLeft, WinIconTop, Icon_Handle[Cur_Item_Index].WindowIcon);
end;

end.
