unit  ListUnit;

interface

uses  Windows;

const
  ListHeight = 98;              // ListBox控件高度

var
  Enter_List: Boolean = FALSE;  // 鼠标在ListBox 内
  FixedCount: Integer=0;        // 鼠标悬停累计变量
  FixTimerID: LongWord;         // 鼠标悬停计时器ID

  OnDraging: Boolean = FALSE;   // 当前处于拖拽状态
  PriorRect: TRECT;             // 上次拖拽框范围
  DragMoved: Boolean;           // 自右键按下拖拽过


procedure Delete_ListItem;  // 删除ListBox中所有被选中的结点
procedure FileList2ListBox; // 从FileList数组添加数据到ListBox控件
procedure ListBox2FileList; // 从ListBox控件取数据放到FileList数组
procedure Exchange_List(iInsert: Integer);// 被选中结点移至iInsert
  
function GetCur_ItemRect(X, Y: Integer): TRect;  // 计算拖拽框位置
function GetCur_ItemIndex(X, Y: Integer): Integer; // 鼠标所在结点

procedure ListBox_StopDrap; // ListBox停止结点拖拽时调用
procedure ReTest_Enter_List;// 尝试安装时钟(监视鼠标是否于ListBox内)

implementation

uses
  Messages, PublicUnit, HintForm;

    // ---- 删除被选中项目 ---- //
procedure Delete_ListItem;
var
  I: Integer;
begin
  I := SendMessage(hListBox, LB_GETCOUNT, 0, 0)-1;
  while (I >= 0) do
  begin
    if SendMessage(hListBox, LB_GETSEL, I, 0)>0 then
    begin
      SendMessage(hListBox, LB_DELETESTRING, I, 0);
    end;
    Dec(I);
  end;
end;

    // -- FileList数组到ListBox控件 -- //
procedure FileList2ListBox;
var
  j: Integer;
begin
  for j:=0 to High(FileList) do
    SendMessage(hListBox, LB_ADDSTRING, 0, Integer(PChar(FileList[j])));
end;

    // -- ListBox控件到FileList数组 -- //
procedure ListBox2FileList;
var
  I: Integer;
  Tmp: string;
begin
  SetLength(FileList, 0);   I := 0;
 // 检查一遍文件是否依然存在
  while (I < SendMessage(hListBox, LB_GETCOUNT, 0, 0)) do
  begin
    SetLength(Tmp, SendMessage(hListBox, LB_GETTEXTLEN, I, 0)+1);
    SendMessage(hListBox, LB_GETTEXT, I, LongWord(@Tmp[1]));
    Tmp := string( PChar(Tmp) );

    if FileExists(Tmp) then
    begin
      SetLength(FileList, Length(FileList)+1);
      FileList[High(FileList)] := Tmp; Inc(I);
    end else
      SendMessage(hListBox, LB_DELETESTRING, I, 0);
  end;
 // 只给头块,则自动添加后续块
  if (Length(FileList)=1)and(ExtractExteName(FileList[0])='.001') then
  begin
    Tmp := Copy(FileList[0], 1, Length(FileList[0])-3);
    I := 2;
    while FileExists( Tmp + Int2Hex(I) ) do
    begin
      SetLength(FileList, I);
      FileList[I-1] := Tmp + Int2Hex(I);
      SendMessage(hListBox, LB_ADDSTRING, 0, Integer(PChar(FileList[I-1])));
      Inc(I);
    end;
  end;
end;

   // ---- 被选中结点移到iInsert处 ---- //
procedure Exchange_List(iInsert: Integer);
var
  I: Integer;
  S: string;
begin
 // 删除被选中的结点
  SetLength(FileList, 0);   I := 0; 
  while (I < SendMessage(hListBox, LB_GETCOUNT, 0, 0)) do
  begin
    if (SendMessage(hListBox, LB_GETSEL, I, 0) > 0) then
    begin
      if (I < iInsert) then  Dec(iInsert);
      SetLength(S, SendMessage(hListBox, LB_GETTEXTLEN, I, 0)+1);
      SendMessage(hListBox, LB_GETTEXT, I, LongWord(@S[1]));
      S := string( PChar(S) );
      SetLength(FileList, Length(FileList)+1);
      FileList[High(FileList)] := S;
      SendMessage(hListBox, LB_DELETESTRING, I, 0);
    end else
      Inc(I);
  end;
 // 插入前面删除的结点
  for I := High(FileList) downto 0 do
  begin            
    SendMessage(hListBox, LB_INSERTSTRING, iInsert, Integer(PChar(FileList[I])));
    SendMessage(hListBox, LB_SETSEL, 1, iInsert);
  end;  
end;

    // ---- 计算拖拽虚线框范围 ---- //
