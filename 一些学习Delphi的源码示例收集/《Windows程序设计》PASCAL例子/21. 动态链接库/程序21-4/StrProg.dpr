program  StrProg;

{$R StrProg.Res}

uses
  Windows, Messages;

type
  TCBParam = record
    hWndDc, xText, yText, xStart, yStart, xIncr, yIncr, xMax, yMax: Integer;
  end;

const
  IDC_STRING = 1000;
  IDM_ENTER  = 40001;
  IDM_DELETE = 40002;
  szAppName  = 'StrProg';
  MAX_LENGTH = 63;
  
var
  szString: array[0..MAX_LENGTH] of Char;

function AddString(pStringIn: PChar): BOOL; stdcall; external '..\程序21-3\StrLib.dll' name 'AddStringA';
function DeleteString(pStringIn: PChar): BOOL; stdcall; external '..\程序21-3\StrLib.dll' name 'DeleteStringA';
function GetStrings(pfnGetStrCallBack, pParam: Pointer): Integer; stdcall; external '..\程序21-3\StrLib.dll' name 'GetStringsA';

  // 对话框消息接收回调函数
function DlgProc(hDlg: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  Result := FALSE; // 未曾处理
  case (Msg) of
    WM_INITDIALOG:
      begin
        SendDlgItemMessage(hDlg, IDC_STRING, EM_LIMITTEXT, MAX_LENGTH, 0); // 限长
        Result := TRUE;
      end;

    WM_COMMAND:
      begin
        case (wParam) of
          IDOK:
            begin
              GetDlgItemText(hDlg, IDC_STRING, @szString[0], MAX_LENGTH + 1); // 取Edit
              EndDialog(hDlg, Integer(TRUE));
              Result := TRUE;
            end;

          IDCANCEL:
            begin
              EndDialog(hDlg, Integer(FALSE));
              Result := TRUE;
            end;
        end; // END: case (wParam) of ..
      end;
  end; // END: case (Msg) of ..
end;

  // 字符串枚举回调函数
function GetStrCallBack(pString: Pointer; var CBParam: TCBParam): BOOL; stdcall;
begin
  Result := TRUE;

  TextOut(CBParam.hWndDc, CBParam.xText, CBParam.yText, pString, lstrlen(pString));
  
  Inc(CBParam.yText, CBParam.yIncr);
  if (CBParam.yText > CBParam.yMax) then
  begin
    CBParam.yText := CBParam.yStart;

    Inc(CBParam.xText, CBParam.xIncr);
    if (CBParam.xText > CBParam.xMax) then
      Result := FALSE;
  end;
end;

  // 窗体消息处理回调函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  cxChar: Integer = 0;
  cyChar: Integer = 0;
  cxClient: Integer = 0;
  cyClient: Integer = 0;
  iDataChangeMsg: UINT = 0;
{$J-}           
var
  CBParam: TCBParam;
  hWndDc: HDC;
  ps: TPaintStruct;
  tm: TTextMetric;
begin
  Result := 0;
  case (Msg) of
    WM_CREATE:
      begin
        hWndDc := GetDC(hWnd);
        GetTextMetrics(hWndDc, tm); // 字体大小
        cxChar := tm.tmAveCharWidth;
        cyChar := tm.tmHeight + tm.tmExternalLeading;
        ReleaseDC(hWnd, hWndDc);

        iDataChangeMsg := RegisterWindowMessage('StrProgDataChange'); // 注册消息
      end;

    WM_COMMAND:
      begin
        case (wParam) of
          IDM_ENTER: // 添加字符串
            if BOOL(DialogBox(hInstance, 'EnterDlg', hWnd, @DlgProc)) then
            begin
              if AddString(szString) then
                PostMessage(HWND_BROADCAST, iDataChangeMsg, 0, 0) // 广播
              else
                MessageBeep(0); // 添加出错
            end;

          IDM_DELETE: // 删除字符串
            if BOOL(DialogBox(hInstance, 'DeleteDlg', hWnd, @DlgProc)) then
            begin
              if DeleteString(szString) then
                PostMessage(HWND_BROADCAST, iDataChangeMsg, 0, 0) // 广播
              else
                MessageBeep(0); // 删除出错
            end;
        end; // END: case (wParam) of ..
      end;

    WM_SIZE:
      begin
        cxClient := LOWORD(lParam);
        cyClient := HIWORD(lParam);
      end;

    WM_PAINT:
      begin
        hWndDc := BeginPaint(hWnd, ps);

        CBParam.hWndDc := hWndDc;
        CBParam.xStart := cxChar;
        CBParam.xText := cxChar;
        CBParam.yStart := cyChar;
        CBParam.yText := cyChar;
        CBParam.xIncr := cxChar * MAX_LENGTH;
        CBParam.yIncr := cyChar;
        CBParam.xMax := CBParam.xIncr * (1 + cxClient div CBParam.xIncr);
        CBParam.yMax := cyChar * (cyClient div cyChar - 1);

        GetStrings(@GetStrCallBack, @CBParam); // 枚举绘制

        EndPaint(hWnd, ps);
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0); // 放一个退出消息WM_QUIT
      end;
      
    else
      begin
        if (Msg = iDataChangeMsg) then InvalidateRect(hWnd, nil, TRUE) // 重画
        else Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
      end;
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
  WndClass.lpszMenuName := szAppName;
  WndClass.lpszClassName := szAppName;

 // 注册窗体类
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(szAppName, 'DLL Demonstration Program',
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

(* 注: 作为演示,本例只调用Ansi版的函数. *)  
end.
