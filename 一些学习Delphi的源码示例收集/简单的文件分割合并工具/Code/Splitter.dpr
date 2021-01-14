program  Splitter;

{$R '..\Other\Other.res' '..\Other\Other.txt'}

uses
  Windows,

  { 程序自注册窗体类 }
  MainForm    in  'MainForm.pas',   // 程序主窗体   'Splitter_MainForm_Mazi'
  HintForm    in  'HintForm.pas',   // 自制提示框   'Splitter_HintForm_Mazi'

  { 系统预定义窗体类 }
  Panels      in  'Panels.pas',     // 标准对话框    WC_DIALOG
  EditCtrl    in  'EditCtrl.pas',   // 编辑框控件   'EDIT'
  ListBox     in  'ListBox.pas',    // 列表框控件   'LISTBOX'
  Buttons     in  'Buttons.pas',    // 按钮控件     'BUTTON'
  GroupBox    in  'GroupBox.pas',   // 单选按钮组   'BUTTON'
  ComboBox    in  'ComboBox.pas',   // 下拉框控件   'COMBOBOX'

  { Comctl32通用控件 }
  Tooltip     in  'Tooltip.pas',    // 工具提示控件  'tooltips_class32'
  TabCtrl     in  'TabCtrl.pas',    // 分页标签控件  'SysTabControl32'
  ImageList   in  'ImageList.pas',  // 图像列表控件  (分页标签上的图标)

  { comdlg32通用对话 }
  DialogBox   in  'DialogBox.pas',  // 文件选择保存对话框

  { 文件处理 }
  CutFile     in   'CutFile.pas',   // 切割文件线程
  JoinFile    in   'JoinFile.pas',  // 合并文件线程

  { 其他单元 }
  PanelMouse  in  'PanelMouse.pas', // 处理Panel3上鼠标消息
  PaintLabel  in  'PaintLabel.pas', // 绘制Panels上各种文字
  ButtonClick in  'ButtonClick.pas',// 处理Panels上按钮单击
  ListMouse   in  'ListMouse.pas',  // 处理ListBox鼠标消息
  ListUnit    in  'ListUnit.pas',   // ListBox相关函数,变量
  PublicUnit  in  'PublicUnit.pas'; // 放置公用的 函数,变量  

var
  theMessage: TMsg;

begin
//...建立控件...//
  Create_OurFont;
  Create_MainForm;
  Create_ImageList;
  Create_TabCtrl;
  Create_Panels;
  Create_Buttons;
  Create_Edits;
  Create_GroupBox;
  Create_ComboBox;
  Create_ListBox;
  Create_Tooltip;
  Create_HintForm;

//...消息循环...//
  while GetMessage(theMessage, 0, 0, 0) do
  begin
    TranslateMessage(theMessage);
    DispatchMessage(theMessage);
  end;

//...结束线程...//
  if (CurState = 1) then Stop_Cut
  else if (CurState = 2) then Stop_Join;

{ 此处不必再调用InitCommonControls使comctl32.dll自动装载,
  因为代码中已经调用了comctl32.dll中的ImageList_Create. }
end.
