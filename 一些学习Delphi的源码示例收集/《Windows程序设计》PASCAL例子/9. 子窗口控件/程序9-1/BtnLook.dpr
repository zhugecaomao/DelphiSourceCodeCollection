program  BtnLook;

uses
  Windows, Messages;

  // 窗体过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
type
  TButton = record
    iStyle: Integer;
    szText: PChar;
  end;
const
  szTop = 'message         wParam      lParam';
  szUnd = '_______         ______      ______';
  szFormat = '%-16s%04X-%04X   %04X-%04X';
  Num = 10;
  Button: array[0..Num-1] of TButton =
   ( (iStyle: BS_PUSHBUTTON; szText: 'PUSHBUTTON'),
     (iStyle: BS_DEFPUSHBUTTON; szText: 'DEFPUSHBUTTON'),
     (iStyle: BS_CHECKBOX; szText: 'CHECKBOX'),
     (iStyle: BS_AUTOCHECKBOX; szText: 'AUTOCHECKBOX'),
     (iStyle: BS_RADIOBUTTON; szText: 'RADIOBUTTON'),
     (iStyle: BS_3STATE; szText: '3STATE'),
     (iStyle: BS_AUTO3STATE; szText: 'AUTO3STATE'),
     (iStyle: BS_GROUPBOX; szText: 'GROUPBOX'),
     (iStyle: BS_AUTORADIOBUTTON; szText: 'AUTORADIO'),
     (iStyle: BS_OWNERDRAW; szText: 'OWNERDRAW') );
{$J+}
  hWndButton: array[0..NUM-1] of DWORD = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  Rect: TRect = (Left: 0; Top: 0; Right: 0; Bottom: 0);
  cxChar: Integer = 0;
  cyChar: Integer = 0;
{$J-}
var
  szBuffer: array[0..50] of Char;
  hWndDc: HDC;
  PS: TPaintStruct;
  J: Integer;
  List: array[0..5] of DWORD;
begin
  Result := 0;
 // 区分不同的消息
  case Msg of
    WM_CREATE:
      begin
        cxChar := LOWORD(GetDialogBaseUnits);
        cyChar := HIWORD(GetDialogBaseUnits);
        for J := 0 to NUM-1 do
          hWndButton[J] := CreateWindow('button', Button[J].szText,
                             WS_CHILD or WS_VISIBLE or Button[J].iStyle,
                             cxChar, cyChar * (1 + 2 * J), 20 * cxChar, 7 * cyChar div 4,
                             hWnd, J, PCreateStruct(lParam).hInstance, nil);

      end;

    WM_SIZE:
      begin
        Rect.Left := 24 * cxChar;
        Rect.Top :=  2 * cyChar;
        Rect.Right := LOWORD(lParam);
        Rect.bottom := HIWORD(lParam);
      end;

    WM_PAINT:
      begin
        InvalidateRect(hWnd, @Rect, TRUE); // 清除消息信息
        hWndDc := BeginPaint(hWnd, PS);
        
        SelectObject(hWndDc, GetStockObject(SYSTEM_FIXED_FONT));
        SetBkMode(hWndDc, TRANSPARENT);
        TextOut(hWndDc, 24 * cxChar, cyChar, szTop, lstrlen(szTop)); // 标题
        TextOut(hWndDc, 24 * cxChar, cyChar, szUnd, lstrlen(szUnd)); // 下划线

        EndPaint(hWnd, PS);
      end;

    WM_DRAWITEM,
    WM_COMMAND:
      begin
        ScrollWindow(hWnd, 0, -cyChar, @Rect, @Rect); // 向上翻动一行

        hWndDc := GetDC(hWnd);
        SelectObject(hWndDc, GetStockObject(SYSTEM_FIXED_FONT));
        
        if (Msg = WM_DRAWITEM)
        then List[0] := DWORD(PChar('WM_DRAWITEM'))
        else List[0] := DWORD(PChar('WM_COMMAND'));
        List[1] := HIWORD(wParam);
        List[2] := LOWORD(wParam);
        List[3] := HIWORD(lParam);
        List[4] := LOWORD(lParam);
        TextOut(hWndDc, 24 * cxChar, cyChar * (Rect.Bottom div cyChar - 1),
              szBuffer, wvsprintf(szBuffer, szFormat, @List[0]));

        ReleaseDC(hWnd, hWndDc);

        ValidateRect(hWnd, @Rect); // 区域有效(祛除WM_PAINT)
      end;

    WM_DESTROY:
      PostQuitMessage(0); // 放置WM_QUIT导致GetMessage返回FALSE

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end;


const
  AppName = 'BtnLook';

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
  WndClass.lpszClassName := AppName;

 // 注册窗体类
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', AppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(AppName, 'Button Look',
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
