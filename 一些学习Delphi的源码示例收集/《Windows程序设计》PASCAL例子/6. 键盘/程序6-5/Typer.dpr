program  Typer;

uses
  Windows, Messages, Math;

  // 窗体消息处理回调函数                  
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  {$J+}
  dwCharSet: DWORD = DEFAULT_CHARSET; // 当前键盘布局对应字符集
  cxChar: Integer = 0;       // (等宽)字符宽度
  cyChar: Integer = 0;       // (等宽)字符高度
  cxClient: Integer = 0;     // 窗体客户区宽度
  cyClient: Integer = 0;     // 窗体客户区高度
  pBuffer: PChar = nil;      // 字符缓存数组
  cxBuffer: Integer = 0;     // 缓存数组宽度
  cyBuffer: Integer = 0;     // 缓存数组高度
  xCaret: Integer = 0;       // 插入符号横坐标
  yCaret: Integer = 0;       // 插入符号纵坐标  
  {$J+}
 // 计算二维数组成员地址
  function Pt(Y, X: Integer): PChar;
  begin
    Result := PChar( DWORD(pBuffer) + Y * cxBuffer + X );
  end;  
var
  hWndDc: HDC;
  PS: TPaintStruct;
  TM: TTextMetric;
  X, Y, J: Integer;  
