unit  MainForm;

interface

    // ---- 建立主窗体 ---- //
procedure Create_MainForm;

implementation

uses
  Windows, CommCtrl, ShellAPI, Messages, ListUnit, PublicUnit;  

    // ---- 主窗体过程 ---- //
function FormProc(hForm, MsgID, WParam, LParam: LongWord): LongWord; stdcall;
var
  DragSum: Integer;
begin        
  if (CurState <> 0) and (MsgID = WM_NOTIFY) and //  处理中暂不允许切换页面
     (PNMHdr(LParam).code = TCN_SELCHANGING) then Result := 1
  else begin
    if (CurState <> 0) and (MsgID = WM_CLOSE) and // 处理中关闭窗体需要确认
       ( MessageBox(hForm, '尚未完成处理, 确定退出程序?  ', '提示',
        MB_YESNO or MB_DEFBUTTON2 or MB_SETFOREGROUND) = ID_NO ) then Result := 1
    else begin

      if (MsgID = WM_NOTIFY) and (WParam = TabCtrlID) // 切换页面后作相应处理
         and (PNMHdr(LParam).code = TCN_SELCHANGE) then
      begin
        ShowWindow(hPanel1, SW_HIDE);
        ShowWindow(hPanel2, SW_HIDE);
        ShowWindow(hPanel3, SW_HIDE);
        Result := SendMessage(hTabCtrl, TCM_GETCURSEL, 0, 0);
        case Result of
          0: ShowWindow(hPanel1, SW_SHOW);
          1: ShowWindow(hPanel2, SW_SHOW);
          2: ShowWindow(hPanel3, SW_SHOW);
        end;         // ........ end case ........ ^^
      end else
        if (MsgID = WM_DROPFILES) then // 来自其他程序的文件拖放
        begin
         // 文件列表放入FileList
          SetLength(FileList, 0);
          DragSum := DragQueryFile(WParam, $FFFFFFFF, nil ,1)-1;
          for Result := 0 to DragSum do
          begin
            DragQueryFile(WParam, Result, FilesBuf, MAX_LENGTH);
            if DirectoryExists(FilesBuf) then Continue; // 剔除目录
            SetLength(FileList, Length(FileList) + 1);
            FileList[ High(FileList) ] := FilesBuf;
          end;
          DragFinish(WParam);
        // 根据当前页面作不同处理
          if (Length(FileList) > 0) then
          begin
            Result := SendMessage(hTabCtrl, TCM_GETCURSEL, 0, 0);
            if (Result = 1) then FileList2ListBox
            else if (Result = 0) then
                 begin
                   SetCaption(hEdit1, FileList[0]);
                   SetCaption(hEdit2, FileList[0]+'.001');
                 end;
          end;
        end else
          if (MsgID=WM_DESTROY) then // 窗体注销则结束本线程消息循环 
            PostQuitMessage(0);

      Result := DefWindowProc(hForm, MsgID, WParam, LParam);
    end;
  end;      
end;

    // ---- 注册窗体类 ---- //
function RegisterForm: Boolean;
var
  FormClass: TWndClass;
begin
  with FormClass do
  begin
    Style := CS_HREDRAW or CS_VREDRAW;
    lpfnWndProc := @FormProc;
    cbClsExtra := 0;
    cbWndExtra := 0;
    hInstance := SysInit.hInstance;
    hIcon := LoadIcon(hInstance, 'Cool');
    hCursor :=  hArrowCursor;
    hbrBackground := COLOR_WINDOW;
    lpszMenuName := nil;
    lpszClassName := 'Splitter_MainForm_Mazi';
  end; 
  Result := RegisterClass(FormClass) <> 0;
end;

    // ---- 建立主窗体 ---- //
procedure Create_MainForm;
begin               
  if (RegisterForm = FALSE) then
  begin
    MessageBox(0, 'RegisterForm Error !!' , nil, MB_SETFOREGROUND);  Halt;
  end;
  hMainForm := CreateWindowEx(WS_EX_ACCEPTFILES or WS_EX_TOPMOST,
                              'Splitter_MainForm_Mazi', FormTitle,
                              WS_VISIBLE or WS_TILED or WS_SYSMENU
                              or WS_MINIMIZEBOX or WS_CLIPCHILDREN,
                              200, 200, 350, 200, 0, 0, hInstance, nil);
  if (hMainForm = 0) then
  begin
    MessageBox(0, 'Create MainForm Error !!', nil, MB_SETFOREGROUND);  Halt;
  end;
  SendMessage(hMainForm, WM_SETFONT, hSmallFont, 0);    
end;  

end.    
