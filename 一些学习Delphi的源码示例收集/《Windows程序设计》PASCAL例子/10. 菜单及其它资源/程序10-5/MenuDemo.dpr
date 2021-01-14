program  MenuDemo;

uses
  Windows, Messages;

const
  szAppName = 'MenuDemo';
  IDM_FILE_NEW     = 40001; // 菜单项ID ..
  IDM_FILE_OPEN    = 40002;
  IDM_FILE_SAVE    = 40003;
  IDM_FILE_SAVE_AS = 40004;
  IDM_APP_EXIT     = 40005;
  IDM_EDIT_UNDO    = 40006;
  IDM_EDIT_CUT     = 40007;
  IDM_EDIT_COPY    = 40008;
  IDM_EDIT_PASTE   = 40009;
  IDM_EDIT_CLEAR   = 40010;
  IDM_BKGND_WHITE  = 40011;
  IDM_BKGND_LTGRAY = 40012;
  IDM_BKGND_GRAY   = 40013;
  IDM_BKGND_DKGRAY = 40014;
  IDM_BKGND_BLACK  = 40015;
  IDM_TIMER_START  = 40016;
  IDM_TIMER_STOP   = 40017;
  IDM_APP_HELP     = 40018;
  IDM_APP_ABOUT    = 40019;

   // 窗体消息处理过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  ID_TIMER = 1; // 定时器ID
  idColor: array[0..4] of Integer = (WHITE_BRUSH, LTGRAY_BRUSH, GRAY_BRUSH, DKGRAY_BRUSH, BLACK_BRUSH);
{$J+}
  iSelection: Integer = IDM_BKGND_WHITE; // 当前选中菜单项
{$J-}
var
  hMenu: LongWord;
begin
  Result := 0;
  case Msg of
    WM_COMMAND:
      begin
        hMenu := GetMenu(hWnd);
        case LOWORD(wParam) of
          IDM_FILE_SAVE_AS,
          IDM_FILE_OPEN,
          IDM_FILE_SAVE,
          IDM_FILE_NEW:
            begin
              MessageBeep(0);
            end;

          IDM_APP_EXIT:
            begin
              SendMessage(hWnd, WM_CLOSE, 0, 0);
            end;

          IDM_EDIT_UNDO,
          IDM_EDIT_CUT,
          IDM_EDIT_COPY,
          IDM_EDIT_PASTE,
          IDM_EDIT_CLEAR:
            begin
              MessageBeep(0);
            end;

          IDM_BKGND_WHITE,
          IDM_BKGND_LTGRAY,
          IDM_BKGND_GRAY,
          IDM_BKGND_DKGRAY,
          IDM_BKGND_BLACK:
            begin
              CheckMenuItem(hMenu, iSelection, MF_UNCHECKED); // 反选
              iSelection := LOWORD(wParam);
              CheckMenuItem(hMenu, iSelection, MF_CHECKED); // 选中
              SetClassLong(hWnd, GCL_HBRBACKGROUND, GetStockObject(idColor[LOWORD(wParam)-IDM_BKGND_WHITE]));
              InvalidateRect(hWnd, nil, TRUE);
            end;

          IDM_TIMER_START:
            begin
              if (SetTimer(hWnd, ID_TIMER, 1000, nil) <> 0) then // 安装定时器
              begin
                EnableMenuItem(hMenu, IDM_TIMER_START, MF_GRAYED);
                EnableMenuItem(hMenu, IDM_TIMER_STOP,  MF_ENABLED);
              end;
            end;

          IDM_TIMER_STOP:
            begin
              KillTimer(hWnd, ID_TIMER); // 删除定时器
              EnableMenuItem(hMenu, IDM_TIMER_START, MF_ENABLED);
              EnableMenuItem(hMenu, IDM_TIMER_STOP, MF_GRAYED);
            end;

          IDM_APP_HELP:
            begin
              MessageBox(hWnd, 'Help not yet implemented!',
                       szAppName, MB_ICONEXCLAMATION or MB_OK);
            end;

          IDM_APP_ABOUT:
            begin
              MessageBox(hWnd, 'Menu Demonstration Program '#13#10' (c) Charles Petzold, 1998',
                       szAppName, MB_ICONINFORMATION or MB_OK);
            end;
        end;
      end;

    WM_TIMER:
      MessageBeep(0); // 响铃 ..

    WM_DESTROY:
      PostQuitMessage(0); // 放一个退出消息WM_QUIT

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end;     

