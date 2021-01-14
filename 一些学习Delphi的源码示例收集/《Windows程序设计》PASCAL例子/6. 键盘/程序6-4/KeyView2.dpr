program  KeyView2;

uses
  Windows, Messages, Math;

  // 窗体消息处理回调函数
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
    // 计算数组成员地址
  function Pt(FirstPt: PMsg; Index: Integer): PMsg;
  begin
    Result := PMsg( DWORD(FirstPt) + Index * SizeOf(TMsg) );
  end;
const
  {$J+}
  dwCharSet: DWORD = DEFAULT_CHARSET; // 当前键盘布局对应字符集
  cyChar: Integer = 0;       // 字符高度
  cxClient: Integer = 0;     // 窗体客户区宽度
  cyClient: Integer = 0;     // 窗体客户区高度
  cxClientMax: Integer = 0;  // 窗体最大化宽度
  cyClientMax: Integer = 0;  // 窗体最大化高度
  cLinesMax: Integer = 0;    // 输出最大行数
  cLines: Integer = 0;       // 已保存行数
  MsgList: PMsg = nil;       // 消息缓存数组
  RectScroll: TRect = (Left: 0; Top: 0; Right: 0; Bottom: 0);
  {$J+}
  szTop = ' Message        Key       Char     Repeat Scan Ext ALT Prev Tran';
  szUnd = ' _______        ___       ____     ______ ____ ___ ___ ____ ____';
  szKeyFormat = ' %-13s %3d %-15s %6u %4d %3s %3s %4s %4s';
  szCharFormat = ' %-24s 0x%04X %c %6u %4d %3s %3s %4s %4s';
  szMessage: array[WM_KEYDOWN..WM_SYSDEADCHAR] of PChar= ('WM_KEYDOWN', 'WM_KEYUP',
    'WM_CHAR', 'WM_DEADCHAR', 'WM_SYSKEYDOWN', 'WM_SYSKEYUP', 'WM_SYSCHAR', 'WM_SYSDEADCHAR');
  szYes  = 'Yes';
  szNo   = 'No';
  szDown = 'Down';
  szUp   = 'Up';
var
  hWndDc: HDC;
  PS: TPaintStruct;
  TM: TTextMetric;
  szBuffer: array [0..128] of Char; // 输出字符串
  szKeyName: array [0..32] of Char; // 键名字符串
  OutList: array[0..8] of DWORD; // (待)转换列表
  J: Integer;
