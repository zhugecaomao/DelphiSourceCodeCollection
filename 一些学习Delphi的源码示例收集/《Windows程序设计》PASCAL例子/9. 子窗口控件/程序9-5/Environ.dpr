program  Environ;

uses
  Windows, Messages; 

   // 主窗体消息处理过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
     // 环境变量名称依次添加到ListBox
  procedure FillListBox(hWndList: LongWord);
  var
    iLength: Integer;
    pVarBlock, pVarBeg, pVarEnd, pVarName: PChar;
  begin
    pVarBlock := GetEnvironmentStrings(); // 信息地址
    while (pVarBlock^ <> #0) do // 最终以2个#0结束
    begin
      if (pVarBlock^ <> '=') then // 跳过'='开头的
      begin
       // 取出变量名并添加到Listbox ..
        pVarBeg := pVarBlock ;
        while (pVarBlock^ <> '=') do Inc(pVarBlock);
        pVarEnd := pVarBlock;
        iLength := pVarEnd - pVarBeg + 1;
        GetMem(pVarName, iLength);
        CopyMemory(pVarName, pVarBeg, iLength-1);
        pVarName[iLength] := #0;
        SendMessage(hWndList, LB_ADDSTRING, 0, Integer(pVarName)); // 添加
        FreeMem(pVarName, iLength);
      end;
     // 跳到下一项 
      while (pVarBlock^ <> #0) do Inc(pVarBlock);
      Inc(pVarBlock);
    end;
    FreeEnvironmentStrings(pVarBlock); // 释放
  end;
const
  ID_LIST = 1;
  ID_TEXT = 2;
{$J+}
  hWndList: LongWord = 0;
  hWndText: LongWord = 0;
{$J-}
var
  iIndex, iLength, cxChar, cyChar: Integer;
  pVarName, pVarValue: PChar;
begin
  Result := 0;
  case Msg of
    WM_CREATE:
      begin
        cxChar := LOWORD(GetDialogBaseUnits());
        cyChar := HIWORD(GetDialogBaseUnits());
        hWndList := CreateWindow('listbox', nil,
                      WS_CHILD or WS_VISIBLE or LBS_STANDARD,
                      cxChar, cyChar * 3,
                      cxChar * 30 + GetSystemMetrics(SM_CXVSCROLL), cyChar * 20,
                      hWnd, ID_LIST,
                      GetWindowLong(hWnd, GWL_HINSTANCE),
                      nil);
        hWndText := CreateWindow('static', nil,
                      WS_CHILD or WS_VISIBLE or SS_LEFT,
                      cxChar, cyChar,
                      GetSystemMetrics(SM_CXSCREEN), cyChar,
                      hWnd, ID_TEXT,
                      GetWindowLong(hWnd, GWL_HINSTANCE),
                      nil);
        FillListBox(hWndList); // 填充
      end;

    WM_SETFOCUS:
      SetFocus(hWndList); // 转交焦点

    WM_COMMAND:              // ListBox 选择项 变化 ..     
      if (LOWORD(wParam) = ID_LIST)and(HIWORD(wParam) = LBN_SELCHANGE) then
      begin
        iIndex := SendMessage(hWndList, LB_GETCURSEL, 0, 0); // 当前选中
        iLength := SendMessage(hWndList, LB_GETTEXTLEN, iIndex, 0) + 1; // 长度(名称)
        GetMem(pVarName, iLength);
        SendMessage(hWndList, LB_GETTEXT, iIndex, Integer(pVarName)); // 取出(名称)

        iLength := GetEnvironmentVariable(pVarName, nil, 0); // 长度(值)
        GetMem(pVarValue, iLength);
        GetEnvironmentVariable(pVarName, pVarValue, iLength); // 取出(值)          
        SetWindowText(hWndText, pVarValue); // 打印(值)
        
        FreeMem(pVarName);
        FreeMem(pVarValue);
      end;

    WM_DESTROY:
      PostQuitMessage(0); // 放一个退出消息

    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
  end;
end;
  

const
  szAppName = 'Environ';

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
  WndClass.hbrBackground :=  COLOR_WINDOW + 1;
  WndClass.lpszMenuName := nil;
  WndClass.lpszClassName := szAppName;

 // 注册窗体类
  if (RegisterClass(WndClass) = 0) then
  begin
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
    Exit;
  end;

 // 建立窗体
  hWnd := CreateWindow(szAppName, 'Environment List Box',
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

(* 注,此程序有一个小Bug, static会'根据需要自动换行',
   如果字符串太长, 仅在一行的static中是看不完整的 *)
end.
