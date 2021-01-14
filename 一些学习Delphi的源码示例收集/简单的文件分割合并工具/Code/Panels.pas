unit  Panels;

interface

    // ---- 建立3个Panel  ---- //
procedure Create_Panels;

implementation

uses
  Windows, Messages, ButtonClick, PaintLabel, PanelMouse, PublicUnit;

var
  DefPanelProc: Pointer;

    // ---- 新 Panel 过程 ---- //
function NewPanelProc(hPanel, MsgID, WParam, LParam: LongWord): LongWord; stdcall;
begin
  Result := CallWindowProc(DefPanelProc, hPanel, MsgID, wParam, lParam);
  case MsgID of
    WM_MOUSELEAVE,
    WM_MOUSEFIRST..
    WM_MOUSELAST  : if (hPanel=hPanel3) then Dispose_Panel_MouseMsg(MsgID, LParam);
    WM_PAINT      : Draw_Panel_Labels(hPanel);
    WM_COMMAND    : Do_Command(WParam, LParam);     
  end;
end;    

    // ---- 建立3个Panel  ---- //
procedure Create_Panels;
var
  InfoStruct: NONCLIENTMETRICS;
begin
  InfoStruct.cbSize := sizeof( NONCLIENTMETRICS );
  SystemParametersInfo( SPI_GETNONCLIENTMETRICS, sizeof( NONCLIENTMETRICS ), @InfoStruct, 0);

  hPanel1 := CreateWindowEx(0, WC_DIALOG, 'Panel8LiuMazi',
                            WS_CHILD or DS_CONTROL or WS_VISIBLE or WS_BORDER,
                            0, 0, 344, 172-InfoStruct.iCaptionHeight, hTabCtrl,
                            Panel1ID, hInstance, nil);
  hPanel2 := CreateWindowEx(0, WC_DIALOG, 'Panel8LiuMazi',
                            WS_CHILD or DS_CONTROL or WS_BORDER or WS_CLIPCHILDREN,
                            0, 0, 344, 172-InfoStruct.iCaptionHeight, hTabCtrl,
                            Panel2ID, hInstance, nil);
  hPanel3 := CreateWindowEx(0, WC_DIALOG, 'Panel8LiuMazi',
                            WS_CHILD or DS_CONTROL or WS_BORDER or WS_CLIPCHILDREN,
                            0, 0, 344, 172-InfoStruct.iCaptionHeight, hTabCtrl,
                            Panel3ID, hInstance, nil);
  if (hPanel1 = 0) or (hPanel2 = 0) or (hPanel3 = 0) then
  begin
    MessageBox(0, 'Create Panels Error !!', nil, MB_SETFOREGROUND);  Halt;
  end;

  hPanel1DC := GetDC(hPanel1);
  hPanel2DC := GetDC(hPanel2);
  hPanel3DC := GetDC(hPanel3);

  SetBkMode(hPanel1DC, TRANSPARENT);
  SetBkMode(hPanel2DC, TRANSPARENT);
  SetBkMode(hPanel3DC, TRANSPARENT);

  SelectObject(hPanel1DC, hSmallFont);
  SelectObject(hPanel2DC, hSmallFont);
  SelectObject(hPanel3DC, hNormalFont);

  DefPanelProc := Pointer(GetWindowLong(hPanel1, GWL_WNDPROC));
  SetWindowLong(hPanel1, GWL_WNDPROC, LongWord(@NewPanelProc));
  SetWindowLong(hPanel2, GWL_WNDPROC, LongWord(@NewPanelProc));
  SetWindowLong(hPanel3, GWL_WNDPROC, LongWord(@NewPanelProc));  
end;

end.