function GetCur_ItemRect(X, Y: Integer): TRect;
var
  ItemIndex: Integer;
begin
  ItemIndex := SendMessage(hListBox, LB_ITEMFROMPOINT, 0, MAKELPARAM(X,Y));
  if HIWORD(ItemIndex) = 0 then
  begin
    SendMessage(hListBox, LB_GETITEMRECT, ItemIndex, LongWord(@Result));
    if (Y <= 7) then     // 最上面 ..
    begin
      Result.Top := 0;
      Result.Bottom := 2;
      InvalidateRect(hListBox, @PriorRect, True);
      SendMessage(hListBox, WM_VSCROLL, SB_PAGEUP, 0);
    end else
      if (Y >= ListHeight-7) then // 最下面 ..
      begin
        Result.Top := ListHeight-4;
        Result.Bottom := ListHeight-2;
        InvalidateRect(hListBox, @PriorRect, True);
        SendMessage(hListBox, WM_VSCROLL, SB_PAGEDOWN, 0);
      end else           // 其他 ..
        Result.Bottom := Result.Top + 2;
  end else
  begin  // 没有结点 ..
    ItemIndex := SendMessage(hListBox, LB_GETCOUNT, 0, 0);
    SendMessage(hListBox, LB_GETITEMRECT, ItemIndex-1, LongWord(@Result));
    Result.Top := Result.Bottom - 1;
    Result.Bottom := Result.Bottom+1;
  end;
end;

    // ---- 当前鼠标指向的结点 ---- //
function GetCur_ItemIndex(X, Y: Integer): Integer;
begin
  Result := SendMessage(hListBox, LB_ITEMFROMPOINT, 0, MAKELPARAM(X,Y));
  if HIWORD(Result) = 0 then
  begin
    if (Y >= ListHeight-7) then Result := Result+1;
  end else
  begin
    Result := SendMessage(hListBox, LB_GETCOUNT, 0, 0);
  end;
end;

    // ---- 结点拖拽停止 ---- //
procedure ListBox_StopDrap;
begin
  SetCursor(hArrowCursor);
  OnDraging := FALSE;
  InvalidateRect(hListBox, @PriorRect, True);
  PriorRect.Left := 0;
  PriorRect.Top := 0;
  PriorRect.Bottom := 0;
  PriorRect.Right := 0;
  SendMessage(hListBox, WM_PAINT, 0, 0);
end;        

    // ---- 鼠标悬停计时器 ---- //
procedure FixTimerProc(hwnd, uMsg, idEvent, dwTime: LongWord); stdcall;
var
  ItemPoint: TPoint;
  ItemIndex: Integer;
  ItemWidth: Word;
  ItemRect: TRECT;
  ItemText: string;
  hwCursor: LongWord;
begin
  GetCursorPos(ItemPoint);
  hwCursor := WindowFromPoint(ItemPoint);
  if (hwCursor = hListBox) then
  begin
    FixedCount := FixedCount + 1;
    if (FixedCount < 10) then Exit;  // 累计时间未到2秒 ..

    ScreenToClient(hListBox, ItemPoint);
    ItemIndex := SendMessage(hListBox, LB_ITEMFROMPOINT, 0, MAKELPARAM(ItemPoint.X, ItemPoint.Y));
    if HIWORD(ItemIndex)<>0 then Exit; // 鼠标下没有 Item ..

    SetLength(ItemText, SendMessage(hListBox, LB_GETTEXTLEN, ItemIndex, 0)+1);
    SendMessage(hListBox, LB_GETTEXT, ItemIndex, LongWord(@ItemText[1]));
    ItemText := string(PChar(ItemText)); // 当前结点文字

    SendMessage(hListBox, LB_GETITEMRECT, ItemIndex, LongWord(@ItemRect));
    ItemWidth := LOWORD(GetTextExtent(ItemText)); // 文字宽度

    if (ItemWidth > ItemRect.Right) then  // 超长则显示Hint ..
    begin
      ItemPoint.X := ItemRect.Left;
      ItemPoint.Y := ItemRect.Top;
      ClientToScreen(hListBox, ItemPoint);
      Active_HintForm(ItemPoint.X-2, ItemPoint.Y-1, ItemText);
    end
  end else    // 鼠标不在ListBox内
  begin
    KillTimer(0, FixTimerID);
    FixedCount := 0;
    Enter_List := FALSE;
    if (hwCursor <> hHintForm) then ListBox_StopDrap;
  end;
end;

    // ---- 尝试装监视时钟 ---- //
procedure ReTest_Enter_List;
begin
  FixedCount := 0;
  if (Enter_List = FALSE) then // 之前未进入 ListBox
  begin
    Enter_List := TRUE;
    FixTimerID := SetTimer(0, 0, 200, @FixTimerProc);
  end;
end;

end.
