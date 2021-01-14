unit  JoinFile;

interface

procedure Join_File;
procedure Stop_Join;

implementation

uses
  Windows, Messages, ListUnit, PublicUnit;

var
  sTargetFile: string;       // 合并之后存放位置
  hJoinThread: LongWord = 0; // 当前合并线程句柄
  

    // -- 合并线程回调函数 -- //
procedure JoinThread(x: Integer); stdcall;
var
  iCurStep,              // 当前添加块号
  iSumStep: Integer;     // 需添加块总数
  hTargetFile,           // 目标文件句柄
  hSourceFile: LongWord; // 来源文件句柄
  iSourceSize: Int64;    // 来源文件长度
  sFormText: string;     // 当前主窗体标题
  MsgResult: LongWord;   // 消息处理返回值
begin
  CurState := 2;

  hTargetFile := CreateFile(PChar(sTargetFile), GENERIC_WRITE, 3, nil,
                          CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
  if (hTargetFile = INVALID_HANDLE_VALUE) then
  begin
    MessageBox(hMainForm, '建立目标文件出错!!', '提示', MB_SETFOREGROUND);
    CurState := 0;    Exit;
  end;

  iSumStep := High(FileList);
  iCurStep := 0;
  while (Continue_Run)and(iCurStep <= iSumStep) do
  begin
    sFormText := '  合并中 . . . .    正在添加第 '+Int2Hex(iCurStep+1)+' 块';
    SendMessageTimeout(hMainForm, WM_SETTEXT, 0, Integer(PChar(sFormText)),
                      SMTO_ABORTIFHUNG or SMTO_NORMAL, 1, MsgResult);

    hSourceFile := CreateFile(PChar(FileList[iCurStep]), GENERIC_READ, 3, nil,
                             OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
    if (hSourceFile = INVALID_HANDLE_VALUE) then
    begin
      MessageBox(hMainForm, PChar('添加第 '+Int2Hex(iCurStep+1)+' 块出错!!'), '提示', MB_SETFOREGROUND);
      Break;
    end;

    iSourceSize := GetFileLength(hSourceFile);
    CopyFileBlock(hSourceFile, hTargetFile, iSourceSize);
    CloseHandle(hSourceFile);

    Inc(iCurStep);
  end;
  CloseHandle(hTargetFile);
  
     // 出错导致退出           // 取消导致退出
  if (iCurStep <= iSumStep) or (Continue_Run = FALSE) then DeleteFile( PChar(sTargetFile) );
  SendMessageTimeout(hMainForm, WM_SETTEXT, 0, Integer(PChar(FormTitle)),
                   SMTO_ABORTIFHUNG or SMTO_NORMAL, 1, MsgResult);
  CurState := 0;                   
end;

procedure Join_File;
var
  JoinThreadID: LongWord;
begin
// 存放位置
  sTargetFile := GetCaption(hEdit3);
  SetCaption(hEdit3, sTargetFile);

// 非法路径
  if (sTargetFile = '')or(DirectoryExists(ExtractFilePath(sTargetFile)) = FALSE)or
     (Trim(ExtractMainName(ExtractFileName(sTargetFile))) = '') then
  begin
    MessageBox(hMainForm, '请确定存放位置..  ', '提示', MB_SETFOREGROUND); Exit;
  end;
  
// 覆盖确认
  if FileExists(sTargetFile)and(MessageBox(hMainForm, '文件已存在,确定覆盖?  ',
     '提示', MB_YESNO or MB_DEFBUTTON2 or MB_SETFOREGROUND) = ID_NO) then Exit;

// 导出列表
  ListBox2FileList;
  if (Length(FileList) = 0) then
  begin
    MessageBox(hMainForm, '请确定合并列表..  ', '提示', MB_SETFOREGROUND); Exit;
  end;

// 确认合并
  if ( MessageBox(hMainForm, '下面即将进行合并,您确认吗?', '提示',
    MB_YESNO or MB_DEFBUTTON2 or MB_SETFOREGROUND) = ID_YES ) then
  begin
    if (hJoinThread <> 0) then Stop_Join;  // 关闭上次线程句柄
    Continue_Run := TRUE;
    hJoinThread := CreateThread(nil, 0, @JoinThread, nil, 0, JoinThreadID);
  end;
end;

procedure Stop_Join;
begin
  if (hJoinThread <> 0) then
  begin
    SetCaption(hMainForm, '    正在撤销合并 . . . . ');
    Continue_Run := FALSE;
    WaitForSingleObject(hJoinThread, INFINITE);
    CloseHandle(hJoinThread);
    hJoinThread := 0;
    SetCaption(hMainForm, FormTitle);
  end;
end;

 { 注: 同样,合并线程也应该用SendMessageTimeout来设置主窗体标题. }
end.
