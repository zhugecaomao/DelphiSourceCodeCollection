program  ClipText;

{$R  ClipText.Res}

uses
  Windows, Messages;

  // 窗体消息处理过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  pText: PChar = nil; // 字符串数组
{$J-}
  szDefaultText  = 'Default Text - ANSI Version';
  IDM_EDIT_CUT   = 40001;
  IDM_EDIT_COPY  = 40002;
  IDM_EDIT_PASTE = 40003;
  IDM_EDIT_CLEAR = 40004;
  IDM_EDIT_RESET = 40005;
var
  iEnable: Integer;
  hWndDc: HDC;
  ps: TPaintStruct;
  Rect: TRect;
  hGlobal: DWORD;
  pGlobal: PChar;  
begin
  Result := 0;
 // 区分不同的消息
  case Msg of
    WM_CREATE:
      SendMessage(hWnd, WM_COMMAND, IDM_EDIT_RESET, 0); // 置文字为szDefaultText

    WM_INITMENUPOPUP:
      begin
        if IsClipboardFormatAvailable(CF_TEXT) then
          EnableMenuItem(wParam,IDM_EDIT_PASTE, MF_ENABLED)
        else
          EnableMenuItem(wParam,IDM_EDIT_PASTE, MF_GRAYED);

        if pText <> nil then iEnable := MF_ENABLED else iEnable := MF_GRAYED;
        EnableMenuItem(wParam, IDM_EDIT_CUT, iEnable);
        EnableMenuItem(wParam, IDM_EDIT_COPY, iEnable);
        EnableMenuItem(wParam, IDM_EDIT_CLEAR, iEnable);
      end;

    WM_COMMAND:
      begin
        case LOWORD(wParam) of
          IDM_EDIT_PASTE: // 粘贴 ..
            begin
              OpenClipboard(hWnd); // 打开剪贴板
              hGlobal := GetClipboardData(CF_TEXT); // 内存块句柄
              if (hGlobal <> 0) then // 含有CF_TEXT格式信息
              begin
                pGlobal := GlobalLock(hGlobal); // 内存块地址
                if (pText <> nil) then // 重新分配字符串数组空间
                begin
                  FreeMem(pText); pText := nil;
                end;
                GetMem(pText, GlobalSize(hGlobal));
                lstrcpy(pText, pGlobal); // 拷贝
                InvalidateRect(hWnd, nil, TRUE); // 迫使窗体刷新
              end;
              CloseClipboard(); // 关闭剪贴板
            end;

          IDM_EDIT_CUT,  // 剪切 ..
          IDM_EDIT_COPY: // 复制 ..
            begin
              if (pText = nil) then Exit;
              hGlobal := GlobalAlloc(GHND or GMEM_SHARE, (lstrlen(pText) + 1)); // 分配内存
              pGlobal := GlobalLock(hGlobal); // 锁定
              lstrcpy(pGlobal, pText); // 拷贝
              GlobalUnlock(hGlobal); // 解锁
              OpenClipboard(hWnd); // 打开剪贴板
              EmptyClipboard(); // 清空剪贴板
              SetClipboardData(CF_TEXT, hGlobal); // 写入
              CloseClipboard(); // 关闭剪贴板
              if (LOWORD(wParam) = IDM_EDIT_CUT) then // 执行"清除"
                SendMessage(hWnd, WM_COMMAND, IDM_EDIT_CLEAR, 0);
            end;

          IDM_EDIT_CLEAR: // 清除 ..
            begin
              if (pText <> nil) then
              begin
                FreeMem(pText);
                pText := nil;
              end;
              InvalidateRect(hWnd, nil, TRUE); // 刷新
            end;

          IDM_EDIT_RESET: // 重设 ..
            begin
              if (pText <> nil) then
              begin
                FreeMem(pText);
                pText := nil;
              end;   
              GetMem(pText, lstrlen(szDefaultText) + 1); // 重新申请字符串数组空间
              lstrcpy(pText, szDefaultText); // 拷贝
              InvalidateRect(hWnd, nil, TRUE); // 刷新
            end;

          else
            Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
        end;   
      end;

    WM_PAINT:
      begin
        hWndDc := BeginPaint(hWnd, ps);
        if (pText <> nil) then
        begin
          GetClientRect(hWnd, Rect);
          DrawText(hWndDc, pText, -1, Rect, DT_EXPANDTABS or DT_WORDBREAK);
        end;
        EndPaint(hWnd, ps);
      end;


    WM_DESTROY:
      begin
        if (pText <> nil) then FreeMem(pText);
        PostQuitMessage(0); // 放一个退出消息WM_QUIT
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end;

const
  szAppName = 'ClipText';
  szCaption = 'Clipboard Text Transfers - ANSI Version';
var
  hWnd, hAccel: DWORD;
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
  hWnd := CreateWindow(szAppName, szCaption,
                       WS_OVERLAPPEDWINDOW,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       0, 0, hInstance, nil);

 // 显示窗体
  ShowWindow(hWnd, CmdShow);
  UpdateWindow(hWnd);

 // 载入加速键
  hAccel := LoadAccelerators(hInstance, szAppName);

 // 消息循环
  while GetMessage(Msg, 0, 0, 0) do
  begin
    if (TranslateAccelerator(hWnd, hAccel, Msg) = 0) then
    begin
      TranslateMessage(Msg);
      DispatchMessage(Msg);
    end;
  end;
end.
