unit  PanelMouse;

interface

   // ---- 处理Panel3上鼠标动作 ---- //
procedure Dispose_Panel_MouseMsg(MsgID, LParam: LongWord);

implementation

uses
  Windows, Messages, ShellAPI, PublicUnit;

const
  Link1Rect: TRect= (Left: 125;  Top: 20;  Right: 295; Bottom: 34);
  Link2Rect: TRect= (Left: 125;  Top: 50;  Right: 260; Bottom: 64);
  Link3Rect: TRect= (Left: 125;  Top: 80;  Right: 300; Bottom: 94);
  Link4Rect: TRect= (Left: 125;  Top: 110; Right: 295; Bottom: 124);  

var
  NoEnter: Boolean = TRUE;   // 鼠标之前未进入Panel3

   // ---- 刷新Panel3上文字 ---- //
procedure Refurbish_Panel_Label(OldStatue: Integer);
begin
 // 擦除
  case OldStatue of
    1: InvalidateRect(hPanel3, @Link1Rect, True);
    2: InvalidateRect(hPanel3, @Link2Rect, True);
    3: InvalidateRect(hPanel3, @Link3Rect, True);
    4: InvalidateRect(hPanel3, @Link4Rect, True);
  end;
 // 重绘
  SendMessage(hPanel3, WM_PAINT, 0, 0);
end;

   // ---- 当鼠标移动时调用 ---- //
procedure On_Panel_MouseMove(X, Y: Longword);
var
  CursorPos: TPoint;
  Cur_Focus: Integer;
  Old_Focus: Integer;
begin
  if NoEnter then   // 初次进入Panel3则设置监视离开
  begin
    NoEnter := FALSE;  SetLeaveEvent(hPanel3);
  end;
  
  CursorPos.X := X;  CursorPos.Y := Y;
  
  if PtInRect(Link1Rect, CursorPos) then Cur_Focus := 1
  else if PtInRect(Link2Rect, CursorPos) then Cur_Focus := 2
       else if PtInRect(Link3Rect, CursorPos) then Cur_Focus := 3
            else if PtInRect(Link4Rect, CursorPos) then Cur_Focus := 4
                 else Cur_Focus := 0;

  if (Mouse_Focus<>Cur_Focus) then
  begin
    Old_Focus := Mouse_Focus;
    Mouse_Focus := Cur_Focus;
    Refurbish_Panel_Label(Old_Focus);
  end;   
end;

   // ---- 当鼠标按下时调用 ---- //
procedure On_Panel_MouseDown(X, Y: Longword);
var
  CursorPos: TPoint;
begin
  CursorPos.X := X;  CursorPos.Y := Y;
  
  if PtInRect(Link1Rect, CursorPos) then
    ShellExecute(0, 'open', 'http://www.delphibbs.com', nil, nil, SW_SHOW)
  else
    if PtInRect(Link2Rect, CursorPos) then
      ShellExecute(0, 'open', 'http://www.2ccc.com', nil, nil, SW_SHOW)
    else
      if PtInRect(Link3Rect, CursorPos) then
        ShellExecute(0, 'open', 'http://www.delphifans.com', nil, nil, SW_SHOW)
      else
        if PtInRect(Link4Rect, CursorPos) then
          ShellExecute(0, 'open', 'http://Liumazi.ys168.com', nil, nil, SW_SHOW);
end;

   // ---- 当鼠标离去时调用 ---- //
procedure On_Panel_MouseLeave;
var
  Old_Focus: Integer;
begin
  Old_Focus := Mouse_Focus;
  Mouse_Focus := 0;
  Refurbish_Panel_Label(Old_Focus);
  NoEnter := TRUE;  
end;

   // ---- 处理Panel3上鼠标动作 ---- //
procedure Dispose_Panel_MouseMsg(MsgID, LParam: LongWord);
begin
  case MsgId of
    WM_MOUSEMOVE   :  On_Panel_MouseMove(LOWORD(lParam), HIWORD(lParam));
    WM_LBUTTONDOWN :  On_Panel_MouseDown(LOWORD(lParam), HIWORD(lParam));
    WM_MOUSELEAVE  :  On_Panel_MouseLeave;
  end;
  if (Mouse_Focus<>0) then SetCursor(hHandCursor);
end;

end.        
