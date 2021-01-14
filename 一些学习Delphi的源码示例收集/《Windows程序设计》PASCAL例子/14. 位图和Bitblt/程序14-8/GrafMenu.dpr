program  GrafMenu;

{$R GrafMenu.res}

uses
  Windows, Messages;

const
  szAppName = 'GrafMenu';
  IDM_FONT_COUR    = 101;  // 菜单ID ..
  IDM_FONT_ARIAL   = 102;
  IDM_FONT_TIMES   = 103;
  IDM_HELP         = 104;
  IDM_EDIT_UNDO    = 40005;
  IDM_EDIT_CUT     = 40006;
  IDM_EDIT_COPY    = 40007;
  IDM_EDIT_PASTE   = 40008;
  IDM_EDIT_CLEAR   = 40009;
  IDM_FILE_NEW     = 40010;
  IDM_FILE_OPEN    = 40011;
  IDM_FILE_SAVE    = 40012;
  IDM_FILE_SAVE_AS = 40013;      

  // 调整位图尺寸
function StretchBitmap(hBitmap1: Integer): Integer;
var
  Bmp1, Bmp2: TBitmap;
  hBitmap2, hdc, hdcMem1, hdcMem2, cxChar, cyChar: Integer;
begin
 // Get the width and height of a system font character
  cxChar := LOWORD(GetDialogBaseUnits());
  cyChar := HIWORD(GetDialogBaseUnits());
 // Create 2 memory DCs compatible with the display
  hdc := CreateIC('DISPLAY', nil, nil, nil);
  hdcMem1 := CreateCompatibleDC(hdc);
  hdcMem2 := CreateCompatibleDC(hdc);
  DeleteDC(hdc);
 // Get the dimensions of the bitmap to be stretched
  GetObject(hBitmap1, SizeOf(TBitmap), @Bmp1);
 // Scale these dimensions based on the system font size
  Bmp2 := Bmp1;
  Bmp2.bmWidth := (cxChar * Bmp2.bmWidth) div 4;
  Bmp2.bmHeight := (cyChar * Bmp2.bmHeight) div 8;
  Bmp2.bmWidthBytes := ((Bmp2.bmWidth + 15) div 16) * 2;
 // Create a new bitmap of larger size
  hBitmap2 := CreateBitmapIndirect(Bmp2);
 // Select the bitmaps in the memory DCs and do a StretchBlt
  SelectObject(hdcMem1, hBitmap1);
  SelectObject(hdcMem2, hBitmap2);
  StretchBlt(hdcMem2, 0, 0, Bmp2.bmWidth, Bmp2.bmHeight, hdcMem1, 0, 0, Bmp1.bmWidth, Bmp1.bmHeight, SRCCOPY);
 // Clean up
  DeleteDC(hdcMem1);
  DeleteDC(hdcMem2);
  DeleteObject(hBitmap1);
  Result := hBitmap2;
end;

  // 求字体对应位图
function GetBitmapFont(i: Integer): HBITMAP;
const
  szFaceName: array[0..2] of PChar= ('Courier New', 'Arial', 'Times New Roman');
var  
  hBitmap, hdc, hdcMem, hFont: LongWord;
  Size: TSize;
  tm: TTextMetric;
begin
  hdc := CreateIC('DISPLAY', nil, nil, nil);
  GetTextMetrics(hdc, tm);
  hdcMem := CreateCompatibleDC(hdc);
  hFont := CreateFont(2 * tm.tmHeight, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, szFaceName[i]);
  hFont := SelectObject(hdcMem, hFont);
  GetTextExtentPoint32(hdcMem, szFaceName[i], lstrlen(szFaceName[i]), Size);
  hBitmap := CreateBitmap(Size.cx, Size.cy, 1, 1, nil);
  SelectObject(hdcMem, hBitmap);
  TextOut(hdcMem, 0, 0, szFaceName[i], lstrlen(szFaceName[i]));
  DeleteObject(SelectObject(hdcMem, hFont));
  DeleteDC(hdcMem);
  DeleteDC(hdc);
  Result := hBitmap;
end;

  // 添加help项到系统菜单
procedure AddHelpToSys(hWnd: LongWord);
var
  hBitmap, hMenu: LongWord;
begin
  hMenu := GetSystemMenu(hWnd, FALSE);
  hBitmap := StretchBitmap(LoadBitmap(hInstance, 'BitmapHelp'));
  AppendMenu(hMenu, MF_SEPARATOR, 0, nil);
  AppendMenu(hMenu, MF_BITMAP, IDM_HELP, PChar(hBitmap));
