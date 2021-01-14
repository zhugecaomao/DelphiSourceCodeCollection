unit  ListMouse;

interface

   // ---- 处理ListBox鼠标动作 ---- //
procedure Dispose_List_MouseMsg(MsgID, LParam: LongWord);

implementation

uses
  Windows, Messages, ListUnit, PublicUnit;

   // ---- 当鼠标移动时调用 ---- //
procedure On_List_MouseMove(lParam: LongWord);
var
  CurRect: TRect;
begin
  if not OnDraging then Exit; // 非拖拽状态 ..
  DragMoved := TRUE;           // 已'拖拽'过 ..
  CurRect := GetCur_ItemRect( LOWORD(lParam), HIWORD(lParam) );
  if (CurRect.Top <> PriorRect.Top) then
  begin
    InvalidateRect(hListBox, @PriorRect, True);
    PriorRect := CurRect;
    PriorRect.Bottom := PriorRect.Top + 2;
    SendMessage(hListBox, WM_PAINT, 0, 0);
  end;
end;

   // ---- 当右键按下时调用 ---- //
procedure On_List_rButtonDown(lParam: LongWord);
var
  CurIndex: Integer;
begin
  CurIndex := SendMessage(hListBox, LB_ITEMFROMPOINT, 0, lParam);
    // 按下处有结点 并且 处于选中状态 ..
  if (HIWORD(CurIndex) = 0)and(SendMessage(hListBox, LB_GETSEL, CurIndex, 0) > 0) then
  begin
    OnDraging := TRUE;  // 进入拖拽状态
    DragMoved := FALSE;  // 未拖过(鼠标)
  end;
end;

   // ---- 当右键抬起时调用 ---- //
procedure On_List_rButtonUp(lParam: LongWord);
begin
  if OnDraging then    // 在ListBox按下的右键 ..
  begin
    ListBox_StopDrap;   // 拖拽停止 ..
    if DragMoved then   // 曾拖拽过 ..
      Exchange_List( GetCur_ItemIndex(LOWORD(lParam), HIWORD(lParam)) );
  end;
end;

   // ---- 处理ListBox鼠标动作 ---- //
procedure Dispose_List_MouseMsg(MsgID, LParam: LongWord);
begin
  ReTest_Enter_List;  // 尝试安装监视时钟 ..
  case MsgId of
    WM_MOUSEMOVE   :  On_List_MouseMove(LParam);
    WM_RBUTTONDOWN :  On_List_rButtonDown(LParam);
    WM_RBUTTONUP   :  On_List_rButtonUp(LParam);
  end;
  if OnDraging then SetCursor(hDrapCursor);   
end;

end.