var
  hWnd, hMenu, hMenuPopup: LongWord;
  Msg: TMsg;
  WndClass: TWndClass;

begin
 // 建立菜单 ....
  hMenu := CreateMenu();

  hMenuPopup := CreateMenu();
  AppendMenu(hMenuPopup, MF_STRING, IDM_FILE_NEW, '&New');
  AppendMenu(hMenuPopup, MF_STRING, IDM_FILE_OPEN, '&Open...');
  AppendMenu(hMenuPopup, MF_STRING, IDM_FILE_SAVE, '&Save');
  AppendMenu(hMenuPopup, MF_STRING, IDM_FILE_SAVE_AS, 'Save &As...');
  AppendMenu(hMenuPopup, MF_SEPARATOR, 0, nil);
  AppendMenu(hMenuPopup, MF_STRING, IDM_APP_EXIT, 'E&xit');
  AppendMenu(hMenu, MF_POPUP, hMenuPopup, '&File');

  hMenuPopup := CreateMenu();
  AppendMenu(hMenuPopup, MF_STRING, IDM_EDIT_UNDO, '&Undo');
  AppendMenu(hMenuPopup, MF_SEPARATOR, 0, nil);
  AppendMenu(hMenuPopup, MF_STRING,IDM_EDIT_CUT, 'Cu&t');
  AppendMenu(hMenuPopup, MF_STRING,IDM_EDIT_COPY, '&Copy');
  AppendMenu(hMenuPopup, MF_STRING,IDM_EDIT_PASTE, '&Paste');
  AppendMenu(hMenuPopup, MF_STRING,IDM_EDIT_CLEAR, 'De&lete');
  AppendMenu(hMenu, MF_POPUP, hMenuPopup, '&Edit');

  hMenuPopup := CreateMenu();
  AppendMenu(hMenuPopup, MF_STRING or MF_CHECKED, IDM_BKGND_WHITE, '&White');
  AppendMenu(hMenuPopup, MF_STRING, IDM_BKGND_LTGRAY, '&Light Gray');
  AppendMenu(hMenuPopup, MF_STRING, IDM_BKGND_GRAY, '&Gray') ;
  AppendMenu(hMenuPopup, MF_STRING, IDM_BKGND_DKGRAY, '&Dark Gray');
  AppendMenu(hMenuPopup, MF_STRING, IDM_BKGND_BLACK, '&Black') ;
  AppendMenu(hMenu, MF_POPUP, hMenuPopup, '&Background') ;

  hMenuPopup := CreateMenu();
  AppendMenu(hMenuPopup, MF_STRING, IDM_TIMER_START, '&Start');
  AppendMenu(hMenuPopup, MF_STRING or MF_GRAYED, IDM_TIMER_STOP, 'S&top');
  AppendMenu(hMenu, MF_POPUP, hMenuPopup, '&Timer');

  hMenuPopup := CreateMenu();
  AppendMenu(hMenuPopup, MF_STRING, IDM_APP_HELP, '&Help');
  AppendMenu(hMenuPopup, MF_STRING, IDM_APP_ABOUT, '&About MenuDemo...');
  AppendMenu(hMenu, MF_POPUP, hMenuPopup, '&Help');

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
  hWnd := CreateWindow(szAppName, 'Menu Demonstration',
                       WS_OVERLAPPEDWINDOW,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       0, hMenu, hInstance, nil);

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