end;

  // 建立使用位图的菜单
function CreateMyMenu(): LongWord;
var
  hBitmap, hMenu, hMenuPopup, J: Integer;
begin
  hMenu := CreateMenu();
  hMenuPopup := LoadMenu(hInstance, 'MenuFile');
  hBitmap := StretchBitmap(LoadBitmap(hInstance, 'BitmapFile'));
  AppendMenu(hMenu, MF_BITMAP or MF_POPUP, hMenuPopup, PChar(hBitmap));
  hMenuPopup := LoadMenu(hInstance, 'MenuEdit');
  hBitmap := StretchBitmap(LoadBitmap(hInstance, 'BitmapEdit'));
  AppendMenu(hMenu, MF_BITMAP or MF_POPUP, hMenuPopup, PChar(hBitmap));
  hMenuPopup := CreateMenu();
  for J := 0 to 2 do
  begin
    hBitmap := GetBitmapFont(J);
    AppendMenu(hMenuPopup, MF_BITMAP, IDM_FONT_COUR + J, PChar(hBitmap));
  end;
  hBitmap := StretchBitmap(LoadBitmap(hInstance, 'BitmapFont'));
  AppendMenu(hMenu, MF_BITMAP or MF_POPUP, hMenuPopup, PChar(hBitmap));
  Result := hMenu;
end;   

   // 删除所有位图
procedure DeleteAllBitmaps(hWnd: HWND);
var
  mii: TMenuItemInfo;
  hMenu, J: Integer;
begin
  mii.cbSize := SizeOf(TMenuItemInfo);
  mii.fMask := MIIM_SUBMENU or MIIM_TYPE;
 // Delete Help bitmap on system menu
  hMenu := GetSystemMenu(hWnd, FALSE);
  GetMenuItemInfo(hMenu, IDM_HELP, FALSE, mii);
  DeleteObject(HGDIOBJ(mii.dwTypeData));
 // Delete top-level menu bitmaps
  hMenu := GetMenu(hWnd);
  for J := 0 to 2 do
  begin
    GetMenuItemInfo(hMenu, J, TRUE, mii);
    DeleteObject(HGDIOBJ(mii.dwTypeData));
  end;
 // Delete bitmap items on Font menu
  hMenu := mii.hSubMenu;
  for J := 0 to 2 do
  begin
    GetMenuItemInfo(hMenu, J, TRUE, mii);
    DeleteObject(HGDIOBJ(mii.dwTypeData));
  end;
end;

   // 窗体消息函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  iCurrentFont: Integer = IDM_FONT_COUR;
{$J+}
var
  hMenu: LongWord;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      begin
        AddHelpToSys(hWnd); // 添加help项到系统菜单
        hMenu := CreateMyMenu(); // 窗体菜单 ..
        SetMenu(hWnd, hMenu);
        CheckMenuItem(hMenu, iCurrentFont, MF_CHECKED); // 选中菜单项目
      end;

    WM_SYSCOMMAND:
      begin
        if LOWORD(wParam) = IDM_HELP then
          MessageBox(hWnd, 'Help not yet implemented!', szAppName, MB_OK or MB_ICONEXCLAMATION)
        else
          Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
      end;

    WM_COMMAND:
      begin
        case (LOWORD(wParam)) of
          IDM_FILE_NEW,
          IDM_FILE_OPEN,
          IDM_FILE_SAVE,
          IDM_FILE_SAVE_AS,
          IDM_EDIT_UNDO,
          IDM_EDIT_CUT,
          IDM_EDIT_COPY,
          IDM_EDIT_PASTE,
          IDM_EDIT_CLEAR:
            begin
              MessageBeep(0);
            end;

          IDM_FONT_COUR,
          IDM_FONT_ARIAL,
          IDM_FONT_TIMES:
            begin
              hMenu := GetMenu(hWnd);
              CheckMenuItem(hMenu, iCurrentFont, MF_UNCHECKED);
              iCurrentFont := LOWORD(wParam);
              CheckMenuItem(hMenu, iCurrentFont, MF_CHECKED);
            end;
        end;    
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0); // 放一个退出消息WM_QUIT
        DeleteAllBitmaps(hWnd); // 删除菜单使用的位图
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end;    
  
var
  hWnd: LongWord;
  Msg: TMsg;
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
  WndClass.hbrBackground := GetStockObject(WHITE_BRUSH);
  WndClass.lpszMenuName := nil;
  WndClass.lpszClassName := szAppName;
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(szAppName, 'Bitmap Menu Demonstration',
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
