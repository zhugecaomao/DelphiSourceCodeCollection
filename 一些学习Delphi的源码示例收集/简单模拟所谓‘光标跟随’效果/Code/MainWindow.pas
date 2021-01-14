unit MainWindow;

interface

implementation

uses
  Windows, Messages, Timer;   

  // 窗体过程回调函数
function MainProc(hMain, MsgID, WParam, LParam: DWORD): DWORD; stdcall;
const
{$J+}
  TempFont: DWORD = 0;
  ButtonHD: DWORD = 0;
  StrIndex: DWORD = 0;
{$J-}
  ButtonID = 66;
  ButtonStr: array[0..1] of PChar = ('开始', '暂停');
begin
  case MsgID of
    WM_COMMAND:
      begin
        if (wParam = ButtonID) then // 单击按钮
        begin
          StrIndex := StrIndex xor 1; // 标志取反
          SetWindowText(ButtonHD, ButtonStr[StrIndex]);
          if (StrIndex = 0) then TimerOff else TimerOn;
        end;
      end;

    WM_SIZE:
      begin
        MoveWindow(ButtonHD, (LOWORD(lParam) shr 1) - 35, (HIWORD(lParam) shr 1) - 12, 70 , 25, TRUE);
      end;

    WM_CREATE:
      begin
        ButtonHD := CreateWindowEx(0, 'Button', ButtonStr[0], WS_CHILD or WS_VISIBLE,
                      0, 0, 0, 0, hMain, ButtonID, HInstance, nil);
        TempFont := CreateFont(12, 6, 0, 0, FW_EXTRALIGHT, Byte(FALSE), Byte(FALSE),
                      Byte(FALSE), GB2312_CHARSET, OUT_DEFAULT_PRECIS,
                      CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY, DEFAULT_PITCH, '宋体');
        SendMessage(ButtonHD, WM_SETFONT, TempFont, 1);
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0); // 放WM_QUIT到消息队列
        DeleteObject(TempFont);
      end;
  end;
  Result := DefWindowProc(hMain, MsgID, WParam, LParam); // 标准处理
end;

  // 建立主窗体
procedure Create_MainWindow;
var
  MainClass: TWndClass;
begin
  MainClass.Style := CS_HREDRAW or CS_VREDRAW;
  MainClass.lpfnWndProc := @MainProc;
  MainClass.cbClsExtra := 0;
  MainClass.cbWndExtra := 0;
  MainClass.hInstance := SysInit.HInstance;
  MainClass.hIcon := LoadIcon(HInstance, 'LiuMazi');
  MainClass.hCursor := LoadCursor(0, IDC_ARROW);
  MainClass.hbrBackground := COLOR_BTNFACE + 1;
  MainClass.lpszMenuName := nil;
  MainClass.lpszClassName := 'Follow_MainWindow_Mazi';
  RegisterClass(MainClass);   

  CreateWindowEx(WS_EX_TOPMOST, MainClass.lpszClassName, '光标跟随    By 麻子',
              WS_VISIBLE or WS_TILED or WS_SYSMENU or WS_MINIMIZEBOX or WS_SIZEBOX,
              200, 200, 160, 80, 0, 0, HInstance, nil);
end;

initialization
  Create_MainWindow;

end.
