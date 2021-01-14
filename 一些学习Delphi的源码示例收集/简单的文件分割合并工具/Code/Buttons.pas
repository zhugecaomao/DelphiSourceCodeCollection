unit  Buttons;

interface

    // ---- 建立全部按钮 ---- //
procedure Create_Buttons;

implementation

uses
  Windows, Messages, PublicUnit;

    // ---- 建立单个按钮 ---- //
function Create_Button(hParent, Left, Top, Width, Height, ID: LongWord; Text: PChar): LongWord;
begin
  Result := CreateWindowEx(0, 'BUTTON', Text, WS_CHILD or WS_VISIBLE or BS_FLAT,
                           Left, Top, Width, Height, hParent, ID, hInstance, nil);
  if (Result = 0) then
  begin
    MessageBox(0, 'Create Button Error !!', nil, MB_SETFOREGROUND);  Halt;
  end;
end;

    // ---- 建立全部按钮 ---- //
procedure Create_Buttons;
begin
  hButton1 := Create_Button(hPanel1, 148, 110, 85, 25, Button1ID, '开始分割');
  hButton2 := Create_Button(hPanel1, 251, 110, 85, 25, Button2ID, '取消分割');
  hButton3 := Create_Button(hPanel1, 318, 13, 18, 18, Button3ID, '..');
  hButton4 := Create_Button(hPanel1, 318, 43, 18, 18, Button4ID, '..');

  hButton5 := Create_Button(hPanel2, 318, 13, 18, 18, Button5ID, '..');
  hButton6 := Create_Button(hPanel2, 5, 40, 70, 23, Button6ID, '添加文件');
  hButton7 := Create_Button(hPanel2, 5, 65, 70, 23, Button7ID, '删除文件');
  hButton8 := Create_Button(hPanel2, 5, 90, 70, 23, Button8ID, '开始合并');
  hButton9 := Create_Button(hPanel2, 5, 115, 70, 23, Button9ID, '取消合并');

  SendMessage(hButton1, WM_SETFONT, hSmallFont, 0);
  SendMessage(hButton2, WM_SETFONT, hSmallFont, 0);
  
  SendMessage(hButton6, WM_SETFONT, hSmallFont, 0);
  SendMessage(hButton7, WM_SETFONT, hSmallFont, 0);
  SendMessage(hButton8, WM_SETFONT, hSmallFont, 0);
  SendMessage(hButton9, WM_SETFONT, hSmallFont, 0);
end;

end.