begin
  Result := 0;
  case Msg of
    WM_INPUTLANGCHANGE,
    WM_CREATE,
    WM_SIZE: begin
               if (Msg = WM_INPUTLANGCHANGE) then dwCharSet := wParam; // 新字符集
               
               if (Msg = WM_SIZE) then
               begin
                 cxClient := LOWORD(lParam);  cyClient := HIWORD(lParam);
               end else
               begin // 当前字符集(等宽)字符尺寸
                 hWndDc := GetDC(hWnd);
                 SelectObject(hWndDc, CreateFont(0, 0, 0, 0, 0, 0, 0, 0, dwCharSet,
                   0, 0, 0, FIXED_PITCH, nil));
                 GetTextMetrics(hWndDc, TM);
                 cxChar := TM.tmAveCharWidth;
                 cyChar := TM.tmHeight;
                 DeleteObject(SelectObject(hWndDc, GetStockObject(SYSTEM_FONT)));
                 ReleaseDC(hWnd, hWndDc);
               end;
               
              // 分配内存
               if (pBuffer <> nil) then FreeMem(pBuffer, cxBuffer * cyBuffer);
               cxBuffer := Max(1, cxClient div cxChar);
               cyBuffer := Max(1, cyClient div cyChar);
               GetMem(pBuffer, cxBuffer * cyBuffer);
               FillChar(pBuffer^, cxBuffer * cyBuffer, Byte(' '));

              // 预置光标
               xCaret := 0;  yCaret := 0;
               if(hWnd = GetFocus) then SetCaretPos(0, 0);
               
              // 擦除背景
               InvalidateRect(hWnd, nil, TRUE);
             end;

    WM_SETFOCUS: begin // 创建显示'插入符号'
                   CreateCaret(hWnd, 0, cxChar, cyChar);
                   SetCaretPos(xCaret * cxChar, yCaret * cyChar);
                   ShowCaret(hWnd);
                 end;

    WM_KILLFOCUS: begin // 隐藏删除'插入符号'
                    HideCaret(hWnd);
                    DestroyCaret;
                  end;

    WM_KEYDOWN: begin
                  case wParam of
                    VK_HOME   : xCaret := 0;
                    VK_END    : xCaret := cxBuffer - 1;
                    VK_PRIOR  : yCaret := 0;
                    VK_NEXT   : yCaret := cyBuffer - 1;
                    VK_LEFT   : xCaret := Max(xCaret - 1, 0);
                    VK_RIGHT  : xCaret := Min(xCaret + 1, cxBuffer - 1);
                    VK_UP     : yCaret := Max(yCaret - 1, 0);
                    VK_DOWN   : yCaret := Min(yCaret + 1, cyBuffer - 1);
                    VK_DELETE : begin
                                 // 前移覆盖xCaret并设尾部为' '
                                  for X := xCaret to cxBuffer - 2 do
                                    Pt(yCaret, X)^ := Pt(yCaret, X + 1)^;
                                  Pt(yCaret, cxBuffer - 1)^ := ' ';
                                 // 仅重绘变化的部分文字 
                                  HideCaret(hWnd);
                                  hWndDc := GetDC(hWnd);
                                  SelectObject(hWndDc, CreateFont(0, 0, 0, 0, 0, 0,
                                    0, 0, dwCharSet, 0, 0, 0, FIXED_PITCH, nil));
                                  TextOut(hWndDc, xCaret * cxChar, yCaret * cyChar,
                                    Pt(yCaret, xCaret), cxBuffer - xCaret);
                                  DeleteObject(SelectObject(hWndDc, GetStockObject(SYSTEM_FONT)));
                                  ReleaseDC(hWnd, hWndDc);
                                  ShowCaret(hWnd);
                               end;
                  end; // END CASE  ....
                  SetCaretPos(xCaret * cxChar, yCaret * cyChar);
                end;

    WM_CHAR: begin            // 重复计数
               for J := 1 to LOWORD(lParam) do
               begin
                 case wParam of
                   $08: begin  // 回格, 转成Del键
                          if (xCaret > 0) then
                          begin
                            Dec(xCaret);
                            SendMessage(hWnd, WM_KEYDOWN, VK_DELETE, 1);
                          end;
                        end;

                   $09: begin  // TAB, 转成空格
                          repeat SendMessage(hWnd, WM_CHAR, $20, 1);
                          until (xCaret mod 8) = 0; 
                        end;

                   $0A: begin  // 换行
                          Inc(yCaret);
                          if yCaret = cyBuffer then yCaret := 0 ;
                        end;

                   $0D: begin  // 回车
                          xCaret := 0;
                          Inc(yCaret);
                          if yCaret = cyBuffer then yCaret := 0 ;
                        end;
                        
                   $1B: begin  // ESC, 清空
                          FillChar(pBuffer^, cxBuffer * cyBuffer, Byte(' '));
                          xCaret := 0 ;
                          yCaret := 0 ;
                          InvalidateRect(hWnd, nil, FALSE);
                        end;

                   else begin  // 普通字符
                          Pt(yCaret, xCaret)^ := Char(wParam);
                         // 重绘被覆盖的字符
                          HideCaret(hWnd);
                          hWndDc := GetDC(hWnd);
                          SelectObject(hWndDc, CreateFont(0, 0, 0, 0, 0, 0, 0, 0,
                              dwCharSet, 0, 0, 0, FIXED_PITCH, nil));
                          TextOut(hWndDc, xCaret * cxChar, yCaret * cyChar,
                              Pt(yCaret, xCaret), 1);
                          DeleteObject(SelectObject(hWndDc, GetStockObject(SYSTEM_FONT)));
                          ReleaseDC(hWnd, hWndDc);
                          ShowCaret(hWnd);
                         // 修改'插入符号'位置
                          Inc(xCaret);
                          if (xCaret = cxBuffer) then
                          begin
                            xCaret := 0 ;
                            Inc(yCaret);
                            if (yCaret = cyBuffer) then yCaret := 0;
                          end;
                        end;
                 end; // END CASE ....
               end; // END FOR ....
               SetCaretPos(xCaret * cxChar, yCaret * cyChar);
             end;

    WM_PAINT: begin
                hWndDc := BeginPaint(hWnd, PS);
                
                SelectObject(hWndDc, CreateFont(0, 0, 0, 0, 0, 0, 0, 0, dwCharSet, 0, 0, 0, FIXED_PITCH, nil));

                for Y := 0 to (cyBuffer - 1) do // 绘制各行
                  TextOut(hWndDc, 0, Y * cyChar, Pt(Y, 0), cxBuffer);

                DeleteObject(SelectObject(hWndDc, GetStockObject(SYSTEM_FONT)));

                EndPaint(hWnd, PS);
              end;

    WM_DESTROY: PostQuitMessage(0); // 放WM_QUIT消息

    else Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 默认处理
  end;
end;


const
  AppName = 'Typer'; // 窗体类名

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
  hWnd := CreateWindow(AppName, 'Typing Program',
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

        


