program  Colors2;

{$R  Colors2.res}

uses
  Windows, Messages, Math;

  // 窗体消息处理过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
begin
  case Msg of
    WM_DESTROY:
      begin
        PostQuitMessage(0); // 退出消息循环
        DeleteObject(SetClassLong(hWnd, GCL_HBRBACKGROUND, GetStockObject(WHITE_BRUSH)));
        Result := 0;
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end;
  
  // 对话框消息接收过程
function ColorScrDlg(hDlg: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
const
{$J+}
  iColor: array[0..2] of Integer = (0, 0, 0); // 三个原色值(也是进度条位置)
{$J-}
var
  hWndParent, hCtrl: LongWord;
  iCtrlID, iIndex: Integer;
begin
  Result := FALSE;
  case Msg of
    WM_INITDIALOG:
      begin
        for iCtrlID := 10 to 12 do // 初始化进度条
        begin
          hCtrl := GetDlgItem(hDlg, iCtrlID);
          SetScrollRange(hCtrl, SB_CTL, 0, 255, FALSE);
          SetScrollPos(hCtrl, SB_CTL, 0, FALSE);
        end;
        Result := TRUE;
      end;

    WM_VSCROLL:
      begin
        hCtrl := lParam; // 控件句柄
        iCtrlID := GetWindowLong(hCtrl, GWL_ID); // 控件ID
        iIndex := iCtrlID - 10; // 数组下标
        hWndParent := GetParent(hDlg); // 对话框属主窗体
        case LOWORD(wParam) of // 滚动条动作
          SB_PAGEDOWN:
            iColor[iIndex] := Min(255, iColor[iIndex] + 16);

          SB_LINEDOWN:
            iColor[iIndex] := Min(255, iColor[iIndex] + 1);

          SB_PAGEUP:
            iColor[iIndex] := Max(0, iColor[iIndex] - 16);

          SB_LINEUP:
            iColor[iIndex] := Max(0, iColor[iIndex] - 1);

          SB_TOP:
            iColor[iIndex] := 0 ;

          SB_BOTTOM:
            iColor[iIndex] := 255;

          SB_THUMBPOSITION,
          SB_THUMBTRACK:
            iColor[iIndex] := HIWORD(wParam);
            
          else Exit; // Return FALSE;
        end;
        SetScrollPos(hCtrl, SB_CTL, iColor[iIndex], TRUE); // 进度条位置
        SetDlgItemInt(hDlg, iCtrlID + 3, iColor[iIndex], FALSE); // 静态文字
        DeleteObject(SetClassLong(hWndParent, GCL_HBRBACKGROUND, // 背景画刷
                  CreateSolidBrush(RGB(iColor[0], iColor[1], iColor[2]))));
        InvalidateRect(hWndParent, nil, TRUE); // 刷新
        Result := TRUE;
      end;
  end;
end;     

const
  szAppName = 'Colors2';
var
  Msg: TMsg;
  hWnd, hDlgModeless: LongWord;
  WndClass: TWndClass;          
begin
 // 注册窗体类
  WndClass.style := CS_HREDRAW or CS_VREDRAW;
  WndClass.lpfnWndProc := @WndProc;
  WndClass.cbClsExtra := 0;
  WndClass.cbWndExtra := 0;
  WndClass.hInstance := hInstance;
  WndClass.hIcon := LoadIcon(0, IDI_APPLICATION);
  WndClass.hCursor := LoadCursor(0, IDC_ARROW);
  WndClass.hbrBackground := CreateSolidBrush(0);
  WndClass.lpszMenuName := nil;
  WndClass.lpszClassName := szAppName;
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(szAppName, 'Color Scroll',
                       WS_OVERLAPPEDWINDOW or WS_CLIPCHILDREN,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       0, 0, hInstance, nil);

 // 显示窗体
  ShowWindow(hWnd, CmdShow);
  UpdateWindow(hWnd);

 // 建立对话框
  hDlgModeless := CreateDialog(hInstance, 'ColorScrDlg', hWnd, @ColorScrDlg);

 // 消息循环
  while GetMessage(Msg, 0, 0, 0) do
  begin
    if (not IsDialogMessage(hDlgModeless, Msg)) then
    begin
      TranslateMessage(Msg);
      DispatchMessage(Msg);
    end;
  end;
end.
