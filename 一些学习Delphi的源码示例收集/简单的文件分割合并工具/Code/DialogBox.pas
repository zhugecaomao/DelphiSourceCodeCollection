unit  DialogBox;

interface

    // ---- 选择文件对话框 ---- //
function OpenFile_Dialog(OpenFileName, OpenFilter, OpenDefExt: string; MultiSelect: Boolean): Boolean;
    // ---- 保存文件对话框 ---- //
function SaveFile_Dialog(SaveFileName, SaveFilter, SaveDefExt: string; OverPrompt: Boolean): Boolean;

implementation

uses
  Windows, CommDlg, PublicUnit; 
  
    // FilesBuf 转入 FileList ..
procedure FilesBuf2FileList(MultiSelect: Boolean);
var
  TmpPChar: PChar;
  FilePath: string;
begin
  TmpPChar := @FilesBuf[0];
  if (not MultiSelect) or (TmpPChar[StrLen(TmpPChar)+1] = #0) then
  begin
    SetLength(FileList, 1);
    FileList[0] := StrPas(TmpPChar);
  end else
  begin
    SetLength(FileList, 0);   FilePath := StrPas(TmpPChar);
    TmpPChar := TmpPChar + StrLen(TmpPChar) + 1 ;
    if (FilePath[Length(FilePath)]<>'\') then FilePath := FilePath+'\';
    while (TmpPChar[0] <> #0) do
    begin
      SetLength(FileList, Length(FileList)+1);
      FileList[High(FileList)] := FilePath + StrPas(TmpPChar);
      TmpPChar := TmpPChar + StrLen(TmpPChar) + 1 ;
    end;
  end;
end;    

   // '打开文件'对话框   默认文件名..  过滤器串..  默认扩展名..        允许多选..             成功否..
function OpenFile_Dialog(OpenFileName, OpenFilter, OpenDefExt: string; MultiSelect: Boolean): Boolean;
var
  ofnStruct: TOpenFilename;
begin
  StrCopy(@FilesBuf[0], PChar(OpenFileName));            // 置默认文件名..
  with ofnStruct do
  begin
    lStructSize := SizeOf(TOpenFilename)-SizeOf(DWORD)*3; // 兼容9x, 减12..
    hwndOwner := hMainForm;                               // 属主窗口句柄..
    hInstance := 0;
    lpstrFilter := PChar(OpenFilter);                     // 过滤器字符串..
    lpstrCustomFilter:= nil;
    nMaxCustFilter := 0;
    nFilterIndex := 1;                                    // 默认过滤器..
    lpstrFile := @FilesBuf[0];                            // 存所选文件列表..
    nMaxFile := MAX_LENGTH;                               // lpstrFile长度..
    lpstrFileTitle := nil;
    nMaxFileTitle := 0;
    lpstrInitialDir := nil;
    lpstrTitle := nil;
    Flags := OFN_EXPLORER or OFN_HIDEREADONLY or OFN_NODEREFERENCELINKS or
             OFN_FILEMUSTEXIST or OFN_PATHMUSTEXIST;
    if MultiSelect then Flags := Flags or OFN_ALLOWMULTISELECT;
    nFileOffset := 0;
    nFileExtension := 0;
    lpstrDefExt := PChar(OpenDefExt);                     // 默认扩展名..
    lCustData := 0;
    lpfnHook := nil;
    lpTemplateName := nil;
    pvReserved:=nil;                                      // 3个新增成员..
    dwReserved:=0;
    FlagsEx:=0;
  end;       // ............ end with .............   ^^
  Result := GetOpenFileName(ofnStruct);
  if Result then FilesBuf2FileList(MultiSelect);
end;       

   // '保存文件'对话框   默认文件名..  过滤器串..  默认扩展名..        覆盖提示..            成功否..
function SaveFile_Dialog(SaveFileName, SaveFilter, SaveDefExt: string; OverPrompt: Boolean): Boolean;
var
  ofnStruct: TOpenFilename;
begin
  StrCopy(@FilesBuf[0], PChar(SaveFileName));            // 置默认文件名..
  with ofnStruct do
  begin
    lStructSize := SizeOf(TOpenFilename)-SizeOf(DWORD)*3; // 兼容9x, 减12..
    hwndOwner := hMainForm;                               // 属主窗口句柄..
    hInstance := 0;
    lpstrFilter := PChar(SaveFilter);                     // 过滤器字符串..
    lpstrCustomFilter:= nil;
    nMaxCustFilter := 0;
    nFilterIndex := 1;                                    // 默认过滤器..
    lpstrFile := @FilesBuf[0];                            // 存所填文件名 ..
    nMaxFile := MAX_LENGTH;                               // lpstrFile长度..
    lpstrFileTitle := nil;
    nMaxFileTitle := 0;
    lpstrInitialDir := nil;
    lpstrTitle := nil;
    Flags := OFN_EXPLORER or OFN_PATHMUSTEXIST or OFN_HIDEREADONLY or OFN_NODEREFERENCELINKS;
    if OverPrompt then Flags := Flags or OFN_OVERWRITEPROMPT;
    nFileOffset := 0;
    nFileExtension := 0;
    lpstrDefExt := PChar(SaveDefExt);                     // 默认扩展名..
    lCustData := 0;
    lpfnHook := nil;
    lpTemplateName := nil;
    pvReserved:=nil;                                      // 3个新增成员..
    dwReserved:=0;
    FlagsEx:=0;
  end;       // ............ end with .............   ^^
  Result := GetSaveFileName(ofnStruct);
  if Result then FilesBuf2FileList(FALSE);
end;

end.  
