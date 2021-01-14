unit PopFind;

interface

uses
  CommDlg;

  // 寻找文本对话框
function PopFindFindDlg(hWnd: LongWord): LongWord;
  // 替换文本对话框
function PopFindReplaceDlg(hWnd: LongWord): LongWord;
  // 寻找匹配文本
function PopFindFindText(hWndEdit: LongWord; piSearchOffset: PInteger; pfr: PFindReplace): Boolean;
  // 寻找下一个
function PopFindNextText(hWndEdit: LongWord; piSearchOffset: PInteger): Boolean;
  // 替换匹配文本
function PopFindReplaceText(hWndEdit: LongWord; piSearchOffset: PInteger; pfr: PFindReplace): Boolean;
  // 已有查找关键字
function PopFindValidFind(): Boolean;

implementation

uses
  Windows, Messages;
  
const
  MAX_STRING_LEN = 256;

var
  szFindText: array[0..MAX_STRING_LEN] of Char;
  szReplText: array[0..MAX_STRING_LEN] of Char;

  // 寻找文本对话框
function PopFindFindDlg(hWnd: LongWord): LongWord;
const
{$J+}
 fr: TFindReplace =
  ( lStructSize: SizeOf(TFindReplace);
    hwndOwner: 0;
    hInstance: 0;
    Flags: FR_HIDEUPDOWN or FR_HIDEMATCHCASE or FR_HIDEWHOLEWORD;
    lpstrFindWhat: szFindText;
    lpstrReplaceWith: nil;
    wFindWhatLen: MAX_STRING_LEN;
    wReplaceWithLen: 0;
    lCustData: 0;
    lpfnHook: nil;
    lpTemplateName: nil );
{$J-}      
begin
  fr.hwndOwner := hWnd;
  fr.Flags := FR_HIDEUPDOWN or FR_HIDEMATCHCASE or FR_HIDEWHOLEWORD;
  Result := FindText(fr);
end;

  // 替换文本对话框
function PopFindReplaceDlg(hWnd: LongWord): LongWord;
const
{$J+}
  fr: TFindReplace =
   ( lStructSize: SizeOf(TFindReplace);
     hwndOwner: 0;
     hInstance: 0;
     Flags: FR_HIDEUPDOWN or FR_HIDEMATCHCASE or FR_HIDEWHOLEWORD;
     lpstrFindWhat: szFindText;
     lpstrReplaceWith: szReplText;
     wFindWhatLen: MAX_STRING_LEN;
     wReplaceWithLen: MAX_STRING_LEN;
     lCustData: 0;
     lpfnHook: nil;
     lpTemplateName: nil );
{$J-}
begin
  fr.hwndOwner := hWnd;
  fr.Flags := FR_HIDEUPDOWN or FR_HIDEMATCHCASE or FR_HIDEWHOLEWORD;
  Result := ReplaceText(fr);
end;

  // 寻找匹配文本
function PopFindFindText(hWndEdit: LongWord; piSearchOffset: PInteger; pfr: PFindReplace): Boolean;
var
  iLength, iPos, j: Integer;
  pstrDoc, pstrPos: PChar;
begin
  Result := FALSE;
 // 取出Edit控件内容
  iLength := GetWindowTextLength(hWndEdit);
  GetMem(pstrDoc, iLength + 1);
  if (pstrDoc = nil) then Exit;
  GetWindowText(hWndEdit, pstrDoc, iLength + 1);
 // 在piSearchOffset之后寻找
  pstrPos := pstrDoc + piSearchOffset^;
  while (pstrPos^ <> #0) do
  begin
    j := 0;
    while (pstrPos[j] <> #0)and
          (pfr.lpstrFindWhat[j] <> #0)and
          (pfr.lpstrFindWhat[j] = pstrPos[j])
      do Inc(j);
    if (pstrPos[j] = #0)or(pfr.lpstrFindWhat[j] = #0) then
      Break
    else
      Inc(pstrPos, J+1);
  end;
  if (pfr.lpstrFindWhat[j] = #0) then // 找到
  begin
   // 返回串匹配位置
    iPos := pstrPos - pstrDoc;
    piSearchOffset^ := iPos + j;
    Result := TRUE;
   // 选中找到的文本
    SendMessage(hWndEdit, EM_SETSEL, iPos, piSearchOffset^);
    SendMessage(hWndEdit, EM_SCROLLCARET, 0, 0);
  end;
  FreeMem(pstrDoc);
end;

  // 寻找下一个
function PopFindNextText(hWndEdit: LongWord; piSearchOffset: PInteger): Boolean;
var
  fr: TFindReplace;
begin
  fr.lpstrFindWhat := szFindText;
  Result := PopFindFindText(hWndEdit, piSearchOffset, @fr);
end;

  // 替换匹配文本
function PopFindReplaceText(hWndEdit: LongWord; piSearchOffset: PInteger; pfr: PFindReplace): Boolean;
begin
  if (not PopFindFindText(hWndEdit, piSearchOffset, pfr)) then
    Result := FALSE
  else begin
    SendMessage(hWndEdit, EM_REPLACESEL, 0, Integer(pfr.lpstrReplaceWith));
    Result := TRUE;
  end;
end;

  // 已有查找关键字
function PopFindValidFind(): Boolean;
begin
  Result := (szFindText[0] <> #0);
end;

end.
