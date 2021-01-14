unit  ComboBox;

interface

    // ---- 建立ComboBox控件 ---- //
procedure Create_ComboBox;

implementation

uses
  Windows, Messages, PublicUnit;

var
  DefComboBoxProc: Pointer;          // 默认ComboBox过程
  ComboBoxDrawRect: TRect;           // 绘制ComboBox范围
  SubButtonWidth: Integer;           // 当前系统按钮宽度
  FrameBrush, BosomBrush: LongWord;  // 两种颜色刷子句柄

    // ---- 新ComboBox过程 ---- //  
function NewComboBoxProc(hWnd, MsgID, wParam, lParam: LongWord): LongWord; stdcall;
var
  TempRT: TRect;        // 绘制区域
  TempDC: LongWord;     // 绘制环境
  TempPS: TPaintStruct; // ..... ^^
begin
  Result := 0;
  if (MsgID = WM_PAINT) then
  begin
    TempDC := BeginPaint(hWnd, TempPS);

   // 绘制线性边框 ..
    TempRT := ComboBoxDrawRect;
    InflateRect(TempRT, -1, -1);
    FrameRect(TempDC, TempRT, FrameBrush);
    InflateRect(TempRT, -1, -1);
    FrameRect(TempDC, TempRT, BosomBrush);
    
   // 绘制下拉按钮 ..
    TempRT := ComboBoxDrawRect; 
    Inc(TempRT.Left, ComboBoxDrawRect.Right-SubButtonWidth-4);
    InflateRect(TempRT, -1, -1);
    DrawFrameControl(TempDC, TempRT, DFC_SCROLL, DFCS_SCROLLCOMBOBOX or DFCS_MONO);
    
    EndPaint(hWnd, TempPS);
  end else
    Result := CallWindowProc(DefComboBoxProc, hWnd, MsgID, wParam, lParam);
end; 

    // ---- 建立ComboBox控件 ---- //
procedure Create_ComboBox;
var
  hSubEdit: LongWord;
begin
// 建立ComboBox ..
  hComboBox := CreateWindowEx(0, 'COMBOBOX', 'ComboBox8Mazi',
                              WS_CHILD or WS_CLIPCHILDREN or CBS_DROPDOWN,
                              59, 72, 93, 300,
                              hPanel1, ComboBoxID, hInstance, nil);
  if (hComboBox = 0) then
  begin
    MessageBox(0, 'Create ComboBox Error !!', nil, MB_SETFOREGROUND);  Halt;
  end;            
// 子EDIT只接受数字 ..
  hSubEdit := FindWindowEx(hComboBox, 0, 'EDIT', nil);
  SetWindowLong(hSubEdit, GWL_STYLE	, (GetWindowLong(hSubEdit, GWL_STYLE) or ES_NUMBER));
// 添加各个可选项目 ..
  SendMessage(hComboBox, CB_ADDSTRING, 0, Longword(PChar(string('1'))));
  SendMessage(hComboBox, CB_ADDSTRING, 0, Longword(PChar('14')));
  SendMessage(hComboBox, CB_ADDSTRING, 0, Longword(PChar('30')));
  SendMessage(hComboBox, CB_ADDSTRING, 0, Longword(PChar('62')));
  SendMessage(hComboBox, CB_ADDSTRING, 0, Longword(PChar('125')));
// 设新字体,以缩小尺寸 ..
  SendMessage(hComboBox, WM_SETFONT, hSmallFont, 0);
  ShowWindow(hComboBox, SW_SHOW); 
// 某些全局变量初始化 ..
  GetWindowRect(hComboBox, ComboBoxDrawRect);
  OffsetRect(ComboBoxDrawRect, -ComboBoxDrawRect.Left, -ComboBoxDrawRect.Top);
  SubButtonWidth := GetSystemMetrics(SM_CXVSCROLL);
  BosomBrush := CreateSolidBrush(GetSysColor(COLOR_WINDOW));
  FrameBrush := CreateSolidBrush( RGB(0, 0, 0) );
// 连接ComboBox新过程 ..
  DefComboBoxProc := Pointer(SetWindowLong(hComboBox, GWL_WNDPROC, LongWord(@NewComboBoxProc)));  
end;

end.
