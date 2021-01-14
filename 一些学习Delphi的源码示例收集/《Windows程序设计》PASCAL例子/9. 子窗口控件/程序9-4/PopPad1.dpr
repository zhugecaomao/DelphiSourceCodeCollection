program  PopPad1;

uses
  Windows, Messages;

const
  szAppName = 'PopPad1';  

   // 主窗体消息处理过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  ID_EDIT = 1;
{$J+}
  hWndEdit: LongWord = 0;
{$J-}
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      hwndEdit := CreateWindow('edit', nil,
            WS_CHILD or WS_VISIBLE or WS_HSCROLL or WS_VSCROLL or WS_BORDER or
            ES_LEFT or ES_MULTILINE or ES_AUTOHSCROLL or ES_AUTOVSCROLL,
            0, 0, 0, 0, hWnd, ID_EDIT, PCreateStruct(lParam).hInstance, nil);

    WM_SETFOCUS:
      SetFocus(hWndEdit);

    WM_SIZE:
      MoveWindow(hWndEdit, 0, 0, LOWORD(lParam), HIWORD(lParam), TRUE);

    WM_COMMAND:
      if (LOWORD(wParam) = ID_EDIT) then
        if (HIWORD(wParam) = EN_ERRSPACE) or (HIWORD(wParam) = EN_MAXTEXT) then
          MessageBox(hWnd, 'Edit control out of space.', szAppName, MB_OK or MB_ICONSTOP);

    WM_DESTROY:
      PostQuitMessage(0);

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam);
  end;
end;   

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
  hWnd := CreateWindow(szAppName, szAppName,
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
