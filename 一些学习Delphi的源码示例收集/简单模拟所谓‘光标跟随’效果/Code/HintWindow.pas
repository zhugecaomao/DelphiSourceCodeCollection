unit HintWindow;

interface

procedure Active_Hint(Left, Top: Integer; const Text: string); // 激活HintWindow

implementation

uses
  Windows, Messages;

var
  HintText: string;  // Hint窗体要显示的提示文字
  No_Enter: Boolean; // 鼠标尚未进入HintWindow内
  HintHandle: DWORD; // HintWindow窗体句柄
  
    // 重新引入API函数以便Active_Hint()调用
function GetTabbedTextExtent(hDC: HDC; lpString: PChar; nCount,
  nTabPositions: Integer; pnTabStopPositions: Pointer): LongWord; stdcall;
  external user32 name 'GetTabbedTextExtentA';

    // 激活提示窗体
procedure Active_Hint(Left, Top: Integer; const Text: string);
var
  TextWidth, TextHeight, ScreenWidth, HintDC: Integer;
begin
  HintText := Text;
  No_Enter := TRUE;

 // 取字符串显示范围
  HintDC := GetDC(HintHandle);
  TextWidth := GetTabbedTextExtent(HintDC, PChar(HintText), Length(HintText), 0, nil);
  ReleaseDC(HintHandle, HintDC);
  TextHeight := HIWORD(TextWidth);
  TextWidth := LOWORD(TextWidth);

 // 是否超出屏幕宽度
  ScreenWidth := Word(GetSystemMetrics(SM_CXSCREEN));
  if ((Left + TextWidth) > ScreenWidth) then Left := ScreenWidth - TextWidth - 5;
  
 // (合适位置)显示窗体
  SetWindowPos(HintHandle, HWND_TOPMOST, Left, Top, TextWidth, TextHeight, SWP_NOACTIVATE);
  ShowWindow(HintHandle, SW_SHOWNOACTIVATE);
end;

    // 窗体过程回调函数
function HintProc(hHint, MsgID, WParam, LParam: DWORD): DWORD; stdcall;
const
{$J+}
  EventTrack: TTrackMouseEvent = 
   ( cbSize: SizeOf(TTrackMouseEvent);
     dwFlags: TME_LEAVE;
     hwndTrack: 0;
     dwHoverTime: HOVER_DEFAULT );
  TempFont: DWORD = 0;     
{$J-}
var
  CurPos: TPoint;
  CurWin: DWORD;
  Ps: TPaintStruct;  
begin
  Result:= 0;
  case MsgID of
    WM_PAINT: // 绘制
      begin
        BeginPaint(hHint, Ps);

        SetBkMode(Ps.hdc, TRANSPARENT);
        SelectObject(Ps.hdc, TempFont);
        TextOut(Ps.hdc, 1, 1, PChar(HintText), Length(HintText));

        EndPaint(hHint, Ps);
      end;

    WM_MOUSEMOVE,
    WM_LBUTTONDOWN,
    WM_RBUTTONDOWN:
      begin
        if No_Enter then  // 初入 HintWindow ..
        begin             // 则要求鼠标离开通知
          No_Enter := FALSE;
          EventTrack.hwndTrack := hHint;
          TrackMouseEvent(EventTrack);
        end else
        begin // 隐藏自己并转发消息给下面控件
          CurPos.X := LOWORD(LParam);
          CurPos.Y := HIWORD(LParam);
          ClientToScreen(hHint, CurPos);
          ShowWindow(hHint, SW_HIDE);
          CurWin := WindowFromPoint(CurPos);
          ScreenToClient(CurWin, CurPos);
          LParam := (CurPos.Y shl 16) or CurPos.X;
          SendMessage(CurWin, MsgID, WParam, LParam);
        end;
      end;

    WM_MOUSELEAVE: // 鼠标离开通知
      begin
        ShowWindow(hHint, SW_HIDE);
        No_Enter := TRUE;
      end;

    WM_CREATE:
      begin
        TempFont := CreateFont(12, 6, 0, 0, FW_EXTRALIGHT, Byte(FALSE), Byte(FALSE),
          Byte(FALSE), GB2312_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,
          DEFAULT_QUALITY, DEFAULT_PITCH, '宋体');
      end;

    WM_DESTROY:
      begin
        DeleteObject(TempFont); // 删除字体对象
      end;

    else
      Result := DefWindowProc(hHint, MsgID, WParam, LParam); // 标准处理
  end;
end;

procedure Create_HintWindow;
var
  HintClass: TWndClass;
begin
  HintClass.Style := CS_HREDRAW or CS_VREDRAW;
  HintClass.lpfnWndProc := @HintProc;
  HintClass.cbClsExtra := 0;
  HintClass.cbWndExtra := 0;
  HintClass.hInstance := SysInit.HInstance;
  HintClass.hIcon := 0;
  HintClass.hCursor := LoadCursor(0, IDC_ARROW);
  HintClass.hbrBackground := COLOR_INFOBK + 1;
  HintClass.lpszMenuName := nil;
  HintClass.lpszClassName := 'Follow_HintWindow_Mazi';
  RegisterClass(HintClass);

  HintHandle := CreateWindowEx(WS_EX_TOPMOST or WS_EX_TOOLWINDOW, HintClass.lpszClassName,
    'I Love LiuMazi :-P', WS_POPUP or WS_BORDER, 0, 0, 0, 0, 0, 0, HInstance, nil);
end;

procedure Destroy_HintWindow;
begin  
  DestroyWindow(HintHandle);
end;

initialization
  Create_HintWindow;

finalization
  Destroy_HintWindow;

end.
