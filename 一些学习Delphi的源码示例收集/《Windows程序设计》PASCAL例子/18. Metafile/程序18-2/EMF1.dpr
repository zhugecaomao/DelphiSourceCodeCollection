program  EMF1;

uses
  Windows, Messages;

   // 窗体消息处理过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  hemf: HENHMetaFile = 0;
{$J-}
var
  hdcWnd, hdcEMF: HDC;
  ps: TPaintStruct;
  Rect: TRect;
begin
  Result := 0;
 // 区分不同的消息
  case Msg of
    WM_CREATE:
      begin
        hdcEMF := CreateEnhMetaFile(0, nil, nil, nil);
        Rectangle(hdcEMF, 100, 100, 200, 200);
        MoveToEx(hdcEMF, 100, 100, nil);
        LineTo(hdcEMF, 200, 200);
        MoveToEx(hdcEMF, 200, 100, nil);
        LineTo(hdcEMF, 100, 200);
        hemf := CloseEnhMetaFile(hdcEMF);
      end;

    WM_PAINT:
      begin
        hdcWnd := BeginPaint(hWnd, ps);

        GetClientRect(hWnd, Rect);
        Rect.Left := Rect.Right div 4;
        Rect.Right := 3 * Rect.Right div 4;
        Rect.Top := Rect.Bottom div 4;
        Rect.Bottom := 3 * Rect.Bottom div 4;
        PlayEnhMetaFile(hdcWnd, hemf, Rect);

        EndPaint(hWnd, ps);
      end;


    WM_DESTROY:
      begin
        PostQuitMessage(0); // 退出
        DeleteMetaFile(hemf);
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end; 

  
const
  szAppName = 'EMF1';

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
  hWnd := CreateWindow(szAppName, 'Enhanced MetaFile Demo #1',
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
