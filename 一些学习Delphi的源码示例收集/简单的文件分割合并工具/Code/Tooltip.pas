unit  Tooltip;

interface

    // ---- 建立工具提示控件  ---- //
procedure Create_Tooltip;

implementation

uses
  Windows, CommCtrl, PublicUnit;   

    // ---- 建立工具提示控件  ---- //
procedure Create_Tooltip;
var
  ToolInfoStruct: TOOLINFO;
begin
  hToolTip:= CreateWindowEx(WS_EX_TOPMOST, 'tooltips_class32', 'ToolTip8Mazi',
                            TTS_ALWAYSTIP, 0, 0, 0, 0, hMainForm, 0, hInstance, nil);
  if (hToolTip = 0) then
  begin
    MessageBox(0, 'Create ToolTip Error !!', nil, MB_SETFOREGROUND);  Halt;
  end;

  ToolInfoStruct.cbSize := Sizeof(ToolInfoStruct);
  ToolInfoStruct.uFlags := TTF_IDISHWND or TTF_SUBCLASS;
  ToolInfoStruct.hInst  := HInstance;

  ToolInfoStruct.uId    := hButton3;
  ToolInfoStruct.lpszText := PChar(1);
  SendMessage(hToolTip, TTM_ADDTOOL, 0, LPARAM(@ToolInfoStruct));

  ToolInfoStruct.uId    := hButton4;
  ToolInfoStruct.lpszText := PChar(2);
  SendMessage(hToolTip, TTM_ADDTOOL, 0, LPARAM(@ToolInfoStruct));

  ToolInfoStruct.uId    := hButton5;
  ToolInfoStruct.lpszText := PChar(3);
  SendMessage(hToolTip, TTM_ADDTOOL, 0, LPARAM(@ToolInfoStruct));  
end;

end.
