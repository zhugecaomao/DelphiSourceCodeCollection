unit  TabCtrl;

interface

    // ---- 建立TabCtrl控件 ---- //
procedure Create_TabCtrl;

implementation

uses
  Windows, CommCtrl, Messages, PublicUnit;

    // ---- 添加TabCtrl标签 ---- //
procedure Insert_TabItem(Index: LongWord; Text: PChar);
var
  NewItem: TC_ITEM;
begin
  NewItem.mask := TCIF_TEXT or TCIF_IMAGE;
  NewItem.pszText := PChar(Text);
  NewItem.cchTextMax := StrLen(Text);
  NewItem.iImage := Index;
  NewItem.lParam := 0;
  SendMessage(hTabCtrl, TCM_INSERTITEM, Index, LongWord(@NewItem));
end;

    // ---- 建立TabCtrl控件 ---- //
procedure Create_TabCtrl;                                 
begin
  hTabCtrl := CreateWindowEx(0 , 'SysTabControl32', 'TabControl8Mazi',
                             WS_CHILD or WS_VISIBLE or WS_MAXIMIZE
                             or TCS_BOTTOM or TCS_FIXEDWIDTH or TCS_FOCUSNEVER
                             or TCS_HOTTRACK or WS_CLIPCHILDREN,
                             0, 0, 344, 175, hMainForm, TabCtrlID, hInstance, nil);
  if (hTabCtrl = 0) then
  begin
    MessageBox(0, 'Create TabCtrl Error !!', nil, MB_SETFOREGROUND);  Halt;
  end;                          
  SendMessage(hTabCtrl, WM_SETFONT, hSmallFont, 0);  
  SendMessage(hTabCtrl, TCM_SETIMAGELIST, 0, hImageList);
  Insert_TabItem(0, '分割 ');
  Insert_TabItem(1, '合并 ');
  Insert_TabItem(2, '链接 ');  
end;

end.