begin
  Result := 0;
  case Msg of
    WM_INPUTLANGCHANGE,
    WM_CREATE,
    WM_DISPLAYCHANGE,
    WM_SIZE: begin

               if (Msg = WM_INPUTLANGCHANGE) then
               begin
                 dwCharSet := wParam;
                 Result := 1; // TRUE
               end;
               if (Msg = WM_SIZE) then
               begin
                 cxClient := LOWORD(lParam);
                 cyClient := HIWORD(lParam);
               end else
               begin
                // 窗体最大化尺寸
                 cxClientMax := GetSystemMetrics(SM_CXMAXIMIZED);
                 cyClientMax := GetSystemMetrics(SM_CYMAXIMIZED);
                // 指定字符集字体高度
                 hWndDc := GetDC(hWnd);
                 SelectObject(hWndDc, CreateFont(0, 0, 0, 0, 0, 0, 0, 0,
                     dwCharSet, 0, 0, 0, FIXED_PITCH, nil));
                 GetTextMetrics(hWndDc, TM);
                 cyChar := TM.tmHeight;
                 DeleteObject(SelectObject(hWndDc, GetStockObject(SYSTEM_FONT)));
                 ReleaseDC(hWnd, hWndDc) ;
                // 重新分配内存
                 if (MsgList <> nil) then FreeMem(MsgList, cLinesMax * SizeOf(TMsg));
                 cLinesMax := cyClientMax div cyChar;
                 GetMem(MsgList, cLinesMax * SizeOf(TMsg));
                 cLines := 0;
               end;

               RectScroll.Left := 0;
               RectScroll.Right := cxClient;
               RectScroll.Top := cyChar;
               RectScroll.Bottom := cyChar * (cyClient div cyChar);
               InvalidateRect(hWnd, nil, TRUE);
               
             end; // ........  end case  .....  ^^

    WM_KEYDOWN,
    WM_KEYUP,
    WM_DEADCHAR,
    WM_SYSKEYDOWN,
    WM_SYSKEYUP,
    WM_SYSCHAR,
    WM_SYSDEADCHAR,
    WM_CHAR: begin
               Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
               for J := cLines downto 1 do // 腾出空位
                 Pt(MsgList, J)^ := Pt(MsgList, J-1)^;
               MsgList.hwnd := hWnd; // MsgList[0] := ...
               MsgList.message := Msg;
               MsgList.wParam := wParam;
               MsgList.lParam := lParam;
               cLines := Min(cLines + 1, cLinesMax); // 已保存行数
               ScrollWindow(hWnd, 0, -cyChar, @RectScroll, @RectScroll); // 更新
             end;

    WM_PAINT: begin
                hWndDc := BeginPaint(hWnd, PS);

                SelectObject(hWndDc, CreateFont (0, 0, 0, 0, 0, 0, 0, 0, // 选入创建的字体
                           dwCharSet, 0, 0, 0, FIXED_PITCH, nil));
                SetBkMode(hWndDc, TRANSPARENT); // 绘制时不填充空隙(透明)
                TextOut(hWndDc, 0, 0, szTop, lstrlen(szTop)); // 标题
                TextOut(hWndDc, 0, 0, szUnd, lstrlen(szUnd)); // 下划线
                for J := 0 to Min(cLines, cyClient div cyChar - 1)-1 do // 已存行数or可容纳行
                begin
                  OutList[0] := DWORD(szMessage[Pt(MsgList, J)^.message]); // 消息名称字符串
                  OutList[1] := Pt(MsgList, J)^.wParam; // 虚拟键值
                  OutList[3] := LOWORD(Pt(MsgList, J)^.lParam); // 重复计数
                  OutList[4] := HIWORD(Pt(MsgList, J)^.lParam) and $FF; // 扫描码
                  if (Pt(MsgList, J)^.lParam and $01000000) <> 0 // 扩充键旗标
                  then OutList[5] := DWORD(PChar(szYes))
                  else OutList[5] := DWORD(PChar(szNo));
                  if (Pt(MsgList, J)^.lParam and $20000000) <> 0 // ALT被按下?
                  then OutList[6] := DWORD(PChar(szYes))
                  else OutList[6] := DWORD(PChar(szNo));
                  if (Pt(MsgList, J)^.lParam and $40000000) <> 0 // 先前状态
                  then OutList[7] := DWORD(PChar(szDown))
                  else OutList[7] := DWORD(PChar(szUp));
                  if (Pt(MsgList, J)^.lParam and $80000000) <> 0 // 转换状态
                  then OutList[8] := DWORD(PChar(szUp))
                  else OutList[8] := DWORD(PChar(szDown));
                  if (Pt(MsgList, J)^.message = WM_SYSDEADCHAR)or
                     (Pt(MsgList, J)^.message = WM_DEADCHAR)or
                     (Pt(MsgList, J)^.message = WM_SYSCHAR)or
                     (Pt(MsgList, J)^.message = WM_CHAR) then
                  begin // 字符消息
                    OutList[2] := Pt(MsgList, J)^.wParam; // 字符编码
                    TextOut(hWndDc, 0, (cyClient div cyChar - 1 - J) * cyChar,
                      szBuffer, wvsprintf(szBuffer, szCharFormat, @OutList));
                  end else
                  begin // 按键消息
                    GetKeyNameText(Pt(MsgList, J)^.lParam, szKeyName, 32); // 键名
                    OutList[2] := DWORD(@szKeyName[0]);
                    TextOut(hWndDc, 0, (cyClient div cyChar - 1 - J) * cyChar,
                      szBuffer, wvsprintf(szBuffer, szKeyFormat, @OutList));
                  end;
                end;
                DeleteObject(SelectObject(hWndDc, GetStockObject(SYSTEM_FONT))); // 删除字体

                EndPaint(hWnd, PS);
              end;

    WM_DESTROY: PostQuitMessage(0); // 放WM_QUIT消息

    else Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
  end;
end;


const
  AppName = 'KeyView2'; // 窗体类名

var
  WndClass: TWndClass;  // 窗体类结构
  hWnd: LongWord;       // 窗体句柄
  Msg: TMsg;            // 消息结构
  
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
    MessageBox(0,'This program requires Windows NT!', AppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(AppName, 'Keyboard Message Viewer #2',
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

        


