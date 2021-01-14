program  Colors1;

uses
  Windows, Messages, Math;

var
  idFocus: Integer; // 当前焦点滚动条ID
  OldScroll: array[0..2] of Pointer; // 原滚动条处理过程

   // 滚动控件消息处理过程
function ScrollProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  id : Integer;
begin
  id := GetWindowLong(hWnd, GWL_ID); // 控件ID
  case Msg of
    WM_KEYDOWN:
      if (wParam = VK_TAB) then  // 跳转焦点到其他滚动条
        if (GetKeyState(VK_SHIFT) < 0) then
          SetFocus(GetDlgItem(GetParent(hWnd), (id + 2) mod 3))
        else
          SetFocus(GetDlgItem(GetParent(hWnd), (id + 1) mod 3));
          
    WM_SETFOCUS:
      idFocus := id; // 保存焦点ID
  end;
  Result := CallWindowProc(OldScroll[id], hWnd, Msg, wParam, lParam); // 标准处理
end;

   // 主窗体消息处理过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  crPrim: array[0..2] of COLORREF = ( $FF, $FF00, $FF0000 ); // 红绿蓝
  szColorLabel: array[0..2] of PChar = ('Red', 'Green', 'Blue'); // 标题
{$J+}
  hBrush: array[0..2] of DWORD = (0, 0, 0); // 滚动条控件背景画刷
  hBrushStatic: DWORD = 0; // 文字Static控件背景画刷
  hWndScroll: array[0..2] of DWORD = (0, 0, 0); // 滚动条控件句柄
  hWndLabel: array[0..2] of DWORD = (0, 0, 0); // 标题静态文本句柄
  hWndValue: array[0..2] of DWORD = (0, 0, 0); // 数值静态文本句柄
  hWndRect: DWORD = 0; // 静态矩形控件句柄(白色部分)
  Color: array[0..2] of Integer = (0, 0, 0); // 三原色(也代表滚动条当前位置)
  cyChar: Integer = 0; // 内定字符高度
  rcColor: TRect = (Left: 0; Top: 0; Right: 0; Bottom: 0); // '混色'填充范围
{$J-}
var
  J, cxClient, cyClient: Integer;
  szBuffer: array[0..10] of Char;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      begin
       // 静态矩形(白色部分, ID: 9)
        hWndRect := CreateWindow('static', nil,
                       WS_CHILD or WS_VISIBLE or SS_WHITERECT,
                       0, 0, 0, 0, hWnd, 9, hInstance, nil);
        for J := 0 to 2 do
        begin
         // 滚动条(ID: 0~2)
          hWndScroll[J] := CreateWindow('scrollbar', nil,
                                  WS_CHILD or WS_VISIBLE or WS_TABSTOP or SBS_VERT,
                                  0, 0, 0, 0, hWnd, J, hInstance, nil);
          SetScrollRange(hWndScroll[J], SB_CTL, 0, 255, FALSE);
          SetScrollPos(hWndScroll[J], SB_CTL, 0, FALSE);
         // 标题(ID: 3~5)
          hWndLabel[J] := CreateWindow('static', szColorLabel[J],
                                 WS_CHILD or WS_VISIBLE or SS_CENTER,
                                 0, 0, 0, 0, hWnd, J + 3, hInstance, nil);
         // 数值(ID: 6~8)
          hWndValue[J] := CreateWindow('static', '0',
                                 WS_CHILD or WS_VISIBLE or SS_CENTER,
                                 0, 0, 0, 0, hWnd, J + 6, hInstance, nil);
         // '子类化'滚动条
          OldScroll[J] := Pointer(SetWindowLong(hWndScroll[J], GWL_WNDPROC, Integer(@ScrollProc)));
         // 滚动条背景画刷
          hBrush[J] := CreateSolidBrush(crPrim[J]);
        end;
        hBrushStatic := CreateSolidBrush(GetSysColor(COLOR_BTNHIGHLIGHT)); // 文字Static背景画刷
        cyChar := HIWORD(GetDialogBaseUnits()); // 内定字符高度
      end;

    WM_SIZE:
      begin
        cxClient := LOWORD(lParam);
        cyClient := HIWORD(lParam);                                      
        SetRect(rcColor, cxClient div 2, 0, cxClient, cyClient); // '混色'填充区域
        MoveWindow(hWndRect, 0, 0, cxClient div 2, cyClient, TRUE); // 静态方框(白色)
        for J := 0 to 2 do // 调整其他控件
        begin
          MoveWindow(hWndScroll[J], (2 * J + 1) * cxClient div 14, 2 * cyChar,
                  cxClient div 14, cyClient - 4 * cyChar, TRUE);
          MoveWindow(hWndLabel[J], (4 * J + 1) * cxClient div 28, cyChar div 2,
                  cxClient div 7, cyChar, TRUE);
          MoveWindow(hWndValue[J], (4 * J + 1) * cxClient div 28,
                  cyClient - 3 * cyChar div 2, cxClient div 7, cyChar, TRUE);
        end;
        SetFocus(hWnd); // 调整焦点阴影方块
      end;

    WM_SETFOCUS:
      SetFocus(hWndScroll[idFocus]); // 焦点转到滚动条

    WM_VSCROLL:
      begin
        J := GetWindowLong(lParam, GWL_ID); // 所操作滚动条的ID(对应数组下标)
        case LOWORD(wParam) of
          SB_PAGEDOWN:
            Color[J] := Min(255, Color[J] + 16);

          SB_LINEDOWN:
            Color[J] := Min(255, Color[J] + 1);

          SB_PAGEUP:
            Color[J] := Max(0, Color[J] - 16);

          SB_LINEUP:
            Color[J] := Max(0, Color[J] - 1);

          SB_TOP:
            Color[J] := 0;

          SB_BOTTOM:
            Color[J] := 255;

          SB_THUMBPOSITION,
          SB_THUMBTRACK:
            Color[J] := HIWORD(wParam);
        end;
        SetScrollPos(hWndScroll[J], SB_CTL, color[J], TRUE); // 重设位置
        wvsprintf(szBuffer, '%i', @Color[J]); // IntToStr --> szBuffer
        SetWindowText(hWndValue[J], szBuffer); // 单色数值
        DeleteObject(SetClassLong(hWnd, GCL_HBRBACKGROUND, // 重设主窗体背景画刷
                  CreateSolidBrush(RGB(Color[0], Color[1], Color[2]))));
        InvalidateRect(hWnd, @rcColor, TRUE); // 刷新
      end;

    WM_CTLCOLORSCROLLBAR: 
      begin
        J := GetWindowLong(lParam, GWL_ID);
        Result := hBrush[J]; // 滚动条绘制刷子
      end;

    WM_CTLCOLORSTATIC:
      begin
        J := GetWindowLong(lParam, GWL_ID);
        if (J >= 3) and (J <= 8) then  // 静态文字控件
        begin
          SetTextColor(wParam, crPrim[J mod 3]);
          SetBkColor(wParam, GetSysColor(COLOR_BTNHIGHLIGHT));
          Result := hBrushStatic;
        end;
      end;  

    WM_SYSCOLORCHANGE:
      begin
        DeleteObject(hBrushStatic);
        hBrushStatic := CreateSolidBrush(GetSysColor(COLOR_BTNHIGHLIGHT));
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0); // 放置WM_QUIT使消息循环结束
        DeleteObject(SetClassLong(hWnd, GCL_HBRBACKGROUND, GetStockObject(WHITE_BRUSH))); // 选出并删除
        for J:= 0 to 2 do DeleteObject(hBrush[J]);
        DeleteObject(hBrushStatic);
      end;
      
    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end;   

const            
  AppName = 'Colors1';
var
  hWnd: LongWord;
  Msg: TMsg;
  WndClass: TWndClass;       
begin
 // 填充结构体
  WndClass.style := CS_HREDRAW or CS_VREDRAW;
  WndClass.lpfnWndProc := @WndProc;
  WndClass.cbClsExtra := 0;
  WndClass.cbWndExtra := 0;
  WndClass.hInstance := hInstance;
  WndClass.hIcon := LoadIcon(0, IDI_APPLICATION);
  WndClass.hCursor := LoadCursor(0, IDC_ARROW);
  WndClass.hbrBackground := CreateSolidBrush(0); // 黑色
  WndClass.lpszMenuName := nil;
  WndClass.lpszClassName := AppName;
 // 注册窗体类
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', AppName, MB_ICONERROR);
    Exit;
  end;
 // 建立窗体
  hWnd := CreateWindow(AppName, 'Color Scroll',
                       WS_OVERLAPPEDWINDOW,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       0, 0, hInstance, nil);
 // 显示窗体
  ShowWindow(hWnd, CmdShow);
  UpdateWindow(hWnd);  
 // 消息循环
  while GetMessage(Msg, 0, 0, 0) do
  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end.
