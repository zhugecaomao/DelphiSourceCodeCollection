program  HexCalc;

{$R  HexCalc.res}

uses
  Windows, Messages;

  // 设置ID=VK_ESCAPE按钮文字
procedure ShowNumber(hWnd: HWND; iNumber: DWORD);
var
  szBuffer: array[0..8] of Char;
begin
  wvsprintf(szBuffer, '%X', @iNumber);
  SetDlgItemText(hWnd, VK_ESCAPE, szBuffer);
end;

  // 双目运算
function CalcIt(iFirstNum: DWORD; iOperation: Char; iNum: DWORD): DWORD;
begin
  case iOperation of
    '=': Result := iNum;
    '+': Result := iFirstNum + iNum;
    '-': Result := iFirstNum - iNum;
    '*': Result := iFirstNum * iNum;
    '&': Result := iFirstNum and iNum;
    '|': Result := iFirstNum or  iNum;
    '^': Result := iFirstNum xor iNum;
    '<': Result := iFirstNum shl iNum;
    '>': Result := iFirstNum shr iNum;
    '/': if iNum = 0 then Result := MAXDWORD else Result := iFirstNum div iNum;
    '%': if iNum = 0 then Result := MAXDWORD else Result := iFirstNum mod iNum;
    else Result := 0;
  end;
end;

  // 窗体消息处理过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  bNewNumber: Boolean = TRUE;
  iOperation: Char = '=';
  iFirstNum: DWORD = 0;
  iNumber: DWORD = 0;
{$J-}
var
  hButton: DWORD;
begin
  Result := 0;
  case Msg of
    WM_KEYDOWN:
      begin
        if (wParam = VK_LEFT) then SendMessage(hWnd, WM_COMMAND, VK_BACK, 0)
        else Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
      end;

    WM_CHAR:
      begin
        if (wParam >= $61) and (wParam <= $66) then Dec(wParam, $20) // 小写转大写
        else if (wParam = VK_RETURN) then wParam := Ord('='); // 回车转等号 '='
        hButton := GetDlgItem(hWnd, wParam); // 是否存在对应按钮(ASCII码=ID)
        if (hButton <> 0) then
        begin
          SendMessage(hButton, BM_SETSTATE, 1, 0);
          Sleep(100);
          SendMessage(hButton, BM_SETSTATE, 0, 0);
          SendMessage(hWnd, WM_COMMAND, wParam, 0);
        end else
        begin
          MessageBeep(0);
        end;
      end;

    WM_COMMAND:
      begin
        SetFocus(hWnd);
        if (wParam = VK_BACK) then (* 注: 单击按钮通知码 BN_CLICKED = 0, 下同 *)
        begin
          iNumber := iNumber div 16; // 减少1位
          ShowNumber(hWnd, iNumber);
        end else
          if (wParam = VK_ESCAPE) then
          begin
            iNumber := 0; // 清0
            ShowNumber(hWnd, 0);
          end else
            if ((wParam >= $30)and(wParam <= $39)) or  // 16进制数字字符 ..
               ((wParam >= $41)and(wParam <= $46)) then
            begin
              if bNewNumber then
              begin
                iFirstNum := iNumber;
                iNumber := 0;
              end;
              bNewNumber := FALSE;
              if (iNumber <= MAXDWORD shr 4) then // 还有空(16进制)位
              begin
                if (wParam >= $30) and (wParam <= $39) then
                  iNumber := 16 * iNumber + wParam - Ord('0')
                else
                  iNumber := 16 * iNumber + wParam - Ord('A') + 10;
                ShowNumber(hWnd, iNumber);
              end else
                MessageBeep(0); // 位满则响铃
            end else  // 否则可能是运算符 ..
            begin
              if (HIWORD(wParam) = BN_CLICKED) then // 单击
              begin
                if (not bNewNumber) then // 之前未计算
                begin
                  iNumber := CalcIt(iFirstNum, iOperation, iNumber);
                  ShowNumber(hWnd, iNumber);
                end;
                bNewNumber := TRUE;
                iOperation := Char(wParam);
              end;
            end;
      end;

    WM_DESTROY:
      begin
        PostQuitMessage(0); // 退出消息循环
      end;

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end;
  
const
  szAppName = 'HexCalc';
var
  hWnd: LongWord;
  Msg: TMsg;  
  WndClass: TWndClass;          
begin
 // 注册窗体类
  WndClass.style := CS_HREDRAW or CS_VREDRAW;
  WndClass.lpfnWndProc := @WndProc;
  WndClass.cbClsExtra := 0;
  WndClass.cbWndExtra := DLGWINDOWEXTRA;
  WndClass.hInstance := hInstance;
  WndClass.hIcon := LoadIcon(hInstance, szAppName);
  WndClass.hCursor := LoadCursor(0, IDC_ARROW);
  WndClass.hbrBackground := COLOR_BTNFACE + 1;
  WndClass.lpszMenuName := nil;
  WndClass.lpszClassName := szAppName;
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateDialog(hInstance, szAppName, 0, nil);
  ShowWindow(hWnd, CmdShow);

 // 消息循环
  while GetMessage(Msg, 0, 0, 0) do
  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end.
