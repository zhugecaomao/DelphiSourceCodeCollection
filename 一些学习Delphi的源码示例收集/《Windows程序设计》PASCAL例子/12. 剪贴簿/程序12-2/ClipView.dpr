program  ClipView;

uses
  Windows, Messages;

  // 窗体消息处理过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  hWndNextViewer: Longint = 0; // 下一个监视窗口
{$J-}
var
  hWndDc: HDC;
  ps: TPaintStruct;
  Rect: TRect;
  hGlobal: DWORD;
  pGlobal: PChar;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      hWndNextViewer := SetClipboardViewer(hWnd); // 添加监视窗口

    WM_CHANGECBCHAIN:
      begin
        if (wParam = hWndNextViewer) then // 被摘除的是下一个监视窗口
          hWndNextViewer := lParam
        else
          if (hWndNextViewer <> 0) then
            SendMessage(hWndNextViewer, Msg, wParam, lParam); // 传给下一个监视窗口
      end;

    WM_DRAWCLIPBOARD:
      begin
        if (hWndNextViewer <> 0) then
          SendMessage(hWndNextViewer, Msg, wParam, lParam); // 传给下一个监视窗口
        InvalidateRect(hWnd, nil, TRUE); // 重画(剪贴板中文字内容)
      end;

    WM_PAINT:
      begin
        hWndDc := BeginPaint(hWnd, ps);

        GetClientRect(hWnd, Rect); // 窗体客户区范围
        OpenClipboard(hWnd); // 打开剪贴板
        hGlobal := GetClipboardData(CF_TEXT); // 取得文字信息内存块
        if (hGlobal <> 0) then // 取到
        begin
          pGlobal := GlobalLock(hGlobal); // 锁定
          DrawText(hWndDc, pGlobal, -1, Rect, DT_EXPANDTABS); // 绘制
          GlobalUnlock(hGlobal); // 解锁
        end;
        CloseClipboard(); // 关闭剪贴板

        EndPaint(hWnd, ps);
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0); // 放一个WM_QUIT消息
        ChangeClipboardChain(hWnd, hWndNextViewer); // 从监视窗口链中摘除
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end;

const
  szAppName = 'ClipView';
var
  hWnd: DWORD;
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
  WndClass.hbrBackground := GetStockObject(WHITE_BRUSH);
  WndClass.lpszMenuName := nil;
  WndClass.lpszClassName := szAppName;

 // 注册窗体类
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(szAppName, 'Simple Clipboard Viewer (Text Only)',
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
