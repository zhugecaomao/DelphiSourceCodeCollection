unit  ListBox;

interface      

    // ---- 建立列表框控件 ---- //
procedure Create_ListBox;

implementation

uses
  Windows, Messages, ListMouse, ListUnit, PublicUnit;

var
  hListBoxDC: LongWord;         // ListBox设备环境
  DefListProc: Pointer;         // 默认ListBox过程
  
    // ---- 新列表框过程 ---- //
function NewListProc(hList, MsgID, WParam, LParam: LongWord): LongWord; stdcall;
begin
  Result := CallWindowProc(DefListProc, hList, MsgID, wParam, lParam);   
  if (MsgID>=WM_MOUSEFIRST)and(MsgID<=WM_MOUSELAST) then Dispose_List_MouseMsg(MsgID, lParam)
  else if (MsgID = WM_PAINT) then DrawFocusRect(hListBoxDC, PriorRect)
       else if (MsgID = WM_KEYUP)and(wParam = VK_DELETE) then Delete_ListItem;
end;

    // ---- 建立列表框控件 ---- //
procedure Create_ListBox;
begin
  hListBox := CreateWindowEx(0, 'LISTBOX', 'ListBox8LiuMazi',
                            WS_CHILD or WS_VISIBLE or WS_BORDER or WS_VSCROLL
                            or LBS_HASSTRINGS or LBS_EXTENDEDSEL,
                            85, 40, 252, ListHeight, hPanel2, ListBoxID, hInstance, nil);
  if (hListBox = 0) then
  begin
    MessageBox(0, 'Create ListBox Error !!', nil, MB_SETFOREGROUND);  Halt;
  end;
  
  hListBoxDC := GetDC(hListBox);
  SendMessage(hListBox, WM_SETFONT, hSmallFont, 0);
  DefListProc := Pointer(SetWindowLong(hListBox, GWL_WNDPROC, LongWord(@NewListProc)));
end;

end.
