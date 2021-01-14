unit  EditCtrl;

interface

    // ---- 建立全部Edit ---- //
procedure Create_Edits;

implementation

uses
  Windows, Messages, PublicUnit;

    // ---- 建立单个Edit ---- //
function Create_Edit(hParent, Left, Top, Width, Height, ID: LongWord): LongWord;
begin
  Result := CreateWindowEx(0, 'EDIT', '',
                          WS_CHILD or WS_VISIBLE or WS_BORDER or
                          ES_LOWERCASE or ES_AUTOHSCROLL,
                          Left, Top, Width, Height, hParent, ID, hInstance, nil);
  if (Result = 0) then
  begin
    MessageBox(0, 'Create Edit Error !!', nil, MB_SETFOREGROUND);  Halt;
  end;
end;

    // ---- 建立全部Edit ---- //
procedure Create_Edits;
begin
  hEdit1 := Create_Edit(hPanel1, 60, 13, 250, 18, EditID1);
  hEdit2 := Create_Edit(hPanel1, 60, 43, 250, 18, EditID2);
  hEdit3 := Create_Edit(hPanel2, 60, 13, 250, 18, EditID3);
  SendMessage(hEdit1, WM_SETFONT, hSmallFont, 0);
  SendMessage(hEdit2, WM_SETFONT, hSmallFont, 0);
  SendMessage(hEdit3, WM_SETFONT, hSmallFont, 0);
end;

end.
