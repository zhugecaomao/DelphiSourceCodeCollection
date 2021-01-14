unit  CutFile;

interface

    // ---- 分割文件 ---- //
procedure Cut_File;
    // ---- 停止分割 ---- //
procedure Stop_Cut;

implementation

uses
  Windows, Messages, PublicUnit;

var
  sSourceFile, sDestFile: string;   // 源文件、目标文件 文件名
  iSourceSize, iDestSize: Int64;    // 源文件、目标文件 尺寸
  hCutThread: LongWord = 0;         // 当前进行分割线程之句柄
  

    // -- 分割线程回调函数 -- //
procedure CutThread(x: Integer); stdcall;
var
  hSourceFile,          // 来源文件句柄
  hDestFile: LongWord;  // 目标文件句柄
  iCutSize: Int64;      // 当前分割尺寸
  iCurStep: Integer;    // 当前块(整数值)
  sCurStep: string;     // 当前块(字符串)
  sFormText: string;    // 当前主窗体标题
  MsgResult: LongWord;  // 消息处理返回值
begin
  CurState := 1;

  hSourceFile := CreateFile(PChar(sSourceFile), GENERIC_READ, 3, nil,
                         OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if (hSourceFile = INVALID_HANDLE_VALUE) then
  begin
    MessageBox(hMainForm, '读取源文件出错!!', '提示', MB_SETFOREGROUND);
    CurState := 0;    Exit;
  end;

  Delete(sDestFile, Length(sDestFile)-2, 3);
  iCurStep := 1;

  while (Continue_Run)and(iSourceSize>0) do
  begin
    sCurStep := Int2Hex(iCurStep);
    sFormText := '  分割中 . . . .    正在生成第 '+sCurStep+' 块';
    SendMessageTimeout(hMainForm, WM_SETTEXT, 0, Integer(PChar(sFormText)),
                       SMTO_ABORTIFHUNG or SMTO_NORMAL, 1, MsgResult);

    if iSourceSize > iDestSize then iCutSize := iDestSize else iCutSize := iSourceSize;

    hDestFile := CreateFile(PChar(sDestFile+sCurStep), GENERIC_WRITE, 3,
                           nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
    if (hDestFile = INVALID_HANDLE_VALUE) then
    begin
      MessageBox(hMainForm, PChar('生成第 '+sCurStep+' 块出错!!'), '提示', MB_SETFOREGROUND);
      Break;
    end;

    CopyFileBlock(hSourceFile, hDestFile, iCutSize);
    CloseHandle(hDestFile);

    Dec(iSourceSize, iCutSize);
    Inc(iCurStep);
  end;

     // 出错导致退出      // 取消导致退出
  if (iSourceSize > 0) or (Continue_Run = FALSE) then
    for iCurStep := iCurStep downto 0 do DeleteFile(PChar(sDestFile+Int2Hex(iCurStep)));   

  CloseHandle(hSourceFile);
  SendMessageTimeout(hMainForm, WM_SETTEXT, 0, Integer(PChar(FormTitle)),
                  SMTO_ABORTIFHUNG or SMTO_NORMAL, 1, MsgResult);
  CurState := 0;                    
end;

    // ---- 分割文件 ---- //
procedure Cut_File;
var
  fExt, fMain, fPath, fTmp: string;
  fNameError: Boolean;
  CutThreadID: LongWord;
begin
// 待割文件
  sSourceFile := GetCaption(hEdit1);
  SetCaption(hEdit1, sSourceFile);
  if not FileExists(sSourceFile) then
  begin
    MessageBox(hMainForm, '请确定待割文件..  ', '提示', MB_SETFOREGROUND);  Exit;
  end;

// 目标文件
  sDestFile := GetCaption(hEdit2);
  fPath := ExtractFilePath(sDestFile);
  fTmp := ExtractFileName(sDestFile);
  fMain:= ExtractMainName(fTmp);
  fExt := ExtractExteName(fTmp);    
  fNameError := FALSE;
  if (not DirectoryExists(fPath)) then
  begin
    fNameError := TRUE;
    fPath := ExtractFilePath(sSourceFile);
  end;
  if (Trim(fMain)='') then
  begin
    fNameError := TRUE;
    fMain :=  ExtractFileName(sSourceFile);
  end;
  if (fExt<>'.001') then
  begin
    fNameError := TRUE;
    fExt := '.001';
  end;     
  if fNameError then
  begin
    sDestFile :=  fPath + fMain + fExt ;
    SetCaption(hEdit2, sDestFile);
    MessageBox(hMainForm, '请确定存放位置..  ', '提示', MB_SETFOREGROUND);
    Exit;
  end;

// 文件尺寸
  iSourceSize := GetFileLength(0, sSourceFile);
  if (iSourceSize = 0) then
  begin
    MessageBox(hMainForm, '取源文件长度出错..  ', '提示', MB_SETFOREGROUND); Exit;
  end;

// 分割尺寸  
  fTmp := GetCaption(hComboBox);
  iDestSize := StrToInt64(fTmp);

  if SendMessage(hRadioBtn2, BM_GETCHECK, 0, 0)=BST_CHECKED then iDestSize := iDestSize shl 10
  else if SendMessage(hRadioBtn3, BM_GETCHECK, 0, 0)=BST_CHECKED then iDestSize := iDestSize shl 20;

  if (iDestSize = 0)or(iSourceSize <= iDestSize) then
  begin
    MessageBox(hMainForm, '请确定分割尺寸..  ', '提示', MB_SETFOREGROUND); Exit;
  end;

// 确认分割
  if ( MessageBox(hMainForm, '下面即将进行分割,您确认吗?', '提示',
    MB_YESNO or MB_DEFBUTTON2 or MB_SETFOREGROUND) = ID_YES ) then
  begin
    if (hCutThread <> 0) then Stop_Cut;  // 关闭上次线程句柄
    Continue_Run := TRUE;  
    hCutThread := CreateThread(nil, 0, @CutThread, nil, 0, CutThreadID);
  end;
end;

    // ---- 停止分割 ---- //
procedure Stop_Cut;
begin
  if (hCutThread <> 0) then
  begin
    SetCaption(hMainForm, '    正在撤销分割 . . . . ');
    Continue_Run := FALSE;
    WaitForSingleObject(hCutThread, INFINITE);
    CloseHandle(hCutThread);
    hCutThread := 0;
    SetCaption(hMainForm, FormTitle);
  end;
end;

{ 注意分割线程不能用SendMessage设置窗体标题,否则,可能会出现这样的情况:
  窗体线程调用WaitForSingleObject阻塞自身,等待分割线程结束,而分割线程调用
  SendMessage导致自身阻塞,等待窗体线程处理消息. 这样,就会一直互相等待.. }
end.
