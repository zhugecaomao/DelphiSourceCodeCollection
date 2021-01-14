program  PopPad3;

{$R  PopPad3.res}

uses
  Windows, Messages, CommDlg, PopFile, PopFind, PopFont, PopPrnt;

const
  UNTITLED = '(untitled)';
  szAppName = 'PopPad3';
  IDM_FILE_NEW        = 40001; // 命令ID ..
  IDM_FILE_OPEN       = 40002;
  IDM_FILE_SAVE       = 40003;
  IDM_FILE_SAVE_AS    = 40004;
  IDM_FILE_PRINT      = 40005;
  IDM_APP_EXIT        = 40006;
  IDM_EDIT_UNDO       = 40007;
  IDM_EDIT_CUT        = 40008;
  IDM_EDIT_COPY       = 40009;
  IDM_EDIT_PASTE      = 40010;
  IDM_EDIT_CLEAR      = 40011;
  IDM_EDIT_SELECT_ALL = 40012;
  IDM_SEARCH_FIND     = 40013;
  IDM_SEARCH_NEXT     = 40014;
  IDM_SEARCH_REPLACE  = 40015;
  IDM_FORMAT_FONT     = 40016;
  IDM_HELP            = 40017;
  IDM_APP_ABOUT       = 40018;

var
  hDlgModeless: HWND = 0; // 对话框句柄(Find , FindNext , Replace)

  // 设置窗体标题
procedure DoCaption(hWnd: HWND; const szTitleName: PChar);
const
{$J+}
  List: array[0..1] of PChar = (szAppName, nil); // 转换列表
{$J-}
var
  szCaption: array[0..64 + MAX_PATH] of Char; // 转换缓冲区
