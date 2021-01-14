unit Menu_Unit;

interface

procedure Create_Menu;
procedure PopupTheMenu;
procedure MenuCommand(MenuID: integer);

implementation

uses
  Windows, Messages, Public_Unit;
  
var
  hPopupMenu: Longword; // 菜单句柄

   // 创建菜单
procedure Create_Menu;
begin
  hPopupMenu := CreatePopupMenu;
  AppendMenu(hPopupMenu, MF_STRING, 1, '暂停');
  AppendMenu(hPopupMenu, MF_GRAYED or MF_STRING, 2, '继续');
  AppendMenu(hPopupMenu, MF_STRING, 3, '清空');
  AppendMenu(hPopupMenu, MF_STRING, 4, '退出');
  AppendMenu(hPopupMenu, MF_GRAYED or MF_SEPARATOR, 5, '');
  AppendMenu(hPopupMenu, MF_STRING, 6, '关于');
end;

   // 弹出菜单
procedure PopupTheMenu;
var
  CurMousePos: TPoint;
begin
  SetForegroundWindow(WindowHandle);
  GetCursorPos(CurMousePos);
  TrackPopupMenu(hPopupMenu, TPM_RIGHTALIGN or TPM_LEFTBUTTON or TPM_RIGHTBUTTON,
                 CurMousePos.X, CurMousePos.Y, 0, WindowHandle, nil);
end;

   // 菜单命令处理
procedure MenuCommand(MenuID: Integer);
begin
  case MenuID of
    1: begin
         ContinueAdd := False;
         EnableMenuItem(hPopupMenu, 1, MF_GRAYED);   //禁用
         EnableMenuItem(hPopupMenu, 2, MF_ENABLED);  //激活
       end;
    2: begin
         ContinueAdd := True;
         EnableMenuItem(hPopupMenu, 2, MF_GRAYED);   //禁用
         EnableMenuItem(hPopupMenu, 1, MF_ENABLED);  //激活
       end;
    3: SendMessage(StatusHandle, PBM_SETPOS, 0, 0);
    4: PostQuitMessage(0);
    6: ShellExecute(0, 'open', 'http://www.2ccc.com', nil, nil, SW_SHOW);
  end;
end;

end.
