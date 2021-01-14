program  PoePoem;

{$R PoePoem.res}

uses
  Windows, Messages, Math;

   // 窗体消息处理过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  pText: PChar = nil; // 资源字符串地址
  lText: Integer = 0; // 资源字符串长度
  hResource: HGLOBAL = 0; // 资源内存对象句柄
  hScroll: LongWord = 0; // 滚动条控件句柄
  iPosition: Integer = 0; // 滚动条当前位置
  cxChar: Integer = 0; // 字符宽度
  cyChar: Integer = 0; // 字符高度
  cyClient: Integer = 0; // 窗体高度
  iNumLines: Integer = 0; // 文本行数
  xScroll: Integer = 0; // 滚动条宽度
{$J-}
var
  hWndDc: HDC;
  ps: PAINTSTRUCT;
  Rect: TRect;
  tm: TTextMetric;
begin
  Result := 0;
 // 区分不同的消息
  case Msg of
    WM_CREATE:
      begin
        hWndDc := GetDC(hWnd);
        GetTextMetrics(hWndDc, tm); // 字体度量信息
        cxChar := tm.tmAveCharWidth;
        cyChar := tm.tmHeight + tm.tmExternalLeading;
        ReleaseDC(hWnd, hWndDc);

        xScroll := GetSystemMetrics(SM_CXVSCROLL); // 滚动条 ..
        hScroll := CreateWindow('scrollbar', nil,
                                WS_CHILD or WS_VISIBLE or SBS_VERT,
                                0, 0, 0, 0, hWnd, 1, hInstance, nil);

        hResource := LoadResource(hInstance, FindResource(hInstance, 'AnnabelLee', 'TEXT'));
        pText := LockResource(hResource); // 资源地址
        while (pText^ <> '\') and (pText^ <> #0) do
        begin
          if (pText^ = #13) then Inc(iNumLines);
          Inc(lText, AnsiNext(pText)-pText);
          pText := AnsiNext(pText);
        end;

        SetScrollRange(hScroll, SB_CTL, 0, iNumLines, FALSE);
        SetScrollPos(hScroll, SB_CTL, 0, FALSE);
      end;

    WM_SIZE:
      begin
        cyClient := HIWORD(lParam);
        MoveWindow(hScroll, LOWORD(lParam)-xScroll, 0, xScroll, cyClient, TRUE);
        SetFocus(hWnd);
      end;

    WM_SETFOCUS:
      begin
        SetFocus(hScroll);
      end;

    WM_VSCROLL:
      begin
        case LOWORD(wParam) of // 操作类型
          SB_TOP:
            iPosition := 0;

          SB_BOTTOM:
            iPosition := iNumLines;

          SB_LINEUP:
            Dec(iPosition);

          SB_LINEDOWN:
            Inc(iPosition);

          SB_PAGEUP:
            Dec(iPosition, cyClient div cyChar);

          SB_PAGEDOWN:
            Inc(iPosition, cyClient div cyChar);

          SB_THUMBPOSITION:
            iPosition := HIWORD(wParam);
        end;
        iPosition := Max(0, Min(iPosition, iNumLines)); // 范围限制
        if (iPosition <> GetScrollPos(hScroll, SB_CTL)) then // 变化
        begin
          SetScrollPos(hScroll, SB_CTL, iPosition, TRUE); // 新位置
          InvalidateRect(hWnd, nil, TRUE); // 刷新(产生WM_PAINT)
        end; 
      end;
      
    WM_PAINT:
      begin
        hWndDc := BeginPaint(hWnd, ps);

        pText := LockResource(hResource);
        GetClientRect(hWnd, Rect);
        Inc(Rect.Left, cxChar);
        Inc(Rect.Top, cyChar * (1 - iPosition));
        DrawTextA(hWndDc, PText, lText, Rect, DT_EXTERNALLEADING);

        EndPaint(hWnd, ps);
      end;


    WM_DESTROY:
      begin
        PostQuitMessage(0); // 放一个WM_QUIT消息到消息队列
        FreeResource(hResource);  // 释放
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end;    

const
  IDS_APPNAME = 1;
  IDS_CAPTION = 2;
  IDS_ERRMSG = 3;

var
  hWnd: LongWord;
  Msg: TMsg;
  WndClass: TWndClass;
  szAppName: array[0..16] of Char;
  szCaption: array[0..64] of Char;
  szErrMsg: array[0..64] of Char;

begin
 // 装入字符串资源
  LoadString(hInstance, IDS_APPNAME, szAppName, 16);
  LoadString(hInstance, IDS_CAPTION, szCaption, 64);

 // 填充结构体
  WndClass.style := CS_HREDRAW or CS_VREDRAW;
  WndClass.lpfnWndProc := @WndProc;
  WndClass.cbClsExtra := 0;
  WndClass.cbWndExtra := 0;
  WndClass.hInstance := hInstance;
  WndClass.hIcon := LoadIcon(hInstance, szAppName);
  WndClass.hCursor := LoadCursor(0, IDC_ARROW);
  WndClass.hbrBackground := GetStockObject(WHITE_BRUSH);
  WndClass.lpszMenuName := nil;
  WndClass.lpszClassName := szAppName;

 // 注册窗体类
  if (RegisterClass(WndClass) = 0) then
  begin
    LoadStringA(hInstance, IDS_APPNAME, szAppName, 16);
    LoadStringA(hInstance, IDS_ERRMSG, szErrMsg, 64);
    MessageBox(0, szErrMsg, szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(szAppName, szCaption,
                       WS_OVERLAPPEDWINDOW or WS_CLIPCHILDREN,
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

(*  注1: 似乎LockResource得到的地址不允许写,所以我加了个长度变量 *)
(*  注2: Windows.pas中LoadString定义为LoadStringA,肯定不会出错的 *)
end.
