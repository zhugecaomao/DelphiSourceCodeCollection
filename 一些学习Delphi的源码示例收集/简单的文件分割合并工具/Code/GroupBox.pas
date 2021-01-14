unit  GroupBox;

interface

    // ---- 建立RadioBtn组 ---- //
procedure Create_GroupBox;

implementation

uses
  Windows, Messages, PublicUnit;

    // ---- 建立RadioBtn组 ---- //
procedure Create_GroupBox;
begin
    // ---- 建立GroupBox(边框) ---- //
  hGroupBox1 := CreateWindowEx(0, 'BUTTON', '',
                 WS_CHILD or WS_VISIBLE or WS_CLIPCHILDREN or BS_GROUPBOX,
                 160, 63, 177, 35, hPanel1, GroupBoxID, hInstance, nil);

    // ---- 建立RadioBtn(按钮)---- //
  hRadioBtn1 := CreateWindowEx(0, 'BUTTON', 'Byte',
                 WS_CHILD or WS_VISIBLE or BS_AUTORADIOBUTTON or BS_FLAT ,
                 8, 13, 50, 15, hGroupBox1, RadioBtID1, hInstance, nil);
  hRadioBtn2 := CreateWindowEx(0, 'BUTTON', 'KByte',
                 WS_CHILD or WS_VISIBLE or BS_AUTORADIOBUTTON or BS_FLAT ,
                 61, 13, 50, 15, hGroupBox1, RadioBtID2, hInstance, nil); 
  hRadioBtn3 := CreateWindowEx(0, 'BUTTON', 'MByte',
                 WS_CHILD or WS_VISIBLE or BS_AUTORADIOBUTTON or BS_FLAT ,
                 120, 13, 50, 15, hGroupBox1, RadioBtID3, hInstance, nil);

  SendMessage(hGroupBox1, WM_SETFONT, hSmallFont, 0);
  SendMessage(hRadioBtn1, WM_SETFONT, hSmallFont, 0);
  SendMessage(hRadioBtn2, WM_SETFONT, hSmallFont, 0);
  SendMessage(hRadioBtn3, WM_SETFONT, hSmallFont, 0);   
  SendMessage(hRadioBtn3, BM_SETCHECK, LongWord(TRUE),0);
end;

end.
