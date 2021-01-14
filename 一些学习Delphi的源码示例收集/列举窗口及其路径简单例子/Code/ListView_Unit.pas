unit ListView_Unit;

interface

   //----建立ListView------
procedure Create_ListView;

implementation

uses
  Windows, Public_Unit;

const
 {-- ListView Style --}
  LVS_SHOWSELALWAYS = $0008; //一直选中
  LVS_REPORT        = $0001; //报表模式
  LVS_SINGLESEL     = $0004; //只能单选
  
 {-- Windows消息 --}
  WM_LBUTTONDOWN    = $0201; //鼠标左键按下
  LVM_INSERTCOLUMN  = $101B; //插入ListView列
  LVM_SETEXTENDEDLISTVIEWSTYLE = $1036; //修改ListView属性
  LVM_GETNEXTITEM   = $100C; //取得item标号

 {--LVM_SETEXTENDEDLISTVIEWSTYLE参数--}
  LVS_EX_GRIDLINES        = $0001;     //显示细纹网格
  LVS_EX_FULLROWSELECT    = $0020;     //可以选中整行

 {-- LVM_GETNEXTITEM 参数 --}
  LVNI_FOCUSED     = $0001 ;       //取焦点标志
  
 {-- T_Lv_Column 有效成员标志 --}
  LVCF_FMT     =   $01;  //fmt
  LVCF_WIDTH   =   $02;  //lx
  LVCF_TEXT    =   $04;  //pszText

 {-- fmt (对齐方式) --}
  LVCFMT_LEFT  =   $00;  //左对齐

type
 {--添加列结构(LVM_INSERTCOLUMN消息)--}
  T_Lv_Column = packed record
    mask    : UINT   ;    // 有效标志
    fmt     : integer;    // 对齐方式
    lx      : integer;    // 列的宽度
    pszText : LPTSTR ;    // 列名文字
    cchTextMax : integer; // 忽略,查询时用
    iSubItem   : integer; // 忽略
  end;

var
  ListView_Proc: Pointer; // 原ListView过程

   //-----引用此函数,使comctl32.dll自动装载,DLL初始化代码将注册类
procedure InitCommonControls; stdcall; external 'ComCtl32.dll' name 'InitCommonControls';  

   //---ListView单击处理过程-------
procedure ListViewClick;
begin             // 取当前选中的item标号 [ 0 .. X ]
  Cur_Item_Index := SendMessage(ListViewHanlde, LVM_GETNEXTITEM, -1, LVNI_FOCUSED);
  RefurbishFrom;  // 刷新 并 间接导致重绘图标 .
end;

   //----ListView窗体过程-----
function ListViewProc(WinHanlde, MessageID, WParam, LParam: Longword): Longint; stdcall;
begin
  Result := CallWindowProc(ListView_Proc, WinHanlde , MessageID, wParam, lParam);
  if (MessageID = WM_LBUTTONDOWN) then ListViewClick ; // 处理单击事件
end;

   //----向LIstView添加列----
                        {--文字--}      {--列宽--}      {--位置--}
procedure Add_Column(ColText: PChar; Width: Integer; Index: Integer);
var
  Lv_Column:T_Lv_Column;
begin
  Lv_Column.mask:= LVCF_FMT or LVCF_WIDTH or LVCF_TEXT  ;
  Lv_Column.fmt := LVCFMT_LEFT;
  Lv_Column.lx  := Width;
  Lv_Column.pszText := ColText;
  SendMessage(ListViewHanlde, LVM_INSERTCOLUMN, Index, integer(@Lv_Column));
end;

   //-----建立列表框-----
procedure Create_ListView;
begin
 //--建立ListView--
  ListViewHanlde := CreateWindowEx (0, 'SysListView32', '麻子',
                                   WS_CHILDWINDOW or WS_VISIBLE or LVS_REPORT or LVS_SHOWSELALWAYS or
                                   WS_CLIPSIBLINGS or WS_CLIPCHILDREN or WS_BORDER or LVS_SINGLESEL,
                                   1, 45, 445, 163, WindowHanlde, 0, hInstance, nil);
  if ListViewHanlde=0 then
  begin
    MessageBox(0, '建立列表控件失败', nil, 0);
    Halt;
  end;
 //--ListView属性--
  SendMessage(ListViewHanlde, LVM_SETEXTENDEDLISTVIEWSTYLE, 0, LVS_EX_GRIDLINES or LVS_EX_FULLROWSELECT);
 //--ListView字体--
  SendMessage(ListViewHanlde, WM_SETFONT, MyFont_Hanlde, 0);
 //--依次添加各列--
  Add_Column('  窗体标题', 80, 0);
  Add_Column('  窗体类名', 80, 1);
  Add_Column(' 窗体句柄', 70, 2);
  Add_Column('  宽&高', 65, 3);
  Add_Column('  进程完整路径', 150, 4);
 //---设处理过程---
  ListView_Proc := Pointer(SetWindowLong(ListViewHanlde, GWL_WNDPROC, Longint(@ListViewProc)));
 //---调用空函数---
 InitCommonControls;
end;  

end.
