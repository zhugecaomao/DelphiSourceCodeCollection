unit Enum_Unit;

interface

    //----窗体遍历回调函数-----
function EnumWindowsProc(WinHwnd, Param: LongWord): Boolean; stdcall;

implementation

uses
  Windows, Public_Unit;

const
 {--Windows 消息--}
  LVM_INSERTITEM = $1007 ; // 添加ListView项目
  LVM_SETITEM    = $1006 ; // 添加ListView子项目
  
 {--- 标识常量 ---}
  LVIF_TEXT = $0001 ;   // Lv_Item文本成员有效标志
  TH32CS_SNAPMODULE = $00000008;   // 模块列表快照

type
 {-- 插入ListView(子)项目结构 --}
  T_Lv_Item = packed record
      mask     : UINT ;      // 有效成员标志
      iItem    : integer;    // 项目索引号
      iSubItem : integer;    // 子项目索引号
      state    : UINT;
      stateMask: UINT;
      pszText  : LPTSTR;     // 项目文字
      cchTextMax : integer;
      iImage : integer;
      lParam : LPARAM;
   end;

 {-- 枚举中 返回 模块信息结构 --}
  TMODULEENTRY32 = record
    dwSize: DWORD;        // 本结构尺寸
    th32ModuleID: DWORD;  // This module
    th32ProcessID: DWORD; // owning process
    GlblcntUsage: DWORD;  // Global usage count on the module
    ProccntUsage: DWORD;  // Module usage count in th32ProcessID's context
    modBaseAddr: PBYTE;   // Base address of module in th32ProcessID's context
    modBaseSize: DWORD;   // Size in bytes of module starting at modBaseAddr
    hModule: HMODULE;     // The hModule of this module in th32ProcessID's context
    szModule: array[0..255] of Char;
    szExePath: array[0..260 - 1] of Char;// 模块完整路径
  end;

var
  WindowText   : string  ;       // 窗体标题
  WindowClass  : string  ;       // 窗体类名
  WindowIcon   : LongWord;       // 窗体图标
  WindowRect   : TRect;          // 窗体尺寸

  WinThreadID  : LongWord;       // 线程ID
  WinProcessId : LongWord;       // 进程ID

  ModuleStruct : TMODULEENTRY32; // 模块信息结构
  ModuleHandle : LongWord;       // 快照句柄
  FoundModule  : Boolean ;       // 是否找到模块

  FullFileName : string  ;       // 完整路径
  FileIconIndex: UINT=0  ;       // 图标索引
  ExeFileIcon  : LongWord;       // 文件图标

   //--------------API  Function------------------
function ExtractIcon(hInst: HINST; lpszExeFileName: PChar; nIconIndex: UINT) : HICON; stdcall; external 'shell32.dll' name 'ExtractIconA';
function CreateToolhelp32Snapshot(dwFlags, th32ProcessID: DWORD) : THandle ; stdcall; external 'kernel32.dll' name 'CreateToolhelp32Snapshot';
function Module32First(hSnapshot: THandle; var lpme: TModuleEntry32): BOOL ; stdcall; external 'kernel32.dll' name 'Module32First';
function Module32Next(hSnapshot: THandle; var lpme: TModuleEntry32): BOOL ; stdcall; external 'kernel32.dll' name 'Module32Next';
   //--------------API  Function------------------



   //----尾串匹配否,不区分大小写----
function AnsiEndsText(const ASubText, AText: string): Boolean;
var
  P: PChar;
  L, L2: Integer;
begin
  P := PChar(AText);
  L := Length(ASubText);
  L2 := Length(AText);
  Inc(P, L2 - L);
  if L > L2 then
    Result := FALSE
  else
    Result := CompareString(LOCALE_USER_DEFAULT, NORM_IGNORECASE,P, L, PChar(ASubText), L) = 2;
end;

   //----转为10进制形式字符串----
function Int_to_Str(Value: Integer): string;
var
  tmp: Integer;
begin
  Result := '';
  if (Value < 0) then
  begin
    Value := -Value;
    while TRUE do
    begin
      tmp := Value Mod 10;
      Result := Char(tmp+$30) + Result;
      Value := Value Div 10;
      if (Value = 0) then break;
    end;
    Result := '-' + Result;
  end
  else
  begin
    while TRUE do
    begin
      tmp := Value Mod 10;
      Result := Char(tmp+$30) + Result;
      Value := Value Div 10;
      if (Value = 0) then break;
    end;
  end;
end;

   //----转为8位16进制形式字符串----
function Int_to_Hex(Value: integer): string;
var
  i, v: integer;
begin
  Result := '00000000';
  i := 8;
  while (Value <> 0) do
  begin
    v := (Value and $0F);
    if (v > 9) then v := v + 7;
    Result[i] := Char(v+$30);
    Value := Value shr 4;
    i := i-1;
  end;