begin
  if (szTitleName[0] <> #0) then List[1] := szTitleName else List[1] := UNTITLED;
  wvsprintf(szCaption, '%s - %s', @List);
  SetWindowText(hWnd, szCaption);
end;

  // 弹出消息框
procedure OkMessage(hWnd: HWND; const szMessage, szTitleName: PChar);
var
  szBuffer: array[0..64 + MAX_PATH] of Char; // 转换缓冲区
  List: PChar;
begin
  if (szTitleName[0] <> #0) then List := szTitleName else List := UNTITLED;
  wvsprintf(szBuffer, szMessage, @List);
  MessageBox(hWnd, szBuffer, szAppName, MB_OK or MB_ICONEXCLAMATION);
end;

  // 文件保存询问
function AskAboutSave(hWnd: HWND; const szTitleName: PChar): Integer;
var
  szBuffer: array[0..64 + MAX_PATH] of Char; // 转换缓冲区
  List: PChar;
begin
  if (szTitleName[0] <> #0) then List := szTitleName else List := UNTITLED;
  wvsprintf(szBuffer, 'Save current changes in %s?', @List);
  Result := MessageBox(hWnd, szBuffer, szAppName, MB_YESNOCANCEL or MB_ICONQUESTION);
  if (Result = IDYES) and (SendMessage(hWnd, WM_COMMAND, IDM_FILE_SAVE, 0) = 0) then
    Result := IDCANCEL;
end;  

   // (关于)对话框消息接收过程
function AboutDlgProc(hDlg: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
begin
  Result := FALSE;
  case Msg of
    WM_INITDIALOG:
      Result :=  TRUE;

    WM_COMMAND:
      case LOWORD(wParam) of
        IDOK:
          begin
            EndDialog(hDlg, 0);
            Result := TRUE;
          end;
      end;
  end;
end;

   // 窗体消息处理过程
function WndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
{$J+}
  bNeedSave: Boolean = FALSE; // 需保存(文本已变化)
  hWndEdit: Integer = 0; // 编辑控件句柄
  iOffset: LongWord = 0; // 当前光标位置
  messageFindReplace: LongWord = 0; // 自注册消息
  szFileName: PChar = nil;  // 完整路径+文件名
  szTitleName: PChar = nil; // 文件名(不含路径)
{$J-}
  EDITID = 1;
var
  iSelBeg, iSelEnd, iEnable: Integer;
  pfr: PFindReplace;
begin
  Result := 0; // 预置返回值(也是SendMessage将得到的)
  case Msg of
    WM_CREATE:
      begin
        GetMem(szFileName, MAX_PATH + 1); // 为字符串数组分配内存并初始化
        szFileName[0] := #0;
        GetMem(szTitleName, MAX_PATH + 1);
        szTitleName[0] := #0;

        hWndEdit := CreateWindow('edit', nil, // 建立编辑控件
          WS_CHILD or WS_VISIBLE or WS_HSCROLL or WS_VSCROLL or WS_BORDER or ES_LEFT
          or ES_NOHIDESEL or ES_MULTILINE or ES_AUTOHSCROLL or ES_AUTOVSCROLL,
          0, 0, 0, 0, hWnd, EDITID, hInstance, nil);
        SendMessage(hWndEdit, EM_LIMITTEXT, 32000, 0); // 限制文字长度
        
        PopFileInitialize(hWnd); // 初始化通用对话框结构
        PopFontInitialize(hWndEdit); // 初始化字体
        messageFindReplace := RegisterWindowMessage(FINDMSGSTRING); // 注册消息
        DoCaption(hWnd, szTitleName); // 初始化主窗体标题
      end;

    WM_SETFOCUS:
      SetFocus(hWndEdit); // 焦点始终在编辑控件

    WM_SIZE:
      MoveWindow(hWndEdit, 0, 0, LOWORD(lParam), HIWORD(lParam), TRUE); // 调整编辑控件

    WM_INITMENUPOPUP: // 菜单将弹出
      case lParam of
        1: begin // Edit菜单
             if SendMessage(hWndEdit, EM_CANUNDO, 0, 0) <> 0 then // 可以撤销
               EnableMenuItem(wParam, IDM_EDIT_UNDO, MF_ENABLED)
             else
               EnableMenuItem(wParam, IDM_EDIT_UNDO, MF_GRAYED);

             if IsClipboardFormatAvailable(CF_TEXT) then // 剪贴板中含有文字
               EnableMenuItem(wParam, IDM_EDIT_PASTE, MF_ENABLED)
             else
               EnableMenuItem(wParam, IDM_EDIT_PASTE, MF_GRAYED);
                                                                       // 选中文本首尾位置
             SendMessage(hWndEdit, EM_GETSEL, Integer(@iSelBeg), Integer(@iSelEnd));
             if (iSelBeg = iSelEnd) then iEnable := MF_GRAYED else iEnable := MF_ENABLED;
             EnableMenuItem(wParam, IDM_EDIT_CUT, iEnable);
             EnableMenuItem(wParam, IDM_EDIT_COPY, iEnable);
             EnableMenuItem(wParam, IDM_EDIT_CLEAR, iEnable);
           end;

        2: begin // Search菜单
             if (hDlgModeless = 0) then iEnable := MF_ENABLED else iEnable := MF_GRAYED;
             EnableMenuItem(wParam, IDM_SEARCH_FIND, iEnable);
             EnableMenuItem(wParam, IDM_SEARCH_NEXT, iEnable);
             EnableMenuItem(wParam, IDM_SEARCH_REPLACE, iEnable);
           end;
      end;

    WM_COMMAND:
      if (lParam = hWndEdit) and (LOWORD(wParam) = EDITID) then // 编辑控件
      begin
        case HIWORD(wParam) of
          EN_UPDATE: // 内容变化(需保存)
            bNeedSave := TRUE;

          EN_ERRSPACE,
          EN_MAXTEXT: // 出错(超出范围)
            MessageBox(hWnd, 'Edit control out of space.', szAppName, MB_OK or MB_ICONSTOP);

          else
            Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
        end;
      end else  // 否则,则是菜单或快捷键
      begin
        case LOWORD(wParam) of // 菜单或快捷键ID
          IDM_FILE_NEW: // 新建
            begin
              if (bNeedSave)and(AskAboutSave(hWnd, szTitleName) = IDCANCEL) then Exit;

              SetWindowText(hWndEdit, '');
              szFileName[0] := #0;
              szTitleName[0] := #0;
              DoCaption(hWnd, szTitleName);
              bNeedSave := FALSE;
            end;

          IDM_FILE_OPEN: // 打开
            begin
              if (bNeedSave)and(AskAboutSave(hWnd, szTitleName) = IDCANCEL) then Exit;
              
              if PopFileOpenDlg(hWnd, szFileName, szTitleName) then // 选择文件对话框
              begin                     
                if (not PopFileRead(hWndEdit, szFileName)) then // 读入文件失败
                begin
                  OkMessage(hWnd, 'Could not read file %s!', szTitleName); // 错误提示
                  szFileName[0] := #0;
                  szTitleName[0] := #0;
                end;
              end;
              DoCaption(hWnd, szTitleName);
              bNeedSave := FALSE;
            end;

          IDM_FILE_SAVE:
            begin
              if (szFileName[0] <> #0) then // 已知文件名
              begin
                if (PopFileWrite(hWndEdit, szFileName)) then // 保存文件成功
                begin
                  bNeedSave := FALSE;    Result := 1; // 返回TRUE
                end else
                  OkMessage(hWnd, 'Could not write file %s', szTitleName); // 错误提示
              end else
              begin
                Result := SendMessage(hWnd, WM_COMMAND, IDM_FILE_SAVE_AS, 0); // 调用WndProc
              end;  
            end;

          IDM_FILE_SAVE_AS:
            begin
              if PopFileSaveDlg(hWnd, szFileName, szTitleName) then // 保存文件对话框
              begin
                DoCaption(hWnd, szTitleName);
                if PopFileWrite(hWndEdit, szFileName) then // 保存成功
                begin
                  bNeedSave := FALSE;   Result := 1; // 返回TRUE
                end else
                  OkMessage(hWnd, 'Could not write file %s', szTitleName); // 错误提示
              end;
            end;

          IDM_FILE_PRINT:
            if (not PopPrntPrintFile(hInstance, hWnd, hWndEdit, szTitleName)) then
              OkMessage(hWnd, 'Could not print file %s', szTitleName); // 打印出错提示

          IDM_APP_EXIT:
            SendMessage(hWnd, WM_CLOSE, 0, 0);

          IDM_EDIT_UNDO:
            SendMessage(hWndEdit, WM_UNDO, 0, 0);

          IDM_EDIT_CUT:
            SendMessage(hWndEdit, WM_CUT, 0, 0);

          IDM_EDIT_COPY:
            SendMessage(hWndEdit, WM_COPY, 0, 0);

          IDM_EDIT_PASTE:
            SendMessage(hWndEdit, WM_PASTE, 0, 0);

          IDM_EDIT_CLEAR:
            SendMessage(hWndEdit, WM_CLEAR, 0, 0);

          IDM_EDIT_SELECT_ALL:
            SendMessage(hWndEdit, EM_SETSEL, 0, -1);

          IDM_SEARCH_FIND:
            begin
              SendMessage(hWndEdit, EM_GETSEL, 0, Integer(@iOffset)); // 选中文本末尾位置
              hDlgModeless := PopFindFindDlg(hWnd); // Find对话框
            end;

          IDM_SEARCH_NEXT:
            begin
              SendMessage(hWndEdit, EM_GETSEL, 0, Integer(@iOffset)); // 选中文本末尾位置
              if PopFindValidFind() then // 寻找关键词有效
                PopFindNextText(hWndEdit, @iOffset)
              else
                hDlgModeless := PopFindFindDlg(hWnd); 
            end;

          IDM_SEARCH_REPLACE:
            begin
              SendMessage(hWndEdit, EM_GETSEL, 0, Integer(@iOffset)); // 选中文本末尾位置
              hDlgModeless := PopFindReplaceDlg(hWnd); // 文本替换对话框
            end;

          IDM_FORMAT_FONT:
            if PopFontChooseFont(hWnd) then PopFontSetFont(hWndEdit); // 设置字体

          IDM_HELP:
            OkMessage(hWnd, 'Help not yet implemented!', '');


          IDM_APP_ABOUT:
            DialogBox(hInstance, 'AboutBox', hWnd, @AboutDlgProc);

          else
            Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
        end;         
      end;                          

    WM_CLOSE:
      if (not bNeedSave) or (AskAboutSave(hWnd, @szTitleName[0]) <> IDCANCEL) then // 窗口关闭
        DestroyWindow(hWnd);

    WM_QUERYENDSESSION:
      if (not bNeedSave) or (AskAboutSave(hWnd, szTitleName) <> IDCANCEL) then // 系统关闭
        Result := 1
      else
        Result := 0;

    WM_DESTROY:
      begin
        PopFontDeinitialize();
        FreeMem(szFileName);
        FreeMem(szTitleName);
        PostQuitMessage(0); // 退出循环
      end;

    else
      begin
        if (Msg = messageFindReplace) then // 自注册消息
        begin
          pfr := PFindReplace(lParam);

          if (pfr.Flags and FR_DIALOGTERM) <> 0 then hDlgModeless := 0; // 终止对话框

          if (pfr.Flags and FR_FINDNEXT) <> 0 then // 寻找下一个
            if (not PopFindFindText(hWndEdit, @iOffset, pfr)) then // 未找到
              OkMessage(hWnd, 'Text not found!', '');

          if ((pfr.Flags and FR_REPLACE) <> 0) or ((pfr.Flags and FR_REPLACEALL) <> 0) then // 替换
            if (not PopFindReplaceText(hWndEdit, @iOffset, pfr)) then // 未找到
              OkMessage(hWnd, 'Text not found!', '');

          if (pfr.Flags and FR_REPLACEALL) <> 0 then // 全部替换
            while(PopFindReplaceText(hWndEdit, @iOffset, pfr)) do;
            
         end else
           Result := DefWindowProc(hWnd, Msg, wParam, lParam); // 标准处理
      end;
  end;
end;

var
  Msg: TMsg; // 标准消息结构
  hWnd, hAccel: LongWord; // 窗口句柄, 快捷键列表句柄
  WndClass: TWndClass; // 注册窗体类结构
begin
 // 填充结构体
  WndClass.style := CS_HREDRAW or CS_VREDRAW;
  WndClass.lpfnWndProc := @WndProc;
  WndClass.cbClsExtra := 0;
  WndClass.cbWndExtra := 0;
  WndClass.hInstance := hInstance;
  WndClass.hIcon := LoadIcon(hInstance, szAppName);
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
  hWnd := CreateWindow(szAppName, nil,
                       WS_OVERLAPPEDWINDOW,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       CW_USEDEFAULT, CW_USEDEFAULT,
                       0, 0, hInstance, CmdLine);

 // 显示窗体
  ShowWindow(hWnd, CmdShow);
  UpdateWindow(hWnd);

 // 快捷键列表
  hAccel := LoadAccelerators(hInstance, szAppName);

 // 消息循环
  while GetMessage(Msg, 0, 0, 0) do
  begin
    if (hDlgModeless = 0) or (not IsDialogMessage(hDlgModeless, Msg)) then
    begin
      if (TranslateAccelerator(hWnd, hAccel, Msg) = 0) then
      begin
        TranslateMessage(Msg);
        DispatchMessage(Msg);
      end;
    end;
  end;
end.
