unit  MainForm;

interface

procedure Register_MainForm;   // 注册窗体类
procedure Unregister_MainForm; // 撤销窗体类
procedure Create_MainForm;     // 建立主窗体

implementation

uses
  Windows, Messages, Publics;

const
  ClassName = 'HookInsert_MainForm_Mazi';

  // 窗体过程回调函数
function FormProc(hForm, MsgID, WParam, LParam: LongWord): Longint; stdcall;
const
{$J+}
  TempFont: DWORD = 0;
{$J-}
  ControlID1 = 1;
  ControlID2 = 2;
  ControlID3 = 3;
var
  EditText: array[0..30] of Char;
begin
  Result := DefWindowProc(hForm, MsgID, WParam, LParam); // 标准处理
  case MsgID of
    WM_CREATE:
      begin
        TempFont := CreateFont(12, 6, 0, 0, FW_EXTRALIGHT, Byte(FALSE), Byte(FALSE),
                              Byte(FALSE), GB2312_CHARSET, OUT_DEFAULT_PRECIS,
                              CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY, DEFAULT_PITCH, '宋体');

        CreateWindowEx(0, 'BUTTON', '设定主页', WS_CHILD or WS_VISIBLE,
                      15, 40, 70, 22, hForm, ControlID1, HInstance, nil);
        SendMessage(GetDlgItem(hForm, ControlID1), WM_SETFONT, TempFont, 1);

        CreateWindowEx(0, 'BUTTON', '退出程序', WS_CHILD or WS_VISIBLE,
                      95, 40, 70, 22, hForm, ControlID2, HInstance, nil);
        SendMessage(GetDlgItem(hForm, ControlID2), WM_SETFONT, TempFont, 1);

        CreateWindowEx(WS_EX_CLIENTEDGE, 'EDIT', 'http://www.2ccc.com/',
                      WS_CHILD or WS_VISIBLE or ES_AUTOHSCROLL or WS_BORDER,
                      15, 10, 155, 21, hForm, ControlID3, HInstance, nil);
        SendMessage(GetDlgItem(hForm, ControlID3), WM_SETFONT, TempFont, 1);
      end;
      
    WM_COMMAND:
      begin
        if (HIWORD(wParam) = BN_CLICKED) then // 单击按钮
        begin
          case LOWORD(wParam) of // 控件ID
            ControlID1:
              begin
                GetWindowText(GetDlgItem(hForm, ControlID3), @EditText[0], 30);
                SetRegStrValue(HKEY_CURRENT_USER,
                  'Software\Microsoft\Internet Explorer\Main',
                  'Start Page', @EditText[0]);
              end;

            ControlID2:
              begin
                SendMessage(hForm, WM_CLOSE, 0, 0);
              end;
          end;
        end;          
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0);
        DeleteObject(TempFont);
      end;
  end;
end; 

  // 注册窗体类
procedure Register_MainForm;
var
  FormClass: TWndClass;
begin
  FormClass.Style := CS_HREDRAW or CS_VREDRAW;
  FormClass.lpfnWndProc := @FormProc;
  FormClass.cbClsExtra := 0;
  FormClass.cbWndExtra := 0;
  FormClass.hInstance := SysInit.HInstance;
  FormClass.hIcon := LoadIcon(HInstance, 'LiuMazi');
  FormClass.hCursor := LoadCursor(0, IDC_ARROW);
  FormClass.hbrBackground := COLOR_WINDOW;
  FormClass.lpszMenuName := nil;
  FormClass.lpszClassName := ClassName;
  RegisterClass(FormClass);
end;

  // 注销窗体类
procedure Unregister_MainForm;
begin
  UnregisterClass(ClassName, HInstance);
end;    

  // 建立主窗体
procedure Create_MainForm;
begin
  CreateWindowEx(WS_EX_TOPMOST, ClassName, ' 注入演示    By 麻子',
                 WS_VISIBLE or WS_TILED or WS_SYSMENU or WS_MINIMIZEBOX,
                 200, 200, 200, 100, 0, 0, HInstance, nil);
end;

end.