end;

   //--添加子项目至ListView {---文字---}    {--项目编号--}   {--子项目编号--}
procedure Add_SubItem(SubItemText: Pchar; ItemIndex: integer; SubItemIndex: Integer);
var
  Sub_Lv_Item: T_Lv_Item;
begin
  Sub_Lv_Item.mask := LVIF_TEXT;
  Sub_Lv_Item.iItem := ItemIndex;
  Sub_Lv_Item.iSubItem := SubItemIndex;
  Sub_Lv_Item.pszText := SubItemText;
  Sendmessage(ListViewHanlde, LVM_SETITEM, 0, Integer(@Sub_Lv_Item));
end;

   //---窗体遍历回调函数--  {--窗口句柄--}   {--额外参数--}
function EnumWindowsProc(WinHwnd: LongWord; Param: LongWord): Boolean; stdcall;
var
  Main_Lv_Item: T_Lv_Item;    
begin
   {--继续遍历--}
  Result := TRUE; 
   {--过滤条件--}
  if ( IsWindowVisible(WinHwnd) or IsIconic(WinHwnd) ) and
       (
        (GetWindowLong(WinHwnd, GWL_HWNDPARENT) = 0) or
        (GetWindowLong(WinHwnd, GWL_HWNDPARENT) = Longint(GetDesktopWindow))
       )and
     ( GetWindowLong(WinHwnd, GWL_EXSTYLE) and WS_EX_TOOLWINDOW = 0 )  then
  begin
  {-----标题文字------}
    SetLength(WindowText, GetWindowTextLength(WinHwnd)+2);
    Getwindowtext(WinHwnd, Pchar(WindowText), GetWindowTextLength(WinHwnd)+2);
    WindowText := string( Pchar(WindowText) );
  {-----窗体类名------}
    SetLength(WindowClass, 512);
    GetClassName(WinHwnd, Pchar(WindowClass), 512);
    WindowClass := string( Pchar(WindowClass) );
  {----窗体图标句柄---}                          {--小图标--}
    WindowIcon := SendMessage(WinHwnd, WM_GETICON, ICON_SMALL, 0);
    if (WindowIcon = 0) then                     {--大图标--}
      WindowIcon := SendMessage(WinHwnd, WM_GETICON, ICON_BIG, 0);
  {-----窗体尺寸------}
    GetWindowRect(WinHwnd, WindowRect);
  {----线程&进程ID----}
    WinThreadID := GetWindowThreadProcessId(WinHwnd, @WinProcessId);
    
  {---模块列表快照----}
    ModuleHandle := CreateToolhelp32Snapshot(TH32CS_SNAPMODULE, WinProcessId);
    ModuleStruct.dwSize := sizeof(ModuleStruct);
  {-----第1个模块-----}
    FoundModule := Module32First(ModuleHandle, ModuleStruct);
    while (FoundModule) do
    begin
      FullFileName := ModuleStruct.szExePath;
    {----是否后缀exe----}
      if AnsiEndsText('.exe', FullFileName) then
      begin
      {---返回文件图标句柄--}                       
        ExeFileIcon := ExtractIcon(Hinstance, PChar(FullFileName), FileIconIndex);
      {---加图标句柄到数组--}
        Cur_Item_Count := Cur_Item_Count+1;
        SetLength(Icon_Handle, Cur_Item_Count);
        Icon_Handle[Cur_Item_Count-1].WindowIcon := WindowIcon;
        Icon_Handle[Cur_Item_Count-1].FileIcon := ExeFileIcon;
      {--添加ListVew项目--}
        Main_Lv_Item.mask := LVIF_TEXT;
        Main_Lv_Item.iItem := Cur_Item_Count-1;
        Main_Lv_Item.iSubItem := 0;
        Main_Lv_Item.pszText := Pchar(WindowText);
        Sendmessage(ListViewHanlde, LVM_INSERTITEM, 0, Integer(@Main_Lv_Item));
      {--添加ListVew子项目--}
        Add_SubItem(PChar(WindowClass), Cur_Item_Count-1, 1);
        Add_SubItem(PChar('$'+Int_to_Hex(WinHwnd)), Cur_Item_Count-1, 2);
        Add_SubItem(PChar
                    (Int_to_Str(WindowRect.Right-WindowRect.Left)+'*'+
                     Int_to_Str(WindowRect.Bottom-WindowRect.Top)),
                    Cur_Item_Count-1, 3);
        Add_SubItem(PChar(FullFileName), Cur_Item_Count-1, 4);

        Break;
      end;
    {----下一个模块----}
      FoundModule := Module32Next(ModuleHandle, ModuleStruct);
    end;
  {----释放句柄----}
    CloseHandle(ModuleHandle);
  end;
end;


end.
